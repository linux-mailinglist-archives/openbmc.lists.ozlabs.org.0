Return-Path: <openbmc+bounces-271-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E81FEAE26FB
	for <lists+openbmc@lfdr.de>; Sat, 21 Jun 2025 04:07:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPHl12BVlz3bVW;
	Sat, 21 Jun 2025 12:06:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750408586;
	cv=pass; b=VRMWDvp7420azrJ9cRQOSRfh7Ani1bVKS+z0jTWwiTVCxJXnZMZiX7KPUGil9hpJmvxvbCX8CFxowl7XbPICR/Ssoykersa4ReMWQq1efqqxAofHmYdUbBIcCrL7/+N4x9wbm4/zz9QTRRBefaCOt6Ib9wIF3CkdcZ7NRCNEg+Ta95nqh9sCIitjEtKT7X6Y7JQ6dZOlzWhsIt7ziSvINJJ0MydBJ7qX6tVIajx0Hpnezy2jYNvDgVqyMcwNz7jm2dzPqXfKhm1z8qDBoas4tkrxpg95NBCWojJOw/wAEe8fqLZK31dAZMVMg0EPGWHm9sdA5ohPK7CAP3ExVLY1PQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750408586; c=relaxed/relaxed;
	bh=LBNLhT4dMfnPRBJuNp+KNEIwER3YNqVwHNIG0+aY3v0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RWJd6BrjBU5cElcmHuEMxDSpNzl2jJHnvO+MJ7XoEwaEGVe6IkDrpB+PxqlV289VWXB59BXwrEOgmSNWB7QTwOdBpIi3B3XYZLiQz40ucyAXmpqoWlyqQXqovTQ/iAMSJylyDKrn2yai8dtEPpNj+9AsaACRqWfDvbfW2EVFW5IA5u/LFC9nnoP0HnUtZi0g8uG7e7bXQFhfYKrpI3LtPXGu20QJY2lts3kgZ8GYzbvCzdMGLrAF3jwykD54Qu1ANLVrQEaOz7jmS9LyYqBSSVGpFEl6QglTIia0atg853QC2N5YcjMvaREAaKY+b/KyOckLsZAzgdDFHbv+hr2pUw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=ir/gwl1S; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=ir/gwl1S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNrRY3Q5lz2yF1;
	Fri, 20 Jun 2025 18:36:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T289ls+kpaoBoWpyCiKnV+kn8UAUEWDFY0qLx9ItC728Yet7zkTroudI4pNwVCAXA4BCJQFDiAfQgRsVOk57hRBzEC1wq7ImfJWJxC/ZXoaKHhew/KQGMCK2+wVtufZgUO/fKZeqgDPhg1f1lq4paOuXVTmAxxG44X1p0DJ79WAZR45u9y8ESvfQl84K1EScOGuJXGbqUrNI9dIYjE5EAXNu2dXB/dH28FD4H3yKhABH6X3d3u2pP8xIeqEaFpLZemitCW/+jt4NIHmeMIY48QTPdXkOCaqlh7YxLOlwJ2rcAg7ZuITJwhWheXVNY4J+zaRehlRJ8YnTkhE4NKYseg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBNLhT4dMfnPRBJuNp+KNEIwER3YNqVwHNIG0+aY3v0=;
 b=ygWPfUWwNxkJcGx2poCTJVEFsxFW4bkrbrkmK+nMT3l+n6t4GjaXFZVmEA8GAEoVOFCyP6FAOskugyvdNhZmCyjBYpmw2aAUaVUTQLhZ0qSGGyNREVrbJSqgLiZUnlxXdio2YDW0818PNYTtSp5Z29X6fwy2taodjTvMlMBfkDfMRmDVvhOFfEoniYtOtmoVfPqIGfHlEQv/5BRO51DHQixrmya3bOCOvBgyqEY/2qbxw4V7LtWFXyfxmViIzvGAyWFpQ4i2Nxn3l8Fa2A2CAKRYefV7XfcrkBfuSBya75WtvuwCUMkz1htWGCtITL3vHGAJN2zxouZ7R70+XBLDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBNLhT4dMfnPRBJuNp+KNEIwER3YNqVwHNIG0+aY3v0=;
 b=ir/gwl1Si42Mx5SnPfT2w5kqhLmrdQOe0jakKqNqzU3pPpPHwm71n4EevIP1Gds+QgMECy4xM5BnDJqxXPu1va5ozYMY+mhhWIMq3sbuVqGNKTbsZbQ4VecW6Y+WuwYaaLj8bq6CGUdT01xaxrDTj2plT4ZIvTRCAAu/XdPQTjr1m2DJFWiE+AlVEOKSOPhY1K4txsQrE2G6SkzjecEv+IUYKWeOwlA8zaaz5EVdBw7ZclwhvOENhXZNxmnjVvL6TX6pDRKzYFoiSuJPuSiPR4CCpf+uXkw5q+knCHbruw9n3HsRsIYPXBdmGMaYzizA5MR0gAnUXKwslv8+wVCbDg==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by JH0PR06MB7083.apcprd06.prod.outlook.com (2603:1096:990:6e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 08:36:02 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 08:36:02 +0000
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
Subject: [PATCH 3/7] dt-bindings: pci: Add document for ASPEED PCIe RC
Thread-Topic: [PATCH 3/7] dt-bindings: pci: Add document for ASPEED PCIe RC
Thread-Index: AQHb3BN5FUCyyspBIEeldRXN3BMx4bQA2QgAgArqroA=
Date: Fri, 20 Jun 2025 08:36:02 +0000
Message-ID:
 <SEYPR06MB51349D63AFB58B376B1E31A79D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-4-jacky_chou@aspeedtech.com>
 <b387a2ed-af47-45a9-871e-d43a66e41f21@kernel.org>
In-Reply-To: <b387a2ed-af47-45a9-871e-d43a66e41f21@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|JH0PR06MB7083:EE_
x-ms-office365-filtering-correlation-id: e1e70690-d9ed-4b0a-1b39-08ddafd57d41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b1FNWEx4blVFOE1wNjBHRWFGRnBVZG1xMmMxWkRQc2kxazRKSjlxcjhvclB6?=
 =?utf-8?B?V3ptbjhhSlVqckpXN2JublhlUzhNZjl2WlpldUpvN1Y1djIvOGRDUDZGdHVX?=
 =?utf-8?B?dE8xcVRFdWpYb1l3Nmoyc1VXektCbzJmQ0RtYjBJMVplcm1UVUJNQW5NNWxz?=
 =?utf-8?B?eFJiVzdzOFBiRW50MEo1VVNJUWRXTjdtRlhJRERnSVBPcjNqZU9lZU1ITE80?=
 =?utf-8?B?WUE5L0RhS3ZOT0lYNlFnam9hOCtyU0tsL1hjKzlwajdNRkRNV1ZYNU5LSTJr?=
 =?utf-8?B?Z2pPckZ3THVDT0JvRTdqMHlncjh6cGRML3VCWTJOK1NmR284MGgvd0ZsQ3Jx?=
 =?utf-8?B?Z083ZFdRNXBodzh3bGpBVnlSQTYydTFza3Z6bVlJakQ1bFJ5U3IrMDRNSS9I?=
 =?utf-8?B?V0w2WnB2Q1NzbmRHQWJhWDQ2SmpIME1OM2NnVHpqcGx5SXFMRm5Lamp2SnVM?=
 =?utf-8?B?MWRXMCt6VzQ1bmtJMXJnQjBicFZFcmpzL09JUEZaZzJMeDZPQ1hmcUdFK1hV?=
 =?utf-8?B?c2pVTWVGNmNlRDhZWnpsUzNmc0JzWVdUUVUzN2tYN2xnTms4WC9OWklLL3ZZ?=
 =?utf-8?B?aEU5MnFJUVpxWldhZ3hTcUFMbGQ1Si9HN0RlQmpNSG1jeWNUd3V4OHNPZ2Q3?=
 =?utf-8?B?UjFGNlpWMm94WDMyb0JLVVpoN3lyUko4eVI3YWR3bU5SL1FLdis3N3dHVmFW?=
 =?utf-8?B?RURxaU0xNTgrc2VyRVJkdXJHenpZMFl4dlpGZGNYTEJ1Mk5RSUVrS05tWFQv?=
 =?utf-8?B?TXlEdWN1a3IxSzhvRVlwVzlmKzRaV2xiWWVzV2Y1ZFliNFkwM3Z4bzcwQ2l5?=
 =?utf-8?B?ZXBCTmZFbGYzYURzNHp3ODhzV2szSTZsRHJtQ0lQU1o3dHhCSjFkVk9ZRWp0?=
 =?utf-8?B?UEV6clJNcjZzV3NzVjZma3RUNFgwOHY4VmhwMmZwcVhuZnFLVDg3UEVEaHVw?=
 =?utf-8?B?QllvcmUrcjNVbENiYlM3YjE0WW5jV2VGUjl2clpOWUFNOXJabkRLSGNpcFFS?=
 =?utf-8?B?QXpVNW5hY0pIOEZETGl6YURGRWZ4MFFFWUlaN1o3MUlOVkp4RWVueFZEeFdM?=
 =?utf-8?B?eWllY1FackcyZHVRRjBUZFJHa0VvMXA5VXFKK2NSSzF0K1ZmQ0lLb1phdUlN?=
 =?utf-8?B?SzJORngyTk90WVdEdFVnYU1yMWE1K01RSFFpMm1wQ1ZkU0pBaXpKYWRNeE1o?=
 =?utf-8?B?cHVFOWc1c3pxMEhjZ3JwR1g2dU5SVjdBcG40WVZ6Q2JKUStaR3k4ZFNER2U3?=
 =?utf-8?B?N3VqU0ZVNEJidXJWN01UdCtxNmtNamhET0RhbzFTbVVySFdrbmlZM2l3KzFX?=
 =?utf-8?B?cVlqaVloVVJpSmk3dVcvUEI5cnplT0tRb3VNT1F2bERFd3VhbEhVOWVzOHFG?=
 =?utf-8?B?MHJVZFAybTJDdlF0TUg0M1pQWERtYWhYYkN5OWdWRklxME9DaXJxdWMxVjdM?=
 =?utf-8?B?aW1IL0pUT0ZWMG5kcEJ5c3hkUTdLbmlFaitUVmZ2c25KN3dabDhuZDhUZXlM?=
 =?utf-8?B?WndObHhDSWk5bmFEU2tiTVVJeHRYeVVQNVpRK1pIVC9Va1VhVE5oVUw3Smhj?=
 =?utf-8?B?amFiQysvdnI2TjllSGVCWWY4NTFHL2Evc0dRR1ZiY3dpc1dyMnRQTXNLNVZw?=
 =?utf-8?B?UXJTV2F1QkN2WE91OG5TOXhVY3hzZDd6UXJiY0llNXBCcHhrUUg4KzlTaU5Z?=
 =?utf-8?B?YmpKK2k2bXJMUm1jU3ZBbnJNdXIzWVhjUFRkbWI0bjluNWs2bEdDaGdKZjNw?=
 =?utf-8?B?UVRNM2gvZkZKZnJrSmtsN1BYVDRTL3lFVkU5eThleGpHOWFRMVdqZ3dyZkow?=
 =?utf-8?B?dXY1RWJyRjV3cnZ2Uk5vVEtJUUFvRGFEVVlmb2VlRUFsRnNuRC9UUGRYMlJz?=
 =?utf-8?B?Y2hnY21NY2djUVRSVHgzSHRxU3AvVjRKdEtFYnYwZ0pSQVpmOEdRV2lKaEdD?=
 =?utf-8?Q?RTjBYZPbGwCusKnE24dQysGEEjKfdmeR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkRMU0ZxOFp6MkdrbzUyc2dlT2NzdHQ0S01Pa2gvWFdMSUkzRmhabGpTWnha?=
 =?utf-8?B?K0xEaE5uOWh6RHVRc0xnT2hrS2l1VHdpWU9rZlNMVkVkaVkwNFB0NVE2KzJL?=
 =?utf-8?B?YmxwT0IzbGZYMXA5R1NoOUNyZUpIajBrZ3pMcE40SnBqS3ppWXIxNWUxaFVX?=
 =?utf-8?B?R2pmREN0R3QxTVlEZFNrbndqOHpvMmxjYVEyWUlLa2UxK25YMjJQbXB5ajBX?=
 =?utf-8?B?THkxWUJNSy9OZ1pxbEFHWGFXOTZJNDh6RlJuZlF3RGlNRHBqRmVyR1pxVnFx?=
 =?utf-8?B?OTJMN0V5Yk85WkhFMzBrNkRvNmNGc2VMbDNLWE1UT3F6RkhNM1Nkc0x5S0Zq?=
 =?utf-8?B?Qkpja1d1bjZnamhyK1kvdk5VcW5KdDA5UFFJamplUjh0UW1yNnluZFRLUUpa?=
 =?utf-8?B?STNVYUMwcVIwY1VGKy9oMUZhYmVJUVRqWkovZ2ZkOEdpZXk5WVQwNUtLdlcr?=
 =?utf-8?B?OXFib0VZQWFWV2Zxa0JIS1R3U1V0QVk5em00R0pXZSsxdjRmVzdETzZDWWYv?=
 =?utf-8?B?UkZwRjBQYll2R0NrM3lJMm9yK0pYb0c3c0U1eWIrZ1o5Zi9oay9LU29sS2xt?=
 =?utf-8?B?VUVCcXBZdlBBU3ZaVGJVbnVnUXNpaUtzVGk2a0NlbGY0MW5EcW1GcUhTK0RO?=
 =?utf-8?B?MnQ5NlQ0VUZCOFB0RE9QbWttTzMxTVdBMHhzcG5YS3pTL3JKcG5talFyTjc4?=
 =?utf-8?B?bXl2cyttcmJ1ZEc0aFl2U2pESGFIcTdjSU1EUmdkb1RjamFKeDFPS1lRYlRD?=
 =?utf-8?B?YW5pL2FMR2tWN3R0VEhtTVBSdE14eUhySUh1L21UdnV5M05LbEY2UTM0RWJD?=
 =?utf-8?B?OEQ1QTB0NCs4ZmUydUZ6U3U4VU9OYko1RDZ0RXRHSGtKNjdFTWxKV3p0VGZQ?=
 =?utf-8?B?cWtXTnFuQ0xFcG02TitGM0NETHZDZSttYzh6SUhINThhVDFFQ0Z5a0hPMVhy?=
 =?utf-8?B?REt6QVUwbHdsWkJjdEhmaGVrMWE3UHFPUHl6MVNSaFltZmNPNHhyaXZVOWFh?=
 =?utf-8?B?WTd5Nkg3WEZqeTlGRFN4SHNiOWM0dlAvc3YyVFlmK1NENXYwem9ycnJJQ2N6?=
 =?utf-8?B?WXNROEgydjdnYk5ZYkROUGZ2R1ZzVnBoekJaOWdPRHJtNi9nY3FRV3A4TzBH?=
 =?utf-8?B?ZlVBeVhEcUZmbmlNdWRabTFEUURQQjJEd3pYbTUxS1ovQUp6Ynp5ZHg2NVdP?=
 =?utf-8?B?ZGFoSWx1djBVYzRTNnZWUHNxRUhtZWFGUEQ5ZW4zb2VIZC9SNldWRThMWWFw?=
 =?utf-8?B?dkRYUllrUkdYT3ZCd1h0V2VESVRZWUpnM1VoU0dCSThWempPTXg5eWlxbFlp?=
 =?utf-8?B?bEl6SElUNzdNNmxzcnB4UldMNWxTVzVhZHgwVjRQc3p3Z1lndzg5d2NvT1J5?=
 =?utf-8?B?emhCcmdFOFM5WHk1VHovMCtvSzlWMDZxV1JreWcvUHdJMnBhOVdQQmgyTXJk?=
 =?utf-8?B?dC9sM0dHM2xNVDFuQjY2NW9GZTNYUVdpWUQwY29iRnY5QWtOMzhaMWZkenNr?=
 =?utf-8?B?TDNveUp3NHdEVGY2VnlBbk9TcXhuaVZ2Ulo4MFZ5U01VZFNZbkE0RWREZ2dG?=
 =?utf-8?B?TnczOTVMODEzL0M4bTdacnRUWENwbmxPUWpLdUp3ODViSkc4V2YzUmVQRENI?=
 =?utf-8?B?L0dIR3RFMDBRMlVYc1pKU0trSXBZQU1CamlFN0NkeklLc3VZdGpxWjY0UW1C?=
 =?utf-8?B?eUF6V0hyOHdsZmZUTG1oQ1ZlbGhiSmZhUDlNbUhURUpScVFrY1FzUmxQV29G?=
 =?utf-8?B?eG9rb09LM2lJUUhYb0ZIMjVmVHk4UXZORkw4b0tDVnJGVWhyME9LTjNITWJT?=
 =?utf-8?B?Rm1YWE0vZ3pNc0JYWlhNZ3prTklxWUVlODJCcTgzalBTOUZXd3ROdUk2NGxB?=
 =?utf-8?B?LzdwVG1qWlR1NjhXcHMyWnc0Y2Ixd0FtTFoycGtIU3JGNW9JUXRnck5SZmI4?=
 =?utf-8?B?R1lOaWpMcDZPcHd0eW1JKzB3ajQ4dVNVOTVSTDczdkJoWHZyd245Q255Z3NI?=
 =?utf-8?B?djhLY0hPZlFmcVpLc25qSnRHaE5QdllxVm5kbmhnZ3V4M1dRRnU2UUVocGV3?=
 =?utf-8?B?SnBnajZLd1V3ekNNSHVuT3YrdGtrQ3lDV2krMHN3M2lkd1NUMkdiZWNNdVJh?=
 =?utf-8?B?ZGRxeUQwY1VTeHliYnRaNFo3YXJld3JNRFc1TTF6V2Ixd2x2MFF4b0dFK0Vi?=
 =?utf-8?B?U1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e70690-d9ed-4b0a-1b39-08ddafd57d41
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 08:36:02.0436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wO0ft+Yn+u+gEa+G1k6eJx9zqv8zXtrLfEdt1bYoz56JHy6rVwpiwfgvAQ8Y6qSPibxMEpaQf1E+XlYDQeBzM7YnFmuY0D+n6112UhsGiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7083
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvYXNwZWVkLXBj
aWUueWFtbA0KPiANCj4gU2FtZSBjb21tZW50cy4NCj4gDQo+ID4gQEAgLTAsMCArMSwxNTkgQEAN
Cj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9wY2kvYXNwZWVkLXBjaWUueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTog
QVNQRUVEIFBDSWUgUm9vdCBDb21wbGV4IENvbnRyb2xsZXINCj4gPiArDQo+ID4gK21haW50YWlu
ZXJzOg0KPiA+ICsgIC0gSmFja3kgQ2hvdSA8amFja3lfY2hvdUBhc3BlZWR0ZWNoLmNvbT4NCj4g
PiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+IA0KPiBEbyBub3QgbmVlZCAnfCcgdW5sZXNzIHlv
dSBuZWVkIHRvIHByZXNlcnZlIGZvcm1hdHRpbmcuDQo+DQoNCkFncmVlZC4NCg0KPiANCj4gPiAr
ICBEZXZpY2UgdHJlZSBiaW5kaW5nIGZvciB0aGUgQVNQRUVEIFBDSWUgUm9vdCBDb21wbGV4IGNv
bnRyb2xsZXIuDQo+IA0KPiBObywgZGVzY3JpYmUgdGhlIGhhcmR3YXJlLiBZb3VyIGN1cnJlbnQg
ZGVzY3JpcHRpb24gaXMgMTAwJSByZWR1bmRhbnQuDQo+IEl0IGlzIG5ldmVyIHVzZWZ1bCB0byBz
YXkgaW4gRFQgYmluZGluZyBkZXNjcmlwdGlvbiB0aGF0IGl0IGlzIGEgRFQgYmluZGluZy4gSXQN
Cj4gY2Fubm90IGJlIGFueXRoaW5nIGVsc2UsIGNhbiBpdD8NCj4gDQoNCkFncmVlZC4NCg0KPiA+
ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToN
Cj4gPiArICAgICAgLSBhc3BlZWQsYXN0MjYwMC1wY2llDQo+ID4gKyAgICAgIC0gYXNwZWVkLGFz
dDI3MDAtcGNpZQ0KPiA+ICsNCj4gPiArICBkZXZpY2VfdHlwZToNCj4gPiArICAgIGNvbnN0OiBw
Y2kNCj4gDQo+IFlvdSBuZWVkIHRvIGluY2x1ZGUgcHJvcGVyIHBjaSBzY2hlbWEgYW5kIGRyb3Ag
YWxsIHJlZHVuZGFudCBwcm9wZXJ0aWVzLg0KPiANCj4gTG9vayBhdCBvdGhlciBzY2hlbWFzLg0K
DQpBZ3JlZWQuDQoNCj4gDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAx
DQo+ID4gKw0KPiA+ICsgIHJhbmdlczoNCj4gPiArICAgIG1pbkl0ZW1zOiAyDQo+ID4gKyAgICBt
YXhJdGVtczogMg0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAgZGVzY3JpcHRp
b246IEludFggYW5kIE1TSSBpbnRlcnJ1cHQNCj4gDQo+IE5lZWQgdG8gbGlzdCB0aGUgaXRlbXMu
IExvb2sgYXQgb3RoZXIgc2NoZW1hcy4NCg0KQWdyZWVkLg0KDQo+IA0KPiA+ICsNCj4gPiArICBy
ZXNldHM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogTW9kdWxl
IHJlc2V0DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IFBDSWUgUEVSU1QNCj4gPiArDQo+ID4g
KyAgcmVzZXQtbmFtZXM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDogaDJ4
DQo+ID4gKyAgICAgIC0gY29uc3Q6IHBlcnN0DQo+ID4gKw0KPiA+ICsgIG1zaS1wYXJlbnQ6IHRy
dWUNCj4gPiArDQo+ID4gKyAgbXNpX2FkZHJlc3M6DQo+IA0KPiBXaGVyZSBpcyB0aGlzIHByb3Bl
cnR5IGRlZmluZWQ/ICBJIGRvIG5vdCBzZWUgaW4ga2VybmVsIG5vciBpbiBkdHNjaGVtYS4NCj4g
RHJvcCBhbmQgdXNlIGV4aXN0aW5nIHByb3BlcnRpZXMuIEkgYW0gbm90IGV2ZW4gdGFsa2luZyBh
Ym91dCBjb2Rpbmcgc3R5bGUuLi4NCg0KQWdyZWVkLg0KDQo+IA0KPiA+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gKyAgICBkZXNjcmlwdGlv
bjogTVNJIGFkZHJlc3MNCj4gPiArDQo+ID4gKyAgYXNwZWVkLGFoYmM6DQo+ID4gKyAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ID4gKyAgICBkZXNj
cmlwdGlvbjogUGhhbmRsZSB0byBBU1BFRUQgQUhCQyBzeXNjb24uDQo+IA0KPiBGb3Igd2hhdCBw
dXJwb3NlPw0KPiANCj4gPiArDQo+ID4gKyAgYXNwZWVkLHBjaWVjZmc6DQo+ID4gKyAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ID4gKyAgICBkZXNj
cmlwdGlvbjogUGhhbmRsZSB0byBBU1BFRUQgUENJZSBjb25maWd1cmF0aW9uIHN5c2Nvbi4NCj4g
DQo+IEZvciB3aGF0IHB1cnBvc2U/DQo+IA0KPiA+ICsNCj4gPiArICBhc3BlZWQscGNpZXBoeToN
Cj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUN
Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBQaGFuZGxlIHRvIEFTUEVFRCBQQ0llIFBIWSBzeXNjb24u
DQo+IA0KPiBGb3Igd2hhdCBwdXJwb3NlPw0KPiANCg0KSSB3aWxsIGFkZCBtb3JlIGRlc2NyaXB0
aW9uIGluIG5leHQgdmVyc2lvbi4NCg0KPiA+ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBk
ZXNjcmlwdGlvbjogUENJZSBCVVMgY2xvY2sNCj4gDQo+IE1pc3NpbmcgY29uc3RyYWludHMuDQo+
IA0KPiBKdXN0IG9wZW4gYW55IG90aGVyICBiaW5kaW5nIGFuZCBkbyBub3QgaW1wbGVtZW50IHRo
aW5ncyBkaWZlcmVudGx5Lg0KPg0KDQpBZ3JlZWQuDQoNCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0
LWNvbnRyb2xsZXI6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogSW50ZXJydXB0IGNvbnRyb2xsZXIg
bm9kZSBmb3IgaGFuZGxpbmcgbGVnYWN5IFBDSQ0KPiBpbnRlcnJ1cHRzLg0KPiA+ICsgICAgdHlw
ZTogb2JqZWN0DQo+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAnI2FkZHJlc3MtY2Vs
bHMnOg0KPiA+ICsgICAgICAgIGNvbnN0OiAwDQo+ID4gKyAgICAgICcjaW50ZXJydXB0LWNlbGxz
JzoNCj4gPiArICAgICAgICBjb25zdDogMQ0KPiA+ICsgICAgICBpbnRlcnJ1cHQtY29udHJvbGxl
cjogdHJ1ZQ0KPiA+ICsNCj4gPiArICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAtICcjYWRkcmVz
cy1jZWxscycNCj4gPiArICAgICAgLSAnI2ludGVycnVwdC1jZWxscycNCj4gPiArICAgICAgLSBp
bnRlcnJ1cHQtY29udHJvbGxlcg0KPiA+ICsNCj4gPiArICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQ0KPiA+ICsNCj4gPiArYWxsT2Y6DQo+ID4gKyAgLSAkcmVmOiAvc2NoZW1hcy9wY2kv
cGNpLWJ1cy55YW1sIw0KPiA+ICsgIC0gJHJlZjogL3NjaGVtYXMvaW50ZXJydXB0LWNvbnRyb2xs
ZXIvbXNpLWNvbnRyb2xsZXIueWFtbCMNCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0
aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoN
Cj4gPiArICAgICAgICAgICAgY29uc3Q6IGFzcGVlZCxhc3QyNjAwLXBjaWUNCj4gPiArICAgIHRo
ZW46DQo+ID4gKyAgICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAgIC0gYXNwZWVkLGFoYmMNCj4g
DQo+IGVsc2U6IG1ha2UgaXQgZmFsc2UNCj4gDQoNCkFncmVlZC4NCg0KPiA+ICsNCj4gPiArcmVx
dWlyZWQ6DQo+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4gKyAgLSBidXMtcmFuZ2UNCj4gPiArICAt
IHJhbmdlcw0KPiA+ICsgIC0gcmVzZXRzDQo+ID4gKyAgLSByZXNldC1uYW1lcw0KPiA+ICsgIC0g
bXNpLXBhcmVudA0KPiA+ICsgIC0gbXNpLWNvbnRyb2xsZXINCj4gPiArICAtIGFzcGVlZCxwY2ll
cGh5DQo+ID4gKyAgLSBhc3BlZWQscGNpZWNmZw0KPiA+ICsgIC0gaW50ZXJydXB0LW1hcC1tYXNr
DQo+ID4gKyAgLSBpbnRlcnJ1cHQtbWFwDQo+ID4gKyAgLSBpbnRlcnJ1cHQtY29udHJvbGxlcg0K
PiANCj4gTWVzc2VkIG9yZGVyLCBtaXNzaW5nIHByb3BlcnRpZXMuIE9wZW4gb3RoZXIgYmluZGlu
Z3MuLi4NCj4gDQoNCkFncmVlZC4NCg0KPiA+ICsNCj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVz
OiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+ICsg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2FzdDI2MDAtY2xvY2suaD4NCj4gPiArDQo+
ID4gKyAgICBhcGIgew0KPiA+ICsgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAg
ICAgI3NpemUtY2VsbHMgPSA8MT47DQo+ID4gKw0KPiA+ICsgICAgICBwY2llMDogcGNpZUAxZTc3
MDBDMCB7DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1wY2llIjsN
Cj4gPiArICAgICAgICBkZXZpY2VfdHlwZSA9ICJwY2kiOw0KPiA+ICsgICAgICAgIHJlZyA9IDww
eDFlNzcwMEMwIDB4NDA+Ow0KPiANCj4gTG93ZXIgY2FzZSBoZXguIFBsZWFzZSBmb2xsb3cgY2Fy
ZWZ1bGx5IERUUyBjb2Rpbmcgc3R5bGUuDQo+DQoNCkFncmVlZC4NCg0KVGhhbmtzLA0KSmFja3kN
Cg==

