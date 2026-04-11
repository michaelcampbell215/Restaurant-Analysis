# Inventory Margin Optimization

#### Product Mix Analytics | GMROI Engineering | Market Basket Analysis | Advanced SQL

[![SQL](https://img.shields.io/badge/SQL-Advanced_CTEs_%26_Window_Functions-4479A1.svg)](https://www.mysql.com/)
[![Methodology](https://img.shields.io/badge/Methodology-GMROI_%26_Matrix_Analysis-blue.svg)](https://en.wikipedia.org/wiki/Gross_margin_return_on_investment)

> [!IMPORTANT]
> **Executive Summary:** This project demonstrates that **volume is not value**. By engineering a SQL-driven analytical engine using advanced CTEs and the NTILE window function, a rigorous GMROI (Gross Margin Return on Investment) matrix was applied to a high-throughput multi-SKU catalog — discovering that the highest-volume item was a low-margin bottleneck consuming 25% of peak-hour capacity while generating minimal net profit. Market Basket Analysis via SQL self-joins then uncovered a **49% untapped combo conversion opportunity**.

---

> [!NOTE]
> **Supply Chain Analytics Connection:** GMROI matrix analysis and Market Basket affinity modeling are the same analytical frameworks applied in pharmaceutical formulary optimization, medical supply inventory management, and hospital procurement strategy — where product mix decisions carry both cost and patient care implications. The SQL architecture (CTEs, NTILE quartile tiering, self-join affinity analysis) scales directly to higher-volume inventory environments including healthcare distribution, CPG supply chains, and medical device catalog management.

---

## The Problem

A high-volume, multi-SKU operation faced a persistent disconnect between product complexity and operational profitability. Peak-hour throughput was being consumed by high-volume items that weren't driving primary margins, while high-GMROI performers lacked visibility and placement priority. Product mix decisions were being made using simple volume reports — ignoring cost of goods and operational strain at the SKU level.

**The core finding:** The highest-selling SKU was actually a throughput constraint. It monopolized peak-hour capacity while delivering a low GMROI — a pattern that appears in any multi-SKU inventory environment, from restaurant catalogs to pharmaceutical formularies to medical device distribution networks.

## Data Sources

1. **Primary Datasets:** Historical transactional data containing item volume, order timestamps, and product identifiers.
2. **Additional Data:** Financial variables including Unit Cost, Selling Price, and Gross Margin per product.

## Process

- Quantified baseline GMROI to measure profit generated per inventory dollar invested across all product lines.
- Isolated Product Contribution Margin to identify true net profit after COGS at the SKU level.
- Analyzed Temporal Throughput Demand to identify specific bottleneck windows where operational capacity exceeded sustainable throughput.
- Executed Market Basket Analysis via SQL self-joins on historical transaction data to surface natural product affinity pairs.

## Technical Pivot

**From Volume Reporting to Strategic Matrix (SQL CTEs & NTILE)**

Product decisions were being made using simple volume reports that ignored COGS and operational strain at the item level.

- **The Change:** Engineered automated SQL logic using advanced CTEs and the NTILE window function to categorize all SKUs into four performance quadrants.
- **The Result:** Classified 100+ items into Stars (high volume, high margin), Puzzles (low volume, high margin), Workhorses (high volume, low margin), and Duds (low volume, low margin) — revealing that the top-volume SKU was a Workhorse consuming 25% of peak operational capacity while delivering minimal net profit.

**From Individual Transactions to Affinity Pipelines**

The system previously treated every transaction as an independent event, making cross-sell and bundling opportunities invisible.

- **The Change:** Built Market Basket Analysis using SQL self-joins on historical transaction data.
- **The Result:** Discovered a **49% untapped conversion opportunity** for specific product pairings — enabling analytically-validated bundle design rather than intuition-driven packaging.

## Key Insights

- **Volume Does Not Equal Value:** The highest-selling item was a throughput constraint — monopolizing peak-hour capacity while delivering a low GMROI. This pattern is domain-agnostic and appears in pharmaceutical formularies, medical device catalogs, and CPG distribution equally.
- **Hidden Star Performers:** Multiple high-GMROI SKUs had strong volume but lacked strategic visibility — a merchandising and assortment planning gap, not a demand problem.
- **Natural Affinity Pairs:** Customers were organically combining specific items at a 49% rate, but the operation was not monetizing this behavior through structured bundling or cross-category placement.

## Recommendations

- **Margin-First SKU Visibility:** Elevate high-GMROI performers to premium placement to capitalize on their superior return per inventory dollar.
- **Launch Affinity-Based Bundles:** Convert the 49% natural pairing behavior into a structured combo tier using the Market Basket self-join output as the analytical foundation.
- **Shift Peak Capacity:** Restructure product routing to move demand away from overloaded, low-margin SKUs during identified peak constraint windows.

## Next Steps

- **Live BI Dashboard Integration:** Connect the engineered SQL views into a live BI dashboard for real-time GMROI matrix monitoring and automatic Star/Workhorse reclassification.
- **Continuous Margin Tracking:** Establish a monthly automated review to proactively adjust product prioritization before cost changes erode margin quadrant assignments.
- **Inventory Turn Optimization:** Extend the GMROI model with Days of Inventory Outstanding (DIO) tracking to surface items generating high margin but moving too slowly through the catalog.
