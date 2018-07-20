%load('widma_poprawione.mat')
procedury = {'zam1','zam2', 'zam3','otw1','otw2','otw3'};



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

nbins = 7;

for diag = 0:1:2
    for pomiar = 1:2
        for rest = 1:1:3
            lista_sesji = find(mac_av(:,8)==diag & mac_av(:,6)==pomiar & mac_av(:,7)==rest);
            
            fig = figure(diag+1);
            if (pomiar==1 & rest ==1)
                subplot(6,4,pomiar*4-3);
                histogram(mac_av(lista_sesji,1),nbins);
                title('A1_O');
                ylabel(procedury{rest})
                xlim([-1.1 1.1])
            
                subplot(6,4,pomiar*4-2);
                histogram(mac_av(lista_sesji,2),nbins);
                title('A2_O');
                xlim([-0.4 0.4])
                
                subplot(6,4,pomiar*4-1);
                histogram(mac_av(lista_sesji,3),nbins);
                title('A1_F');
                xlim([-1.1 1.1])
                
                subplot(6,4,pomiar*4);
                histogram(mac_av(lista_sesji,4),nbins);
                title('A2_F');
                xlim([-0.4 0.4])
            
            elseif (pomiar==2 & rest ==1)
                subplot(6,4,pomiar*4-3);
                histogram(mac_av(lista_sesji,1),nbins);
                title('A1_O');
                ylabel(procedury{rest})
                xlim([-1.1 1.1])
            
                subplot(6,4,pomiar*4-2);
                histogram(mac_av(lista_sesji,2),nbins);
                title('A2_O');
                xlim([-0.4 0.4])
                
                subplot(6,4,pomiar*4-1);
                histogram(mac_av(lista_sesji,3),nbins);
                title('A1_F');
                xlim([-1.1 1.1])
                
                subplot(6,4,pomiar*4);
                histogram(mac_av(lista_sesji,4),nbins);
                title('A2_F');
                xlim([-0.4 0.4])
            
            elseif (pomiar==1 & rest ==2)
                subplot(6,4,3*4-3);
                histogram(mac_av(lista_sesji,1),nbins);
                title('A1_O');
                ylabel(procedury{rest})
                xlim([-1.1 1.1])
            
                subplot(6,4,3*4-2);
                histogram(mac_av(lista_sesji,2),nbins);
                title('A2_O');
                xlim([-0.4 0.4])
                
                subplot(6,4,3*4-1);
                histogram(mac_av(lista_sesji,3),nbins);
                title('A1_F');
                xlim([-1.1 1.1])
                
                subplot(6,4,3*4);
                histogram(mac_av(lista_sesji,4),nbins);
                title('A2_F');
                xlim([-0.4 0.4])
                
            elseif (pomiar==2 & rest ==2)
                subplot(6,4,4*4-3);
                histogram(mac_av(lista_sesji,1),nbins);
                title('A1_O');
                ylabel(procedury{rest})
                xlim([-1.1 1.1])
            
                subplot(6,4,4*4-2);
                histogram(mac_av(lista_sesji,2),nbins);
                title('A2_O');
                xlim([-0.4 0.4])
                
                subplot(6,4,4*4-1);
                histogram(mac_av(lista_sesji,3),nbins);
                title('A1_F');
                xlim([-1.1 1.1])
                
                subplot(6,4,4*4);
                histogram(mac_av(lista_sesji,4),nbins);
                title('A2_F');
                xlim([-0.4 0.4])
            
            elseif (pomiar==1 & rest ==3)
                subplot(6,4,5*4-3);
                histogram(mac_av(lista_sesji,1),nbins);
                title('A1_O');
                ylabel(procedury{rest})
                xlim([-1.1 1.1])
            
                subplot(6,4,5*4-2);
                histogram(mac_av(lista_sesji,2),nbins);
                title('A2_O');
                xlim([-0.4 0.4])
                
                subplot(6,4,5*4-1);
                histogram(mac_av(lista_sesji,3),nbins);
                title('A1_F');
                xlim([-1.1 1.1])
                
                subplot(6,4,5*4);
                histogram(mac_av(lista_sesji,4),nbins);
                title('A2_F');
                xlim([-0.4 0.4])
            
            elseif (pomiar==2 & rest ==3)
                subplot(6,4,6*4-3);
                histogram(mac_av(lista_sesji,1),nbins);
                title('A1_O');
                ylabel(procedury{rest})
                xlim([-1.1 1.1])
            
                subplot(6,4,6*4-2);
                histogram(mac_av(lista_sesji,2),nbins);
                title('A2_O');
                xlim([-0.4 0.4])
                
                subplot(6,4,6*4-1);
                histogram(mac_av(lista_sesji,3),nbins);
                title('A1_F');
                xlim([-1.1 1.1])
                
                subplot(6,4,6*4);
                histogram(mac_av(lista_sesji,4),nbins);
                title('A2_F');
                xlim([-0.4 0.4])
            
            end
            
        end
            
    end
    
    if diag ==0
        gtext('Depresja bez treningu','Color','red','FontSize',14)
    elseif diag ==1
        gtext('Depresja z treningiem','Color','red','FontSize',14)
    else
        gtext('Zdrowi bez depresji','Color','red','FontSize',14)
    end

end
    

        