--breaking out address into individual  columns(address, city, state)
select propertyaddress
from housing_data..nashvil_housing

select  SUBSTRING(propertyaddress, 1, CHARINDEX(',', propertyaddress) -1) as address,
		SUBSTRING(propertyaddress, CHARINDEX(',', propertyaddress)+1, len(propertyaddress))  as address
from housing_data..nashvil_housing


--adding sub strings to dataset as columns
alter table housing_data..nashvil_housing
add propertyspliteaddress nvarchar(255)
update housing_data..nashvil_housing
set propertyspliteaddress = SUBSTRING(propertyaddress, 1, CHARINDEX(',', propertyaddress) -1)

alter table housing_data..nashvil_housing
add propertysplitecity nvarchar(255)
update housing_data..nashvil_housing
set propertysplitecity = SUBSTRING(propertyaddress, CHARINDEX(',', propertyaddress)+1, len(propertyaddress))

select *
from housing_data..nashvil_housing