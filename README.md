# onboarding
Learning materials for onboarding team members

### Power BI + Data Analysis
1. In the `Power BI` folder, take a look at `311_Calls__2012-Present_Dirty.xlsx`. Notice empty columns, differing data types within columns, and data stored as the wrong type (i.e., IDs stored as text).
2. Clean the data by changing data types and moving mismatched data under its correct column header. Use Excel formulas when needed. When finished, your dataset should look like `311_Calls__2012-Present_Clean.xlsx`.
3. Download Power BI Desktop. <https://powerbi.microsoft.com/en-us/get-started/> (If you're using a Mac, running Power BI Desktop requires Parallels.)
4. Load the clean dataset into Power BI. (Note: You can clean and manipulate the dataset directly in Power BI.)
5. Create a data file similar to `311Calls.pbix`, building in different kinds of charts, slicers, and filters to support better data analysis.

### R + Twitter Sentiment Analysis
1. Download and install R <https://cran.r-project.org/> and RStudio <https://www.rstudio.com/>.
2. In the `Twitter Sentiment Analysis` folder, open `TwitterSentimentAnalysis.R`. Replace the `file_path`, `search_terms`, and `search_start_date` values with your own parameters..
3. Replace the `consumer_key`, `consumer_secret`, `access_token`, and `access_secret` values by following the steps on this blog: <http://thinktostart.com/twitter-authentification-with-r/>
4. In the RStudio console, run `install.packages("twitteR", "plyr", "dplyr", "tidytext", "ggplot2")`.
5. Run the script a few lines at a time to understand what's happening in each step and to make it easier to identify what went wrong and troubleshoot when you receive any errors.

### Learning Resources
##### Excel
Office Support: <https://support.office.com/en-us/excel>

##### Power BI
Power BI Learning: <https://powerbi.microsoft.com/en-us/learning/>

##### SQL
Codecademy: <https://www.codecademy.com/catalog/language/sql>

W3 Schools: <https://www.w3schools.com/sql/>

KhanAcademy: <https://www.khanacademy.org/computing/computer-programming/sql>

##### R
Data Camp: <https://www.datacamp.com/tracks/skill>

R-Bloggers: <https://www.r-bloggers.com/how-to-learn-r-2/>

RStudio: <https://www.rstudio.com/online-learning/>

CRAN: <https://cran.r-project.org/>

##### Python
Data Camp: <https://www.datacamp.com/tracks/skill>

Codecademy: <https://www.codecademy.com/catalog/language/python>

Automate the Boring Stuff with Python: <https://automatetheboringstuff.com/>

LearnPython.org: <https://www.learnpython.org/>
