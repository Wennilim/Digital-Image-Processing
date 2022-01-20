function [] = classifyVideo(net)
    % Initialize webcam
    cam = webcam;
    % Initialize figure
    hf = figure;
    while 1
        % compares the current character to q
        % if 'q' is pressed exit
        if strcmp(get(hf,'currentcharacter'),'q')
            close(hf)
            break
        end
        % Acquire a single image
        rgbImage = snapshot(cam);
        % Resize image to fit AlexNet dimensions
        resizedImage = imresize(rgbImage, [227 227]);
        % Classify Image
        label = classify(net,resizedImage);
        % Display the image.
        imshow(rgbImage);
        % Display label
        title(label);
        % Update figure
        hold on;
        drawnow
        % force the event queue to flush
        figure(hf)
        drawnow
    end
    % Clear camera object
    clear('cam');
end