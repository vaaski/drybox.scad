include <BOSL2/std.scad>

use <strut.scad>

/* [main settings] */

some_var = 42;// [5:0.1:69]

// things below this won't show up in the customizer
module __Customizer_Limit__() {
}

// set quality, 64 for testing, 128 for rendering
$fn = $preview ? 64 : 128;

module round(roundness = 1) {
  offset(roundness)
    offset(-2 * roundness)
      offset(roundness)
        children();
}

xrot(-90)
  strut_test();