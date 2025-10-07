Return-Path: <openbmc+bounces-724-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D92BC0D66
	for <lists+openbmc@lfdr.de>; Tue, 07 Oct 2025 11:16:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgrB05fYNz3000;
	Tue,  7 Oct 2025 20:16:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759828616;
	cv=pass; b=lmyO1LM5arH6otCKbIcNDWbk/6N3XBIYNFjeQqM21OvWNman3PPXiRwC99m0UXoPk1kM9cFMFbUjIlx+MmTWap6IZNvLmj37F9d+bQv649H35hKI8L44n2DV18lvF5G8cLeIkbXkaUuzQ2V9eBdjTD1/XJAxqHh7VG92fwXcgB/ZBGrlEWsqdCEHrFZyZoEjHLWaaYsG/DX7beQ3HtNuBDrPkxxngV4pKHc4OT+xlsryRrpyr6xDbUw5/qXUMWKVdO2su2BZWuKatTCyf6l1VO8uB7weUDqQ5/vsF3GHjanp/6H7T6dUjl04H0nI//pAq2AtVMvq+qV++bnJR6ftvA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759828616; c=relaxed/relaxed;
	bh=s+rIrVrUKvs9fGqm6tT5bAjFBMGT1ap95AymkDsKAkc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OFImzUWZdCKLCyXpnDuFdkYR1pjjW7lYZvGrdPFFpgFlrmbi1VQWf1mOghAWs0Esu4YhNpueRBZ3jOqCkoxMmwegl63Tr+Vn9oyE8EPMP7jD4oArbWhX1HGFMdJl2bmrOlmb8iwtM5ILdt62ewTwQnYYdxdmeah55yJarzLguj8tJJlxNT1hBt6mbv/8279jHNrh/tlYSw3veWkVazjX6YoqMuSPvLOjpgiux+09i11KkFZKvS5JEon3xX4WpMir9ff0r8pWIg5v7HPJv8oM7ThM3iBeTMTn5u9uB/5EcEh7ZsHLnvA50v0QP6YFQIB5vxbnFbjMfizrBhnW2vV5HQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Hg32GBZU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Hg32GBZU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgr9y5htjz2yrm;
	Tue,  7 Oct 2025 20:16:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2mk0nNHYug9vY6A3ZImKK2ev3yXlWYY5E6d8JCaJiUD2iDBi5Q903vNNT++kpRBCmaDcUeFdYhDuJnXTlRLUXXBBGL1RwbX1tEc3A71AbXxlGR6pUN2T25Fv5Jg8AdNMvKfgyjjEffqYoZ3XAQNovEskXGCnq0TJjsgm4hwBN1XtvqXMfkwqpOedqvUDn9OuDjJwOCdMkhoizkfFWbVZwCJmyIp2pKwrqgWqrXnzlnnoMdH3zcFNIZ3/mlfS5Jh8cPpl7DAjjikPEgeXxAuRGCvSIV38o21E1j5oEYGgjfEgymINA90pPH0PgHO2XlNId/Y+7afbUnTeRDpQKMQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+rIrVrUKvs9fGqm6tT5bAjFBMGT1ap95AymkDsKAkc=;
 b=qqGlprduSIQioS/TeyzqVrzmnBjJ1ORgpZpcdt4TqEBHRIQg0Qocsfw6JlpbuOASuQgtLHBDaoPQI8bGI77JWg8npV/tqL/+J5NzDEJ6/4mf2+ZqPtiRwE3L/GZ9o5pDMmFQCySSmPP8Ou1SewAJdrvspOC10Shtpog1f0drLVp+3GXRzecMmZkLeuxx88RS7Hfg/YyFmz4/SAHRc2u7zRN5wObZ0IncD6GdKg4pxYK9MKKqPiqRYO0DeXYPrcR3IHdYTsyTfBCyLck/48HW9AVC08LXALTP5iEVXN91Pfkni75kyB2sAHMAp49UAjjaV52IKgX/oqMXKt8fWszVvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+rIrVrUKvs9fGqm6tT5bAjFBMGT1ap95AymkDsKAkc=;
 b=Hg32GBZUyTH7A+X7Xav7o4/phmHTjZXbnWScn42ecHXlWO31ttS0moYG9mFaRUlU5j1h/QqZOKFcZvyHo6JFDN1mfzVDDQ8MYbxKpf1hhXvcB8WBeEcdzQjvdqJlEIXtJ8CnRCQw1kE+81WdmUOAnuyaRsd9TobNqNO5K4GHl1U0X1VlcVcK7TMBs8GU72gbruI4FRIVuaim7+IDdPSQ9KnBa8ZX1/gx46WKR2k0StlwB9Qh3VfvoDv1wTWkLmeKi4jr5BFI1zBnXKqwBD6PcOfGCte/WIQk3kfuIiVN5cDO0axUmpA9GjY0ZSKc4B+Bh8pqyiZlQh2yPOaX4Hn/DA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEZPR06MB6599.apcprd06.prod.outlook.com (2603:1096:101:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 09:16:31 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 09:16:29 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
Thread-Topic: [PATCH v2 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
Thread-Index: AQHcHYdz6/9iKI/eoE2qlgWtTAxWebSEP7kAgDJU8xs=
Date: Tue, 7 Oct 2025 09:16:29 +0000
Message-ID:
 <OSQPR06MB7252E76F47E7C3B6F0BD13ED8BE0A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
 <20250904103401.88287-3-billy_tsai@aspeedtech.com>
 <20250905-monumental-camouflaged-butterfly-01faed@kuoka>
In-Reply-To: <20250905-monumental-camouflaged-butterfly-01faed@kuoka>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEZPR06MB6599:EE_
x-ms-office365-filtering-correlation-id: 0f4029a2-7c5a-47bb-53c2-08de0582335a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|8096899003|38070700021;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?uvSq7WwkuiB810a6akK1Q5O51dpq1kxEz/AUzc+AmxZLZ97g7+mzMTQk?=
 =?Windows-1252?Q?BVP11OIUuW8tP8qlkrxdGhk6lOO0WLo/2tPBL+iNw9fiuHCQjFKyz0jY?=
 =?Windows-1252?Q?Y4impsPOhYHQS/uYJLJ6Q/jCq3wAoUbJLJ5irMcHRBHY9IFY7mEAbbWl?=
 =?Windows-1252?Q?HHrzsckhdvLvSjNoqOoDfKBCMpaI8QO+mG/b2FfHCCLS0RseYv6T7Pwo?=
 =?Windows-1252?Q?2oN/oigbmWJmbcVI8F2fYTr/3LzEUNaO/hHjArSJ250tlfDxf3bvh3lX?=
 =?Windows-1252?Q?0ioVBthF2ZfSQBeDSt0F9wsVHu6UDcEQ7fSd5e1va1BjKe7DS/eFU+7o?=
 =?Windows-1252?Q?oBuwcN81NHJj6P+hgdtR8gbf1Cd+X8uTdq67dA5c5IGYnU9CyRfzgrv9?=
 =?Windows-1252?Q?zSXnVoWBhhNgvDLAT92B/kQxGGunp347zclpblFpsxwt0SouGK4i2Gac?=
 =?Windows-1252?Q?IxHAjIY/Fg3XxwzXmeM5cUSQWEjXSx5FsMAstUjezevE7pBUjyCaylKo?=
 =?Windows-1252?Q?tm42izHmQMCKCmXfms2dC0exrSAAoCgJh+1HkY/stRDET76979Ehs3rM?=
 =?Windows-1252?Q?nq0it6PsNp9KG14Op7kC/sEChmbO6tJ/vA+ZlYbDptWKmXpsvBXqA0RZ?=
 =?Windows-1252?Q?Wzvx0pPpsqOnrWhYf+67HPpUs274SRqYkyZgfw901ZWqW7KtwbjwUK48?=
 =?Windows-1252?Q?0zYgqNoOHneczTBPfIrqbfvqsHaV6ON0i8qvaehxIx3jRVSf1uoOLRvL?=
 =?Windows-1252?Q?mzeWZZ4Lt/53mOobFMDnMD/tpICi4D9S8aNoyFfsEP5JJbyLPdM74fBH?=
 =?Windows-1252?Q?4Cidl5NXZCUjyIwXVKq03TGFAtOcqpTBcXqyE7sOKnlDDj6ajGV20FJM?=
 =?Windows-1252?Q?R3Jj54J/X6Iu0O6S5/q/9xCB0EdFYrDu1Yn7qFAjsceF4xNeOcNUFxI/?=
 =?Windows-1252?Q?dIM+1lu7qGr2W0cSoi7qgFD+dy/4upni39yYMJMySexCiJwqa+cplrOm?=
 =?Windows-1252?Q?69Pl9Km3hXk6L4V5Y50p9rHm5Xio9LsEXdR+3RoBT2yZmSwG7xqNLAEw?=
 =?Windows-1252?Q?I9ASDTWXiV5DhOtIBu2MieqiMRDbuwHMQuFxm+h7UGVphg65/OzQRM8+?=
 =?Windows-1252?Q?Goy43kh6XYf6M2ETk150aSkNa62Ak/sUda6LFGYf2NJhryp1UZEeg+Qd?=
 =?Windows-1252?Q?mcctwhLAUyfNUObtYQFC9xL2yk2SjJ8/JWd0GBFA5+c98gOVZYZg5/NJ?=
 =?Windows-1252?Q?TUCl1G6APXbXXZiUlFXcGMaX+uZXtQek6+mS98SD6eMFH4OATTThzoH9?=
 =?Windows-1252?Q?xc3XTI5GTHCyzoD4rRPUFCBmvC0qBJI6B7WI1dVRZYnASic3IAIKjAN3?=
 =?Windows-1252?Q?OQwhuau1KTwaggU7+jjo1bAvWgvoo7TeFaEaiftfuLvdN6bCnqwT7l8q?=
 =?Windows-1252?Q?+fTaqHOmdZ3vycG9CunhZagRFESm9cJMVzEF8bjzgN2HV2A2Cwtp1xDR?=
 =?Windows-1252?Q?FIlFcHWPVuSt6/7FMThlCd94Yyl+2g/kUcQqTXteK1jZ6H+LmaoNcDs5?=
 =?Windows-1252?Q?vrWq7FSoiyk4MdKhMG0aPlNPOVi4eNjWycgDvoJ5gFLsJKRGbAsK4tkS?=
 =?Windows-1252?Q?FowEnEm6J/V1IS/y3fefGPp4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(8096899003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?+vXxwzrP6r7TSaw41MzNvhHu/SpAyw11Jyzmmzw5LsVeErWH1o3dNYIi?=
 =?Windows-1252?Q?MmWik55rk6UuZHjf7b1Gcy67wvr2pxDECBLLPXzE4KyWlZuZzEtA4wF0?=
 =?Windows-1252?Q?jPLbjCGBJG23akeAQA0FRulsDZHTM5jFComfX/DEKMLDm/cejzqVhSUK?=
 =?Windows-1252?Q?0kk8jqlLDAY3c8n1M+cJoxGOAM3I407bQmGHQzUNvU5p50lWOK2l1GPQ?=
 =?Windows-1252?Q?s6P+WcUIBcorzvnHHyhc3LxZPWeE3vSlFjIerV08Ft4j3Oli/Wsg/7M0?=
 =?Windows-1252?Q?sK9w5Gu9MtoeabjEVL2ZYobCUA8w7JlzKb9DayzfqZSRnWNOW5PCS3Uh?=
 =?Windows-1252?Q?sFaa31s2S0LFtGkUO1SZS2lkOF5S0HcZkiFs2vjjJ6qp8EB3vG9yL/tu?=
 =?Windows-1252?Q?KfCwt31ds2wuwT5Apm+zv1GrSnBB6dsMW5OZSCarQNk6ayVtAllRceJs?=
 =?Windows-1252?Q?qlycrfeqiVgnXSBmg3KwXhU/ePifScfgYVTNCZ1wypIFc0PvHZZMcVba?=
 =?Windows-1252?Q?0zLir1zPQmN9A+HzJnp5UP+OUD7kC/iguqac0MR+UaH3yNhmhllho30v?=
 =?Windows-1252?Q?RXYbUgm9H40noVYd0Vz1VVE8Trmq8Vlw/jTNEi7JR3+KZ2LSWZbQDS7O?=
 =?Windows-1252?Q?UxCOUvQpXT/UjsnR5B9si1IuSquGcwyicVRgCOCpfxQGwt/7aMt4Uo90?=
 =?Windows-1252?Q?6w4H/wF1uQ+2dSpnvbhWueo+PkOa3B2/ha4YQiOtzrbPjOxGW9ctvZb4?=
 =?Windows-1252?Q?414EIyeuHQupV24vRfz/0JGW4XkyFGJyl1g3R+I0WDIy2KTvzXahIsLZ?=
 =?Windows-1252?Q?aqvRpRLtpdbJ6ejjfvk3y6UDEhW3z4SxiQAIHuZCmOBQj3d2Rcq2+Wb/?=
 =?Windows-1252?Q?dyXLObTXDNXaEdkYsaZGNd8oWdHv1SJr5GluDnpZeYArPATGHFP/DLiN?=
 =?Windows-1252?Q?/mwSfKSgnMKXVvWwtVwbNOjqDzFFtJBWpBHjpxaC8PopIMWpUPRM18DB?=
 =?Windows-1252?Q?YIRHEklLO5qmmXlgStL7ruK96RXmIO8y35cJFUNlEvtoi9s+yBJiFs9V?=
 =?Windows-1252?Q?b7ynm7hLSRxGqYcnDT2ZYdiMOCMoqplFtZdVRhvbCDyJkWYz6xoFhgOo?=
 =?Windows-1252?Q?GOpegoXMCE5JzQo+5CxtWL1RKQ0fjjdIiBoSubdDwxl2urUYYJ+C3jMe?=
 =?Windows-1252?Q?3LoCKTs/wRb1XiriKfSBBHNv98BlGxmiSDnBn8SEBj/tutWVaQNRyxWU?=
 =?Windows-1252?Q?FdM2lEyNpwuaC1ZYKYFIKi63jcglNjvMEKcEvQD902UCDclUITerkFB4?=
 =?Windows-1252?Q?Ah8le7G+5nJh1O61TVI9WJSJCmJgMklqjkmkcrLA6neZvvrOzZMmWy1K?=
 =?Windows-1252?Q?pYrHK7EMLgWsFvs69E2cT3hnIlIZxoogbpHAj0GN/6DEJuAPcIc9MDlO?=
 =?Windows-1252?Q?bp5BuaLl5w4GnJGCKslMvMvKaDR6zcZaHhzugFK9gH4xEfkS7pVE651h?=
 =?Windows-1252?Q?ZcgWYgVaWS9ke1+DDLRUaQLbIfdRu2T27uM1hn4WaBjcfMr53+PomHpo?=
 =?Windows-1252?Q?MhOOAEnld5Z7klwEw8a3K0FLvfRMZ66sWa54VhpvHhDKRsWMbU6hwdoT?=
 =?Windows-1252?Q?VyMydR3DnM/EpDhOTluWmkZ6sRs5wGPz047AUWlGLCt6fdQc1MQRwirr?=
 =?Windows-1252?Q?MicMbRUv51eD6S1EJJtscVw5050tBNbzYEEpBiq8LXMPAnF1uxdhENGC?=
 =?Windows-1252?Q?u3RzfhAV7rsl/4zIPKM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_OSQPR06MB7252E76F47E7C3B6F0BD13ED8BE0AOSQPR06MB7252apcp_"
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
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4029a2-7c5a-47bb-53c2-08de0582335a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 09:16:29.8421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p97+J1g2AlEIFECYCzP2FVU6BFXh1z/jRpIdKyDqJIbXDpp2n9R2gl4lVNC8SsiIrBvOmxYf8+RKjCNfyQxZ1WSRlzyjY7Yvg7hXVrQ8Fj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6599
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_OSQPR06MB7252E76F47E7C3B6F0BD13ED8BE0AOSQPR06MB7252apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> > +
> > +examples:
> > +  - |
> > +    pinctrl0: pinctrl{

> DTS coding style - missing space.

> Unused label.

> And you did not implement Rob's comment.

Does Rob=92s comment mean that I need to move the example to aspeed,ast2x00=
-scu.yaml instead of this DT binding, right?

Should I keep a minimal pinctrl-specific example such as:

examples:
  - |
    pinctrl {
        compatible =3D "aspeed,ast2700-soc0-pinctrl";

        pinctrl_emmcclk_driving: emmcclk-driving {
            pins =3D "AC14";
            drive-strength =3D <2>;
        };
    };

Thanks

Best regards,
Billy Tsai

--_000_OSQPR06MB7252E76F47E7C3B6F0BD13ED8BE0AOSQPR06MB7252apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.elementtoproof, li.elementtoproof, div.elementtoproof
	{mso-style-name:elementtoproof;
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"elementtoproof" style=3D"mso-margin-top-alt:12.0pt;margin-right=
:0cm;margin-bottom:12.0pt;margin-left:0cm">
&gt; &gt; +<br>
&gt; &gt; +examples:<br>
&gt; &gt; +&nbsp; - |<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; pinctrl0: pinctrl{<br>
<br>
&gt; DTS coding style - missing space.<br>
<br>
&gt; Unused label.<br>
<br>
&gt; And you did not implement Rob's comment.<br>
<br>
Does Rob=92s comment mean that I need to move the example to aspeed,ast2x00=
-scu.yaml instead of this DT binding, right?</p>
<p class=3D"elementtoproof" style=3D"mso-margin-top-alt:12.0pt;margin-right=
:0cm;margin-bottom:12.0pt;margin-left:0cm">
<span style=3D"color:black">Should I keep a minimal pinctrl-specific exampl=
e such as:</span></p>
<p class=3D"elementtoproof" style=3D"mso-margin-top-alt:12.0pt;margin-right=
:0cm;margin-bottom:12.0pt;margin-left:0cm">
<span style=3D"color:black">examples:<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp; - |</span><span l=
ang=3D"EN-US" style=3D"color:black;mso-fareast-language:ZH-TW"><o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp; &nbsp; pinctrl {<=
o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp; &nbsp; &nbsp; &nb=
sp; compatible =3D &quot;aspeed,ast2700-soc0-pinctrl&quot;;<o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp; &nbsp; &nbsp; &nb=
sp; pinctrl_emmcclk_driving: emmcclk-driving {<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; pins =3D &quot;AC14&quot;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; drive-strength =3D &lt;2&gt;;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp; &nbsp; &nbsp; &nb=
sp; };<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp; &nbsp; };<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Thanks<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><br>
Best regards,<br>
Billy Tsai<span style=3D"color:black"><o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_OSQPR06MB7252E76F47E7C3B6F0BD13ED8BE0AOSQPR06MB7252apcp_--

