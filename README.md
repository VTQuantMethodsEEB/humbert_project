# humbert_project
Humbert's Project. What's in it? Who knows.... Definitely not nuclear codes.
  *******Description*********



Tanner Humbert: 1/26/2024 

  Northern Flying Squirrel habitat model data
  
  This data was collected in 2017 in a study to determine the physical variables to make a Virginia Northern Flying Squirrel’s habitat. This was done by setting out nesting boxes in various locations, putting telemetry collars on squirrels, and overlaying random points across the Monongahela National Forest in West Virginia. Al all these points landform and forest structure variables were collected and then used to tease out the variables the squirrels were choosing for by comparing the structure of from of the squirrel plots to the random plots. As the data set is now, all the non-selected variables have been removed, and what remains is the making of the model. The remains are the making of the model. My advisors wish to overlay a canopy model from other data sources onto this model as well as compare how our model predicts squirrel selection when applied to ancillary data sources (NLCD, land fire, TNC, and the MNF database). I would like to use this data to add canopy heights to the habitat model and explore comparing snag densities between random and squirrel points.  It would be nice to do this in throughout the class but if I learn R I will have gotten my money’s worth.
  
##WEEK 1##
CODE: ex1_intro_to_R_Humbert.R
DATA: vnfs_treemap.csv

This week we set up git and explored my data.


##WEEK 2##
CODE: le2_data_manipulation_Humbert.R 
DATA: vnfs_treemap.csv

This Week I manipulated my data following along with the lecture script.

##WEEk 3##
CODE: week3_tannerhumbert.R
DATA: vnfs_treemap.csv

This week I played with ggplot2 and set box plots up to look at some relationships in my data.

##WEEK 4##

No homework this week we spent time learning sataistical philosophy and working on our graphs

##WEEK 5##
CODE: loop_week6.R
DATA: vnfs_treemap.csv

This week and into week 6 we working on testing our hypothosises by making a for loop and doing t-test.

##WEEK 6##
CODE: loop_week6.R
DATA: vnfs_treemap.csv

This week i finished making my for loop test and ran many logistic regressions.

##WEEK 7##
CODE: week_7&8_hw.R
DATA: vnfs_treemap.csv

This week I ran a linear model of the comparison between Basal area and elevation. We found that there is a positive linear correlation between basal area and elevation and this test fit all the assumptions. 

##WEEK 8##
CODE: week_7&8_hw.R
DATA: vnfs_treemap.csv

This week I ran an interactive model and additive model of the comparison between forest type and stand height, testing the ability to predict squirrel presence  We found that there is an interaction between forest type and stand height. Squirrels were most present in spruce and other confifer stands between 25 and 50 ft tall. 

##WEEK 10&11##
CODE: week_10&11_glm.R
DATA: vnfs_treemap.csv

This week I tested adding 2 forest structure variables to a land form habitat model of Northern flying squirrel habitat. To do this I made 4 GLMS including the accepted model, the same model with the addition of stand height, the same original model with the addition of basal area, and the original model with the inclusion of both variables. To test which was best fit I ran a likelihood ration test to find the model with best significance and I ran the AIC of all models to find the more predictive model with the most parsimony. The model that included all variables was the most significant and the most parsimonious. 

##FINAL PRESENTATION##
CODE: week_10&11_glm.R & week_7&8_hw.R
DATA: vnfs_treemap.csv

I made my presentation using both the codes listed above! 




