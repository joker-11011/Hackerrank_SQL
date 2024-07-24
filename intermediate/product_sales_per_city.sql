SELECT 
    c.city_name, 
    p.product_name, 
    ROUND(SUM(ii.quantity * ii.price), 2) AS total_amount_spent
FROM 
    city c
JOIN 
    customer cu ON c.id = cu.city_id
JOIN 
    invoice i ON cu.id = i.customer_id
JOIN 
    invoice_item ii ON i.id = ii.invoice_id
JOIN 
    product p ON ii.product_id = p.id
GROUP BY 
    c.city_name, 
    p.product_name
ORDER BY 
    total_amount_spent DESC, 
    c.city_name ASC, 
    p.product_name ASC;
