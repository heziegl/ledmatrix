// spacer grid for led matrix panels

raster_num_x        = 32;   // number of x pixels
raster_num_y        = 16;   // number of y pixels
raster_size         = 8;    // raster size if led matrix

strut_width         = 0.8;  // width of (single) struts
strut_height        = 8;    // hight of the struts/matrix
strutBorder_height  = 10.4; // hight of the struts/matrix

borderStrut = true;         // add border


rotate ([0, 0, 0])


// Panel
color("black", alpha = 0.6) { 
    //translate ([0, 0, -10])
    //cube (size=[raster_size*raster_num_x, raster_size*raster_num_y, 10]);
}

// Glas
color("blue", alpha = 0.2) { 
    //translate ([0, 0, strut_height])
    //cube (size=[raster_size*raster_num_x, raster_size*raster_num_y, 3]);
}


for (i = [0:raster_num_y]) {
    if (borderStrut || i != 0 ) {
        translate ([i==0 ? - (strut_width/2) : 0, 
                    raster_size * i - (strut_width/2), 
                    0])
        cube (size=[i==0 ? raster_size*raster_num_x+strut_width : raster_size*raster_num_x, 
                    strut_width/2, 
                    i==0 ? strutBorder_height : strut_height]);
    }

    if (borderStrut || i != raster_num_y) {
        translate ([i==raster_num_y ? - (strut_width/2) : 0, 
                    raster_size * i , 
                    0])
        
        cube (size=[i==raster_num_y ? raster_size*raster_num_x+strut_width : raster_size*raster_num_x, 
                    strut_width/2, 
                    i==raster_num_y ? strutBorder_height : strut_height]);
    }    
}

for (i = [0:raster_num_x]) {
    if (borderStrut || i != 0) {
        translate ([raster_size * i - (strut_width/2), 0, 0])
        cube (size=[strut_width/2, 
                    raster_size*raster_num_y, 
                    i==0 ? strutBorder_height : strut_height]);
    }
    
    if (borderStrut || i != raster_num_x) {
        translate ([raster_size * i , 0, 0])
        cube (size=[strut_width/2, 
                    raster_size*raster_num_y, 
                    i==raster_num_x ? strutBorder_height : strut_height]);
    }    
}
