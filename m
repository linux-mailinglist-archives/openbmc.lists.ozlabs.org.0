Return-Path: <openbmc+bounces-267-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1AAAE26F5
	for <lists+openbmc@lfdr.de>; Sat, 21 Jun 2025 04:06:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPHky5yFDz30VM;
	Sat, 21 Jun 2025 12:06:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750408386;
	cv=pass; b=n9z2nOyx621NfaSswY9tPUO626DFTih1Kb5vZxK9KDMigyoAksLxm9jZXu0GJ3YB4lk5PkU0VeaNCJoYG7+4cf1vWJnbUtHpvTLtqtSHr9u1RlmWgX000K3msyMmAcgOkvl5a8vGTz/EBkrhfyhqyKjKF8mdRvTi4Uw0A4lMl27c38JxHtaE98fGqBERJU5frqnWa1doB6oEtNwjJlr7vSeMr/6fIengNaXiInL/ZMh2yQGAg8uUSxH4yERDghpQ0WBpFQ12QoyaFgrngss6+me+HuMh5vjLOlHeoITEJBiG57E82NI0j5hsacGZSpgMRjO++D31AnoPC0Lln2v7rw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750408386; c=relaxed/relaxed;
	bh=54ockETrjTbXvRi8s+mjLAiGdD6M+3mew8dHKPxn/KM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CwtejN7gqjSMQd1b13yAi64IAw2cqAggpaWRUOGjwC4Dgb8zAAinGfLzX9GkzRmc1BVECp4N9XtcoU2/8OWCRforADVrlOjbGycD0DCZNkj6OFSX09AWrClYzL7Z3v9ouO6ZX7Rk5fMlwgnPhz57RXTulqweBc5RAtjq2gNkc0/TaVtc2T/VDctaV47XXNt63g7bSUtcEcTJALG0jDIP3Orgwk5FMRnKe5P8mVeQdim9iSqnndiENWBb9D+PXV7Ix5zJEwnFByRkWtgn2dSR7NUVAvo6cw15R5hfUgGzkDp8cXUZ4kXcnXZTdxTMZIx/nbwEvpyzn4Z4hqoFtut6Qw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=gwo3A/c+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=gwo3A/c+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNrMj33VLz2xHY;
	Fri, 20 Jun 2025 18:33:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGdwvFnXC/AQAIRySUq/pnpqNOJYApJ/mskaHoNXFdWyHwLaOkaBCWYtr02HZ/c15Y6SzSpW74MEb4qtRbzBCBYa3q5n/HgZZbuuPoAwehrwwrJtldcZZp6q0ewx0UrK6H3ySic3J0U1pNmWGhPlnkjlT7IWcCLXYp7Fx8ZVDBzXpMTtgmgXDLlAIWuWSiHzdV8aSaEgH6DI0e+7qcjIEzPAqa2t5OKPQ1ZhIgwMLLnW5SqVoXBdqBouor9RARV+oSqb3QjWoxn/giFcjFdTmVPUxcv0tNVl6Eos2IOrCxGyJk1dAIl5peUedEQGyvqf5T6nPbnpcPppUUnLGsU1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54ockETrjTbXvRi8s+mjLAiGdD6M+3mew8dHKPxn/KM=;
 b=VvyYA7Z7afYsud9RMJFVB+0qUCUGSAp7FL0YHlHos8LdVaEJ3QanFaH8JBtf5ctJ2ftI+klCL6ltpvDeFYXsCAL3nYE80rBha7tySvcr8plXtyQ0ewA9vsxiVkf8JNrLMx7Hq0PtqrRdVGA6ycM2mCmfHuH+b3kWgXg4YPz+Y6b+5p17SJnwTMZ7TktT/QzWgzq2jYSWOYjP3/nECM7aJ8e24jotwDqtpd8WSZAFSanqmsXuZ6V5OoLUTo6nYg9+aKp+CzwcCmpA0XsUIthdbkHdfnGftx9E9xjgKEKkqo+lWaovUssHzDIST9cTrF59rVt1JW4JH0t3T/vHt1QwUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54ockETrjTbXvRi8s+mjLAiGdD6M+3mew8dHKPxn/KM=;
 b=gwo3A/c+MlzSuQN+bnKLEqLY/myk4Bxo8j9rw3ad9XbEiFgTLT1eS/MklPBw2177rZUrf7tsySAygOijWIGQPuTSQXdNekCgxGrMdnVItwMf+7Uil7MYK1APmtJtBI1BKHCoU+tlUvlWn4jqxuh4C8WZd+oCaf2htLRwVFn4J950YxgALApr5zc3v+A84bKZKZfTpbH6tfal8MfARo5XEge6TwmA8DUugU8JpvrPQEzeKXjYhZASjBV5doiU6phOQtuiJ/9P4AC7w2kAv27mzvUOeRlKt2WhqjKl0M4/aYVKCuD8rl7cXdOV2QlNwepHUqvTFLqG2g3yKEGDV0dIyA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by JH0PR06MB7083.apcprd06.prod.outlook.com (2603:1096:990:6e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 08:32:41 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 08:32:41 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
CC: "elbadrym@google.com" <elbadrym@google.com>, "romlem@google.com"
	<romlem@google.com>, "anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>, "yuxiaozhang@google.com"
	<yuxiaozhang@google.com>, BMC-SW <BMC-SW@aspeedtech.com>
Subject:
 =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggMi83XSBkdC1iaW5kaW5nczogcGNpOiBBZGQgZG9j?=
 =?utf-8?Q?ument_for_ASPEED_PCIe_Config?=
Thread-Topic: [PATCH 2/7] dt-bindings: pci: Add document for ASPEED PCIe
 Config
Thread-Index: AQHb3BN3Xr1cWRFQV0ue0ayv7Ceu3LQA180AgArrKBA=
Date: Fri, 20 Jun 2025 08:32:41 +0000
Message-ID:
 <SEYPR06MB5134AB80135F766077C6BA559D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-3-jacky_chou@aspeedtech.com>
 <618978dd-943a-4e50-8aae-c6132559edad@kernel.org>
In-Reply-To: <618978dd-943a-4e50-8aae-c6132559edad@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|JH0PR06MB7083:EE_
x-ms-office365-filtering-correlation-id: 4c1a4ec8-7a5a-464f-ef87-08ddafd505ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NU45OU5QazEyUWtxWk9Oa1JnOEt6L0pZRjZLVlVpNHNOcjVlRkFGZjdWaTla?=
 =?utf-8?B?Vkk5V3kzRzQwQlM1L0VOTngyNmp4SzByeHZNRUErRjVTYjRKaVhVZUc3OGh2?=
 =?utf-8?B?aFVkYTBmK2RuQ3VMbmFteXVwLzJvUktzV3FLbTNPSTNCSG85MVFWQUphS3No?=
 =?utf-8?B?ZTR2VEgxZWF2VjFvK3dlRk4vemdkcnZ6YWFhWjVxWUJOdzJhaWloVG9DVFds?=
 =?utf-8?B?YkVnSEpIK1pIR0tobzlLb0o0NG9wQ1dZUVlMdVNzOUE0a2lMWE9ocUhwa0Yy?=
 =?utf-8?B?S2srZ3IrZmd2Mk9pRkIveGo1TTgrUlFpVHV6V2IyWEJlR1k5WFI4ZFM5MXpq?=
 =?utf-8?B?MGJQSmZmVWlzTmo3S3JlcGJ6TjNkR1lRNFVqeW04dEpSdnRXQ3BLdy9FWHRz?=
 =?utf-8?B?aTBrcEUzMEU5TFE5WGZrWng5aG1zRlBPLzRvY0duMHQ4VEVIM1JMRDlaTmp4?=
 =?utf-8?B?RGh1MWtCNy82T0J2VDczbzlxTnQ1RDczajNWcnBwU0s4VElhQ2lvV21WeDBW?=
 =?utf-8?B?dm84MXJibjlOemVoSDRFRkw3bWZ5ek1DMUZaK2ViWG9yd3ZpYS9WcThRTWN6?=
 =?utf-8?B?RzNlTVFjZjdTY1VhalUzTGN6Q3ZnVENaVkR3M3JnbzNYNDNTckw2MEh0Qk80?=
 =?utf-8?B?YU5qOUY5ZFBOZStPbmx4bXo3Y0RlNjc1Ym1veXNQWjNYYTFoRFM0dFZVSS9D?=
 =?utf-8?B?NHJqOFVHeWVoYnk2RUJqMGRLNFVaTnNvYzRLenNOdnFTTXIwVXVJY1NFN0JN?=
 =?utf-8?B?VGNTbytOd0tOc0hSOFNqcGlWMThCa09sRXZaZHhEUmI3cFowZ1lpMU9weUl3?=
 =?utf-8?B?blFoS2lHYnhVNW03WmkyUlBFZHRGYTZZcWFVTTNhOS96NFRDbCs1bzlRZFgy?=
 =?utf-8?B?Wk5NRlJqSHpaMWNFZk50dzZsQVErV1RVVW9xSmhzVEU2U1FnODZPN2FWNUtj?=
 =?utf-8?B?RVFCVU5ZOEIxbFRHUnh2MnJORmJqU1hhZGtKOThMNFc1S3ljMkhUWThTMXdQ?=
 =?utf-8?B?VEZTa0NBa1JYSnNjdzB5Ti96ZVBITDFzc3QzMVE1Z3lPMHRvL3Jmdm5URFRw?=
 =?utf-8?B?anFxOW1EbnZPeHRnNW0vYkJuRFZUekVETlYyWVZ2T2tUWFFpbEVNY1Y3QnJY?=
 =?utf-8?B?UkZTYzRkVER1eWdZZ2tydWtLWC8rQzIySmdvcXF3Vzg2NGcxbW5XVzJpbko0?=
 =?utf-8?B?Mm9jU0tCL0hkYVJxZ1FReFU5MWs3b2lLOXVJSVFNTWpteGs3OW9zVElBTm9W?=
 =?utf-8?B?cTFnUnI5OWJXTDBsTzNoRFhqalRJUktzT1E2ajdIWk9nU082dzVzdXFTYUlz?=
 =?utf-8?B?OVcwajY2S1JUUVBJMTYzWDdZelZ6eGtDcFVWcmd2UmdoMnBxN0x3Tm5JNzRS?=
 =?utf-8?B?QXpIL1lGZVJqSU1BYmhVNk5TdHRMbEE5cEdIMTFRVU42LzhQS0U4Qm1SY0dN?=
 =?utf-8?B?TVB4VlZOcnRoWmdKc09keWVjby9GbE5kOFJzdUZWbVNrNVdtUVpOZ2pVTlk0?=
 =?utf-8?B?ejkvaEM0N0V2RnZOYWkxUVVjb083dEZYeW9aYm5Od3ZrZmpPTVRoWjNMaVJM?=
 =?utf-8?B?MzFuM29ydkx3R2ZNZDI3TUQrZm1VM29KZFRvWG5JbXczdGNKT2xCejZoQnd0?=
 =?utf-8?B?K3FxelN6VHlHRDM0QXMzNklkREMzY2cwZXhIUWY3SEZJQkxTc1ZGazIxdTd5?=
 =?utf-8?B?QnJNNmZIUDB6OTFQc2xtSkw1YVZockR4WmlzOGl3YWswMnYvcGVTZ1Z2Rmls?=
 =?utf-8?B?eXcyTkhYbUI1bDlWbkRYRjQ5ZVpMMFVMS1ViQXBqTlphdlF2aldmbjlFSjRt?=
 =?utf-8?B?WUlFVnlPbEJsSFZwd2NMbldCSzBQbndQK0VBMXRrNGY3bDRsWjBET05hSlA4?=
 =?utf-8?B?OWRSSXZwMEpTTzNnSGdKL1c2ckl6K0ErVENKeTN0VGwzSFpnWjhYSzZFeGJU?=
 =?utf-8?Q?DA3JJ71aeE3u1U6B3mZhknOcgB2qIKg6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1FXVE9DU2xqN2wrV3UwTnF3K0dkNnRjNUx5cVI4VjdzTWt4eFZzY0J6TVBD?=
 =?utf-8?B?d0ROTVZlYTZlYm5FclNQa3paTmRkUUdDS2dDL2NnNzJQU0Q2ZXRWZE90Zktz?=
 =?utf-8?B?NGNBNzloRUZaZFYxQVhWR3RJV05iNG4xeDY5dVFnZDU2dCswMzJ5eHJGaGJx?=
 =?utf-8?B?WHNVN29VbDdGREdrNndha2UrUGthMkJPZXhZeWxiQlU5WFk2RlBsQi85Wm1W?=
 =?utf-8?B?eGNTNFZxaTdPK1RJZE81OXFIdjhmZ1l0N0lsb20wR0ZLcXZ5NEZSVk81OTRj?=
 =?utf-8?B?eXRheUloRlBRcVA1MGhqUkdEbUV6L29jNTRML3MvV1BqUU5CN2FXWm15RTNW?=
 =?utf-8?B?ZFFMeStrVG9EbFl6UGMwOEF5WGV1WGM1aStKeFFaWjJreUxkNWpJbXVFNnFW?=
 =?utf-8?B?Vm9rQzVuaFNrZmhYa3VOYlVHYU9ocW5zek83bjZRV0p0UUlyQldYTTNReTNB?=
 =?utf-8?B?MHhBd2pnM1dxWmQ3SlhHeWNwZzhoZWZVbkJQSW1yV0NCaVFkR1ZzVGp4Um9X?=
 =?utf-8?B?MzM1NGJIU3lUdDNoUjBkZDJZdUhEOC9qeGFxZ2NUSTVHNzV5SXJnbHpKVitv?=
 =?utf-8?B?UngrMU8zQUxpWUpiRkZ1OSt5YlJCYTNleUdhZmlKckV0TUw5TFpyMGFXYk9O?=
 =?utf-8?B?R0Z5OEV4aHZacWt4MDNZTG5sU3ZYVU9Lb2FVQjZPblhRSTJWTnVya3JNdHRE?=
 =?utf-8?B?a1FiQ0NmS2d6Qnl1L0NubmtrZmFkTjJ0OXovTkxrQjVsdTRjWDVRZGxsRGcz?=
 =?utf-8?B?YzAzNHZBVklPbW5CT1RDK1VjRjJzcTlSZ09CWGgwTDRXSVQ5TU9IYURjODRv?=
 =?utf-8?B?ekFudnhsaUxFNnBFZ2pBL1Vva2MwSjdsMjhYS3I3ZkFJTm5JcVNMT1dRc0d2?=
 =?utf-8?B?YmwwRTgzVmc0cUZ4RExiOHYrQlVuTjFLSitVWmZaWUFrS1ZaWEJzeGZwWUUw?=
 =?utf-8?B?cklaT3lBSi8wbHhHdHdabWFzSC94VUJYcmllSHlqZmpIeWtYakg5VFBsbk9S?=
 =?utf-8?B?QzVnWG8wcDZyTm5tUTAwUHdoajdkUmFmWXEvQ0FyaDBGcVlTTnFpMUFBb25r?=
 =?utf-8?B?d2dwKzZadGd1RktSNU54QjJZTDdBSzh5M0pZbXB3SGFPTE5ieFR4Qk41cEdz?=
 =?utf-8?B?UEZZQU81akhzZXlRdzB2bk5HVU91a2hEdC9NTVJOeTJneDJIMHBLQlAwSG56?=
 =?utf-8?B?eGlNTnZ4dUdLc1ZMVENYb1hiWXREWnhiNkp2OFJyUU5VSmY4MCthZDZjVnF0?=
 =?utf-8?B?Q2daVXV4cUt0L0svUnZvanJ1TjRpZDgrUWdWZ1ovdXFnSnZWUnptcStYWncx?=
 =?utf-8?B?K3JjeWgzKzVTRXI2K05ucmlLbHZFNU03YjEwTzdYQmlQR1FtZjVnZ2NhNnd1?=
 =?utf-8?B?YkR5b1BYdHgySmEzenU5MnpTTVVsNEFMajdzVSt1aldUbDhGNFJRNmRBcDk5?=
 =?utf-8?B?MUY3dlNjaFUwTVNCcENwRFVSK05BcDFxVjF5T25tS1dvNG9wbkkrTVJRZU84?=
 =?utf-8?B?endSQkcxR0pjaFcwR2t1b1UzcTNla3NFcGZXSytBaGdJZ0dBL3lQM2RGTVEz?=
 =?utf-8?B?YjhBblAybzdKUk9XNVhBUC8zbHVqeXQ3VkxoKytXNUVRZ0RQY2h6R2VBUzVh?=
 =?utf-8?B?U2YxeTQxN1MxSERsdWx0S04zK1dQbjg3L0NycWlHbXJ1RkdyK2Z4b2ZhV1pu?=
 =?utf-8?B?eks4b1YwbjVqUWdJRVU1MEUwSWZyLzBDSVphcllJZXRIbkN0cTZET00zK2Za?=
 =?utf-8?B?dEM5bHI5L1RsWWJwTXgzc0p3Y1F5bnNPRGVEaUR6RDRNQzhtMVlhY25zZkJt?=
 =?utf-8?B?cHBZTktKd2JFQlluK0xLRWxFZjEzK1hha1ZiWmxtdk1hOWloUC9DMVVTbk14?=
 =?utf-8?B?ejg0Mk1POXE5Q0JiS2ZQS0M2MUhlK2xRUWUwYVk2d0ZJVXZCRExVaTlmTkY2?=
 =?utf-8?B?T2pidFloZ2N4K0ljcjdwQ3lMMXBVL1J6YlExM0N4dTQ5RXF0dGNPMzRGQzBF?=
 =?utf-8?B?aVpBZVVYU0x4bVd0NC9JRHV3ZlNtSjkzUlc1K1gxWHlzOG1OUGZWMmNKUXhw?=
 =?utf-8?B?bFk5eTkrSWNENU5Ua1BWcXJZU0pIZklIL3ZRS0xBelovZW9PejNXOFhLdCty?=
 =?utf-8?Q?VArxRL74o9sHT9tjm/NqXA+HL?=
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1a4ec8-7a5a-464f-ef87-08ddafd505ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 08:32:41.6324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0TXtYKPREjRbmjgj2LK8cZ2Tkr3FOvXbrjyJlnS+6uWPcDn04YEDVpdC4VLOOdiaaeIKYa1NpWt1hnqyUEmBJp+M76HtiUACzSkj3hpWvwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7083
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIFRoZSBBU1BFRUQgUENJZSBjb25maWd1cmF0aW9u
IHN5c2NvbiBibG9jayBwcm92aWRlcyBhIHNldCBvZg0KPiA+ICtyZWdpc3RlcnMgc2hhcmVkDQo+
IA0KPiBIb3cgaXMgdGhpcyBhIHBjaSBkZXZpY2U/IFlvdSBqdXN0IGRlc2NyaWJlZCBzeXNjb24s
IHNvIHRoaXMgZ29lcyB0byBzb2MuDQo+IA0KPiBBbGwgb3RoZXIgY29tbWVudHMgYXBwbHkgYXMg
d2VsbC4NCg0KQWdyZWVkLg0KSXQgaXMgbm90IGEgZGV2aWNlLiBJIHdpbGwgbW92ZSB0byBzb2Mu
DQoNCj4gDQo+ID4gKyAgYnkgbXVsdGlwbGUgUENJZS1yZWxhdGVkIGRldmljZXMgd2l0aGluIHRo
ZSBTb0MuIFRoaXMgbm9kZQ0KPiA+ICsgcmVwcmVzZW50cyB0aGUgIGNvbW1vbiBjb25maWd1cmF0
aW9uIHNwYWNlIHRoYXQgYWxsb3dzIHRoZXNlIGRldmljZXMNCj4gPiArIHRvIGNvb3JkaW5hdGUg
YW5kIG1hbmFnZSAgc2hhcmVkIFBDSWUgc2V0dGluZ3MsIGluY2x1ZGluZyBhZGRyZXNzDQo+ID4g
KyBtYXBwaW5nLCBjb250cm9sLCBhbmQgc3RhdHVzICByZWdpc3RlcnMuIFRoZSBzeXNjb24gaW50
ZXJmYWNlDQo+ID4gKyBlbmFibGVzIExpbnV4IGRyaXZlcnMgZm9yIHZhcmlvdXMgUENJZSBkZXZp
Y2VzDQo+IA0KPiBEbyBub3QgZGVzY3JpYmUgT1MuIERlc2NyaWJlIHRoZSBoYXJkd2FyZSBhbmQg
ZHJvcCBMaW51eCBkcml2ZXJzIGNvbXBsZXRlbHkuDQoNCkFncmVlZC4NCg0KPiANCj4gPiArICB0
byBhY2Nlc3MgIGFuZCBtb2RpZnkgdGhlc2Ugc2hhcmVkIHJlZ2lzdGVycyBpbiBhIGNvbnNpc3Rl
bnQgYW5kDQo+ID4gKyBjZW50cmFsaXplZCAgbWFubmVyLg0KPiA+ICsNCj4gPiArcHJvcGVydGll
czoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBhc3Bl
ZWQsYXN0MjYwMC1wY2llLWNmZw0KPiA+ICsgICAgICAtIGFzcGVlZCxhc3QyNzAwLXBjaWUtY2Zn
DQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICty
ZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsNCj4gPiAr
YWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiAr
ICAtIHwNCj4gPiArICAgIHBjaWUtY2ZnQDFlNzcwMDAwIHsNCj4gDQo+IE5vZGUgbmFtZXMgc2hv
dWxkIGJlIGdlbmVyaWMuIFNlZSBhbHNvIGFuIGV4cGxhbmF0aW9uIGFuZCBsaXN0IG9mIGV4YW1w
bGVzDQo+IChub3QgZXhoYXVzdGl2ZSkgaW4gRFQgc3BlY2lmaWNhdGlvbjoNCj4gaHR0cHM6Ly9k
ZXZpY2V0cmVlLXNwZWNpZmljYXRpb24ucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2NoYXB0ZXIy
LWRldmljZXRyZWUtDQo+IGJhc2ljcy5odG1sI2dlbmVyaWMtbmFtZXMtcmVjb21tZW5kYXRpb24N
Cj4gDQo+IExvb2sgaG93IHN5c2NvbnMgYXJlIGNhbGxlZCBpbiBvdGhlciB2ZW5kb3JzLg0KDQpB
Z3JlZWQuDQoNClRoYW5rcywNCkphY2t5DQo=

