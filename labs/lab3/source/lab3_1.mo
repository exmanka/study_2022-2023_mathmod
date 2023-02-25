model lab3_1
  constant Real a = 0.333;
  constant Real b = 0.777;
  constant Real c = 0.5;
  constant Real h = 0.65;
  Real t = time;
  Real x;
  Real y;
initial equation
  x = 10000;
  y = 29000;
equation
  der(x) = -a*x - b*y + 1.6 * sin(t);
  der(y) = -c*x - h*y + 1.7 * cos(t + 2);
  annotation(experiment(StartTime=0,StopTime=0.5));
end lab3_1;