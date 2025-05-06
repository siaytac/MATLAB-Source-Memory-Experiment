function study(Parameters, studylist)
    
    Screen('TextSize', Parameters.myWindow, 50);
    
    for i= 1:Parameters.nof_studywords
        
        if studylist{i,3} == 0 %%If Doctor
            
        %display the picture of the doctor
        Screen('DrawText', Parameters.myWindow, 'Doctor Lisa', Parameters.centerX-130, Parameters.centerY+370, Parameters.blue); 
        Screen('DrawTexture', Parameters.myWindow, Parameters.docpic, [], Parameters.picture);
        %display the sentence
        [normBoundsRect, ~] = Screen('TextBounds', Parameters.myWindow, studylist{i,1});
        Screen('DrawText', Parameters.myWindow, studylist{i,1}, (Parameters.centerX-normBoundsRect(3)/2), ... 
            (Parameters.centerY-200)-normBoundsRect(4)/2, 255);

        elseif studylist{i,3} == 1 %%If Lawyer
      
        Screen('DrawText', Parameters.myWindow, 'Lawyer Ruth', Parameters.centerX-130, Parameters.centerY+370, Parameters.yellow);    
        Screen('DrawTexture', Parameters.myWindow, Parameters.lawpic, [], Parameters.picture);
        [normBoundsRect, ~] = Screen('TextBounds', Parameters.myWindow, studylist{i,1});
        Screen('DrawText', Parameters.myWindow, studylist{i,1}, (Parameters.centerX)-normBoundsRect(3)/2, ... 
            (Parameters.centerY-200)-normBoundsRect(4)/2, 255);

        end

        Screen('Flip', Parameters.myWindow);
        WaitSecs(2);
        Screen('Flip', Parameters.myWindow);
        WaitSecs(0.25);    
    end

    DrawFormattedText(Parameters.myWindow,'Study phase is over', 'center', 'center', 0);
    Screen('Flip', Parameters.myWindow);
    WaitSecs(2);   
    
end