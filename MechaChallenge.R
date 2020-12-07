#Deliverable 1:
library(dplyr)
library(ggplot2)
MechaCar_table <- read.csv(file="MechaCar_mpg.csv",check.names=F,stringsAsFactors = F)

mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_table)
summary(mecha_lm)

y_veh_len <- mecha_lm$coefficients['vehicle_length']*MechaCar_table$vehicle_length + mecha_lm$coefficients['(Intercept)']
plt <- ggplot(MechaCar_table,aes(x=vehicle_length,y=mpg))

plt + geom_point() + geom_line(aes(y=y_veh_len), color="blue") 

y_gr_cl <- mecha_lm$coefficients['ground_clearance']*MechaCar_table$ground_clearance + mecha_lm$coefficients['(Intercept)']
plt <- ggplot(MechaCar_table,aes(x=ground_clearance,y=mpg))

plt + geom_point() + geom_line(aes(y=y_gr_cl), color="red") 


#Deliverable 2:
Suspension_table <- read.csv(file="Suspension_Coil.csv",check.names=F,stringsAsFactors = F)
total_summary <- Suspension_table %>% summarize(Mean=mean(PSI),Median=median(PSI),VAR=var(PSI),SD=sd(PSI)) 
lot_summary <- Suspension_table  %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),VAR=var(PSI),SD=sd(PSI), .groups = 'keep') 

#Deliverable 3:

plot(density(Suspension_table$PSI)) # check to see if it's normal distribution

t.test(Suspension_table$PSI,mu=mean(Suspension_table$PSI)) #compare sample versus population means

t.test(Suspension_table$PSI, subset = Suspension_table[Suspension_table$Manufacturing_Lot=='Lot1',],mu=mean(Suspension_table$PSI))
t.test(Suspension_table$PSI, subset = Suspension_table[Suspension_table$Manufacturing_Lot=='Lot2',],mu=mean(Suspension_table$PSI))
t.test(Suspension_table$PSI, subset = Suspension_table[Suspension_table$Manufacturing_Lot=='Lot3',],mu=mean(Suspension_table$PSI))



