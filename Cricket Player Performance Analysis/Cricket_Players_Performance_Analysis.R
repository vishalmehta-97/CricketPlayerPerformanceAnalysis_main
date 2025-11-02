# Install required packages (run once)
# install.packages("dplyr")
# install.packages("tibble")

getwd()

# Load packages
library(dplyr)  # For data manipulation
library(tibble) # For glimpse() function

cat("========================================\n")
cat("CRICKET PLAYERS PERFORMANCE ANALYSIS\n")
cat("========================================\n\n")

# Load the cricket dataset
cricket <- read.csv("cricket_players_performance.csv")
cat("=== Dataset Loaded Successfully ===\n\n")

# Display first few rows
cat("First 5 players:\n")
print(head(cricket, 5))
cat("\n")



# 1. Calculate Runs per Match
cricket$Runs_Per_Match <- round(cricket$Runs_Scored / cricket$Matches_Played, 2)

cat("=== Arithmetic Operation 1: RUNS PER MATCH ===\n")
cat("Formula: Runs per Match = Total Runs / Matches Played\n")
cat("Sample values:\n")
print(head(cricket[, c("Player_Name", "Runs_Scored", "Matches_Played", "Runs_Per_Match")], 5))
cat("\n")

# 2. Calculate Wickets per Match
cricket$Wickets_Per_Match <- round(cricket$Wickets_Taken / cricket$Matches_Played, 2)

cat("=== Arithmetic Operation 2: WICKETS PER MATCH ===\n")
cat("Formula: Wickets per Match = Total Wickets / Matches Played\n")
cat("Sample values:\n")
print(head(cricket[, c("Player_Name", "Wickets_Taken", "Matches_Played", "Wickets_Per_Match")], 5))
cat("\n")

# 3. Calculate Overall Performance Score
cricket$Overall_Score <- round((cricket$Runs_Scored/100) + (cricket$Wickets_Taken*5) + 
                               (cricket$Catches_Taken*2) + (cricket$Man_of_Match_Awards*10), 2)

cat("=== Arithmetic Operation 3: OVERALL PERFORMANCE SCORE ===\n")
cat("Formula: Score = (Runs/100) + (Wickets×5) + (Catches×2) + (MOM×10)\n")
cat("Sample values:\n")
print(head(cricket[, c("Player_Name", "Runs_Scored", "Wickets_Taken", "Overall_Score")], 5))
cat("\n")



cat("=== MATHEMATICAL FUNCTIONS ON BATTING AVERAGE ===\n\n")

# Mean Batting Average
mean_avg <- mean(cricket$Batting_Average)
cat("Mean Batting Average:", round(mean_avg, 2), "\n")

# Median Batting Average
median_avg <- median(cricket$Batting_Average)
cat("Median Batting Average:", round(median_avg, 2), "\n")

# Standard deviation
sd_avg <- sd(cricket$Batting_Average)
cat("Standard Deviation:", round(sd_avg, 2), "\n")

# Variance
var_avg <- var(cricket$Batting_Average)
cat("Variance:", round(var_avg, 2), "\n")

# Minimum and Maximum
min_avg <- min(cricket$Batting_Average)
max_avg <- max(cricket$Batting_Average)
cat("Minimum Batting Average:", min_avg, "\n")
cat("Maximum Batting Average:", max_avg, "\n")

# Range
range_avg <- max_avg - min_avg
cat("Batting Average Range:", range_avg, "\n")

# Quantiles
quantiles_avg <- quantile(cricket$Batting_Average, probs = c(0.25, 0.5, 0.75))
cat("\nBatting Average Quantiles:\n")
print(quantiles_avg)
cat("\n")

# Sum of all runs
total_runs <- sum(cricket$Runs_Scored)
cat("Total Runs by All Players:", total_runs, "\n")

# Sum of all wickets
total_wickets <- sum(cricket$Wickets_Taken)
cat("Total Wickets by All Players:", total_wickets, "\n")

# Square root of average strike rate
avg_sr <- mean(cricket$Strike_Rate)
sqrt_sr <- sqrt(avg_sr)
cat("\nAverage Strike Rate:", round(avg_sr, 2), "\n")
cat("Square Root of Avg Strike Rate:", round(sqrt_sr, 2), "\n")

# Absolute value example
cricket$Strike_Rate_Deviation <- abs(cricket$Strike_Rate - avg_sr)
cat("\nAbsolute deviation from average strike rate (first 5):\n")
print(head(cricket[, c("Player_Name", "Strike_Rate", "Strike_Rate_Deviation")], 5))
cat("\n")

# Logarithm of runs
cricket$Log_Runs <- round(log(cricket$Runs_Scored + 1), 2)
cat("Logarithm of runs (first 5):\n")
print(head(cricket[, c("Player_Name", "Runs_Scored", "Log_Runs")], 5))
cat("\n")

# =====================================================================
# DISPLAY DIMENSIONS AND STRUCTURE
# =====================================================================

# Display dimensions using dim()
cat("Dataset Dimensions using dim():\n")
dimensions <- dim(cricket)
cat("Rows (Players):", dimensions[1], "\n")
cat("Columns (Variables):", dimensions[2], "\n\n")

# Display structure using glimpse()
cat("Dataset Structure using glimpse():\n")
glimpse(cricket)
cat("\n")

# Additional structure information
cat("Column names:\n")
print(colnames(cricket))
cat("\n")

cat("Data types:\n")
print(sapply(cricket, class))
cat("\n")


# Create a vector of top performers (Overall_Score >= 1500)
top_performers <- cricket[cricket$Overall_Score >= 1500, ]
cat("Number of Top Performers (Score >= 1500):", nrow(top_performers), "\n")
cat("Top 5 Performers:\n")
print(head(top_performers[, c("Player_Name", "Player_Type", "Overall_Score")], 5))
cat("\n")

# Create a subset of batsmen
batsmen <- cricket[cricket$Player_Type == "Batsman", ]
cat("Number of Batsmen:", nrow(batsmen), "\n")
cat("Average Runs by Batsmen:", round(mean(batsmen$Runs_Scored), 2), "\n\n")

# Create team-wise summary object
team_summary <- cricket %>%
  group_by(Team) %>%
  summarise(
    Player_Count = n(),
    Avg_Batting_Average = mean(Batting_Average),
    Total_Runs = sum(Runs_Scored),
    Total_Wickets = sum(Wickets_Taken),
    Avg_Performance = mean(Performance_Rating)
  ) %>%
  arrange(desc(Total_Runs))

cat("Team-wise Summary:\n")
print(team_summary)
cat("\n")

# Create a new data frame with top run scorers
top_run_scorers <- data.frame(
  Rank = 1:10,
  Player_Name = head(cricket[order(-cricket$Runs_Scored), "Player_Name"], 10),
  Team = head(cricket[order(-cricket$Runs_Scored), "Team"], 10),
  Runs = head(cricket[order(-cricket$Runs_Scored), "Runs_Scored"], 10),
  Average = head(cricket[order(-cricket$Runs_Scored), "Batting_Average"], 10)
)

cat("Top 10 Run Scorers (Custom Data Frame):\n")
print(top_run_scorers)
cat("\n")

# Get structure of the new data frame
cat("Structure of Top Run Scorers Data Frame:\n")
str(top_run_scorers)
cat("\n")


# Loop 1: Average runs by player type
cat("=== Average Runs by Player Type (Using Loop) ===\n")
player_types <- unique(cricket$Player_Type)

for (type in player_types) {
  type_data <- cricket[cricket$Player_Type == type, ]
  avg_runs <- mean(type_data$Runs_Scored)
  cat(type, ":", round(avg_runs, 2), "runs\n")
}
cat("\n")

# Loop 2: Count players by age groups
cat("=== Players Count by Age Groups (Using Loop) ===\n")
age_groups <- list(
  "20-25" = c(20, 25),
  "26-30" = c(26, 30),
  "31-35" = c(31, 35),
  "36-40" = c(36, 40)
)

for (group_name in names(age_groups)) {
  age_range <- age_groups[[group_name]]
  count <- sum(cricket$Age >= age_range[1] & cricket$Age <= age_range[2])
  cat("Age", group_name, ":", count, "players\n")
}
cat("\n")

# Loop 3: Performance statistics by team
cat("=== Top 3 Teams by Total Runs (Using Loop) ===\n")
teams <- unique(cricket$Team)
team_runs <- numeric(length(teams))
names(team_runs) <- teams

for (i in 1:length(teams)) {
  team_data <- cricket[cricket$Team == teams[i], ]
  team_runs[i] <- sum(team_data$Runs_Scored)
}

# Sort and display top 3
top_teams <- sort(team_runs, decreasing = TRUE)[1:3]
for (i in 1:length(top_teams)) {
  cat(names(top_teams)[i], ":", top_teams[i], "runs\n")
}
cat("\n")



# Histogram 1: Distribution of Runs Scored
cat("Creating Histogram 1: Runs Scored Distribution\n")
hist(
  cricket$Runs_Scored,
  main = "Distribution of Runs Scored",
  col = "skyblue",
  xlab = "Runs Scored",
  border = "darkblue",
  xlim = c(0, 12000),
  ylim = c(0, 30),
  breaks = 15
)
cat("Shows frequency distribution of runs scored by players\n\n")

# Histogram 2: Distribution of Batting Average
cat("Creating Histogram 2: Batting Average Distribution\n")
hist(
  cricket$Batting_Average,
  main = "Distribution of Batting Average",
  col = "lightgreen",
  xlab = "Batting Average",
  border = "darkgreen",
  xlim = c(15, 55),
  ylim = c(0, 25),
  breaks = 15
)
cat("Most players have batting average between 25-40\n\n")

# Histogram 3: Distribution of Strike Rate
cat("Creating Histogram 3: Strike Rate Distribution\n")
hist(
  cricket$Strike_Rate,
  main = "Distribution of Strike Rate",
  col = "coral",
  xlab = "Strike Rate",
  border = "red",
  xlim = c(60, 160),
  ylim = c(0, 25),
  breaks = 15
)
cat("Strike rate varies from 60 to 160\n\n")

# Histogram 4: Distribution of Wickets Taken
cat("Creating Histogram 4: Wickets Taken Distribution\n")
hist(
  cricket$Wickets_Taken,
  main = "Distribution of Wickets Taken",
  col = "gold",
  xlab = "Wickets Taken",
  border = "orange",
  xlim = c(0, 400),
  ylim = c(0, 30),
  breaks = 15
)
cat("Shows distribution of wickets taken by all players\n\n")


# Pie Chart 1: Player Type Distribution
cat("Creating Pie Chart 1: Player Type Distribution\n")
player_type_counts <- table(cricket$Player_Type)
pie(
  player_type_counts,
  main = "Distribution of Player Types",
  col = rainbow(length(player_type_counts)),
  labels = paste(names(player_type_counts), "\n", player_type_counts, " players")
)
cat("Shows proportion of different player types\n\n")

# Pie Chart 2: Team Distribution (Top 6 teams)
cat("Creating Pie Chart 2: Team Distribution (Top 6)\n")
team_counts <- sort(table(cricket$Team), decreasing = TRUE)[1:6]
pie(
  team_counts,
  main = "Top 6 Teams by Player Count",
  col = c("lightblue", "pink", "lightgreen", "yellow", "orange", "purple"),
  labels = paste(names(team_counts), "\n", team_counts, " players")
)
cat("Shows distribution of players across top 6 teams\n\n")

# Pie Chart 3: Performance Rating Categories
cat("Creating Pie Chart 3: Performance Rating Categories\n")
cricket$Performance_Category <- cut(cricket$Performance_Rating,
                                    breaks = c(0, 60, 75, 90, 100),
                                    labels = c("Below Average", "Average", "Good", "Excellent"))
perf_counts <- table(cricket$Performance_Category)
pie(
  perf_counts,
  main = "Performance Rating Categories",
  col = c("red", "yellow", "lightgreen", "darkgreen"),
  labels = paste(names(perf_counts), "\n", perf_counts, " players")
)
cat("Categories: Below Average (<60), Average (60-75), Good (75-90), Excellent (>90)\n\n")

# Pie Chart 4: Experience Level (by matches played)
cat("Creating Pie Chart 4: Experience Level Distribution\n")
cricket$Experience_Level <- cut(cricket$Matches_Played,
                                breaks = c(0, 50, 100, 150, 300),
                                labels = c("Rookie", "Intermediate", "Experienced", "Veteran"))
exp_counts <- table(cricket$Experience_Level)
pie(
  exp_counts,
  main = "Player Experience Level Distribution",
  col = c("lightyellow", "lightblue", "orange", "darkred"),
  labels = paste(names(exp_counts), "\n", exp_counts, " players")
)
cat("Based on matches played: Rookie (<50), Intermediate (50-100), Experienced (100-150), Veteran (>150)\n\n")



# Scatter Plot 1: Runs Scored vs Batting Average
cat("Creating Scatter Plot 1: Runs vs Batting Average\n")
plot(
  cricket$Runs_Scored, 
  cricket$Batting_Average,
  main = "Runs Scored vs Batting Average",
  xlab = "Total Runs Scored",
  ylab = "Batting Average",
  col = "blue",
  pch = 19,
  cex = 0.8
)
abline(lm(cricket$Batting_Average ~ cricket$Runs_Scored), col = "red", lwd = 2)
cat("Shows relationship between total runs and batting average\n\n")

# Scatter Plot 2: Matches Played vs Performance Rating
cat("Creating Scatter Plot 2: Matches vs Performance Rating\n")
plot(
  cricket$Matches_Played, 
  cricket$Performance_Rating,
  main = "Matches Played vs Performance Rating",
  xlab = "Matches Played",
  ylab = "Performance Rating",
  col = "darkgreen",
  pch = 19,
  cex = 0.8
)
abline(lm(cricket$Performance_Rating ~ cricket$Matches_Played), col = "red", lwd = 2)
cat("Experience tends to correlate with performance rating\n\n")

# Scatter Plot 3: Strike Rate vs Batting Average
cat("Creating Scatter Plot 3: Strike Rate vs Batting Average\n")
plot(
  cricket$Strike_Rate, 
  cricket$Batting_Average,
  main = "Strike Rate vs Batting Average",
  xlab = "Strike Rate",
  ylab = "Batting Average",
  col = "purple",
  pch = 19,
  cex = 0.8
)
abline(lm(cricket$Batting_Average ~ cricket$Strike_Rate), col = "red", lwd = 2)
cat("Explores relationship between aggressive batting and average\n\n")

# Scatter Plot 4: Wickets vs Economy Rate (colored by player type)
cat("Creating Scatter Plot 4: Wickets vs Economy (by Player Type)\n")
colors <- c("red", "blue", "green", "orange")[as.numeric(as.factor(cricket$Player_Type))]
plot(
  cricket$Wickets_Taken, 
  cricket$Economy_Rate,
  main = "Wickets Taken vs Economy Rate (by Player Type)",
  xlab = "Wickets Taken",
  ylab = "Economy Rate",
  col = colors,
  pch = 19,
  cex = 0.8
)
legend("topright", legend = levels(as.factor(cricket$Player_Type)), 
       col = c("red", "blue", "green", "orange"), pch = 19, cex = 0.7)
cat("Different colors represent different player types\n\n")


# Boxplot 1: Runs Scored by Player Type
cat("Creating Boxplot 1: Runs by Player Type\n")
boxplot(
  Runs_Scored ~ Player_Type,
  data = cricket,
  main = "Runs Distribution by Player Type",
  xlab = "Player Type",
  ylab = "Runs Scored",
  col = rainbow(length(unique(cricket$Player_Type))),
  border = "black",
  las = 2
)
cat("Compares run-scoring across different player types\n\n")

# Boxplot 2: Batting Average by Team (Top 5 teams)
cat("Creating Boxplot 2: Batting Average by Team (Top 5)\n")
top_5_teams <- names(sort(table(cricket$Team), decreasing = TRUE)[1:5])
cricket_top5 <- cricket[cricket$Team %in% top_5_teams, ]
boxplot(
  Batting_Average ~ Team,
  data = cricket_top5,
  main = "Batting Average by Team (Top 5)",
  xlab = "Team",
  ylab = "Batting Average",
  col = c("lightblue", "pink", "lightgreen", "yellow", "orange"),
  border = "black",
  las = 2
)
cat("Shows batting average distribution for top 5 teams\n\n")

# Boxplot 3: Strike Rate by Player Type
cat("Creating Boxplot 3: Strike Rate by Player Type\n")
boxplot(
  Strike_Rate ~ Player_Type,
  data = cricket,
  main = "Strike Rate by Player Type",
  xlab = "Player Type",
  ylab = "Strike Rate",
  col = c("coral", "skyblue", "lightgreen", "gold"),
  border = "black",
  las = 2
)
cat("Compares strike rate across player types\n\n")

# Boxplot 4: Performance Rating by Experience Level
cat("Creating Boxplot 4: Performance Rating by Experience Level\n")
boxplot(
  Performance_Rating ~ Experience_Level,
  data = cricket,
  main = "Performance Rating by Experience Level",
  xlab = "Experience Level",
  ylab = "Performance Rating",
  col = c("lightyellow", "lightblue", "orange", "darkred"),
  border = "black",
  las = 2
)
cat("Shows how performance varies with experience\n\n")


cat("=================================================\n")
cat("      FINAL INSIGHTS & CONCLUSIONS        \n")
cat("=================================================\n\n")

# Key Statistics
cat("1. OVERALL STATISTICS:\n")
cat("   - Total Players Analyzed:", nrow(cricket), "\n")
cat("   - Average Batting Average:", round(mean(cricket$Batting_Average), 2), "\n")
cat("   - Average Strike Rate:", round(mean(cricket$Strike_Rate), 2), "\n")
cat("   - Total Runs Scored:", sum(cricket$Runs_Scored), "\n")
cat("   - Total Wickets Taken:", sum(cricket$Wickets_Taken), "\n\n")

# Player Type Statistics
cat("2. PLAYER TYPE BREAKDOWN:\n")
for (type in unique(cricket$Player_Type)) {
  count <- sum(cricket$Player_Type == type)
  avg_score <- mean(cricket[cricket$Player_Type == type, "Overall_Score"])
  cat("   -", type, ":", count, "players, Avg Score:", round(avg_score, 2), "\n")
}
cat("\n")

# Top Performers
highest_runs <- cricket[which.max(cricket$Runs_Scored), ]
highest_wickets <- cricket[which.max(cricket$Wickets_Taken), ]
highest_rating <- cricket[which.max(cricket$Performance_Rating), ]

cat("3. TOP PERFORMERS:\n")
cat("   - Highest Run Scorer:", highest_runs$Player_Name, "(", highest_runs$Runs_Scored, "runs)\n")
cat("   - Highest Wicket Taker:", highest_wickets$Player_Name, "(", highest_wickets$Wickets_Taken, "wickets)\n")
cat("   - Highest Rated Player:", highest_rating$Player_Name, "(", highest_rating$Performance_Rating, "rating)\n\n")

# Correlations
corr_runs_avg <- cor(cricket$Runs_Scored, cricket$Batting_Average)
corr_matches_rating <- cor(cricket$Matches_Played, cricket$Performance_Rating)
corr_sr_avg <- cor(cricket$Strike_Rate, cricket$Batting_Average)

cat("4. CORRELATIONS:\n")
cat("   - Runs vs Batting Average:", round(corr_runs_avg, 3), "\n")
cat("   - Matches vs Performance Rating:", round(corr_matches_rating, 3), "\n")
cat("   - Strike Rate vs Batting Average:", round(corr_sr_avg, 3), "\n\n")

# Team Statistics
best_team <- team_summary[which.max(team_summary$Total_Runs), ]
cat("5. BEST PERFORMING TEAM:\n")
cat("   - Team:", best_team$Team, "\n")
cat("   - Total Runs:", best_team$Total_Runs, "\n")
cat("   - Total Wickets:", best_team$Total_Wickets, "\n")
cat("   - Average Performance Rating:", round(best_team$Avg_Performance, 2), "\n\n")

cat("=================================================\n")
cat("      ANALYSIS COMPLETED SUCCESSFULLY      \n")
cat("=================================================\n")

# Save results to a summary file
summary_data <- data.frame(
  Metric = c("Total Players", "Avg Batting Average", "Avg Strike Rate", 
             "Total Runs", "Total Wickets", "Batsmen Count", "Bowler Count"),
  Value = c(nrow(cricket), round(mean(cricket$Batting_Average), 2),
            round(mean(cricket$Strike_Rate), 2), sum(cricket$Runs_Scored),
            sum(cricket$Wickets_Taken), sum(cricket$Player_Type == "Batsman"),
            sum(cricket$Player_Type == "Bowler"))
)

write.csv(summary_data, "cricket_analysis_summary.csv", row.names = FALSE)
cat("\nSummary saved to: cricket_analysis_summary.csv\n")

