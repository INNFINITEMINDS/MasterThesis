EEG = pop_fileio('C:\DANE\Depresja 2017\Analiza_nowa\Mindfulnes\MD239_1_20150327_061316.raw');
name = 'MD239_1'
EEG.setname= name;
EEG=pop_chanedit(EEG, 'lookup','C:\\DANE\\Depresja 2017\\GSN-HydroCel-65 1.0.sfp','load',{'C:\\DANE\\Depresja 2017\\GSN-HydroCel-65 1.0.sfp' 'filetype' 'sfp'});
EEG = pop_saveset( EEG, 'filename',[name '.set'],'filepath','C:\\DANE\\Depresja 2017\\Analiza_nowa\\Mindfulnes\\Set\\');
EEG = pop_resample( EEG, 250);
EEG = pop_select( EEG,'channel',{'E1' 'E2' 'E3' 'E4' 'E5' 'E6' 'E7' 'E8' 'E9' 'E10' 'E11' 'E12' 'E13' 'E14' 'E15' 'E16' 'E17' 'E18' 'E19' 'E20' 'E21' 'E22' 'E24' 'E25' 'E26' 'E27' 'E28' 'E29' 'E30' 'E31' 'E32' 'E33' 'E34' 'E35' 'E36' 'E37' 'E38' 'E39' 'E40' 'E41' 'E42' 'E43' 'E44' 'E45' 'E46' 'E47' 'E48' 'E49' 'E50' 'E51' 'E52' 'E53' 'E54' 'E56' 'E57' 'E58' 'E59' 'E60' 'Cz'});
EEG.setname=name;
EEG = pop_eegfiltnew(EEG, 40,1,826,0,[],1);

% ZAMYKANIE OCZU
[~,cn]=find(strcmp({EEG.event.type},'DI15'));

aa = length(cn);
freq=250;

if aa==13  
    for a = 1:1:13
    
    first_stimuli = [EEG.event(cn(a)).latency];
    
    for i = 1:1:30
        n_events=length(EEG.event);
        EEG.event(n_events+1).latency=first_stimuli;
        EEG.event(n_events+1).urevent=n_events+1;
        first_stimuli = first_stimuli+freq;    %zmienic na 250
        
        if a<=5
            EEG.event(n_events+1).type='zam1';
        elseif (a>5) && (a<=8)
            EEG.event(n_events+1).type='zam2';
        else
            EEG.event(n_events+1).type='zam3';
        end
        
    end
    end
else
    fprintf('BLAD zamkniete oczy')
end

%otworz oczy
[rn,cn]=find(strcmp({EEG.event.type},'D240'));

aa = length(cn);
a = 1;

if aa==13  
    for a = 1:1:13
    
    first_stimuli = [EEG.event(cn(a)).latency];
    
    for i = 1:1:30
        n_events=length(EEG.event);
        EEG.event(n_events+1).latency=first_stimuli;
        EEG.event(n_events+1).urevent=n_events+1;
        first_stimuli = first_stimuli+freq;    %zmienic na 250
        
        if a<=5
            EEG.event(n_events+1).type='otw1';
        elseif (a>5) && (a<=8)
            EEG.event(n_events+1).type='otw2';
        elseif (a>8) && (a<=13)
            EEG.event(n_events+1).type='otw3';
        end
        
    end
    end
else
    fprintf('BLAD otwarte oczy')
end

%zadanie
[rn,cn]=find(strcmp({EEG.event.type},'DIN1')); % trening

aa = length(cn);

a=1;
if aa==1
    l_krokow = (EEG.event(cn+1).latency - EEG.event(cn).latency)/freq
    first_stimuli = [EEG.event(cn(a)).latency];
    
    for i = 1:1:l_krokow
        n_events=length(EEG.event);
        EEG.event(n_events+1).latency=first_stimuli;
        EEG.event(n_events+1).urevent=n_events+1;
        first_stimuli = first_stimuli+freq;    %zmienic na 250
       
        EEG.event(n_events+1).type='zad0a';
        
        
    end
else
    fprintf('BLAD test zadanie')
end

%%%% zadanie 1
[rn,cn]=find(strcmp({EEG.event.type},'DIN2')); % zadanie 1

aa = length(cn);

a=1;
if aa==1
    l_krokow = (EEG.event(cn+1).latency - EEG.event(cn).latency)/freq
    first_stimuli = [EEG.event(cn(a)).latency];
    
    for i = 1:1:l_krokow
        n_events=length(EEG.event);
        EEG.event(n_events+1).latency=first_stimuli;
        EEG.event(n_events+1).urevent=n_events+1;
        first_stimuli = first_stimuli+freq;    %zmienic na 250
       
        EEG.event(n_events+1).type='zad1a';
        
        
    end
else
    fprintf('BLAD zadanie 1 ')
end

%%%% zadanie 2
[rn,cn]=find(strcmp({EEG.event.type},'DIN4')); % zadanie 2

aa = length(cn);

a=1;
if aa==1
    l_krokow = (EEG.event(cn+1).latency - EEG.event(cn).latency)/freq
    first_stimuli = [EEG.event(cn(a)).latency];
    
    for i = 1:1:l_krokow
        n_events=length(EEG.event);
        EEG.event(n_events+1).latency=first_stimuli;
        EEG.event(n_events+1).urevent=n_events+1;
        first_stimuli = first_stimuli+freq;    %zmienic na 250
       
        EEG.event(n_events+1).type='zad2a';
        
        
    end
else
    fprintf('BLAD zadanie 2 ')
end

%%%% zadanie 3
[rn,cn]=find(strcmp({EEG.event.type},'DIN8')); % zadanie 3

aa = length(cn);
a=1;
if aa==1
    l_krokow = (EEG.event(cn+1).latency - EEG.event(cn).latency)/freq
    first_stimuli = [EEG.event(cn(a)).latency];
    
    for i = 1:1:l_krokow
        n_events=length(EEG.event);
        EEG.event(n_events+1).latency=first_stimuli;
        EEG.event(n_events+1).urevent=n_events+1;
        first_stimuli = first_stimuli+freq;    %zmienic na 250
       
        EEG.event(n_events+1).type='zad3a';
        
        
    end
else
    fprintf('BLAD zadanie 3 ')
end

%%%% ruminacja
[rn,cn]=find(strcmp({EEG.event.type},'DI85')); % zadanie 1

aa = length(cn);
a=1;
if aa==1
    l_krokow = (EEG.event(cn+1).latency - EEG.event(cn).latency)/freq
    first_stimuli = [EEG.event(cn(a)).latency];
    
    for i = 1:1:l_krokow
        n_events=length(EEG.event);
        EEG.event(n_events+1).latency=first_stimuli;
        EEG.event(n_events+1).urevent=n_events+1;
        first_stimuli = first_stimuli+freq;    %zmienic na 250
       
        EEG.event(n_events+1).type='ruma';
        
        
    end
else
    fprintf('BLAD ruminacji ')
end

EEG = pop_epoch( EEG, {  'otw1'  'otw2'  'otw3'  'ruma'  'zad0a'  'zad1a'  'zad2a'  'zad3a'  'zam1'  'zam2'  'zam3'  }, [0  1], 'newname', [char(name) '_sample epochs'], 'epochinfo', 'yes');
%EEG = pop_interp(EEG, [17], 'spherical')
EEG = pop_saveset( EEG, 'filename',[name '.set'],'filepath','C:\\DANE\\Depresja 2017\\Analiza_nowa\\Mindfulnes\\Set\\');
EEG = pop_reref( EEG, 59);
EEG = pop_saveset( EEG, 'filename',[char(name) '_Cz.set'],'filepath','C:\\DANE\\Depresja 2017\\Analiza_nowa\\Mindfulnes\\Set\\');
