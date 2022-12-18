# Grocery-Store-Price-Comparator

Objective:

This project aims to assist users in buying groceries at the most affordable price or in the most convenient location possible, depending on their needs. The system will retrieve the desired product from the database and compare the pricing of the item from multiple retailers in accordance with the price stated. It also enables us to find the product details from the closest retailers based on the user's location. This system will also keep records of each employee of respective stores and these employees are allowed to add and update products for their specific store location.

Description:

The database contains data on all the products available in merchants such as Walmart, Target, Samsclub, and the online delivery application Instacart. This data has been web scrapped from the Google Shopping web platform which includes millions of products from various merchants. The merchant table contains these merchant details along with their web URLs. The product tables contain columns such as product name, price, product inks, ratings, location in terms of zip code, etc. The Branch table data have been scrapped from the Yellow Pages website which contains the address and zip codes of all the merchant locations that are available in Boston City. The generated Employee tables contain dummy data concerning employee data such as employee id, first_name, last_name, and age for the selected merchants.
