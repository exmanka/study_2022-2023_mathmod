model lab7_1
  constant Real alpha_1 = 0.77;
  constant Real alpha_2 = 0.00017;
  constant Integer N = 610;
  constant Integer n_0 = 10;
  Real t = time;
  Real n(t);
initial equation
  n = n_0;
equation
  der(n) = (alpha_1 + alpha_2 * n) * (N - n);
  annotation(experiment(StartTime=0, StopTime=10, Interval = 0.1));
end lab7_1;