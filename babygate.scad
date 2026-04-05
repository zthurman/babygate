// ====================
// Unit Conversion Factors
// ====================

mm_per_inch = 25.4;
two_by_four_x = 1.5;
two_by_four_y = 3.5;
four_by_four_x = 3.5;
four_by_four_y = 3.5;

// ===============
// Major Dimensions
// ===============

bottom_stair_support_length = 8.125;
bottom_support_length = 24;
vertical_gate_support_height = 35.875;
gate_width = 32;

// =================
// Function Definitions
// =================

module two_by_four(len_in) {
    cube([
        two_by_four_x * mm_per_inch, 
        two_by_four_y * mm_per_inch, 
        len_in * mm_per_inch
    ]);
}

module four_by_four(len_in) {
    cube([
        four_by_four_x * mm_per_inch, 
        four_by_four_y * mm_per_inch, 
        len_in * mm_per_inch
    ]);
}

// ===============
// Model Definitions
// ===============

// Left Support Structure
two_by_four(bottom_stair_support_length);
translate([
    two_by_four_x * mm_per_inch, 
    0, 
    bottom_stair_support_length*mm_per_inch
])
    rotate([0, -90, 0])
    two_by_four(bottom_support_length);
translate([
    - 7 * mm_per_inch,
    0,
    (bottom_stair_support_length + two_by_four_x) * mm_per_inch
])
    rotate([0, 0, 90])
    four_by_four(vertical_gate_support_height);

// Right Support Structure
translate([0, 1.5 + (gate_width*mm_per_inch), 0])
    two_by_four(bottom_stair_support_length);
translate([
    two_by_four_x * mm_per_inch, 
    1.5 + (gate_width*mm_per_inch), 
    bottom_stair_support_length*mm_per_inch
])
    rotate([0, -90, 0])
    two_by_four(bottom_support_length);
translate([
    - 7 * mm_per_inch,
    1.5 + (gate_width*mm_per_inch), 
    (bottom_stair_support_length + two_by_four_x) * mm_per_inch
])
    rotate([0, 0, 90])
    four_by_four(vertical_gate_support_height);
