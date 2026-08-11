const std = @import("std");

pub fn moon_phase(year: u16, month: u4, day: u9) []const u8 {
    const phase = [_][]const u8{ "waxing crescent", "at first quarter", "waxing gibbous", "full", "waning gibbous", "at last quarter", "waning crescent", "new" };
    var d: f32 = day;
    const y: f32 = year;
    const m: f32 = month;
    if (m == 2.0) {
        d += 31.0;
    }
    d += 59.0 + (m - 3.0) * 30.6 + 0.5;
    const g = @mod((y - 1990.0), 19.0);
    var e = @mod((11.0 * g + 29.0), 30.0);
    if ((e == 25.0) | (e == 24.0)) {
        e += 1;
    }
    const mp = (@mod((((e + d) * 6.0 + 5.0) , 177.0)) / 22.0 & 7.0);
    return phase[mp];
}
