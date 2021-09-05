SELECT
	* 
FROM
	(
	SELECT
		'Target $year0' AS rev_gross,
		ROUND( SUM( IF ( bulan = '1', absolut_target, 0 ) ), 1 ) AS Jan,
		ROUND( SUM( IF ( bulan = '2', absolut_target, 0 ) ), 1 ) AS Feb,
		ROUND( SUM( IF ( bulan = '3', absolut_target, 0 ) ), 1 ) AS Mar,
		ROUND( SUM( IF ( bulan = '4', absolut_target, 0 ) ), 1 ) AS Apr,
		ROUND( SUM( IF ( bulan = '5', absolut_target, 0 ) ), 1 ) AS May,
		ROUND( SUM( IF ( bulan = '6', absolut_target, 0 ) ), 1 ) AS Jun,
		ROUND( SUM( IF ( bulan = '7', absolut_target, 0 ) ), 1 ) AS Jul,
		ROUND( SUM( IF ( bulan = '8', absolut_target, 0 ) ), 1 ) AS Aug,
		ROUND( SUM( IF ( bulan = '9', absolut_target, 0 ) ), 1 ) AS Sep,
		ROUND( SUM( IF ( bulan = '10', absolut_target, 0 ) ), 1 ) AS Oct,
		ROUND( SUM( IF ( bulan = '11', absolut_target, 0 ) ), 1 ) AS Nov,
		ROUND( SUM( IF ( bulan = '12', absolut_target, 0 ) ), 1 ) AS Dece,
		ROUND( SUM( absolut_target ), 1 ) AS full_year 
	FROM
		target_branch_table 
	WHERE
		tahun = '$year0' $whereBranch UNION ALL
	SELECT
		'Actual $year0' AS rev_gross,
		ROUND( SUM( IF ( bulan = '1', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Jan,
		ROUND( SUM( IF ( bulan = '2', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Feb,
		ROUND( SUM( IF ( bulan = '3', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Mar,
		ROUND( SUM( IF ( bulan = '4', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Apr,
		ROUND( SUM( IF ( bulan = '5', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS May,
		ROUND( SUM( IF ( bulan = '6', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Jun,
		ROUND( SUM( IF ( bulan = '7', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Jul,
		ROUND( SUM( IF ( bulan = '8', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Aug,
		ROUND( SUM( IF ( bulan = '9', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Sep,
		ROUND( SUM( IF ( bulan = '10', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Oct,
		ROUND( SUM( IF ( bulan = '11', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Nov,
		ROUND( SUM( IF ( bulan = '12', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Dece,
		ROUND( SUM( revenue ) / POWER( 10, 9 ), 1 ) AS full_year 
	FROM
		revenue_toip_l3_monthly 
	WHERE
		tahun = '$year0' $whereBranch UNION ALL
	SELECT
		'Actual $year1' AS rev_gross,
		ROUND( SUM( IF ( bulan = '1', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Jan,
		ROUND( SUM( IF ( bulan = '2', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Feb,
		ROUND( SUM( IF ( bulan = '3', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Mar,
		ROUND( SUM( IF ( bulan = '4', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Apr,
		ROUND( SUM( IF ( bulan = '5', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS May,
		ROUND( SUM( IF ( bulan = '6', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Jun,
		ROUND( SUM( IF ( bulan = '7', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Jul,
		ROUND( SUM( IF ( bulan = '8', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Aug,
		ROUND( SUM( IF ( bulan = '9', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Sep,
		ROUND( SUM( IF ( bulan = '10', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Oct,
		ROUND( SUM( IF ( bulan = '11', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Nov,
		ROUND( SUM( IF ( bulan = '12', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Dece,
		ROUND( SUM( revenue ) / POWER( 10, 9 ), 1 ) AS full_year 
	FROM
		revenue_toip_l3_monthly 
	WHERE
		tahun = '$year1' $whereBranch UNION ALL
	SELECT
		rev_gross,
		Jan,
		Feb,
		Mar,
		Apr,
		May,
		Jun,
		Jul,
		Aug,
		Sep,
		Oct,
		Nov,
		Dece,
		ROUND(
			( Jan + Feb + Mar + Apr + May + Jun + Jul + Aug + Sep + Oct + Nov + Dece ) / 12,
			1 
		) AS full_year 
	FROM
		(
		SELECT
			'Daily Target $year0' AS rev_gross,
			ROUND( SUM( IF ( bulan = '1', absolut_target, 0 ) ) / 31, 1 ) AS Jan,
			ROUND( SUM( IF ( bulan = '2', absolut_target, 0 ) ) / 28, 1 ) AS Feb,
			ROUND( SUM( IF ( bulan = '3', absolut_target, 0 ) ) / 31, 1 ) AS Mar,
			ROUND( SUM( IF ( bulan = '4', absolut_target, 0 ) ) / 30, 1 ) AS Apr,
			ROUND( SUM( IF ( bulan = '5', absolut_target, 0 ) ) / 31, 1 ) AS May,
			ROUND( SUM( IF ( bulan = '6', absolut_target, 0 ) ) / 30, 1 ) AS Jun,
			ROUND( SUM( IF ( bulan = '7', absolut_target, 0 ) ) / 31, 1 ) AS Jul,
			ROUND( SUM( IF ( bulan = '8', absolut_target, 0 ) ) / 31, 1 ) AS Aug,
			ROUND( SUM( IF ( bulan = '9', absolut_target, 0 ) ) / 30, 1 ) AS Sep,
			ROUND( SUM( IF ( bulan = '10', absolut_target, 0 ) ) / 31, 1 ) AS Oct,
			ROUND( SUM( IF ( bulan = '11', absolut_target, 0 ) ) / 30, 1 ) AS Nov,
			ROUND( SUM( IF ( bulan = '12', absolut_target, 0 ) ) / 31, 1 ) AS Dece 
		FROM
			target_branch_table 
		WHERE
			tahun = '$year0' $whereBranch 
		) AS target_daily UNION ALL
	SELECT
		rev_gross,
		Jan,
		Feb,
		Mar,
		Apr,
		May,
		Jun,
		Jul,
		Aug,
		Sep,
		Oct,
		Nov,
		Dece,
		ROUND(
			( Jan + Feb + Mar + Apr + May + Jun + Jul + Aug + Sep + Oct + Nov + Dece ) / max_month,
			1 
		) AS full_year 
	FROM
		(
		SELECT
			'Daily Actual $year0' AS rev_gross,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 1, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 1, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Jan,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 2, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 2, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Feb,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 3, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 3, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Mar,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 4, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 4, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Apr,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 5, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 5, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS May,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 6, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 6, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Jun,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 7, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 7, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Jul,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 8, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 8, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Aug,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 9, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 9, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Sep,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 10, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 10, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Oct,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 11, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 11, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Nov,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 12, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 12, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Dece,
			MONTH ( MAX( tanggal ) ) AS max_month 
		FROM
			revenue_branch_toip_kalimantan 
		WHERE
			YEAR ( tanggal ) = '$year0' $whereBranch 
		) AS daily_actual UNION ALL
	SELECT
		rev_gross,
		Jan,
		Feb,
		Mar,
		Apr,
		May,
		Jun,
		Jul,
		Aug,
		Sep,
		Oct,
		Nov,
		Dece,
		ROUND(
			( Jan + Feb + Mar + Apr + May + Jun + Jul + Aug + Sep + Oct + Nov + Dece ) / max_month,
			1 
		) AS full_year 
	FROM
		(
		SELECT
			'Daily Actual $year1' AS rev_gross,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 1, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 1, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Jan,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 2, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 2, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Feb,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 3, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 3, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Mar,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 4, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 4, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Apr,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 5, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 5, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS May,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 6, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 6, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Jun,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 7, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 7, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Jul,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 8, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 8, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Aug,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 9, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 9, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Sep,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 10, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 10, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Oct,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 11, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 11, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Nov,
			IFNULL(
				ROUND(
					SUM( IF ( MONTH ( tanggal ) = 12, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 12, tanggal, 0 ) ) ) / POWER( 10, 9 ),
					1 
				),
				0 
			) AS Dece,
			MONTH ( MAX( tanggal ) ) AS max_month 
		FROM
			revenue_branch_toip_kalimantan 
		WHERE
			YEAR ( tanggal ) = '$year1' $whereBranch 
		) AS daily_actual 
	) AS projectline UNION ALL
SELECT
	'Ach Target $year0 (%)' AS rev_gross,
	ROUND( ( actual.Jan / target.Jan ) * 100, 0 ) AS Jan,
	ROUND( ( actual.Feb / target.Feb ) * 100, 0 ) AS Feb,
	ROUND( ( actual.Mar / target.Mar ) * 100, 0 ) AS Mar,
	ROUND( ( actual.Apr / target.Apr ) * 100, 0 ) AS Apr,
	ROUND( ( actual.May / target.May ) * 100, 0 ) AS May,
	ROUND( ( actual.Jun / target.Jun ) * 100, 0 ) AS Jun,
	ROUND( ( actual.Jul / target.Jul ) * 100, 0 ) AS Jul,
	ROUND( ( actual.Aug / target.Aug ) * 100, 0 ) AS Aug,
	ROUND( ( actual.Sep / target.Sep ) * 100, 0 ) AS Sep,
	ROUND( ( actual.Oct / target.Oct ) * 100, 0 ) AS Oct,
	ROUND( ( actual.Nov / target.Nov ) * 100, 0 ) AS Nov,
	ROUND( ( actual.Dece / target.Dece ) * 100, 0 ) AS Dece,
	ROUND( ( actual.full_year / target.full_year ) * 100, 0 ) AS full_year 
FROM
	(
	SELECT
		'Ach Target $year0' AS rev_gross,
		SUM( IF ( bulan = '1', absolut_target, 0 ) ) AS Jan,
		SUM( IF ( bulan = '2', absolut_target, 0 ) ) AS Feb,
		SUM( IF ( bulan = '3', absolut_target, 0 ) ) AS Mar,
		SUM( IF ( bulan = '4', absolut_target, 0 ) ) AS Apr,
		SUM( IF ( bulan = '5', absolut_target, 0 ) ) AS May,
		SUM( IF ( bulan = '6', absolut_target, 0 ) ) AS Jun,
		SUM( IF ( bulan = '7', absolut_target, 0 ) ) AS Jul,
		SUM( IF ( bulan = '8', absolut_target, 0 ) ) AS Aug,
		SUM( IF ( bulan = '9', absolut_target, 0 ) ) AS Sep,
		SUM( IF ( bulan = '10', absolut_target, 0 ) ) AS Oct,
		SUM( IF ( bulan = '11', absolut_target, 0 ) ) AS Nov,
		SUM( IF ( bulan = '12', absolut_target, 0 ) ) AS Dece,
		ROUND( SUM( absolut_target ), 1 ) AS full_year 
	FROM
		target_branch_table 
	WHERE
		tahun = '$year0' $whereBranch 
	) AS target
	JOIN (
	SELECT
		'Ach Target $year0' AS rev_gross,
		ROUND( SUM( IF ( bulan = '1', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Jan,
		ROUND( SUM( IF ( bulan = '2', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Feb,
		ROUND( SUM( IF ( bulan = '3', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Mar,
		ROUND( SUM( IF ( bulan = '4', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Apr,
		ROUND( SUM( IF ( bulan = '5', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS May,
		ROUND( SUM( IF ( bulan = '6', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Jun,
		ROUND( SUM( IF ( bulan = '7', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Jul,
		ROUND( SUM( IF ( bulan = '8', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Aug,
		ROUND( SUM( IF ( bulan = '9', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Sep,
		ROUND( SUM( IF ( bulan = '10', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Oct,
		ROUND( SUM( IF ( bulan = '11', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Nov,
		ROUND( SUM( IF ( bulan = '12', revenue, 0 ) ) / POWER( 10, 9 ), 1 ) AS Dece,
		ROUND( SUM( revenue ) / POWER( 10, 9 ), 1 ) AS full_year 
	FROM
		revenue_toip_l3_monthly 
	WHERE
		tahun = '$year0' $whereBranch 
	) AS actual ON target.rev_gross = actual.rev_gross UNION ALL
SELECT
	'Actual YoY $year0 (%)' AS rev_gross,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 1 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Jan,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 1 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Jan,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Jan,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 2 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Feb,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 2 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Feb,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Feb,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 3 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Mar,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 3 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Mar,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Mar,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 4 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Apr,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 4 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Apr,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Apr,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 5 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.May,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 5 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.May,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS May,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 6 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Jun,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 6 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Jun,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Jun,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 7 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Jul,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 7 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Jul,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Jul,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 8 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Aug,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 8 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Aug,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Aug,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 9 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Sep,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 9 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Sep,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Sep,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 10 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Oct,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 10 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Oct,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Oct,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 11 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Nov,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 11 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Nov,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Nov,
	IFNULL(
		ROUND(
			(
				SUM(
				IF
					(
						MONTH ( tanggal ) = 12 
						AND YEAR ( tanggal ) = $year0 
						AND DAY ( tanggal ) <= max_day.Dece,
						revenue,
						0 
					) 
					) / SUM(
				IF
					(
						MONTH ( tanggal ) = 12 
						AND YEAR ( tanggal ) = $year1 
						AND DAY ( tanggal ) <= max_day.Dece,
						revenue,
						0 
					) 
				) - 1 
			) * 100,
			1 
		),
		0 
	) AS Dece,
	'-' AS full_year 
FROM
	( SELECT 'Max Day' AS relation_key, tanggal, SUM( revenue ) AS revenue FROM revenue_branch_toip_kalimantan WHERE 2 = 2 $whereBranch GROUP BY tanggal ) AS revenue
	LEFT JOIN (
	SELECT
		'Max Day' AS relation_key,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 1 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Jan,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 2 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Feb,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 3 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Mar,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 4 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Apr,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 5 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS May,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 6 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Jun,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 7 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Jul,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 8 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Aug,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 9 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Sep,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 10 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Oct,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 11 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Nov,
		DAY ( MAX( IF ( MONTH ( tanggal ) = 12 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) ) AS Dece 
	FROM
		revenue_branch_toip_kalimantan 
	WHERE
		2 = 2 $whereBranch 
	) AS max_day ON revenue.relation_key = max_day.relation_key UNION ALL
SELECT
	'Actual YtD $year0 (%)' AS rev_gross,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Jan AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Jan, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Jan,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Feb AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Feb, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Feb,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Mar AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Mar, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Mar,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Apr AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Apr, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Apr,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.May AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.May, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS May,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Jun AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Jun, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Jun,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Jul AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Jul, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Jul,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Aug AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Aug, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Aug,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Sep AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Sep, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Sep,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Oct AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Oct, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Oct,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Nov AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Nov, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Nov,
	IFNULL(
		ROUND(
			(
				SUM( IF ( tanggal <= max_day.Dece AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / SUM( IF ( tanggal <= DATE_FORMAT( max_day.Dece, '$year1-%m-%d' ) AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) - 1 
			) * 100,
			1 
		),
		0 
	) AS Dece,
	'-' AS full_year 
FROM
	( SELECT 'Max Day' AS relation_key, tanggal, SUM( revenue ) AS revenue FROM revenue_branch_toip_kalimantan WHERE 2 = 2 $whereBranch GROUP BY tanggal ) AS revenue
	LEFT JOIN (
	SELECT
		'Max Day' AS relation_key,
		MAX( IF ( MONTH ( tanggal ) = 1 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Jan,
		MAX( IF ( MONTH ( tanggal ) = 2 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Feb,
		MAX( IF ( MONTH ( tanggal ) = 3 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Mar,
		MAX( IF ( MONTH ( tanggal ) = 4 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Apr,
		MAX( IF ( MONTH ( tanggal ) = 5 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS May,
		MAX( IF ( MONTH ( tanggal ) = 6 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Jun,
		MAX( IF ( MONTH ( tanggal ) = 7 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Jul,
		MAX( IF ( MONTH ( tanggal ) = 8 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Aug,
		MAX( IF ( MONTH ( tanggal ) = 9 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Sep,
		MAX( IF ( MONTH ( tanggal ) = 10 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Oct,
		MAX( IF ( MONTH ( tanggal ) = 11 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Nov,
		MAX( IF ( MONTH ( tanggal ) = 12 AND YEAR ( tanggal ) = $year0, tanggal, 0 ) ) AS Dece 
	FROM
		revenue_branch_toip_kalimantan 
	WHERE
		2 = 2 $whereBranch 
	) AS max_day ON revenue.relation_key = max_day.relation_key UNION ALL
SELECT
	'Projection Ach (%)' AS rev_gross,
	ROUND( ( ( rev_Jan * 31 ) / target_Jan ) * 100, 1 ) AS Jan,
	ROUND( ( ( rev_Feb * 28 ) / target_Feb ) * 100, 1 ) AS Feb,
	ROUND( ( ( rev_Mar * 31 ) / target_Mar ) * 100, 1 ) AS Mar,
	ROUND( ( ( rev_Apr * 30 ) / target_Apr ) * 100, 1 ) AS Apr,
	ROUND( ( ( rev_May * 31 ) / target_May ) * 100, 1 ) AS May,
	ROUND( ( ( rev_Jun * 30 ) / target_Jun ) * 100, 1 ) AS Jun,
	ROUND( ( ( rev_Jul * 31 ) / target_Jul ) * 100, 1 ) AS Jul,
	ROUND( ( ( rev_Aug * 31 ) / target_Aug ) * 100, 1 ) AS Aug,
	ROUND( ( ( rev_Sep * 30 ) / target_Sep ) * 100, 1 ) AS Sep,
	ROUND( ( ( rev_Oct * 31 ) / target_Oct ) * 100, 1 ) AS Oct,
	ROUND( ( ( rev_Nov * 30 ) / target_Nov ) * 100, 1 ) AS Nov,
	ROUND( ( ( rev_Dece * 31 ) / target_Dece ) * 100, 1 ) AS Dece,
	ROUND(
		(
			(
				(
					(
						( rev_Jan * 31 ) + ( rev_Feb * 28 ) + ( rev_Mar * 31 ) + ( rev_Apr * 30 ) + ( rev_May * 31 ) + ( rev_Jun * 30 ) + ( rev_Jul * 31 ) + ( rev_Aug * 31 ) + ( rev_Sep * 30 ) + ( rev_Oct * 31 ) + ( rev_Nov * 30 ) + ( rev_Dece * 31 ) 
					) / max_month 
				) * 12 
			) / target_full_year 
		) * 100,
		1 
	) AS full_year 
FROM
	(
	SELECT
		'ACH' AS rev_grossi,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 1, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 1, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jan,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 2, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 2, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Feb,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 3, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 3, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Mar,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 4, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 4, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Apr,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 5, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 5, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_May,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 6, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 6, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jun,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 7, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 7, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jul,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 8, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 8, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Aug,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 9, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 9, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Sep,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 10, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 10, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Oct,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 11, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 11, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Nov,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 12, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 12, tanggal, 0 ) ) ) / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Dece,
		MONTH ( MAX( tanggal ) ) AS max_month 
	FROM
		revenue_branch_toip_kalimantan 
	WHERE
		YEAR ( tanggal ) = '$year0' $whereBranch 
	) AS daily_actual
	JOIN (
	SELECT
		'ACH' AS rev_grossi,
		ROUND( SUM( IF ( bulan = '1', absolut_target, 0 ) ), 9 ) AS target_Jan,
		ROUND( SUM( IF ( bulan = '2', absolut_target, 0 ) ), 9 ) AS target_Feb,
		ROUND( SUM( IF ( bulan = '3', absolut_target, 0 ) ), 9 ) AS target_Mar,
		ROUND( SUM( IF ( bulan = '4', absolut_target, 0 ) ), 9 ) AS target_Apr,
		ROUND( SUM( IF ( bulan = '5', absolut_target, 0 ) ), 9 ) AS target_May,
		ROUND( SUM( IF ( bulan = '6', absolut_target, 0 ) ), 9 ) AS target_Jun,
		ROUND( SUM( IF ( bulan = '7', absolut_target, 0 ) ), 9 ) AS target_Jul,
		ROUND( SUM( IF ( bulan = '8', absolut_target, 0 ) ), 9 ) AS target_Aug,
		ROUND( SUM( IF ( bulan = '9', absolut_target, 0 ) ), 9 ) AS target_Sep,
		ROUND( SUM( IF ( bulan = '10', absolut_target, 0 ) ), 9 ) AS target_Oct,
		ROUND( SUM( IF ( bulan = '11', absolut_target, 0 ) ), 9 ) AS target_Nov,
		ROUND( SUM( IF ( bulan = '12', absolut_target, 0 ) ), 9 ) AS target_Dece,
		SUM( absolut_target ) AS target_full_year 
	FROM
		target_branch_table 
	WHERE
		tahun = '$year0' $whereBranch 
	) AS target_daily ON daily_actual.rev_grossi = target_daily.rev_grossi UNION ALL
SELECT
	'Projection MoM (%)' AS rev_gross,
IF
	( rev_Jan <> 0, ROUND( ( rev_Jan / m1_Jan - 1 ) * 100, 2 ), 0 ) AS Jan,
IF
	( rev_Feb <> 0, ROUND( ( rev_Feb / m1_Feb - 1 ) * 100, 2 ), 0 ) AS Feb,
IF
	( rev_Mar <> 0, ROUND( ( rev_Mar / m1_Mar - 1 ) * 100, 2 ), 0 ) AS Mar,
IF
	( rev_Apr <> 0, ROUND( ( rev_Apr / m1_Apr - 1 ) * 100, 2 ), 0 ) AS Apr,
IF
	( rev_May <> 0, ROUND( ( rev_May / m1_May - 1 ) * 100, 2 ), 0 ) AS May,
IF
	( rev_Jun <> 0, ROUND( ( rev_Jun / m1_Jun - 1 ) * 100, 2 ), 0 ) AS Jun,
IF
	( rev_Jul <> 0, ROUND( ( rev_Jul / m1_Jul - 1 ) * 100, 2 ), 0 ) AS Jul,
IF
	( rev_Aug <> 0, ROUND( ( rev_Aug / m1_Aug - 1 ) * 100, 2 ), 0 ) AS Aug,
IF
	( rev_Sep <> 0, ROUND( ( rev_Sep / m1_Sep - 1 ) * 100, 2 ), 0 ) AS Sep,
IF
	( rev_Oct <> 0, ROUND( ( rev_Oct / m1_Oct - 1 ) * 100, 2 ), 0 ) AS Oct,
IF
	( rev_Nov <> 0, ROUND( ( rev_Nov / m1_Nov - 1 ) * 100, 2 ), 0 ) AS Nov,
IF
	( rev_Dece <> 0, ROUND( ( rev_Dece / m1_Dece - 1 ) * 100, 2 ), 0 ) AS Dece,
	'-' AS full_year 
FROM
	(
	SELECT
		'MOM' AS rev_grossi,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 1, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 1, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jan,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 2, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 2, tanggal, 0 ) ) ) * 28 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Feb,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 3, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 3, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Mar,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 4, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 4, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Apr,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 5, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 5, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_May,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 6, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 6, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jun,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 7, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 7, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jul,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 8, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 8, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Aug,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 9, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 9, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Sep,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 10, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 10, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Oct,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 11, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 11, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Nov,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 12, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 12, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Dece,
		MONTH ( MAX( tanggal ) ) AS max_month 
	FROM
		revenue_branch_toip_kalimantan 
	WHERE
		YEAR ( tanggal ) = '$year0' $whereBranch 
	) AS daily_actual
	JOIN (
	SELECT
		'MOM' AS rev_grossi,
		SUM( IF ( MONTH ( tanggal ) = 12 AND YEAR ( tanggal ) = $year1, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Jan,
		SUM( IF ( MONTH ( tanggal ) = 1 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Feb,
		SUM( IF ( MONTH ( tanggal ) = 2 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Mar,
		SUM( IF ( MONTH ( tanggal ) = 3 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Apr,
		SUM( IF ( MONTH ( tanggal ) = 4 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_May,
		SUM( IF ( MONTH ( tanggal ) = 5 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Jun,
		SUM( IF ( MONTH ( tanggal ) = 6 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Jul,
		SUM( IF ( MONTH ( tanggal ) = 7 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Aug,
		SUM( IF ( MONTH ( tanggal ) = 8 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Sep,
		SUM( IF ( MONTH ( tanggal ) = 9 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Oct,
		SUM( IF ( MONTH ( tanggal ) = 10 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Nov,
		SUM( IF ( MONTH ( tanggal ) = 11 AND YEAR ( tanggal ) = $year0, revenue, 0 ) ) / POWER( 10, 9 ) AS m1_Dece 
	FROM
		revenue_branch_toip_kalimantan 
	WHERE
		2 = 2 $whereBranch 
	) m1 ON daily_actual.rev_grossi = m1.rev_grossi UNION ALL
SELECT
	'Projection YoY (%)' AS rev_gross,
IF
	( rev_Jan <> 0, ROUND( ( rev_Jan / y1_Jan - 1 ) * 100, 2 ), 0 ) AS Jan,
IF
	( rev_Feb <> 0, ROUND( ( rev_Feb / y1_Feb - 1 ) * 100, 2 ), 0 ) AS Feb,
IF
	( rev_Mar <> 0, ROUND( ( rev_Mar / y1_Mar - 1 ) * 100, 2 ), 0 ) AS Mar,
IF
	( rev_Apr <> 0, ROUND( ( rev_Apr / y1_Apr - 1 ) * 100, 2 ), 0 ) AS Apr,
IF
	( rev_May <> 0, ROUND( ( rev_May / y1_May - 1 ) * 100, 2 ), 0 ) AS May,
IF
	( rev_Jun <> 0, ROUND( ( rev_Jun / y1_Jun - 1 ) * 100, 2 ), 0 ) AS Jun,
IF
	( rev_Jul <> 0, ROUND( ( rev_Jul / y1_Jul - 1 ) * 100, 2 ), 0 ) AS Jul,
IF
	( rev_Aug <> 0, ROUND( ( rev_Aug / y1_Aug - 1 ) * 100, 2 ), 0 ) AS Aug,
IF
	( rev_Sep <> 0, ROUND( ( rev_Sep / y1_Sep - 1 ) * 100, 2 ), 0 ) AS Sep,
IF
	( rev_Oct <> 0, ROUND( ( rev_Oct / y1_Oct - 1 ) * 100, 2 ), 0 ) AS Oct,
IF
	( rev_Nov <> 0, ROUND( ( rev_Nov / y1_Nov - 1 ) * 100, 2 ), 0 ) AS Nov,
IF
	( rev_Dece <> 0, ROUND( ( rev_Dece / y1_Dece - 1 ) * 100, 2 ), 0 ) AS Dece,
	'-' AS full_year 
FROM
	(
	SELECT
		'YOY' AS rev_grossi,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 1, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 1, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jan,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 2, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 2, tanggal, 0 ) ) ) * 28 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Feb,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 3, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 3, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Mar,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 4, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 4, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Apr,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 5, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 5, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_May,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 6, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 6, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jun,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 7, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 7, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jul,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 8, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 8, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Aug,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 9, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 9, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Sep,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 10, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 10, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Oct,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 11, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 11, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Nov,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 12, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 12, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Dece,
		MONTH ( MAX( tanggal ) ) AS max_month 
	FROM
		revenue_branch_toip_kalimantan 
	WHERE
		YEAR ( tanggal ) = '$year0' $whereBranch 
	) AS daily_actual
	JOIN (
	SELECT
		'YOY' AS rev_grossi,
		ROUND( SUM( IF ( bulan = '1', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Jan,
		ROUND( SUM( IF ( bulan = '2', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Feb,
		ROUND( SUM( IF ( bulan = '3', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Mar,
		ROUND( SUM( IF ( bulan = '4', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Apr,
		ROUND( SUM( IF ( bulan = '5', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_May,
		ROUND( SUM( IF ( bulan = '6', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Jun,
		ROUND( SUM( IF ( bulan = '7', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Jul,
		ROUND( SUM( IF ( bulan = '8', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Aug,
		ROUND( SUM( IF ( bulan = '9', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Sep,
		ROUND( SUM( IF ( bulan = '10', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Oct,
		ROUND( SUM( IF ( bulan = '11', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Nov,
		ROUND( SUM( IF ( bulan = '12', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Dece 
	FROM
		revenue_toip_l3_monthly 
	WHERE
		tahun = '$year1' $whereBranch 
	) y1 ON daily_actual.rev_grossi = y1.rev_grossi UNION ALL
SELECT
	'Projection YtD (%)' AS rev_gross,
IF
	( rev_Jan <> 0, ROUND( ( rev_Jan / y1_Jan - 1 ) * 100, 2 ), 0 ) AS Jan,
IF
	( rev_Feb <> 0, ROUND( ( ( y0_Jan + rev_Feb ) / y1_Feb - 1 ) * 100, 2 ), 0 ) AS Feb,
IF
	( rev_Mar <> 0, ROUND( ( ( y0_Feb + rev_Mar ) / y1_Mar - 1 ) * 100, 2 ), 0 ) AS Mar,
IF
	( rev_Apr <> 0, ROUND( ( ( y0_Mar + rev_Apr ) / y1_Apr - 1 ) * 100, 2 ), 0 ) AS Apr,
IF
	( rev_May <> 0, ROUND( ( ( y0_Apr + rev_May ) / y1_May - 1 ) * 100, 2 ), 0 ) AS May,
IF
	( rev_Jun <> 0, ROUND( ( ( y0_May + rev_Jun ) / y1_Jun - 1 ) * 100, 2 ), 0 ) AS Jun,
IF
	( rev_Jul <> 0, ROUND( ( ( y0_Jun + rev_Jul ) / y1_Jul - 1 ) * 100, 2 ), 0 ) AS Jul,
IF
	( rev_Aug <> 0, ROUND( ( ( y0_Jul + rev_Aug ) / y1_Aug - 1 ) * 100, 2 ), 0 ) AS Aug,
IF
	( rev_Sep <> 0, ROUND( ( ( y0_Aug + rev_Sep ) / y1_Sep - 1 ) * 100, 2 ), 0 ) AS Sep,
IF
	( rev_Oct <> 0, ROUND( ( ( y0_Sep + rev_Oct ) / y1_Oct - 1 ) * 100, 2 ), 0 ) AS Oct,
IF
	( rev_Nov <> 0, ROUND( ( ( y0_Oct + rev_Nov ) / y1_Nov - 1 ) * 100, 2 ), 0 ) AS Nov,
IF
	( rev_Dece <> 0, ROUND( ( ( y0_Nov + rev_Dece ) / y1_Dece - 1 ) * 100, 2 ), 0 ) AS Dece,
	ROUND(
		(
			(
				(
					( rev_Jan + rev_Feb + rev_Mar + rev_Apr + rev_May + rev_Jun + rev_Jul + rev_Aug + rev_Sep + rev_Oct + rev_Nov + rev_Dece ) / max_month 
				) * 12 
			) / y1_Dece - 1 
		) * 100,
		1 
	) AS full_year 
FROM
	(
	SELECT
		'YTD' AS rev_grossi,
		ROUND( SUM( IF ( bulan <= '1', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Jan,
		ROUND( SUM( IF ( bulan <= '2', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Feb,
		ROUND( SUM( IF ( bulan <= '3', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Mar,
		ROUND( SUM( IF ( bulan <= '4', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Apr,
		ROUND( SUM( IF ( bulan <= '5', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_May,
		ROUND( SUM( IF ( bulan <= '6', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Jun,
		ROUND( SUM( IF ( bulan <= '7', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Jul,
		ROUND( SUM( IF ( bulan <= '8', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Aug,
		ROUND( SUM( IF ( bulan <= '9', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Sep,
		ROUND( SUM( IF ( bulan <= '10', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Oct,
		ROUND( SUM( IF ( bulan <= '11', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Nov,
		ROUND( SUM( IF ( bulan <= '12', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y1_Dece 
	FROM
		revenue_toip_l3_monthly 
	WHERE
		tahun = '$year1' $whereBranch 
	) y1
	JOIN (
	SELECT
		'YTD' AS rev_grossi,
		ROUND( SUM( IF ( bulan <= '1', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Jan,
		ROUND( SUM( IF ( bulan <= '2', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Feb,
		ROUND( SUM( IF ( bulan <= '3', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Mar,
		ROUND( SUM( IF ( bulan <= '4', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Apr,
		ROUND( SUM( IF ( bulan <= '5', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_May,
		ROUND( SUM( IF ( bulan <= '6', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Jun,
		ROUND( SUM( IF ( bulan <= '7', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Jul,
		ROUND( SUM( IF ( bulan <= '8', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Aug,
		ROUND( SUM( IF ( bulan <= '9', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Sep,
		ROUND( SUM( IF ( bulan <= '10', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Oct,
		ROUND( SUM( IF ( bulan <= '11', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Nov,
		ROUND( SUM( IF ( bulan <= '12', revenue, 0 ) ) / POWER( 10, 9 ), 9 ) AS y0_Dece 
	FROM
		revenue_toip_l3_monthly 
	WHERE
		tahun = '$year0' $whereBranch 
	) y0 ON y1.rev_grossi = y0.rev_grossi
	JOIN (
	SELECT
		'YTD' AS rev_grossi,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 1, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 1, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jan,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 2, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 2, tanggal, 0 ) ) ) * 28 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Feb,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 3, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 3, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Mar,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 4, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 4, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Apr,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 5, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 5, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_May,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 6, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 6, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jun,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 7, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 7, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Jul,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 8, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 8, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Aug,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 9, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 9, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Sep,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 10, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 10, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Oct,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 11, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 11, tanggal, 0 ) ) ) * 30 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Nov,
		IFNULL(
			ROUND(
				SUM( IF ( MONTH ( tanggal ) = 12, revenue, 0 ) ) / DAY ( MAX( IF ( MONTH ( tanggal ) = 12, tanggal, 0 ) ) ) * 31 / POWER( 10, 9 ),
				9 
			),
			0 
		) AS rev_Dece,
		MONTH ( MAX( tanggal ) ) AS max_month 
	FROM
		revenue_branch_toip_kalimantan 
	WHERE
	YEAR ( tanggal ) = '$year0' $whereBranch 
	) AS daily_actual ON y1.rev_grossi = daily_actual.rev_grossi
