function runexp(subject_id)

    tic;
    Parameters.subject_id = subject_id;
    Parameters.datadir = ['../Data/Sub' num2str(Parameters.subject_id) '/'];
   
        %Check Subject number
        if exist(Parameters.datadir) == 7 
            msg=double(msgbox('Try another subject number!','Error!'));
            uiwait(msg);
            return;
        else
            mkdir(Parameters.datadir); %create folders
        end
    
    %Demographics
    Demo.age = double(input('Age? '));
    Demo.sex = input('Gender? [F/M/O] ', 's');
    Demo.handedness = input('Dominant hand? [R/L] ', 's');
    save('Demo', 'Demo');
    movefile('Demo.mat', Parameters.datadir);

    %Prepare Screen
    Parameters = preparescreen(Parameters);

    %Word and Location Lists Setup
    [studylist, testlist] = setup(Parameters);
    
    %save study data
    Study_File = fopen(sprintf('Study_Data_Sub%d.dat', Parameters.subject_id), 'a');
    for i = 1:length(studylist)
        fprintf(Study_File, '\n %s \t %d \t %d', studylist{i,1}, studylist{i,2}, studylist{i,3});
    end
    fclose(Study_File);
 
    %Instruction
    instructions(Parameters);
  
    %%%%Experiment session%%%%
    %Study phase   
    Screen('TextSize', Parameters.myWindow, 100);
    DrawFormattedText(Parameters.myWindow, 'Study Phase',...
        'center', 'center', 255);
    Screen('Flip', Parameters.myWindow);
    WaitSecs(2);

    study(Parameters, studylist);

    %%Distraction Phase
    Screen('TextSize', Parameters.myWindow, 80);
    DrawFormattedText(Parameters.myWindow, 'Digit Sum Task',...
        'center', 'center', 255);
    Screen('Flip', Parameters.myWindow);
    WaitSecs(2);

    distraction(Parameters); 

    %%Test phase
    Screen('TextSize', Parameters.myWindow, 80);
    DrawFormattedText(Parameters.myWindow, 'Test Phase',...
        'center', 'center', 255);
    Screen('Flip', Parameters.myWindow);
    WaitSecs(2);

    [x, y, answer] = test(Parameters, testlist);

    %save test data
    Test_File = fopen(sprintf('Test_Data_Sub%d.dat', Parameters.subject_id), 'a');
    for i = 1:length(testlist)
        fprintf(Test_File, '\n %s \t %d \t %d \t %d \t %d', testlist{i,1}, testlist{i,2}, testlist{i,3}, answer(i,1), answer(i,2));
        %sentence, expectancy, source, recoganswer, sourceanswer
    end
    fclose(Test_File);

    
    %%Experiment is over
    Screen('TextSize', Parameters.myWindow, 80);   
    DrawFormattedText(Parameters.myWindow, 'Your`re done.\nThank you!',...
        'center', Parameters.Y-300, 255);
    Screen('Flip', Parameters.myWindow);
    WaitSecs(8);

    RT = ceil(toc/60);
    Screen('CloseAll');
    fclose all;
    
    movefile(sprintf('Study_Data_Sub%d.dat', Parameters.subject_id), Parameters.datadir);
    movefile(sprintf('Test_Data_Sub%d.dat', Parameters.subject_id), Parameters.datadir);
    save('workspace');
    movefile('workspace.mat', Parameters.datadir);
    
    ListenChar(1);
    fprintf('Experiment took %d minutes.\n', RT);
end
