function [studylist, testlist] = setup(Parameters)
    
    cd ..\Experiment\sentences
    
    files = {'doctargets.txt', 'lawtargets.txt', 'equaltargets.txt', 'docfoils.txt', 'lawfoils.txt', 'equalfoils.txt'};
    nfiles = length(files); %number of files 
    list = cell(0,nfiles); 
    
    %Get items from text files
    for n = 1:nfiles
        counter = 1;
        fid = fopen(files{n}, 'r');
        tline = fgetl(fid);
        while ischar(tline)
            list{counter,n} = tline;
            tline = fgetl(fid);
            counter = counter+1;
        end
        fclose(fid);
    end
        
    %Shuffle items in each list
    index = randperm(length(list(:,1))); 
    randomlist = cell(length(index), nfiles);
    for n = 1:nfiles
        noname = list(:,n);
        noname = noname(index);
        randomlist(:,n) = noname;
    end
    
    %%create study lists
    %These are from doctor/lawyer stimuli set (22 sentences from each
    %category)
    studylist = randomlist(1:22,1:3);
    studylist = reshape(studylist, 66, 1);

    %expected source
    %doc=0, law=1, equal=2
    e = num2cell(reshape(repmat([0,1,2], 22,1), 66,1));
    studylist(:,2) = e;

    %assign random numbers to define who is gonna say each sentence
    %doc=0, law=1
    for j = 1:3
        randassign = randperm(22);
        randassign = mod(randassign, 2);
        studylist((1+(22*(j-1)):(22*j)),3) = num2cell(randassign);
    end
    
    %HERE YOU NEED TO ADD OTHER NEUTRAL SENTENCES 
    
    %shuffle the list one more time
    studylist = Shuffle(studylist,2);
    
    %create test lists 
    %first add foils from doc/law stimuli set to the list
    testlist = randomlist(23:32,1:3);
    testlist = reshape(testlist, 30, 1);

    %expected source for foils 
    %doc=0, law=1, equal=2
    e = num2cell(reshape(repmat([0,1,2], 10,1), 30,1));
    testlist(:,2) = e;
    
    %YOU NEED TO ADD OTHER NEUTRAL FOIL SENTENCES HERE (10?)
    
    %all of them are foil 
    testlist(:,3) = num2cell(repmat(7,30,1));

    %add targets to the list
    a = length(testlist);
    b = length(studylist);
    testlist((1+a):(a+b), 1:3) = studylist;

    %everyday im shuffling 
    testlist = Shuffle(testlist,2);
    
    cd ..
end
