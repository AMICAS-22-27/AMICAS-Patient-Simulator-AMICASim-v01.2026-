function [D_est,levels] = protocol_disturbance_estimation(D_real,start_time, change)

    d = squeeze(D_real.Data);
    t = D_real.Time;
    d = d(:);
    t = t(:);
    
    D_est = zeros(size(d));
    
    % start index
    k0 = find(t >= start_time,1,'first');
    d_seg = d(k0:end);
    
    % detect change points (data-driven segmentation)
    max_changes = change;
    
    idx_change = findchangepts(d_seg,'Statistic','mean','MaxNumChanges',max_changes);
    
    % build segment boundaries
    segments = [1; idx_change(:); length(d_seg)]; 
    allowed = [0 5 10 15 20 25 30];
    
    levels = zeros(length(segments)-1,1);
    
    for j = 1:length(segments)-1
        idx_local = segments(j):segments(j+1);
        idx_global = k0 - 1 + idx_local;
        seg = d(idx_global);
    
        % robust level estimate
        a = prctile(seg,70);
    
        % projection to allowed disturbance levels
        [~,ind] = min(abs(a-allowed));
        a = allowed(ind);   
        levels(j) = a;
    
        D_est(idx_global) = a;
    end
end
