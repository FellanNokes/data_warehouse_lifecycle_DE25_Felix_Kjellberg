# Exercise 1 - Extracting and loading

In this exercise, you get to familiarize yourself with snowflake roles, extracting and loading to snowflake using dlt.

> [!NOTE]
> These exercises covers lectures 05-07.

## 1. Which role to use?

Use the correct role and do the following

> [!NOTE]
> Correct role refers to the system defined role and custom role that is most suitable for the task, i.e. don't use a top-level role such as ACCOUNTADMIN to do everything.
> Follow the principle of least privilege (PoLP) - only provide necessary access for roles to perform their duties.

&nbsp; a) Create a marketing virtual warehouse called marketing_wh with size xs, 1 min suspend time, it should autoresume, suspend initially and give it a suitable comment.

&nbsp; b) Now create a database called ifood, and add a staging layer by creating a schema called staging.

&nbsp; c) Create a user called extract_loader and setup its credentials.

&nbsp; d) Create a role marketing_dlt_role and grant it access to staging.

&nbsp; e) Assign marketing_dlt_role to extract_loader user.

## 2. Load csv marketing data to snowflake

Load this [marketing data](https://www.kaggle.com/datasets/fayez7/ifood-marketing-campaigns) into the staging layer using dlt.

## 3. Load parking API to snowflake

In this exercise, you will explore the use of API data requiring an API key. Use the ```secrets.toml``` to store your API key and make sure that you don't track this file with git.

&nbsp; a) Start by asking for an API key in [open stockholm `Trafikkontorets trafik- och vägdata som öppna data`](https://openstreetgs.stockholm.se/home/). 

&nbsp; b) Then go into [parkering - API](https://openstreetgs.stockholm.se/Home/Parking), read the documentation and try to load some data you find interesting into snowflake. Remember to use an appropriate user and role for this loading task. 

## 4. Theory questions

These study questions are good to get an overview of snowflake roles and dlt for extracting and loading data.

&nbsp; a) Why is the principal of least privilege important in a company?

The principle of least privilege means giving people just enough access to do their job, and nothing more. This matters for a company for several reasons.

First, it limits the damage if something goes wrong. If an account gets compromised (e.g. through phishing), the attacker can only reach what that account has access to, not the entire system. It also reduces the risk of accidental damage, like someone deleting or leaking data they didn't actually need access to in the first place.

Second, it makes compliance and audits easier. Many industries (finance, healthcare, etc.) require companies to show exactly who has access to what and why. Least privilege makes that much simpler to track and justify.

Finally, it protects against insider risk, not just external attacks, since even employees with bad intentions can only do as much damage as their access allows.

&nbsp; b) Explain the role of dlt in managing data pipelines.

&nbsp; c) What is a data connector and why is it important in data integration?

&nbsp; d) What are the three different *write dispositions* in dlt?

&nbsp; e) What is ELT and how does it differ from ETL?
ELT stands for Extract, Load, Transform. The biggest difference compared to ETL is when the transformation happens.

In ETL, data is transformed before it's loaded into the destination. If the transformation step fails or is too slow, you risk losing or delaying data before it ever reaches storage.

In ELT, raw data is loaded first and transformed afterward, directly in the destination (e.g. a data warehouse like Snowflake). This means no data is lost even if the transformation step has issues, and it also lets you take advantage of the destination's own processing power for transformations rather than relying on a separate tool.

&nbsp; f) Discuss the advantages of performing data transformations after loading the data.

&nbsp; g) What is the purpose of roles in Snowflake?

&nbsp; h) Explain the difference between USAGE and OWNERSHIP privileges.

&nbsp; i) What information is required to create a user in Snowflake?

## Glossary

Fill in this table either by copying this into your own markdown file or copy it into a spreadsheet if you feel that is easier to work with.

| terminology         | explanation |
| ------------------- | ----------- |
| SYSADMIN            |             |
| USERADMIN           |             |
| ORGADMIN            |             |
| SECURITYADMIN       |             |
| ACCOUNTADMIN        |             |
| role inheritance    |             |
| PUBLIC role         |             |
| public schema       |             |
| API                 |             |
| ETL                 |             |
| ELT                 |             |
| data ingestion      |             |
| batch ingestion     |             |
| streaming ingestion |             |
| incremental load    |             |
| dlt connectors      |             |
| snowflake user      |             |
| staging layer       |             |
| granted to          |             |
| granted on          |             |
| granted by          |             |
| secrets.toml        |             |
| RBAC                |             |
| CRUD operations     |             |
| resource dlt        |             |
| source dlt          |             |
| yield python        |             |