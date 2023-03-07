model lab5_1
  constant Real c = 0.16;
  constant Real d = 0.045;
  constant Real a = 0.36;
  constant Real b = 0.033;
  Real t = time;
  Real x(t);
  Real y(t);
initial equation
  x = 10;
  y = 15;
equation
  der(x) = -c * x + d * x * y;
  der(y) = a * y - b * x * y;
  annotation(experiment(StartTime=0, StopTime=70, Interval = 0.05));
end lab5_1;