model lab4_3
  constant Real omega_0_square = 1.0;
  constant Real gamma_2 = 1.0;
  Real t = time;
  Real x;
  Real y;
initial equation
  x = -1;
  y = 2;
equation
  der(x) = y;
  der(y) = - gamma_2 * y - omega_0_square * x + 3 * sin(t);
  annotation(experiment(StartTime=0, StopTime=65, Interval = 0.05));
end lab4_3;