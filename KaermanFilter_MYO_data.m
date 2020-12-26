clf
Z=data;
r=0.0005;
for i=1:length(Z)
	Z(i)=data(i)+normrnd(0,1)*r;
end
D=Z-data;
X=Z(1);
T=0.001;
V=0.1;
Q=T^2*V^2 ;
R=r^2;
P=X^2;
A=1;
H=1;
Xn=KaermanFilter(X,Z, A, Q, H, R,P);
plot(data,'g');
hold on;

% RMS(Z,data);
% RMS(Xn,data);
plot(Xn,'b')
hold on
