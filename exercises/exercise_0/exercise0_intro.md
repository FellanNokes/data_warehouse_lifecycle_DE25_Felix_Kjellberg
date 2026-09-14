# Exercise 0 - Introduction

In this exercise, you get to familiarize yourself with snowflake and snowsql. You will also get some overview of pricing in Snowflake. Further, you'll get an SQL repetition through querying data from snowflakes marketplace.

> [!NOTE]
> These exercises covers lectures 00-04.

## 0. Google queries

Go into marketplace under data products in snowsight. Search and get the following dataset `Google Keywords search dataset - discover all searches on Google`.

Now create a worksheet on your local repository and start querying this data through vscode.

&nbsp; a) Use this database and find out the underlying schemas, tables and views to get an overview of its logical structure.

&nbsp; b) Find out the columns and its data types in the table `GOOGLE_KEYWORDS`.

We will now do some exploratory data analysis (EDA) of this dataset.

&nbsp; c) Find out number of rows in the dataset.

&nbsp; d) When is the first search and when is the latest search in the dataset?

&nbsp; e) Which are the 10 most popular keywords?

&nbsp; f) How many unique keywords are there?

&nbsp; g) Check what type of platforms are used and how many users per platform

&nbsp; h) Let's dive into what swedish people are searching. Go into [worldbanks country codes](https://wits.worldbank.org/wits/wits/witshelp/content/codes/country_codes.htm) to find out the country code for Sweden. Find the 20 most popular keywords and the number of searches of that keyword.

&nbsp; i) Lets see how popular spotify is around the world. List the top 10 number countries and the number of searches for spotify. 

&nbsp; j) Feel free to do additional explorations of this dataset.

## 1. How much does it cost?

For these exercises, look up the credit cost for your snowflake edition, cloud provider and region for your snowflake account.

&nbsp; a) You have a simple workload that runs daily in Snowflake. The workload uses 0.5 credits per day. Calculate the total credit usage and cost for a 30-day month.

&nbsp; b) Your workload varies throughout the month. For the first 10 days, you use 2 credits per day. For the next 10 days, you use 1.5 credits per day, and for the last 10 days, you use 1 credit per day. Calculate the total credit usage and cost for a 30-day month.

&nbsp; c) You have three different warehouses running workloads simultaneously. Warehouse A is of size XS, Warehouse B is of size S, and Warehouse C is of size M. Warehouse A is used for 10h/day, B is used for 2h/day and C is used for 1h/day. Calculate the total monthly cost assuming each warehouse runs for the full 30-day month.

&nbsp; d) Your Snowflake warehouse uses auto-scaling. For the first 10 days, it operates on 2 clusters for 10 hours per day. For the next 10 days, it scales up to 3 clusters for 10 hours per day. For the last 10 days, it scales up to 4 clusters for 10 hours per day. Calculate the total monthly budget. Assume the warehouse consumes 1 credit per hour per cluster.

## 2. Theory questions
 
These study questions are good to get an overview of how snowflake works.
 
&nbsp; a) What are the main components of Snowflake's architecture?
 
Snowflake has three main layers: the **storage layer**, the **compute layer** (virtual warehouses), and the **cloud services layer**. These are decoupled from each other, which is what lets Snowflake scale storage and compute independently.
 
&nbsp; b) Explain the role of the storage layer in Snowflake.
 
The storage layer holds all the data in compressed, columnar format, organized into micro-partitions. It's managed entirely by Snowflake, stored on cloud object storage (S3, Azure Blob, or GCS depending on provider), and is shared across all virtual warehouses, so multiple compute clusters can query the same data without duplicating it.
 
&nbsp; c) What is the purpose of the compute layer in Snowflake?
 
The compute layer consists of virtual warehouses, clusters of compute resources that actually execute queries. Because it's separate from storage, you can spin up, resize, or suspend warehouses independently without affecting the underlying data.
 
&nbsp; d) How does the cloud services layer enhance the functionality of Snowflake?
 
The cloud services layer coordinates everything: authentication, query parsing and optimization, metadata management, access control, and infrastructure management. It's what makes features like query result caching, time travel, and zero-copy cloning possible.
 
&nbsp; e) What is a virtual warehouse in Snowflake, and how does it differ from a traditional data warehouse?
 
A virtual warehouse is an independent cluster of compute resources used to run queries and load data. Unlike a traditional data warehouse, where storage and compute are bundled together on the same hardware, a virtual warehouse can be started, stopped, or resized on demand without touching the stored data, and multiple warehouses can access the same data simultaneously.
 
&nbsp; f) When are the cases you would want to scale up versus scaling out in terms of virtual warehouses and compute resources.
 
**Scaling up** (increasing warehouse size, e.g. XS → M) helps when individual queries are slow or complex and need more compute power per query. **Scaling out** (adding more clusters via multi-cluster warehouses) helps when you have many concurrent users or queries running at the same time and need to handle concurrency rather than speed up a single query.
 
&nbsp; g) How does Snowflake's pricing model differ from traditional on-premise data warehousing solutions?
 
Snowflake uses a consumption-based, pay-as-you-go model where you pay separately for storage and compute, billed per-second for compute usage. Traditional on-premise warehouses require large upfront capital investment in hardware, and you pay for peak capacity whether you use it or not, regardless of actual usage.
 
&nbsp; h) What is the difference between pay-as-you-go and upfront storage, and when you should you choose one over the other?
 
Pay-as-you-go storage bills you monthly based on actual average storage used, offering flexibility for unpredictable or growing data volumes. Upfront (capacity) storage involves committing to and pre-paying for a set amount of storage, usually at a discounted rate, which makes sense when you have predictable, stable storage needs and want to lower cost per TB.
 
&nbsp; i) Explain the concept of Time Travel and Fail-safe in Snowflake and its use cases
 
**Time Travel** lets you access historical data (query, clone, or restore it) within a defined retention period (up to 90 days depending on edition), useful for recovering from accidental deletes/updates or auditing changes. **Fail-safe** is a additional 7-day period after Time Travel expires, during which Snowflake can recover data only through its own support team in case of disaster, it's a last-resort safety net, not something users can access directly.
 
## Glossary
 
| terminology | explanation |
| --- | --- |
| downstream | Systems, processes, or consumers that receive and use data *after* it has been processed or transformed. |
| upstream | Systems or sources data comes *from*, before it is processed or transformed. |
| data warehouse | A centralized system for storing and analyzing large volumes of structured data, optimized for reporting and analytics (OLAP) rather than transactional workloads. |
| cloud computing | On-demand delivery of computing resources (storage, compute, databases, etc.) over the internet, billed based on usage rather than owned hardware. |
| OLAP | Online Analytical Processing, systems optimized for complex queries and aggregations over large datasets, typically used for analytics and reporting. |
| OLTP | Online Transaction Processing, systems optimized for fast, small, frequent read/write transactions, typically used for operational applications. |
| virtual warehouse | An independent cluster of compute resources in Snowflake used to execute queries and load/unload data, decoupled from storage. |
| external stage | A named location outside of Snowflake (e.g. an S3 bucket, Azure container) used to store files for loading into or unloading from Snowflake. |
| data consumer | An account or user that accesses data shared with them, typically via Snowflake's Secure Data Sharing, without needing to copy or move it. |
| scaling out | Adding more compute clusters (multi-cluster warehouse) to handle increased concurrency, more users/queries running at once. |
| scaling up | Increasing the size of a single virtual warehouse (e.g. XS to M) to speed up individual, more complex queries. |
| snowflake credit | Snowflake's unit of billing for compute usage, consumed based on warehouse size and how long it runs. |
| securable object | Any object in Snowflake (database, schema, table, warehouse, etc.) to which access can be granted or restricted via roles and privileges. |
| schema | A logical grouping of database objects (tables, views, etc.) within a database, used to organize and namespace objects. |
| permanent table | The default table type in Snowflake, with full Time Travel and Fail-safe support, intended for long-term storage. |
| transient table | A table type with Time Travel support but no Fail-safe period, used for data that doesn't need the extra safety net, lowers storage cost. |
| temporary table | A table that exists only for the duration of the session, automatically dropped afterward, useful for intermediate/staging data. |
| time-travel | A Snowflake feature allowing access to historical data (querying, cloning, restoring) within a retention window, used for recovering from errors or auditing. |
| fail-safe | A 7-day period after Time Travel expires during which Snowflake can recover data only via support, acting as a last-resort disaster recovery mechanism. |
| view | A saved, virtual table defined by a query, that doesn't store data itself but presents a result set computed from underlying tables. |
| table | A structured object that stores data in rows and columns, the fundamental unit of data storage in Snowflake. |
| DML | Data Manipulation Language, SQL commands used to modify data within tables (e.g. `INSERT`, `UPDATE`, `DELETE`, `MERGE`). |
| DDL | Data Definition Language, SQL commands used to define or modify the structure of database objects (e.g. `CREATE`, `ALTER`, `DROP`). |
| DQL | Data Query Language, SQL commands used to query and retrieve data (primarily `SELECT`). |
| DCL | Data Control Language, SQL commands used to manage access and permissions (e.g. `GRANT`, `REVOKE`). |