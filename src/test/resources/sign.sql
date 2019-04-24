INSERT INTO SIGN(student, session, date)
VALUES
    /* Student 1 attends all sessions */
    /* Module 1 */
    (1, 1, '2018-09-05'),
    (1, 2, '2018-09-05'),
    /* Module 2 */
    (1, 3, '2017-03-09'),
    (1, 4, '2017-03-09'),
    (1, 5, '2017-04-09'),
    (1, 6, '2017-04-09'),
    /* Module 3 */
    (1, 7, '2017-03-12'),
    (1, 8, '2017-03-12'),
    (1, 9, '2017-03-15'),
    (1, 10, '2017-03-15'),
    (1, 11, '2017-03-18'),
    /* Student 2 attends all sessions */
    /* Module 2 */
    (2, 3, '2017-03-09'),
    (2, 4, '2017-03-09'),
    (2, 5, '2017-04-09'),
    (2, 6, '2017-04-09'),
    /* Module 3 */
    (2, 7, '2017-03-12'),
    (2, 8, '2017-03-12'),
    (2, 9, '2017-03-15'),
    (2, 10, '2017-03-15'),
    (2, 11, '2017-03-18'),
    /* Module 4 */
    (2, 12, '2018-03-25'),
    (2, 13, '2018-03-25'),
    (2, 14, '2018-03-26'),
    /* Student 3 attends all sessions */
    /* Module 1 */
    (3, 1, '2018-09-05'),
    (3, 2, '2018-09-05'),
    /* Module 4 */
    (3, 12, '2018-03-25'),
    (3, 13, '2018-03-25'),
    (3, 14, '2018-03-26'),
    /* Student 4 attends all sessions */
    /* Module 1 */
    (4, 1, '2018-09-05'),
    (4, 2, '2018-09-05'),
    /* Module 5 */
    (4, 15, '2018-04-01'),
    (4, 16, '2018-04-01'),
    /* Module 6 */
    (4, 17, '2018-04-03'),
    (4, 18, '2018-04-03'),
    /* Module 12 */
    /* Student 5 attends all sessions of module 1-3, < 80% sessions of module 4->6, do not attends any sessions of module 7,8 */
    /* Module 1 */
    (5, 1, '2018-09-05'),
    (5, 2, '2018-09-05'),
    /* Module 2 */
    (5, 3, '2017-03-09'),
    (5, 4, '2017-03-09'),
    (5, 5, '2017-04-09'),
    (5, 6, '2017-04-09'),
    /* Module 3 */
    (5, 7, '2017-03-12'),
    (5, 8, '2017-03-12'),
    (5, 9, '2017-03-15'),
    (5, 10, '2017-03-15'),
    (5, 11, '2017-03-18'),
    /* Module 4 2/3 sessions */
    (5, 12, '2018-03-25'),
    (5, 13, '2018-03-25'),
    /* Module 5 1/2 sessions */
    (5, 15, '2018-04-01'),
    /* Module 6 1/2 sessions */
    (5, 17, '2018-04-03'),
    /* Module 7, 8 do not attend */
    /* Student 6 attends all sessions of module 9, < 80% sessions of module 10-11, do not attends any sessions of module 12 */
    /* Module 9 */
    (6, 25, '2018-03-14'),
    /* Module 10 1/2 sessions */
    (6, 26, '2018-04-01'),
    /* Module 11 3/4 sessions */
    (6, 28, '2019-02-20'),
    (6, 29, '2019-02-20'),
    (6, 30, '2019-02-27'),
    (6, 31, '2019-02-27'),
    /* Module 12 do not attend */
    /* Student 7-> 10 attends partly sessions and can not register exam */
    (7, 1, '2018-09-05'),
    (7, 3, '2017-03-09'),
    (7, 4, '2017-03-09'),
    (8, 2, '2018-09-05'),
    (8, 32, '2019-02-21'),
    (8, 33, '2019-02-21'),
    (9, 12, '2018-03-25'),
    (9, 15, '2018-04-01');

