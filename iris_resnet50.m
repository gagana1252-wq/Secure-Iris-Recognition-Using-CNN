clc; clear; close all;

datasetPath = 'C:\Users\ADMIN\Downloads\IrisDataset';
imds = imageDatastore(datasetPath, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
[imdsTrain, imdsTest] = splitEachLabel(imds, 0.7, 'randomized');

net = resnet50;
inputSize = net.Layers(1).InputSize;
augTrain = augmentedImageDatastore(inputSize, imdsTrain, 'ColorPreprocessing', 'gray2rgb');
augTest = augmentedImageDatastore(inputSize, imdsTest, 'ColorPreprocessing', 'gray2rgb');

lgraph = layerGraph(net);
numClasses = numel(categories(imdsTrain.Labels));
newLayers = [
    fullyConnectedLayer(numClasses, 'Name', 'fcNew')
    softmaxLayer('Name', 'softmaxNew')
    classificationLayer('Name', 'classOutput')];

if any(strcmp({lgraph.Layers.Name}, 'fc1000'))
    lgraph = replaceLayer(lgraph, 'fc1000', newLayers(1));
end
if any(strcmp({lgraph.Layers.Name}, 'fc1000_softmax'))
    lgraph = replaceLayer(lgraph, 'fc1000_softmax', newLayers(2));
end
if any(strcmp({lgraph.Layers.Name}, 'ClassificationLayer_fc1000'))
    lgraph = replaceLayer(lgraph, 'ClassificationLayer_fc1000', newLayers(3));
elseif any(strcmp({lgraph.Layers.Name}, 'ClassificationLayer_predictions'))
    lgraph = replaceLayer(lgraph, 'ClassificationLayer_predictions', newLayers(3));
else
    error('Final classification layer name not found.');
end

options = trainingOptions('adam', ...
    'MaxEpochs', 5, ...
    'MiniBatchSize', 16, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData', augTest, ...
    'ValidationFrequency', 30, ...
    'Verbose', false, ...
    'Plots', 'training-progress');

trainedNet = trainNetwork(augTrain, lgraph, options);

XTest = readall(imdsTest);
labels = imdsTest.Labels;
XEncrypted = cell(size(XTest));
key = uint8(42);

for i = 1:length(XTest)
    img = imresize(XTest{i}, inputSize(1:2));
    if size(img, 3) == 1
        img = cat(3, img, img, img);
    elseif size(img, 3) ~= 3
        img = img(:, :, 1:3);
    end
    feature = activations(trainedNet, img, 'avg_pool', 'OutputAs', 'rows');
    featureUint8 = uint8(feature * 255);
    encrypted = bitxor(featureUint8, key);
    XEncrypted{i} = encrypted;
end

predictedLabels = classify(trainedNet, augTest);
accuracy = mean(predictedLabels == imdsTest.Labels) * 100;
fprintf('Recognition Accuracy: %.2f%%\n', accuracy);

figure;
confusionchart(imdsTest.Labels, predictedLabels);
title('ResNet-50 Iris Recognition Confusion Matrix');
