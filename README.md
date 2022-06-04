# Pewlett-Hackard-Analysis
## Overview of Project
### Purpose of Project
In this project, I demonstrated my proficiency with various features in SQL including: enitity relationship diagrams (ERDs), creating new tabels with into statements, exporting a CSV file, filtering quieries, using join, on(), and order by caluses, and using aliases. To accomplish these goals, I was given a fictional situation and data set of six CSV files. 
### Background of Project
Pewlett Hackard, a large company with thousands of employees, is looking toward the future in two ways: (1) offering a retirment package for those who meet certain criteria and (2) idetnifying which positions will need to be filled in the near future. The objective of this project is to determine the number of retiring employees per title, identify employees who are eligible to participate in a mentorship program, and a writen a summary analysis report to prepare Pewlett Hackard for the “silver tsunami” as many current employees reach retirement age.

---
## Analysis and Challenges
### Analysis


![Theater_Outcomes_vs_Launch](Theater_Outcomes_vs_Launch.png)

Based on the line graph above, I had the following takeways about theather campaigns:
* May, June, and July respectively had the highest number of successful campaigns. 
* October and May respectively had the highest number of failed campaigns.
* December had about as many successful campaigns as failed ones.
* In every month there were more successful than failed campagins. Generally, the successful and failed trend lines create the same shape and are similar to each other with the exception of May, October, and December. In May, the larger than average gap between successful and failed campaigns suggests a better chance for success. In October, the smaller than average gap between successful and failed campaigns suggests a better chance for failure. 


### Challenges 
One challenge I encountered in writing my countifs formula was ensuring that I only counted the *plays*. Initially, my formula =COUNTIFS('Raw Data'!$D:$D, ">=1000", 'Raw Data'!$D:$D, "<5000", 'Raw Data'!$F:$F, "successful") counted every subcategory so I had to add an additional criteria and changed my formula to =COUNTIFS('Raw Data'!$O:$O, "plays",'Raw Data'!$D:$D, ">=1000", 'Raw Data'!$D:$D, "<5000", 'Raw Data'!$F:$F, "successful"). 

---
## Results
### My Reccomendation 
According to the data, Louise's play with a funding goal of $10,000 should be launched in May, June, or July and avoid a launch in October or December. Her current funding goal has a 54% chance of succeeding. If she could cut costs in half, her success rate would increase to approximately 70%. 

### Limitations 
Many of the limitations of this dataset come from the donation collection. For example, the method of how donations are collected is unclear. Is the crowdfunding solely from an online platform like GoFundMe or were there other collection methods? If there were other collection methods, then which one was most successful? Are successful campaigns funded primarily by online methods, in-person methods, or a mix of the two? Why are campaigns with zero backers included in this dateset?

### Digging Deeper 
Louise's biggest concern is likely her funding goal. Would it be possible to reduce her funding goal to increase her chances of success? The data suggests- yes! Although cutting her budget from 10,000 to 5,000 could increase the likehood of her success from 50% to 70%, that is a substantial cut which could negatively impact the quality of her play. What would her chances of success be if her goal was 9,000 or 8,000? I would want to narrow the Outcomes vs Goals graph to funding goals of 0 to 11,000 and break down the percentage of success by increments of 500. This would help me make better suggestions than cutting her goal from 10,000 to 5,000. 

Another factor I am interested in is the amount of an average donation. Once Louise sets a funding goal, it would be helpful to know how much she should ask backers for. Should she put her time and energy into finding many backers to make smaller donation or a few backers into making larger donations? A line graph comparing successful/failed campagins by number of backers and average donation could help Louise make better decisions about who she will ask to fund her play.  
