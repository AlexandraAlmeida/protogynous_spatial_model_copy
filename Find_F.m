function [F] = Find_F(FLEPtarg)  # F taxa de mortalidade

%%% teste da Alexandra

% Table lookup to find the desired value of F given a gonochore FLEP

load 'FLEPmat.mat' ;

Ftmp = abs(FLEPmat(:,2) - FLEPtarg) ;  # oláaaaaa

index = find(Ftmp == min(Ftmp),1) ; #OLeeeeeeeeeeeeeee

F = FLEPmat(index,1) ;


%%% Mais um teste depois do olá
%%% Sera que aparece?
