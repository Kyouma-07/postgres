/***What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.


Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.

Table: fb_friend_requests
user_id_sender: varchar
user_id_receiver:   varchar
date:   datetime
action: varchar
***/

WITH sent_requests AS (
    SELECT 
        date AS request_date, 
        COUNT(*) AS sent_count
    FROM 
        fb_friend_requests
    WHERE 
        action = 'sent'
    GROUP BY 
        date
),
accepted_requests AS (
    SELECT 
        r.date AS request_date, 
        COUNT(*) AS accepted_count
    FROM 
        fb_friend_requests r
    JOIN 
        fb_friend_requests a
    ON 
        r.user_id_sender = a.user_id_sender 
        AND r.user_id_receiver = a.user_id_receiver 
        AND r.action = 'sent' 
        AND a.action = 'accepted'
    GROUP BY 
        r.date
)
SELECT 
    s.request_date,
    COALESCE(a.accepted_count, 0) * 1.0 / s.sent_count AS acceptance_rate
FROM 
    sent_requests s
LEFT JOIN 
    accepted_requests a ON s.request_date = a.request_date
ORDER BY 
    s.request_date;