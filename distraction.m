function distraction(Parameters)

    counter = 1;
    number = 0;
    predistract = GetSecs;
    while GetSecs-predistract < Parameters.distractt   
        response = [];
        number(counter) = randi(9);
        correct_answer = sum(number);    
        FlushEvents;    
        [normBoundsRect_number, ~] = Screen('TextBounds', Parameters.myWindow, num2str(number(counter)));
        Screen('DrawText',Parameters.myWindow, num2str(number(counter)),Parameters.centerX-normBoundsRect_number(3)/2,...
          Parameters.centerY-normBoundsRect_number(4)/2, 255);
        Screen('Flip', Parameters.myWindow);    
        while 1
        ch = GetChar;
            if  ch == Parameters.return    
                break;  
            elseif ch == Parameters.backspace 
                response = response(1:(length(response)-1));
            else
                response = [response ch];
            end       
            if length(response)> 0
                [normBoundsRect_response, ~] = Screen('TextBounds', Parameters.myWindow, response);
                Screen('DrawText',Parameters.myWindow,response,Parameters.centerX-normBoundsRect_number(3)/2,...
                  (Parameters.centerY+200)-normBoundsRect_number(4)/2, [153 0 153]);
            end
            Screen('Flip', Parameters.myWindow);  
        end    
        if isempty(response) == 1
            response = 0;
        else
            response = str2num(response);
        end    
        if  response ~= correct_answer 
            DrawFormattedText(Parameters.myWindow, double(sprintf('Correct Answer: %d', ...
                correct_answer)), 'center', 'center', 0);
            Screen('Flip', Parameters.myWindow);
            WaitSecs(2);
        end
        counter = counter +1;
    end
    DrawFormattedText(Parameters.myWindow, double('Digit sum task is over'), 'center', 'center', 0);
    Screen('Flip', Parameters.myWindow);
    WaitSecs(2);
end