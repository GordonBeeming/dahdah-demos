# C# way of Math.Max or maths way

As an example to post to https://stackoverflow.com/questions/66088627/is-there-any-benefit-to-cs-math-max-implementation-vs-doing-it-mathemathical.

| | |
|---|---|
|  Mean   | Arithmetic mean of all measurements |
|  Error  | Half of 99.9% confidence interval |
|  StdDev | Standard deviation of all measurements |
|  1 ns   | 1 Nanosecond (0.000000001 sec) |

    BenchmarkDotNet=v0.12.1, OS=Windows 10.0.19042
    Intel Core i5-9400F CPU 2.90GHz (Coffee Lake), 1 CPU, 6 logical and 6 physical cores
    .NET Core SDK=5.0.200-preview.20614.14
      [Host]     : .NET Core 3.1.11 (CoreCLR 4.700.20.56602, CoreFX 4.700.20.56604), X64 RyuJIT
      DefaultJob : .NET Core 3.1.11 (CoreCLR 4.700.20.56602, CoreFX 4.700.20.56604), X64 RyuJIT

|          Method |      Mean |     Error |    StdDev |
|---------------- |----------:|----------:|----------:|
|       CSharpWay | 0.0223 ns | 0.0025 ns | 0.0024 ns |
|        MathsWay | 0.0453 ns | 0.0018 ns | 0.0017 ns |
| MathsWayWithFix | 3.5089 ns | 0.0044 ns | 0.0039 ns |

    Outliers
      Tests.MathsWayWithFix: Default -> 1 outlier  was  removed (5.06 ns)

[view code](TestMaxValue/Program.cs)

