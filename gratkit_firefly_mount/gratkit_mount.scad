x_distance = 41;
y_distance = 162;

holder_width = 10;
holder_height = 5;
holder_arm_length = 97;
holder_arm_width = 20;
holder_end_height = 20;
holder_end_thickness = 5;
holder_length = 223 + (holder_end_thickness * 2);

distance = (y_distance / 2) - (holder_arm_width / 2);

difference() {
    cube([holder_length, x_distance, holder_height], true);
    cube([y_distance - 2 * holder_width, x_distance / 2, holder_height + 5], true);
    
    translate([(y_distance / 2) + holder_width, 0, 0]){
        cube([holder_length - 4 * holder_width - y_distance, x_distance / 2, holder_height + 5], true);
    }
    
    mirror([1,0,0]) {
        translate([(y_distance / 2) + holder_width, 0, 0]){
            cube([holder_length - 4 * holder_width - y_distance, x_distance / 2, holder_height + 5], true);
        }
    }
}

module end_arm() {
    translate([(holder_length - holder_end_thickness) / 2, (x_distance / 2) - (holder_width / 2), holder_end_height / 2]){
        cube([holder_end_thickness, holder_width, holder_end_height], true);
    }
}

end_arm();
mirror([0,1,0]) { end_arm(); }

translate([-(holder_length - holder_end_thickness) / 2, 0, 10 / 2]){
        cube([holder_end_thickness, x_distance, 10], true);
    }

module holder_arm() {
    translate([distance, 0, 0]){
        cube([holder_arm_width, holder_arm_length + holder_end_thickness * 2, holder_height], true);
        
        translate([0, (holder_arm_length / 2) + (holder_end_thickness / 2), holder_end_height / 2]){
            cube([holder_arm_width, holder_end_thickness, holder_end_height], true);
        }
        
        translate([0, -(holder_arm_length / 2) - (holder_end_thickness / 2), holder_end_height / 2]){
            cube([holder_arm_width, holder_end_thickness, holder_end_height], true);
        }
        
    }
}

holder_arm();
mirror([1,0,0]) { holder_arm(); }