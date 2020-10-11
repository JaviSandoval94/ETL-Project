# ETL-Project
## Background
The purpose of our project was to create a database containing information of energy consumption in restaurants across the following four regions in Mexico in the last six months: CDMX, Guadalajara, Monterrey and Cancún. The final database should contain information of each of the most relevant consumption categories in the restaurant industry (HVAC, illumination, ventilation, kitchen, machinery and general contacts) and provide a comprehensible data frame to allow for comparisons using weather variables and commercial activity of each site.

## Extract
The original information was found in csv format in three different files and in JSON format from an API:
* `sites.csv`: This file contains sales and customers information of ten different sites, classified in eight different fields. The information in this file contains additional information of each site, including their tariff category and division. The columns required for the rest of the project are the `site_id`, `site_name` and `zone`. For the purpose of this project, a sample of only four regions was required and the data had to be filtered to just the first four restaurants in the list.

![sites](https://github.com/JaviSandoval94/ETL-Project/blob/master/pictures/sites.png)

* `measurements.csv`: This file contains power and energy consumption data of all the devices in each of the original ten sites. The data was collected for the last six months in intervals of 15 minutes. In addition, each of the devices is categorized into four categories: HVAC, Illumination (Ilum), Ventilation (Iny_Ext), Machinery (Mach), Kitchen (Cocina) and electrical contacts in general (Contactos).

![measurements](https://github.com/JaviSandoval94/ETL-Project/blob/master/pictures/measurements.png)

* `ventas.csv`: This file contains information of the sales and customers of each of the original ten sites. All the sales are given in Mexican pesos (MXN) and provided in daily intervals for the last six months. In addition, the data needs to be filtered to contain only the desired four sites.

![ventas](https://github.com/JaviSandoval94/ETL-Project/blob/master/pictures/ventas.png)

* Weather data: The data was extracted from the Premium API of “World Weather Online”. The requested data was obtained based on the location of each restaurant (4). Once the data was obtained, all the columns were extracted from the JSON and converted into a data frame. Finally, the non-desired columns were dropped.

![weather-data](https://github.com/JaviSandoval94/ETL-Project/blob/master/pictures/weather-data.png)

## Transform
The operations required to load these files into the data set including various steps of filtering and grouping information from the raw data. In addition, some of the categories in the original tables were made in different tables to allow for maximum data normalization and primary key connections across all the database. The most relevant steps in the process were the following:
### Data filtering
A list of the required sites was created as a Python array using the `site_id` column and all the information in the datasets including this field was filtered using our array.

![data-filtering](https://github.com/JaviSandoval94/ETL-Project/blob/master/pictures/data-filtering.png)

### Grouping
The data contained in the `measurements.csv` file was grouped by four categories: `zone`, `site_id`, `date` and `category`.

![grouping](https://github.com/JaviSandoval94/ETL-Project/blob/master/pictures/grouping.png)

### Column selection using Pandas
Having all the information loaded into Pandas DataFrames, it was easy to select just the required columns in each of the provided data sets. This allowed for more flexibility in the normalization process. To enable primary keys across all the tables and to avoid using repeated fields, some of the data had to be created in new, separate tables. This was done for the regions and the consumption categories.

![column-selection-1](https://github.com/JaviSandoval94/ETL-Project/blob/master/pictures/column-selection-1.png)

![column-selection-2](https://github.com/JaviSandoval94/ETL-Project/blob/master/pictures/column-selection-2.png)

Additional steps in the transformation process included data type transformation to change string types into comprehensive date-time type.
## Load
The final database contains six tables in total, related to each other according to the following diagram. These tables were loaded into PostgreSQL using PGAdmin.

![db-diagram](https://github.com/JaviSandoval94/ETL-Project/blob/master/pictures/ETL-Project_DB_Diagram.jpeg)

The reason that the information was created in this format was to normalize the data as much as possible. Our final database specifies daily data across all the tables, allowing for daily categorizations of consumption categories (HVAC, illumination, kitchen, ventilation, machinery and general contacts) according to weather data and commercial activity (sales and customers).
## Final remarks
This project allowed us to have fun while learning how to transform and load data into comprehensible databases. The most challenging part was defining the database structure and formatting the original data sets to allow integration into the desired structure. The data normalization part was also challenging in that we had to extract separate tables from the original sets to allow flexibility in the handling of primary and foreign keys. Next steps with this database could be performing analysis and generating data visualizations to compare how the consumption has varied in the last six months in the selected restaurants and in each of the selected consumption categories.
