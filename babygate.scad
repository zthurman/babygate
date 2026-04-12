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
two_by_two_dim = 1.5;
two_by_four_x = 1.5;
two_by_four_y = 3.5;
four_by_four_x = 3.5;
four_by_four_y = 3.5;

// ===============================================
// Major Dimensions
// ===============================================

bottom_stair_support_length = 8.125;
bottom_support_length_latch_side = 19;
bottom_support_length_hinge_side = 16;
vertical_gate_support_height = 35.875;
gate_width = 32;
//stair_to_post_offset = 7;
stair_to_post_offset = 5.5;
post_to_gate_bar_offset = 2;

// ===============================================
// Dimensional Lumber Definitions
// ===============================================

module one_by_one(len_in) {
	color("#5d4037")
    cube([
        one_by_one_dim * mm_per_inch,
        one_by_one_dim * mm_per_inch,
        len_in * mm_per_inch
    ]);
}

module two_by_two(len_in) {
	color("#5d4037")
    cube([
        two_by_two_dim * mm_per_inch,
        two_by_two_dim * mm_per_inch,
        len_in * mm_per_inch
    ]);
}

module two_by_four(len_in) {
	color("#5d4037")
    cube([
        two_by_four_x * mm_per_inch, 
        two_by_four_y * mm_per_inch, 
        len_in * mm_per_inch
    ]);
}

module four_by_four(len_in) {
	color("#5d4037")
    cube([
        four_by_four_x * mm_per_inch, 
        four_by_four_y * mm_per_inch, 
        len_in * mm_per_inch
    ]);
}

// ===============================================
// Model Definitions
// ===============================================

module hinge_side_gate_support() {
	// Stair Support
	two_by_four(bottom_stair_support_length);

	// Support Base
	translate([
		two_by_four_x * mm_per_inch, 
		0, 
		bottom_stair_support_length*mm_per_inch
	])
		rotate([0, -90, 0])
		two_by_four(bottom_support_length_hinge_side);

	// Gate Support Post
	translate([
		- stair_to_post_offset * mm_per_inch,
		0,
		(bottom_stair_support_length + two_by_four_x) * mm_per_inch
	])
		rotate([0, 0, 90])
		four_by_four(vertical_gate_support_height);
	
	// Banister Wrap Fall Guard
	translate([
		- stair_to_post_offset * mm_per_inch,
		0,
		(bottom_stair_support_length + two_by_four_x) * mm_per_inch
	])
		rotate([90, 90, 0])
		two_by_four(4);
	
	// Stair Support Connector
	translate([
		0,
		two_by_four_y * mm_per_inch,
		two_by_four_y * mm_per_inch
	])
		rotate([-90, 0, 0])
		two_by_four(gate_width);
}

module gate_door() {
	// Gate Bottom
	translate([
		- (stair_to_post_offset + four_by_four_x) * mm_per_inch,
		two_by_four_y * mm_per_inch,
		(bottom_stair_support_length + four_by_four_x + two_by_four_x) * mm_per_inch
	])
		rotate([-90, 0, 0])
		two_by_four(gate_width);

	// Gate Top
	translate([
		- (stair_to_post_offset + four_by_four_x) * mm_per_inch,
		two_by_four_y * mm_per_inch,
		(bottom_stair_support_length + four_by_four_x + two_by_four_x + vertical_gate_support_height - two_by_four_y) * mm_per_inch
	])
		rotate([-90, 0, 0])
		two_by_four(gate_width);

	// Gate Hinge Side
	translate([
		- (stair_to_post_offset + four_by_four_x) * mm_per_inch,
		(four_by_four_y + four_by_four_x) * mm_per_inch,
		(bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - four_by_four_x) * mm_per_inch
	])
		rotate([-180, 0, 0])
		two_by_four((vertical_gate_support_height - two_by_four_y - two_by_four_y));

	// Gate Bar 1
	translate([
		- (stair_to_post_offset + post_to_gate_bar_offset) * mm_per_inch,
		(four_by_four_y + two_by_four_y + two_by_two_dim) * mm_per_inch,
		(bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - 1.75) * mm_per_inch
	])
		rotate([-180, 0, 0])
		two_by_two((vertical_gate_support_height - two_by_four_y));

	// Gate Bar 2
	translate([
		- (stair_to_post_offset + post_to_gate_bar_offset) * mm_per_inch,
		(four_by_four_y + two_by_four_y + 2 * two_by_two_dim + 2.42) * mm_per_inch,
		(bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - 1.75) * mm_per_inch
	])
		rotate([-180, 0, 0])
		two_by_two((vertical_gate_support_height - two_by_four_y));

	// Gate Bar 3
	translate([
		- (stair_to_post_offset + post_to_gate_bar_offset) * mm_per_inch,
		(four_by_four_y + two_by_four_y + 3 * two_by_two_dim + 2 * 2.42) * mm_per_inch,
		(bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - 1.75) * mm_per_inch
	])
		rotate([-180, 0, 0])
		two_by_two((vertical_gate_support_height - two_by_four_y));

	// Gate Bar 4
	translate([
		- (stair_to_post_offset + post_to_gate_bar_offset) * mm_per_inch,
		(four_by_four_y + two_by_four_y + 4 * two_by_two_dim + 3 * 2.42) * mm_per_inch,
		(bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - 1.75) * mm_per_inch
	])
		rotate([-180, 0, 0])
		two_by_two((vertical_gate_support_height - two_by_four_y));

	// Gate Bar 5
	translate([
		- (stair_to_post_offset + post_to_gate_bar_offset) * mm_per_inch,
		(four_by_four_y + two_by_four_y + 5 * two_by_two_dim + 4 * 2.42) * mm_per_inch,
		(bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - 1.75) * mm_per_inch
	])
		rotate([-180, 0, 0])
		two_by_two((vertical_gate_support_height - two_by_four_y));

	// Gate Bar 6
	translate([
		- (stair_to_post_offset + post_to_gate_bar_offset) * mm_per_inch,
		(four_by_four_y + two_by_four_y + 6 * two_by_two_dim + 5 * 2.42) * mm_per_inch,
		(bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - 1.75) * mm_per_inch
	])
		rotate([-180, 0, 0])
		two_by_two((vertical_gate_support_height - two_by_four_y));
	
	// Gate Bar 7
	translate([
		- (stair_to_post_offset + post_to_gate_bar_offset) * mm_per_inch,
		(four_by_four_y + two_by_four_y + 7 * two_by_two_dim + 6 * 2.42) * mm_per_inch,
		(bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - 1.75) * mm_per_inch
	])
		rotate([-180, 0, 0])
		two_by_two((vertical_gate_support_height - two_by_four_y));

	// Gate Latch Side
	translate([
		- (stair_to_post_offset + four_by_four_x) * mm_per_inch,
		(gate_width + four_by_four_y) * mm_per_inch,
		(bottom_stair_support_length + two_by_four_x + vertical_gate_support_height - four_by_four_x) * mm_per_inch
	])
		rotate([-180, 0, 0])
		two_by_four((vertical_gate_support_height - two_by_four_y - two_by_four_y));

	// Gate Diagonal (Runs bottom of hinge side to top of latch side)
	// I think that the moral of the story here is
	// that there have been a lot of years since trig
	// and I were intimate and I'm a noobcake at OpenSCAD
	hypotenuse = round(sqrt(pow(vertical_gate_support_height - 2*two_by_four_y, 2) + pow(gate_width - 2*two_by_four_y, 2)));
	angle = atan2(vertical_gate_support_height - 2*two_by_four_y, gate_width - 2*two_by_four_y);
	other_angle = 90 - angle;
	rotate([-other_angle, 0, 0])
		translate([
			- (stair_to_post_offset + four_by_four_x) * mm_per_inch,
			- (two_by_four_y + two_by_four_x) * mm_per_inch,
			(bottom_stair_support_length + two_by_four_x + two_by_four_y + two_by_four_x) * mm_per_inch
		])
		two_by_four(hypotenuse);
}

// ===============================================
// Latch Side Gate Support

module latch_side_gate_support() {
	// Stair Support
	translate([
		0,
		two_by_four_x + (gate_width + two_by_four_y) * mm_per_inch,
		0
	])
		two_by_four(bottom_stair_support_length);

	// Support Base
	translate([
		two_by_four_x * mm_per_inch, 
		two_by_four_x + (gate_width + two_by_four_y) *mm_per_inch, 
		bottom_stair_support_length*mm_per_inch
	])
		rotate([0, -90, 0])
		two_by_four(bottom_support_length_latch_side);

	// Gate Support Post
	translate([
		- stair_to_post_offset * mm_per_inch,
		two_by_four_x + (gate_width + two_by_four_y) *mm_per_inch, 
		(bottom_stair_support_length + two_by_four_x) * mm_per_inch
	])
		rotate([0, 0, 90])
		four_by_four(vertical_gate_support_height);
}

// ===============================================
// Model Specification
// ===============================================

latch_side_gate_support();
gate_door();
hinge_side_gate_support();
