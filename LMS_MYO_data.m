
%function main()
close  all

% �����źŵĲ��� 
t=0:999;
xs=(data(1:1000,1)).';
figure;
subplot(2,1,1);
plot(t,xs);grid;
ylabel('��ֵ');
title('it{�����������ź�}');

% �����źŵĲ���
t=0:999;
xn=sin(2*50*pi*t);%Ƶ��50hz�������ź�ģ�⹤Ƶ����
subplot(2,1,2);
plot(t,xn);grid;
ylabel('��ֵ');
xlabel('ʱ��');
title('it{��������ź�}');

% �ź��˲�
xn = xs+xn;
xn = xn.' ;   % �����ź�����
dn = xs.' ;   % Ԥ�ڽ������
M  = 20 ;   % �˲����Ľ���

rho_max = max(eig(xn*xn.'));   % �����ź���ؾ�����������ֵ
mu = (1/rho_max) ;    % �������� 0 < mu < 1/rho
[yn,W,en] = LMS(xn,dn,M,mu);

% �����˲��������ź�
figure;
subplot(2,1,1);
plot(t,xn);grid;
ylabel('��ֵ');
xlabel('ʱ��');
title('it{�˲��������ź�}');

% ��������Ӧ�˲�������ź�
subplot(2,1,2);
plot(t,yn);grid;
ylabel('��ֵ');
xlabel('ʱ��');
title('it{����Ӧ�˲�������ź�}');

% ��������Ӧ�˲�������ź�,Ԥ������źź����ߵ����
figure 
plot(t,yn,'b',t,dn,'g',t,dn-yn,'r');grid;
legend('����Ӧ�˲������','Ԥ�����','���');
ylabel('��ֵ');
xlabel('ʱ��');
title('it{����Ӧ�˲���}');
