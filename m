Return-Path: <openbmc+bounces-632-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF4B525BD
	for <lists+openbmc@lfdr.de>; Thu, 11 Sep 2025 03:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMg1H5xHPz2xnx;
	Thu, 11 Sep 2025 11:28:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757554099;
	cv=pass; b=kxwbgBzONmr8IzeijOKHjJeC2L5TvMmQaCH+rbib856cOHEAMadIXwjVXVSZJOVu+3HjeG/STK8aymbzIdRgpkGDjhfHmdNLTHhMtMCjMNc2tGP1IUwiuz/2wjZQbQIulvNuVTwCI7MF93LEhNXnVpASVJtSKSh3VE/sDHOdx9/xDtIUSXhTTVRH9UianxJpL2KE8K+TBpsR+6f47DpQ87ASzNQ6Rcyf+vm8ZaqqZD0toVtbpSAUs6WTa7G/JqE2EnCOrRpQ+Uu46GvQ7GuijmvNCtlzV+9otT9+iNBej/ylXETUikqyndKSdB+yj0Rj1B6JGbySCmDNCmydKL7VDw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757554099; c=relaxed/relaxed;
	bh=pizbrGg4YzoI6owTTtSyLL3dwS40rzJJBAB9fOaVYyE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JtztHQsTF3iJuFzFi55EsaJYShUrBcTu+XBauUPCwcoZdlueUsWgT9eTAWEYdehQIq2QsEQa06m6YLS3lwYSUHQMOMCBiYnOkFRRTeeIjW+iC/O4n48oMV1Pf3y+KXXMFLX+0SeGH+yIK6m4BecFLYBPDabO6Ic7ZS8WPWTNURTKxN6NI0Pep4NOQAjwWxE/XlCl/R67F45m1MC5/rc7afzLgtvFBmNU+jnF+obCrhosljGS5ntUDWNOjd2NOTvx9v5UL0tYVGI73vcqj9uVdDTBnAcUC7zM7hh9LES95wEXMiDkd3GctFAwgMYhbzcKBePP95T3QUQGfdVN6Vxfaw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ZjoWQbip; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ZjoWQbip;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMg1F5tffz2xnn;
	Thu, 11 Sep 2025 11:28:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxTTfkLkkAmzKRXhEkvFRDQOShvrFeUsoJRGNNxJyLJAs7Ap1Q3FX1Tj4Ld3GIp57fMy1RGu7sE8TZCrgSAVFQ25F7fiLkK82yeurgTryNb9Rkp+0NqSnQ6vxaHvLUvbfsFthZnup1/DSExPsUOz0ZEnlBYIHfpfNmR/gFEfUgZmPf/GMyvhg6pV0Kn6aE8EtHvAX5cIxgxqfuFRrj4Azjd15UetcP4MVgdCApmwKXnqiKi5z/YsnvtQZnSAk5V5yp7O+y6reVJWOvbgyQKLl38OH100m+heIaLD3f3AwB4X1pNN3Hld6caiZHeZf15OUWHETbzjUGWBPmr3hQXWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pizbrGg4YzoI6owTTtSyLL3dwS40rzJJBAB9fOaVYyE=;
 b=Gr/yN0TveDxD1c04fLJj7ekrwyilCaDYI/5Lnn0pi6ocLFnUCtOC5EThNKPxtcImhJpXM8t0jwFLQW/jTQI4D0d7aVSmMz0hFtxlT0aep0GjWiYDV/WimTg6z/ZNdc6S2uoXxbcQYMFriqbvAhnGSFy91mI/0Ji6c67aBKCdCdWRszxxOu4HPKsPzt62onilTamFtJ6FPz4Sw+K+nBnzJZ9kAq3gaSdm8Tmg9XuBOh235DmkYXrrcsSmi93VXkbVbHFXveuzYFCnC78REQZZC96JKL//YRU/1JJOoI4LEonSvLlZQZF8TJrdzyy+xxBKq+t36pEB/ObUdw4Yv7cLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pizbrGg4YzoI6owTTtSyLL3dwS40rzJJBAB9fOaVYyE=;
 b=ZjoWQbipcdubh4Nl1KI/dZXzjB9Ck6nHgFHZ8V1IgIVPe1vPkpf/1lgVGrBS2J/wKh/4hF9tPIVMRGdUQq27dDgZKLwY5ShOI2InQx3Xrah/CVtococnL+wxzeImyWaYWq2Yq4Z155UaOH+9M0Hh8gb1CsM25YxCA7JRjXnbG9nF+P9npzEG4xmHrokINxZdahxOvTrdf3U8YLv+KY7EdYSfx9ox6HUavzK9BCUr9XAQ/C83rw+XABqtgTX4Xp8lkYTc0stdR1iTr/i4nCsZvGhSZrYhPKqie2DZUmx7lW3aumPS/+gtM1Yi7MooeqldXtcjn5bvX4YTIykfmgNjnA==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KUXPR06MB8098.apcprd06.prod.outlook.com (2603:1096:d10:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 01:27:51 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 01:27:51 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jeremy Kerr <jk@ozlabs.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, Mo Elbadry <elbadrym@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:
 AQHbhoFMYr1F1iCu706pUdZbmBz0BrNWKwmAgAMnDQCAAApCgIABc/fggADIQoCACD7TUIATPNAAgAAVK0CAAw8fAIAAONYggAecSoCAABKwMIAACvyAgAANJ+CAABVGAIABfA3wgAAHyYCBCWl+gIAABUkAgAANMACAARickA==
Date: Thu, 11 Sep 2025 01:27:50 +0000
Message-ID:
 <OS8PR06MB7541BD362CE9FC0AA3CFC46CF209A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
	 <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <069b9fe4-c54a-4efd-923e-1558c59fe3f4@kernel.org>
	 <OS8PR06MB7541C69AB8E6425313DA8606F2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <677cb075-24ae-45d8-bfb4-9b23fbacc5df@kernel.org>
	 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
	 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
	 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
	 <OS8PR06MB7541FD8691B43EA33BDC1D22F2A72@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
	 <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
	 <f9fc4b59-bdcd-4983-b7c2-0fec94e62176@kernel.org>
 <52943e49aaea7bb6def5bc51dfd57392b6ae66e4.camel@ozlabs.org>
In-Reply-To: <52943e49aaea7bb6def5bc51dfd57392b6ae66e4.camel@ozlabs.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KUXPR06MB8098:EE_
x-ms-office365-filtering-correlation-id: 2346fab6-3767-4fb3-6b3d-08ddf0d26c72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y0s1aEFwMCtmak5CMUtvbHdpMmZIUVJOck9yME9TdUhkKytuL0F0Z3NCT05P?=
 =?utf-8?B?Ty9PUGNnZlRvYXVXNzJUcXFDZ1RxWXd6U3RIS1U0ZkhxR0xVa0dRZ1V0T0ZL?=
 =?utf-8?B?QTczdzg4ZER1VjNwTC9vZ1VpN3VEczFuanFlSXN6cmFrTldIdkRPRTdlNmlh?=
 =?utf-8?B?YVBxS05mVUZ2WjE0YndQN0ZlSGl4NnM2RVd5eklweDFBcjk4MjRVaWd1TkpD?=
 =?utf-8?B?VUcrVmNLMDZKR3k2bVhOSkJyckpMcy81dXV0VVgrTHRFY3gwdFV6bjV1YTAx?=
 =?utf-8?B?b2toTGNHOXBtTjlsYlpLYVNuWVNIeVRrYi83Z0R5ODB4ZE5hcHduckptZDRi?=
 =?utf-8?B?ejZ5Ym91TWlBVGtKOEVJMjhkRmJTUlhHUWp3TlFMY0V3MXZsZ0Iwc2hxYVNN?=
 =?utf-8?B?ak5uRUZsZWF5Tm9kR0UvYklxdFlyUVZFSkZCckxiNjlCdTFSd0hrdkcxSGov?=
 =?utf-8?B?UlFKc3k0Qndtb2lqU2Y4NG9UN3k2WUIxSGN5V2l3eHNDTFJQWDZrbVJHYzFh?=
 =?utf-8?B?Q2NyU0hqNHVYeGIxWTYvTUIrcTRBMkZETXRNQnF4aDRWakhlSDVaMVJNQlV0?=
 =?utf-8?B?NlFyMXV5VVF5SW9TZm9mTjZBdFhZTmVHZEdYN1BsYTNWT1hxNkNVRVNpdFZK?=
 =?utf-8?B?VTBxdVlLc2ZOaERQbUp2MFVRNVZBMjJtMmJkU3Zra0M5MkdlNTlMQW9taHhB?=
 =?utf-8?B?WmV3MHpRUWt4c2YzR21UQkc5WTJCckF0SDRUbXJ0djVMaUhLMXhkRHJNc2Jj?=
 =?utf-8?B?VENGcGpqR0ltaW9scXFXcnkxV3VkdzBldnVuNmF5OXhjNjJ2bmNDNk1NZWMr?=
 =?utf-8?B?SE4wYXpBUFkwNVF3SmRVVG9ldnNTdGVqWWpaYU91Rk0rVXByWFFNU0tsWFAw?=
 =?utf-8?B?K2dGWlNTNVJmYmMwdnFNRVFCNW5iYlhSRU9SNnJPK3R3b0VPVlhsNDFEdGlF?=
 =?utf-8?B?NDE2VCtwL2VWc08vOG5MaGgvNnpwb2RyOXdpWDV6MDEwMVBmZnNHMW8wamsz?=
 =?utf-8?B?aFlDWlpqdWJHQ2Fxek5oN0RZdmZ3WjZPN1VIeGhLK2V3SHJnaE45cDNsM3I5?=
 =?utf-8?B?cUVNQXdsemw5UHVENnRoSVNDelN0dnYrZGROODIySENObmR4U2hYa2pzdHA4?=
 =?utf-8?B?dUpvNndKeG1YdGFwODl0b1ZuYkdIM1pBOCtlOHVtNzcvUFRoOTBFQlFjNlpr?=
 =?utf-8?B?QU5nN2JuNXYrV0R6MCtYYURYeGVLT3E3ck9hQU5mMmpSaDRiYU03YllRMWJ6?=
 =?utf-8?B?azc5NmZsUkdybUtQNGxRa1ZUTmQ2Y0dyQVRTZW9xT1ljMVh6dExBcXFxTkFo?=
 =?utf-8?B?a1JsQXM5M28rQWMyNXBza2NUaHlZRXhkL2RnelJwK0pwUTZjcXhDSDNvNmpl?=
 =?utf-8?B?OVFIYm5UZkx1MlVWOEVyakJzWEhSWmhDdGsvR1d4WHU4a005dG54dnpPVXpG?=
 =?utf-8?B?RHhycGQwN3BTUnJGbW8yKzI2TUNEWityeTl0TElZQWVmZ3dVUHRlUFVEVVkw?=
 =?utf-8?B?Z3dkY1pvVWhIN3dTbkRTWjU5YzVoeDlTRnRFa1JCK1RscytESllkb3lGcThZ?=
 =?utf-8?B?Y3BKSDZRWlhiN2t2WXVOTkJXTmlicXNFVDdGVU9IZWxhTjcwMVFsakMwSjR5?=
 =?utf-8?B?N3hhZjdjeTZQRTVFTGZ6eml1ekNrTWYwcStEd1BOS3Y4a3FHVDQwWmlqZGJG?=
 =?utf-8?B?ZVZ4d2h3MVJZOW5Tc21oMjJIaVVWd1BxckJNWFcvZ1NTb2VFMjU2SU5Vajhq?=
 =?utf-8?B?dWJGc1VQK2RETnppVytiT0tzb1BDMDByUWdONmhHQkFEOVYxZGFHdnhLWnIy?=
 =?utf-8?B?dFNkTmhTYjVyQkQ2RlpuT3REanhCZHFjUWF6WHVlQmVFYnlQZDZCVHZYUy80?=
 =?utf-8?B?WUYyTkNBOTdCelFEQmFoSXhwRC8xNllQaGduN0hjTzlxak5ONXhqT3NUdzZn?=
 =?utf-8?Q?AfKa97Ucx5E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1V6eEROZmZ6ZDk5Tys5dkZoYllJa2xpOURyV1VlT2EydHdXVFRaUDJhaThG?=
 =?utf-8?B?TVFQdHFLVCt0dGQvaUp4aGRKbVU4Zm1sY2s0SEE1Y2VwV0hLTjlPeExIcktE?=
 =?utf-8?B?QjJQVUdqUlZhZDZvWkh3ZWNyZzZyRnJJUmY2V3VXWlIvNXJuWWFTbTdkU25U?=
 =?utf-8?B?TE1kVEd2dmtwdlRpUjVEZzBhWDc5eDg1b3JFOFVydlJqZEo3ZzFnOGFDRC9W?=
 =?utf-8?B?dEdFYkN2ai8weHF4WDVjQ3VSak56b3B5M0lkbHR2dWV3Wk5YK3dDZFRFUTJ4?=
 =?utf-8?B?WUgvNmJpNDFRK1NDTDdueEdML3NqTjJqUmRONUFaZlhtRUF3TWkwelhFcEtM?=
 =?utf-8?B?YjRsRVR1ZlRXc1d0ajZaRzNpS0FNU2lyMmJvaWVtenB1QjZ5S002RndCYTNC?=
 =?utf-8?B?VVVyUng0b3VaOFhYaGh2NnhIRHR0eldRekdwaTJXRE9tdy9DTDFiNkp0SDJw?=
 =?utf-8?B?OUR4U05iWTZ0WjNObUtuVzM1R216cXdnMU4rTkYzYk5RMVphdy9hSmZtQkty?=
 =?utf-8?B?WGc4U0JKOWdXbXlIeTdOaFRLbXZVT0NESEVnQTVBTzVnbjB3bmdMaGh2RWxa?=
 =?utf-8?B?cXhydFdaZSs3U2pha1BiS3hGV2Rrc1hPdlRYM1RsdVErNHMyZ1UzamJwYXdk?=
 =?utf-8?B?MDRpVmIxR0dJeWdNYkVwVXpoSkJ0VndWd0ZsVkM2WS9PQTUxRjRBSURvSUVN?=
 =?utf-8?B?RFZLQyt0ZEFTak9ES2hmTEp5MWpOZmxzMGlWb1BRUjlnRCtOdm4xaGhsWExo?=
 =?utf-8?B?VUFNMWp4ZlpYS0g1K1JTSlY0cysxaHM3ai9VRkpYdWQvd052TjIrVm5qckhO?=
 =?utf-8?B?VlVXaFFveEZiMUt1NENFNkNlR0FuTUxiZUFxTXF2QWpqUzdRKzl4Uy9HWDlB?=
 =?utf-8?B?YTZRM0dpVGJjNWJXQ1RtdS9MNkZyM2tMWjlCdy9WV01KOVQvZW1vL0xLNG13?=
 =?utf-8?B?UlhPTkZlTjlWWGIzUStWNG9Ec3dxVEVrQXZnSHlCNGYwVzhrS2NsaHRsa25N?=
 =?utf-8?B?OEIwU3hYakNtTE5qMU9hSjNyS3hQU3pEaHFmZVVIQ3A5b3NwV1lORFdoT25v?=
 =?utf-8?B?SkpRRkRraWN5K3N2aGEvbDNRY25jK1pUM0lEVVFzL3A0TjdiWXNVcGY5MEFa?=
 =?utf-8?B?SGxrQWY3QUJzaW84RHFPLy9TTlNsZ1dMZWhLS0l0ZXVyUGM0NmtkdGE4aTg5?=
 =?utf-8?B?dHBVaVdEWHJnSlBMME5SWmFrcllOTWVCaFZBc29MVjYzOC92b2c0M20rcGVq?=
 =?utf-8?B?SjBkYzcrazFaVHAyOGN4eWY1SnQxZXZERzJPZ3BqblBTOGJ2RUx1eEpRK283?=
 =?utf-8?B?aFd6UEF1N3I0R0J3cUZrR2hETW9HMzA0QmdhbEpvNTVORUJNQklpMEFrcVBl?=
 =?utf-8?B?anRITXhLZnhTSFBWYzdrbEdjcEJZZ3IrZ3ZUUktzdDVURk0wSlBSSmNzK2pK?=
 =?utf-8?B?YWkrZUFBcU80Q3dSRXlUVWRld0l4NEx1RTVqeVRyREZLTnVTUjJXL0tDZGJH?=
 =?utf-8?B?VWN0SnBYcnJjbVJzWmY1M0tycmxCRTVsa20wZCtvVXZrTFR4YVB5ZHhRL1FI?=
 =?utf-8?B?eWZwZXBURW5JMlh1eDE2dERqS3BMVGp6Rms2UnRmMnFIZTRMeklYOWhYdmhB?=
 =?utf-8?B?Ym9kZ3I1VGR5dUcydnVucWVUWlpPNEN1MHF2NTg5UUhPUVk2NEdHRFFZQmJS?=
 =?utf-8?B?SUM4NzZTOFRKZkg1RWxLVlpiK0pTOFBPS0ExR0lteDVMdEg4K0hhTzBQVEo2?=
 =?utf-8?B?eHhLSWY5QnhEV290VDBUWG5GWkpSSEpjUEZhTlFncVNrNXM5NXpVcmxaQ0F6?=
 =?utf-8?B?WG9hOENGeklITWNZWGNDSUdoak9mRjI0TGpVTjEwOXlZYmp5Q2N2WHpQeVBh?=
 =?utf-8?B?S3kvaW43S2NwR1E3M0dOUnNOenh5RFlKbnA5ZDdmNFI5ZnArb24rVmF2TG1r?=
 =?utf-8?B?QUxFWU9peWNjandaM2p0anhFZHVaOTdRQWZWS1RraXpEenRCYXI0RHpLcllB?=
 =?utf-8?B?U08xYmY0blc3cEthSTEwZER0WUhxYkJvUXpnakFicnlqSStiMENBdHNGaW5m?=
 =?utf-8?B?MkZ5Si9nL3MxRzd2WnFJMWpwUUJ5R1ZnS2NTV3Iwb1hDOTBuY3pnQnpZREVs?=
 =?utf-8?Q?CIMu1ZlHmHRcwKWSrIDSAJecf?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2346fab6-3767-4fb3-6b3d-08ddf0d26c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 01:27:50.9206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0OSnz47oZzqTe+dof/g7fAS2sH3z1mFhFlqL1dnBhdot8PfMDW3AxqOvUgyf9AL/E60M+TXv6LCY5d38ybjpAJLRSAnba/PPJL2Na7fGVAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8098
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDog
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gSGkgS3J6eXN6dG9mLA0KPiANCj4g
PiBZb3UgdHJpbW1lZCByZXNwb25zZSBhbmQgYnJvdWdodCBzb21lIHZlcnkgb2xkIHRocmVhZCB3
aGljaCBkb2VzIG5vdA0KPiA+IGV4aXN0IGluIG15IGluYm94Lg0KPiA+DQo+ID4gSSBoYXZlIGFi
c29sdXRlbHkgbm8gY2x1ZSB3aGF0IHRoaXMgcmVmZXJzIHRvLg0KPiANCj4gT0ssIHJlY29uc3Ry
dWN0aW5nIHRoZSByZWxldmFudCBwYXJ0cyBvZiB0aGF0IHRocmVhZCAtIFJ5YW4gcHJvdmlkaW5n
DQo+IGJhY2tncm91bmQgb24gdGhlIG9sZC9uZXcgcmVnaXN0ZXIgaW50ZXJmYWNlcyAodHJpbW1l
ZCBhIGxpdHRsZSBmb3IgYnJldml0eTsNCj4gb3JpZ2luYWwgY29udGV4dCBhdCBbMV0gaWYgeW91
IG5lZWQpOg0KPiANCj4gPk9uIDI0LzAzLzIwMjUgMDk6MzAsIFJ5YW4gQ2hlbiB3cm90ZToNCj4g
Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjE2IDEvM10gZHQtYmluZGluZ3M6IGkyYzogYXNwZWVk
OiBzdXBwb3J0IGZvcg0KPiA+Pj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pj4NCj4gPj4+IE9uIDE5LzAz
LzIwMjUgMTI6MTIsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPj4+Pj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MTYgMS8zXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9yDQo+ID4+Pj4+
IEFTVDI2MDAtaTJjdjINCj4gPj4+Pj4NCj4gPj4+Pj4gT24gMTcvMDMvMjAyNSAxMDoyMSwgUnlh
biBDaGVuIHdyb3RlOg0KPiA+Pj4+Pj4+IE5laXRoZXIgdGhpcy4NCj4gPj4+Pj4+Pg0KPiA+Pj4+
Pj4+IFNvIGl0IHNlZW1zIHlvdSBkZXNjcmliZSBhbHJlYWR5IGV4aXN0aW5nIGFuZCBkb2N1bWVu
dGVkIEkyQywNCj4gPj4+Pj4+PiBidXQgZm9yIHNvbWUgcmVhc29uIHlvdSB3YW50IHNlY29uZCBj
b21wYXRpYmxlLiBUaGUgcHJvYmxlbSBpcw0KPiA+Pj4+Pj4+IHRoYXQgeW91IGRvIG5vdCBwcm92
aWRlIHJlYXNvbiBmcm9tIHRoZSBwb2ludCBvZiB2aWV3IG9mIGJpbmRpbmdzLg0KPiA+Pj4+Pj4+
DQo+ID4+Pj4+Pj4gVG8gc3VtbWFyaXplOiB3aGF0IHlvdXIgdXNlcnMgd2FudCAtIGRvbid0IGNh
cmUuIFN0YXJ0IHByb3Blcmx5DQo+ID4+Pj4+Pj4gZGVzY3JpYmluZyBoYXJkd2FyZSBhbmQgeW91
ciBTb0MuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT0ssIGZvciBhc3QyNjAwIGkyYyBjb250cm9sbGVy
IGhhdmUgdHdvIHJlZ2lzdGVyIG1vZGUgc2V0dGluZy4NCj4gPj4+Pj4+IE9uZSwgSSBjYWxsIGl0
IGlzIG9sZCByZWdpc3RlciBzZXR0aW5nLCB0aGF0IGlzIHJpZ2h0IG5vdw0KPiA+Pj4+Pj4gaTJj
LWFzcGVlZC5jIC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLWkyYy1idXMiLCBBbmQgdGhl
cmUNCj4gPj4+Pj4+IGhhdmUgYSBnbG9iYWwgcmVnaXN0ZXIgdGhhdCBjYW4gc2V0IGkyYyBjb250
cm9sbGVyIGFzIG5ldyBtb2RlDQo+ID4+Pj4+PiByZWdpc3RlciBzZXQuIFRoYXQgSSBhbSBnb2lu
ZyB0byBkcml2ZS4gVGhhdCBJIHBvc3QgaXMgYWxsDQo+ID4+Pj4+PiByZWdpc3RlciBpbiBuZXcg
YW4gb2xkIHJlZ2lzdGVyIGxpc3QuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gRm9yIGV4YW1wbGUsDQo+
ID4+Pj4+PiBHbG9iYWwgcmVnaXN0ZXIgWzJdID0gMCA9PiBpMmMgcHJlc2VudCBhcyBvbGQgcmVn
aXN0ZXIgc2V0IEdsb2JhbA0KPiA+Pj4+Pj4gcmVnaXN0ZXIgWzJdID0gMSA9PiBpMmMgcHJlc2Vu
dCBhcyBuZXcgcmVnaXN0ZXIgc2V0DQo+ID4+Pj4+IEl0J3MgdGhlIHNhbWUgZGV2aWNlIHRob3Vn
aCwgc28gdGhlIHNhbWUgY29tcGF0aWJsZS4NCj4gPj4+Pg0KPiA+Pj4+IFNvcnJ5LCBpdCBpcyBk
aWZmZXJlbnQgZGVzaWduLCBhbmQgaXQgc2hhcmUgdGhlIHNhbWUgcmVnaXN0ZXINCj4gPj4+PiBz
cGFjZS4gU28gdGhhdCB0aGUgcmVhc29uIGFkZCBuZXcgY29tcGF0aWJsZSAiYXNwZWVkLGFzdDI2
MDAtaTJjdjIiDQo+ID4+Pj4gZm9yIHRoaXMgZHJpdmVyLiBJdCBpcyBkaWZmZXJlbnQgcmVnaXN0
ZXIgbGF5b3V0Lg0KPiA+Pj4NCj4gPj4+IFdoaWNoIGRldmljZSBpcyBkZXNjcmliZWQgYnkgdGhl
IGV4aXN0aW5nICJhc3BlZWQsYXN0MjYwMC1pMmMtYnVzIg0KPiA+Pj4gY29tcGF0aWJsZT8gQW5k
IHdoaWNoIGRldmljZSBpcyBkZXNjcmliZWQgYnkgbmV3IGNvbXBhdGlibGU/DQo+ID4+Pg0KPiA+
PiBPbiB0aGUgQVNUMjYwMCBTb0MsIHRoZXJlIGFyZSB1cCB0byAxNiBJMkMgY29udHJvbGxlciBp
bnN0YW5jZXMgKEkyQzEgfg0KPiBJMkMxNikuDQo+ID4NCj4gPiBTbyB5b3UgaGF2ZSAxNiBzYW1l
IGRldmljZXMuDQo+ID4NCj4gPj4gRWFjaCBvZiB0aGVzZSBjb250cm9sbGVycyBpcyBoYXJkd2ly
ZWQgYXQgdGhlIFNvQyBsZXZlbCB0byB1c2UgZWl0aGVyDQo+ID4+IHRoZSBsZWdhY3kgcmVnaXN0
ZXIgbGF5b3V0IG9yIHRoZSBuZXcgdjIgcmVnaXN0ZXIgbGF5b3V0LiBUaGUgbW9kZSBpcw0KPiA+
PiBzZWxlY3RlZCBieSBhIGJpdCBpbiB0aGUgZ2xvYmFsIHJlZ2lzdGVyLCB0aGVzZSByZXByZXNl
bnQgdHdvDQo+ID4+IGRpZmZlcmVudCBoYXJkd2FyZSBibG9ja3M6ICJhc3BlZWQsYXN0MjYwMC1p
MmMtYnVzIiBkZXNjcmliZXMNCj4gPj4gY29udHJvbGxlcnMgdXNpbmcgdGhlIGxlZ2FjeSByZWdp
c3RlciBsYXlvdXQuICJhc3BlZWQsYXN0MjYwMC1pMmN2MiINCj4gPj4gZGVzY3JpYmVzIGNvbnRy
b2xsZXJzIHVzaW5nIHRoZSBuZXcgcmVnaXN0ZXIgbGF5b3V0DQo+ID4NCj4gPiBXaGljaCBwYXJ0
IG9mICJzYW1lIGRldmljZSIgaXMgbm90IGNsZWFyPyBZb3UgaGF2ZSBvbmUgZGV2aWNlLCBvbmUN
Cj4gPiBjb21wYXRpYmxlLiBXaGF0ZXZlciB5b3UgZG8gd2l0aCByZWdpc3RlciBsYXlvdXQsIGlz
IGFscmVhZHkgZGVmaW5lZA0KPiA+IGJ5IHRoYXQgY29tcGF0aWJsZS4gSXQgZG9lcyBub3QgbWF0
dGVyIHRoYXQgeW91IGZvcmdvdCB0byBpbXBsZW1lbnQgaXQNCj4gPiBpbiB0aGUgTGludXgga2Vy
bmVsLg0KPiANCj4gU28sIEknbSB0cnlpbmcgdG8gcGljayB1cCAoZnJvbSBSeWFuKSBvbiB3aGV0
aGVyIHdlJ3JlIGFjdHVhbGx5IGRlYWxpbmcgd2l0aA0KPiBzZXBhcmF0ZSBkZXZpY2VzIGhlcmU7
IHRoYXQgd2FzIGFtYmlndW91cyBpbiBoaXMgcmVzcG9uc2VzLg0KDQpIZWxsbyBKZXJlbXksIEty
enlzenRvZg0KDQpTb3JyeSwgZm9yIGFtYmlndW91cy4NClRoZSBnbG9iYWwgcmVnaXN0ZXIgbGlr
ZSBhIG11eCBzZWxlY3Rpb24gZm9yIG5ldy9vbGQgcmVnaXN0ZXIgbGF5b3V0Lg0KTGlrZSBmb2xs
b3dpbmcgZXhhbXBsZS4NCg0KCQkJCQkJPT09PT09PT09PT09PT09PT09PT09PT0NCgkJCQkJCURy
aXZlciA6IGNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtaTJjLWJ1cyINCgkJCQkJCU9sZCBy
ZWdpc3RlciBsYXlvdXQgOiBpMmMwIH4gMTUNCgkJCQkJCT09PT09PT09PT09PT09PT09PT09PT09
DQoJCQkJCTA6Lw0KPT09PT09PT09PT09PT09PT09DQphc3BlZWQsZ2xvYmFsLXJlZ3MNCkdsb2Jh
bCBNVVggKG5ldy9vbGQpDQo9PT09PT09PT09PT09PT09PT0NCgkJCQkJMTpcDQoJCQkJCQk9PT09
PT09PT09PT09PT09PT09PT09PQ0KCQkJCQkJRHJpdmVyOiBjb21wYXRpYmxlID0gImFzcGVlZCxh
c3QyNjAwLWkyY3YyLWJ1cyAiDQoJCQkJCQlOZXcgcmVnaXN0ZXIgbGF5b3V0IDogaTJjMCB+IDE1
DQoJCQkJCQk9PT09PT09PT09PT09PT09PT09PT09PQ0KDQo+IA0KPiBUbyBtZSwgaXQgc2VlbXMg
bGlrZSB3ZSBkbyBoYXZlIHNlcGFyYXRlIElQIGNvcmVzLCBqdXN0IG11bHRpcGxleGVkIHRvIHRo
ZSBzYW1lDQo+IE1NSU8gc3BhY2UuIEFuZCBpZiBzbywgd2hhdCB0aGUgcHJlZmVyZW5jZSBvbiBi
aW5kaW5nIGltcGxlbWVudGF0aW9uIGlzLA0KPiBwYXJ0aWN1bGFybHkgd2l0aCBkaWZmZXJlbnQg
U29DcyBoYXZpbmcgZWl0aGVyIG9ubHkgdGhlICJvbGQiLCBvbmx5IHRoZSAibmV3Iiwgb3INCj4g
YSBzd2l0Y2hhYmxlIHNldCBvZiBib3RoLg0KPiANCj4gSGVuY2UgbXkgcXVlcnk6DQo+IA0KPiA+
IEdpdmVuIHRoZXJlIGFyZSBhY3R1YWwgYmVoYXZpb3VyYWwgZGlmZmVyZW5jZXMgYmV0d2VlbiB0
aGUgdHdvDQo+ID4gcGVyaXBoZXJhbHMgLSBiZXlvbmQganVzdCB0aGUgcmVnaXN0ZXIgc2V0IC0g
dGhhdCB3b3VsZCBzZWVtIHRvDQo+ID4gaW5kaWNhdGUgc2VwYXJhdGUgYmluZGluZyB0eXBlcyAo
KyBhIHN5c2NvbiBtdXggY29udHJvbCkgdG8gbWUsIGJ1dA0KPiA+IEknbSBrZWVuIHRvIGhlYXIg
YW55IG90aGVyIG9wdGlvbnMuDQo+ID4NCj4gPiBLcnp5c3p0b2YsIGlmIHRoYXQgaXMgdGhlIGNh
c2UsIGFueSB0aG91Z2h0cyBvbiB0aGUgcmVwcmVzZW50YXRpb24gb2YNCj4gPiBzZXBhcmF0ZSBi
aW5kaW5ncz8NCj4gDQo+IC0gZ2l2ZW4gd2UgbWF5IG5vdCBiZSBkZWFsaW5nIHdpdGggInRoZSBz
YW1lIGRldmljZSIgaW4gYWN0dWFsIGhhcmR3YXJlLCBpbg0KPiByZWZlcmVuY2UgdG8gUnlhbidz
IHByb3Bvc2VkIGNvbXBhdGlibGUgc3BsaXQgYmV0d2VlbiB0aGUgdHdvLg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gDQo+IEplcmVteQ0KPiANCj4gWzFdOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNTAyMjQwNTU5MzYuMTgwNDI3OS0yLXJ5YW5fY2hlbkBhc3BlZWR0ZWMNCj4gaC5j
b20vdC8jdQ0K

