// ===============================================
// baby gate
// ===============================================
// This is a simplistic design for an attempt at a
// free standing, non-pressure fit baby gate to
// sit at the top of a set of stairs.
// ===============================================

// ===============================================
// Unit Conversion Factors
// ===============================================

mm_per_inch = 25.4;
one_by_one_dim = 0.75;
two_by_four_x = 1.5;
two_by_four_y = 3.5;
four_by_four_x = 3.5;
four_by_four_y = 3.5;

// ===============================================
// Major Dimensions
// ===============================================

bottom_stair_support_length = 8.125; bottom_support_length = 24;
vertical_gate_support_height = 35.875;
gate_width = 32;

// ===============================================
// Function Definitions
// ===============================================

module one_by_one(len_in) {
    cube([
        one_by_one_dim * mm_per_inch,
        one_by_one_dim * mm_per_inch,
        len_in * mm_per_inch
    ]);
}

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

// ===============================================
// Model Definitions
// ===============================================

// Left Gate Support
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

// Gate Door
translate([
    - (7 + four_by_four_x) * mm_per_inch,
    two_by_four_y * mm_per_inch,
    (bottom_stair_support_length + four_by_four_x + two_by_four_x) * mm_per_inch
])
	rotate([-90, 0, 0])
	two_by_four(gate_width);
translate([
    - (7 + four_by_four_x) * mm_per_inch,
    two_by_four_y * mm_per_inch,
    (bottom_stair_support_length + four_by_four_x + two_by_four_x + vertical_gate_support_height - two_by_four_y) * mm_per_inch
])
	rotate([-90, 0, 0])
	two_by_four(gate_width);
translate([
    - (7 + four_by_four_x) * mm_per_inch,
    (four_by_four_y + four_by_four_x) * mm_per_inch,
    (bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - four_by_four_x) * mm_per_inch
])
	rotate([-180, 0, 0])
	two_by_four((vertical_gate_support_height - two_by_four_y - two_by_four_y));
translate([
    - (7 + four_by_four_x) * mm_per_inch,
    (gate_width + four_by_four_y) * mm_per_inch,
    (bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - four_by_four_x) * mm_per_inch
])
	rotate([-180, 0, 0])
	two_by_four((vertical_gate_support_height - two_by_four_y - two_by_four_y));
// I think that the moral of the story here is
// that there have been a lot of years since trig
// and I were intimate
rotate([-38.107, 0, 0])
	translate([
		- (7 + four_by_four_x) * mm_per_inch,
		- (two_by_four_y) * mm_per_inch,
		(bottom_stair_support_length + two_by_four_x + two_by_four_y) * mm_per_inch
	])
	two_by_four(40.51);

// Right Gate Support
translate([
	0,
	two_by_four_x + (gate_width + two_by_four_y) * mm_per_inch,
	0
])
    two_by_four(bottom_stair_support_length);
translate([
    two_by_four_x * mm_per_inch, 
    two_by_four_x + (gate_width + two_by_four_y) *mm_per_inch, 
    bottom_stair_support_length*mm_per_inch
])
    rotate([0, -90, 0])
    two_by_four(bottom_support_length);
translate([
    - 7 * mm_per_inch,
    two_by_four_x + (gate_width + two_by_four_y) *mm_per_inch, 
    (bottom_stair_support_length + two_by_four_x) * mm_per_inch
])
    rotate([0, 0, 90])
    four_by_four(vertical_gate_support_height);
