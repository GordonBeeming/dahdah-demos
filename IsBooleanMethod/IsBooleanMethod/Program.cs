using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace IsBooleanMethod
{
  class Program
  {
    static void Main(string[] args)
    {
      var summary = BenchmarkRunner.Run<Tests>();
    }
  }

  public class Tests
  {
    [Benchmark]
    public bool Null()
    {
      return IsBool(null);
    }

    [Benchmark]
    public bool False()
    {
      return IsBool("False");
    }

    [Benchmark]
    public bool True()
    {
      return IsBool("True");
    }

    [Benchmark]
    public bool FalseWithWhitespace()
    {
      return IsBool("False ");
    }

    [Benchmark]
    public bool TrueWithWhitespace()
    {
      return IsBool("True ");
    }

    private static bool IsBool(string input)
    {
      return bool.TryParse(input, out bool obj);
    }
  }
}