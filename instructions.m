function instructions(Parameters)
    
    cd ..\Experiment\instructions
    for i = Parameters.min:Parameters.max
        im{i} = imread(sprintf('Slide%d.jpg', i));
        impic(i) = Screen(Parameters.myWindow, 'MakeTexture', im{i});
    end
    cd ..
    
    KeyIsDown = 0;
    x = Parameters.min;
    FlushEvents;
    RestrictKeysForKbCheck([Parameters.right, Parameters.left, Parameters.space]);
    while 1
        [KeyIsDown, ~, keyCode] = KbCheck;
        Screen('DrawTexture', Parameters.myWindow, impic(x));
        Screen('Flip', Parameters.myWindow);

        if keyCode(Parameters.right) == 1
            x = x+1;
            if x > Parameters.max
                x = Parameters.max;
            end
        elseif keyCode(Parameters.left) == 1
            x = x-1;
            if x < Parameters.min
                x = Parameters.min;
            end
        end
        if (x == Parameters.max) && keyCode(Parameters.space) == 1
            break;
        end
        while KeyIsDown
            [KeyIsDown, ~, ~] = KbCheck;
        end
    end  
    RestrictKeysForKbCheck([]); 
end
