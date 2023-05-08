# Project Week 4

## PART 1. dbt Snapshots

**Which products had their inventory change from week 3 to week 4?**

- Pothos
- String of pearls
- ZZ Plant
- Monstera
- Bamboo
- Philodendron


**Can you use the inventory changes to determine which products had the most fluctuations in inventory?**

1. String of pearls
2. Pothos
3. Philodendron
4. ZZ Plant
5. Monstera
6. Bamboo

**Did we have any items go out of stock in the last 3 weeks?**

- Pothos
- String of pearls

## PART 2. Modeling challenge


**How are our users moving through the product funnel?**

| PAGE_VIEW_TOTAL | ADD_TO_CARTS_TOTAL | CHECKOUT_TOTAL | PACKAGE_SHIPPEDS_TOTAL | PAGE_VIEWS_TO_ADD_TO_CARTS_CR | ADD_TO_CARTS_TO_CHECKOUT_CR | CHECKOUT_TO_PACKAGE_SHIPPEDS_CR | OVERALL_CONVERSION_RATE |
| --------------- | ------------------ | -------------- | ---------------------- | ----------------------------- | --------------------------- | ------------------------------- | ----------------------- |
| 578             | 467                | 361            | 335                    | 0.807958                      | 0.773019                    | 0.927977                        | 0.624567                |

**By product**

| PRODUCT_NAME        | PAGE_VIEW_TOTAL | ADD_TO_CARTS_TOTAL | CHECKOUT_TOTAL | PACKAGE_SHIPPEDS_TOTAL | PAGE_VIEWS_TO_ADD_TO_CARTS_CR | ADD_TO_CARTS_TO_CHECKOUT_CR | CHECKOUT_TO_PACKAGE_SHIPPEDS_CR | OVERALL_CONVERSION_RATE |
| ------------------- | --------------- | ------------------ | -------------- | ---------------------- | ----------------------------- | --------------------------- | ------------------------------- | ----------------------- |
| String of pearls    | 64              | 44                 | 39             | 38                     | 0.6875                        | 0.886363                    | 0.974358                        | 0.609375                |
| Arrow Head          | 63              | 39                 | 35             | 32                     | 0.619047                      | 0.897435                    | 0.914285                        | 0.555555                |
| Cactus              | 55              | 32                 | 30             | 29                     | 0.581818                      | 0.9375                      | 0.966666                        | 0.545454                |
| ZZ Plant            | 63              | 35                 | 34             | 31                     | 0.555555                      | 0.971428                    | 0.911764                        | 0.539682                |
| Bamboo              | 67              | 42                 | 36             | 34                     | 0.626865                      | 0.857142                    | 0.944444                        | 0.537313                |
| Rubber Plant        | 54              | 32                 | 28             | 27                     | 0.592592                      | 0.875                       | 0.964285                        | 0.518518                |
| Monstera            | 49              | 26                 | 25             | 23                     | 0.530612                      | 0.961538                    | 0.92                            | 0.510204                |
| Calathea Makoyana   | 53              | 32                 | 27             | 26                     | 0.603773                      | 0.84375                     | 0.962962                        | 0.509433                |
| Fiddle Leaf Fig     | 56              | 30                 | 28             | 26                     | 0.535714                      | 0.933333                    | 0.928571                        | 0.5                     |
| Majesty Palm        | 67              | 38                 | 33             | 29                     | 0.567164                      | 0.868421                    | 0.878787                        | 0.492537                |
| Aloe Vera           | 65              | 36                 | 32             | 28                     | 0.553846                      | 0.888888                    | 0.875                           | 0.492307                |
| Devil's Ivy         | 45              | 24                 | 22             | 20                     | 0.533333                      | 0.916666                    | 0.90909                         | 0.488888                |
| Philodendron        | 62              | 32                 | 30             | 25                     | 0.516129                      | 0.9375                      | 0.833333                        | 0.48387                 |
| Jade Plant          | 46              | 24                 | 22             | 20                     | 0.521739                      | 0.916666                    | 0.90909                         | 0.47826                 |
| Pilea Peperomioides | 59              | 31                 | 28             | 25                     | 0.525423                      | 0.903225                    | 0.892857                        | 0.474576                |
| Spider Plant        | 59              | 30                 | 28             | 23                     | 0.508474                      | 0.933333                    | 0.821428                        | 0.474576                |
| Dragon Tree         | 62              | 34                 | 29             | 29                     | 0.548387                      | 0.852941                    | 1                               | 0.467741                |
| Money Tree          | 56              | 26                 | 26             | 25                     | 0.464285                      | 1                           | 0.961538                        | 0.464285                |
| Orchid              | 75              | 37                 | 34             | 33                     | 0.493333                      | 0.918918                    | 0.970588                        | 0.453333                |
| Bird of Paradise    | 60              | 33                 | 27             | 25                     | 0.55                          | 0.818181                    | 0.925925                        | 0.45                    |
| Ficus               | 68              | 35                 | 29             | 27                     | 0.514705                      | 0.828571                    | 0.931034                        | 0.42647                 |
| Birds Nest Fern     | 78              | 40                 | 33             | 30                     | 0.51282                       | 0.825                       | 0.90909                         | 0.423076                |
| Pink Anthurium      | 74              | 37                 | 31             | 29                     | 0.5                           | 0.837837                    | 0.935483                        | 0.418918                |
| Boston Fern         | 63              | 34                 | 26             | 23                     | 0.539682                      | 0.764705                    | 0.884615                        | 0.412698                |
| Alocasia Polly      | 51              | 27                 | 21             | 20                     | 0.529411                      | 0.777777                    | 0.95238                         | 0.411764                |
| Peace Lily          | 66              | 35                 | 27             | 24                     | 0.530303                      | 0.771428                    | 0.888888                        | 0.40909                 |
| Ponytail Palm       | 70              | 30                 | 28             | 28                     | 0.428571                      | 0.933333                    | 1                               | 0.4                     |
| Snake Plant         | 73              | 34                 | 29             | 24                     | 0.465753                      | 0.852941                    | 0.827586                        | 0.39726                 |
| Angel Wings Begonia | 61              | 32                 | 24             | 21                     | 0.52459                       | 0.75                        | 0.875                           | 0.393442                |
| Pothos              | 61              | 24                 | 21             | 20                     | 0.393442                      | 0.875                       | 0.95238                         | 0.344262                |


**Exposure**

![alt text](https://github.com/alonso-luna/course-dbt/blob/main/greenery/DBT_Week_4_Project.png?raw=true)

## PART 3a. Reflection questions


**if your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?**

They are already two attempts of demonstrating the benefits of dbt from a consulting company and from dbt professional services. Unfortunately, both presentations where to technical for the audience. So, my job is to create a presentation that demonstrate with measuring effort the benefits of dbt in each stage of the process. For example: Time to deploy to production, time to respond an adhoc report, time to react to an emergency and so on.

**if your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?**

I believe the best practices are one of the most valuable aspects of this course. The consulting company provided a repository with recommendations but after taking this course I will suggest changing the testing strategy as well as incorporating exposure for our dashboards and leveraging the existing libraries for testing. 

**if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?**

I come from a data engineer area so for me is to learn a new skill (dbt) that allowed me to incorporate software engineering practices to data problems.


