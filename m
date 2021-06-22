Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D543B0B57
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 19:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Y8q4BFwz308c
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 03:21:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=CHnKVQtK;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=CHnKVQtK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febe::72e;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=CHnKVQtK; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=CHnKVQtK; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Y8W17gHz2xZB
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 03:21:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iHrrvvifUqmTDCFK6v8i1fJAlNo/oJPd08uZV9jDE4=;
 b=CHnKVQtK4FrN1K/ke7IzdPrgtx9fXJNKxbAO3bJQ2mG37dRPhv4DQsHC47qqJVuvL2JsZ8thsEdCdE1mW2dT6vj/1HS9swf4Hm0dqdlkGwwEvEHbXGdVbfbrPxyEi5YLv6IjCrKeuyU0y7rvQZ8WLMY4uqH82oMfnXSonQNOcs3VK+ApPXzfN9SPRyWzUQ8ywIZg/adAwbvmLFDbdWVGRuAMn2puBTfrIrOLN3ZSlYvYdcR97kyMTWN6a3hoq431eexJ/LQO7PJcsfNNnS+fxJecVJqBS4P4wHpsKEnnf+1OLyCvwKgqWU4ZrvkWcaz5AtMLThWa47xd0hDslfwjog==
Received: from HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29)
 by TY2PR04MB2877.apcprd04.prod.outlook.com (2603:1096:404:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Tue, 22 Jun
 2021 17:21:05 +0000
Received: from HK2APC01FT006.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:2e:cafe::55) by HK2PR06CA0017.outlook.office365.com
 (2603:1096:202:2e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Tue, 22 Jun 2021 17:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.56) by
 HK2APC01FT006.mail.protection.outlook.com (10.152.248.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 17:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YssKmaWvPkUCic8nk8qNfW+sgm3QXmQiouMteEF+d1hBg4/UZOjHhczY7AoZXZwZC5ayFD4CAr9/oT1NU0knupC0e0vtnmoknmMMLE5qmyUNIBpBgRzFouvGrpn6ZJw3OHX3k4NjUXm7eLb1QOcFre+LWPPxal70Js7tiGxZ+mFET7/KbcLavX3Ifm+z2okYyc8C3o0zNmXv+7uA42a8pNuzVk4QKgz7vw4dKzU5YVSrRwGYIybLQEUggzRwa4/2SfVzi/LNygPJJJewD1s1oJJsgDFimBIWdhQp8tKTuj815a/T+Q6UmlnA3Fsa4yV1jr82TiHfJaocrVxD6pKbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iHrrvvifUqmTDCFK6v8i1fJAlNo/oJPd08uZV9jDE4=;
 b=NwyIFVy2SWr7XC3RurHez97oE/rgjDiWAbiRsjThuSBTU7Z4x83XTWN1IrbnWf38iMFEDtmP2duk0J9zMQvgtQciD4/RJK8SPFa/7CLg07nxq9jSPmCgKPUpl8V9PXGSIuzANMqZuISIk/0tcwRmM7Xrv3gKOU+I5Oxj+NdMb+muyfGixQc2ZsZTXMLgCFyt1H+5A9N4ODRMOgN9Ir1fA158WFDgs3UJC0MO+Z+pYm0+BCxujfVnXwtctdN+lRm3XK/705pCPMx2hoWiNdjSWi/zNRszJqgr0nWypoh/6dfaBxkUDYCHCQDUCYKWxFOEx/X7NlvA2dX4QJxNj7enYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iHrrvvifUqmTDCFK6v8i1fJAlNo/oJPd08uZV9jDE4=;
 b=CHnKVQtK4FrN1K/ke7IzdPrgtx9fXJNKxbAO3bJQ2mG37dRPhv4DQsHC47qqJVuvL2JsZ8thsEdCdE1mW2dT6vj/1HS9swf4Hm0dqdlkGwwEvEHbXGdVbfbrPxyEi5YLv6IjCrKeuyU0y7rvQZ8WLMY4uqH82oMfnXSonQNOcs3VK+ApPXzfN9SPRyWzUQ8ywIZg/adAwbvmLFDbdWVGRuAMn2puBTfrIrOLN3ZSlYvYdcR97kyMTWN6a3hoq431eexJ/LQO7PJcsfNNnS+fxJecVJqBS4P4wHpsKEnnf+1OLyCvwKgqWU4ZrvkWcaz5AtMLThWa47xd0hDslfwjog==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR0401MB2159.apcprd04.prod.outlook.com (2603:1096:3:4::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Tue, 22 Jun 2021 17:21:01 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d93a:6771:3a9b:d411]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d93a:6771:3a9b:d411%7]) with mapi id 15.20.4219.025; Tue, 22 Jun 2021
 17:21:01 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: SDR sensor implementation query
Thread-Topic: SDR sensor implementation query
Thread-Index: AddniihthhcI0wJVSX62mHUtKfy5Rw==
Date: Tue, 22 Jun 2021 17:21:01 +0000
Message-ID: <SG2PR04MB30932F39EFCE1A165A5F9A94E1099@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNjllNmVjZGMtZGZkZS00MjdjLWE2YjctM2E4NGM2NTE3NzYxIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlwvQ2pETVdnRlhoeW50REIwYnNwZnhFcG5cL1p6MDZ3dVp3QUFBZzE3R3lzak1JXC83YTdzSklVUmxNQzlWUlEySzAifQ==
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2401:4900:2353:949f:a54a:fe9f:8eaf:a527]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: eb2f39ce-8d6c-474f-a335-08d935a21dc5
x-ms-traffictypediagnostic: SG2PR0401MB2159:|TY2PR04MB2877:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB287770B1B6056B0FF9B5E703E1099@TY2PR04MB2877.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Wf2t0yzJrTiApBGpafs/yGHOtnOgo9DXzfo4WqQbDn7IfekXDZsRDNJYMj8fok863zWuLfDfAOIfeLYnJQHP+JoufALvF4yGqTDJb/EnvLjSkrt+5jyhlIVKHQnvPTJrn32/pjc0tpDGtKnStasyuR/6GL0OEs8m1ZtWyOCWxhsEUOj3tUtPSYlQZlsPrE+7qSVVEkKffYj/0jtUo0Gt4GSuheXhJMsWU8K5pbkPAGM6z37HwKLHwlw7bCX6Qey020Ht/Pb7bOC8ylAuW3CiicLgD8VueGMJNrjfvnewkz50uLUxj5YXhtV95MUtXMc1rne3zaj1CxN6bVi5o20XhshV1SgkaufCvHLMp15/rHk2vACWzdYFhkTQ6vjXfYspwz6+sMHor9rP2UzA2nE5oQU2Qbttw/VZ8e7wp2ZT2dAhbF1R4t0rFw9lAW2Mt682irgCcWzxAY0lsPM30iHf1P16iQPKkJI5dRm9rC/ny0G6Yz8ZMbsQlvpRVdgVJrENa5i2DqRLvYWroI8yjina9cPaF+bn0X52qdLvH1F3uird41DLNIw+lECUWod24EFcDF32fcoaDiKZ80mJyadAjGy10Y3xkDkr2ew1acTaV8g=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(52536014)(5660300002)(3480700007)(478600001)(316002)(6916009)(66946007)(66556008)(66476007)(76116006)(66446008)(64756008)(4326008)(86362001)(9686003)(6506007)(8936002)(7696005)(33656002)(122000001)(38100700002)(55016002)(83380400001)(186003)(2906002)(8676002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sgoX6eawlXiDl42XyjMVzXmfB/BmbhwJinACq1Tm1wwQ3zhiv4vLpVHEop7R?=
 =?us-ascii?Q?bfIzaQN3n7F/AsvOEz0qzzvqPmuRXPAscp+4pI3ZsxxjdIIp3jRFx967BjGC?=
 =?us-ascii?Q?Xj8HrA5MnyL2uYd22uonEB4FJfSt3HJkkwkiNyInK8nhiGsm5nQR/2kU0T7y?=
 =?us-ascii?Q?U9SnDoMbhIbmSBQ7gB+Ciob3pRayiboOXklYnnrMrvhcmRV4rog6ttE02SYc?=
 =?us-ascii?Q?1vNwmzmtc9/SJEeOheY3H9AzLNc6tc1zVlOf2CZMfP9ZdApivvCbB74x9iBD?=
 =?us-ascii?Q?jUEZMmXbVhslcamFNS/XWc2ycSCPq/6y9dYRuIqgQ6ta+1MIuaBG5wP0hKCq?=
 =?us-ascii?Q?V6MpMCqQctQeKQIYpj9qRkfRCqaYij1yC09/0ifYnyzTlk9FxsEgSkQCeJFi?=
 =?us-ascii?Q?5BUuBN6HlbB0hMhkA7WyGg+1d5KRDH6l7+d+vmZqWqOu+DjBvYudQMAtj/LP?=
 =?us-ascii?Q?n465cRo2e529C3QjdMNSN5wuMjIT0QdWgUIzN2b97/RkKNP++c7eQO6TP7Ds?=
 =?us-ascii?Q?jLUYt79VedXYrWYm10jl+7HiBQKZTzy/mcbJZLNJvoiY3GG7a3bT1eDpTj98?=
 =?us-ascii?Q?P5U0cOsCm6TwhnjuhmWzoeGdT7Ge97bumxo1p7JmKXMKfHNgxEwki3o10BT8?=
 =?us-ascii?Q?7VzwDukWNiyopGCpmXGK4mEBP8DwnV6QbLyQgpM7E+KimDQ3WItZivXfk6qt?=
 =?us-ascii?Q?ani6Iwcafe9FlI0XioxSuwMPD/YLy7e+eyKYiUUuG8EeJzhqyiszxSZApmJP?=
 =?us-ascii?Q?JZoX76hu/JfwWX/bfMfEUJEsZwB3I5kX7ZrQPziaPxy1i3MCnTwDhkImGdqU?=
 =?us-ascii?Q?p2kAYct02vDBtoi8zgbKOts2kl1QDfdZx1XW2bhU4v1pAC/hjABgXAu1wZkw?=
 =?us-ascii?Q?S0VNlnXVW6E+xhHjaQAmfYo9fPYF10HQhDMt9UhFlwm5S59SQr09/nWZMbnf?=
 =?us-ascii?Q?dk62W7v5Z6kKlOER295LMm2G/lv4A7aElKLxr2C+ldnRaIn7FKqYeK7/qQVr?=
 =?us-ascii?Q?2WCykegyf3PYjqVosY+3Z5Yb+ckLwUmU0IZoXYvWHdT7a5Kl2UXCEfUlVf5B?=
 =?us-ascii?Q?mRCyvJCUkd+ICR8Hhk99wM/nNiIshi5E5Y6gUFeZGvRGq+gNwtm1DXJiJAb+?=
 =?us-ascii?Q?lig5RglBJnj6WfT8iZPpvl1dEytJRZrf2FNzJVMViFRakNYRUlT7bdV8yN+y?=
 =?us-ascii?Q?XkPrb+ZtV5dLYfq3jIQYxwubI66JEzHm6n+YF4XN/ZUsqgXAzwZLjHfNiL+W?=
 =?us-ascii?Q?kkhTkGfkIzpXnK1bO2xauh/Xlt4oxmD8RJqvttgX+8toFs+Lmqow2pEZ+omr?=
 =?us-ascii?Q?oA0vEObi3xgIABfQtTuviM+KTdvp7r6Rw2OQKReUFqa5g3IFr4FRh/DA5341?=
 =?us-ascii?Q?wlRUJw0tvGNdgybChoJnRhTY8INg?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30932F39EFCE1A165A5F9A94E1099SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR0401MB2159
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT006.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8fcb08b5-d9ad-4d3a-310a-08d935a21b81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZ4ZACy59fsRZEtgAkDiddhXACsrSd5sS1ZXW+B2cKPZnGzemsQBOsBjgtUDZuh2ORoIEWEq+orc0IT7vGqTqXSQSuBz0L6+TsBu1MrQAV1BrNwYhF7sv1pjGUu+G7XniZ3c9ZhvPSxumQIttVArHXQvp6u4ExlyBz5y/e0ovlpv+Pr6jpaw1Eu9D2ma5ZBtFLLrLi1LlVO+UHNSZB0FzgagGDlYYdrEdU4lHnBFUSAj11FH6DvlbovCasILinUnU7AcK6vvySQcWm9BIL2K9vVIh0muQJANyEyONDRnL5aoRJgfH3TmciNcUAgci2YF+Tmtd9R5Qyr6LwGxtkoNqc0qdBfG//FRw6xlbfJ2aVrvGa/YYrvzWKXvGgpa82tOeu6ugonaQ8cxP4NMeUe0nTJfgKL0OK2VhjMmkSYF/sYKpsdYGhqBe1GMvzRwW52xKhyfCFWHYMXhyjluLiqOQ7OuBfgneESS81Lrc5TuL4TT/oyrDOEwu0FtiMa1N5DA7wqE/hpBHFVVeOCE22B0216M5FbkKX3Vpw+B9aSRQA+hRCWOC3wqFaPFxnhksB34q+XSwmn0WDxqYSMjEIlbvJlbuFRcoI0dlLyH7sXgcosHJAo93fzwTp5iQO5l2zEZHE8IQj1VJNQ3SrN1sY72S/ySq4nfKSWyvdyFmEFmy8SnMbws606h/q8dPIdlZFhm
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(36906005)(8676002)(356005)(6916009)(4326008)(8936002)(478600001)(52536014)(5660300002)(2906002)(316002)(36860700001)(47076005)(86362001)(83380400001)(6506007)(33656002)(70206006)(55016002)(81166007)(3480700007)(336012)(82310400003)(70586007)(186003)(82740400003)(7696005)(9686003)(26005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 17:21:04.1366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2f39ce-8d6c-474f-a335-08d935a21dc5
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT006.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2877
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB30932F39EFCE1A165A5F9A94E1099SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi Team,

I am working on SDR sensors, where sensors details can be read from the hos=
t and displayed in dbus path.

1.      From entity manager configuration file, "bus" type will be get from=
 the entity manager.

2.      Based on the "bus", we can get the SDR info and record count of the=
 sensor for each bus using IPMB SendRequest.

3.      Also, SDR command for Reservation ID will also be received from Res=
erve SDR cmd using IPMB SendRequest..

4.      After getting the record count and reservation ID, packet will be f=
ramed to get the full information of each sensor like sensor name, type, un=
it, threshold values, sensor number using IPMB SendRequest..

5.      Then the data will processed and mapped to dbus path.

6.      Again, for next bus it will continue from step 2.

This implementation is based on line by line execution and also from previo=
us output.

It has 4 dbus method call, whether this approach can be implemented in asyn=
c_method_call() ?

Could you please share your suggestions on this.



Thanks,

Jayashree.

::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________

--_000_SG2PR04MB30932F39EFCE1A165A5F9A94E1099SG2PR04MB3093apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:195899434;
	mso-list-type:hybrid;
	mso-list-template-ids:-1080509262 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:green">Public</span></b><span style=3D"font-size:12.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am working on SDR sensors, where sensors details c=
an be read from the host and displayed in dbus path.
<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo1;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"border:none windowtext 1.0pt;padding:0i=
n"><span style=3D"mso-list:Ignore">1.<span style=3D"font:7.0pt &quot;Times =
New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"border:none windowtext 1.0pt;=
padding:0in">From entity manager configuration file, &#8220;bus&#8221; type=
 will be get from the entity manager.
<o:p></o:p></span></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo1;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Based on the &#8220;bus&#8221;, we can get the SDR =
info and record count of the sensor for each bus using IPMB SendRequest.<o:=
p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo1;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Also, SDR command for Reservation ID will also be r=
eceived from Reserve SDR cmd using IPMB SendRequest..<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo1;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">4.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>After getting the record count and reservation ID, =
packet will be framed to get the full information of each sensor like senso=
r name, type, unit, threshold values, sensor number using IPMB SendRequest.=
.<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo1;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">5.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Then the data will processed and mapped to dbus pat=
h.<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo1;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">6.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Again, for next bus it will continue from step 2.<o=
:p></o:p></p>
<p style=3D"vertical-align:baseline">This implementation is based on line b=
y line execution and also from previous output.
<o:p></o:p></p>
<p style=3D"vertical-align:baseline">It has 4 dbus method call, whether thi=
s approach can be implemented in async_method_call() ?<o:p></o:p></p>
<p style=3D"vertical-align:baseline">Could you please share your suggestion=
s on this.<o:p></o:p></p>
<p style=3D"vertical-align:baseline"><o:p>&nbsp;</o:p></p>
<p style=3D"vertical-align:baseline">Thanks,<o:p></o:p></p>
<p style=3D"vertical-align:baseline">Jayashree.<o:p></o:p></p>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_SG2PR04MB30932F39EFCE1A165A5F9A94E1099SG2PR04MB3093apcp_--
