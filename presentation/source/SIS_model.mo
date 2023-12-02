model SIS
  constant Real beta = 0.3;
  constant Real gamma = 0.16;
  constant Integer N = 418;
  Real t = time;
  Real S(t);
  Real I(t);
initial equation
  S = N - I;
  I = 1;
equation
  der(S) = - beta * S * I / N + gamma * I;
  der(I) = beta * S * I / N - gamma * I;
  annotation(experiment(StartTime=1, StopTime=63, Interval = 1));
end SIS;