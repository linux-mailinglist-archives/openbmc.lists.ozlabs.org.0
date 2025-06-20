Return-Path: <openbmc+bounces-274-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA10AAE2702
	for <lists+openbmc@lfdr.de>; Sat, 21 Jun 2025 04:08:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPHl42T0Sz3blF;
	Sat, 21 Jun 2025 12:06:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750407573;
	cv=pass; b=YL/ZVkxa6tt5saK7Q4Nzboz/YvbkDrZ2VSq1WvA7dAZG/fNGo7wP6dvIB9rbRM2+h8/gy/snq8hoqwX5q0MFmAoJXG21hwPNxlPS+F6CyK+xwt5rUSOlck47FDklaDTP0Lm9ZR0aH69izaMH2niW4S/y8gXxbP4B/uGh/qeiqhKUSfasaVEETnKT1ZWZ/JfG0YJKSoytrDS8QiDugSxnvSUE+n26M96UlIlYw4OENyHzL2pu/CXrZWEJ03ZvnjeJiilFmGflyehkLKnvq1m+sMNwLiJfh7Hno266xMMN2/IxK1Xm6qEDJAV7dPk7GJiKY4jD8XsaoEmcWvATvgYydA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750407573; c=relaxed/relaxed;
	bh=5jrpSnO37U0Vci6hMKnwpiVV3Bn8Q+QXnrKEHH7l28s=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZjZk8IdrzY0y8GTNxNQLu4382CUwNy7RxTjnNhgKyij5znSoLAunnp1n0h7uBddPlC+7SsVDLGZzoAEHJtxugu2J+ygj96A/E6MTnriYrm6E4ChX+Vu5SFxpNlpFhRkNylNiTBeqqsUc0F8JFre4b/b8OxnAXTjU2NUYK4R69icsbqqoil9m/gVSw7S3gYaWLsfsu1JWnWWlvZL/zdNeaaAmdRyqjHe3ThuNszCaqf5wLhbfyhepZCF6RSMnm9Aye+5Ck/UEqXOQ9Q2gtoX4pFjyFf3S3c3dZ0EUcs5Wh+D8IDHtd3ZCZ5d6uwHXJdljd8aa+EpEqiyUnnEr4pW26w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=IV2WlFyb; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=IV2WlFyb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNr3w2FPtz30MY;
	Fri, 20 Jun 2025 18:19:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGG1hr+uLa9i9gvPXt4l0HmPVc1x856vHhcWNwluU4JbnK5tIX6JgfTG5DTQ/2R3x34MTKmd0H171/pfUSC560eq6JQXPlPNI4Ca82b2trDOZtNumDXDlBymKy4bKvlepxgaZqUuYruMQC75UY1TnMGnVTiq6GRcd1WEnX1bRmhWZYHWJksKn1T+fkF82gSanI6DYn/cDgxFOBkUFOfydIYc22Vo/Ja/KBihJ2TelPfI+EPqv0Km2BxuYB2SSHLW9AKtcM1VqRAlYrvTv9BfSMChON3vHdrtszcZ2g/FwNhYZUYEVxjA7akbIFgLcxAPX+ktPYxmLIJ1JCVGtPbF/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jrpSnO37U0Vci6hMKnwpiVV3Bn8Q+QXnrKEHH7l28s=;
 b=Tn5HO045XzsMLUuR61bye3QybhGt+tt2UT8gBQypdif+atvtC45BoGFlPWqJuEBx3vCT9t57T2o762HmGI8/AGOtORuWJmJROJxwPvatSY4BW92gx7LoWEX94Gt6x2C9IKTQX2PxAX8aSPaMthcmbM4YCiiQNk+V3JCMTIU6t/H25+lyLXCAcekfNRxzYTQdBPf4YBN5LSz8bRLZdlq7u3GF7S2jvQfnHgb7lMWaLKm59XnfeWtv/WzFjqSa+8s1sV7rpS1x0rOIWffNpzPzXUGOjaktja5ayeJr0Fd7UIxOajshCkc/WOKoCQ3RZKdCYyyzRhvNMbUqozajH0jdRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jrpSnO37U0Vci6hMKnwpiVV3Bn8Q+QXnrKEHH7l28s=;
 b=IV2WlFyb5ycxPBFOD1D3dXdAP5V9TN0p/rxPh5LmxLk26DD9BpSs+Qo/dukyIPSnX1YYmHHoLYNSATBYtq8368vbsojDo7nBYdrfJTNi1xgRNvbSkOM4hMlQ6ZpzYnZ2ZZxIoly074s35hFQJV0uGx1vd4jwArNC/63DwdynRfYNYAUQoohHit0NmpBNFLv049tirdyODflX56Z9zaZKBgEYdqLmDUrq4zCrfFwXIZDEmNFBR28AeQbHY2zqkS2hM4v22hzXACe9lpUv/wXha61X0H7edafDJjTv2M/TPj8Xc2rG3Dz5hshZoTQsRJ2c5QmGon0jGbMLeGOF+rQIRA==
Received: from SEYPR06MB7072.apcprd06.prod.outlook.com (2603:1096:101:1db::9)
 by SE2PPFDAB6F0437.apcprd06.prod.outlook.com (2603:1096:108:1::7ef) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 20 Jun
 2025 08:18:59 +0000
Received: from SEYPR06MB7072.apcprd06.prod.outlook.com
 ([fe80::427f:4d26:e479:7659]) by SEYPR06MB7072.apcprd06.prod.outlook.com
 ([fe80::427f:4d26:e479:7659%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 08:18:59 +0000
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
Subject: RE: [PATCH 5/8] mmc: sdhci-of-aspeed: Fix null pointer
Thread-Topic: [PATCH 5/8] mmc: sdhci-of-aspeed: Fix null pointer
Thread-Index: AQHb3/uvwZoV4rVTtkev39wbhayeyrQLoISA
Date: Fri, 20 Jun 2025 08:18:58 +0000
Message-ID:
 <SEYPR06MB7072DB0E72EBCE12FE6A78CE957CA@SEYPR06MB7072.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-6-cool_lee@aspeedtech.com>
 <4e6fd85cc8ed6c4261844842bc2e5e54e5db04e6.camel@codeconstruct.com.au>
In-Reply-To:
 <4e6fd85cc8ed6c4261844842bc2e5e54e5db04e6.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB7072:EE_|SE2PPFDAB6F0437:EE_
x-ms-office365-filtering-correlation-id: fc71afaf-494e-4ae6-f081-08ddafd31b7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UjXIzEwgkzKAOYzex6/juMqemvxglE/T40+sgXQ3aOzu/pSs74sRblPd8B?=
 =?iso-8859-1?Q?rZ4nLbs8EPiQBm+/fyJDZcJxFDrFnO2ZzUuq4UhoeCich1nDUNT2molRi6?=
 =?iso-8859-1?Q?3ufZkUG760v4M2Z6peYbBOvdqxGR+pZkv6wy5+LG+HEEIM0yNMu2dfU1dW?=
 =?iso-8859-1?Q?DtxfgwJ/U350vRvsHCoYiTzIP8HElEN+11ju4t/1SfUF4oBu76iKzR2LV7?=
 =?iso-8859-1?Q?kmmsW5LFDdwTbwZhvcRDMzN62Gy3fO7sj/Aaw1g8Bwgg+cOruHTkzQtECc?=
 =?iso-8859-1?Q?jiI6Arxchg1oluaY5v47Wdfm2Nht0paHkz4UhnaC7wsz0fyvWLgbWtIXND?=
 =?iso-8859-1?Q?T+FOFPumX8Nr/cNScremCoGtije1Gd/EzPiIe0qst+JvU8gRxQIiPPEwLH?=
 =?iso-8859-1?Q?VT6X6ePomzS2zCHE5aXtHWM/nag5xEYXSod08UpBiXAXk93g57s0yTaNF1?=
 =?iso-8859-1?Q?P4FdE/ic/SkpqfUx56r+cgm8chL9HtJT9WSkqF/EW9XJnYn8zA3L2U3tQa?=
 =?iso-8859-1?Q?Ndo1W5kPzJ70EVNJFJeLWWuCXfMrNioZQzVG/aVr6hOM9BgF3cjos7tKkd?=
 =?iso-8859-1?Q?8HhbO4RW2Zl5uquXY9aN+A4Q/cXFB+9qEtYg6q1yOqsM1ZjVSSGqWbwTan?=
 =?iso-8859-1?Q?ygHlX1CHcSGgqT1e9IQYNUzJbmTI6HAfGajy/laz3tgnkGv+t0mjHLizym?=
 =?iso-8859-1?Q?2+GU5fc4CtV12hpakT7a3LQQd/nQRhagmzdOR/HeV3ZWhbv4hFq9xz6K2B?=
 =?iso-8859-1?Q?mv5x9n79h6mtoc2UgTBH+Ylb2WKnfckQRxCgCSo/vFdg0qx3PXDuUGmGiJ?=
 =?iso-8859-1?Q?bBRm3UYGDSGHKu9X+VKRYnrgCZ1vvaKUboXeEmR0bEa/peZ47c7WdRaRSy?=
 =?iso-8859-1?Q?IYUkjo31YPi4I6jwYMV2aqN/6t9bAfBtk1HL4kg0dW21vJ8g6ZoXgxCj+3?=
 =?iso-8859-1?Q?LQ/gBzGKaejMCVjhtVCEJCRmbmaDzBvy68BqicUxUDlFRtqu93EJ//S9vD?=
 =?iso-8859-1?Q?2P2SiQMsEdyJSQ+/lV1I+mr8jsCqsabPJeKYh1rb2oPesZR/03I/Q0mDlu?=
 =?iso-8859-1?Q?5YfKV27xpgEZQqWJF1GDz/mmR2LK8Upz8UQJ4XSKD8wwkfI6+qLUhRaTmj?=
 =?iso-8859-1?Q?n/qMf88ppr8eIynyaYcQjK5r7Qf2o6xDckeCDu2Hm9kgc0DP7vRISYj6uo?=
 =?iso-8859-1?Q?UYVgPEya7o8ue+2oxOfXJPkSA3AywMQ6Gf7dUi7gX0bjlaSNa25/Q2u2Tx?=
 =?iso-8859-1?Q?WXT2xx37IKbDjb81pQVsD2vjUoivRH20gM57bJoQOBAQIepJDYEHsGZfqp?=
 =?iso-8859-1?Q?eUpuVTcR08QBHzcYntBS3NQlkFzU18dik8BSXtU1eCaKhVWB6r7DHbl7wQ?=
 =?iso-8859-1?Q?JwRfpGUomCVG5bLJdPdzI6NGPyo+R04P5RC6OBMwajNQRFXxlVBeb7ivBv?=
 =?iso-8859-1?Q?MPxz8JVD7sPwuX6XSslBcucr8H06JnAwO67dDAjF6l8Jv7MwEm7Kwk0H5Q?=
 =?iso-8859-1?Q?FFsAFhRfDLsZ2iMgJFuW5vTu6eHuhkO1396BfYnPTHVI61L1FgS7CNQVwr?=
 =?iso-8859-1?Q?FGLvwQJo1xf/YpYc+RXqg6/7Hrol?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB7072.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?L1olSy3f/TibE6CeVJxzj5X/fWYDJDzpjAKt5Aq3HTXN107siZdtJFZLw+?=
 =?iso-8859-1?Q?vXtxs/elsFkVP31CMguvTL2CmwwZ4NbHncmAfFqjskZNXIwoBqJUwTr+yI?=
 =?iso-8859-1?Q?/F5vjJ7ituqUc/XJh/V7Py6FQz4Z1iAgOd/t5W8V3dcAeDqAXpux+Ff2FN?=
 =?iso-8859-1?Q?uZZhd3O2Ax0hCzkoBwoeFigCAmXMDe2WqMrRojZg8Q3PcUfZ+WMzxSWgd4?=
 =?iso-8859-1?Q?jNNZGHOT+1+yjxQpC9JDPyPefBj3aiz/xfzNqpfGxQa10Jz1ro26pMwbMZ?=
 =?iso-8859-1?Q?I0kYmoYZc83CSY/qpkr4fiPOrXUpegRCEXxtdSb1wmLL8kMvk4hGvO9+q9?=
 =?iso-8859-1?Q?vi32fSZPsNxF7oXT1h06vuKNYeIboNYi6igcvZbyyXN4EmV9bmEu0PtbCZ?=
 =?iso-8859-1?Q?bCq1F5PJfWZpziZmkSD0CnwM2vTK4AM42/GcmSJH5efuEy/cdWApaqoNjo?=
 =?iso-8859-1?Q?AnXvE7nCWSh3cmMAt1Sp53V0Cpz4hWvCjuOV/q01/ooJ7twD6Q/sX8ufs9?=
 =?iso-8859-1?Q?H9Wz8liNnRbiVkVATja2yRAFl/7Iyq4GnmOpul45jST1AnM7GCu+ohrcEF?=
 =?iso-8859-1?Q?ObBsUlGhZ/YnSqN1QBBPylhhhqeChX85i865Ww58TdZd6qCSXo3GF/Tk6j?=
 =?iso-8859-1?Q?NX3icuIdt+cY6xzGmTjSzShHW9+w1LvMythwzuJa01IMHnjDhzYU49jzVT?=
 =?iso-8859-1?Q?bNwhB91pB7nHldvq7Iv3zpwVLDqayXNYWmzZQ8HwYMBi/X26OWsCugy0vk?=
 =?iso-8859-1?Q?GetbOaNneYXduM0iniZB++ZSPvwmFuVdCtnP+upmURP7T37f97epF9WMgK?=
 =?iso-8859-1?Q?N3VTRH71Fbes8V7b0FzPaemjaZl2cQEppHa+yV2xtX1WTKNk074J95Zypx?=
 =?iso-8859-1?Q?ozQQoUyFQd5RqfSkP0uxgw61w8rMlxDTE4Tlqgv6bVSitj3cH0pyVxQ/Ac?=
 =?iso-8859-1?Q?bdUwshh+c7Mgz2f39W+cJfDgndfGW3umdBRQGu2kjhfMKgZbxcno2URQLL?=
 =?iso-8859-1?Q?NvybA7QfpeI2fH8GphQi4AjVh8k456qTIyHF/iHAgUOlUbpVV2RTMUgWax?=
 =?iso-8859-1?Q?GKRSFBw3qT/o0lUMRy5Xcop+iUxg2vZDZPnJL+Xb8IsQoIwhpyjJh6KGWI?=
 =?iso-8859-1?Q?1p5fbyRDUVdtEVn4bTGoCSfk61inIaD9LItiPMHeCQwPmFCagRtruqZOZL?=
 =?iso-8859-1?Q?Agl4uaguNu+HE1ZM6aAcYr8PZ9wUHK1pL4VC0DHGsWh9Dlvl7ZJ8Sa5DoS?=
 =?iso-8859-1?Q?retqK8nho8FC5FELwXq8T3VwoK42uM89x1PyAokTeUlKu68uZ1EKDtHEy4?=
 =?iso-8859-1?Q?Zd+sG8wISFR2OcWkIng8VCr9vDjRgYyFFdH8y2djEjFrRwFxipQzmjB1UH?=
 =?iso-8859-1?Q?R6E1/qW09wCRkYc3Kt0Jdz8uEhSyAURzAw2kwdrHnEOqMHAbDzl4Arzbzp?=
 =?iso-8859-1?Q?qgwtiKweT3xJlQ7PTiNrAH6SOmnkd6C1Prf+UDGslhTMa0bCvBrmMo/PBI?=
 =?iso-8859-1?Q?g2hXiOAJjav3A92ltjkzb50HPkUpbA+3M/BjMZvrdeNTpdOcA/QmrxFkJM?=
 =?iso-8859-1?Q?VxX3u9lXq8XUxKKnByN3eyYpaKMlsmF7g7VjoVgEbrXoYlkzkDbAt4f+CP?=
 =?iso-8859-1?Q?Ke90DOy7ZfFeMroaBtFBhHf9MqnbVEHOY/?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB7072.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc71afaf-494e-4ae6-f081-08ddafd31b7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 08:18:59.0187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LexbINjc6H05LCTyDVB7Nhec5gZKzJcssbdFDuHYP1+UoKLf0jrXtTv2hocZemceszpUeyvhTuuzY6kW4Tfp7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPFDAB6F0437
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> > Platform data might be null.
>=20
> Currently it can't be:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers
> /mmc/host/sdhci-of-aspeed.c?h=3Dv6.16-rc2#n375
>=20
> Are there future circumstances where it may be NULL?
>=20
> I'm all for reducing the reasoning from global to local, but I think some
> discussion in the commit message would be good.
Ok, you're right. I'll remove this.
I'm just considering when adding a new platform AST2700 which doesn't have =
a data, but missed there is a pre-check here.

>=20
> >
> > Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
> > ---
> > =A0drivers/mmc/host/sdhci-of-aspeed.c | 7 +++++--
> > =A01 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c
> > b/drivers/mmc/host/sdhci-of-aspeed.c
> > index 2bdd93a3f91f..22dde915e51b 100644
> > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > @@ -241,7 +241,7 @@ static void aspeed_sdhci_set_clock(struct
> > sdhci_host *host, unsigned int clock)
> > =A0=A0=A0=A0=A0=A0=A0=A0struct sdhci_pltfm_host *pltfm_host;
> > =A0=A0=A0=A0=A0=A0=A0=A0unsigned long parent, bus;
> > =A0=A0=A0=A0=A0=A0=A0=A0struct aspeed_sdhci *sdhci;
> > -=A0=A0=A0=A0=A0=A0=A0int div;
> > +=A0=A0=A0=A0=A0=A0=A0int div =3D 1;
> > =A0=A0=A0=A0=A0=A0=A0=A0u16 clk;
> >
> > =A0=A0=A0=A0=A0=A0=A0=A0pltfm_host =3D sdhci_priv(host); @@ -257,6 +257=
,9 @@ static
> void
> > aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
> > =A0=A0=A0=A0=A0=A0=A0=A0if (WARN_ON(clock > host->max_clk))
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0clock =3D host->max_clk=
;
> >
> > +=A0=A0=A0=A0=A0=A0=A0if (sdhci->pdata)
>=20
> Given this shouldn't be the case, perhaps precede it with a
> WARN_ONCE(!sdhci->pdata)?
Agreed.

>=20
> Andrew
>=20
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0div =3D sdhci->pdata->clk=
_div_start;
> > +
> > =A0=A0=A0=A0=A0=A0=A0=A0/*
> > =A0=A0=A0=A0=A0=A0=A0=A0 * Regarding the AST2600:
> > =A0=A0=A0=A0=A0=A0=A0=A0 *
> > @@ -273,7 +276,7 @@ static void aspeed_sdhci_set_clock(struct
> > sdhci_host *host, unsigned int clock)
> > =A0=A0=A0=A0=A0=A0=A0=A0 * supporting the value 0 in (EMMC12C[7:6], EMM=
C12C[15:8]),
> > and capture
> > =A0=A0=A0=A0=A0=A0=A0=A0 * the 0-value capability in clk_div_start.
> > =A0=A0=A0=A0=A0=A0=A0=A0 */
> > -=A0=A0=A0=A0=A0=A0=A0for (div =3D sdhci->pdata->clk_div_start; div < 2=
56; div *=3D 2) {
> > +=A0=A0=A0=A0=A0=A0=A0for (; div < 256; div *=3D 2) {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0bus =3D parent / div;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (bus <=3D clock)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0break;


