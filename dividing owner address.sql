select owneraddress
from housing_data..nashvil_housing

select PARSENAME(REPLACE(owneraddress,',','.'), 3),
       PARSENAME(REPLACE(owneraddress,',','.'), 2),
	   PARSENAME(REPLACE(owneraddress,',','.'), 1)
from housing_data..nashvil_housing


alter table housing_data..nashvil_housing
add ownerspliteaddress nvarchar(255)
update housing_data..nashvil_housing
set ownerspliteaddress = PARSENAME(REPLACE(owneraddress,',','.'), 3)

alter table housing_data..nashvil_housing
add ownersplitecity nvarchar(255)
update housing_data..nashvil_housing
set ownersplitecity = PARSENAME(REPLACE(owneraddress,',','.'), 2)

alter table housing_data..nashvil_housing
add ownersplitestate nvarchar(255)
update housing_data..nashvil_housing
set ownersplitestate = PARSENAME(REPLACE(owneraddress,',','.'), 1)

select *
from housing_data..nashvil_housing