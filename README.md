# CricketPlayerPerformanceAnalysis_main

# Cricket Players Performance Analysis - Mini Project Guide

## Project Overview
This mini project analyzes cricket players' performance using R programming. The structure is similar to your Movie Analysis project but focuses on cricket statistics including runs, wickets, batting average, strike rate, and player performance ratings.

---

## Files Included

1. **cricket_players_performance.csv** - Dataset with 100 cricket players
2. **Cricket_Players_Performance_Analysis.R** - Main R script for analysis

---

## Dataset Description

### cricket_players_performance.csv (100 players, 21 variables)

**Player Information:**
- Player_ID - Unique identifier (P001, P002, etc.)
- Player_Name - Player's full name
- Team - National team (India, Australia, England, Pakistan, etc.)
- Player_Type - Batsman, Bowler, All-Rounder, Wicket-Keeper
- Age - Player age (20-38 years)

**Batting Statistics:**
- Matches_Played - Total matches played
- Innings_Batted - Number of innings batted
- Runs_Scored - Total career runs
- Highest_Score - Highest individual score
- Batting_Average - Average runs per innings
- Strike_Rate - Runs scored per 100 balls
- Centuries - Number of 100+ scores
- Half_Centuries - Number of 50-99 scores

**Bowling Statistics:**
- Wickets_Taken - Total career wickets
- Bowling_Average - Average runs per wicket
- Economy_Rate - Runs conceded per over
- Best_Bowling - Best bowling figures (e.g., 5/30)

**Fielding & Awards:**
- Catches_Taken - Number of catches
- Stumpings - Number of stumpings (mainly for wicket-keepers)
- Man_of_Match_Awards - Total MOM awards won
- Performance_Rating - Overall performance score (50-95)

---

## Project Structure (Similar to Movie & Health Projects)

### 1. Data Loading and Initial Display
```r
cricket <- read.csv("cricket_players_performance.csv")
head(cricket, 5)
```

### 2. Arithmetic Operations (3 calculations)

**Operation 1: Runs per Match**
- Formula: Runs per Match = Total Runs / Matches Played
- Shows consistency of run-scoring

**Operation 2: Wickets per Match**
- Formula: Wickets per Match = Total Wickets / Matches Played
- Shows bowling effectiveness

**Operation 3: Overall Performance Score**
- Formula: Score = (Runs/100) + (Wickets×5) + (Catches×2) + (MOM×10)
- Comprehensive performance metric combining all aspects

### 3. Mathematical Functions

Applied to batting average and other cricket metrics:
- **mean()** - Average batting average across all players
- **median()** - Middle value of batting averages
- **sd()** - Standard deviation of batting averages
- **var()** - Variance
- **min()** and **max()** - Best and worst averages
- **quantile()** - 25th, 50th, 75th percentiles
- **sum()** - Total runs by all players
- **sqrt()** - Square root of average strike rate
- **abs()** - Absolute deviation from mean
- **log()** - Logarithm of runs scored

### 4. Display Functions

**dim() function:**
- Shows number of players (rows) and statistics (columns)

**glimpse() function:**
- Displays dataset structure with data types

**Additional structure info:**
- Column names list
- Data types for each variable

### 5. Data Frame Creation and Objects

**Vector creation:**
- Top performers (Overall Score >= 1500)
- Batsmen subset

**Summary object:**
- Team-wise summary with total runs, wickets, and averages

**Custom data frame:**
- Top 10 run scorers with rankings

### 6. Looping in R (3 loops)

**Loop 1: Average Runs by Player Type**
- Calculates average runs for Batsman, Bowler, All-Rounder, Wicket-Keeper

**Loop 2: Players Count by Age Groups**
- Counts players in: 20-25, 26-30, 31-35, 36-40 years

**Loop 3: Top 3 Teams by Total Runs**
- Identifies best performing teams based on total runs scored

---

## Visualizations

### Histogram (4 charts)

**Histogram 1: Runs Scored Distribution**
- Color: skyblue
- X-axis: Total Runs Scored
- Shows frequency of run-scoring ranges

**Histogram 2: Batting Average Distribution**
- Color: lightgreen
- X-axis: Batting Average
- Shows distribution of batting averages (15-55)

**Histogram 3: Strike Rate Distribution**
- Color: coral
- X-axis: Strike Rate
- Shows aggressive vs defensive batting patterns

**Histogram 4: Wickets Taken Distribution**
- Color: gold
- X-axis: Total Wickets
- Shows wicket-taking frequency

### Pie Chart (4 charts)

**Pie Chart 1: Player Type Distribution**
- Shows proportion of Batsmen, Bowlers, All-Rounders, Wicket-Keepers

**Pie Chart 2: Team Distribution (Top 6)**
- Shows player count for top 6 national teams

**Pie Chart 3: Performance Rating Categories**
- Categories: Below Average (<60), Average (60-75), Good (75-90), Excellent (>90)

**Pie Chart 4: Experience Level**
- Based on matches: Rookie (<50), Intermediate (50-100), Experienced (100-150), Veteran (>150)

### Scatter Plot (4 charts)

**Scatter Plot 1: Runs vs Batting Average**
- Blue points with red trend line
- Higher runs generally mean better averages

**Scatter Plot 2: Matches Played vs Performance Rating**
- Green points with red trend line
- Experience correlation with performance

**Scatter Plot 3: Strike Rate vs Batting Average**
- Purple points with red trend line
- Balance between aggression and consistency

**Scatter Plot 4: Wickets vs Economy Rate (colored by Player Type)**
- Multi-colored by player type
- Shows bowling efficiency patterns

### Boxplot (4 charts)

**Boxplot 1: Runs by Player Type**
- Compares run-scoring across Batsmen, Bowlers, All-Rounders, Wicket-Keepers

**Boxplot 2: Batting Average by Team (Top 5)**
- Compares batting strength across top 5 teams

**Boxplot 3: Strike Rate by Player Type**
- Shows aggressive batting tendencies by player type

**Boxplot 4: Performance Rating by Experience Level**
- Shows how performance evolves with experience

---

## Final Insights Section

The script automatically calculates and displays:

1. **Overall Statistics**
   - Total players analyzed
   - Average batting average and strike rate
   - Total runs and wickets by all players

2. **Player Type Breakdown**
   - Count and average performance score for each player type

3. **Top Performers**
   - Highest run scorer name and runs
   - Highest wicket taker name and wickets
   - Highest rated player

4. **Correlations**
   - Runs vs Batting Average
   - Matches vs Performance Rating
   - Strike Rate vs Batting Average

5. **Best Performing Team**
   - Team name
   - Total runs and wickets
   - Average performance rating

---

## How to Run

### Step 1: Setup
1. Install R and RStudio
2. Place both files in the same folder:
   - `cricket_players_performance.csv`
   - `Cricket_Players_Performance_Analysis.R`

### Step 2: Install Packages
```r
install.packages("dplyr")
install.packages("tibble")
```

### Step 3: Execute
1. Open RStudio
2. Set working directory: `setwd("your/folder/path")`
3. Open the R script
4. Click "Source" or run line by line
5. View outputs in Console and Plots pane

---

## Output Files

**cricket_analysis_summary.csv**
- Automatically generated summary
- Key cricket statistics and counts

---

## Course Alignment

### Unit 1: Mathematics Context
✓ Arithmetic operations on cricket data  
✓ dim() and glimpse() functions  
✓ Mathematical functions (mean, median, sd, var, min, max, quantile, sqrt, abs, log)

### Unit 2: Data Frame Context
✓ Data frame creation and structure  
✓ Indexing and subsetting  
✓ Looping in R (3 different loops)

### Unit 3: Histogram Context
✓ 4 histograms with all parameters:
- main (title)
- col (color)
- xlab (x-axis label)
- border (border color)
- xlim and ylim (axis ranges)
- breaks (number of bins)

### Experiment 6: Boxplot
✓ 4 boxplots for group comparisons  
✓ Shows median, quartiles, and outliers

### Additional Visualizations
✓ 4 pie charts for categorical data  
✓ 4 scatter plots for relationships

---

## Key Learning Outcomes

By completing this project, you will learn:

1. **R Programming Skills**
   - Loading and manipulating cricket data
   - Creating calculated performance metrics
   - Using mathematical and statistical functions

2. **Data Visualization**
   - Creating histograms, pie charts, scatter plots, boxplots
   - Customizing colors, labels, and parameters
   - Interpreting cricket statistics visually

3. **Statistical Analysis**
   - Understanding distributions and correlations
   - Comparing player types and teams
   - Identifying top performers

4. **Sports Analytics**
   - Performance evaluation metrics
   - Player comparison techniques
   - Team strength analysis

---

## Cricket Statistics Explained

### Batting Metrics:
- **Batting Average**: Total runs / Times dismissed (Higher is better)
- **Strike Rate**: (Runs scored / Balls faced) × 100 (Higher = more aggressive)
- **Centuries**: Innings with 100+ runs (Milestone achievement)

### Bowling Metrics:
- **Bowling Average**: Runs conceded / Wickets taken (Lower is better)
- **Economy Rate**: Runs conceded per over (Lower = more economical)
- **Wickets**: Number of batsmen dismissed (Higher is better)

### All-Round Performance:
- **Overall Score**: Combines batting, bowling, fielding, and awards
- **Performance Rating**: Holistic rating (50-95 scale)

---

## Troubleshooting

**Problem**: CSV file not found  
**Solution**: Use `getwd()` to check directory, then `setwd()` to correct

**Problem**: Package not loading  
**Solution**: Run `install.packages("package_name")` first

**Problem**: Plots not displaying  
**Solution**: Check Plots pane, or run `dev.off()` to reset

**Problem**: Error in calculations  
**Solution**: Check for missing values with `sum(is.na(cricket))`

---

## Project Comparison Table

| Feature | Movie Project | Health Project | Cricket Project |
|---------|---------------|----------------|-----------------|
| Dataset Size | ~100 movies | 500 patients | 100 players |
| Domain | Entertainment | Healthcare | Sports Analytics |
| Main Metrics | Rating, Earnings | BMI, BP, Diseases | Runs, Wickets, Average |
| Arithmetic Ops | 3 operations | 3 operations | 3 operations |
| Histograms | 3 charts | 4 charts | 4 charts |
| Pie Charts | 0 charts | 4 charts | 4 charts |
| Scatter Plots | 0 charts | 4 charts | 4 charts |
| Boxplots | 3 charts | 4 charts | 4 charts |
| Loops | 3 loops | 3 loops | 3 loops |
| Social Relevance | Medium | High | High |

---

## Extensions (Optional)

To expand this project further:

1. **Advanced Statistics**
   - t-tests to compare player types
   - ANOVA for team comparisons
   - Correlation matrix heatmap

2. **Predictive Modeling**
   - Linear regression for performance prediction
   - Logistic regression for success probability

3. **Additional Visualizations**
   - Time series if career progression data available
   - Interactive plots with ggplot2
   - Network analysis for player partnerships

4. **Real-World Applications**
   - Team selection optimization
   - Player auction valuations
   - Match outcome predictions

---

## Sample Insights You'll Discover

From this analysis, you'll learn:

- **Which player type scores the most runs?** (Usually Batsmen)
- **Do experienced players perform better?** (Correlation analysis)
- **Which team has the strongest batting lineup?** (Team comparison)
- **What's the ideal balance between strike rate and average?** (Scatter plot insights)
- **How many players are in their peak performance years?** (Age distribution)

---

## Real-World Applications

This project demonstrates skills useful for:

- **Sports Analytics**: Team management and player evaluation
- **Data Science Careers**: Statistical analysis and visualization
- **Business Intelligence**: Performance metrics and KPIs
- **Academic Research**: Sports science and performance studies

---

## Summary

This Cricket Players Performance Analysis project provides a **simple, structured, and comprehensive** approach to sports data analysis using R. It follows the same format as your Movie and Health projects.

**Complete Coverage:**
✓ 3 Arithmetic operations  
✓ 10+ Mathematical functions  
✓ dim() and glimpse()  
✓ Data frame creation and manipulation  
✓ 3 For loops  
✓ 4 Histograms  
✓ 4 Pie charts  
✓ 4 Scatter plots  
✓ 4 Boxplots  
✓ Comprehensive final insights  

**Ready to run with real cricket-themed data and professional analysis! Perfect for your master's course mini project! 🏏📊**
