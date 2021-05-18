using Microsoft.SolverFoundation.Solvers;

namespace SudokuSolverSample
{
    internal class MySudokuSolver
    {
        private static CspTerm[] GetSlice(CspTerm[][] sudoku, 
            int Ra, int Rb, int Ca, int Cb)
        {
            CspTerm[] slice = new CspTerm[9];
            int i = 0;
            for (int row = Ra; row < Rb + 1; row++)
                for (int col = Ca; col < Cb + 1; col++)
                {
                    {
                        slice[i++] = sudoku[row][col];
                    }
                }
            return slice;
        }

        public static int[,] Solve(int[,] input)
        {
            int[,] result = new int[9, 9];
            ConstraintSystem S = ConstraintSystem.CreateSolver();
            CspDomain Z = S.CreateIntegerInterval(1, 9);
            CspTerm[][] sudoku = S.CreateVariableArray(Z, "cell", 9, 9);
            for (int row = 0; row < 9; row++)
            {
                for (int col = 0; col < 9; col++)
                {
                    if (input[row, col] > 0)
                    {
                        S.AddConstraints(S.Equal(input[row, col], sudoku[row][col]));
                    }
                }
                S.AddConstraints(S.Unequal(GetSlice(sudoku, row, row, 0, 8)));
            }
            for (int col = 0; col < 9; col++)
            {
                S.AddConstraints(S.Unequal(GetSlice(sudoku, 0, 8, col, col)));
            }
            for (int a = 0; a < 3; a++)
            {
                for (int b = 0; b < 3; b++)
                {
                    S.AddConstraints(S.Unequal(GetSlice(sudoku, 
                        a * 3, a * 3 + 2, b * 3, b * 3 + 2)));
                }
            }
            ConstraintSolverSolution soln = S.Solve();
            for (int row = 0; row < 9; row++)
            {
                for (int col = 0; col < 9; col++)
                {
                    object val = null;
                    soln.TryGetValue(sudoku[row][col], out val);
                    result[row, col] = (int)val;
                }
            }


            return result;
        }
    }
}
