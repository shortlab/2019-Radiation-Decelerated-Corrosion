macro "Set_Size_and_Crop" {
	getDimensions(width, height, channels, slices, frames);
	makeRectangle(0, 0, width, 23000); // height is 1mm coverted to pixels by scale
	run("Crop");
	run("Select None");
}
