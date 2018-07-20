load('macierz_widm.mat')
pacjenci1 = {'WD219', 'WD223','WD224','WD225','WD226','WD227','WD234','WD235','WD236','WD237','WD238','WD239','WD240','WD241', 'MD219', 'MD220', 'MD223','MD224','MD226','MD227', 'MD229', 'MD230' 'MD231', 'MD236', 'MD237', 'MD238','MD239', '4064','4087','4100','4110','4116','4123','4138','4150','4203','4266','4317','4325','4333','4335','4336','4345','4346','4353','4356','4371','4373','4405','4406','4407','4408'}
pacjenci = cellstr(pacjenci1);
procedury = {'zam1','zam2', 'zam3','otw1','otw2','otw3'};

osoba = 52; % liczba pacjentów
sesja = 2;  % liczba pomiarów przed/ po
typ = 6;    % rodzaj resta zam1/zam2/zam3/otw1/otw2/otw3

licznik = 1;
nbins = 20;
mac_av = zeros(10,13); % wiersze - osoba o danej procedurze, kolumny - wartoœci zmiennych zale¿nych (A...) i niezale¿nych p- pozosta³e

A1_O = 1;
A2_O = 2;
A1_F =3;
A2_F =4;
OSOBA = 5;
SESJA = 6 ; % przed/po
TYP =7 ; % otw/zam/rest 1/2/3
GRUPA =8; % leczeni/nieleczeni/kontrola
A1_O_std = 9;
A2_O_std = 10;
A1_F_std =11;
A2_F_std =12;
Length = 13;

Fs = 250;


for pac=1:1:osoba
    for rest =1:1:typ
        nazwa = [pacjenci{pac} ' ' procedury{rest}]
        nazwa1 = [pacjenci{pac} '_' procedury{rest}]
        for pomiar = 1:sesja
            % wyszukuje wierszy spe³niajacych warunek i ich numery zapisuje
            % do listy lista_sesji
            lista_sesji = find(mac(:,5)==pac & mac(:,6)==pomiar & mac(:,7)==rest);
            srednia_A1_O = mean(mac(lista_sesji,1));
            std_A1_O    =   std(mac(lista_sesji,1));
            srednia_A2_O = mean(mac(lista_sesji,2));
            std_A2_O    =   std(mac(lista_sesji,2));
            srednia_A1_F = mean(mac(lista_sesji,3));
            std_A1_F    =   std(mac(lista_sesji,3));
            srednia_A2_F = mean(mac(lista_sesji,4));
            std_A2_F    =   std(mac(lista_sesji,4));
            
            fig = figure((pac-1)*6 + rest);
            
            s(1) = subplot(4,2,pomiar);
            histogram(mac(lista_sesji,1),nbins);
            tytul_A1_O = round(srednia_A1_O,4);
            title(s(1),tytul_A1_O);
            ylabel('A1_O')
            
            if pomiar ==1
                gtext(nazwa,'Color','red','FontSize',14)
            end
            
            s(2) = subplot(4,2,pomiar+2);
            histogram(mac(lista_sesji,2),nbins);
            tytul_A2_O = round(srednia_A2_O,4);
            ylabel('A2_O')
            title(s(2),tytul_A2_O);
            
            s(3) = subplot(4,2,pomiar+4);
            histogram(mac(lista_sesji,3),nbins);
            tytul_A1_F = round(srednia_A1_F,4);
            title(s(3),tytul_A1_F);
            ylabel('A1_F')
            
            s(4) = subplot(4,2,pomiar+6);
            histogram(mac(lista_sesji,1),nbins);
            tytul_A2_F = round(srednia_A2_F,4);
            title(s(4),tytul_A2_F);
            ylabel('A2_F')
%             
            mac_av(licznik,A1_O) = srednia_A1_O;
            mac_av(licznik,A2_O) = srednia_A2_O;
            mac_av(licznik,A1_F) = srednia_A1_F;
            mac_av(licznik,A2_F) = srednia_A2_F;
            
            mac_av(licznik,OSOBA) = pac;
            mac_av(licznik,SESJA)= pomiar;
            mac_av(licznik,TYP) = rest;
            mac_av(licznik,A1_O_std)= std_A1_O;
            mac_av(licznik,A2_O_std)= std_A2_O;
            mac_av(licznik,A1_F_std)= std_A1_F;
            mac_av(licznik,A2_F_std)= std_A2_F;
            mac_av(licznik,Length)= length(lista_sesji);
            licznik =licznik + 1;
            
            
        end
        filename = [nazwa1 '.fig']
        filename1 = [nazwa1 '.png']
        saveas(fig,filename)
        saveas(fig,filename1)
        close all
    end
    
end
save('macierz_srednich_widm2.mat','mac_av')