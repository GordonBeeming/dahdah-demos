using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;
using System;

namespace TestMaxValue
{
  class Program
  {
    static void Main(string[] args)
    {
      var summary = BenchmarkRunner.Run<Tests>();

      //RandomTestBenchMethod.Run();
    }

  }

  public class Tests
  {
    [Benchmark]
    public int CSharpWay()
    {
      return CSharpWay(4, 10);
    }

    public int CSharpWay(int a, int b)
    {
      return (a >= b) ? a : b;
    }

    [Benchmark]
    public int MathsWay()
    {
      return MathsWay(4, 10);
    }

    public int MathsWay(int a, int b)
    {
      return (a + b + Math.Abs(a - b)) / 2;
    }

    [Benchmark]
    public int MathsWayWithFix()
    {
      return MathsWayWithFix(4, 10);
    }

    public int MathsWayWithFix(int a, int b)
    {
      return Convert.ToInt32((double)(((double)a + b + Math.Abs(a - b)) / 2.0));
    }
  }

  public class RandomTestBenchMethod
  {

    public static void Run()
    {
      int a = 1;
      int b = Int32.MaxValue - 1;
      int count = 100000;

      Console.WriteLine($"a:{a} b:{b}");

      Method1(a, b, count);
      Method2(a, b, count);

      Method1(a, b, count);
      Method2(a, b, count);


    }

    private static void Method1(int a, int b, int count)
    {
      Console.WriteLine("Method1");
      DateTime start = DateTime.Now;
      for (int i = 1; i < count; i++)
      {
        int c = Math.Max(a, b);
        //if (i == 1) Console.Write($"{c} ");
      }
      Console.WriteLine($"time: { (DateTime.Now - start).TotalMilliseconds }");
    }

    private static void Method2(int a, int b, int count)
    {
      Console.WriteLine("Method2");
      DateTime start = DateTime.Now;
      for (int i = 1; i < count; i++)
      {
        int c = Convert.ToInt32((double)(((double)a + b + Math.Abs(a - b)) / 2.0));
        //if(i == 1) Console.Write($"{c} ");
      }
      Console.WriteLine($"time: { (DateTime.Now - start).TotalMilliseconds }");
    }
  }
}
