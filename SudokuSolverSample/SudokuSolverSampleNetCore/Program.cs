using System;

namespace SudokuSolverSampleNetCore
{
  class Program
  {
    static void Main(string[] args)
    {
      //private static int[,] B = new int[,] {{0,0,0, 0,0,0, 0,0,0},
      //                                      {0,0,0, 0,0,0, 0,0,0},
      //                                      {0,0,0, 0,0,0, 0,0,0},

      //                                      {0,0,0, 0,0,0, 0,0,0},
      //                                      {0,0,0, 0,0,0, 0,0,0},
      //                                      {0,0,0, 0,0,0, 0,0,0},

      //                                      {0,0,0, 0,0,0, 0,0,0},
      //                                      {0,0,0, 0,0,0, 0,0,0},
      //                                      {0,0,0, 0,0,0, 0,0,0}};

      //int[,] input = new int[,] {{6,0,0, 0,0,1, 4,0,0},
      //                            {0,0,0, 0,3,0, 0,7,0},
      //                            {1,0,0, 0,0,0, 0,0,3},

      //                            {0,0,0, 0,0,0, 0,0,7},
      //                            {5,0,0, 4,0,0, 9,0,0},
      //                            {9,0,0, 0,0,7, 5,0,0},

      //                            {0,3,0, 0,4,0, 0,9,0},
      //                            {0,0,1, 0,2,0, 0,0,8},
      //                            {0,0,0, 5,0,0, 0,0,0}};

      int[,] input = new int[,] { {0,0,0, 0,0,0, 0,0,0},
                                  {0,0,0, 0,0,0, 0,0,0},
                                  {0,0,0, 0,0,0, 0,0,0},

                                  {0,0,0, 0,0,0, 0,0,0},
                                  {0,0,1, 0,0,0, 0,0,0},
                                  {0,0,0, 0,0,0, 2,0,0},

                                  {0,0,0, 0,0,0, 0,0,0},
                                  {0,0,0, 0,0,0, 0,0,0},
                                  {0,0,0, 0,0,0, 0,0,0}};

      var start = DateTime.Now;
      int[,] output = MySudokuSolver.Solve(input);
      var done = DateTime.Now;
      var totalMS = (done - start).TotalMilliseconds;

      for (int row = 0; row < 9; row++)
      {
        if ((row % 3) == 0) System.Console.WriteLine();
        System.Console.WriteLine("{0}{1}{2} {3}{4}{5} {6}{7}{8}",
            output[0, row], output[1, row], output[2, row], output[3, row],
            output[4, row], output[5, row], output[6, row], output[7, row],
            output[8, row]);
      }

      Console.WriteLine($"{totalMS}ms");

      Console.ReadLine();

    }
  }
}
