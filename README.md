# Restaurant-Analysis


***

##   A Strategic Analysis of Menu Performance for Taste of the World Cafe

### Executive Summary
> This report details a comprehensive analysis of the 'Taste of the World Cafe's' new menu performance. By examining sales data, we identified key operational patterns, uncovered significant revenue drivers, and translated these findings into a concrete, data-driven strategy. Key recommendations include promoting "Star" performers, re-engineering "Workhorse" items for profitability, increasing the visibility of high-margin "Puzzles," and removing underperforming "Duds." A significant opportunity was discovered in marketing unique "Fusion Combos" based on observed cross-category purchasing behavior, such as pairing American and Asian cuisine. Implementing these strategies is projected to enhance customer experience, increase profitability, and optimize kitchen operations.

***

### Objectives 

-   Analyze Operational Patterns: To identify the busiest days of the week and times of day to inform staffing and operational efficiency.
-   Evaluate Menu Performance: To determine the most and least popular menu items and categories, assessing both sales frequency and revenue generation.
-   Uncover Customer Behavior: To discover which items are most frequently purchased together, revealing hidden trends in customer preferences and opportunities for combo deals.
-   Provide Strategic Recommendations: To synthesize all analytical findings into a set of actionable, data-driven recommendations for menu engineering, marketing initiatives, and promotional strategies to boost profitability and enhance the customer experience.

***

### Data Sources 

-   **Menu Items Data:** Extracted details about each menu item, including the number of menu items, pricing, and categories.
-   **Customer Orders Data:** Analyzed customer orders to understand preferences and frequently ordered items.

***

### Methodology 

-   Data Modeling: Transformed raw CSV files into a relational Star Schema to ensure data integrity for the analysis.
-   Descriptive Analysis: Executed initial SQL queries to establish a baseline of operational performance, identifying peak hours and item popularity.
-    Advanced Analytics: Employed advanced SQL techniques, including CTEs, self-joins, and NTILE() window functions, to analyze profitability, customer spending habits, and item pairing behaviors.
- Strategic Segmentation: Synthesized all data into a 2x2 menu engineering matrix (Stars, Workhorses, Puzzles, Duds) to generate targeted, data-driven business recommendations.
***

### Key Insights
Peak days and times of day?
* **Peak Days:** Monday was the busiest day, followed by Sunday and Friday.
* **Slowest Day:** Wednesday was the least busy day.
* **Key Observation:** Notably, Saturday was towards the bottom of the ranking, while the other weekend days ranked among the highest.
* **Peak Hours:**
    * **Monday:** 12 PM - 1 PM (12 PM is the peak)
    * **Tuesday:** 6 PM - 7 PM (6 PM is the peak)
    * **Wednesday:** 4 PM - 6 PM (5 PM is the peak)
    * **Thursday:** 12 PM
    * **Friday:** 12 PM - 1 PM (12 PM is the peak)
    * **Saturday:** 12 PM
    * **Sunday:** 12 PM - 1 PM (1 PM is the peak)
    * 
 
Popularity vs. Profitability
* The **Hamburger** is the most popular item with 622 orders, but it is not the highest revenue generator.
* The **Korean Beef Bowl** is the third most popular item but brings in more revenue than the Hamburger.
* While not the most popular, **Italian dishes as a category drive the most revenue**, making them hidden champions of the menu.


***

### Recommendations 

**1. Promote Your Stars (High Pop, High Rev):**
* **Recommendation:** Feature these items prominently. Create high-value combos based on their most popular pairings.
- **Action:** Market the **Korean Beef Bowl** with its popular pairing, Edamame, as a "Traditional Asian" special. Also, elevate the entire **Italian category** with a dedicated menu section.

**2. Optimize Your Workhorses (High Pop, Low Rev):**
* **Recommendation:** Increase the profitability of popular but lower-revenue items like the Hamburger.
* **Action:** Create an "American/Asian Fusion" meal by pairing the **Hamburger or Cheeseburger with Edamame**. This leverages a proven popular pairing to increase the total order value.

**3. Uncover Your Puzzles (Low Pop, High Rev):**
* **Recommendation:** Increase the visibility of these hidden gems.
* **Action:** Implement promotions like "Dish of the Week" for high-margin Italian dishes or train staff to recommend them.

**4. Learn from Your Duds (Low Pop, Low Rev):**
* **Recommendation:** Use data from unpopular pairings as hindsight.
* **Action:** We observed that pairing two low-performing items (e.g., Hot Dog and Chicken Tacos) does not resonate with customers. However, pairing a high-performer with a low-performer (Cheeseburger and Steak Torta) can be successful. Use this insight to avoid creating combo deals that are unlikely to sell and instead focus on pairings with at least one "star" item. Consider removing the lowest performers to simplify the menu.
