# tiny-c-projects-in-zig
Porting the programs in Tiny C Projects into Zig and looking for optimizations for it.

## Chpater Notes:

### Chapter 1:
To run:
1. Build in the chapter directory:
    - `cd projects/01_daily_greetings/` 
    - `zig build`
2. Run the code with a flag:
    - `./zig-out/bin/daily_greetings general Albert` // chapter 2.3.2
        - Output: `Good Evening Albert`
    - `./zig-out/bin/daily_greetings specific_time Albert` // chapter 2.3.3
        - Ouput:
        ```
        Greetings, Albert!
        Today is aug 2026, 6
        It is 22:20:54
        ```

*Implmented*:
- "General time of day" (2.3.2)
- "Adding specific time info"(2.3.3) 
- "The current moon phase" (2.4 - TODO)
- "A pithy saying" (2.5 - TODO)

#### Optimizations:
- Reducing Work
    - Memory References
    - Register Utilizations
- Machine Specific 
    - CPU Utilization
