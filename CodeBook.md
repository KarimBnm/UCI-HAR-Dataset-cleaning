## CodeBook of the Tidy Data

This dataset is a cleaned version of the UCI HAR Dataset. A description of the original dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables of the Tidy Data

The tidy dataset consists of 11880 observations and 4 variables.

The variables are :

- subjects (numeric) : individuals numbered from 1 to 30
- activity (categorical) : types of activities (LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS)
- measurement (categorical) : types of measures (66 different measures, see below)
- mean (numeric) : the mean associated with the measurement

The measures are :

 [1] "body-acceleration-jerk-magnitude.mean..-frequency"
 [2] "body-acceleration-jerk-magnitude.mean..-time"     
 [3] "body-acceleration-jerk-magnitude.std..-frequency" 
 [4] "body-acceleration-jerk-magnitude.std..-time"      
 [5] "body-acceleration-jerk.mean...x-frequency"        
 [6] "body-acceleration-jerk.mean...x-time"             
 [7] "body-acceleration-jerk.mean...y-frequency"        
 [8] "body-acceleration-jerk.mean...y-time"             
 [9] "body-acceleration-jerk.mean...z-frequency"        
[10] "body-acceleration-jerk.mean...z-time"             
[11] "body-acceleration-jerk.std...x-frequency"         
[12] "body-acceleration-jerk.std...x-time"              
[13] "body-acceleration-jerk.std...y-frequency"         
[14] "body-acceleration-jerk.std...y-time"              
[15] "body-acceleration-jerk.std...z-frequency"         
[16] "body-acceleration-jerk.std...z-time"              
[17] "body-acceleration-magnitude.mean..-frequency"     
[18] "body-acceleration-magnitude.mean..-time"          
[19] "body-acceleration-magnitude.std..-frequency"      
[20] "body-acceleration-magnitude.std..-time"           
[21] "body-acceleration.mean...x-frequency"             
[22] "body-acceleration.mean...x-time"                  
[23] "body-acceleration.mean...y-frequency"             
[24] "body-acceleration.mean...y-time"                  
[25] "body-acceleration.mean...z-frequency"             
[26] "body-acceleration.mean...z-time"                  
[27] "body-acceleration.std...x-frequency"              
[28] "body-acceleration.std...x-time"                   
[29] "body-acceleration.std...y-frequency"              
[30] "body-acceleration.std...y-time"                   
[31] "body-acceleration.std...z-frequency"              
[32] "body-acceleration.std...z-time"                   
[33] "body-gyro-jerk-magnitude.mean..-frequency"        
[34] "body-gyro-jerk-magnitude.mean..-time"             
[35] "body-gyro-jerk-magnitude.std..-frequency"         
[36] "body-gyro-jerk-magnitude.std..-time"              
[37] "body-gyro-jerk.mean...x-time"                     
[38] "body-gyro-jerk.mean...y-time"                     
[39] "body-gyro-jerk.mean...z-time"                     
[40] "body-gyro-jerk.std...x-time"                      
[41] "body-gyro-jerk.std...y-time"                      
[42] "body-gyro-jerk.std...z-time"                      
[43] "body-gyro-magnitude.mean..-frequency"             
[44] "body-gyro-magnitude.mean..-time"                  
[45] "body-gyro-magnitude.std..-frequency"              
[46] "body-gyro-magnitude.std..-time"                   
[47] "body-gyro.mean...x-frequency"                     
[48] "body-gyro.mean...x-time"                          
[49] "body-gyro.mean...y-frequency"                     
[50] "body-gyro.mean...y-time"                          
[51] "body-gyro.mean...z-frequency"                     
[52] "body-gyro.mean...z-time"                          
[53] "body-gyro.std...x-frequency"                      
[54] "body-gyro.std...x-time"                           
[55] "body-gyro.std...y-frequency"                      
[56] "body-gyro.std...y-time"                           
[57] "body-gyro.std...z-frequency"                      
[58] "body-gyro.std...z-time"                           
[59] "gravity-acceleration-magnitude.mean..-time"       
[60] "gravity-acceleration-magnitude.std..-time"        
[61] "gravity-acceleration.mean...x-time"               
[62] "gravity-acceleration.mean...y-time"               
[63] "gravity-acceleration.mean...z-time"               
[64] "gravity-acceleration.std...x-time"                
[65] "gravity-acceleration.std...y-time"                
[66] "gravity-acceleration.std...z-time" 

## Transformation of the data

Several transformation were made :

- merging of the training set, the test set, the activity and subject variables from the original .txt files (see "data_set")
- extracting from "data_set" the mean and std variation for each measurement 
- replace the activity_code by its label
- rename the measurement variables using the gsub() function ((see "data_set2")
- create the Tidy_data using the group_by, summarize and gather functions from the dplyr and tidyr packages.
 
You can view the output using the following code and appropriate files in this repo:
```R Source(run.analysis.R)
tidy_data <- data.table(tidy_data.txt)```


