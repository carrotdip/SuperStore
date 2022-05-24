# SuperStore Analysis

## Overview
A superstore giant, which we will call SuperStore, is trying to revamp its business outlook and strategies. SuperStore wants to become a more specialized store, catered to its existing customers while attracting new ones. The superstore giant also would like insights on profit-inducing strategies from the existing product catalog, as its hoping to make a breakthrough on new kinds of products to sell.\
\
The purpose of this analysis was to analyze trends within the SuperStore dataset and identify actionable insights to create better informed business decisions. The dataset is from [Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) which contains order information from 2014-2017 from SuperStore. The dataset includes order/shipping dates, customer ids/names/segments, location in the form of regions/states/cities/postal codes, the category/sub-category/product names, as well as the sales, quantity, discounts, and profits from each and every sale over the years. \
\
In this analysis, the differences between the regions or states that lead to differing profitabilities will be explored, while drawing actionable insights on how to increase revenue throughout the country. This analysis also evaluates the profitability of items sold at the SuperStore to generate valuable insights on how to proceed forward and bring enlightenment in the development of the next business plan or venture.

## Tableau Dashboard
Click [here](https://public.tableau.com/app/profile/caroline.diep/viz/BluOrangeSuperStore/Dashboard4) to view the interactive Business Intelligence (BI) Tableau dashboard. Please view in fullscreen mode.

## Results

### Regional Analysis
From a quick exploration of the SuperStore BI dashboard, it is abundantly clear that the East and West regions are more profitable than the Central and South regions. The Eastern and Western regions of the US are higher in almost every numerical metric (whether that be sales, quantity purchased, and profits) except for one: discounts.\
This can be further visualized with this SQL query:\
![txt](https://github.com/carrotdip/SuperStore/blob/d505062c305b99dc7eeb73af9f96c19860a88c29/Images/metrics_table.png)\
One can see a downward trend starts to form with the total discounts, quantity sold, sales, profits, and profit ratio from the West, East, and South regions, and once it reaches the Central region, there is a disparity between these metrics.\
It was found that some states, particularly Southern and Central states, have had an abnormally large number of discounts compared to their Eastern and Western counterparts (discounts is blown up for easier readability).
![txt](https://github.com/carrotdip/SuperStore/blob/158783c61894cfbcfa9fa54527c3f8dd3633e555/Images/stackeddiscountprofit.png)\
The following SQL query also displays the discrepancy in the relationship between total discounts and profits. It is clear that the Central region has had an exceptionally larger ratio between discounts and profits. The reason for this discrepancy should be addressed in order to increase profitability of the lacking regions.
![txt](https://github.com/carrotdip/SuperStore/blob/913ababa94cb47353596f2be025ecb86bd4ff5b3/Images/discountprofitratio.png)\
There is an unsurprising negative correlation between the two variables, discount and profit, shown with the following joint plot:\
![txt](https://github.com/carrotdip/SuperStore/blob/158783c61894cfbcfa9fa54527c3f8dd3633e555/Images/discountprofitjp.png)\
Although the reason these states have had an ostensibly aberrant amount of discounts is unknown, it is safe to say that profitability of these states or regions will increase with less discounts, particularly discounts greater than 0.4. 
To delve deeper into how profits are affected by the category or sub_category of an item, an inventorial analysis will be performed.

### Inventory Analysis
To get a better idea of the best store catalog for SuperStore's new image, the following analysis was done on the category, sub-category, and item level. The BI dashboard visualization shows that the Furniture category is not performing well, as it has consistent negative values in total profits while the other categories do not share this trend. The following SQL query confirms this: \
![txt](https://github.com/carrotdip/SuperStore/blob/e68cfc19499a1df3de0bed241a69734e104c5d74/Images/tpbyregioncategory.png)\
While each Furniture category is not in the negative, the profitability of this particular category seems to not be performing as well as the others. Alternately, the Technology category appears to be performing exceptionally well. The profitability of the Furniture category in the Central and East regions seems to be abnormally low when comparing profits within a region, and that of the Technology category seems to be satisfactory throughout.
To dig deeper into which items are profitable vs. non-profitable, the sub-categories will be explored. In the following query, it is clear that Tables and Bookcases sub-categories specifically are bringing down the profitability of the entire category: \
![txt](https://github.com/carrotdip/SuperStore/blob/75760d6b86f2df5fbb0ff70f0042af4c55e8401a/Images/tpbycategoryandsubcategory.png) \
On the flip side, this query also shows that the Technology category, more specifically the Copiers, Phones, and Accessories sub-categories, have been proven to have high profitability.
The following query visualizes that the Tables and Bookcases sub-categories have not fared well across all regions. 
![txt](https://github.com/carrotdip/SuperStore/blob/e6991284ec152d06c4fce3cfcfa7551df45d05d7/Images/tablesbookcasesbyregion.png)\
Also, Copiers, Phones, and Accessories in the Technology category have fared really well across all regions.
![txt](https://github.com/carrotdip/SuperStore/blob/124226894147f38f8eff58bd4734bbcb57b49588/Images/cpabyregion.png)\
To get to the item-specific level in the Tables and Bookcases sub-categories, several queries were ran to determine which specific items, and their product_ids, were profitable:\
![txt](https://github.com/carrotdip/SuperStore/blob/cf1c6597204f1b03cfceba652acef8c6aed2ce0f/Images/profitablebooktables.png)\
And which items were not:
![txt](https://github.com/carrotdip/SuperStore/blob/cf1c6597204f1b03cfceba652acef8c6aed2ce0f/Images/unprofitablebooktables.png)\
The same was done for the specific items in the Copiers, Phones, and Accessories in the Technology category. Here are the top 10 profitable items across all 4 regions:
![txt](https://github.com/carrotdip/SuperStore/blob/482a11b11fa0e337e0b19286bf3b0805707b2b3a/Images/profitablecpa.png)
And the non-profitable:
![txt](https://github.com/carrotdip/SuperStore/blob/482a11b11fa0e337e0b19286bf3b0805707b2b3a/Images/unprofitablecpa.png)

## Conclusion
1. Reduce discounts over 0.4, particularly in the Central region.
2. Introduce new re-branding products* once unprofitable items are expunged from catalog list.

Drawbacks: The SuperStore dataset lacks cost, return information, limiting the types of analysis able to be performed. 
*An additional dataset with market trends should be analyzed to decide which products/markets the SuperStore should focus its rebranding on.