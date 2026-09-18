if Dist_type == 1
    Disturbance_ts = no_disturbance;
elseif Dist_type == 2
    Disturbance_ts = disturbance_1;
elseif Dist_type == 3
    Disturbance_ts = disturbance_2;
else
    Disturbance_ts = disturbance_P1959;
end

[Disturbance_protocol,levels] = protocol_disturbance_estimation(Disturbance_ts,10,15);
Estimated_Disturbance = timeseries(Disturbance_protocol, Disturbance_ts.Time);

G11_ss = PKmodelP * CPmodelP;
G12_ss = PKmodelR * CPmodelR;
k1 = 1; k2 = 1;
Tsc = 5/60;

G11x = k1*tf(G11_ss);
G12x = k2*tf(G12_ss);
g11z = c2d(G11x, Tsc);
g12z = c2d(G12x, Tsc);
%% For Identification
sys11 = c2d(ss(G11x), Tsc);
Ap = sys11.A;
Bp = sys11.B;
Cp = sys11.C;

sys12 = c2d(ss(G12x), Tsc);
Ar = sys12.A;
Br = sys12.B;
Cr = sys12.C;