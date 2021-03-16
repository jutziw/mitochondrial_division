// NUCLEAR APOPTOSIS MARKER READOUT MACRO

//This macros is used to readout the fluorescence intensity of a nuclear targeted marker for apoptosis

//Written by Julius Winter 2020
//Used for the manuscript Kleele et al. 2021

// CODE STARTS BELOW



title = getTitle();
titleNoEx = File.nameWithoutExtension();
directory = File.directory();
run("Split Channels");
//selectWindow("C2-" + title);	//for 3 channel images where C2 is phase
//close(); 						//for 3 channel images where C2 is phase
selectWindow("C1-" + title);
//setAutoThreshold("Default dark");	//for confocal images
setAutoThreshold("Otsu dark");	//for images from downstairs
//run("Threshold...");
//setThreshold(63, 255);
setOption("BlackBackground", true);
run("Convert to Mask");
//run("Close");
run("Fill Holes");
run("Watershed");
//run("Analyze Particles...", "size=50-Infinity clear add"); 	//for images with correct scale
run("Analyze Particles...", "size=2000-Infinity pixel clear add");
//selectWindow("C3-" + title);	//for 3 channel images where C2 is phase
selectWindow("C2-" + title);	//for 2 channel images
roiManager("Measure");
saveAs("Results", directory + "Results_" + titleNoEx + ".csv");
roiManager("Save", directory + "RoiSet_" + titleNoEx + ".zip");
close("*");
selectWindow("Results");
run("Close");
selectWindow("ROI Manager");
run("Close");
