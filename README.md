#  Apple Product Portfolio Performance Optimization: Pricing & Performance Analytics
An end-to-end full-stack data analytics project using SQL, Python, and Power BI

---

## ⚠️ Disclaimer
**Apple Product Portfolio Performance Optimization** is an educational portfolio project. It is not affiliated with, endorsed by, or representative of the real Apple Inc. corporation in any way. All financial figures, item distributions, and consumer ratings are derived entirely from a public, anonymized dataset and do not reflect any real company's actual commercial performance. The Apple visual branding and typography used in the visuals are for advanced design storytelling purposes only.

---

## 🚀 Project Overview
This project simulates a real-world analytics engagement for a global electronic hardware retail brand. The goal was to take raw, uncurated configuration logs all the way through to a decision-ready business intelligence dashboard, using the identical workflow an Analytics Engineer follows inside a tier-one company: define the target questions first, clean and validate messy strings in SQL, execute complex conditional logic and binned transformations in Python, and deliver visual business insights through an interactive Power BI report.

Built as an integrated tutorial asset to demonstrate **SQL, Python, and Power BI operating together as one unified data engineering pipeline**, rather than as three isolated toolsets.

---

## 🧠 My Thinking Process
Most portfolio projects pull a dataset down and blindly work backward to find a generic question. I completely reversed that architecture. I forced myself to write a formal Business Requirements Document (BRD) before writing a single line of code, establishing the exact commercial constraints this analysis needed to support. Every technical step taken in SQL and Python tracks directly back to an explicit business question in that BRD.

I also deliberately chose to process raw alphanumeric specification columns rather than using a pre-cleaned file. This project tackles real-world database design flaws: stripping non-numeric data, running regex-based text mining on messy chip architecture logs, and managing complex multi-column duplicate records.

---

## 💼 Business Problem
The business lacks automated visibility into long-term pricing trends, customer sentiment distributions, and inventory resource balancing across core device categories. Sourcing and pricing strategies are highly reactive; without clear technical segmentation, it is impossible for product managers to determine which specific combinations of CPU, RAM, and storage yield the highest customer satisfaction and performance margins.

### Core Business Questions Answered:
1. **Category Performance:** Which core product categories generate the highest average customer ratings, and which are under-performing?
2. **Launch Trajectory:** How have launch prices for individual product lines shifted year-over-year from 2015 to 2024?
3. **Silicon Optimization:** What is the impact of technical specifications (e.g., M-series chips vs. A-series Bionic chips) on retail pricing and final customer ratings?
4. **Luxury Storage Premiums:** Do high-tier storage variants (e.g., 1TB/2TB) justify their pricing premiums based on corresponding user satisfaction metrics?
5. **Portfolio Balance:** How is the 100k portfolio volume currently distributed across core product segments (iPhone, iPad, MacBook, Watch, AirPods), and is the product mix optimized for consumer demand?

---

## 📈 Key Findings
* **The High-End Premium Focus:** Premium tier configurations capture a **32% Premium Concentration Index (PCI)**, proving the portfolio relies heavily on luxury buyers, but exposing the brand's margins to luxury demand shocks.
* **Workstation Allocation Over-Weight:** Nearly half of the total inventory catalog (**49.4%**) is concentrated in computing hardware (MacBook/iMac). 
* **The Low-RAM Workstation Bottleneck:** The data flags **773 high-risk, underperforming SKUs** where premium M-Series processors are bottlenecked by low memory footprints (≤8GB RAM), causing customer satisfaction to plummet below the baseline.
* **Storage Upcharge Friction:** Standalone high-tier storage adjustments (1TB/2TB) trigger a sharp drop in user ratings unless backed by a corresponding upgrade in core processing power or memory capacity.

---

## 📁 Data Source
The raw data is derived from the **Apple Products Dataset** (spanning launch years from 2015 to 2024), containing **100,000 distinct configuration records** across 15 technical core columns. 

### Important Columns Monitored:
* `product_id` | `category` | `model_name` | `release_year` | `price` | `rating`
* `storage` | `ram` | `cpu` | `gpu` | `battery_mAh` | `in_stock`

---

## 🛠️ Tools and Tech Stack

| Tool / Component | Purpose in This Project |
| :--- | :--- |
| **SQL Server / SSMS** | Database mapping, staging, null identifier validation, and multi-column exact duplicate row audits. |
| **Python (pandas / numpy)** | Vectorized alphanumeric string stripping, regex processor classification, and percentile-based tier binning. |
| **Jupyter Notebook** | Interactive development environment for exploratory analysis prototyping. |
| **Power BI Desktop** | Executive application layout: 2-page minimalist user interface tracking revenue, metrics, and capabilities. |
| **DAX Language** | High-performance calculations for Total Revenue, Catalog Count, PAR, PCI, and Available Units. |

---

## ⚙️ Project Scope & Pipeline Architecture
The project is built on an enterprise-grade data pipeline moving cleanly from database sourcing to final visual intelligence:

* **SQL Layer (`/sql`):** Initial database initialization (`CREATE DATABASE AppleProduct`), structural missing identifier sweeps, and a comprehensive 14-column multi-variable deduplication tracking routine (`ExactDupeCount`) to clean staging anomalies and output the final validated warehouse layer (`dbo.AppleProductsCleaned`).
* **Python Layer (`/src` & `/notebooks`):** Exploratory data analysis via Jupyter Notebook utilizing vectorized Pandas pipelines to execute alphanumeric suffix cleaning (`.str.replace('GB', '')`), regular-expression processor extraction (`r'\bM\d|M-'`), percentile-based cost boundaries (`quantile([0.33, 0.66])`), and final multi-dimensional hardware matrix pivot aggregates exported directly to structural Excel datasets.
* **Visual Intelligence (`/powerbi`):** Secure, multi-page executive enterprise reporting suite optimized around a 2-page grid framework (**Page 1: Portfolio Intelligence** and **Page 2: Hardware Architecture**). Visuals leverage a light, consumer-grade design system mimicking native Apple web aesthetics (floating glassmorphic modules, 15px soft blur shadows, custom monochromatic metallic themes, and custom header navigation button states).

---

## 🧮 Core Analytics Concepts Demonstrated
* **Tiered Price Architecture:** Calculating live statistical percentiles (`0.33` and `0.66`) to segment pricing automatically into Budget, Medium, and High brackets.
* **Hardware Capability Matrices:** Parsing text architectures to isolate M-Series workstation chips from mobile A-Series silicon, cross-tabulating them with RAM boundaries.
* **Sentiment Quadrant Mapping:** Running 2D coordinate cross-tabulations (Price vs. Rating) to isolate **Value Premiums** (high rating/accessible price) from **At-Risk Line Items** (low rating/high cost).
* **Dimensional Modeling for BI:** Merging clean pipeline variables onto transaction-level data to create a single analysis-ready data warehouse view (`dbo.AppleProductsCleaned`).

---

## 🔄 Project Workflow

* **Step 1 — Business Requirements Document:** Established project parameters, out-of-scope conditions, data schemas, and primary metric targets before touching a single row of data.
* **Step 2 — SQL Validation & Cleansing:** Built the database staging environment, audited for empty primary keys, and ran multi-column grouping aggregates to trap exact row duplications, saving the outputs to a cleaned data table.
* **Step 3 — Python Feature Engineering:** Executed regular expressions to strip out text noise (converting memory strings like `"16GB"` to integer numbers), mapped chip categories, and cut price limits via `.quantile()` functions before exporting to analytical spreadsheet formats.
* **Step 4 — Power BI Visual Architecture:** Linked dashboard nodes to the processed data layer and engineered a premium, light-mode user interface utilizing custom theme tokens and page navigation states.

---

## 📊 Dashboard Structure

### Page 1 — Home / Workspace Navigation
* Features a clean, centered application header with an integrated ** Apple logo**.
* Houses interactive wireframe button modules acting as direct bridges to your dashboard pages.
* Contains a global **Key Metrics Glossary** defining your core portfolio drivers (**Total Revenue, Total Product, Average Rating, PCI %, and Available Units**).

### Page 2 — Portfolio Intelligence (Business Overview)
* High-level metric visual canvas mapping **Total Revenue and Product Volume by Category** (Treemaps) and long-term **Annual Revenue Trajectories by Release Year (2015–2024)**.
* Filterable via top-pinned white capsule dropdown slicers.

### Page 3 — Hardware Architecture (Pricing & Performance)
* Deep-dive analytical screen containing the **Sentiment Quadrant Map** (Scatter plot separating *Value Premiums* from *At-Risk SKUs*) and the **Hardware Capability Matrix Grid** (Muted conditional background formatting highlighting low-memory bottlenecks).

---

## 💻 Code Blueprints & Script Samples

### Sample SQL Server: Multi-Column Duplicate Audit
```sql
SELECT product_id, category, model_name, release_year, price, rating,
       COUNT(*) AS ExactDupeCount
FROM dbo.AppleProducts
