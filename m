Return-Path: <openbmc+bounces-461-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 195CEB2799C
	for <lists+openbmc@lfdr.de>; Fri, 15 Aug 2025 09:06:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3Cp65mwDz3bkP;
	Fri, 15 Aug 2025 17:06:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755241598;
	cv=pass; b=kG8Pcl5BcVN8o5mAP8zCT3KxrQ98NUbR6Pden8cQqVEKMeqH/hV3QJ6bn5kyCa8uEL4tng8/PqbVPFHLAlG58O3b/xji0lLWz08sBZtPnZvJFprw1IV+/9Xfvcwn4nZ23XgeiM+6LI9ygRbn4JOOcPdSPT4y8DDqaNQlWlU/mPRVOh9IRp/BnYc+T9YIlMgVE199pF/0iTsEy4c8qqxWHu/8blaQ0gtubSwOE7LrzyryzHOmXsFR1ToHfpkY8GfMgvuttPwN6bwrKykaWJbH9LQOEIidvr/gLTFs0AY1VXVoocMr/KmOgXmy/vxrK2DEwa9dUpIJldeIdvHwbOw+zw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755241598; c=relaxed/relaxed;
	bh=Wcl4eNAVzJbZ77QXzSSRRpiJ+TTy/LeaGuNR2vnkSZ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gYp6dqzzJ1CT5aLTpIUdziQuGazpk1nz6cpeQ+KqdamajQPheWwm1NWWQWK8ujdAIS+lh7sFd+kMM274Ilerg/+ww2o2lqrN2RvBnWximtcsIeG3ZYOA9bwQmgnGMLR60BmU+bBE39X553NI0HGCbEMsbZwbWN3sM0FFGnhOgcGLQadaB0sF6amMyx3lvx2vBzeTZ0iHVqtLVT8S5PQQgJRRViOJbZ8NT9pWirUSkDa38EOopfD8gPqRY+IqX69/HYjLMo2b26a7kKf8BiTYWxyCs4VybMXBE5BOy7tNJQImGR+HOYz7E7JB5krhcL3QgC/sUgsCO0nStA1MXTLdiA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=G7AOIC6V; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=G7AOIC6V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3Cp539tRz2xQ0;
	Fri, 15 Aug 2025 17:06:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvlCC/uMDtSNP27Bc2zAoLguc/tTv5HzwRmCcJC2KT1SjqLuWd46wmhdCotJ2Yo6jdWQuQ2da3j/6qGPTqJK13Gbtnpo4S0ZH3eK6Q9ejvzOteVErz05hRsfrkP5JJweZnsK2GVkcN0fcM/meaXbUV9VGoWV7wNlkqgVbe5Sdm3wePJdvyqRt9oc+aeEzQO2Q1MJl8PuMSvGvM7KsDbKkSZHMKFIDkJ3s2ZQUx+5MC0HbA+IRtUiPvaGUxQJTItbSgNMF4f5BV4pEcHPh21MENgwdISWxgDZIcMrxvWsmm2xI2zk7N6Xu249f87hj9utMYw/GX2LhkTYQetQczv6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wcl4eNAVzJbZ77QXzSSRRpiJ+TTy/LeaGuNR2vnkSZ4=;
 b=ecK0VTNB6QtH1IBgDEyD+NqZw/NWFK1m5F5lF0PN7kDQUCsxaidxQi8rJjbBsj6MUN2ikSlCh+fVfB5/h9NGDvgxbcnZHgRVTwMexwYIrWqqdkcY/GicM3lirRsD8hjH5ZTtmKtdSRMI2yQ/mqVqoMPWrIKml4+4qcrDGIg8Cznsp349JxOWTeauj04rkpcpV6OjfucagyqrH1WPao540Ub8sZ4Za5lesYbiDfkocyCaoB7XDu0KYcSx9Fm9z1EhxCbekLsjoiI0EopnBbwsG169SnAronbxRmqv7sn2q7+DusxbvgO6lkgRqfVnlb25dRpHhru1uHOF0cTQhSTxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcl4eNAVzJbZ77QXzSSRRpiJ+TTy/LeaGuNR2vnkSZ4=;
 b=G7AOIC6Vpt+svdQNxclE0jxT990U62n1EE8uRLaBYCkUQF5AiwHMMGPVMqG0qrjJqi1OEQuScZN14CVQeDpneXerLHJUpixbG9xIsiYC4TyJAzt5URp5Hqvoda+k/CsueQRWz5k4DzpAbcIPU5ISVtkVhvsJuPrHz67LRNEGvcjHqdYzCpG1hbokhDWg8X34/adr6QFRqXqrPUVA5A5xP1sE/0Hfs2rD4afAYdj7R98cjojSdFoJ5hv/hbZvtWQvlUuu7756B9R41P/iqN3I3QMOIw8NjqfraTKw1C72lHcWngg2YBqUBlSgy6O9DWQExzR7M0kf8b8TLdea7Si+kQ==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SEYPR06MB5467.apcprd06.prod.outlook.com (2603:1096:101:b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 07:06:11 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 07:06:11 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "naresh.solanki@9elements.com"
	<naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v17 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Thread-Topic: [PATCH v17 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Thread-Index: AQHcDPdPoOp1+xBxEkuXgv6kGrdxSLRivEAAgACDtCA=
Date: Fri, 15 Aug 2025 07:06:11 +0000
Message-ID:
 <OS8PR06MB75410910BC7AD0BAF9866E3FF234A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250814084156.1650432-1-ryan_chen@aspeedtech.com>
 <20250814084156.1650432-2-ryan_chen@aspeedtech.com>
 <20250814223052.GA4004307-robh@kernel.org>
In-Reply-To: <20250814223052.GA4004307-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SEYPR06MB5467:EE_
x-ms-office365-filtering-correlation-id: d143ba72-fb84-4a32-2b76-08dddbca3762
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?drLciwgpiIdtxlm60gGVRPuAzX+VvvlyueaJRNaEjGBV/K1et0qNgXs/nx6W?=
 =?us-ascii?Q?QescwsV6kmYiFG1Uz17tKQU5rjr2MvjzqAi3hvpUV1NR9nRFEw9oJtA1jeRB?=
 =?us-ascii?Q?D0FUVWBK7ORCvfQL4nGr0aNhAhz5CRktOfuaod50LwmI2qgyMxyDGCfsYCup?=
 =?us-ascii?Q?Xu/K9+ZqJ7xmJ3ZTbV/xyHW/a3ehZPil6oh3gYtVQrUBLB93zxTldO/tid2L?=
 =?us-ascii?Q?1pi+3MIbsU8iDJq3e8BBfD5h7wlqRqafQR5u+mGs5rjpHmewVoIigRDeVrMe?=
 =?us-ascii?Q?DIPpjACbGGv3AJaCzIPmBjGSv4t+KWgLvf4Ca+wCL3Xxab9tX5zo0MVDCyNT?=
 =?us-ascii?Q?/e2mD4fbbAO8GafPuImbOi3L9YsQq+f6/luq9P/ByM+TGu+VYG3YR0npX53R?=
 =?us-ascii?Q?Ax4cEzNMW+z9BUt4QciSDeOJG4YpCzyc7dPV/s8KPgtATe1DskSbC3j6mbEa?=
 =?us-ascii?Q?VDLnu0Brdi80GkXCy17MToTIQnBAGeP4bqKpBZI0CQXGoqKcXkIr9OBBuEqE?=
 =?us-ascii?Q?GPbcKM8Z2EvEXXGSzQBl4aqXNiL0JO6gMXDNlRpMvtmX61pp/X2uvQKfNJ7g?=
 =?us-ascii?Q?K2ctiZ0ChHSS0esv9X3fhIpRl/5JkHacsQLVT3w4PBbBqvbk0RVDWn66rqzH?=
 =?us-ascii?Q?y8dEoGKaAoBstuMVrNbrRhwo0IjfD5Gjn1i2xAem1EQMXqeJzPPu4gzaa0dC?=
 =?us-ascii?Q?pWe9Am3VfFrRxpVLEcOn1FGWzQQWrpbAUqOBYxpgnE5tQwVuXA8E0QM2dlqF?=
 =?us-ascii?Q?ga63h4AXm2wACI+PsDrw8XKwNnjjURiA7ZrjizwRPybc1cFnqpDexBuerqhs?=
 =?us-ascii?Q?gjSvovYmr8MDGFS/3q77tEV56sp/223vZ2GKznDwB9egNpZMgnUDB5ybsVh2?=
 =?us-ascii?Q?qrO5wTfuEJ2POdTmIKvzcXm4KPbYgxa9486j4NVoIJw5oU7Z0eRWHE2+jMBz?=
 =?us-ascii?Q?AnErZdKbyPy/SVgspssTFmxnFjlurz/9PtuOBgmntMzFl001vX3uskTzpOSD?=
 =?us-ascii?Q?srJxx0vu5BGLQmArRaVUP5qkqvrDmt5+D7BpwJZJYl9S6DtdhL2/bWKobuQt?=
 =?us-ascii?Q?Yoafr2xWk6IHpY47JB+0QlhNW8eD1TR3eCY0bYIVCULWVhGdppxv1jlmeC0Q?=
 =?us-ascii?Q?i2j/exODcPlHwisSC2CQuSPPePwBu2YGmSoOHD4/O6RzMPB7q6GGZQa6446E?=
 =?us-ascii?Q?sMFxT4JY28dGGN0M7imBIEEPQ2WWa1L11NKvM8R6zAj2rYKZ0x7Oqb2zJBsi?=
 =?us-ascii?Q?rrqlevNxvvqGit6IlYu9R+bKXRBsoFh3RRxGbJDhwgeWiAInsXi3/YaVehMX?=
 =?us-ascii?Q?0Zy3sUCerbF3kBarnt3w2CCjJRT10gK9nrhsHR7BfG2IYO374AlPy48Jxnde?=
 =?us-ascii?Q?2K5Wf3PFJ3indlAs3GxPEzqlPFT+ah1iFR6HrRHPlVUTJuHOJujcPIEwP+5G?=
 =?us-ascii?Q?qDT7PXKn3PE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4nZfSq3GjcDk8SGRqjYDl3ZTUjjc1IBYA380LddpGjUsT5ee5ZbLitFiTLGa?=
 =?us-ascii?Q?m6m53oS2Il68327CLsuolLvVCprr1/g/THOxh+OsTrab6QQsa2VX8i+LpHlQ?=
 =?us-ascii?Q?xgWY+zijmyOpP2bKrIFLvd/xiS8U0vDooHsYlhquMA2S+1uGfSBmbDfGVeFu?=
 =?us-ascii?Q?AWtuCwp2oMUBcvjqYGI4E/iJMsA0yHUc8oHigv94mXy1/xZG/6iR2mWaCEyr?=
 =?us-ascii?Q?iLidrw5rP+lj0jQszwXHqQC8oK0w7ZC3AGu2vCP6d1JoJS7Y4ACctEqiBO1p?=
 =?us-ascii?Q?6hhiBbh16J2Ybq7pD73qCNE6tI5PfSlAE0YfXmTWpBKuO/j4us9s8WqsVpdw?=
 =?us-ascii?Q?p4S4fMYBupUGMZHaLATwh1Ql7ca9h4NDajRzo1jyhPyN2NKeO2EjFMwZGPOT?=
 =?us-ascii?Q?I78PA1dbLT2uT4ot2DOyVZdU3Ca8f0e+pNrhYH4V+w2Sdk0zFe/JEyqv/rHf?=
 =?us-ascii?Q?kclW1BxXUdPW7bXjHjYy5iC3pe8nfy3ou8U2rUeal6nwE1aICEC8g+01PG/w?=
 =?us-ascii?Q?tmlB80ZejF6m1TAEUQetuzRth+cpoFqcdSHFVhfG6SpRg3/kecF5cwSLuYXL?=
 =?us-ascii?Q?ZB6VJkhWQRKZsLVojExvCTuTREWaOmFqd04TI/GWv0R415LERf1uXHSSqpjH?=
 =?us-ascii?Q?kMDPebbXl+3GEtmW9zu+jkJbhlC1uvLYHzUaAjvwOjRX9i5pKfT+BqENiH3V?=
 =?us-ascii?Q?qqqZ6b+ESYVYdfH3HBuEAOfSvK4GSRBARabwtb5MrCeWxQ2a9lxbLZG3UDJ0?=
 =?us-ascii?Q?4EawshI690yYDgCLefS5QnUG4mt5QQJZdZXWO6WoVeX+zVH8Qho6isd+8Rmx?=
 =?us-ascii?Q?5IpowT970BP7oNTAIeAjhxPINDPCsmquYKjnR/L9XPlRheZFv0WKHm9PQnye?=
 =?us-ascii?Q?3BmdilO+Q1zExwcKcHooS0ox60g8C3v7bWCip5p4nI6CQJaE7kP1JdblpBKx?=
 =?us-ascii?Q?4XEEXS7Mg8OydNDCsLIuzIKD8U6SX6GHDxDhbwhNqBLAHRwvVOoPzNZQBarQ?=
 =?us-ascii?Q?AKbd0u/dXSNTFmCXImP2V2wJ9YLdAmJK2oUPID5tgmB7Mut4WFjV6odnZnCr?=
 =?us-ascii?Q?h1Uf30DHYYk5WQ56f/hXI5gWKcjYY2/JBxmiUaSzhoUQbNb5VjMAapb+ElRn?=
 =?us-ascii?Q?Zhia55IZHqDLs9Sk6eYPgSu4ysaUBlTwcViKr1xRu5aIwhYTJkeqaTSvZt8S?=
 =?us-ascii?Q?weAJgYpCmsKRTXez1/i5SFpBTlIe+9Mucx37zgAvJYTaPmyNOzFzAe3oMGEb?=
 =?us-ascii?Q?9D1eEo2Wgr38OGaP8VK4gfBsIQRw0UIjIOJKUwOvCloaCxexHEExuOsC0JNW?=
 =?us-ascii?Q?KzCCKyb111nZsZjgQAIs1EJGJrNnZMPlHH7Q+8jB2AP5WTj/cKHnEaXfLS/9?=
 =?us-ascii?Q?BfHkkyHtTjGA/t2DovzVxIOJfuRD6B7y4nbZHXrJRCwYgbsjZ1eqh/7sdlB/?=
 =?us-ascii?Q?HkcIYJuXmE7503unl+RosJgToQ/cYr45+9trLvU6ZaMPtaKkavh9xddORyNE?=
 =?us-ascii?Q?7Bvp6gIQKGyO2ZZclLKO1aPtviM9D3zKvK/WO3/9FRDvympbBafOeBxt8Rr8?=
 =?us-ascii?Q?JhNFgNJ4q2RWhGJmc4zIEWNM6dk4Rk5JMprcfBrn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d143ba72-fb84-4a32-2b76-08dddbca3762
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 07:06:11.4758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t649ffaGn/FPPk0ao66IyBJHXX7MhkynKc7Q4m7NScUMhxMys2xZoILRtRcsBMsFFySQHun1T9f1azqcdP9M3P27dsryWHsV3OZBK46QWk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5467
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Subject: Re: [PATCH v17 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
> transfer-mode and global-regs properties and update example
>=20
> On Thu, Aug 14, 2025 at 04:41:54PM +0800, Ryan Chen wrote:
> > - Add property "aspeed,global-regs" to get phandle set global
> > register, for register mode selection and clock divider control.
> > - Add an optional property "aspeed,transfer-mode" to allow device tree
> > to specify the desired transfer method used by each I2C controller
> > instance.
> > - Update example to demonstrate usage of 'aspeed,global-regs' and
> > 'aspeed,transfer-mode' for AST2600 I2C controller.
>=20
> All of this is evident reading the patch. Explain here why you need this =
change.

The AST2600 I2C controller supports three transfer modes: byte, buffer, and=
 DMA.
To allow board designers and firmware to explicitly select the preferred tr=
ansfer mode
for each controller instance, this patch introduces the aspeed,transfer-mod=
e property
in the device tree binding.
On AST2600, each I2C controller can operate in either the legacy or the new
register mode and clock divider control, selectable by a global register se=
tting.=20

>=20
> >
> > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 39 +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > index 5b9bd2feda3b..2a9f7d1d2ea1 100644
> > --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > @@ -44,6 +44,34 @@ properties:
> >      description: frequency of the bus clock in Hz defaults to 100 kHz =
when
> not
> >        specified
> >
> > +  aspeed,transfer-mode:
> > +    description: |
> > +      ASPEED ast2600 platform equipped with 16 I2C controllers each i2=
c
> controller
> > +      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buffer m=
ode),
> and
> > +      share a DMA engine.
> > +      Select I2C transfer mode for this controller. Supported values a=
re:
> > +        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
> > +        - "buffer": Use buffer (32-byte buffer) for i2c transmit. (def=
ault)
> > +                    Better performance then byte mode.
>=20
> If no 'aspeed,transfer-mode' property defaults to buffer mode, you never =
need
> 'aspeed,transfer-mode =3D "buffer"'.
>=20
> When would you ever use "byte" mode? Sometimes you want worse
> performance? That makes no sense.
>=20
> I feel like we already discussed this, but I'm not going to dig thru 17 v=
ersions to
> see.

Yes, my original through is dma and buffer property selection at v15, v16.
The reason for keeping "byte" mode is to support use cases reported by=20
other users (for example, as raised by Yikai in the above thread),
where certain I2C devices or board configurations only function
correctly in byte mode. This is not a common case, but providing
this flexibility avoids the need for downstream patches or hacks.

https://patchwork.ozlabs.org/project/linux-aspeed/patch/20241007035235.2254=
138-3-ryan_chen@aspeedtech.com/#3412650
Yikai yikai.tsai.wiwynn@gmail.com

>=20
> > +        - "dma": Each controller DMA mode is shared DMA engine. The
> AST2600 SoC
> > +                 provides a single DMA engine shared for 16 I2C
> controllers,
> > +                 so only a limited number of controllers can use DMA
> simultaneously.
> > +                 Therefore, the DTS must explicitly assign which
> controllers are
> > +                 configured to use DMA.
> > +      Only one mode can be selected per controller.
>=20
> The only thing that really makes sense is dma, and you need 1 boolean
> property for that. IOW, what you had on v10 which we gave reviewed-by 2+
> years ago.
>=20
> Do you have any actual test results or usecase that show DMA is useful he=
re?
> Typical I2C xfers are not streaming large amounts of data to justify the =
setup
> costs of DMA. It wouldn't surprise me if DMA was actually slower.
>=20
For AST2600 used in server platforms, MCTP over I2C often requires transfer=
ring large
data blocks (e.g., 512 bytes per message). In buffer mode, this results in =
32 interrupts
per transaction, while DMA mode reduces this to a single interrupt, signifi=
cantly
lowering CPU load. We have observed measurable CPU utilization improvements
when using DMA mode for such use cases.

> > +      On AST2600, each controller supports all three modes.
> > +      If not specified, buffer mode is used by default.
> > +    enum:
> > +      - byte
> > +      - buffer
> > +      - dma
> > +
> > +  aspeed,global-regs:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
>=20
> Don't need '|'. Read the documentation about when it is needed or not
> needed.

Thanks, will remove it.

>=20
> > +      The phandle of i2c global register node, For control the i2c reg=
ister
> > +      define selection, clock divider mode selection and clock divider
> control.
> > +
> >  required:
> >    - reg
> >    - compatible
> > @@ -66,3 +94,14 @@ examples:
> >        interrupts =3D <0>;
> >        interrupt-parent =3D <&i2c_ic>;
> >      };
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    i2c1: i2c@80 {
> > +      compatible =3D "aspeed,ast2600-i2c-bus";
> > +      reg =3D <0x80 0x80>, <0xc00 0x20>;
> > +      aspeed,global-regs =3D <&i2c_global>;
> > +      clocks =3D <&syscon ASPEED_CLK_APB>;
> > +      resets =3D <&syscon ASPEED_RESET_I2C>;
> > +      interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> > +      aspeed,transfer-mode =3D "buffer";
> > +    };
> > --
> > 2.34.1
> >

