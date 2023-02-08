# Intermédiaire = prédire la conso elec sur les données batiments  => R

# encoder les variables quali puis imputer avec mice


setwd("/home/nathan/fac/m1/s2/dataDay/predictionConsoElec")
file <- 'Electricity_dataset_train.csv'
elec <- read.csv(file, header=TRUE)
elec[elec == " "] <- NA # remplace "?" par NA

# ==== Encoder ====
one_hot_encoder = 

library(caret)
#define one-hot encoding function
dummy <- dummyVars(" ~ .", data=elec)
print(dummy)
final_df <- data.frame(predict(dummy, newdata=elec))




# ==== Mice Imputing ====
library("mice")

elec$primary_use <- as.numeric(factor(elec$primary_use))

data$Variable <- as.factor(data$Variable)
newdata <- one_hot(as.data.table(data))


for (i in colnames(elec)){ 
  # On transforme les données
  if(elec[[i]][is.character(elec[[i]])]){
    
  }else{
    elec[[i]][is.na(elec[[i]])] <- mean(elec[[i]], na.rm = T)
  }
  #elec[[i]] <- as.numeric(elec[[i]]) # OK
  # on remplace par la moyenne de la colonne, en omettant les valeurs Na de la colonne ?
}

sum(is.na(elec))
cor(elec)



# ==== STEPWISE ====

full.model <- lm(meter_reading ~ .,data = elec)
step.model <- stepAIC(full.model, direction = "both", trace = TRUE)
summary(step.model)

colSums(is.na(elec))/length(elec$index)*100



