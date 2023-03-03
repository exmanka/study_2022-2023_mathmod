model lab4_1
  constant Real omega_0_square = 2.5;
  Real t = time;
  Real x(t);
  Real y;
initial equation
  x = -1;
  y = 2;
equation
  der(x) = y;
  der(y) = - omega_0_square * x;
  annotation(experiment(StartTime=0, StopTime=65, Interval = 0.05));
end lab4_1;