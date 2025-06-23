Return-Path: <openbmc+bounces-281-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1B5AE58E8
	for <lists+openbmc@lfdr.de>; Tue, 24 Jun 2025 03:01:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bR68W3sCvz2yhX;
	Tue, 24 Jun 2025 11:01:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750657306;
	cv=pass; b=GvujNmCx8ReZ5byt26IXutQZTCr95XF04srP8bSequbRtvyMjT6QhL5O08HA7tsacNleGSUuAuFRAXcRiRozSBTEzLya+GM86LSMs6lK3qnMIVkDsyWRcHW0PNgyT0G3+MYxtaYi+fzAoubRlSBlLi0rLPBBGeWvnyvC9cvDXDC0iDk07c20OyElF9GG0CC33IfxAspcbQa6DcRqkCnL0QjPqCXB3O/F/ft6HijCARE4m+GTAzHbsUhuYKiCzIY76Gosv6LrzJo6cUP4+B1J3nPwoYFDfsAT17ze7gX9UxfkjLwdxh2+CFOBZE3+plnVyzut7E/YXwhM7IJ7H3uJxg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750657306; c=relaxed/relaxed;
	bh=5HedHH9h42IiBcKalGfW+9YAocfvxB+i4VHm3KNqhvg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iDvWYQ28aOksd1ZCF7OgVrcKVnZODR6rIu9z3WDDovIUM/j8XVC+UKvNeWpDeS5Ykjh8K70WFi+ZBCTEu4X8eJUJkIuW9J891YjnJhYEByu7mNWbEm8+g0o+bEEqTapNNPVbP+mnsSpOhvVKTajMl9V+47vkH4VacIKm2pdKX5Vszj8sx6w0zC8GtOo9uMCrDaN9KHRQw2fa5lXeXpCZj7goDhf7U7ngZrxzIV8msmzVhCCobWJk+t2+E7rv5tMUM/DV37ineAIODlLivWc1Rz+LNuxiWy1SLCfr59RCnUXB8sWoTgSd/prgI2ju5EtO/1nydsNIR8boNd1UvTmm+A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=ZDBqMlYz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=ZDBqMlYz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQcQZ1WFHz2xRq;
	Mon, 23 Jun 2025 15:41:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EieQb2I//I+rooxfBb6WKG//zwmiqI29zk2Af+MrawX3pxucmr2CLrNaX1Nh2r4pPl76S9z5HhQF67CxMdScEKNEXNdqhlXiORTaEC3YUHJskrzCKKNbI+/hUKOH0KQCQD94/id/4epqKg3kONbPCCLQpPELEQ45iGjV9ea8OO0Eklc6N2gRg2WMREGDXo1xXb91CbelabUdLHugs/boK1kyIMjcnoZPy+a8a2IuecxLSWNUVCzaUWM5dAZXoQmAytQS9cCTplY8UznfK+KWwLiuyQWf8zNt2wMHvf0D0aW8j6p7j9P7lsixFSgY8eIc9WaoLMZdsPnZPRdnz4z79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HedHH9h42IiBcKalGfW+9YAocfvxB+i4VHm3KNqhvg=;
 b=EFu6ZzhmwQb1mp27+qi8MbUwMa1GcIh7LfxYVvuzw2JEkbtzTtU79bw4cw5NdRsQ39Z/j4xMXZY/JbHV9yNi1RlIzYWYAGx84/591uJ/RoXfA1QTMRY6o0spB9Z7e94pjyeXZ61H121W8YcuVzHiRdR5VyR9zH3OfEedEQ1b9N377BNIhLZVzsbktWX6vl9hyM/L9FFvjxTs6Kt0N+XHEFERUJGKb80QZqzMCbDVyjCYhJVCsnvW4s2jo0dGJIpmm0d5O01JdvjiCxZ1NhTR4Uy/hUd0TFz1iESIMxZlVKJMdtBtA+hWdsAh0pbe8VYwmEZNXh7N1m0tD+XAaD9Vow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HedHH9h42IiBcKalGfW+9YAocfvxB+i4VHm3KNqhvg=;
 b=ZDBqMlYzjYr+54hbQk+Dim3FelVy2muG+GDgI6+RRcrJ03JChvV60t2Z0MEwoFx/UMseUAwLTUxZEqfeWhYaYe6l+cuIwUp5rt8PbSDCrFwWbn4C5fjdcSTtOD/yizlwJp+Of9EqQ38L5DiwH5WY7vt5dad26ER3pcOhdbiyB0Uu0pSndOtAONwQME6m4vK7/+nem2lFXH5JZAmrIgBf+xK5C0Y0aTzYJj8BxbkI6Cns24OITz9nLOEXzYqAUcCGjq9eDK7Ngjn8wdt08sf0VehVizQgiYqMCA4cQbepnMEn0W5jNKTqlFnoKA8XwntoTPksre7PxM6sZz4FfFns7g==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by JH0PR06MB6438.apcprd06.prod.outlook.com (2603:1096:990:2c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 05:41:13 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8857.025; Mon, 23 Jun 2025
 05:41:13 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"elbadrym@google.com" <elbadrym@google.com>, "romlem@google.com"
	<romlem@google.com>, "anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>, "yuxiaozhang@google.com"
	<yuxiaozhang@google.com>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
Thread-Topic: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
Thread-Index: AQHb3BN5QYkLFJ4SFk66wBBeIABUJbQA/lGAgA8cdnA=
Date: Mon, 23 Jun 2025 05:41:13 +0000
Message-ID:
 <SEYPR06MB5134973F678EB5B163DD50809D79A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-8-jacky_chou@aspeedtech.com>
 <40d1c5bd-0457-55ea-2514-ba27e6a4c720@linux.intel.com>
In-Reply-To: <40d1c5bd-0457-55ea-2514-ba27e6a4c720@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|JH0PR06MB6438:EE_
x-ms-office365-filtering-correlation-id: 0263232c-cb12-418a-7f99-08ddb21890ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?o+mDl46opg9h0MuOsdzg0Gf65Il86VSbE+4Tt6PUBsiZpUTfR2pxdQlUze?=
 =?iso-8859-1?Q?l7lhaa+xnq6RwLi/nSinCzDKLFB+4T51Vw6Y0hDTs8Opjgqo2WHfL3G7Ic?=
 =?iso-8859-1?Q?yw87d2mtnJw58eA7efbo2Xge1gw3wEh6O3eDY6bagoTBhhUDSf28Dv1bRm?=
 =?iso-8859-1?Q?sqwJIN6F1lf/41ZOJLHWNN+bLl0DURJrPoYFs8J06F5tpXp5VJ5WgiaJYP?=
 =?iso-8859-1?Q?RsgpzckluxEFryd0JQsN62Banwvav3eweULVDHCnOUyAujC89643Jarwaq?=
 =?iso-8859-1?Q?ohhTcL6fIECKyS2zs6RkMkOToyd+wHH0yHN9CMYfkfBNcJGNd0jTJdIvDg?=
 =?iso-8859-1?Q?/+DHtbJ7YESypLR0i4rbVWwTjXxLQIekAeOxRxAV+eICYaenM4mgJDkIe/?=
 =?iso-8859-1?Q?+1StvWz1KGahPnpkEicZan68HpTA+hkejE7ZHWMSuKsvCyZUyrZsEWGO10?=
 =?iso-8859-1?Q?rWUYtzsH1lIByt36AAN4A76+ei+4GJRHkJ4voWfmXbkPYghM3xqUkFp6Bc?=
 =?iso-8859-1?Q?H/EVYZZAsenIyFCPHyfwvICglZG1LDT686TXput4oibecgkMZKP0+yVD2V?=
 =?iso-8859-1?Q?wgkx3jIIo/NSo5yCmDV6Y74jmYHqaJPX4vpCVPDEWIsJynYhZNU09B5YZX?=
 =?iso-8859-1?Q?CDpKkELTeeHoob90p0yEFGU4h8G6SPp/KSmYd7dKZ4z9cfw5zLTlQCBzcL?=
 =?iso-8859-1?Q?nk5JdNbMqaJYHF8QLmmXwuyYnPPdwUnNo12Up9E3VKkLeF8ztGzrEoS0/l?=
 =?iso-8859-1?Q?8YLzeJZc4MfVBkjOE2LDkwfPUDX4cp1M60b3v0Y71v7tjSy8bLo7m6hkDq?=
 =?iso-8859-1?Q?XXY1Oi5EGS+k8VIkCgzGJ82CeKBk1YbhaR4ubcUz8SCZkF/PG6z+Zvbd+l?=
 =?iso-8859-1?Q?veVee0iMHoSDLSAnvxPp1vhaNDwQQU+2nT9vcNAwvjecY/CEisVAsVWs48?=
 =?iso-8859-1?Q?w7FJ/OLQrpLmAgr+RIj7Ucucry6D4TjkqGVNDfsyCT0QzX9UrJrzwA7nTj?=
 =?iso-8859-1?Q?Qa3wCtElbCSuFGBGtaVmRwB/XvV3CX9rdB9PmKsAqBd9dtzM4TGAUS47S6?=
 =?iso-8859-1?Q?kU0rGJ1mwaXRf9nUuxWbidT5bhYj8XAzEaY0a0ikioIOrjEFpHb6YTwUw2?=
 =?iso-8859-1?Q?8uOizV8ZFUv07nHF39dDAkf2ttbLSr7RYu4IGMU3aUoM0uv7m3fZ/URLgU?=
 =?iso-8859-1?Q?Oes7E+nC3WTp/+Jmt5qCMruVeLk+thzaIoOOHpE7IaY2dC0jBXpTbQ3I+y?=
 =?iso-8859-1?Q?gQmSf8xRU3As0c06DyeyUoWLNuYHJxdyD6G1vDvj8DoO3JZ1xQhMtKeztO?=
 =?iso-8859-1?Q?6WNiPZ0JngqMn5HAuY9b2iAYT66isCk1nV6HPUtpwDf9bQkM/vGcS8Luah?=
 =?iso-8859-1?Q?ahoQpSazshQFzlS7mCTg0Q5TPDNKbI/arSl7peAgwjAPooovLbx+h4hY6b?=
 =?iso-8859-1?Q?ObuqA1uiHQj8IxNsglv+3d5tPj3nLx2zuluA+jrJsZ228tHQMtwYli3gnx?=
 =?iso-8859-1?Q?ldTpYcgIyfgYLqc9xg7aAvagPnOslHyG95CvnpHXVbeg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?O/PC/Nn6hhytxk1JKaI7y7aKqUMNCwCvb9eX64WCj/t906a8sCFusKxXju?=
 =?iso-8859-1?Q?9r1eA9zeNvHQ7wMFAm7LrrVCDL9OFBClaPOseXkC72j3BuZy4EkxX23cSX?=
 =?iso-8859-1?Q?Pda6G4tuZR1ZFccEYrn4Q25GVvUY2AIuiXBLyhpsywvlDocHGt9rSTY8WQ?=
 =?iso-8859-1?Q?EJJVvr73JCqioAs9y950ZkwAyCZWxq988YYzuU1kZtRnz5aV1gHG7VciDG?=
 =?iso-8859-1?Q?cwcFfqVnA1+2f6YMS19c7/resT5cJWUMlk2h3pI+RNrwqMbqbaMNs2rLC9?=
 =?iso-8859-1?Q?ERGkfCtSbuaf9WnuJRbM9I6wOXE1qF6PGKfbiNp/Z6b4TMIWPD6aMSuG7E?=
 =?iso-8859-1?Q?xG2v0yRqy+QE1Hp5vVWsTq7UdKbMioJ+2N8HQNGuoNcYL5HI+2ZKR5IeXR?=
 =?iso-8859-1?Q?LAPZQNzrdZloRZHm8xjyEl5qbyVZ3cyuOgPlRggUeI2KrBHvaV+1YxpSgN?=
 =?iso-8859-1?Q?gCYeYHrxlEpN1LbWkgFPCa0gm9MmaXuQS8+C/dhLc0Qb4y/OBmHWEOd6EW?=
 =?iso-8859-1?Q?kykB9QJ5CGJ1eLeg8Tm5CUW1psFS9Ex0BXON1uueoDr/rQwrvN0g7FP2pq?=
 =?iso-8859-1?Q?DXDnsSR5U2cVx4NZC6BFgMpnHY8wehPULGd2oeIDjc2/QfpbouBEvpso4J?=
 =?iso-8859-1?Q?Yo2go1B/EPKP727mU2cJId+MrWRIQRRCW516of+U9S2BUssd7K/A8a9Bqk?=
 =?iso-8859-1?Q?TnqMnEmG/052eaobiVTAPxzLVH4147kEA0aL7uKlrHuoLV4ALwy03J7ERW?=
 =?iso-8859-1?Q?mDC1kFR3UnyoJvxHhaOdirfKXgao6tdNHwf/8CD6uS0vQJBo6WNuaxpMbP?=
 =?iso-8859-1?Q?9CkGowrKavvctP7C2aopIP1tyRzpOkPzcCuxZn4Ed9UZLrF/RNBCQszYO5?=
 =?iso-8859-1?Q?oWIDO6K5+39IgDkPCJDdmHzlz/jp1q3TooflNopUvolghfpIy6diCyX33D?=
 =?iso-8859-1?Q?OWaGFc6NU0mR7UzwwGXyVAK2aYkTLq+ohNvF3WRtASUElHFZ5654eeVm4w?=
 =?iso-8859-1?Q?nASX4UYMSpHexPmNR52Bo3JuxqG/t10P0on17NR311YVHAHT2P0MVCYDtK?=
 =?iso-8859-1?Q?H6VpaI3tFJCoKnxI7lNGfhmHNOgXzmEZBl/qs1MGcuA7xqlSmRtj/17E7n?=
 =?iso-8859-1?Q?SESIajdKFpysIX8OTdyB3vEgRs931VaruSZthI0am/2kOYO1503i02GpR1?=
 =?iso-8859-1?Q?Chlw8X5oK+BgGdWJZipDVPGMyeS1SLIwwkPcA+eE9CTATLa9OOAYEXHY6A?=
 =?iso-8859-1?Q?1imOxJrPZUiio4Hoi7r9yQ/nHdd6cVyb52iDuFkaLtxx2k5FdJwNGJ+Cnw?=
 =?iso-8859-1?Q?WnRH5ln9gr1Oq7tfMOlP7fS7LmWnYMBTzOezxg2BvufBaKa5NvmSP9SRZ9?=
 =?iso-8859-1?Q?mT1Is041GsHWZiVVPEpowKXtMJ6n7lEAOhT4jIWuKYuiGvpHEHQtxjUThe?=
 =?iso-8859-1?Q?8NMLpL90W6CcyMTurJhUUtLjJUjfBcI6rmf5koZbUZVgSnHtyLVrotmoSP?=
 =?iso-8859-1?Q?WiTZYQF+gRQzneniGmLQMN2EJ5W8vWrPlmBmYs5fhNUPeQzrcuXf+J/bdz?=
 =?iso-8859-1?Q?YDt5pQ3WLqt9juN2p2yMS9ogPikh0iV1Dw43iNWibV+evnSH0NIsjfAlOd?=
 =?iso-8859-1?Q?7+mtGw0+x8ydMcIvKWWRNKcjATDcpzMyt6?=
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0263232c-cb12-418a-7f99-08ddb21890ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 05:41:13.2505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SFKUm0wo6xENsgU/zgYK94IvsQF0IzSPtEO+E2bRzrad1x6LnWXHuNrG09ZLr2Wxmjk97iOpdcWZdzvocwlCyBOsBvHmv4LWaoEC7nHHNgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6438
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> > +#include <linux/irqchip/chained_irq.h> #include <linux/irqdomain.h>
> > +#include <linux/mfd/syscon.h> #include <linux/kernel.h> #include
> > +<linux/msi.h> #include <linux/module.h> #include
> > +<linux/platform_device.h> #include <linux/of_platform.h> #include
> > +<linux/of_address.h> #include <linux/of_irq.h> #include
> > +<linux/of_pci.h> #include <linux/pci.h> #include <linux/regmap.h>
> > +#include <linux/reset.h> #include <linux/irq.h> #include
> > +<linux/interrupt.h> #include <linux/workqueue.h> #include
> > +<linux/gpio/consumer.h> #include <linux/bitfield.h> #include
> > +<linux/clk.h>
>=20
> Please order alphabetically.
>=20

Agreed.

> > +
> > +#define MAX_MSI_HOST_IRQS	64
> > +
> > +/* AST2600 AHBC Registers */
> > +#define AHBC_KEY		0x00
> > +#define AHBC_UNLOCK_KEY			0xAEED1A03
> > +#define AHBC_UNLOCK			0x01
> > +#define AHBC_ADDR_MAPPING	0x8C
> > +#define PCIE_RC_MEMORY_EN		BIT(5)
>=20
> Add include for BIT()
>=20

Agreed.

> > +
> > +/* AST2600 PCIe Host Controller Registers */
> > +#define PEHR_MISC_10		0x10
> > +#define DATALINK_REPORT_CAPABLE		BIT(4)
> > +#define PEHR_GLOBAL		0x30
> > +#define RC_SYNC_RESET_DISABLE		BIT(20)
> > +#define PCIE_RC_SLOT_ENABLE		BIT(1)
> > +#define ROOT_COMPLEX_ID(x)		((x) << 4)
>=20
> Add field define with GENMASK() and use FIELD_PREP() ?
>=20

Agreed.

> > +#define PEHR_LOCK		0x7C
> > +#define PCIE_UNLOCK			0xa8
> > +#define PEHR_LINK		0xC0
> > +#define PCIE_LINK_STS			BIT(5)
> > +
> > +/* AST2600 H2X Controller Registers */
> > +/* Common Registers*/
> > +#define H2X_INT_STS		0x08
> > +#define PCIE_TX_IDLE_CLEAR		BIT(0)
> > +#define H2X_TX_DESC0		0x10
> > +#define H2X_TX_DESC1		0x14
> > +#define H2X_TX_DESC2		0x18
> > +#define H2X_TX_DESC3		0x1C
> > +#define H2X_TX_DESC_DATA	0x20
> > +#define H2X_STS			0x24
> > +#define PCIE_TX_IDLE			BIT(31)
> > +#define PCIE_STATUS_OF_TX		GENMASK(25, 24)
> > +#define	PCIE_RC_L_TX_COMPLETE		BIT(24)
> > +#define	PCIE_RC_H_TX_COMPLETE		BIT(25)
> > +#define PCIE_TRIGGER_TX			BIT(0)
> > +#define H2X_AHB_ADDR_CONFIG0	0x60
> > +#define AHB_REMAP_ADDR_31_20(x)	FIELD_PREP(GENMASK(15, 4), x)
> > +#define AHB_MASK_ADDR_31_20(x)	FIELD_PREP(GENMASK(31, 20), x)
>=20
> It might make more sense to name these fields with defines and use
> FIELD_PREP at the calling site instead.
>=20

Agreed.

> > +#define H2X_AHB_ADDR_CONFIG1	0x64
> > +#define AHB_REMAP_ADDR_64_32(x)	(x)
> > +#define H2X_AHB_ADDR_CONFIG2	0x68
> > +#define AHB_MASK_ADDR_64_32(x)	(x)
>=20
> ADd empty line.
>=20

Agreed.

> > +/* Device Registers */
> > +#define H2X_DEV_CTRL		0x00
> > +#define PCIE_RX_DMA_EN			BIT(9)
> > +#define PCIE_RX_LINEAR			BIT(8)
> > +#define PCIE_RX_MSI_SEL			BIT(7)
> > +#define PCIE_RX_MSI_EN			BIT(6)
> > +#define PCIE_UNLOCK_RX_BUFF		BIT(4)
> > +#define PCIE_Wait_RX_TLP_CLR		BIT(2)
>=20
> WAIT
>=20
> > +#define PCIE_RC_RX_ENABLE		BIT(1)
> > +#define PCIE_RC_ENABLE			BIT(0)
> > +#define H2X_DEV_STS		0x08
> > +#define PCIE_RC_RX_DONE_ISR		BIT(4)
> > +#define H2X_DEV_RX_DESC_DATA	0x0C
> > +#define H2X_DEV_RX_DESC1	0x14
> > +#define H2X_DEV_TX_TAG		0x3C
> > +
> > +/* AST2700 H2X */
> > +#define H2X_CTRL		0x00
> > +#define H2X_BRIDGE_EN			BIT(0)
> > +#define H2X_BRIDGE_DIRECT_EN		BIT(1)
> > +#define H2X_CFGE_INT_STS	0x08
> > +#define CFGE_TX_IDLE			BIT(0)
> > +#define CFGE_RX_BUSY			BIT(1)
> > +#define H2X_CFGI_TLP		0x20
> > +#define H2X_CFGI_WR_DATA	0x24
> > +#define CFGI_WRITE			BIT(20)
> > +#define H2X_CFGI_CTRL		0x28
> > +#define CFGI_TLP_FIRE			BIT(0)
> > +#define H2X_CFGI_RET_DATA	0x2C
> > +#define H2X_CFGE_TLP_1ST	0x30
> > +#define H2X_CFGE_TLP_NEXT	0x34
> > +#define H2X_CFGE_CTRL		0x38
> > +#define CFGE_TLP_FIRE			BIT(0)
> > +#define H2X_CFGE_RET_DATA	0x3C
> > +#define H2X_REMAP_PREF_ADDR	0x70
> > +#define REMAP_PREF_ADDR_63_32(x)	(x)
> > +#define H2X_REMAP_DIRECT_ADDR	0x78
> > +#define REMAP_BAR_BASE(x)		(x)
> > +
> > +/* AST2700 PEHR */
> > +#define PEHR_VID_DID		0x00
> > +#define PEHR_MISC_58		0x58
> > +#define LOCAL_SCALE_SUP			BIT(0)
> > +#define PEHR_MISC_5C		0x5C
> > +#define CONFIG_RC_DEVICE		BIT(30)
> > +#define PEHR_MISC_60		0x60
> > +#define PORT_TPYE			GENMASK(7, 4)
> > +#define PORT_TYPE_ROOT			BIT(2)
> > +#define PEHR_MISC_70		0x70
> > +#define POSTED_DATA_CREDITS(x)		FIELD_PREP(GENMASK(15, 0), x)
> > +#define POSTED_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
> > +#define PEHR_MISC_78		0x78
> > +#define COMPLETION_DATA_CREDITS(x)	FIELD_PREP(GENMASK(15, 0), x)
> > +#define COMPLETION_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27,
> 16), x)
> > +#define PEHR_MISC_300		0x300
> > +#define CAPABILITY_GEN2		BIT(0)
> > +#define PEHR_MISC_344		0x344
> > +#define LINK_STATUS_GEN2		BIT(18)
> > +#define PEHR_MISC_358		0x358
> > +#define LINK_STATUS_GEN4		BIT(8)
> > +
> > +/* AST2700 SCU */
> > +#define SCU_60			0x60
> > +#define RC_E2M_PATH_EN			BIT(0)
> > +#define RC_H2XS_PATH_EN			BIT(16)
> > +#define RC_H2XD_PATH_EN			BIT(17)
> > +#define RC_H2XX_PATH_EN			BIT(18)
> > +#define RC_UPSTREAM_MEM_EN		BIT(19)
> > +#define SCU_64			0x64
> > +#define RC0_DECODE_DMA_BASE(x)		FIELD_PREP(GENMASK(7, 0),
> x)
> > +#define RC0_DECODE_DMA_LIMIT(x)		FIELD_PREP(GENMASK(15, 8),
> x)
> > +#define RC1_DECODE_DMA_BASE(x)		FIELD_PREP(GENMASK(23,
> 16), x)
> > +#define RC1_DECODE_DMA_LIMIT(x)		FIELD_PREP(GENMASK(31,
> 24), x)
> > +#define SCU_70			0x70
> > +#define DISABLE_EP_FUNC			0x0
> > +
> > +/* TLP configuration type 0 and type 1 */
> > +#define CRG_READ_FMTTYPE(type)		(0x04000000 | (type << 24))
> > +#define CRG_WRITE_FMTTYPE(type)		(0x44000000 | (type << 24))
>=20
> These are straight from PCIe spec, right?
>=20
> I think those should come from defines inside include/uapi/linux/pci_regs=
.h,
> there might not be one already, so you might have to add them.
>=20
> I also think you should actually use the type as boolean, and return one =
of the
> two defines based on it. A helper to do that might be generic PCI header
> material as well.
>=20

Agreed.
This definition is used on TLP header.
Maybe I will try to add some definitions to pci_regs.h or pci.h

> > +#define CRG_PAYLOAD_SIZE		0x01 /* 1 DWORD */
> > +#define TLP_COMP_STATUS(s)		(((s) >> 13) & 7)
>=20
> Name the field if not yet done with a define and use FIELD_GET().
>=20

Agreed.

> > +#define TLP_BYTE_EN(x)			(x)
> > +#define AST2600_TX_DESC1_VALUE		0x00002000
>=20
> Is this some flag, which should be using a named define instead of the li=
teral?
>=20

Agreed.

> > +#define AST2700_TX_DESC1_VALUE		0x00401000
>=20
> Can this be constructed by ORing named defines together?
>=20

Agreed.

> > +
> > +struct aspeed_pcie_rc_platform {
> > +	int (*setup)(struct platform_device *pdev);
> > +	/* Interrupt Register Offset */
> > +	int reg_intx_en;
>=20
> Really? The variable ends with _en which is a short for "Enable" AFAICT b=
ut
> your comment talks nothing about "Enable"??
>=20

These is for different platform to configure.
They are used to enable or disable INTx or MSI of the corresponding registe=
r.
I will add more descriptions in next version.

> > +	int reg_intx_sts;
> > +	int reg_msi_en;
> > +	int reg_msi_sts;
> > +};
> > +
> > +struct aspeed_pcie {
> > +	struct pci_host_bridge *host;
> > +	struct device *dev;
> > +	void __iomem *reg;
> > +	struct regmap *ahbc;
> > +	struct regmap *cfg;
> > +	struct regmap *pciephy;
> > +	struct clk *clock;
> > +	const struct aspeed_pcie_rc_platform *platform;
> > +
> > +	int domain;
> > +	u32 msi_address;
> > +	u8 tx_tag;
> > +
> > +	struct reset_control *h2xrst;
> > +	struct reset_control *perst;
> > +
> > +	struct irq_domain *irq_domain;
> > +	struct irq_domain *dev_domain;
> > +	struct irq_domain *msi_domain;
> > +	/* Protect bitmap variable */
>=20
> Protects
>=20
> Can you group them visually together using empty line before and removing
> the empty line in between them too.
>=20

Agreed.

> > +	struct mutex lock;
> > +
> > +	DECLARE_BITMAP(msi_irq_in_use, MAX_MSI_HOST_IRQS); };
> > +
> > +static void aspeed_pcie_intx_ack_irq(struct irq_data *d) {
> > +	struct aspeed_pcie *pcie =3D irq_data_get_irq_chip_data(d);
> > +	int intx_en =3D pcie->platform->reg_intx_en;
> > +
> > +	writel(readl(pcie->reg + intx_en) | BIT(d->hwirq), pcie->reg +
> > +intx_en);
>=20
> Please split this kind of operations on 3 (or more) lines (there seem to =
be more
> below too):
>=20
> 	val =3D readl(...);
> 	val |=3D ...;
> 	writel();
>=20
> It will be much easier to read that way. If you need more lines for logic=
, e.g., to
> clear the field first before ORing the new value in, don't hesitate to ad=
d them
> as needed.
>=20
> (val is just a placeholder, you can pick better name for the variable whe=
re
> appropriate.)
>=20

Agreed.

> > +}
> > +

...

> > +
> > +static irqreturn_t aspeed_pcie_intr_handler(int irq, void *dev_id) {
> > +	struct aspeed_pcie *pcie =3D dev_id;
> > +	const struct aspeed_pcie_rc_platform *platform =3D pcie->platform;
> > +	unsigned long status;
> > +	unsigned long intx;
> > +	u32 bit;
> > +	int i;
> > +
> > +	intx =3D readl(pcie->reg + platform->reg_intx_sts) & 0xf;
>=20
> Use a named define for the field of interes instead of the literal.
>=20

Agreed.

> > +	if (intx) {
> > +		for_each_set_bit(bit, &intx, PCI_NUM_INTX)
> > +			generic_handle_domain_irq(pcie->irq_domain, bit);
> > +	}
> > +
> > +	if (IS_ENABLED(CONFIG_PCI_MSI)) {
> > +		for (i =3D 0; i < 2; i++) {
> > +			status =3D readl(pcie->reg + platform->reg_msi_sts + (i * 4));
> > +			writel(status, pcie->reg + platform->reg_msi_sts + (i * 4));
> > +
> > +			for_each_set_bit(bit, &status, 32) {
> > +				bit +=3D (i * 32);
> > +				generic_handle_domain_irq(pcie->dev_domain, bit);
> > +			}
> > +		}
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static u32 aspeed_pcie_get_bdf_offset(struct pci_bus *bus, unsigned in=
t
> devfn,
> > +				      int where)
> > +{
> > +	return ((bus->number) << 24) | (PCI_SLOT(devfn) << 19) |
> > +		(PCI_FUNC(devfn) << 16) | (where & ~3); }
> > +
> > +static int aspeed_ast2600_rd_conf(struct pci_bus *bus, unsigned int de=
vfn,
> > +				  int where, int size, u32 *val)
> > +{
> > +	struct aspeed_pcie *pcie =3D bus->sysdata;
> > +	u32 bdf_offset;
> > +	int rx_done_fail =3D 0, slot =3D PCI_SLOT(devfn);
> > +	u32 cfg_val, isr, type =3D 0;
> > +	u32 link_sts =3D 0;
> > +	int ret;
> > +
> > +	/* Driver may set unlock RX buffere before triggering next TX config
> > +*/
>=20
> buffer
>=20
> > +	writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> > +	       pcie->reg + H2X_DEV_CTRL);
> > +
> > +	if (bus->number =3D=3D 128 && slot !=3D 0 && slot !=3D 8)
> > +		return PCIBIOS_DEVICE_NOT_FOUND;
> > +	type =3D (bus->number > 128);
> > +
> > +	if (type) {
> > +		regmap_read(pcie->pciephy, PEHR_LINK, &link_sts);
> > +		if (!(link_sts & PCIE_LINK_STS))
> > +			return PCIBIOS_DEVICE_NOT_FOUND;
> > +	}
> > +
> > +	bdf_offset =3D aspeed_pcie_get_bdf_offset(bus, devfn, where);
> > +
> > +	regmap_write(pcie->cfg, H2X_TX_DESC0, CRG_READ_FMTTYPE(type) |
> CRG_PAYLOAD_SIZE);
> > +	regmap_write(pcie->cfg, H2X_TX_DESC1,
> > +		     AST2600_TX_DESC1_VALUE | (pcie->tx_tag << 8) |
> > +TLP_BYTE_EN(0xf));
>=20
> Use FIELD_PREP() instead of the custom shifting. I strongly suggest you r=
eplace
> also that TLP_BYTE_EN() with FIELD_PREP() done here. If you feel need mor=
e
> space, you can first calculate the value into a local variable using a mu=
ltiline
> construct:
>=20
> 	val =3D AST2600_TX_DESC1_VALUE | \
> 	      FIELD_PREP(..., pcie->tx_tag) | \
> 	      FIELD_PREP(...);
>=20

Agreed.

> > +	regmap_write(pcie->cfg, H2X_TX_DESC2, bdf_offset);
> > +	regmap_write(pcie->cfg, H2X_TX_DESC3, 0);
> > +
> > +	regmap_write_bits(pcie->cfg, H2X_STS, PCIE_TRIGGER_TX,
> > +PCIE_TRIGGER_TX);
> > +
> > +	ret =3D regmap_read_poll_timeout(pcie->cfg, H2X_STS, cfg_val,
> > +				       (cfg_val & PCIE_TX_IDLE), 0, 50);
> > +	if (ret) {
> > +		dev_err(pcie->dev,
> > +			"[%X:%02X:%02X.%02X]CR tx timeout sts: 0x%08x\n",
> > +			pcie->domain, bus->number, PCI_SLOT(devfn),
> > +			PCI_FUNC(devfn), cfg_val);
> > +		ret =3D PCIBIOS_SET_FAILED;
> > +		*val =3D ~0;
>=20
> PCI_SET_ERROR_RESPONSE()
>=20

Agreed.

> > +		goto out;
> > +	}
> > +
> > +	regmap_write_bits(pcie->cfg, H2X_INT_STS, PCIE_TX_IDLE_CLEAR,
> > +			  PCIE_TX_IDLE_CLEAR);
> > +
> > +	regmap_read(pcie->cfg, H2X_STS, &cfg_val);
> > +	switch (cfg_val & PCIE_STATUS_OF_TX) {
> > +	case PCIE_RC_L_TX_COMPLETE:
> > +	case PCIE_RC_H_TX_COMPLETE:
> > +		ret =3D readl_poll_timeout(pcie->reg + H2X_DEV_STS, isr,
> > +					 (isr & PCIE_RC_RX_DONE_ISR), 0, 50);
> > +		if (ret) {
> > +			dev_err(pcie->dev,
> > +				"[%X:%02X:%02X.%02X]CR rx timeoutsts: 0x%08x\n",
>=20
> Add space after ]
>=20

Agreed.

> > +				pcie->domain, bus->number, PCI_SLOT(devfn),
> > +				PCI_FUNC(devfn), isr);
> > +			rx_done_fail =3D 1;
> > +			*val =3D ~0;
>=20
> PCI_SET_ERROR_RESPONSE()
>=20

Agreed.

> > +		}
> > +		if (!rx_done_fail) {
> > +			if (readl(pcie->reg + H2X_DEV_RX_DESC1) & BIT(13))
>=20
> Use a named define instead of BIT() literal.
>=20

Agreed.

> > +				*val =3D ~0;
>=20
> PCI_SET_ERROR_RESPONSE()
>=20

Agreed.

> > +			else
> > +				*val =3D readl(pcie->reg + H2X_DEV_RX_DESC_DATA);
> > +		}
> > +
> > +		writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> > +		       pcie->reg + H2X_DEV_CTRL);
> > +		break;
> > +	case PCIE_STATUS_OF_TX:
> > +		*val =3D ~0;
> > +		break;
> > +	default:
> > +		regmap_read(pcie->cfg, H2X_DEV_RX_DESC_DATA, &cfg_val);
> > +		*val =3D cfg_val;
> > +		break;
> > +	}
> > +
> > +	switch (size) {
> > +	case 1:
> > +		*val =3D (*val >> ((where & 3) * 8)) & 0xff;
> > +		break;
> > +	case 2:
> > +		*val =3D (*val >> ((where & 2) * 8)) & 0xffff;
> > +		break;
> > +	case 4:
> > +	default:
> > +		break;
> > +	}
> > +
> > +	ret =3D PCIBIOS_SUCCESSFUL;
> > +out:
> > +	writel(readl(pcie->reg + H2X_DEV_STS), pcie->reg + H2X_DEV_STS);
> > +	pcie->tx_tag =3D (pcie->tx_tag + 1) % 0x8;
> > +	return ret;
> > +}
> > +
> > +static int aspeed_ast2600_wr_conf(struct pci_bus *bus, unsigned int de=
vfn,
> > +				  int where, int size, u32 val)
> > +{
> > +	u32 type =3D 0;
> > +	u32 shift =3D 8 * (where & 3);
> > +	u32 bdf_offset;
> > +	u8 byte_en =3D 0;
> > +	struct aspeed_pcie *pcie =3D bus->sysdata;
> > +	u32 isr, cfg_val;
> > +	int ret;
> > +
> > +	/* Driver may set unlock RX buffere before triggering next TX config
> > +*/
>=20
> buffer
>=20
> Many similar things in this function so please reflect my other comments =
to
> this.
>=20

Agreed.

> > +	writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> > +	       pcie->reg + H2X_DEV_CTRL);

...

> > +out:
> > +	writel(readl(pcie->reg + H2X_DEV_STS), pcie->reg + H2X_DEV_STS);
> > +	pcie->tx_tag =3D (pcie->tx_tag + 1) % 0x8;
> > +	return ret;
> > +}
> > +
> > +static bool aspeed_ast2700_get_link(struct aspeed_pcie *pcie) {
> > +	u32 reg;
> > +	bool link;
> > +
> > +	regmap_read(pcie->pciephy, PEHR_MISC_300, &reg);
> > +	if (reg & CAPABILITY_GEN2) {
> > +		regmap_read(pcie->pciephy, PEHR_MISC_344, &reg);
> > +		link =3D !!(reg & LINK_STATUS_GEN2);
> > +	} else {
> > +		regmap_read(pcie->pciephy, PEHR_MISC_358, &reg);
> > +		link =3D !!(reg & LINK_STATUS_GEN4);
>=20
> While I don't entirely know the meaning of these bits, what if the link i=
s not
> using maximum speed it is capable of, does this check misbehave?
>=20

In our AST2700, there are gen4 RC and gen2 RC.
Therefore, here will get capability to confirm it is gen2 or gen4.
And the link status is in different register.

> > +	}
> > +
> > +	return link;
> > +}
> > +
> > +static int aspeed_ast2700_rd_conf(struct pci_bus *bus, unsigned int de=
vfn,
> > +				  int where, int size, u32 *val)
> > +{
> > +	struct aspeed_pcie *pcie =3D bus->sysdata;
> > +	u32 bdf_offset, status;
> > +	u8 type;
> > +	int ret;
> > +
> > +	if ((bus->number =3D=3D 0 && devfn !=3D 0))
> > +		return PCIBIOS_DEVICE_NOT_FOUND;
> > +
> > +	if (bus->number =3D=3D 0) {
> > +		/* Internal access to bridge */
> > +		writel(TLP_BYTE_EN(0xf) << 16 | (where & ~3), pcie->reg +
> > +H2X_CFGI_TLP);
>=20
> FIELD_PREP()
>=20

Agreed.

> > +		writel(CFGI_TLP_FIRE, pcie->reg + H2X_CFGI_CTRL);
> > +		*val =3D readl(pcie->reg + H2X_CFGI_RET_DATA);
> > +	} else {
> > +		if (!aspeed_ast2700_get_link(pcie))
> > +			return PCIBIOS_DEVICE_NOT_FOUND;
> > +
> > +		bdf_offset =3D aspeed_pcie_get_bdf_offset(bus, devfn, where);
> > +
> > +		type =3D (bus->number =3D=3D 1) ? PCI_HEADER_TYPE_NORMAL :
> > +PCI_HEADER_TYPE_BRIDGE;
> > +
> > +		writel(CRG_READ_FMTTYPE(type) | CRG_PAYLOAD_SIZE, pcie->reg +
> H2X_CFGE_TLP_1ST);
> > +		writel(AST2700_TX_DESC1_VALUE | (pcie->tx_tag << 8) |
> TLP_BYTE_EN(0xf),
> > +		       pcie->reg + H2X_CFGE_TLP_NEXT);
> > +		writel(bdf_offset, pcie->reg + H2X_CFGE_TLP_NEXT);
> > +		writel(CFGE_TX_IDLE | CFGE_RX_BUSY, pcie->reg +
> H2X_CFGE_INT_STS);
> > +		writel(CFGE_TLP_FIRE, pcie->reg + H2X_CFGE_CTRL);
> > +
> > +		ret =3D readl_poll_timeout(pcie->reg + H2X_CFGE_INT_STS, status,
> > +					 (status & CFGE_TX_IDLE), 0, 50);
> > +		if (ret) {
> > +			dev_err(pcie->dev,
> > +				"[%X:%02X:%02X.%02X]CR tx timeout sts: 0x%08x\n",
> > +				pcie->domain, bus->number, PCI_SLOT(devfn),
> > +				PCI_FUNC(devfn), status);
> > +			ret =3D PCIBIOS_SET_FAILED;
> > +			*val =3D ~0;
> > +			goto out;
> > +		}
> > +
> > +		ret =3D readl_poll_timeout(pcie->reg + H2X_CFGE_INT_STS, status,
> > +					 (status & CFGE_RX_BUSY), 0, 50000);
> > +		if (ret) {
> > +			dev_err(pcie->dev,
> > +				"[%X:%02X:%02X.%02X]CR rx timeoutsts: 0x%08x\n",
> > +				pcie->domain, bus->number, PCI_SLOT(devfn),
> > +				PCI_FUNC(devfn), status);
> > +			ret =3D PCIBIOS_SET_FAILED;
> > +			*val =3D ~0;
> > +			goto out;
> > +		}
> > +		*val =3D readl(pcie->reg + H2X_CFGE_RET_DATA);
> > +	}
> > +
> > +	switch (size) {
> > +	case 1:
> > +		*val =3D (*val >> ((where & 3) * 8)) & 0xff;
> > +		break;
> > +	case 2:
> > +		*val =3D (*val >> ((where & 2) * 8)) & 0xffff;
> > +		break;
> > +	case 4:
> > +	default:
> > +		break;
> > +	}
> > +
> > +	ret =3D PCIBIOS_SUCCESSFUL;
> > +out:
> > +	writel(status, pcie->reg + H2X_CFGE_INT_STS);
> > +	pcie->tx_tag =3D (pcie->tx_tag + 1) % 0xF;
> > +	return ret;
> > +}
>=20
> On a glance, this (& the wr func) looked very similar to the 2600 one on =
a
> glance, I didn't check it with diff how similar it really is.
>=20
> If you need minor variation e.g. in some register value, you could add th=
at into
> the struct pointed by .data. Then you can get it easily here using
> pcie->info->tx_desc_val without duplicating lots of code.
>

Agreed.
I will review these read and write configuration commands and put them toge=
ther.

> > +static int aspeed_ast2700_wr_conf(struct pci_bus *bus, unsigned int de=
vfn,
> > +				  int where, int size, u32 val)
> > +{
> > +	struct aspeed_pcie *pcie =3D bus->sysdata;
> > +	u32 shift =3D 8 * (where & 3);

...

> > +static void aspeed_irq_msi_domain_free(struct irq_domain *domain,
> > +				       unsigned int virq, unsigned int nr_irqs) {
> > +	struct irq_data *data =3D irq_domain_get_irq_data(domain, virq);
> > +	struct aspeed_pcie *pcie =3D irq_data_get_irq_chip_data(data);
> > +
> > +	mutex_lock(&pcie->lock);
> > +
> > +	bitmap_release_region(pcie->msi_irq_in_use, data->hwirq,
> > +			      get_count_order(nr_irqs));
> > +
> > +	mutex_unlock(&pcie->lock);
> > +}
> > +
> > +static const struct irq_domain_ops aspeed_msi_domain_ops =3D {
> > +	.alloc =3D aspeed_irq_msi_domain_alloc,
> > +	.free =3D aspeed_irq_msi_domain_free,
> > +};
> > +
> > +static struct irq_chip aspeed_msi_irq_chip =3D {
> > +	.name =3D "PCIe MSI",
> > +	.irq_enable =3D pci_msi_unmask_irq,
> > +	.irq_disable =3D pci_msi_mask_irq,
> > +	.irq_mask =3D pci_msi_mask_irq,
> > +	.irq_unmask =3D pci_msi_unmask_irq,
> > +};
> > +
> > +static struct msi_domain_info aspeed_msi_domain_info =3D {
> > +	.flags =3D (MSI_FLAG_USE_DEF_DOM_OPS |
> MSI_FLAG_USE_DEF_CHIP_OPS |
> > +		  MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX),
> > +	.chip =3D &aspeed_msi_irq_chip,
> > +};
> > +#endif
> > +
> > +static void aspeed_pcie_irq_domain_free(struct aspeed_pcie *pcie) {
> > +	if (pcie->irq_domain) {
> > +		irq_domain_remove(pcie->irq_domain);
> > +		pcie->irq_domain =3D NULL;
> > +	}
> > +#ifdef CONFIG_PCI_MSI
> > +	if (pcie->msi_domain) {
> > +		irq_domain_remove(pcie->msi_domain);
> > +		pcie->msi_domain =3D NULL;
> > +	}
> > +
> > +	if (pcie->dev_domain) {
> > +		irq_domain_remove(pcie->dev_domain);
> > +		pcie->dev_domain =3D NULL;
> > +	}
> > +#endif
>=20
> Add aspeed_msi_init() and aspeed_msi_free() helpers inside the large #ifd=
ef
> CONFIG_PCI_MSI block and make them empty on #else side so you don't need
> ifdeffery here at all but can just make one call.
>=20

Agreed.

> > +}
> > +

...

> > +#ifdef CONFIG_PCI_MSI
> > +	pcie->dev_domain =3D
> > +		irq_domain_add_linear(NULL, MAX_MSI_HOST_IRQS,
> &aspeed_msi_domain_ops, pcie);
> > +	if (!pcie->dev_domain) {
> > +		ret =3D dev_err_probe(pcie->dev, -ENOMEM, "failed to create IRQ
> domain\n");
> > +		goto err;
> > +	}
> > +
> > +	pcie->msi_domain =3D pci_msi_create_irq_domain(dev_fwnode(pcie->dev),
> &aspeed_msi_domain_info,
> > +						     pcie->dev_domain);
> > +	if (!pcie->msi_domain) {
> > +		ret =3D dev_err_probe(pcie->dev, -ENOMEM, "failed to create MSI
> domain\n");
> > +		goto err;
> > +	}
> > +
> > +	writel(~0, pcie->reg + pcie->platform->reg_msi_en);
> > +	writel(~0, pcie->reg + pcie->platform->reg_msi_en + 0x04);
> > +	writel(~0, pcie->reg + pcie->platform->reg_msi_sts);
> > +	writel(~0, pcie->reg + pcie->platform->reg_msi_sts + 0x04); #endif
>=20
> Ditto.
>=20

Agreed.

> > +	return 0;
> > +err:
> > +	aspeed_pcie_irq_domain_free(pcie);
> > +	return ret;
> > +}
> > +

...

> > +	reset_control_assert(pcie->h2xrst);
> > +	mdelay(10);
> > +	reset_control_deassert(pcie->h2xrst);
> > +
> > +	regmap_write(pcie->pciephy, PEHR_MISC_5C, CONFIG_RC_DEVICE);
> > +	regmap_read(pcie->pciephy, PEHR_MISC_60, &cfg_val);
> > +	regmap_write(pcie->pciephy, PEHR_MISC_60,
> > +		     (cfg_val & ~PORT_TPYE) | FIELD_PREP(PORT_TPYE,
> > +PORT_TYPE_ROOT));
>=20
> TYPE (typo)
>=20
>=20
> Put the logic on separate lines before the write.
>=20

Agreed.

> > +
> > +	writel(0, pcie->reg + H2X_CTRL);
> > +	writel(H2X_BRIDGE_EN | H2X_BRIDGE_DIRECT_EN, pcie->reg +
> H2X_CTRL);
> > +
> > +	/* The BAR mapping:
> > +	 * CPU Node0(domain 0): 0x60000000
> > +	 * CPU Node1(domain 1): 0x80000000
> > +	 * IO       (domain 2): 0xa0000000
> > +	 */
> > +	writel(REMAP_BAR_BASE(0x60000000 + (0x20000000 * pcie->domain)),
>=20
> Please name what is in the comment with defines and use the named defines
> in the code instead of the literals. Also consider using SZ_* for that
> size(?) (remember to add the include if using them).
>=20

Agreed.
It is HW fixed. I will change to get from the ranges property from dtsi.

> > +	       pcie->reg + H2X_REMAP_DIRECT_ADDR);
> > +
> > +	/* Prepare for 64-bit BAR pref */
> > +	writel(REMAP_PREF_ADDR_63_32(0x3), pcie->reg +
> H2X_REMAP_PREF_ADDR);
> > +
> > +	reset_control_deassert(pcie->perst);
> > +	mdelay(1000);
> > +
> > +	pcie->host->ops =3D &aspeed_ast2700_pcie_ops;
> > +
> > +	if (aspeed_ast2700_get_link(pcie))
> > +		dev_info(pcie->dev, "PCIe Link UP");
> > +	else
> > +		dev_info(pcie->dev, "PCIe Link DOWN");
> > +
> > +	return 0;
> > +}
> > +
> > +static int aspeed_pcie_probe(struct platform_device *pdev) {
> > +	struct device *dev =3D &pdev->dev;
> > +	struct pci_host_bridge *host;
> > +	struct aspeed_pcie *pcie;
> > +	struct device_node *node =3D dev->of_node;
> > +	const void *md =3D of_device_get_match_data(dev);
> > +	int irq, ret;
> > +
> > +	if (!md)
> > +		return -ENODEV;
> > +
> > +	host =3D devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> > +	if (!host)
> > +		return -ENOMEM;
> > +
> > +	pcie =3D pci_host_bridge_priv(host);
> > +	pcie->dev =3D dev;
> > +	pcie->tx_tag =3D 0;
> > +	platform_set_drvdata(pdev, pcie);
> > +
> > +	pcie->platform =3D md;
> > +	pcie->host =3D host;
> > +
> > +	pcie->reg =3D devm_platform_ioremap_resource(pdev, 0);
> > +
> > +	of_property_read_u32(node, "msi_address", &pcie->msi_address);
> > +	of_property_read_u32(node, "linux,pci-domain", &pcie->domain);
> > +
> > +	pcie->cfg =3D syscon_regmap_lookup_by_phandle(dev->of_node,
> "aspeed,pciecfg");
> > +	if (IS_ERR(pcie->cfg))
> > +		return dev_err_probe(dev, PTR_ERR(pcie->cfg), "Failed to map
> > +pciecfg base\n");
> > +
> > +	pcie->pciephy =3D syscon_regmap_lookup_by_phandle(node,
> "aspeed,pciephy");
> > +	if (IS_ERR(pcie->pciephy))
> > +		return dev_err_probe(dev, PTR_ERR(pcie->pciephy), "Failed to map
> > +pciephy base\n");
> > +
> > +	pcie->h2xrst =3D devm_reset_control_get_exclusive(dev, "h2x");
> > +	if (IS_ERR(pcie->h2xrst))
> > +		return dev_err_probe(dev, PTR_ERR(pcie->h2xrst), "Failed to get h2x
> > +reset\n");
> > +
> > +	pcie->perst =3D devm_reset_control_get_exclusive(dev, "perst");
> > +	if (IS_ERR(pcie->perst))
> > +		return dev_err_probe(dev, PTR_ERR(pcie->perst), "Failed to get
> > +perst reset\n");
> > +
> > +	ret =3D pcie->platform->setup(pdev);
> > +	if (ret)
> > +		goto err_setup;
> > +
> > +	host->sysdata =3D pcie;
> > +
> > +	ret =3D aspeed_pcie_init_irq_domain(pcie);
> > +	if (ret)
> > +		goto err_irq_init;
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		goto err_irq;
> > +
> > +	ret =3D devm_request_irq(dev, irq, aspeed_pcie_intr_handler, IRQF_SHA=
RED,
> dev_name(dev),
> > +			       pcie);
> > +	if (ret)
> > +		goto err_irq;
> > +
> > +	pcie->clock =3D clk_get(dev, NULL);
> > +	if (IS_ERR(pcie->clock))
> > +		goto err_clk;
> > +	ret =3D clk_prepare_enable(pcie->clock);
> > +	if (ret)
> > +		goto err_clk_enable;
> > +
> > +	ret =3D pci_host_probe(host);
> > +	if (ret)
> > +		goto err_clk_enable;
> > +
> > +	return 0;
> > +
> > +err_clk_enable:
> > +	clk_put(pcie->clock);
> > +err_clk:
> > +err_irq:
>=20
> It would be better to name these on what is rolled back, not based on wha=
t
> failed.
>=20
> > +	aspeed_pcie_irq_domain_free(pcie);
> > +err_irq_init:
> > +err_setup:
>=20
> These should be removed and the goto replaced with direct return.
>=20

Agreed.

> > +	return dev_err_probe(dev, ret, "Failed to setup PCIe RC\n");
>=20
> Common printing is not well suited for the rollback path. It's not much v=
alue to
> print a generic message like that, instead print the more specific error =
before
> gotos.
>=20

Agreed.

> > +}
>=20
> Where's the mutex initialized??? Please use devm_mutex_init() and don't
> forget to check errors because devm can fail.
>=20

Agreed.

Thanks,
Jacky


