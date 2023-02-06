/* Objective: Create Table by the name of HousingDataNashville
Author Name: Nidhi Gupta
Script Date: 23 Jan 2023
Description of the code: This code will create table with the mentioned column names and their data types. */

DROP TABLE IF EXISTS HousingDataNashville;
CREATE TABLE HousingDataNashville (
    UniqueID INT NOT NULL,
    ParcelID VARCHAR(255),
    LandUse VARCHAR(255),
    PropertyAddress VARCHAR(255),
    SaleDate DATETIME,
    SalePrice INT,
    LegalReference VARCHAR(255),
    SoldAsVacant VARCHAR(10),
    OwnerName VARCHAR(255),
    OwnerAddress VARCHAR(255),
    Acreage DECIMAL(10,6),
    TaxDistrict VARCHAR(255),
    LandValue INT,
    BuildingValue INT,
    TotalValue INT,
    YearBuilt YEAR,
    Bedrooms INT,
    FullBath INT,
    HalfBath INT
);

/* Objective: Upload data into HousingDataNashville table
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will upload the data from csv file into created table. */

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Nashville Housing Data for Data Cleaning.csv'  INTO TABLE HousingDataNashville  FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

/* Objective: Verify the table contents
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will produce the table with the data uploaded. */

SELECT *
FROM HousingDataNashville;

/* Objective: Standardize date formats in SaleDate Column
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will add a new column of Date datatype in the table. Afterwards, new column is populated takig only date from SaleDate column. */

SELECT SaleDate
FROM HousingDataNashville;

ALTER TABLE HousingDataNashville ADD SaleDateConverted DATE;
UPDATE housingdatanashville 
SET SaleDateConverted = CONVERT(Saledate, DATE);

SELECT *
FROM HousingDataNashville;

/* Objective: Populate Property Address
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: Following set of codes will first identify the rows having no Propert Address
and then will update that column with the values in the data set having same ParcelID. */

SELECT 	A.ParcelID,
		A.PropertyAddress,
        B.ParcelID,
        B.PropertyAddress
FROM HousingDataNashville A
JOIN HousingDataNashville B
	ON A.ParcelID = B.ParcelID
    AND A.UniqueID <> B.UniqueID
WHERE A.PropertyAddress = '';

UPDATE HousingDataNashville A
JOIN HousingDataNashville B
	ON A.ParcelID = B.ParcelID
    AND A.UniqueID <> B.UniqueID 
SET A.PropertyAddress = B.PropertyAddress
WHERE A.PropertyAddress = '';

/* Objective: Breaking out Property Address into Street and City
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: Following set of codes will 2 add new columns to the table and then will update the values into those columns
by separating the street and city from the Property Address. */

ALTER TABLE HousingDataNashville ADD AddressWithStreet VARCHAR (255);
UPDATE HousingDataNashville 
SET AddressWithStreet = SUBSTRING_INDEX(PropertyAddress, ',', 1);

ALTER TABLE HousingDataNashville ADD AddressCity VARCHAR (255);
UPDATE HousingDataNashville
SET AddressCity = SUBSTRING_INDEX(PropertyAddress, ',', -1);

/* Objective: Splitting OwnerAddress into Address, city and state
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: Following set of codes will 3 add new columns to the table and then will update the values into those columns
by separating the city, street and state from the Property Address. */

ALTER TABLE HousingDataNashville
ADD COLUMN (OwnerAddressWithStreet VARCHAR (255), OwnerAddressCity VARCHAR (255), OwnerAddressState VARCHAR (255));

UPDATE HousingDataNashville
SET OwnerAddressWithStreet = SUBSTRING_INDEX(OwnerAddress, ',', 1),
	OwnerAddressCity = SUBSTRING_INDEX(substring_index(OwnerAddress, ',', 2),',',-1), OwnerAddressState = SUBSTRING_INDEX(OwnerAddress,',',-1);

/* Objective: Standardize yes and no in 'Sold as Vacant' column
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: Following set of codes will first identify the count of different values than 'Yes' and 'No'
and then will update those values. */

SELECT DISTINCT (SoldAsVacant), COUNT(SoldAsVacant)
FROM HousingDataNashville
GROUP BY SoldAsVacant
ORDER BY COUNT(SoldAsVacant) DESC;

SELECT SoldAsVacant,
    CASE
        WHEN SoldAsVacant = 'Y' THEN 'Yes'
        WHEN SoldAsVacant = 'N' THEN 'No'
        ELSE SoldAsVacant
    END AS SoldAsVacant_Updated
FROM HousingDataNashville;

UPDATE HousingDataNashville 
SET SoldAsVacant = CASE
        WHEN SoldAsVacant = 'Y' THEN 'Yes'
        WHEN SoldAsVacant = 'N' THEN 'No'
        ELSE SoldAsVacant
    END;

/* Objective: Remove duplicate values
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: Following set of codes will first identify the duplicate rows and filter them.
Then it will remove those rows. */

SELECT 	*,
		ROW_NUMBER() OVER (PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference ORDER BY SalePrice) AS RowNumber
FROM HousingDataNashville;

SELECT *
	FROM (SELECT *,
				ROW_NUMBER() OVER (PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference ORDER BY SalePrice) AS RowNumber
		FROM HousingDataNashville) A
WHERE RowNumber > 1;

DELETE FROM HousingDataNashville
WHERE UniqueID IN (SELECT UniqueID
					FROM (SELECT UniqueID, ROW_NUMBER() OVER (PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference ORDER BY SalePrice) AS RowNumber
FROM HousingDataNashville) A WHERE RowNumber > 1);

/* Objective: Remove Unused columns
Author_Name: Nidhi Gupta
Script_Date: 23 Jan 2023
Description: This code will drop the columns which have been modified above and are not needed in the table. */

ALTER TABLE HousingDataNashville
		DROP COLUMN PropertyAddress,
        DROP COLUMN SaleDate,
        DROP COLUMN OwnerAddress,
        DROP COLUMN TaxDistrict;


