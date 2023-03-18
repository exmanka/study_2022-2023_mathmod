model lab8_1
  constant Real M_1_0 = 2.2 * 1e6;
  constant Real M_2_0 = 1.5 * 1e6;
  constant Integer p_1 = 10 * integer(1e3);
  constant Integer p_2 = 8 * integer(1e3);
  constant Integer tau_1 = 13;
  constant Integer tau_2 = 16;
  constant Integer p_cr = 17 * integer(1e3);
  constant Integer N = 20 * integer(1e3);
  constant Integer q = 1;
  
  constant Real a_1 = p_cr / (tau_1^2 * p_1^2 * N * q);
  constant Real a_2 = p_cr / (tau_2^2 * p_2^2 * N * q);
  constant Real b = p_cr / (tau_1^2 * p_1^2 * tau_2^2 * p_2^2 * N * q);
  constant Real c_1 = (p_cr - p_1) / (tau_1 * p_1);
  constant Real c_2 = (p_cr - p_2) / (tau_2 * p_2);
  
  Real t = time / c_1;
  Real M_1(t);
  Real M_2(t);
initial equation
  M_1 = M_1_0;
  M_2 = M_2_0;
equation
  der(M_1) = M_1 - (b/c_1) * M_1 * M_2 - (a_1/c_1) * M_1^2;
  der(M_2) = (c_2/c_1) * M_2 - (b/c_1) * M_1 * M_2 - (a_2/c_1) * M_2^2;
  annotation(experiment(StartTime=0, StopTime=16, Interval=0.2));
end lab8_1;