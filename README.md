E-commerce Analytics Pipeline with dbt and Snowflake
Short Objective
Build a modular data pipeline that transforms raw e-commerce transaction data into business-ready analytics tables using dbt best practices, complete with tests, documentation, and CI/CD.
High-level Summary
•	Ingest sample e-commerce data (customers, orders, products, order_items) via dbt seeds
•	Create a staging layer that cleans and standardizes raw data
•	Build mart models for customer lifetime value, product performance, and order analytics
•	Implement comprehensive testing strategy with schema and data quality tests
•	Set up GitHub Actions CI to validate pipeline integrity on every commit
Minimum Requirements
•	Snowflake: Standard edition with COMPUTE_WH warehouse access
•	dbt: Version 1.10 with dbt-snowflake adapter
•	Git: GitHub account for repository hosting
•	Local environment: Python 3.12, ability to install dbt-core and dbt-snowflake
Deliverables
•	Complete dbt project with models, tests, and documentation
•	Sample datasets as CSV seeds
•	README with setup instructions and project overview
•	GitHub Actions workflow for CI/CD
•	dbt documentation site generation
•	All code properly version controlled in Git
