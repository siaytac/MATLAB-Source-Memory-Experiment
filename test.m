function [x, y, answer]= test(Parameters, testlist)  
    
    Screen('TextSize', Parameters.myWindow, 50);
    for i= 1:Parameters.nof_testwords
        
        %%%Recognition Task
        FlushEvents;
        buttons = 0;
        SetMouse(Parameters.centerX, Parameters.centerY, Parameters.myWindow);
        loop = 1;
        buttonpressed = 0;
        answer = zeros(Parameters.nof_testwords, 2);
        textanswer = '';
        whereanswer = 0;
        B = 0;
        while loop
            [x,y,buttons] = GetMouse(Parameters.myWindow);
            recognitiontest(Parameters, buttonpressed, i, testlist, textanswer, x, y, whereanswer);
            
            if (buttons(1) == 1) 
                B = mouseposition(Parameters, x, y,buttonpressed,1);
            end
            
            if B ~= 0
                buttonpressed = 1;
                switch B
                    case 1
                        textanswer = 'YES';
                        whereanswer = Parameters.centerX-65;
                        Parameters.colory = Parameters.color1; 
                        Parameters.colorn = Parameters.color2;
                        Parameters.colornk = Parameters.color2;
                        answer(i,1) = 1; %yes
                        NK = 1;
                    case 2
                        textanswer = 'NO';
                        whereanswer = Parameters.centerX-55;
                        Parameters.colory = Parameters.color2; 
                        Parameters.colorn = Parameters.color1;
                        Parameters.colornk = Parameters.color2;
                        answer(i,1) = 0; %no
                        NK = 0;
                    case 3
                        textanswer = Parameters.DONTKNOW;
                        whereanswer = Parameters.centerX-175;
                        Parameters.colory = Parameters.color2; 
                        Parameters.colorn = Parameters.color2;
                        Parameters.colornk = Parameters.color1;
                        answer(i,1) = 7; %dontknow
                        NK = 0;
                    case 4
                        Parameters.colory = Parameters.color2; 
                        Parameters.colorn = Parameters.color2;
                        Parameters.colornk = Parameters.color2;
                        loop = 0;
                end
            end 
        end
                                  
        %%%Source Memory  
        buttons = 0;
        SetMouse(Parameters.centerX, Parameters.centerY, Parameters.myWindow);
        
        loop = 1;
        buttonpressed = 0;
        textanswer = '';
        B = 0;
        while loop
            [x,y,buttons] = GetMouse(Parameters.myWindow);
            sourcetest(Parameters, buttonpressed, i, testlist, textanswer, answer, x, y, whereanswer)
            
            if (buttons(1) == 1) 
                B = mouseposition(Parameters, x, y,buttonpressed,NK);
            end
            
            if B ~= 0
                buttonpressed = 1;
                switch B
                    case 1
                        textanswer = 'LISA';
                        whereanswer = Parameters.centerX-70;
                        Parameters.colord = Parameters.color1;
                        Parameters.colorl = Parameters.colorbg;
                        Parameters.colornk = Parameters.color2;
                        answer(i,2) = 1; %doctorlisa
                    case 2
                        textanswer = 'RUTH';
                        whereanswer = Parameters.centerX-80;
                        Parameters.colord = Parameters.colorbg;
                        Parameters.colorl = Parameters.color1;
                        Parameters.colornk = Parameters.color2;
                        answer(i,2) = 0; %lawyeruth
                    case 3
                        textanswer = Parameters.DONTKNOW;
                        whereanswer = Parameters.centerX-175;
                        Parameters.colord = Parameters.colorbg;
                        Parameters.colorl = Parameters.colorbg;
                        Parameters.colornk = Parameters.color1;
                        answer(i,2) = 7; %dontknow
                    case 4
                       Parameters.colord = Parameters.colorbg;
                       Parameters.colorl = Parameters.colorbg;
                       Parameters.colornk = Parameters.color2;
                       loop = 0;
                end
            end 
        end 
       
        %save
        
    end  
end
