[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
%pacjenci= {'MD219', 'MD220', 'MD223','MD224','MD226','MD227', 'MD229', 'MD230', 'MD231', 'MD236', 'MD237', 'MD238'};
pacjenci1 = {'WD219', 'WD223','WD224','WD225','WD226','WD227','WD234','WD235','WD236','WD237','WD238','WD239','WD240','WD241', 'MD219', 'MD220', 'MD223','MD224','MD226','MD227', 'MD229', 'MD230' 'MD231', 'MD236', 'MD237', 'MD238','MD239', '4064','4087','4100','4110','4116','4123','4138','4150','4203','4266','4317','4325','4333','4335','4336','4345','4346','4353','4356','4371','4373','4405','4406','4407','4408'}
%pacjenci = {'4064','4087','4100','4110','4116','4123','4138','4150','4203','4266','4317','4325','4333','4335' }

%pacjenci1 = {'MD219','MD221'}; % numer pacjenta do analizy
pacjenci = cellstr(pacjenci1);
licznik = 0;

mac = zeros(10,8); % wiersze - obserwacje, kolumny - wartoœci zmiennych zale¿nych (A...) i niezale¿nych p- pozosta³e
A1_O = 1;
A2_O = 2;
A1_F =3;
A2_F =4;
OSOBA = 5;
SESJA = 6 ; % przed/po
TYP =7 ; % otw/zam/rest 1/2/3
GRUPA =8; % leczeni/nieleczeni/kontrola

Fs = 250;

for pac = 1:length(pacjenci) % numer kolejny pacjenta w ³¹cznej liœcie ( leczeni, nieleczeni, kontrolni)

for sesja =1:2
     
    file = [char(pacjenci{pac}) '_' num2str(sesja) '_Cz_']
    name = [char(pacjenci{pac}) '_' num2str(sesja) '_Cz.set']; %nazwa pliku, ktory zostanie wczytany
    
    
   
    if exist(name, 'file')==2
        EEG = pop_loadset('filename', name ,'filepath','C:\\DANE\\Depresja 2017\\Analiza_nowa\\Depresja_ML\\Sygnaly_CZ'); %wczytanie pliku
        %[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
        EEG = eeg_checkset( EEG );

        procedury = {'zam1','zam2', 'zam3','otw1','otw2','otw3'};

        procedura1 = cellstr(procedury);


        % odrzucenie kana³ów oprócz F3,F4, O1,O2 , czyli 3,9,34,38
        % bed¹ potrzebne do liczenia ró¿nicy w widmie
        EEG = pop_select( EEG,'channel',{'E3' 'E9' 'E34' 'E38'});% F3,F4,O1,O2
        EEG = eeg_checkset( EEG );

        % przekroczenie sygnalu o 90uV, w EEG.reject.rejthresh triale do
        % odrzucenia
        EEG = pop_eegthresh(EEG,1,[1:4] ,-50,50,0,0.996,2,0);
        EEG = eeg_checkset( EEG );

        for epoch = 1:1:length(EEG.epoch)
            if (EEG.reject.rejthresh(epoch)==0)
                proc = find(strcmp(EEG.epoch(epoch).eventtype{end}, procedury));
                if proc>0
                    licznik= licznik+1;
                window = blackmanharris(EEG.pnts);
                [pxx,f] = periodogram(squeeze(EEG.data(:,:,epoch))', window,[],EEG.srate);
                p = sum(pxx(8<f&f<13,:),1);
                mac(licznik,A1_O)=log(p(4))-log(p(3));
                mac(licznik,A1_F)=log(p(2))-log(p(1));
                p = sqrt(p);
                mac(licznik,A2_O) = (p(4)-p(3))/(p(4)+p(3));
                mac(licznik,A2_F) = (p(2)-p(1))/(p(2)+p(1));
                mac(licznik,OSOBA) = pac;
                mac(licznik,SESJA)= sesja;
                mac(licznik,TYP) = proc;
               switch(pacjenci1{pac}(1))
                   case 'M' 
                       mac(licznik,GRUPA) = 1;
                   case 'W'
                        mac(licznik,GRUPA) = 2;
                   case '4'
                        mac(licznik,GRUPA) = 3;
               end
                end
            end
        end
        
        else
        % File does not exist.
            %warningMessage = sprintf('Warning: file does not exist:\n%s',name);
            %uiwait(msgbox(warningMessage));
            fprintf('Warning: file does not exist:\n%s',name);
            fprintf('');
        end
    end
end

save('macierz_widm.mat','mac')  % zapis widma do pliku .mat
