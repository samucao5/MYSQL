USE sakila;
SELECT address_id, address, postal_code ,char_length(postal_code) AS total_caracteres_postal_code
FROM address
ORDER BY address_id DESC;