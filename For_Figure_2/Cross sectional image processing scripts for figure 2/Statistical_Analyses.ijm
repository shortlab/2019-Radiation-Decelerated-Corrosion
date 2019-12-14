macro "Statistical_Analyses" {
	run("Select None");
	getDimensions(width, height, channels, slices, frames);
	y_row = newArray(height);
	for (i=0; i<height; i+=1) {
		y_row[i] = i;
	}
	x_uncorroded = newArray(height);
	x_right_edge = newArray(height);
	x_ratio = newArray(height);
	for (j=0; j<height; j+=1) {
		temp_1 = 0;
		temp_2 = 255;
		for (i=0; i<width; i+=1) {
			temp_1 = getPixel(i,j);
			if (temp_1 == 255) {
				x_uncorroded[j] = i;
				i = width;
			}
		}
		for (k=width-1; k>0; k-=1) {
			temp_2 = getPixel(k,j);
			if (temp_2 == 0) {
				x_right_edge[j] = k+1;
				k = 0;
			}
		x_ratio[j] = 1-(x_uncorroded[j]/x_right_edge[j]);
		if(x_ratio[j]>0.99){
			x_ratio[j]=0;
		}
		}
		}
	Table.create("results");
	Table.setColumn("Row_by_Pixel", y_row);
	Table.setColumn("Uncorroded_Depth_by_Pixel", x_uncorroded);
	Table.setColumn("Thickness_by_Pixel", x_right_edge);
	Table.setColumn("Corrosion_Depth_Ratio", x_ratio);
	Table.update;
	saveAs("Results", "/Users/wyzhou/Desktop/results.csv");
}
