within Modelica.Constants;
model lab2
  constant Real n = 2.5;
  constant Real a = 6.2;
  constant Real r1 = a / (n + 1);
  constant Real r2 = a / (n - 1);
  Real theta(start=-pi);
  Real r(start=r2);
  Real x;
  Real y;
equation
  der(r) = 1;
  der(r)/der(theta) = r / sqrt(5.25);
  x = r * cos(theta);
  y = r * sin(theta);
  //annotation(experiment(StartTime=0,StopTime=25.7));
  annotation(experiment(StartTime=0,StopTime=60));
end lab2;