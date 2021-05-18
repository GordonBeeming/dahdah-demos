# Testing IsBoolean

Sample code for blog post https://gordonbeeming.xyz/blogs/dev/2017/12/benchmarkdotnet-isboolean-method.

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

|              Method |       Mean |     Error |    StdDev |
|-------------------- |-----------:|----------:|----------:|
|                Null |  0.0000 ns | 0.0000 ns | 0.0000 ns |
|               False |  9.0616 ns | 0.0207 ns | 0.0194 ns |
|                True |  8.6536 ns | 0.0129 ns | 0.0121 ns |
| FalseWithWhitespace | 21.5848 ns | 0.0298 ns | 0.0279 ns |
|  TrueWithWhitespace | 21.6004 ns | 0.0244 ns | 0.0228 ns |

    Outliers
      Tests.Null: Default -> 2 outliers were removed (1.51 ns, 1.51 ns)

[view code](IsBooleanMethod/Program.cs)

