-- 查询实验组和对照组的用户数量、家访电话覆盖率和平均时长
SELECT
    t.group AS teacher_group,
    COUNT(DISTINCT u.user_id) AS user_count,
    COUNT(DISTINCT cl.user_id) * 1.0 / COUNT(DISTINCT u.user_id) AS call_coverage_rate,
    AVG(cl.call_duration) AS avg_call_duration
FROM
    users u
LEFT JOIN teachers t ON u.experience_teacher_id = t.teacher_id
LEFT JOIN call_logs cl ON u.user_id = cl.user_id
GROUP BY
    t.group;
	
	
-- 查询实验组和对照组的续费率
SELECT
    t.group AS teacher_group,
    COUNT(DISTINCT u.user_id) AS user_count,
    SUM(r.renewal_status) * 1.0 / COUNT(DISTINCT u.user_id) AS renewal_rate
FROM
    users u
LEFT JOIN teachers t ON u.experience_teacher_id = t.teacher_id
LEFT JOIN renewals r ON u.user_id = r.user_id
GROUP BY
    t.group;	