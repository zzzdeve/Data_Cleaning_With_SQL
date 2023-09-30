select *
from housing_data..nashvil_housing

select saledate, convert(date, saledate)
from housing_data..nashvil_housing

converting the format of data in saledate column
alter table nashvil_housing
add saledate_converted date;

update nashvil_housing
set SaleDate_converted = convert(date, saledate);

alter table nashvil_housing
drop column saledate

select *
from housing_data..nashvil_housing;


--populate property address
select *
from housing_data..nashvil_housing
where PropertyAddress is null
order by ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.PropertyAddress, b.PropertyAddress)
from housing_data..nashvil_housing a
join housing_data..nashvil_housing b
on a.parcelid = b.parcelid
and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null;

update a
set	PropertyAddress = isnull(a.PropertyAddress, b.PropertyAddress)
from housing_data..nashvil_housing a
join housing_data..nashvil_housing b
on a.parcelid = b.parcelid
and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null;

