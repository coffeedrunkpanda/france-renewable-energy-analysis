# France Renewable Energy Analysis
![Python](https://img.shields.io/badge/Python-3.10%2B-blue)
![Status](https://img.shields.io/badge/Status-Analysis-green)
![License](https://img.shields.io/badge/License-MIT-lightgrey)
![Data](https://img.shields.io/badge/Data-Kaggle-blue)

- [France Renewable Energy Analysis](#france-renewable-energy-analysis)
  - [📖 Overview](#-overview)
  - [📊 Data Sources](#-data-sources)
  - [📂 Repository Structure](#-repository-structure)
  - [🚀 Getting Started](#-getting-started)
    - [Installation](#installation)
  - [📈 Key Analyses](#-key-analyses)
  - [🛠️ Technologies](#️-technologies)
  - [👤 Authors](#-authors)

## 📖 Overview

This project analyzes renewable energy production trends in France, specifically focusing on **Wind** and **Solar** power.

Using production data from January 2020 to December 2025, the analysis explores seasonal patterns, the growth of renewable capacity over the last five years, and possible implication of the current mix of energies on grid stability. 


## 📊 Data Sources

The data used in this repository is the **Wind & Solar Energy Production Dataset** hosted on Kaggle, which is a processed extraction from official French energy network data.


*   **Repository:** [Wind and Solar Energy Production Dataset (Kaggle)](https://www.kaggle.com/datasets/ahmeduzaki/wind-and-solar-energy-production-dataset/data?select=Energy+Production+Dataset.csv)
*   **Original Source:** [Open Data Réseaux Énergies (ODRÉ)](https://opendata.reseaux-energies.fr/)
    *   *Dataset:* [Courbes de production mensuelles Éolien & Solaire](https://odre.opendatasoft.com/explore/dataset/courbes-de-production-mensuelles-eolien-solaire-complement-de-remuneration/analyze/?disjunctive.heure)

*   **Time Period:** January 2020 – November 2025
*   **Granularity:** Hourly measurements


## 📂 Repository Structure

```bash
france-renewable-energy-analysis/
├── Reports/
│   ├── eda_univariate.ipynb          # pdf report generated from notebook
│   ├── eda_bivariate.ipynb           # pdf report generated from notebook
│   └── presentation-france-renewable-energy-analysis.pdf # Final presentation on Ironhack
├── images/                           # Generated plots (Seasonality, Trends)
│   ├── 1_eda_univariate.ipynb        # Univariate analysis
│   ├── 2_data_cleaning.ipynb         # Handling timestamps, missing values, preprocessing
│   ├── 3_eda_bivariate.ipynb         # Bivariate and multivariate analysis
│   ├── querries.sql                  # SQL business querries based on multivariate analysis
├── requirements.txt                  # Python dependencies
└── README.md                         # Project documentation
```

## 🚀 Getting Started

Prerequisites: 

* Python 3.10 or higher

### Installation

1. Clone the repository

```bash
git clone https://github.com/coffeedrunkpanda/france-renewable-energy-analysis.git
cd france-renewable-energy-analysis
```

2. Install dependencies

```bash
pip install -r requirements.txt
```

3. Usage

The notebooks already download the data from Kaggle.

Launch the main analysis notebook to view the visualizations on vscode or by:

```bash
jupyter notebook eda-univariate.ipynb
```

> Note: Before executing the `eda-bivariate.ipynb`, execute the `data-cleaning.ipynb`, to obtain the cleaned and preprocessed csv file.

## 📈 Key Analyses
The project covers the following aspects:


## 🛠️ Technologies
Pandas & NumPy: Data manipulation and cleaning.

Matplotlib & Seaborn: Static visualizations and statistical plots.

SQL (SQLite): specific querries

## 👤 Authors

Built by me (@coffeedrunkpanda) together with @suzanacracco-max for the Ironhack bootcamp of Data Science & Machine Learning.
