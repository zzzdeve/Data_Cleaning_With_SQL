use housing_data

select distinct(soldasvacant), COUNT(soldasvacant)
from nashvil_housing
group by SoldAsVacant
order by 2




select soldasvacant,
	   case
	   when SoldAsVacant = 'N' then 'NO'
	   when SoldAsVacant = 'Y' then 'YES'
	   else SoldAsVacant
	   end as 'soldvacant_YES_NO'
from nashvil_housing
where SoldAsVacant = 'N' or SoldAsVacant ='Y'
order by 1


update nashvil_housing
set SoldAsVacant = case
					when SoldAsVacant = 'N' then 'NO'
					when SoldAsVacant = 'Y' then 'YES'
					else SoldAsVacant
					end


select distinct(soldasvacant), COUNT(soldasvacant)
from nashvil_housing
group by SoldAsVacant
order by 2