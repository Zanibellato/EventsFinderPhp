/*
	create a new user with credentials:
		username: secure_user
		password: d8Kj462H79ls
	or change the parametes $mysql_username and $mysql_password in the php files.
*/
CREATE DATABASE eventsfinder;

CREATE TABLE country(
	countryId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    countryName VARCHAR(20) NOT NULL,
    countryValue VARCHAR(4) NOT NULL
)ENGINE = INNODB;

CREATE TABLE event(
	title VARCHAR(60) NOT NULL UNIQUE PRIMARY KEY,
	description TEXT NOT NULL,
	startDate DATETIME,
	category VARCHAR(20),
	venueName VARCHAR(20),
	country VARCHAR(4),
	city VARCHAR(50),
	location VARCHAR(32),
	latitude DOUBLE,
	longitude DOUBLE,
	url TEXT,
	source VARCHAR(20),
	img TEXT
)ENGINE = INNODB;

/*Creating the list of countries*/
INSERT INTO country (countryValue, CountryName) VALUES ('AF', 'Afghanistan');
INSERT INTO country (countryValue, CountryName) VALUES ('AL', 'Albania');
INSERT INTO country (countryValue, CountryName) VALUES ('DZ', 'Algeria');
INSERT INTO country (countryValue, CountryName) VALUES ('DS', 'American Samoa');
INSERT INTO country (countryValue, CountryName) VALUES ('AD', 'Andorra');
INSERT INTO country (countryValue, CountryName) VALUES ('AO', 'Angola');
INSERT INTO country (countryValue, CountryName) VALUES ('AI', 'Anguilla');
INSERT INTO country (countryValue, CountryName) VALUES ('AQ', 'Antarctica');
INSERT INTO country (countryValue, CountryName) VALUES ('AG', 'Antigua and/or Barbuda');
INSERT INTO country (countryValue, CountryName) VALUES ('AR', 'Argentina');
INSERT INTO country (countryValue, CountryName) VALUES ('AM', 'Armenia');
INSERT INTO country (countryValue, CountryName) VALUES ('AW', 'Aruba');
INSERT INTO country (countryValue, CountryName) VALUES ('AU', 'Australia');
INSERT INTO country (countryValue, CountryName) VALUES ('AT', 'Austria');
INSERT INTO country (countryValue, CountryName) VALUES ('AZ', 'Azerbaijan');
INSERT INTO country (countryValue, CountryName) VALUES ('BS', 'Bahamas');
INSERT INTO country (countryValue, CountryName) VALUES ('BH', 'Bahrain');
INSERT INTO country (countryValue, CountryName) VALUES ('BD', 'Bangladesh');
INSERT INTO country (countryValue, CountryName) VALUES ('BB', 'Barbados');
INSERT INTO country (countryValue, CountryName) VALUES ('BY', 'Belarus');
INSERT INTO country (countryValue, CountryName) VALUES ('BE', 'Belgium');
INSERT INTO country (countryValue, CountryName) VALUES ('BZ', 'Belize');
INSERT INTO country (countryValue, CountryName) VALUES ('BJ', 'Benin');
INSERT INTO country (countryValue, CountryName) VALUES ('BM', 'Bermuda');
INSERT INTO country (countryValue, CountryName) VALUES ('BT', 'Bhutan');
INSERT INTO country (countryValue, CountryName) VALUES ('BO', 'Bolivia');
INSERT INTO country (countryValue, CountryName) VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO country (countryValue, CountryName) VALUES ('BW', 'Botswana');
INSERT INTO country (countryValue, CountryName) VALUES ('BV', 'Bouvet Island');
INSERT INTO country (countryValue, CountryName) VALUES ('BR', 'Brazil');
INSERT INTO country (countryValue, CountryName) VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO country (countryValue, CountryName) VALUES ('BN', 'Brunei Darussalam');
INSERT INTO country (countryValue, CountryName) VALUES ('BG', 'Bulgaria');
INSERT INTO country (countryValue, CountryName) VALUES ('BF', 'Burkina Faso');
INSERT INTO country (countryValue, CountryName) VALUES ('BI', 'Burundi');
INSERT INTO country (countryValue, CountryName) VALUES ('KH', 'Cambodia');
INSERT INTO country (countryValue, CountryName) VALUES ('CM', 'Cameroon');
INSERT INTO country (countryValue, CountryName) VALUES ('CA', 'Canada');
INSERT INTO country (countryValue, CountryName) VALUES ('CV', 'Cape Verde');
INSERT INTO country (countryValue, CountryName) VALUES ('KY', 'Cayman Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('CF', 'Central African Republic');
INSERT INTO country (countryValue, CountryName) VALUES ('TD', 'Chad');
INSERT INTO country (countryValue, CountryName) VALUES ('CL', 'Chile');
INSERT INTO country (countryValue, CountryName) VALUES ('CN', 'China');
INSERT INTO country (countryValue, CountryName) VALUES ('CX', 'Christmas Island');
INSERT INTO country (countryValue, CountryName) VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('CO', 'Colombia');
INSERT INTO country (countryValue, CountryName) VALUES ('KM', 'Comoros');
INSERT INTO country (countryValue, CountryName) VALUES ('CG', 'Congo');
INSERT INTO country (countryValue, CountryName) VALUES ('CK', 'Cook Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('CR', 'Costa Rica');
INSERT INTO country (countryValue, CountryName) VALUES ('HR', 'Croatia (Hrvatska)');
INSERT INTO country (countryValue, CountryName) VALUES ('CU', 'Cuba');
INSERT INTO country (countryValue, CountryName) VALUES ('CY', 'Cyprus');
INSERT INTO country (countryValue, CountryName) VALUES ('CZ', 'Czech Republic');
INSERT INTO country (countryValue, CountryName) VALUES ('DK', 'Denmark');
INSERT INTO country (countryValue, CountryName) VALUES ('DJ', 'Djibouti');
INSERT INTO country (countryValue, CountryName) VALUES ('DM', 'Dominica');
INSERT INTO country (countryValue, CountryName) VALUES ('DO', 'Dominican Republic');
INSERT INTO country (countryValue, CountryName) VALUES ('TP', 'East Timor');
INSERT INTO country (countryValue, CountryName) VALUES ('EC', 'Ecuador');
INSERT INTO country (countryValue, CountryName) VALUES ('EG', 'Egypt');
INSERT INTO country (countryValue, CountryName) VALUES ('SV', 'El Salvador');
INSERT INTO country (countryValue, CountryName) VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO country (countryValue, CountryName) VALUES ('ER', 'Eritrea');
INSERT INTO country (countryValue, CountryName) VALUES ('EE', 'Estonia');
INSERT INTO country (countryValue, CountryName) VALUES ('ET', 'Ethiopia');
INSERT INTO country (countryValue, CountryName) VALUES ('FK', 'Falkland Islands (Malvinas)');
INSERT INTO country (countryValue, CountryName) VALUES ('FO', 'Faroe Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('FJ', 'Fiji');
INSERT INTO country (countryValue, CountryName) VALUES ('FI', 'Finland');
INSERT INTO country (countryValue, CountryName) VALUES ('FR', 'France');
INSERT INTO country (countryValue, CountryName) VALUES ('FX', 'France, Metropolitan');
INSERT INTO country (countryValue, CountryName) VALUES ('GF', 'French Guiana');
INSERT INTO country (countryValue, CountryName) VALUES ('PF', 'French Polynesia');
INSERT INTO country (countryValue, CountryName) VALUES ('TF', 'French Southern Territories');
INSERT INTO country (countryValue, CountryName) VALUES ('GA', 'Gabon');
INSERT INTO country (countryValue, CountryName) VALUES ('GM', 'Gambia');
INSERT INTO country (countryValue, CountryName) VALUES ('GE', 'Georgia');
INSERT INTO country (countryValue, CountryName) VALUES ('DE', 'Germany');
INSERT INTO country (countryValue, CountryName) VALUES ('GH', 'Ghana');
INSERT INTO country (countryValue, CountryName) VALUES ('GI', 'Gibraltar');
INSERT INTO country (countryValue, CountryName) VALUES ('GK', 'Guernsey');
INSERT INTO country (countryValue, CountryName) VALUES ('GR', 'Greece');
INSERT INTO country (countryValue, CountryName) VALUES ('GL', 'Greenland');
INSERT INTO country (countryValue, CountryName) VALUES ('GD', 'Grenada');
INSERT INTO country (countryValue, CountryName) VALUES ('GP', 'Guadeloupe');
INSERT INTO country (countryValue, CountryName) VALUES ('GU', 'Guam');
INSERT INTO country (countryValue, CountryName) VALUES ('GT', 'Guatemala');
INSERT INTO country (countryValue, CountryName) VALUES ('GN', 'Guinea');
INSERT INTO country (countryValue, CountryName) VALUES ('GW', 'Guinea-Bissau');
INSERT INTO country (countryValue, CountryName) VALUES ('GY', 'Guyana');
INSERT INTO country (countryValue, CountryName) VALUES ('HT', 'Haiti');
INSERT INTO country (countryValue, CountryName) VALUES ('HM', 'Heard and Mc Donald Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('HN', 'Honduras');
INSERT INTO country (countryValue, CountryName) VALUES ('HK', 'Hong Kong');
INSERT INTO country (countryValue, CountryName) VALUES ('HU', 'Hungary');
INSERT INTO country (countryValue, CountryName) VALUES ('IS', 'Iceland');
INSERT INTO country (countryValue, CountryName) VALUES ('IN', 'India');
INSERT INTO country (countryValue, CountryName) VALUES ('IM', 'Isle of Man');
INSERT INTO country (countryValue, CountryName) VALUES ('ID', 'Indonesia');
INSERT INTO country (countryValue, CountryName) VALUES ('IR', 'Iran (Islamic Republic of)');
INSERT INTO country (countryValue, CountryName) VALUES ('IQ', 'Iraq');
INSERT INTO country (countryValue, CountryName) VALUES ('IE', 'Ireland');
INSERT INTO country (countryValue, CountryName) VALUES ('IL', 'Israel');
INSERT INTO country (countryValue, CountryName) VALUES ('IT', 'Italy');
INSERT INTO country (countryValue, CountryName) VALUES ('CI', 'Ivory Coast');
INSERT INTO country (countryValue, CountryName) VALUES ('JE', 'Jersey');
INSERT INTO country (countryValue, CountryName) VALUES ('JM', 'Jamaica');
INSERT INTO country (countryValue, CountryName) VALUES ('JP', 'Japan');
INSERT INTO country (countryValue, CountryName) VALUES ('JO', 'Jordan');
INSERT INTO country (countryValue, CountryName) VALUES ('KZ', 'Kazakhstan');
INSERT INTO country (countryValue, CountryName) VALUES ('KE', 'Kenya');
INSERT INTO country (countryValue, CountryName) VALUES ('KI', 'Kiribati');
INSERT INTO country (countryValue, CountryName) VALUES ('KP', 'Korea, Democratic People''s Republic of');
INSERT INTO country (countryValue, CountryName) VALUES ('KR', 'Korea, Republic of');
INSERT INTO country (countryValue, CountryName) VALUES ('XK', 'Kosovo');
INSERT INTO country (countryValue, CountryName) VALUES ('KW', 'Kuwait');
INSERT INTO country (countryValue, CountryName) VALUES ('KG', 'Kyrgyzstan');
INSERT INTO country (countryValue, CountryName) VALUES ('LA', 'Lao People''s Democratic Republic');
INSERT INTO country (countryValue, CountryName) VALUES ('LV', 'Latvia');
INSERT INTO country (countryValue, CountryName) VALUES ('LB', 'Lebanon');
INSERT INTO country (countryValue, CountryName) VALUES ('LS', 'Lesotho');
INSERT INTO country (countryValue, CountryName) VALUES ('LR', 'Liberia');
INSERT INTO country (countryValue, CountryName) VALUES ('LY', 'Libyan Arab Jamahiriya');
INSERT INTO country (countryValue, CountryName) VALUES ('LI', 'Liechtenstein');
INSERT INTO country (countryValue, CountryName) VALUES ('LT', 'Lithuania');
INSERT INTO country (countryValue, CountryName) VALUES ('LU', 'Luxembourg');
INSERT INTO country (countryValue, CountryName) VALUES ('MO', 'Macau');
INSERT INTO country (countryValue, CountryName) VALUES ('MK', 'Macedonia');
INSERT INTO country (countryValue, CountryName) VALUES ('MG', 'Madagascar');
INSERT INTO country (countryValue, CountryName) VALUES ('MW', 'Malawi');
INSERT INTO country (countryValue, CountryName) VALUES ('MY', 'Malaysia');
INSERT INTO country (countryValue, CountryName) VALUES ('MV', 'Maldives');
INSERT INTO country (countryValue, CountryName) VALUES ('ML', 'Mali');
INSERT INTO country (countryValue, CountryName) VALUES ('MT', 'Malta');
INSERT INTO country (countryValue, CountryName) VALUES ('MH', 'Marshall Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('MQ', 'Martinique');
INSERT INTO country (countryValue, CountryName) VALUES ('MR', 'Mauritania');
INSERT INTO country (countryValue, CountryName) VALUES ('MU', 'Mauritius');
INSERT INTO country (countryValue, CountryName) VALUES ('TY', 'Mayotte');
INSERT INTO country (countryValue, CountryName) VALUES ('MX', 'Mexico');
INSERT INTO country (countryValue, CountryName) VALUES ('FM', 'Micronesia, Federated States of');
INSERT INTO country (countryValue, CountryName) VALUES ('MD', 'Moldova, Republic of');
INSERT INTO country (countryValue, CountryName) VALUES ('MC', 'Monaco');
INSERT INTO country (countryValue, CountryName) VALUES ('MN', 'Mongolia');
INSERT INTO country (countryValue, CountryName) VALUES ('ME', 'Montenegro');
INSERT INTO country (countryValue, CountryName) VALUES ('MS', 'Montserrat');
INSERT INTO country (countryValue, CountryName) VALUES ('MA', 'Morocco');
INSERT INTO country (countryValue, CountryName) VALUES ('MZ', 'Mozambique');
INSERT INTO country (countryValue, CountryName) VALUES ('MM', 'Myanmar');
INSERT INTO country (countryValue, CountryName) VALUES ('NA', 'Namibia');
INSERT INTO country (countryValue, CountryName) VALUES ('NR', 'Nauru');
INSERT INTO country (countryValue, CountryName) VALUES ('NP', 'Nepal');
INSERT INTO country (countryValue, CountryName) VALUES ('NL', 'Netherlands');
INSERT INTO country (countryValue, CountryName) VALUES ('AN', 'Netherlands Antilles');
INSERT INTO country (countryValue, CountryName) VALUES ('NC', 'New Caledonia');
INSERT INTO country (countryValue, CountryName) VALUES ('NZ', 'New Zealand');
INSERT INTO country (countryValue, CountryName) VALUES ('NI', 'Nicaragua');
INSERT INTO country (countryValue, CountryName) VALUES ('NE', 'Niger');
INSERT INTO country (countryValue, CountryName) VALUES ('NG', 'Nigeria');
INSERT INTO country (countryValue, CountryName) VALUES ('NU', 'Niue');
INSERT INTO country (countryValue, CountryName) VALUES ('NF', 'Norfolk Island');
INSERT INTO country (countryValue, CountryName) VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('NO', 'Norway');
INSERT INTO country (countryValue, CountryName) VALUES ('OM', 'Oman');
INSERT INTO country (countryValue, CountryName) VALUES ('PK', 'Pakistan');
INSERT INTO country (countryValue, CountryName) VALUES ('PW', 'Palau');
INSERT INTO country (countryValue, CountryName) VALUES ('PS', 'Palestine');
INSERT INTO country (countryValue, CountryName) VALUES ('PA', 'Panama');
INSERT INTO country (countryValue, CountryName) VALUES ('PG', 'Papua New Guinea');
INSERT INTO country (countryValue, CountryName) VALUES ('PY', 'Paraguay');
INSERT INTO country (countryValue, CountryName) VALUES ('PE', 'Peru');
INSERT INTO country (countryValue, CountryName) VALUES ('PH', 'Philippines');
INSERT INTO country (countryValue, CountryName) VALUES ('PN', 'Pitcairn');
INSERT INTO country (countryValue, CountryName) VALUES ('PL', 'Poland');
INSERT INTO country (countryValue, CountryName) VALUES ('PT', 'Portugal');
INSERT INTO country (countryValue, CountryName) VALUES ('PR', 'Puerto Rico');
INSERT INTO country (countryValue, CountryName) VALUES ('QA', 'Qatar');
INSERT INTO country (countryValue, CountryName) VALUES ('RE', 'Reunion');
INSERT INTO country (countryValue, CountryName) VALUES ('RO', 'Romania');
INSERT INTO country (countryValue, CountryName) VALUES ('RU', 'Russian Federation');
INSERT INTO country (countryValue, CountryName) VALUES ('RW', 'Rwanda');
INSERT INTO country (countryValue, CountryName) VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO country (countryValue, CountryName) VALUES ('LC', 'Saint Lucia');
INSERT INTO country (countryValue, CountryName) VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO country (countryValue, CountryName) VALUES ('WS', 'Samoa');
INSERT INTO country (countryValue, CountryName) VALUES ('SM', 'San Marino');
INSERT INTO country (countryValue, CountryName) VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO country (countryValue, CountryName) VALUES ('SA', 'Saudi Arabia');
INSERT INTO country (countryValue, CountryName) VALUES ('SN', 'Senegal');
INSERT INTO country (countryValue, CountryName) VALUES ('RS', 'Serbia');
INSERT INTO country (countryValue, CountryName) VALUES ('SC', 'Seychelles');
INSERT INTO country (countryValue, CountryName) VALUES ('SL', 'Sierra Leone');
INSERT INTO country (countryValue, CountryName) VALUES ('SG', 'Singapore');
INSERT INTO country (countryValue, CountryName) VALUES ('SK', 'Slovakia');
INSERT INTO country (countryValue, CountryName) VALUES ('SI', 'Slovenia');
INSERT INTO country (countryValue, CountryName) VALUES ('SB', 'Solomon Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('SO', 'Somalia');
INSERT INTO country (countryValue, CountryName) VALUES ('ZA', 'South Africa');
INSERT INTO country (countryValue, CountryName) VALUES ('GS', 'South Georgia South Sandwich Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('ES', 'Spain');
INSERT INTO country (countryValue, CountryName) VALUES ('LK', 'Sri Lanka');
INSERT INTO country (countryValue, CountryName) VALUES ('SH', 'St. Helena');
INSERT INTO country (countryValue, CountryName) VALUES ('PM', 'St. Pierre and Miquelon');
INSERT INTO country (countryValue, CountryName) VALUES ('SD', 'Sudan');
INSERT INTO country (countryValue, CountryName) VALUES ('SR', 'Suriname');
INSERT INTO country (countryValue, CountryName) VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('SZ', 'Swaziland');
INSERT INTO country (countryValue, CountryName) VALUES ('SE', 'Sweden');
INSERT INTO country (countryValue, CountryName) VALUES ('CH', 'Switzerland');
INSERT INTO country (countryValue, CountryName) VALUES ('SY', 'Syrian Arab Republic');
INSERT INTO country (countryValue, CountryName) VALUES ('TW', 'Taiwan');
INSERT INTO country (countryValue, CountryName) VALUES ('TJ', 'Tajikistan');
INSERT INTO country (countryValue, CountryName) VALUES ('TZ', 'Tanzania, United Republic of');
INSERT INTO country (countryValue, CountryName) VALUES ('TH', 'Thailand');
INSERT INTO country (countryValue, CountryName) VALUES ('TG', 'Togo');
INSERT INTO country (countryValue, CountryName) VALUES ('TK', 'Tokelau');
INSERT INTO country (countryValue, CountryName) VALUES ('TO', 'Tonga');
INSERT INTO country (countryValue, CountryName) VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO country (countryValue, CountryName) VALUES ('TN', 'Tunisia');
INSERT INTO country (countryValue, CountryName) VALUES ('TR', 'Turkey');
INSERT INTO country (countryValue, CountryName) VALUES ('TM', 'Turkmenistan');
INSERT INTO country (countryValue, CountryName) VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('TV', 'Tuvalu');
INSERT INTO country (countryValue, CountryName) VALUES ('UG', 'Uganda');
INSERT INTO country (countryValue, CountryName) VALUES ('UA', 'Ukraine');
INSERT INTO country (countryValue, CountryName) VALUES ('AE', 'United Arab Emirates');
INSERT INTO country (countryValue, CountryName) VALUES ('GB', 'United Kingdom');
INSERT INTO country (countryValue, CountryName) VALUES ('US', 'United States');
INSERT INTO country (countryValue, CountryName) VALUES ('UM', 'United States minor outlying islands');
INSERT INTO country (countryValue, CountryName) VALUES ('UY', 'Uruguay');
INSERT INTO country (countryValue, CountryName) VALUES ('UZ', 'Uzbekistan');
INSERT INTO country (countryValue, CountryName) VALUES ('VU', 'Vanuatu');
INSERT INTO country (countryValue, CountryName) VALUES ('VA', 'Vatican City State');
INSERT INTO country (countryValue, CountryName) VALUES ('VE', 'Venezuela');
INSERT INTO country (countryValue, CountryName) VALUES ('VN', 'Vietnam');
INSERT INTO country (countryValue, CountryName) VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO country (countryValue, CountryName) VALUES ('VI', 'Virgin Islands (U.S.)');
INSERT INTO country (countryValue, CountryName) VALUES ('WF', 'Wallis and Futuna Islands');
INSERT INTO country (countryValue, CountryName) VALUES ('EH', 'Western Sahara');
INSERT INTO country (countryValue, CountryName) VALUES ('YE', 'Yemen');
INSERT INTO country (countryValue, CountryName) VALUES ('YU', 'Yugoslavia');
INSERT INTO country (countryValue, CountryName) VALUES ('ZR', 'Zaire');
INSERT INTO country (countryValue, CountryName) VALUES ('ZM', 'Zambia');
INSERT INTO country (countryValue, CountryName) VALUES ('ZW', 'Zimbabwe');

/* Scheduled event for delitig expired rows*/
CREATE EVENT `delete_events` 
	ON SCHEDULE EVERY 1 DAY STARTS '2015-11-10 15:00:00' 
	DO
		-- remove expired events
		DELETE FROM event WHERE startDate < NOW();
