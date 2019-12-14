macro "Straighten" {
	
	//run("Auto Threshold", "method=Huang2 white");
	//run("Make Binary");
	run("Select None");
	
	getDimensions(width, height, channels, slices, frames);
	y_row = newArray(height);
	x_left_edge = newArray(height);
	for (i=0; i<height; i+=1) {
		y_row[i] = i;
	} // Initialize the array for row numbers
	
	for (j=0; j<height; j+=1) {
		temp = 0;
		for (i=0; i<width; i+=1) {
			temp = getPixel(i,j);
			if (temp != 0) {
				x_left_edge[j] = i;
				i = width;
			}
		}
	}

	for (j=0; j<height; j+=1) {
		for (i=0; i<width; i+=1) {
			setPixel(i,j,getPixel((i+x_left_edge[j]),j));
		}
	}
}
