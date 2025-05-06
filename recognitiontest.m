function recognitionTest(Parameters, buttonpressed, i, testlist, textanswer, x, y, whereanswer)
    
    [question, ~] = Screen('TextBounds', Parameters.myWindow, 'DID YOU STUDY THIS?');
    DrawFormattedText(Parameters.myWindow, 'DID YOU STUDY THIS?', Parameters.centerX-question(3)/2, 150, 255);
    Screen('FillRect', Parameters.myWindow, Parameters.colory, Parameters.smallbox1);
    Screen('FrameRect', Parameters.myWindow, Parameters.colorf, Parameters.smallbox1, 2);
    DrawFormattedText(Parameters.myWindow, 'yes', Parameters.XA, Parameters.Y, 0);
    Screen('FillRect', Parameters.myWindow, Parameters.colorn, Parameters.smallbox2);
    Screen('FrameRect', Parameters.myWindow, Parameters.colorf, Parameters.smallbox2, 2);
    DrawFormattedText(Parameters.myWindow, 'no', Parameters.XB, Parameters.Y, 0);
    Screen('FillRect', Parameters.myWindow, Parameters.colornk, Parameters.largebox);
    Screen('FrameRect', Parameters.myWindow, Parameters.colorf, Parameters.largebox, 2);
    DrawFormattedText(Parameters.myWindow, Parameters.dontknow, Parameters.centerX-145, Parameters.Y+100, 0);
    [normBoundsRect_word, ~] = Screen('TextBounds', Parameters.myWindow, testlist{i,1});
    Screen('DrawText', Parameters.myWindow, testlist{i,1}, Parameters.centerX-normBoundsRect_word(3)/2, ... 
        (Parameters.centerY-150)-normBoundsRect_word(4)/2, 255);
    
    %Here comes the confirmation button
    if  buttonpressed ~= 0  
        Screen('FillRect', Parameters.myWindow, Parameters.colors, ...
            [Parameters.centerX-195 Parameters.height-155 Parameters.centerX+155 Parameters.height-35]);
        Screen('FrameRect', Parameters.myWindow, [0 102 0], [Parameters.centerX-195 Parameters.height-155 Parameters.centerX+155 Parameters.height-35], 2);
        DrawFormattedText(Parameters.myWindow, textanswer, whereanswer, Parameters.height-80, 0);
    end
    
    Screen('FillOval', Parameters.myWindow , [255 0 0] , ...
    [x-Parameters.cursorsize, ...
    y-Parameters.cursorsize,x+Parameters.cursorsize, ...
    y+Parameters.cursorsize],3);
    
    Screen('Flip', Parameters.myWindow);
    
end