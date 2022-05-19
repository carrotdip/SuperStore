# SuperStore Analysis

## Overview
The purpose of this analysis was to analyze trends within the SuperStore dataset and identify actionable insights to create better informed business decisions. The dataset is from [Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) which contains order information from 2014-2017 of a super store giant, which we will call SuperStore. The dataset includes order/shipping dates, customer ids/names/segments, location in the form of regions/states/cities/postal codes, the category/sub-category/product names, as well as the sales, quantity, discounts, and profits from each and every sale over the years. 
In this analysis, the differences between the regions or states that lead to differing profitabilities will be explored, while drawing actionable insights on how to increase revenue throughout the country. This analysis will also evaluate the profitability of items sold at the SuperStore to generate insights on how to proceed forward and bring enlightenment in the development of the next business plan or venture.

## Tableau Dashboard
Click [here](https://public.tableau.com/app/profile/caroline.diep/viz/BluOrangeSuperStore/Dashboard4) to view the interactive Business Intelligence (BI) Tableau dashboard. Please view in fullscreen mode.

## Statistical Analysis
From a quick exploration of the SuperStore BI dashboard, it is abundantly clear that the East and West regions are more profitable than the Central and South regions. It also appears that the Furniture category is not performing well, as it has consistent negative values in total profits while the other categories do not share this trend. The following SQL query confirms this: \
![txt](https://github.com/carrotdip/SuperStore/blob/e68cfc19499a1df3de0bed241a69734e104c5d74/Images/tpbyregioncategory.png)\
While each Furniture category is not in the negative, the profitability of this particular category seems to not be performing as well as the others. The profitability of the Furniture category in the Central and East regions seems to be exceptionally low when comparing profits within a region.
To dig deeper into which items are not profitable, the sub-categories will be explored. In the following query, it is clear that Tables and Bookcases sub-categories specifically are bringing down the profitability of the entire category: \
![txt](https://github.com/carrotdip/SuperStore/blob/75760d6b86f2df5fbb0ff70f0042af4c55e8401a/Images/tpbycategoryandsubcategory.png) \
On the flip side, this query also shows that the Technology category, more specifically the Copiers, Phones, and Accessories sub-categories, have been proven to have high profitability.
The following query shows that the Tables and Bookcases sub-categories have not fared well across all regions. 
![txt](https://github.com/carrotdip/SuperStore/blob/e6991284ec152d06c4fce3cfcfa7551df45d05d7/Images/tablesbookcasesbyregion.png)\

## Results
## Conclusion