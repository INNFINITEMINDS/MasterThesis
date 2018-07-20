[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
pacjenci1 = {'234'}; % numer pacjenta do analizy 
pacjenci = cellstr(pacjenci1);
widmo_WD234 = struct();

nr_dataset = 1; % numer okna w dataset
nr =1; % iteracja pomiaru

file = ['WD234_' num2str(nr) '_Cz_']
name = ['WD234_' num2str(nr) '_Cz.set']; %nazwa pliku, ktory zostanie wczytany
EEG = pop_loadset('filename', name ,'filepath','C:\\DANE\\Depresja 2017\\Analiza_nowa\\Wdziecznosc\\Set_Cz\\'); %wczytanie pliku
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );

procedury = {'zam1','zam2', 'zam3','otw1','otw2','otw3','ruma'};
procedura1 = cellstr(procedury);

%     if nr ==1
%         nr_dataset = 1; % numer okna w dataset
%     else
%         nr_dataset = 9; % numer okna w dataset
%     end

for i = 1:1:7
    procedura = procedury{i}
    if isequal(procedury{i}, 'zam1')
        %[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset +1 ,'retrieve',1,'study',0);
        %EEG = eeg_checkset( EEG );
        EEG = pop_epoch( EEG, {  procedura  }, [0  1], 'newname', [file char(procedura)], 'epochinfo', 'yes');

        if nr ==1
            [spectra_zam1_p1,freqs_zam1_p1,specstd_zam1_p1] = spectopo(EEG.data, 0, EEG.srate);
        else
            [spectra_zam1_p2,freqs_zam1_p2,specstd_zam1_p2] = spectopo(EEG.data, 0, EEG.srate);
        end

        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset,'gui','off');
        EEG = eeg_checkset( EEG );

    elseif isequal(procedury{i}, 'zam2')
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset + 2 ,'retrieve',1,'study',0);
        EEG = eeg_checkset( EEG );
        EEG = pop_epoch( EEG, {  procedura  }, [0  1], 'newname', [file char(procedura)], 'epochinfo', 'yes');
        if nr ==1
            [spectra_zam2_p1,freqs_zam2_p1,specstd_zam2_p1] = spectopo(EEG.data, 0, EEG.srate);
        else
            [spectra_zam2_p2,freqs_zam2_p2,specstd_zam2_p2] = spectopo(EEG.data, 0, EEG.srate);
        end

        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset,'gui','off');
        EEG = eeg_checkset( EEG );

    elseif isequal(procedury{i}, 'zam3')
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset + 3 ,'retrieve',1,'study',0);
        EEG = eeg_checkset( EEG );
        EEG = pop_epoch( EEG, {  procedura  }, [0  1], 'newname', [file char(procedura)], 'epochinfo', 'yes');
        if nr ==1
            [spectra_zam3_p1,freqs_zam3_p1,specstd_zam3_p1] = spectopo(EEG.data, 0, EEG.srate);
        else
            [spectra_zam3_p2,freqs_zam3_p2,specstd_zam3_p2] = spectopo(EEG.data, 0, EEG.srate);
        end 

        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset,'gui','off');
        EEG = eeg_checkset( EEG );

    elseif isequal(procedury{i}, 'otw1')
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset + 4 ,'retrieve',1,'study',0);
        EEG = eeg_checkset( EEG );
        EEG = pop_epoch( EEG, {  procedura  }, [0  1], 'newname', [file char(procedura)], 'epochinfo', 'yes');
        if nr ==1
            [spectra_otw1_p1,freqs_otw1_p1,specstd_otw1_p1] = spectopo(EEG.data, 0, EEG.srate);
        else
            [spectra_otw1_p2,freqs_otw1_p2,specstd_otw1_p2] = spectopo(EEG.data, 0, EEG.srate);
        end

        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset,'gui','off');
        EEG = eeg_checkset( EEG );

    elseif isequal(procedury{i}, 'otw2')
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset + 5 ,'retrieve',1,'study',0);
        EEG = eeg_checkset( EEG );
        EEG = pop_epoch( EEG, {  procedura  }, [0  1], 'newname', [file char(procedura)], 'epochinfo', 'yes');
        if nr ==1
            [spectra_otw2_p1,freqs_otw2_p1,specstd_otw2_p1] = spectopo(EEG.data, 0, EEG.srate);
        else
            [spectra_otw2_p2,freqs_otw2_p2,specstd_otw2_p2] = spectopo(EEG.data, 0, EEG.srate);
        end

        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset,'gui','off');
        EEG = eeg_checkset( EEG );

    elseif isequal(procedury{i}, 'otw3')
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset + 6 ,'retrieve',1,'study',0);
        EEG = eeg_checkset( EEG );
        EEG = pop_epoch( EEG, {  procedura  }, [0  1], 'newname', [file char(procedura)], 'epochinfo', 'yes');
        if nr ==1
            [spectra_otw3_p1,freqs_otw3_p1,specstd_otw3_p1] = spectopo(EEG.data, 0, EEG.srate);
        else
            [spectra_otw3_p2,freqs_otw3_p2,specstd_otw3_p2] = spectopo(EEG.data, 0, EEG.srate);
        end

        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset,'gui','off');
        EEG = eeg_checkset( EEG );

    elseif isequal(procedury{i}, 'ruma')
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset + 7 ,'retrieve',1,'study',0);
        EEG = eeg_checkset( EEG );
        EEG = pop_epoch( EEG, {  procedura  }, [0  1], 'newname', [file char(procedura)], 'epochinfo', 'yes');
        if nr ==1
            [spectra_ruma_p1,freqs_ruma_p1,specstd_ruma_p1] = spectopo(EEG.data, 0, EEG.srate);
        else
            [spectra_ruma_p2,freqs_ruma_p2,specstd_ruma_p2] = spectopo(EEG.data, 0, EEG.srate);
        end

        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, nr_dataset,'gui','off');
        EEG = eeg_checkset( EEG );

    end
end
                     


% obliczanie widma i wykreslenie topografii

%zapis widma mocy do struktury
% pierwszy pomiar
widmo_WD234.spectra_zam1_p1 = spectra_zam1_p1(:,freqs_zam1_p1<40);
widmo_WD234.spectra_zam2_p1 = spectra_zam2_p1(:,freqs_zam1_p1<40);
widmo_WD234.spectra_zam3_p1 = spectra_zam3_p1(:,freqs_zam1_p1<40);
widmo_WD234.spectra_otw1_p1 = spectra_otw1_p1(:,freqs_zam1_p1<40);
widmo_WD234.spectra_otw2_p1 = spectra_otw2_p1(:,freqs_zam1_p1<40);
widmo_WD234.spectra_otw3_p1 = spectra_otw3_p1(:,freqs_zam1_p1<40);
widmo_WD234.spectra_ruma_p1 = spectra_ruma_p1(:,freqs_zam1_p1<40);
% drugi pomiar
widmo_WD234.spectra_zam1_p2 = spectra_zam1_p2(:,freqs_zam1_p2<40);
widmo_WD234.spectra_zam2_p2 = spectra_zam2_p2(:,freqs_zam1_p2<40);
widmo_WD234.spectra_zam3_p2 = spectra_zam3_p2(:,freqs_zam1_p2<40);
widmo_WD234.spectra_otw1_p2 = spectra_otw1_p2(:,freqs_zam1_p2<40);
widmo_WD234.spectra_otw2_p2 = spectra_otw2_p2(:,freqs_zam1_p2<40);
widmo_WD234.spectra_otw3_p2 = spectra_otw3_p2(:,freqs_zam1_p2<40);
widmo_WD234.spectra_ruma_p2 = spectra_ruma_p2(:,freqs_zam1_p2<40);

widmo_WD234.freqs = freqs_zam1_p1(freqs_zam1_p1<40);
save('widmo_WD234.mat','widmo_WD234')  % zapis widma do pliku .mat

% obliczenie ro¿nicy miêdzy procedurami

% roznica miedzy rest2-rest1 
rest2_diff_zam_p1= spectra_zam2_p1 - spectra_zam1_p1; % rest2_diff_zam_p1 okreœla roznicê miedzy rest2 a rest1 przy zamknietych oczach
rest2_diff_zam_p2= spectra_zam2_p2 - spectra_zam1_p2;

alfa_rest2_diff_zam_p1= squeeze(sum(rest2_diff_zam_p1(:,freqs_zam1_p1>8&freqs_zam1_p1 <12),2));
alfa_rest2_diff_zam_p2= squeeze(sum(rest2_diff_zam_p2(:,freqs_zam1_p1>8&freqs_zam1_p1 <12),2));

% roznica miedzy rest3-rest1 
rest3_diff_zam_p1= spectra_zam3_p1 - spectra_zam1_p1; 
rest3_diff_zam_p2= spectra_zam3_p2 - spectra_zam1_p2;

alfa_rest3_diff_zam_p1= squeeze(sum(rest3_diff_zam_p1(:,freqs_zam1_p1>8&freqs_zam1_p1 <12),2));
alfa_rest3_diff_zam_p2= squeeze(sum(rest3_diff_zam_p2(:,freqs_zam1_p1>8&freqs_zam1_p1 <12),2));

% roznica miedzy ruma-rest1 
ruma_diff_zam_p1= spectra_ruma_p1 - spectra_zam1_p1; 
ruma_diff_zam_p2= spectra_ruma_p2 - spectra_zam1_p2;

alfa_ruma_diff_zam_p1= squeeze(sum(ruma_diff_zam_p1(:,freqs_zam1_p1>8&freqs_zam1_p1 <12),2));
alfa_ruma_diff_zam_p2= squeeze(sum(ruma_diff_zam_p2(:,freqs_zam1_p1>8&freqs_zam1_p1 <12),2));

% roznica miedzy rest2-rest1 przy otw oczach
rest2_diff_otw_p1= spectra_otw2_p1 - spectra_otw1_p1; % rest2_diff_zam_p1 okreœla roznicê miedzy rest2 a rest1 przy zamknietych oczach
rest2_diff_otw_p2= spectra_otw2_p2 - spectra_otw1_p2;

alfa_rest2_diff_otw_p1= squeeze(sum(rest2_diff_otw_p1(:,freqs_zam1_p1>8&freqs_zam1_p1 <12),2));
alfa_rest2_diff_otw_p2= squeeze(sum(rest2_diff_otw_p2(:,freqs_zam1_p1>8&freqs_zam1_p1 <12),2));

% roznica miedzy rest3-rest1 
rest3_diff_otw_p1= spectra_otw3_p1 - spectra_otw1_p1; 
rest3_diff_otw_p2= spectra_otw3_p2 - spectra_otw1_p2;

alfa_rest3_diff_otw_p1= squeeze(sum(rest3_diff_otw_p1(:,freqs_zam1_p1>8&freqs_zam1_p1 <12),2));
alfa_rest3_diff_otw_p2= squeeze(sum(rest3_diff_otw_p2(:,freqs_zam1_p1>8&freqs_zam1_p1 <12),2));

if (nr==1) % widma z pierwszego pomiaru
    fig = figure(1)
    subplot(5,1,1)
    topoplot(alfa_rest2_diff_zam_p1, EEG.chanlocs)
    title('rest2 zam p1')

    subplot(5,1,2)
    topoplot(alfa_rest3_diff_zam_p1, EEG.chanlocs)
    title('rest3 zam p1')

    subplot(5,1,3)
    topoplot(alfa_ruma_diff_zam_p1, EEG.chanlocs)
    title('ruma p1')

    subplot(5,1,4)
    topoplot(alfa_rest2_diff_otw_p1, EEG.chanlocs)
    title('rest2 otw p1')

    subplot(5,1,5)
    topoplot(alfa_rest3_diff_otw_p1, EEG.chanlocs)
    title('rest3 otw p1')

    savefig(fig,'fig_WD234_p1.fig') % zapis figury do pliku
    
else  % drugi pomiar i jego widma
    fig1 = figure(1)
    subplot(5,1,1)
    topoplot(alfa_rest2_diff_zam_p2, EEG.chanlocs)
    title('rest2 zam p2')

    subplot(5,1,2)
    topoplot(alfa_rest3_diff_zam_p2, EEG.chanlocs)
    title('rest3 zam p2')

    subplot(5,1,3)
    topoplot(alfa_ruma_diff_zam_p2, EEG.chanlocs)
    title('ruma p2')

    subplot(5,1,4)
    topoplot(alfa_rest2_diff_otw_p2, EEG.chanlocs)
    title('rest2 otw p2')

    subplot(5,1,5)
    topoplot(alfa_rest3_diff_otw_p2, EEG.chanlocs)
    title('rest3 otw p2')

    savefig(fig1,'fig_WD234_p2.fig')
end

%plot(freqs(freqs<40), roznica2(:,freqs<40))
%alfa_diff= squeeze(sum(roznica2(:,freqs>8&freqs<12),2)); 