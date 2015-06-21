#Steps
##Step 1
	###Load libraries:
		a. data.table
		b. dplyr
		
##Step 2
	###Read below files:
		a. features.txt
		b. X_train.txt
		c. Y_train.txt
		d. subject_train.txt
		e. X_test.txt
		f. Y_test.txt
		g. subject_test.txt
			
##Step 3
	a. Construct "train" table from "X", "Y" and "Subject"
	b. Construct "test" table from "X", "Y" and "Subject"
	c. Construct "data" table by combining "train" and "test" data
	
##Step 4
	a. Rename "data" columns using "featuresVect"
	b. Decide the columns that to be kept
		1. Activity
		2. Subject
		3. Columns containing word "mean"
		4. Columns containing word "std"
	c. Filter "data" table to keep columns above

##Step 5
	###Map "Activity" values as follows:
		a. 1 -> WALKING
		b. 2 -> WALKING_UPSTAIRS
		c. 3 -> WALKING_DOWNSTAIRS
		d. 4 -> SITTING
		e. 5 -> STANDING
		f. 6 -> LAYING

		b. 
		c. 
		d. 
		e. 
		f. 