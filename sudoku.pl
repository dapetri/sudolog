% Layout of Sudoku
%
% A B C
% D E F
% G H I
%
% A00,A01,A02,  B00,B01,B02,   C00,C01,C02
% A10,A11,A12,  B10,B11,B12,   C10,C11,C12
% A20,A21,A22,  B20,B21,B22,   C20,C21,C22
%
% D00,D01,D02,  E00,E01,E02,   F00,F01,F02
% D10,D11,D12,  E10,E11,E12,   F10,F11,F12
% D20,D21,D22,  E20,E21,E22,   F20,F21,F22
%
% G00,G01,G02,  H00,H01,H02,   I00,I01,I02
% G10,G11,G12,  H10,H11,H12,   I10,I11,I12
% G20,G21,G22,  H20,H21,H22,   I20,I21,I22


solve(A00,A01,A02,A10,A11,A12,A20,A21,A22, B00,B01,B02,B10,B11,B12,B20,B21,B22, C00,C01,C02,C10,C11,C12,C20,C21,C22, 
      D00,D01,D02,D10,D11,D12,D20,D21,D22, E00,E01,E02,E10,E11,E12,E20,E21,E22, F00,F01,F02,F10,F11,F12,F20,F21,F22, 
      G00,G01,G02,G10,G11,G12,G20,G21,G22, H00,H01,H02,H10,H11,H12,H20,H21,H22, I00,I01,I02,I10,I11,I12,I20,I21,I22) :-

    % box A
    solve_div(A00,A01,A02,A10,A11,A12,A20,A21,A22), 
    % box B
    solve_div(B00,B01,B02,B10,B11,B12,B20,B21,B22), 
    % box C
    solve_div(C00,C01,C02,C10,C11,C12,C20,C21,C22), 
    % box D
    solve_div(D00,D01,D02,D10,D11,D12,D20,D21,D22),
    % box G
    solve_div(G00,G01,G02,G10,G11,G12,G20,G21,G22), 

    % row 0 
    solve_div(A00,A01,A02,B00,B01,B02,C00,C01,C02),
    % col 0
    solve_div(A00,A10,A20,D00,D10,D20,G00,G10,G20),
    % row 1
    solve_div(A10,A11,A12,B10,B11,B12,C10,C11,C12), 
    % col 1
    solve_div(A01,A11,A21,D01,D11,D21,G01,G11,G21), 
    % row 2
    solve_div(A20,A21,A22,B20,B21,B22,C20,C21,C22), 
    % col 2
    solve_div(A02,A12,A22,D02,D12,D22,G02,G12,G22),
    
    % box E
    solve_div(E00,E01,E02,E10,E11,E12,E20,E21,E22),
    % box F
    solve_div(F00,F01,F02,F10,F11,F12,F20,F21,F22), 
    % box H
    solve_div(H00,H01,H02,H10,H11,H12,H20,H21,H22), 

    % row 3
    solve_div(D00,D01,D02,E00,E01,E02,F00,F01,F02), 
    % col 3
    solve_div(B00,B10,B20,E00,E10,E20,H00,H10,H20), 
    % row 4
    solve_div(D10,D11,D12,E10,E11,E12,F10,F11,F12), 
    % col 4
    solve_div(B01,B11,B21,E01,E11,E21,H01,H11,H21),
    % row 5
    solve_div(D20,D21,D22,E20,E21,E22,F20,F21,F22), 
    % col 5
    solve_div(B02,B12,B22,E02,E12,E22,H02,H12,H22), 

    
     

    % box I
    solve_div(I00,I01,I02,I10,I11,I12,I20,I21,I22),
    % row 6
    solve_div(G00,G01,G02,H00,H01,H02,I00,I01,I02), 
    % col 6
    solve_div(C00,C10,C20,F00,F10,F20,I00,I10,I20),
    % row 7 
    solve_div(G10,G11,G12,H10,H11,H12,I10,I11,I12),   
    % col 7
    solve_div(C01,C11,C21,F01,F11,F21,I01,I11,I21), 
    % row 8
    solve_div(G20,G21,G22,H20,H21,H22,I20,I21,I22),
    % col 8
    solve_div(C02,C12,C22,F02,F12,F22,I02,I12,I22).
 
    

solve_div(X0,X1,X2, Y0,Y1,Y2, Z0,Z1,Z2) :- inv_code(X0,X0P), inv_code(X1,X1P), inv_code(X2,X2P), inv_code(Y0,Y0P), inv_code(Y1,Y1P), inv_code(Y2,Y2P), inv_code(Z0,Z0P), inv_code(Z1,Z1P), inv_code(Z2,Z2P), 
                                           check(X0P,X1P,X2P, Y0P,Y1P,Y2P, Z0P,Z1P,Z2P).

% checks that number is in {1,..,9} and assigns code so that sum can get checked in check(..)
inv_code(1,1).
inv_code(2,10).
inv_code(3,100).
inv_code(4,1000).
inv_code(5,10000).
inv_code(6,100000).
inv_code(7,1000000).
inv_code(8,10000000).
inv_code(9,100000000).

check(X0,X1,X2, Y0,Y1,Y2, Z0,Z1,Z2) :- 111111111 is X0+X1+X2+Y0+Y1+Y2+Z0+Z1+Z2.

% test 
% solve(A00,8,4,3,A11,6,A20,5,A22, 9,B01,B02,4,B11,5,B20,B21,2, 7,5,C02,2,C11,8,4,C21,6, D00,1,5,9,D11,8,7,6,3, E00,E01,8,6,E11,E12,E20,4,9, 9,F01,2,F10,F11,4,1,F21,F22, G00,G01,G02,G10,G11,G12,G20,G21,G22, H00,H01,H02,5,2,7,1,H21,H22, I00,I01,1,6,4,9,I20,I21,I22).

% is a true sudoku.
% solve(4,3,1,8,7,9,5,6,2, 5,8,2,4,6,1,3,7,9, 9,7,6,2,3,5,1,4,8, 2,9,7,3,4,8,6,1,5, 6,3,5,1,2,7,9,4,8, 8,1,4,5,6,9,3,2,7, 9,2,6,7,5,4,1,8,3, 8,1,4,2,9,3,7,5,6, 7,5,3,6,8,1,4,9,2). 

% even easier
% solve(4,3,A1,8,7,9,A2,6,2, B1,8,2,4,6,1,3,B2,9, 9,C1,C2,2,3,5,1,4,8, 2,9,7,D1,4,8,6,1,D2, 6,3,5,1,E1,7,E2,4,8, 8,1,4,5,F1,F2,3,2,7, 9,G1,6,G2,5,4,1,8,3, 8,H1,4,2,9,3,7,H2,6, 7,5,3,6,8,1,I1,I2,2). 

% easy sudoku
% solve(4,A01,1,A10,7,A12,5,A21,2, B00,8,B02,B10,6,B12,B20,7,B22, 9,C01,6,C10,3,C12,1,C21,8, 
      D00,D01,D02,3,4,8,D20,D21,D22, 6,E01,5,E10,2,E12,9,E21,8, F00,F01,F02,5,6,9,F20,F21,F22, 
      9,G01,6,G10,5,G12,1,G21,3, H00,1,H02,H10,9,H12,H20,5,H22, 7,I01,3,I10,8,I12,4,I21,2).

% solution:
% 4 3 1 5 8 2 9 7 6
% 8 7 9 4 6 1 2 3 5 
% 5 6 2 3 7 9 1 4 8
% 2 9 7 6 3 5 8 1 4
% 3 4 8 1 2 7 5 6 9
% 6 1 5 9 4 8 3 2 7 
% 9 2 6 8 1 4 7 5 3
% 7 5 4 2 9 3 6 8 1
% 1 8 3 7 5 6 4 9 2