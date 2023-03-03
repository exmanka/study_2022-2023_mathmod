model lab4_2
  constant Real omega_0_square = 11.0;
  constant Real gamma_2 = 10.0;
  Real t = time;
  Real x;
  Real y;
initial equation
  x = -1;
  y = 2;
equation
  der(x) = y;
  der(y) = - gamma_2*y - omega_0_square*x;
  annotation(experiment(StartTime=0, StopTime=65, Interval = 0.05));
end lab4_2;