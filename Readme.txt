This .txt explains line by line how the script accomplish each point requested in the assignment.
The final dataset shows the mean of each parameter for the observations belonging to each subject and activity.
Dimensions 180x563 - 30 subjects, 6 activities, and 561 parameters

Line 1 - Reads in a table "dfvariables" the content of the file features.txt. 
	 The result is a table of 561 observations of 2 variables.
	 Each observation refers to every parameter observed in train and test tables.
Line 2 - Cnames is the column extracted from dfvariables which will be used to name the variables of the parameters. [1,561]
Line 3 - Reads in a table the content of the activities developed and the number assigned to each one. "dflabels" [6,2]
Line 5 - Reads in a table the content of X_test.txt "dftest1" [2947,563]
Line 6 - Reads in a table the content of Y_test.txt "dfytest1" [2947,1]
Line 7 - Reads in a table the content of subject_test.txt which identifies the subject for each observation. "dfsubtest1" [2947,1]
Line 8 - Binds for each observation: subject + activity + parameters (results from line 7,6,5). "dftest" [2947,563]
Line 9 - Sets column names. Parameters are named as the result from Line 2.
Line 11 to Line 15 - The same treatment is applied to train tables resulting in a table "dftrain" [7352,563]
Line 17 - Binds both tables "dftest" and "dftrain" in a single one "dftotal" which dimensions are the sum of both,
          mantaining the number of columns. "dftotal" [10299,563]. THIS IS THE RESULT OF POINT 1 
Line 18 - In the resulting table, it is replaced the number of the activity by its name using dflabels (from Line3).
          The result is a table "dftotallabel" [10299,563] 
Line 19 - From the datatable already binded and labeled, all the parameters including words "mean" and "std" are selected (88 in total).
	  The result is a table "dftotalmeanstd" [10299,88] THIS IS THE RESULT OF POINT 2
	  POINT 3 IS ALREADY SOLVED given we are working with the activities descritively named since Line 18
	  POINT 4 IS ALREADY SOLVED given we are working with parameters correctly labeled since Line 9.
Line 21 - To create the average of each variable for each activity and each subject, first we have grouped by these 2 parameters.
	  The result is "table_grouped" [10299,88] containing 180 groups with matches with the number of subjects and activities (30x6)
Line 23 - To get the average of each parameter, we have used summarize_all. The result is a tidy dataset meeting POINT 5 of the assignment.
	  
