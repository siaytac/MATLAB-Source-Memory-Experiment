function sourcetest(Parameters, buttonpressed, i, testlist, textanswer, answer, x, y, whereanswer)
    
    %question
    [normBoundsRect, ~] = Screen('TextBounds', Parameters.myWindow, 'WHO SAID?');
    DrawFormattedText(Parameters.myWindow, 'WHO SAID?', Parameters.centerX-normBoundsRect(3)/2, 150, 255);
    %options
    Screen('FillRect', Parameters.myWindow, Parameters.colord, [Parameters.XA-155 Parameters.Y-190 Parameters.XA+120 Parameters.Y+80]);
    DrawFormattedText(Parameters.myWindow, 'Doctor Lisa', Parameters.XA-140, Parameters.Y+55, Parameters.blue);
    Screen('FillRect', Parameters.myWindow, Parameters.colorl, [Parameters.XB-60 Parameters.Y-190 Parameters.XB+235 Parameters.Y+80]);
    DrawFormattedText(Parameters.myWindow, 'Lawyer Ruth', Parameters.XB-50, Parameters.Y+55, Parameters.yellow);
    %Display faces
    Screen('DrawTexture', Parameters.myWindow, Parameters.lawpic, [], ...
        [Parameters.XB-5 Parameters.Y-170 Parameters.XB+185 Parameters.Y+10]);
    Screen('DrawTexture', Parameters.myWindow, Parameters.docpic, [], ...
        [Parameters.XA-110 Parameters.Y-170 Parameters.XA+80 Parameters.Y+10]);
    %if old, participants have one more option "dont know"
    if answer(i,1) == 1
        Screen('FillRect', Parameters.myWindow, Parameters.colornk, [Parameters.centerX-195 Parameters.Y+35 Parameters.centerX+155 Parameters.Y+150]);
        Screen('FrameRect', Parameters.myWindow, Parameters.colorf, [Parameters.centerX-195 Parameters.Y+35 Parameters.centerX+155 Parameters.Y+150], 2);
        DrawFormattedText(Parameters.myWindow, Parameters.dontknow, Parameters.centerX-145, Parameters.Y+100, 0);
    end

    %item
    [normBoundsRect_word, ~] = Screen('TextBounds', Parameters.myWindow, testlist{i,1});
    Screen('DrawText', Parameters.myWindow, testlist{i,1}, Parameters.centerX-normBoundsRect_word(3)/2, ... 
        (Parameters.centerY-150)-normBoundsRect_word(4)/2, 255);
    
    
    if  buttonpressed ~= 0 
        Screen('FillRect', Parameters.myWindow, Parameters.colors, ...
            [Parameters.centerX-195 Parameters.height-155 Parameters.centerX+155 Parameters.height-35]);
        Screen('FrameRect', Parameters.myWindow, [0 102 0], [Parameters.centerX-195 Parameters.height-155 Parameters.centerX+155 Parameters.height-35], 2);
        DrawFormattedText(Parameters.myWindow, textanswer, whereanswer, Parameters.height-80, 0);

    end
    Screen('FillOval', Parameters.myWindow , [255 0 0], [x-Parameters.cursorsize, y-Parameters.cursorsize, x+Parameters.cursorsize, y+Parameters.cursorsize],3);
    Screen('Flip', Parameters.myWindow);
    
end