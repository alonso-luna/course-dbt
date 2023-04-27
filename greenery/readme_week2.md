# Project Week 2

**What is our repeat rate?**

select count(distinct case when orders_quantity >= 2 then user_guid else null end) / count(distinct user_guid) from dbt_alonsolunasonycom.fct_user_orders

Answer 0.94

**What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?**
- Total number of orders
- Event distribution
- Return rate
- Product out of stock

**Explain the product mart models you added. Why did you organize the models in the way you did?**

I added fct_page_views as suggested in the project description to join dim_products and stg_postgress__events to get information about the products in each stage of the purchase.

```sql
create or replace TRANSIENT TABLE DEV_DB.DBT_ALONSOLUNASONYCOM.FCT_PAGE_VIEWS (
	PRODUCT_NAME VARCHAR(1024),
	EVENT_DATE TIMESTAMP_NTZ(9),
	SESSIONS NUMBER(18,0),
	ADD_TO_CARTS NUMBER(13,0),
	CHECKOUTS NUMBER(13,0),
	PACKAGE_SHIPPEDS NUMBER(13,0),
	PAGE_VIEWS NUMBER(13,0)
);
```
**What assumptions are you making about each model? (i.e. why are you adding each test?)**
I'm using 3 tests:
- Unique: The STG tables primary keys needs to be unique.
- Not null: Not null values for id fields, except promo_guid
- Positive values :The assumption are that each numeric value that represents an amount for a event needs to be postive.


**Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?**
Yes, I'm using almost everywhere the unique and not null test but it was failing in the tracking_guid column and aslo in the prodcut_guid while doing a join with the event table. Looks liek you can get package_shippeds wihout product_guid.

**Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.**
Running the dbt test after dbt run on a schedule and slack alerts.

**Which products had their inventory change from week 1 to week 2?**
- Pothos
- Philodendron
- Monstera
- String of pearls
