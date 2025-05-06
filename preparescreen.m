function Parameters = preparescreen(Parameters)

    ListenChar(2);
    HideCursor;
    Screen('Preference','TextEncodingLocale','UTF-8'); 
    [Parameters.myWindow, Parameters.rect] = Screen('OpenWindow', 0, 0);
    
    Parameters.width = Parameters.rect(3);
    Parameters.height = Parameters.rect(4);
    Parameters.centerX = Parameters.rect(3)/2;
    Parameters.centerY = Parameters.rect(4)/2;
    Parameters.XA = Parameters.centerX-380;
    Parameters.XB = Parameters.centerX+280;
    Parameters.Y = Parameters.centerY+100;
    Parameters.picture = [Parameters.centerX-250 Parameters.centerY-100 Parameters.centerX+250 Parameters.centerY+350];
    Parameters.smallbox1 = [Parameters.XA-50 Parameters.Y-65 Parameters.XA+110 Parameters.Y+50];
    Parameters.smallbox2 = [Parameters.XB-50 Parameters.Y-65 Parameters.XB+100 Parameters.Y+50];
    Parameters.largebox = [Parameters.centerX-195 Parameters.Y+35 Parameters.centerX+155 Parameters.Y+150];
           
    Screen('TextFont', Parameters.myWindow, 'Tahoma'); 
    
    %Numbers
    Parameters.nof_studywords = 66; 
    Parameters.nof_testwords = 96; 
    Parameters.nof_lists = 1; %1 cycle
    
    %Colors
    Parameters.color1 = 255; %When choose an option
    Parameters.color2 = 192; %For answer boxes (grey)
    Parameters.color3 = [0 255 0]; %When click submit button
    Parameters.color4 = [0 204 0]; %For submit box (green)
    Parameters.colorf = 128; %for frames
    
    Parameters.colory = Parameters.color2; 
    Parameters.colorn = Parameters.color2;
    Parameters.colornk = Parameters.color2;
    Parameters.colors = Parameters.color4;
    Parameters.colorbg = 0; %Background color
    Parameters.colord = Parameters.colorbg;
    Parameters.colorl = Parameters.colorbg;
    
    Parameters.yellow = [255 240 0];
    Parameters.blue = [46 130 255];
    
    Parameters.cursorsize = 10;
        
    %Keys used throughout the experiment
    Parameters.space = KbName('space'); %for dont know answers 
    Parameters.return = KbName('return');
    Parameters.backspace = KbName('backspace');
    Parameters.right = KbName('right');
    Parameters.left = KbName('left');
    
    Parameters.distractt=60;
    %Parameters.studytime=4; %Bayen(2000)=6secs
    %Parameters.ISI=0.25;
    
    Parameters.max = 23; %Max # of pages for instructions
    Parameters.min = 1; %First page of instructions

    Parameters.doc = imread('doc.jpg');
    Parameters.docpic = Screen(Parameters.myWindow, 'MakeTexture', Parameters.doc);
    Parameters.law = imread('law.jpg'); 
    Parameters.lawpic = Screen(Parameters.myWindow, 'MakeTexture', Parameters.law);
    
    %dont knows
    fid = fopen('nknow.txt', 'r');
    Parameters.dontknow = fgetl(fid);
    Parameters.DONTKNOW = fgetl(fid);
    fclose(fid);
    
end
