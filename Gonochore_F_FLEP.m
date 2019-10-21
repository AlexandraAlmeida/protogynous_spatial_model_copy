function Gonochore_F_FLEP(Lf)

%%% FLEP (fraction of LEP) é a fracção não pescada de LEP numa população sujeita a pesca
%%% LEP (lifetime egg production) é o esforço reprodutivo médio ao longo da vida de um recruta. 
%%% LEP é calculado como a soma do produto da sobrevivência até à idade a com a fecundidade na idade a, para todas as idades.


% Simulate FLEP for range of F values for a gonochore,
% given a particular Lf (mean length of entry to fishery)

% Load in life history parameters
LifeHistory_Params(Lf)
load lifehistory_params.mat


F = [0:0.01:100, 750:0.1:800] ;%fishing mortality (0-2, by 0.01) %%% vetor pq esta separado com ","

LEP=nan(1,length(F)) ;

    for f=1:length(F)
    
isfished(:,1)=1./(1+exp(-r.*((D(2,:)')-Lf))) ;
Z=uA+((F(f)).*isfished) ; %Annual adult survival per age class
Surv=exp(-Z)  ; %instantaneous mortality rate... e^-(M+F)
Surv = [1; cumprod(Surv(1:end-1))]; % cumulative survival to each age
E=(EggProd.*M_tmp) ; %Egg production
LEP(f)=(sum(Surv.*E(:)))/2 ; %.*(1-CRT) ;

    end 

FLEP  = LEP./LEP_unfished;

FLEPmat = [F(:), FLEP(:)];

% save FLEPmat to a file
save('FLEPmat.mat','FLEPmat')




    
    

    



