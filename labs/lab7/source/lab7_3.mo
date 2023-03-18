model lab7_3
  constant Real alpha_1 = 0.5;
  constant Real alpha_2 = 0.3;
  constant Integer N = 610;
  constant Integer n_0 = 10;
  Real t = time;
  Real n(t);
initial equation
  n = n_0;
equation
  der(n) = (alpha_1 * t + alpha_2 * t * n) * (N - n);
  annotation(experiment(StartTime=0, StopTime=0.5, Interval = 0.01));
end lab7_3;