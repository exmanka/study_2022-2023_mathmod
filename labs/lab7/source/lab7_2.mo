model lab7_2
  constant Real alpha_1 = 0.000055;
  constant Real alpha_2 = 0.29;
  constant Integer N = 610;
  constant Integer n_0 = 10;
  Real t = time;
  Real n(t);
initial equation
  n = n_0;
equation
  der(n) = (alpha_1 + alpha_2 * n) * (N - n);
  annotation(experiment(StartTime=0, StopTime=0.1, Interval = 0.001));
end lab7_2;