model lab3_1
  constant Real a = 0.343;
  constant Real b = 0.815;
  constant Real c = 0.227;
  constant Real h = 0.815;
  Real t = time;
  Real x;
  Real y;
initial equation
  x = 10000;
  y = 29000;
equation
  der(x) = -a*x - b*y + sin(2 * t) + 1;
  der(y) = -c*x*y - h*y + cos(10 * t) + 1;
  annotation(experiment(StartTime=0,StopTime=0.01));
end lab3_1;