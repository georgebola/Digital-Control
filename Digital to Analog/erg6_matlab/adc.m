function [v_adc]=adc(v_in,q,v_min,v_max)
delta=(v_max-v_min)/(2^q);
if v_in<v_min,v_in=v_min;...
    elseif v_in>v_max-delta,v_in=v_max-delta;end
v_adc_b=floor((v_in-v_min)/delta);
v_adc=v_min+v_adc_b*delta;
v_adc_b=dec2bin(v_adc_b,q);