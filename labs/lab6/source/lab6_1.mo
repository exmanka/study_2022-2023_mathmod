model lab6_1
  constant Real alpha = 0.75;
  constant Real beta = 0.25;
  constant Integer I_crit = 200;
  constant Integer N = 11000;
  Real t = time;
  Real S(t);
  Real I(t);
  Real R(t);
initial equation
  S = N - I - R;
  I = 111;
  R = 11;
equation
  if I > I_crit then
    der(S) = - alpha * S;
    der(I) = alpha * S - beta * I;
  else
    der(S) = 0;
    der(I) = - beta * I;
  end if;
  
  der(R) = beta * I;
  annotation(experiment(StartTime=0, StopTime=30, Interval = 0.5));
end lab6_1;