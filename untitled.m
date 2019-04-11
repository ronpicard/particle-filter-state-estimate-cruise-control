clc; clear all;

A = [-50/1000];
B = [1/50];
C = [1];
D = [0];

p1 = -1;
K = place(A,B,[p1])

Pc = [B];
inv(Pc)
K = [1]*inv(Pc)*(-50/1000+-p1)