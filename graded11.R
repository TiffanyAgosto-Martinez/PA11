# graded11.R
# Tiffany Agosto-Martinez
# 11/20/2026
# Analyze a linear relationship with a categorical predictor

# Create tibble using cyl (cylinders) and wt (weight) columns mtcars dataset
cars_tibble <- mtcars %>%
             as_tibble() %>%
             select(cyl, wt) %>%
             mutate(cyl = as.factor(cyl))

print(cars_tibble)
# Use lm function to fit a linear model to predict wt based on cyl (wt ~ cyl)
wt_model <- lm(wt ~ cyl, data = cars_tibble)

print(wt_model)

# Create a data grid from the tibble's cyl column & add predictions using grid
cars_grid <- cars_tibble %>%
       data_grid(cyl) %>%
       add_predictions(wt_model)

print(cars_grid)

# Plot original data and the predicted values
plot <- ggplot(cars_tibble, aes(cyl)) + 
      geom_point(aes(y = wt)) +
      geom_point(data = cars_grid, aes(y = pred),
                 colour = "red", size = 4)
print(plot)

# Provide an analysis of the results using commented lines

# This program analyzes the linear relationship between cyl (cylinders) and   
# vehicle weight (wt). The linear model fitted with the lm function shows that 
# there is a fairly positive relationship between the number of cyl (cylinders)
# and the vehicle weight (wt). In the plot we can see that as the number or  
# in other word the count of the cylinders increases from 4, 6, and to 8 seen   
# the predicted weight (the red on the X-axis as well. From the data provided 
# the 4-cylinder vehicle are dots on the plot) increases at a steady pace the   
# lightest (2.29k lbs),6-cylinder vehicles are in the middle (3.12k lbs), and 
# 8-cylinder vehicles are the heaviest (4.00k lbs). It can also be seen on
# the plot that 8-cylinder vehicles also show a wider vertical spread in    
# vehicle weights (shown as black dots). These black dots show that there
# variation so this model might not capture well and/or explain the variations
# in the relationship between cyl (cylinders) and the vehicle weight (wt).