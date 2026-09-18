%% Propofol 
[PKmodelP, CPmodelP] = SchniderModel(patient);

%% Remifentanil
[PKmodelR, CPmodelR] = MintoModel(patient);

%% Hill Functions for Propofol and Remifentanil for BIS and NOL

% Minto Model parameters for BIS
E0_M = 93.97; Emax_M = E0_M; C50P_M = 7.53; C50R_M = 160.25; beta_M = 10.74; gamma_M = 4.13;
% Greco Model parameters for BIS
E0_G = 93.97; Emax_G = E0_G; 
if database_type == 3
    load("SurfDist_P1959.mat");
    C50P_G = C50p_P1959;    C50R_G = C50r_P1959;    alpha_G = alpha_P1959;   gamma_G = gamma_P1959;
    time = 1*[0:length(C50P_G)-1]/60;
else % Tsim long, e.g. 300 min
    time = [0:1/60:Tsim];
    C50P_G = 7.66*ones(1,length(time)); C50R_G = 149.62*ones(1,length(time)); 
    alpha_G = 15.03*ones(1,length(time)); gamma_G = 4.07*ones(1,length(time));  
end
    C50P_G_ts = timeseries(C50P_G, time);   C50R_G_ts = timeseries(C50R_G, time);
    alpha_G_ts = timeseries(alpha_G, time);   gamma_G_ts = timeseries(gamma_G, time);

% Reduced Greco Model parameters for BIS
E0_RG = 93.97; Emax_RG = E0_RG; C50P_RG = 8.26; gamma_RG = 3.59; alpha_RG = 0.33;

% Minto Model parameters for NOL
E0_MN = 34.48; Emax_MN = E0_MN; C50P_MN = 1188.7; C50R_MN = 14.64; beta_MN = 3.36; gamma_MN = 6.56;
% Greco Model parameters for NOL
E0_GN = 33.34; Emax_GN = E0_GN; C50P_GN = 1273.3; C50R_GN = 8.30; alpha_GN = 7.76; gamma_GN = 7.14; 
% Reduced Greco Model parameters for NOL
E0_RGN = 33.69; Emax_RGN = E0_RGN; C50P_RGN = 67.77; gamma_RGN = 5.34; alpha_RGN = 1.61;

%% RASS
% Remifentanil effect site concentration to RASS
k1r = 0.81; k0r = 0.81;

sysRASS1 = tf(1,[k1r*15 k0r]);
sysRASS2 = tf(-2, [1 2]);

%% Neuromuscular blockade (NMB)
% Atracurium input to effect site concentration - Wiener model
k1a = 1; k2a = 4; k3a = 10; alphaNMB = 0.0374;
sysNMB=zpk([],[-k1a*alphaNMB, -k2a*alphaNMB, -k3a*alphaNMB],k1a*k2a*k3a*alphaNMB^3); 

% Hill Atracurium
gammaN = 2.6677; C50N = 3.2425;