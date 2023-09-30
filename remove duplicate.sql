with rownumCTE
as 
(
select *,
		ROW_NUMBER() over(
		partition by parcelid,
					 propertyaddress,
					 saleprice,
					 saledate_converted,
					 legalreference
					 order by uniqueid
					 )row_num
from housing_data..nashvil_housing
)

--select *
delete
from rownumCTE
where row_num > 1
--order by PropertyAddress