Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E0953FB8
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2024 04:33:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=E12O1tWq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlQyq4fPKz2yk7
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2024 12:33:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::700" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::700; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlQxh2Ljhz2xFr;
	Fri, 16 Aug 2024 12:32:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLlfts2J1seoBfu/gZVDO27xcvVaJNsliV8YTUZpIT9I13wBnYFEWRVvk3bblQ8A9dH7EZFYol05v05pkw4esKDgp+dDDeQU82kTphQajhbelOZRugl1iIspZ8nSAQ/Zq5tN3dearoHtYLYdErSTcUpSWdgzj52IprnnMrdIQUTQgfNL3yJdz6mTb0XMxpoKQnc83FrRd8aBrscViYrMlUdc9oKx6+yXGU92nPNmu0SBXGUUPLxcCV++SzOaCBiy7MEXrCdOe3LoFglATE/d3qBDNCfPjS0xmGxLcR7Ssl7Q2iAqbAQ5bcyhQkbfSqebqsgd9jpu/xUa9P9v/KxhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIN6+1KjuhQeBu64F58Tu4irh7GV15vjNWCV9IjpxM8=;
 b=ZPJEC6pRkj/YyZikdBb7l09m5DlkHCKqbNRSXxtVCkqVk++ie8iUi6eDhWwcsAc13MiTkwlkrXmmVfUdtrLTo0VJ+YkMxHU9qyokZqB7Qbs36exj81UDe1gLddMK6Dvdt2GGLcrvI5nZblXubgCbn2Wze0poDxD7H963lbv8HMSA+TwEJpovSpWvkY+iVXcvZ646xgHQUXjvZjCq+D8uqfeYPLhdyIYzFIzwcHkF5u9T6mJl2TOtGtaAwMfVosHS1lBvhk6kly3M6dtgel6geXV/FJwing/AaE+fDjmdyiI+W6kD+3Fs7sVWtTQ5jMjAoPXadVD30VdoV9Hlu+UX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIN6+1KjuhQeBu64F58Tu4irh7GV15vjNWCV9IjpxM8=;
 b=E12O1tWqiFhEoiLL3jPd+j2x3/XpSnbn2I2D1G6+t28y7SsIltGVgder6yeZFefcGyd3sTNL56L+OHahgFDf/wvNiRH2uwAOt9Rzs5zq2dCxCN6VS88CqVJzmlc+Io9TXTiaRXpgjRE0ZIdqAR94zu1Og7rHvhSO7/cVLNFNO/n35e6KsB6A0PDJBQvAPmeLALsVK/jI56YUTXKr/AViLxrsF8gT9wq6JPmGjuky9ZcXpVCaQD/luabtC+00aTlHq7nlmalggD2C+NKZtwTALYkit27CnNFL+yqswhCE+fI1g98/OeEf2Psd+8VYjPhWGiGRiBnR1nN3um7fG4lDtw==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by SEZPR06MB6119.apcprd06.prod.outlook.com (2603:1096:101:e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 02:31:43 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%4]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 02:31:43 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "eajames@linux.ibm.com"
	<eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>
Subject: RE: [PATCH v4 2/2] media: aspeed: Allow to capture from SoC display
 (GFX)
Thread-Topic: [PATCH v4 2/2] media: aspeed: Allow to capture from SoC display
 (GFX)
Thread-Index: AQHa7hCAqZ9lVQfKXEmUH9n0d6ESQ7IpLFQg
Date: Fri, 16 Aug 2024 02:31:43 +0000
Message-ID:  <TYZPR06MB6568197D19B5855A014A0ECBF1812@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20240814005421.3362441-1-jammy_huang@aspeedtech.com>
 <20240814005421.3362441-3-jammy_huang@aspeedtech.com>
 <003090ab-4ce2-4624-b5c5-33ceef521e9d@kernel.org>
In-Reply-To: <003090ab-4ce2-4624-b5c5-33ceef521e9d@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|SEZPR06MB6119:EE_
x-ms-office365-filtering-correlation-id: a58f5a09-a202-4d3f-9666-08dcbd9b9115
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?NHFXa3YxZFpxR2ZheTJzUGVOcDFMN2MzNFpNZDZzazZOekFlUjhwYUtCVlhi?=
 =?utf-8?B?UlRWYVVSTnIvdVJYTk9qeU90Z2VMNWlYVWZVWUY4d3QwcEJHbXNWWXA0cXF2?=
 =?utf-8?B?NC9UU0I0b3ZXczRDMHZ1RHR0bGZyb2dZbXZmd0tScWhoYTBXRFJiUWVLS3JV?=
 =?utf-8?B?S0duSjlGMmxJQnFPeXdkN3BRU0krSDlFOUxGZkp0TjZpcm1OV2Z2VUM1MmxT?=
 =?utf-8?B?TWhqWGlVMGdVWkdwdS9CeVJwTmJiTUV4ZmlLRHRMUmhjcWdmZkJ2UDJhdy95?=
 =?utf-8?B?SEFuVnBtdDMvWWkvMVFzZ050WE5VWFVVZkt5SnpiS29zUGpNS29YZjBzVHFt?=
 =?utf-8?B?Vy82THBwTUJQWXl3bVgyM2ZxRXJGcFcvRUgwenZReTJIL3FtUHZOTmJrV1hl?=
 =?utf-8?B?N0JoOG56MXRMYkxET05tcUlnNFNUTnJTTjMrSDVjZCtZVHVoaG5haFJKQm1L?=
 =?utf-8?B?YnFyMHVYVDd6WDdoYXJRdkY4VnFlaXB6bW51NVA1U2ROeVpXeklCU1ZyRG1v?=
 =?utf-8?B?czh5S0Qyc3FnYnZURGdSRG9aTjNxU3l6cVZMaG04TWYzNEI4N1ByL2x5QWZw?=
 =?utf-8?B?S2gybEF3RTFTRi9RekdJNXcwVW5zaDRNenhFcURUWHJpQ3loNGdHWkVRZitZ?=
 =?utf-8?B?dDVCNWxpd2h3djRZNXVKdXZqdnlzajlSOHZNRnVEYVc4OFpTTGdhYStaZnNH?=
 =?utf-8?B?MCszWStOYzdEY2tBZVVQNmFFK1BiKzRnM2JqdEFKYUt0Y1RBZjZnZmlKUlFZ?=
 =?utf-8?B?SjhyVEJKVkVacmFFK0tUNG1SRDlWdyt0MGlTc2ZJbStSdFBKZzVLcllxeW43?=
 =?utf-8?B?SE5xcDhaWnBZTGpsYzFTSk1oMFZBcFExTldQRlNERlFLV1ExbndsbDd2cnln?=
 =?utf-8?B?SEptTU9XVGpNeHlGY2VuNVVDREtWSUl4bnBORWc5U1Byd3VHOGVxUzlFNWpj?=
 =?utf-8?B?MXNhQ3paUWxkeXBEYTFDV0F3cFpEQ25uUXNuREI3L1RnL1d1QURpdGZzM3NQ?=
 =?utf-8?B?Zit2UENWWlVPZllHbmtkRnp5N0k5cGw2cUV1UExhdmRPekVKWHNnZjh2KzIy?=
 =?utf-8?B?UjFmWEV5UUIxaHY1a3RSc28ya2VSOFZwZGE0K3RzOW0vMVMyTkhPNnZWNE5D?=
 =?utf-8?B?Z2NGaWh5d0JKZzRuRFFxdHRndnhiN3ZmSUkzb1I4Q25zQzJMK2tJQW1tNnVn?=
 =?utf-8?B?YmlhVDlqd0IvSlJhaFA0eHhjLytIUm9NS3NBMnNKQkpxdzRUZ0dobGd3Mlc4?=
 =?utf-8?B?RmQyTnRaT096bDhPVVZuVFBJY2NzblRDQjVVanNhViszR1p1SXFacU5zRzVn?=
 =?utf-8?B?Q3NHT0N6eGxBNDloVk0zQUtMMEdUUUcxb1BWZ005TENOSENMQ0RlcGdxU3Fl?=
 =?utf-8?B?K0FTa2tMTTVEc1FWT3ZITW0xaG4rRVR3WkNaWkM2UzdVWHY2N1FYWlRZeEdU?=
 =?utf-8?B?WXpSK1B6MnhRQXRpOE1taG04ZXFHUGJmT291Z0dnb1RNbktuVlhZeXBwNEVo?=
 =?utf-8?B?Ym5qTkJqcXhHeVpJeVNoT282TG4wTnlhU0ZtdmlaVEJySTF3S3ducnFvM3BN?=
 =?utf-8?B?VTB2b0o2R3pNNmo2NUNVVjNOMlJSRDlXR0lWeS9QWXpsK0RIUFd0UTVpeGlC?=
 =?utf-8?B?TWRxT1JrZXhGSWUzdFpZUjZ2a2Q1WFgvYkl2dS9IbFVuM1VGb3p4WFN0d3lE?=
 =?utf-8?B?TUgrY0xHbm02VjA0RzZrbUthRFhkaFliQndvK2xmNHFKK1o0b0hVT1BpZHhr?=
 =?utf-8?B?SXJpYjJNMnRGRWpESlNZYmxSZHBNVVpndzZQRlVYUjdFSTlqUTRLVmZnRTNG?=
 =?utf-8?B?aFJqOEZ0NEQ5clMyNHRKNkM5ZkRVeTB6RlBPR0VWc2gxOWhuVmFubHllUWxy?=
 =?utf-8?B?Z0d4R01yRmhFaDlpWXc5N2RUWUppL2VKRHRPU0p3VGtpUnc9PQ==?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TzF2eVNSTXU3MlFyUmhDeGJnSEJVbjY3NFJiRTFkOERWK2R2czZ3MTJ1SXNJ?=
 =?utf-8?B?WkJtUTlIQmd0QjRvWjdLeUJZYnZkTVZqRzNtemM4enhTR2hERWxZZHF3TC80?=
 =?utf-8?B?WTNIcThKNUx5cFI5NXBZK3QrZ1hXYzF5UjA2aG1tNUpoZDNLR291WnlJbkZH?=
 =?utf-8?B?UzNob0ozQWZaMEQ5NXFqM3gzbkt6ZjNVcnFCbk9VemVpQmZOY2hIcW5CanVZ?=
 =?utf-8?B?bXFYNWdrUUY2WlpQdHM0UFFxa3hpVVpRQmsxaHZsSi8zRUZNVzBkVGFxRUdu?=
 =?utf-8?B?QlFZMmFOVlRlNVR2YXArSEtLbkZpaTlGVUJkdkdnY0lmaU1aSDc4cUsrSXMr?=
 =?utf-8?B?WGdRUmVLQ25aUit5TnhhbnM1WHJ1ZUltU25pUm9Rb09IQ0FFZGZ2UWt1Wmdo?=
 =?utf-8?B?VXJla1pIOEp4RjhDMHQrZ2pGckgxM3QrbExjdEhWSU1aaXVXK1lQcXBjRmE4?=
 =?utf-8?B?bGl6WDhkazJmelBuVWxXY3JsWndMRWpETmp4bzJRVEVzQ041VURRRm5uMDdN?=
 =?utf-8?B?R0gwRFo4SmJYRm5KS3gwcHdTOHBJVnBURGZXTmphUHBSSE9PSU9yZDRiYURI?=
 =?utf-8?B?d3JyLzhOR0xmVkE0K0o1Mmc1cEZkWjA4QjVjMnFPREloK3pFOU5JdTZSYVp4?=
 =?utf-8?B?eXBDMXlyc1BLQW96TEJOU3ArOGoybnJtbXRwQXVJakt3aHZ0bm1oTnQ4NnR4?=
 =?utf-8?B?WHhuaTNDTlVleEpLWUhvUU9GR2pvOWUvdDFPV2FYcFJCbXBqVWFIenh5a01P?=
 =?utf-8?B?THZFZVdvOHJrMDNEZCtHcEtHbHpmdXBQNVlhcmp1djlSVXM5cFVkUjVXa29O?=
 =?utf-8?B?ZUhWRHNOSkszUFJWUjVpcmJubG1iSnZtT2VzN25XTUFqVHhqRE04N2ZNVHBI?=
 =?utf-8?B?Y0dRMTd5V0wvYmJaU3h0MVlrNFd1SGtoYWpIQjNvWWxpUStWY0lwY0QrNmRp?=
 =?utf-8?B?VGwzZzM2diszTjV6bVpzUWozQ0xXazRMQXFYY1phVGVhdEk2RDdQZzFBM0JV?=
 =?utf-8?B?UWxpcHg5OFBQdVo2U1NTTG5qbkdaZ2VhU05NaU9UK2JkaVJnbmx6Wk44N1Fz?=
 =?utf-8?B?WmV6cVE4T1c0Um1ETDJraVYwTVJvMy9Mb3R1RmNSdlFiSlJWVnNOVHJSaDR1?=
 =?utf-8?B?alVyRHdKYVFxa3lPUm5SS3Q2WnVDTUVlMzVHUXBCcjhFUCtyckpWbGNrMVJ5?=
 =?utf-8?B?OHhreXdNc3lvQnpLTDVoM1JVbXBENzhPS083MWpXL1dzbndnbHFidjIyc2pL?=
 =?utf-8?B?MGxHd3h4UnVkOEQ5QTlROEhWdUpPMmtZNzA3c2NMZ3U1aFE4ekRJcVI5cTAx?=
 =?utf-8?B?a3h3S3hpSmR3UlptRWk5aStTOXhBSTNyaFpScnlVUEVxbjhHMVpBQlZIM0hi?=
 =?utf-8?B?aVh5V2hjQW40aGZoaGNORUZvTUwxOFEzZWZYSXNNOGEzNzJOUURJWjA1MU5K?=
 =?utf-8?B?YXlXeG5rYXVFbmpsdFFhRlltYnRvSUpDWG05Z3ZIRXRmQ2JBR09SdUtpYzlt?=
 =?utf-8?B?NzF3V0tGbU4veEJWS3l2c1ZaeGFOSnpUdTFJNElHMzI4bUs1cUUwN1dyYVRY?=
 =?utf-8?B?b1E1R1ZhZ2tFbThwM1RPOGlYU3RCQXY1aG90WXYrZ005N0lNYlF0b2ticHFl?=
 =?utf-8?B?UVFyV1R3V0FvT1NkaDdFTTQ2R0lGWmwvMmpVcm0yT0g1aGJJRjVFcUQzdjZ5?=
 =?utf-8?B?T2d5YUVGekx0Zk5wTDA2K1hEWEc0ODVrMFJoVnBkSnhSSS9nV3doanZiN0Zj?=
 =?utf-8?B?UFZsZG9aZHpSZzA1T3VGZzVud2ZnckZEYmtCcU5nL2FYb2pkZ3NmTStyeTVE?=
 =?utf-8?B?dC9mTTNRZUszZmtYQzNpWm1LYVZ3ZkQ3d29SMGRwTzJOclcxN0YwZWQ2RFU5?=
 =?utf-8?B?N3VBMG96QVdnZzU2TVZ4bTlXUlNHZ3VKY1NkY0JQcFk4dFU4K1pKaG80VGlR?=
 =?utf-8?B?b1pGakNxNlkyLzB1cFZuWU1PQnJjbXg0WHNJbThBMlR0Y0Z2NXJtR3JNeWhB?=
 =?utf-8?B?ZFZGK0YvallXbjBwSFhGaWwyazlMVmlxeDRCT0E5SnNDeEJIbHVGdSsvV2wv?=
 =?utf-8?B?aGt0bkFsY05RVnVLWnpBdzBIRU9iV01hWEhKQlI4UENFREt1dGJRUGVLVjVY?=
 =?utf-8?B?NFFyS2RlcDhTcTUzS0xFU09Uc3pNY1BtVjJGT1p0amExZDNGcmVoWEJkU3gz?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58f5a09-a202-4d3f-9666-08dcbd9b9115
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 02:31:43.1028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7pcav5LdEzwZjnJBHq9O5o7IQ6KDE+TiDf5LqFTi8RfWJnYsuAKkPQ5AkyN0+Y8Bl+LNlXBxuGVD0+sfDTeD/MtOkfnK+CfB2HrP0iOW70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6119
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiAyMDI0LzgvMTQg5LiL5Y2IIDAyOjA5LCBLcnp5c3p0b2YgS296
bG93c2tpIHdyb3RlOg0KPg0KPiBPbiAxNC8wOC8yMDI0IDAyOjU0LCBKYW1teSBIdWFuZyB3cm90
ZToNCj4gPiArLyoNCj4gPiArICogR2V0IHJlZ21hcCB3aXRob3V0IGNoZWNraW5nIHJlcywgc3Vj
aCBhcyBjbGsvcmVzZXQsIHRoYXQgY291bGQNCj4gPiArbGVhZCB0bw0KPiA+ICsgKiBjb25mbGlj
dC4NCj4gPiArICovDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcmVnbWFwICphc3BlZWRfcmVnbWFwX2xv
b2t1cChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0KPiA+ICtjb25zdCBjaGFyICpwcm9wZXJ0eSkg
ew0KPiA+ICsgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnN5c2Nvbl9ucCBfX2ZyZWUoZGV2aWNlX25v
ZGUpID0NCj4gb2ZfcGFyc2VfcGhhbmRsZShucCwgcHJvcGVydHksIDApOw0KPiA+ICsgICBzdHJ1
Y3QgcmVnbWFwICpyZWdtYXA7DQo+DQo+IERyb3AuIFRoZSBwb2ludCBvZiB1c2luZyBfX2ZyZWUg
d2FzIHRvIG1ha2UgdGhpcyB2ZXJ5IHNpbXBsZS4NClRvIGJlIHNpbXBsZXIsIGl0IHdpbGwgbG9v
a3MgbGlrZSB0aGlzLCByaWdodC4NCg0KKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnN5c2Nv
bl9ucCBfX2ZyZWUoZGV2aWNlX25vZGUpID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgcHJvcGVydHks
IDApOw0KKw0KKyAgICAgICBpZiAoIXN5c2Nvbl9ucCkNCisgICAgICAgICAgICAgICByZXR1cm4g
RVJSX1BUUigtRU5PREVWKTsNCisgICAgICAgcmV0dXJuIGRldmljZV9ub2RlX3RvX3JlZ21hcChz
eXNjb25fbnApOw0KPg0KPiA+ICsNCj4gPiArICAgaWYgKCFzeXNjb25fbnApDQo+ID4gKyAgICAg
ICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7DQo+ID4gKw0KPiA+ICsgICByZWdtYXAgPSBk
ZXZpY2Vfbm9kZV90b19yZWdtYXAoc3lzY29uX25wKTsNCj4gPiArDQo+ID4gKyAgIHJldHVybiBy
ZWdtYXA7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBpbnQgYXNwZWVkX3ZpZGVvX2luaXQo
c3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8pICB7DQo+ID4gICAgIGludCBpcnE7DQo+ID4gICAg
IGludCByYzsNCj4gPiAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gdmlkZW8tPmRldjsNCj4gPg0K
PiA+ICsgICB2aWRlby0+c2N1ID0gYXNwZWVkX3JlZ21hcF9sb29rdXAoZGV2LT5vZl9ub2RlLCAi
YXNwZWVkLHNjdSIpOw0KPiA+ICsgICB2aWRlby0+Z2Z4ID0gYXNwZWVkX3JlZ21hcF9sb29rdXAo
ZGV2LT5vZl9ub2RlLCAiYXNwZWVkLGdmeCIpOw0KPg0KPiBTdGlsbCB1bmRvY3VtZW50ZWQuIFJl
c3BvbmQgdG8gcHJldmlvdXMgY29tbWVudCBhbmQgY29uZmlybSB0aGF0IHlvdQ0KPiB1bmRlcnN0
b29kIGl0Lg0KU29ycnkgZm9yIG1pc3VuZGVyc3RhbmRpbmcuIEkgd2lsbCBhZGQgZG9jdW1lbnQs
DQpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FzcGVlZC9hc3BlZWQsdmlk
ZW8ueWFtbCwgbGF0ZXIuDQoNCj4NCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
KioqKioqKioqKioqKiBFbWFpbCBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioq
KioqKioqDQrlhY3osqzogbLmmI46DQrmnKzkv6Hku7Yo5oiW5YW26ZmE5Lu2KeWPr+iDveWMheWQ
q+apn+Wvhuizh+ioiu+8jOS4puWPl+azleW+i+S/neitt+OAguWmgiDlj7Dnq6/pnZ7mjIflrprk
uYvmlLbku7bogIXvvIzoq4vku6Xpm7vlrZDpg7Xku7bpgJrnn6XmnKzpm7vlrZDpg7Xku7bkuYvn
mbzpgIHogIUsIOS4puiri+eri+WNs+WIqumZpOacrOmbu+WtkOmDteS7tuWPiuWFtumZhOS7tuWS
jOmKt+avgOaJgOacieikh+WNsOS7tuOAguisneisneaCqOeahOWQiOS9nCENCg0KRElTQ0xBSU1F
UjoNClRoaXMgbWVzc2FnZSAoYW5kIGFueSBhdHRhY2htZW50cykgbWF5IGNvbnRhaW4gbGVnYWxs
eSBwcml2aWxlZ2VkIGFuZC9vciBvdGhlciBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24uIElmIHlv
dSBoYXZlIHJlY2VpdmVkIGl0IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkg
cmVwbHkgZS1tYWlsIGFuZCBpbW1lZGlhdGVseSBkZWxldGUgdGhlIGUtbWFpbCBhbmQgYW55IGF0
dGFjaG1lbnRzIHdpdGhvdXQgY29weWluZyBvciBkaXNjbG9zaW5nIHRoZSBjb250ZW50cy4gVGhh
bmsgeW91Lg0K
