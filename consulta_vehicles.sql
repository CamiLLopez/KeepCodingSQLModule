select v.vehicle_purchase_date as fecha_compra, v.license_plate as matricula, v.vehicle_kilometer as kilometros_totales, v.policy_id as poliza, c.color_name as coche_color, m.model_name as modelo_coche, 
b.brand_name Marca_Coche, bg.business_group_name as grupo_empresarial, ic.company_name as empresa_aseguradora

from kc_gestion.vehicle v 

inner join kc_gestion.model m on m.model_id = v.vehicle_model
inner join kc_gestion.brand b on m.brand_id = b.brand_id 
inner join kc_gestion.business_group bg on bg.business_group_id = b.business_group_id
inner join kc_gestion.color c on v.vehicle_color_id = c.color_id
inner join kc_gestion.insurance_company ic on v.company_insurance_id = ic.company_id
where v.vehicle_leave_date is null;
