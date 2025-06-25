Return-Path: <openbmc+bounces-293-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B3AE7472
	for <lists+openbmc@lfdr.de>; Wed, 25 Jun 2025 03:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRl8P3mD8z2xRv;
	Wed, 25 Jun 2025 11:48:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750811003;
	cv=pass; b=Qeq1DJA/7dTV8plhTRM9EAm+CoJyybr9SPEX7yaPzlsCSCPQFNz0VJsydC8TnBr6H0VqcpNIt5SDp6O3xhilVuhrWkwCMn4noOaHr65Yg+fhXstKESiSR4D+J0Dcfm1nzveSdyUvHlSm1wp05meaQKKyXj/ZlUm6AbN+5KglH/WaYshbphqWM4s0+tzLO+lBocd8uKGjS1BVdMwJbMKLuZv8185dPHp8mEs+UEQKI+wefSPVGX/UVNg6ZE5mbUS1GsmNLkdp1WlwiZBoWqL/YTMnChYq80NeQroQgb4UyTFD6ch/AuNKBS9pEcZk/5cV9HBwgvHBlf2jCwHiBx3Kyw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750811003; c=relaxed/relaxed;
	bh=rS/X72Ryb8XQuS11fJdoiBji7IObTgQPwfxjzqZUYDs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cKUbS2IUsOfYAiNPA8a+iZCnRa4bN7mDi9RJBmsZ7GKwMSnZzD3yA7Ud+9nM7ie+C83aiJTPvEgHn1Us4c0EciCtIHV4i2bYm3nkteucGyoMEBJqazIxIHUYdsv4GuorOLVGttBIijscnky72oXgynnAQ9kx2CbPNlQ6qSny5XH53Vu1p5V/zrVCuS/mE9q2jLsIxBD4ICWzvZ3cepRypStrpUqDHG7JrK3VKGizLjWf2jEG6ONE63aQQj2owLYAYdMNUTjKfHXNv1qh8rmtv9M8K7XpN36SgoEqUFbWH1v6dlpd7Im5lr4j1wpbX87mPq9390iY9n8LkoZ5Tc/9Mg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRjFw3TBGz2xHT;
	Wed, 25 Jun 2025 10:22:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGPi8bYW7h2DHFklFlQ0fkI7I3EHjUXgNie9XFgo9Hq0B7TNM4bYV71eorD1d3Pq/qmmMa6bEETbb/13OdkIWBBl3iSohnUjbVEC926L+jIDdYeS6AqluNoTmzsJkuf6ZsAn0ijvAuo35r5If9+RJAYdHK0tsI7zCFDzpy4Ff2PCcYNcPho1OSBsNlPDoMWLvg5gkRvFzbjrl4Fw718YDQVmiD7xgcmy96Z13+noXaoyrOOWG5LQ9v9F6QnxeahJPRaYUqa9B4GYFO7JPP0F9eyQ7P8851STkZBF8N+NmYrqCcuIjb3jSmATqWi05kU/iTRaCjNAWDw5EbLj1uJLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rS/X72Ryb8XQuS11fJdoiBji7IObTgQPwfxjzqZUYDs=;
 b=G3Qj7hPAW1t0UB/R+xa0icmobQ6Wo9+pzWIxqeYeeAIX7rAhymOSzd2eaveFbCptAl8AMXU1/OdupgIq7wiQ3wrTlDmQ3TaQgXqkY8KuKeyaAWUXWIEVW66OGrh1KQM3y2SQJFJiAefthUzowDjj+KcXa4om5Tde4GtTsO3RixpqDhUqLTxXtZ4cgZDaI+/vibhmkZmKpgSVT3GyAg/QJDHCA8O91mVgM/DYi1FbNhsRDfV8XVi5bN21jPbzm1Pk6XRphrZk2tjeD+MTG9r6QvYtcmaxM1Oyp1O201Wvts1kHHVRnMDu8yZfhUYj0TI4Mm4QIOgu46WA/AHRdnIM1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rS/X72Ryb8XQuS11fJdoiBji7IObTgQPwfxjzqZUYDs=;
 b=StnIEKUh9BnXqRJMHNHa73klsHEwfv43572b8GfZU5rtGZL20C8uXDG0cZM0OjmOFeOY1aPYwJDXTKj3tAMDj1zwwUXW19n4YJcPJwONMRR8neyoIIa0g+ryc5Cx96PjpgA3SUysIEQR3WF+NAXRB7ifnAE58J6r3QydQGSmd77fqPC7wKfaALP2TCF+ovaauRrYTweSsM+8OBzs/kjmIj+t7mTHpLIBoqymbjNGNkS8MOPACy5KoRMlwGk1j5VbPcJgjIU2ous0k/3jIqe2ahWNYB2MIp+hYqYLc2nmgEQ/Ua4GR5PTlxPiO4djOUVtZT0ZXJzyYT1mMY/k6anhcg==
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com (2603:1096:400:466::8)
 by SE3PR06MB7957.apcprd06.prod.outlook.com (2603:1096:101:2e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 00:22:01 +0000
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed]) by TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 00:22:00 +0000
From: Cool Lee <cool_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
Thread-Topic: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
Thread-Index: AQHb3/yk8lgT4h+z1EKWpQv7CmYpOrQLoncwgAdd1wCAAA0O8A==
Date: Wed, 25 Jun 2025 00:22:00 +0000
Message-ID:
 <TYSPR06MB70680E58607C02FF030168E7957BA@TYSPR06MB7068.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-8-cool_lee@aspeedtech.com>
	 <9c85755a8aff6e6f8a5548f0b5e758dce7d6353e.camel@codeconstruct.com.au>
	 <SEYPR06MB7072FC07B4EFC03BB25B537F957CA@SEYPR06MB7072.apcprd06.prod.outlook.com>
 <c41c3dfc38c1adc5d544e365de355579d42f90b5.camel@codeconstruct.com.au>
In-Reply-To:
 <c41c3dfc38c1adc5d544e365de355579d42f90b5.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR06MB7068:EE_|SE3PR06MB7957:EE_
x-ms-office365-filtering-correlation-id: 256a92cf-9e0a-4e75-854b-08ddb37e4d9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?MzF6eUUxUEFma2g3c2hDWHU1YW5sNGdnSHRFVCtjL0N2SnBpeTIva1doK0FF?=
 =?utf-8?B?RXhnU203c2xJb2RKc1Y3NHJabHlIYnRMSDg1b2oxYXpvcUJzRklGdVBVMTBV?=
 =?utf-8?B?NGNocW8xbTE0c1J5VU1jblgwMkI4T2ZWNFl1SFNtY3laS015OGpIbjErV0Zp?=
 =?utf-8?B?MTBhcEtTQlNPZktCd29DekQydXM1V291U3VocUVmZ0FKWHdod0xkR1c2N0tI?=
 =?utf-8?B?K0VGd1YwMERlcE4zM1JvRmNyYllkSCtZRTR5SDd2eGJOM2tKWSt3UGFVZTlR?=
 =?utf-8?B?TWpSazFHcUMrYVplQzM2ck12Q3RVTk1BYjlGS1JXZmtmb1JHYzBoQUplMmdY?=
 =?utf-8?B?MStpY0VpSCtabEdDYU95YktVdEtXRktIeVpXMjAxZWpzWUc0QWZodGNnek8v?=
 =?utf-8?B?ay9Cak9OZUJYcngzNGNUT2FSaHpjWWQzdThqTzk1bTFSWUMzUjRjQU1OMDZR?=
 =?utf-8?B?ejlUK1NhSjg0QjdkZ3NCWE1RUitzQnBKSmJDd2daelpzd2YrNDY3cHduUHdC?=
 =?utf-8?B?cmRGNWpXb2xFejl4L3RTQ3I2U1lTZjdCZEdNbHBtUWhVZ09rdVl2VUFDYlZT?=
 =?utf-8?B?eXlrbXNHUmhYY3lBN0U4MXBiajRBZXV3dnNIaklWdXhnSkhjblgzS0M2QzI3?=
 =?utf-8?B?dnJHVWhXTE1EWUlKTVN6MFZMK25taWtCVnRTYlYzay9OeFY4L2RMQkdERlox?=
 =?utf-8?B?M0EzWnpId1VKRDFBekp0cWxiUjdzb25HUS9TaEUvdHd2VzV4RFpBbm5qdlJL?=
 =?utf-8?B?NzJTTndlL1ozZ0FDRlFnMnBCcWwxbG9LM0wzUFdtYmdGVFIwdjJGTjBhRUVZ?=
 =?utf-8?B?by94Q0RwcXRic1ZaM0l6SFhlMy9IWmViNjFwbVM0dkliMmJSc3FmamJySmtI?=
 =?utf-8?B?TUk0aENJZC90cGdMbnJTODFtcEZCcXlRRW9OQittOFRyZzRKRUhybHhidzR4?=
 =?utf-8?B?QU5EZkZzbHB5M0huYXkyOVNkTXphNVV2OHA5U0JRMUt6Y3cvNVVOY1QxakNN?=
 =?utf-8?B?YzNMQkhuTVJwZTFPSUJEZ1UzYnlYNmpJZ0hqY3N2L01CYUQ3M21oZjhLWW9k?=
 =?utf-8?B?N1RHTFNVZGNSUGZsQ2hiaGJGVVNjZ2JGLzlmTnNMVWwwZ3M1Mjh6d1NmYUNi?=
 =?utf-8?B?S09UQlhFalY2WmZPYzA4RW1EcU1OSkJaYUJ5Vm1pRDZRYWF5ODJUTnI3eHJx?=
 =?utf-8?B?TkkrRzlFVVR4N2dqZnlqSExuOVZpVzNLMjdBb25qRTJYZUpYcGJKaVlhb282?=
 =?utf-8?B?bDF2amM5RnIzSnNwVEYxaUlwbUJST2Z5MTJwMUR5alQwTW03Z3NqOVgycFdk?=
 =?utf-8?B?a2gxamQySmV2N2lXWFVvN1RHQVo0bWk5NTNTeVFOVmRJRUlOenhxT0ZoMkdC?=
 =?utf-8?B?b3MvckJpMjRlY2Ntc1lLSVU1SDFzUDdFRHV4cExuL2VOc3gyeXFMYzhYNUhr?=
 =?utf-8?B?MUNueDZjN1lSVjNFbGkzU1hTMHZabmtmeHM2aGpsV0FxY1lIdXpEYWJwM1Rs?=
 =?utf-8?B?R1Rha2pUSDNwR0lyUHhwN1UwMmVYbU5DeWg4UjRLclRnL2dhWGJHWFdqenhU?=
 =?utf-8?B?ekMvMjlveFhBMVpxdkVCMVlEUU9CbTlaaWdlT1dlYytBQTM4WXRycTUrVEI0?=
 =?utf-8?B?bCtTaDVqdENZRjQ3S09JRDdNOC93NzVZWHpUdzBsMHErc1JiUHRib2NteFFR?=
 =?utf-8?B?ck8xNFhnUmxCcGdCSGFsWVR3YnQzb3NRZjhWSTkvei90SnpnNHA4bnZvVUZG?=
 =?utf-8?B?T1gwU0dRbGNWOFFNRmFFRXFtczlsY2JYUVBldGYveVVkUXdVdDhOc2EwTFVy?=
 =?utf-8?B?aEpENUxjTFVKcTB4b1Z5N0svMlJxbGZ6aVdjNDJiUlVxaVNqVnBpOGhuMHZW?=
 =?utf-8?B?bFJTaDlPNElhNVJrMUdvVEUzaXdJVWhacUxDYXdQVHcxbTBlOUxjTGFzdGZZ?=
 =?utf-8?B?SDZlRTYxV2NBVjJkTnlsL1Z3MlU2Yis5Uk1EYzhkYXk1MjhIWTRxTmZ1V1Rr?=
 =?utf-8?Q?/DZU/kl4tZp0TUQuIcZbGgl5ODxums=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR06MB7068.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUdobDhZV3J6RXI3RG5Pc3hFY25FeFc2SDVrckZQVkNVVjBDOG03V0pFQmx5?=
 =?utf-8?B?QjlNemV0N3hOMFRsRjIzclN4MkV0bTkzMER6OHVXMmxCMC9yMFVsME02THdJ?=
 =?utf-8?B?OWhCRjc4YnovT3MrZlZ5eXJzcUpUUUdUcy8xNEVUS3pZNVB0L0NWbWdkN3Nl?=
 =?utf-8?B?RFNaMFhQVDFCZnR0Z2VyS1BTMmMwMjBUS3Bzd2Eyb2J6Snh4bFhWb0l5bmJM?=
 =?utf-8?B?NHdiY0tRbXd4b0ZqYldmaHM5cWJHMFhDUGNodnVtUjVLQ1RINVlBTnd2TnY5?=
 =?utf-8?B?Zjd4SW15enowaE1wNVBnMmtIUGZwSUc1d09WYlpZQ0JlVVFPWkRPRUVCODBj?=
 =?utf-8?B?N0dJc1pBZ0NPdXlhTkdlM2p2SGUxR0pSUkNzV21uVUpCa0NJeEk4RkcydVZE?=
 =?utf-8?B?MkgxY1NRQnNnS2RaS3FXUXNXTzdLZTRPdnBqMXJvcnF0bWs2R01iRitscmlq?=
 =?utf-8?B?MEJDZEtnbGNSZ29VeEU2ZVhEaURTNWwrU2dKNlpyM21WUGVPUEU2WUJ3L3dO?=
 =?utf-8?B?TzVFQndZanFiam84MEhjcUowbVAydTd3UDNtTGhhb2NndHV5SmNsY1BBaHZ3?=
 =?utf-8?B?dXVsT05rZk5JOUdWeml6aWtFa1EyY3ZsVmtDd1ZHdzhHdyttVFVFSVc3eXZG?=
 =?utf-8?B?bllwdElsQy9BZmQ2Tmt4VVJtWUI4MlFXVUNjVUFVOWkzWUVYamNHaDgvalpa?=
 =?utf-8?B?S0ZhSitYWE5EZXpBVWlkSENLOHZIWU5vNlVZUk9qWlpJcGhqRG5XKy9IdUdQ?=
 =?utf-8?B?ZFVjR1BkVEs4b0FIL1JFZVBFaGtvUzBiUWZmYVh4NUJ0LzlyZk96QVRZM2p4?=
 =?utf-8?B?WHg3eEdhUjZLMzZGZ0hrNUI5bkp3OGxVbFdldWl5enRrcm8wbzhsRTcwYzE2?=
 =?utf-8?B?N1BpdlpKT05VSGpiMFZBVUFaT3E5S3JuanlnMC8xb1UyN200b2dWTTZvOXpB?=
 =?utf-8?B?VWZ2alVMdmdhbWNWOUxISUlQd0pnVW1XS2lBVjBrTGlidVd3VktMOVFCMlFY?=
 =?utf-8?B?dU82UE0wQ0QwR1VnSTk1UlpVRlB2d1crY3YrTGxXMGsya1ZiQUlBRngvZGlt?=
 =?utf-8?B?NzFMbUUwMm9ZaWU5eDJwUzRhbUNjbzhQYlBQK3M4N0RoMyt4Y1AzemRkb0lP?=
 =?utf-8?B?TGxSMWVLRWhPUnZOVDI3SjJLa3dPelZIbUM1K3ZoSzU5bnVlWWVXZzFRcUxZ?=
 =?utf-8?B?eVhodXJZVUJpQlpoODNUbnU2UitrRWRYS0R2M0lKa3V3K0Q3TnllMmttdTFq?=
 =?utf-8?B?VDc3Q3l5Nk9zdll6OWpZUHVVdGVCcmduV0RFbHlkZ0hNMVBRZnF1RXQvYmlk?=
 =?utf-8?B?Y0luNVBMVkZ2VXZCeURkSytPdzJtaW1TM2NJZDVmTEZrYWYxU3IyWDlnUWN5?=
 =?utf-8?B?cFJBbUlhM1hKNHRQMEJKYTI4YjgvZU4zMjRwc1JWOGZrVW5LZk9PVFlkRmM1?=
 =?utf-8?B?QWp1Z1JZT2l6dzk2MkoxdUJDS2hUeG9xRmNad0JlVnBQVVZvcFMyRENBaHVS?=
 =?utf-8?B?ZERUZnNJTnNESjlHZW9Xb3NQU1krZy9tY3lvSHlDbld5alovQUswbForYTZv?=
 =?utf-8?B?NTZyQk4raGlFWkpEOU1nL1E5MkVNaGQ1VCtYbVBXQ2lxTlpHQ1ZUQ0l1R1pi?=
 =?utf-8?B?NllEVmFrdEUyT1hJeXVucHJJVElFY0hpNGs3dHh5YTVzeVh2bFQ5MlJ2RS9n?=
 =?utf-8?B?WVRLZ3hsa2VNRmQrYnMzM09uVXcrZENjQlpXekNrWjhmaVF1S21heU90WVZM?=
 =?utf-8?B?T2UyeGNCWEZkaVMraXUwL1ZXSEJLUVpnb3JSUnNkbFkvV0tzYWlaQkJiUldO?=
 =?utf-8?B?RDJWZUlKdVFIMC9yeUk1ZmhWU2dENlFkaENTbFc2QnhWNVI4THVCZ1ZNTExE?=
 =?utf-8?B?UTgyVUFGUUV5OVpHaE16UDk4dGFzWitlaHlNQ00zSHUrV2R2WElCcG45NXNP?=
 =?utf-8?B?Q0c1ak5zbmQ3UWZUV2h4MHhjNVpzdlIxYW5qTEkwZkxRYTkwcmhBSTJmNUtq?=
 =?utf-8?B?Q0pYTnhablY3ZkNmRkRuVFBqSTRjODVZWGZFcGw5TU1LeXFDaHZjS0IrMXRG?=
 =?utf-8?B?cFNTNURBNHFzdDVZaVE1c0ZJczQzbG1peEM5Y3JHWmdQZzBSZDNnS1gvdnhj?=
 =?utf-8?Q?FeAW0BXl0sktDWdXVV/uU/Nkm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYSPR06MB7068.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256a92cf-9e0a-4e75-854b-08ddb37e4d9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 00:22:00.5360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yaawv4/GH4Ng3Emq34a0EySN3jtuUbdtbwWri0UZE5wrGNwCD4jFDjBmM9+vgZ1dloFr55R/jg1B2Kd3frmKGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB7957
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQo+ID4NCj4gPiA+ID4gVGhlIHRpbWluZyBwaGFzZSBpcyBubyBtb3JlIG5lZWRlZCBzaW5jZSB0
aGUgYXV0byB0dW5pbmcgaXMNCj4gPiA+ID4gYXBwbGllZC4NCj4gPiA+ID4NCj4gPiA+DQo+ID4g
PiBJIGZlZWwgdGhpcyBpcyB1bndpc2U6IHdlJ3JlIG5vdyBpZ25vcmluZyBjb25zdHJhaW50cyBz
ZXQgaW4gdGhlDQo+ID4gPiBkZXZpY2V0cmVlLg0KPiA+ID4gQXV0by10dW5pbmcgaXMgZmluZSwg
YnV0IEkgdGhpbmsgdGhhdCBzaG91bGQgYmUgYSBmZWF0dXJlIHRoYXQgbmV3DQo+ID4gPiBwbGF0
Zm9ybXMgY2FuIGV4cGxvaXQgYnkgZGVmYXVsdC4gT2xkZXIgcGxhdGZvcm1zIHRoYXQgZG8gc3Bl
Y2lmeQ0KPiA+ID4gdGhlIHBoYXNlIHZhbHVlcyB2aWEgdGhlIGRldmljZXRyZWUgY2FuIGJlIGNv
bnZlcnRlZCBhdCB0aGUgbGVpc3VyZQ0KPiA+ID4gb2YgdGhlaXIgbWFpbnRhaW5lcnMgKGJ5IHJl
bW92aW5nIHRoZSBwaGFzZSBwcm9wZXJ0aWVzKS4NCj4gPiA+DQo+ID4gPiBTdXBwb3J0IG5lZWRz
IHRvIHJlbWFpbiBpbiB0aGUgZHJpdmVyIHVudGlsIHRoZXJlIGFyZSBubyAoYXNwZWVkLQ0KPiA+
ID4gYmFzZWQpDQo+ID4gPiBkZXZpY2V0cmVlcyBzcGVjaWZ5aW5nIHRoZSBwaGFzZXMuDQo+ID4g
VGhlIHRpbWluZyBwaGFzZSBvbmx5IHdvcmtzIG9uIEFTVDI2MDAgb3IgbmV3ZXIgcGxhdGZvcm0g
d2hpY2ggaGFzDQo+ID4gYWRkZWQgYSBkZWxheSBjZWxsIGluIHRoZSBSVEwuDQo+ID4gVGhlIG9s
ZGVyIHBsYXRmb3JtIEFTVDI1MDAsIEFTVDI0MDAgZG9lc24ndCBzdXBwb3J0IHRoZSB0aW1pbmcg
cGhhc2UuDQo+ID4gSXQgc3VwcG9zZWQgbm8gZWZmZWN0IG9uIG9sZGVyIHBsYXRmb3JtLg0KPiA+
IFRoZSBvbGQgbWFubmVyIHRoYXQgYSBzdGF0aWMgdGltaW5nIHZhbHVlIGN1c3RvbWl6ZWQgZnJv
bSBkZXZpY2V0cmVlDQo+ID4gaXMgaW5jb252ZW5pZW50IGJlY2F1c2UgY3VzdG9tZXIgbmVlZHMg
dG8gY2hlY2sgd2F2ZWZvcm0gYXNzb2NpYXRlZA0KPiA+IHdpdGggZWFjaCBkZWxheSB0YXBzLiBP
bmNlIHRoZSBlbW1jIHBhcnRzIGNoYW5nZWQsIGEgZml4ZWQgdGltaW5nDQo+ID4gdmFsdWUgbWF5
IG5vdCB3b3JrLiBUaGF0J3Mgd2h5IGF1dG8gdHVuZSBoZXJlIGluc3RlYWQgb2YgYSBzdGF0aWMN
Cj4gPiB2YWx1ZS4NCj4gDQo+IFN1cmUsIEkgdW5kZXJzdGFuZCB0aGF0IGF1dG8tdHVuaW5nIGlz
IG1vcmUgY29udmVuaWVudCwgYnV0IGluIG15IHZpZXcsIHRoZXJlJ3MNCj4gbm8gcmVhc29uIHRv
IHJlbW92ZSBzdXBwb3J0IGZvciBzdGF0aWMgcGhhc2UgdmFsdWVzIGZvciBub3cuIE9uIHRoZSBj
b250cmFyeSwNCj4gc3dpdGNoaW5nIGVudGlyZWx5IHRvIGF1dG8tdHVuaW5nIHJpc2tzIHJlZ3Jl
c3Npb25zIGZvciBleGlzdGluZyBwbGF0Zm9ybXMgdGhhdA0KPiBkbyBzcGVjaWZ5IHN0YXRpYyB2
YWx1ZXMuDQo+IA0KPiBDYW4geW91IHBsZWFzZSBkcm9wIHRoZSBwYXRjaCBmb3Igbm93PyBXZSBj
YW4gcmV2aXNpdCByZW1vdmluZyBzdGF0aWMgdmFsdWUNCj4gc3VwcG9ydCBpbiB0aGUgZnV0dXJl
Lg0KDQpPaywgSSBnb3QgeW91ciBwb2ludC4gSSBjYW4gbWFrZSBhIG5ldyBwYXRjaCB0byBrZWVw
IHN0YXRpYyBhbmQgZHluYW1pYyBib3RoIHRvZ2V0aGVyLiBJZiB0aGUgdGltaW5nIHByb3BlcnR5
IGtlcHQgdGhlbiB1c2UgaXQsIG90aGVyd2lzZSB0cnkgZHluYW1pYyB0dW5pbmcuIElzIHRoaXMg
T0s/DQoNCj4gDQo+IEFuZHJldw0K

