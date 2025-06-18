Return-Path: <openbmc+bounces-241-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF48ADE2F5
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 07:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMX5T6txYz30RN;
	Wed, 18 Jun 2025 15:16:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750210541;
	cv=pass; b=M4G2RPNpJVD6dX+izx7/ZsAcLjH43t9iTmdPSUc8YgbyhSNwTpcCjEWvzLjY0YYWLsFVqc2KKLL0q4GvYL3ZK2iHz8WVTd0Gv3RBt/QNa47wYP5/LyFKo1wD8780Sk6gfgI+oxfXTpP0f2nVL5Xxsrf/GWQMVFxLIfXT3QpSNUyHEm//XYLrDhIlNP72b/d6OvpavBOyE90aEIcAhQLpfAKxqLeBvVstlkn62blrNCiFRJAROJyab77naVeqvTt/2Op3Mwza6WWgkB7MDY/bmUc+Vg5hZaOVvO/0Fhs5hgwG6I70E2We6kohyg8nuY8bADRqCKB+S5ytefLXQL9hrw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750210541; c=relaxed/relaxed;
	bh=xJdBVKgIMVid2KI6wuwlD/TDurJoW2bwcuPA6gH1O/Y=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LNJXF09PP9XwqajHeH0FN0HOSZbDoHu6PNdypBeqU/AYQZgKhuQi5Y9GueoLfXW3kLiz+AzMnZQy1F4PfFI4Fxrhjt/nHeeGNWnQajqPrj/NHBdg0gGxmYmi3sxuIekd1C6rY0bd5Khj5LlG3vzyxs9luNAHz98pDWuXpxf37IuQzaPTleEdvhV0iXEAAiLkj9KLrW4xEl3naSn81UYo/o0V6x7vlr/5fA7ukGGZrG3bP0l1hfVrQSlvXAF+8/0hl7wDVjnlMvvvRSEY/R/Phuyg0kWd0Sy2Z3Ekul5Q+E/Lezs+RFa19QtKfhFWZrvGtnX48ec60wTX2CXOVnyPAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMRBl2Zxzz2yb9;
	Wed, 18 Jun 2025 11:35:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOH+uhbbY5psstui985v6qG9ImYV+s17LwmVWYj3BlRHcxmjOPSDzKHz4M4fT39aelas1Sij+mm8UXfJr7ME1xnyGjmC8D2x7PFZ66q4Mu+KCNRiOCU7hrJb7VuobCUEBuG+UyB1wQD+54l/ufaz1S7kFJJPsnYgrgzDR5e8LO7bCt+AxyrZHxAsDNq3CzxBtY9D44P4aJYVOLl68RmTbqQlhpHxa3VTx7bF/StfkLoQ8cObR2VxbCm8KHt3BXVS+QIHsEdcd3hu/Cb9VkE8n3WD808c9CmyRLDepsJ8ns6Ng90fejBtNuNXPqZzxgnfJzlBAFrKnx3vg5r3sOk8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJdBVKgIMVid2KI6wuwlD/TDurJoW2bwcuPA6gH1O/Y=;
 b=IsX3TLxIb6AP58NLps9YM8EGo4a/4sckS/4gxfUjcWuuiW7e4xBd2RKXLjg6Bkj6oGdv/MeYNLhEvGa3v8U4s4EJfID/yK8cQ4qVagLUgM9WJwWRICYd6xm1kcxn8RwfP74Gc3FYMHf/qvWcE4N1iDy7I3Lyj0R5+mcQuVKjU04QJiMGqrRp5vKTZVRmDHgneXs/kBzq7GtAcNhPvbWrhypckKjGQM0Kayo46d0zFVfMnJVZDj3ti7bhxCYRqGx83lEM1gDeoy2OFP07bQ0XCmVZ1+tcNSovL23HrO09RWmdwusEvMeWwQwmZp9zvk+5VM4awu+RUP18YiZB2z0kXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJdBVKgIMVid2KI6wuwlD/TDurJoW2bwcuPA6gH1O/Y=;
 b=U/jsYyq0XSp/oGWtWgfN9RHR/1o4c/X5qwVMqZ83T15lXEC9mNN+tPmqRehxt8ekRDnszIHEY7MaMVbH90TDgLE8RTF6o6D5fwUMwvdBK4SsOV9sTbHqcH1GbPPy8X2zmtoY1suYHhyu/xofwGrkxAP6rK7XFxv3mSSIQr4GZVYtyuM34OT+LtzN6iSnu6yn2IjbJdYSFbwGpVUpD8PFDoidq/JEp7ykkNdcLgIhkpPjgn8eSCvS2gBoKQR3jH2p5RVM8xoq9AcD3t6jambIdf0ZiTInjEOnP2QCKK6DFvpX+FXdkzfh/chy4jmqEutqEhzYz/TZTCdIyJVjUjEv1Q==
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com (2603:1096:400:466::8)
 by SEZPR06MB7261.apcprd06.prod.outlook.com (2603:1096:101:226::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Wed, 18 Jun
 2025 01:34:35 +0000
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed]) by TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed%4]) with mapi id 15.20.8835.026; Wed, 18 Jun 2025
 01:34:35 +0000
From: Cool Lee <cool_lee@aspeedtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 1/8] mmc: sdhci-of-aspeed: Fix sdhci software reset can't
 be cleared issue.
Thread-Topic: [PATCH 1/8] mmc: sdhci-of-aspeed: Fix sdhci software reset can't
 be cleared issue.
Thread-Index: AQHb3sG2ykUBDV8RQEG+uyGdBhEOerQIGdBw
Date: Wed, 18 Jun 2025 01:34:35 +0000
Message-ID:
 <TYSPR06MB7068B3600E9EC3E8A33D92969572A@TYSPR06MB7068.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-2-cool_lee@aspeedtech.com>
 <6aeab5e5b616b1e690c2622d6599c5228a391e69.camel@pengutronix.de>
In-Reply-To: <6aeab5e5b616b1e690c2622d6599c5228a391e69.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR06MB7068:EE_|SEZPR06MB7261:EE_
x-ms-office365-filtering-correlation-id: 02a81b3c-dd09-41a4-321f-08ddae0848a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pBXMwo3I/QW/kR83xLgGOMXcQ4L3tQnJG9zSfx/M+V6PyERzuU7G749M2WBr?=
 =?us-ascii?Q?Hd6sI0DN4ftn5ZvnNmmBqZRQ6G32fZRWpRb3ZKVWMrRhnplkuqbZWW2J4v1g?=
 =?us-ascii?Q?H048a6NdmcrUVAa0UIIKG+IBPztwGLYlUsPtrvu7ngmdWMY0JC0vAuwiOHJm?=
 =?us-ascii?Q?ZynOngZM1aE2V/YSdBSRBEhsDwyzsthBmVratKyLiink7eHCwNAn9LnCEAxz?=
 =?us-ascii?Q?Y20qAa5Bv53Z4hqUReCp67HHf+N9/c1TISPYK5M1Mzz6fwQIKo4q1vu6elbl?=
 =?us-ascii?Q?BjFYDQIbWm3IJp3p6ob1Uwto+ub5BDOUYS6iC79ajJp9k4QXLQrUnIY6NsX0?=
 =?us-ascii?Q?Jfr7OlG3NEjdU2789r2h8Eqwf4VKkgoDbZBrUCqDSwV7hY9cBL4yCZfTuudN?=
 =?us-ascii?Q?o2nWhyprs0oaghkUx1zhtNyFRDHYQZBnTEM19MErXryeoV/ce0rE3dVVHlL9?=
 =?us-ascii?Q?I2KzSNXjFi/UtpZ7mMGED2CbRTmTh1VkdoTIix7CLHEMq5RYMeJPQuh52OwJ?=
 =?us-ascii?Q?R8UU6MI3Q5OPSSGc+M51pUt5U3MHh1G6i/6DFuOtxdecvPZ1dkmTtZZmJGC0?=
 =?us-ascii?Q?ImHsyONNCYBF87sBs9xr5cmr19dJz7reJs46F94oT4vZln5YEht9ysOdNVCF?=
 =?us-ascii?Q?Ojqrhg+uWzpxcCfMwxSszUHrarZG/sfaF9g6GdqReAgG3jim5uh+XyHUAkvB?=
 =?us-ascii?Q?5OJyKiKHEvX9dB3k6evZMBLO2mkJpwUkqvWiHLdBu/ivXZ+/qPh1WfYpsiW6?=
 =?us-ascii?Q?WR7nnvaKCGacjrb7qPuLc2Cl9KjbP9hfAFg32Qxt5DDjSbAsCoEmIgnPjjy4?=
 =?us-ascii?Q?ExBTx+edopbSQQIwl/dhgNzDS5WvVSOj77QH/sMte/bDScs1QYbf+aThNdkP?=
 =?us-ascii?Q?xS8Nal+xkOY5vRkqznEYHIzvLcucPLoutV1EJ0GTYQ2k7qOY0T6FHhaRFQFH?=
 =?us-ascii?Q?rCLqN3MbwbdpGS1gCbMFg4seTXnJ9QSwTvmFozTNiqXINwo7O5MT7ZUlLOCj?=
 =?us-ascii?Q?Eh96tSII7UEkXs9eG3cYA6+iOyB31Iydmr+EkX/WrC5OdROXmaU6uyQ5WpPy?=
 =?us-ascii?Q?2wE51zKlW9rc5k6vqX/ZMp/PsEUhEEL30B1cXKO8CUmjT8sGheLAR3Ipk2Vs?=
 =?us-ascii?Q?73uwPHPMZKV0wk8gxH1dVAL1Ec1ABhXlORvvBghd8pT/bUZurebwetPK2nLq?=
 =?us-ascii?Q?2MCYabumAiqo7YM29tpb1tfBI3VI5Ft+dD/YFqES2BoxJ9oe4AzWLIhdg/dJ?=
 =?us-ascii?Q?FWXdpzN0E60GLQb9rpRVzF0j4yckei5XdAreVpGFixwVKJlTZAhS9NOR/mR5?=
 =?us-ascii?Q?d5o88ifRTAeq8I/wzMT97PIU7GuPKQxTxL7yn3Gg438HG/Zmh3QnrerN5ybl?=
 =?us-ascii?Q?Der5JOuQ4/em74AduWGiBYmNKq86gt5D3JEsNPQ0QeRoCLksIii5D6GbqwVP?=
 =?us-ascii?Q?N7nxIowiKv3YEcaNkV5pbBD30gMkCz14KIWs9ujr+RwZZwLYJFpNPYbmvpmf?=
 =?us-ascii?Q?qfb2aBEbXg8KsJQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR06MB7068.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hV5nMZQ7QL/deCx0VTql7NbOVYf6VcuIPCLnMu4Y92J3uT8/qzI2DYyCRaIv?=
 =?us-ascii?Q?dDkLNdfESorOFJhXWULzUTgwMJFkn3veWCr/HZwLNFtd6bTYNWHouMW2gAUJ?=
 =?us-ascii?Q?/SlbcZ3IzUkXJSAxkOv5wuFns5tbjAX8ppEQcosXl2/NkX0EABwu5RT+aP9S?=
 =?us-ascii?Q?ki1bvmLSQZ8TepRSzGQ+SJnnLP1wbl61kQ79oXGN5/IeJ4uch4XD1x+4P3CW?=
 =?us-ascii?Q?VwGOy85m06AS252fkZ7fS1Rx0bBecsu7Ybidth4OuAncFySWH1g5rVgZTsww?=
 =?us-ascii?Q?NHKNLPKUY4sWCcVkkX35T6FIAA4aT8N1sAdr3tA2N1NGCLLA/3pvSGFFnzD/?=
 =?us-ascii?Q?BVDp6mt4ykh9iAXZkn0XUfo0bJme4YH/IE4SE2tadgY+h//RgSC8tF2emmjd?=
 =?us-ascii?Q?LuEHL/3NnWdeFk4CWKR0vcKEyAg1gBxkiR08MsdmHRT0S9gxi2itL/qCClgU?=
 =?us-ascii?Q?awf2CR010p/942KEoK8ZEmNx/0pGOlwMmkCNa4sytWaTrrmVz7MuBSQ+wuLJ?=
 =?us-ascii?Q?LYZ2yvqnZTRcVrZ29bWt1AArU0Iu16ZteSJK4IJ3AhSUTB8mxiXvEydfCWEZ?=
 =?us-ascii?Q?Yvbgsm+ZTvCVB5QDsksr73lIVOS7eo8Q+LJUNhmdklzFHPM5xz+ak5exHetC?=
 =?us-ascii?Q?3UrcjWAwwOsm8Wa1L2S2XTJo1x/osjTTUmvGcl0mMcH+qYYFS3m1XuTafL4r?=
 =?us-ascii?Q?do5kozkrJ5FZ0PKM20r5gjaSL29tm0slDB1nV+0dzvObVeCFIobdkv5QzyOs?=
 =?us-ascii?Q?fc+WjGP2+oINLdjwXW2b60m37rpCd45p9CZ94F6znapneZhJtxyX3eh8waxY?=
 =?us-ascii?Q?06k46kqx7xn5iNLasJm/0agMrrFH+3XvoSLD4+6IpC8iuzG/vfSLGn2XXEmj?=
 =?us-ascii?Q?VE5H/U9fsn3NPlGmeqc26okGm7fM7cHxBYTDNob4ERDmNuv8r/wiiMFKaFJL?=
 =?us-ascii?Q?p6rQm+aE/zRR+sOmHGFQSL24dL4uZ6b06n2tcaykOOM36INjasYhSAfa/WZd?=
 =?us-ascii?Q?L0+o863M7wQQ0qK74eqm1GekP2+ePPFHmmSr3iTV+wU6T4xIeo2y7C+AJy0Y?=
 =?us-ascii?Q?kpmZM8iYzIif6i7sN3FVaL3gr/n3vQxeup+4i7GkbEHta+/iOMfKFgfhpx7i?=
 =?us-ascii?Q?2D3ZLjYnyBGfCMWcIKBOdN4StlDTAJSn75Yw790G3oFRquiy2XCpDMcFdQDy?=
 =?us-ascii?Q?Qqi2gb+e3YVObQy9nAUwdqnVURH0CW0bPpme02ujVXalOSRdARGkBmkCC+IA?=
 =?us-ascii?Q?TglqoGl/zohY+VfG9DYn0JZH/TDRSXrLkkozdTpHUrCsadswiYd1tpjm9QgZ?=
 =?us-ascii?Q?h3fBIWQkZhscrVYVqZEx4wJWKeJQHWybGIrRgHKi71gHUtvcKfGgVfOnQyD4?=
 =?us-ascii?Q?Ph0t53NrwlQ+k7pf0dB2sMIHTawdQObaqckNPMdOO1RiNG2nBe1/NcYShw02?=
 =?us-ascii?Q?fjJ6NPNcChjX8UpV0sCysNuXekS5ygxkAHgHLLmOPy5rYCHe233I4FGh7Ro7?=
 =?us-ascii?Q?e9UVWvFGTkY6Vsctr/kRQqoCRekf4efDvKXP5n+wh7busHskne5oagS9O9qS?=
 =?us-ascii?Q?mPhmnlhw72gfEqR8jPye2NTriYt1ZwJQ+nfxfRk+?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYSPR06MB7068.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a81b3c-dd09-41a4-321f-08ddae0848a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 01:34:35.8103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFa3KiBoaTZKuFeFcV6hg3zFfgB0ATF3egzwLeh7J4MPJFSt60pmdxlwM9tgyQxaG/SyLCHGXIkilxMhk4AfDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7261
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> > Replace sdhci software reset by scu reset from top.
> >
> > Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
> > ---
> >  drivers/mmc/host/sdhci-of-aspeed.c | 55
> > +++++++++++++++++++++++++++++-
> >  1 file changed, 54 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c
> > b/drivers/mmc/host/sdhci-of-aspeed.c
> > index d6de010551b9..01bc574272eb 100644
> > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/reset.h>
> >  #include <linux/spinlock.h>
> >
> >  #include "sdhci-pltfm.h"
> > @@ -39,6 +40,7 @@
> >  struct aspeed_sdc {
> >  	struct clk *clk;
> >  	struct resource *res;
> > +	struct reset_control *rst;
> >
> >  	spinlock_t lock;
> >  	void __iomem *regs;
> > @@ -328,13 +330,58 @@ static u32 aspeed_sdhci_readl(struct sdhci_host
> *host, int reg)
> >  	return val;
> >  }
> >
> > +static void aspeed_sdhci_reset(struct sdhci_host *host, u8 mask) {
> > +	struct sdhci_pltfm_host *pltfm_priv;
> > +	struct aspeed_sdhci *aspeed_sdhci;
> > +	struct aspeed_sdc *aspeed_sdc;
> > +	u32 save_array[7];
> > +	u32 reg_array[] =3D {SDHCI_DMA_ADDRESS,
> > +			SDHCI_BLOCK_SIZE,
> > +			SDHCI_ARGUMENT,
> > +			SDHCI_HOST_CONTROL,
> > +			SDHCI_CLOCK_CONTROL,
> > +			SDHCI_INT_ENABLE,
> > +			SDHCI_SIGNAL_ENABLE};
> > +	int i;
> > +	u16 tran_mode;
> > +	u32 mmc8_mode;
> > +
> > +	pltfm_priv =3D sdhci_priv(host);
> > +	aspeed_sdhci =3D sdhci_pltfm_priv(pltfm_priv);
> > +	aspeed_sdc =3D aspeed_sdhci->parent;
> > +
> > +	if (!IS_ERR(aspeed_sdc->rst)) {
> > +		for (i =3D 0; i < ARRAY_SIZE(reg_array); i++)
> > +			save_array[i] =3D sdhci_readl(host, reg_array[i]);
> > +
> > +		tran_mode =3D sdhci_readw(host, SDHCI_TRANSFER_MODE);
> > +		mmc8_mode =3D readl(aspeed_sdc->regs);
> > +
> > +		reset_control_assert(aspeed_sdc->rst);
> > +		mdelay(1);
> > +		reset_control_deassert(aspeed_sdc->rst);
> > +		mdelay(1);
>=20
> Why are there delays here ...
Ok, I will remove from here. From hardware's perspective, the delay is not =
needed.

>=20
> [...]
> > @@ -535,6 +582,12 @@ static int aspeed_sdc_probe(struct
> > platform_device *pdev)
> >
> >  	spin_lock_init(&sdc->lock);
> >
> > +	sdc->rst =3D devm_reset_control_get(&pdev->dev, NULL);
> > +	if (!IS_ERR(sdc->rst)) {
> > +		reset_control_assert(sdc->rst);
> > +		reset_control_deassert(sdc->rst);
>=20
> ... but not here?
>=20
> regards
> Philipp

