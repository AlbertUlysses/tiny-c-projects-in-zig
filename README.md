# tiny-c-projects-in-zig
Phase 1 (In progress):
Porting the programs in Tiny C Projects into Zig.

Phase 2 (TODO):
Use the codebase to work on optimization techniques.

## Chpater Notes:

### Chapter 1:

To build, run this command in the chapter directory:
    - `cd projects/01_daily_greetings/` 
    - `zig build`

To Run:
- "General time of day" (2.3.2)
    - `./zig-out/bin/daily_greetings general Albert` // chapter 2.3.2
        - Output: `Good Evening Albert`
- "Adding specific time info"(2.3.3) 
    - `./zig-out/bin/daily_greetings specific_time Albert` // chapter 2.3.3
        - Ouput:
        ```
        Greetings, Albert!
        Today is aug 2026, 6
        It is 22:20:54
        ```
- "The current moon phase" (2.4)
    - `./zig-out/bin/daily_greetings moon_phase Albert` // chapter 2.4
        - Ouput:
        ```
        Greetings, Albert!
        The moon is waxing crescent
        ```
*Implmented*:
- "A pithy saying" (2.5 - TODO)

#### Optimizations:
- Reducing Work
    - Memory References
    - Register Utilizations
- Machine Specific 
    - CPU Utilization
