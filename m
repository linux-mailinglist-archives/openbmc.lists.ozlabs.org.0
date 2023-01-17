Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A280D66D3AA
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 01:36:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwqgf3JSLz3cBp
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 11:35:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=b+zWNjZJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.117.100; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=b+zWNjZJ;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2100.outbound.protection.outlook.com [40.107.117.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nwqfq1CT8z30Lt;
	Tue, 17 Jan 2023 11:35:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuTMW5P0mWSV6zhmVo2Szkl5B0gKCzch7pbfA3sKqUVypr3xij0BDTCIGB2ZSxiLL5zHOwsRHAfkPgvD3Y/aGLY0r8inPiSZoJfdeJ+ri25B5hIUUJR2eZoSIlBBKcxHHzIjkauPKOMpSJBK7oYr2PCpPPOZ4tc3yWwfwW0D0iVOtTVLMLT++jVHPONjtD5Jlaaiw9JXoPPwEQEvnak5YZOCEVapFerIp5i0ezR0vcQPlX9r2FjKZFR7CtIC8Khaav7eIAQcppVWbelPfmezyBjsk7pJWhuFWiUpYRsTaSpEPC8NaF+BuGvTNVRPZVs2Y1FCMmQXdv5xwRslKLINGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4q1nayywIysmw8plBJESAH2slQf7YZEZQAnyKcLc8tM=;
 b=SDZMOMiqzTtIn1VsP6qU6hlXPFn2nVMLMCcotYermBC1XhUervdltzWONFlQI5ADB0kD4d4yYhMESzmp8/fjH0MXNE46bKAIBDSnP/sbFzuneY9juzCQx+7YUoakwhmHMUxH/bxbeaY2hnDilzeahYqyaCXRAE6IG9pVHl2Vbi/NWiiGYHeTDcsXsK7ntqLm0cD9g7ydXKKNjtGFusT+/TjUpGmCMDICeKFk3RdOMKDLVoPEQ/tuODMJbsQ+WrL2PfcTXySPtEQFULhhjndpjqOmpoJWz5IKDTBEKpncLZkDEk+Bba2tUA77A44tYD68cCev3r8Fg1CRHSEisQfGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4q1nayywIysmw8plBJESAH2slQf7YZEZQAnyKcLc8tM=;
 b=b+zWNjZJzyg5cXcipW3diRCyptwVXrE+jmDCbZhWcVfhRNExG+XU/IjOcqf5ckPBMxX08smoOgsSVGtKQu2CabQvJ7jkN+GfQwMdfCH7HvbsQ35Vj/VlNBKwusXa3ddnstavmPRXKpl8o8u6fFHSskXeOPzMFOCGx5+WOrFyjG63vIG1tvD+l5PBMYKjebCjLCDPXlJ/loGgGgZNSGTpHX1TBc3uFpT3z98Ln+0mk1Jn9SieETIk+6Yf5/oZ96N/oI4Aa+gdpz3Sh73F3FQ7/dPzZgMXpXlxkOUlkxJRFAXrOtYlavHUuzYuap+CUEox0oa0scFVYuYJcZniWzxOCQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6155.apcprd06.prod.outlook.com (2603:1096:101:dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.10; Tue, 17 Jan
 2023 00:34:53 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 00:34:53 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
	Linus Walleij <linus.walleij@linaro.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH 0/2] Add ASPEED AST2600 miss pinctrl
Thread-Topic: [PATCH 0/2] Add ASPEED AST2600 miss pinctrl
Thread-Index: AQHZH1b1LTqsdnfNSkKXmN3Th9Enf66gd64QgAB4L4CAAOgqQA==
Date: Tue, 17 Jan 2023 00:34:53 +0000
Message-ID:  <SEZPR06MB526999E79E16DA4D43D15B21F2C69@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230103093702.2613574-1-ryan_chen@aspeedtech.com>
 <SEZPR06MB5269DA226076831F4B36135DF2C19@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <3d95553d-2e86-40c9-bfe3-a837bfc7f57f@app.fastmail.com>
In-Reply-To: <3d95553d-2e86-40c9-bfe3-a837bfc7f57f@app.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SEYPR06MB6155:EE_
x-ms-office365-filtering-correlation-id: 33f35ff8-ab69-4c40-157c-08daf822a67b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /ntjWEs1Q5N90bBHfpa76bIu2nWAahNwAsSUrBMNPNj5iA8sQgcSfJi+VatUg41UQBDzh6FlCIM9e3i47vh57wwBIFvtBjft+j3tJCpHCpRLVAAhurDVUltLUU8lfV4Cbegn1JM9mh+OHho3QcIsjKMqtBYWq4H5q90eMsQ+sirWaZGn+KMmksoLStZqfiJVz/sAmV71Eo1N9/CClcL3Al7ocEEi4xigVgfUiXFCH09xA6TrwRvKmr5MAMUtk4aCRQ4JRfl1hfQyaCNK4OCGRiCU29yBdLdpnG0LdSwF71AW+zZpYo79RtPgodfXJIfS+CbgrISEKDpFipEswXTDa5m5DY5ckuDqpudJEl9AGRXePwUC2g1NsfwJoW4SwAvAX5MXhur+FzDNnCiCR7xVAzO1ht9GhYuu7OLhG4V0mHntvpf/aUwuyw5jCvvos2+OuFyr7Vo7VxcC0evYOoe7eryu4BD6GhmB1MawmAcRRZHLsT6dSK2G4QQnOrucW9ZaFPIcjXbKiXX1q9EB8tvXwbGhAi99K8rbmlwc46+9H7WI2/cnwo3+3dF//A0LYblCPmOJRva+8GUaJl6epftPHcpFGXRoLGbwvf74Dms1Houb10Bp8LzgWT3dcC0L3hg6arRGFn+95HQVjSdsOCiUNK29FyEVAnyrPrAxpDe2DHbV7DZN/D2AbHfCxm0g5R47wJtkOVtLc+qUVbYj9YORFg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(366004)(136003)(39850400004)(346002)(451199015)(38100700002)(86362001)(38070700005)(52536014)(55016003)(8676002)(76116006)(66556008)(66476007)(4326008)(64756008)(66946007)(66446008)(2906002)(8936002)(5660300002)(4744005)(83380400001)(122000001)(33656002)(478600001)(7696005)(71200400001)(316002)(110136005)(41300700001)(53546011)(107886003)(9686003)(26005)(186003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?4tbZuE//51M1QEMqB87UciGkSs94xoS6BXdDFAyJPmJc1eg/DJFUjm5tLj0g?=
 =?us-ascii?Q?Jy9ttGrJEbZFc3K1EDYFkGrjA6LHb9cA+oM5dNLFYpVkvUaQdZNunjbLDa4m?=
 =?us-ascii?Q?N5F/YlWvXqcaxlvugpZ/sz6zIshcO9NhGIxsmLHv3yOKxRlllzIMAfbLGEE2?=
 =?us-ascii?Q?Pcj3OFTUR8TCRRK0Mju9FJ/jMRMQinmp5FlOUCIOQuU9Dm4IdsbsCwcrI5uQ?=
 =?us-ascii?Q?cD0EFg3hCKqcsJKz8MvZDqfgG5+kJt0ZTMMWPx+B5MbLVtSNP6ZgD4AF2NYf?=
 =?us-ascii?Q?1V4FYO9Foj2zzpXM/D0tetxNw2QaesxI+7sPFX2oVDEDC72zsPerNnJLJ1o2?=
 =?us-ascii?Q?ZAapSTSEr3fP+8APUzmx//E4bU5wU1104uXdV0Hv33/DTQqzSWTwSW/6lcXJ?=
 =?us-ascii?Q?TbXbw91RxXOCfqsBsc6vDHzvU3JDVBGQzpI3JYK77b0q4MrqnyhA+xbKjsZr?=
 =?us-ascii?Q?WkW/x0850ezirVi29hBM4All13YjqvOKpCmjDYavT2UzU9LZ24qxXWciJLc3?=
 =?us-ascii?Q?AeaADuyHjr5uqJI8qHeCW/ldShw19+gK3K5fQYfpBPYTmMqvf2d1smW3nOP7?=
 =?us-ascii?Q?yD/GE80GRqOTUP4E40EbWRXQyxZzgLvSM2LlRaiXYWMjHxeMor2U4poO3vEh?=
 =?us-ascii?Q?FPkycec/FX4md/acCUFcyn5mo/Z0EA73vwPkm8cSUJTZCvByXZpqYDmZWcpb?=
 =?us-ascii?Q?VEiGZcykHSBW1r+Vl1wHTqjTMPJZC++jwVLPJgb1y+z6Yk2ym+OK4RId+ayA?=
 =?us-ascii?Q?KVO8YyGcXfT+ovP9fs94gXtRop6J4o2CPZnHT/COfdHWjIgdO5va8t1BFpjL?=
 =?us-ascii?Q?SS5l9p0bRO+w8a67hWKw24lYDla4ajUDMYvZlxfoTubTSsYhKhm5aYCK/QGd?=
 =?us-ascii?Q?qAyohwcNcsccwLYwAsKG0Wb3b7g8LRDf/K75XYBRgEg0oaK1pWTslCagzvNZ?=
 =?us-ascii?Q?D1x65ze4SIzIcgwiEf86mv0zC7pkWSpN6+uwoQfdb/i93EW9HXs25BJ2VqgX?=
 =?us-ascii?Q?KQ0Nu9EgsUf+qIyTc4fGVLNGo0Q28nTd9I2y5sijz446yQXv0fp5O8XzboJC?=
 =?us-ascii?Q?IzJe0EREFJORFR8OGqZeYgtds4/J23TznNf3SvZvgg/TcPtg0uzyHnShq2v1?=
 =?us-ascii?Q?/CU/BtFY5ndts9hNs5WbUTJbeCX0phzwszm5PYNiBtVX8XCJxzoIQy+meZzq?=
 =?us-ascii?Q?EdKdGJ52ebLv+4+RoOhc3GvWG9GLbXznJL1ICZ5xfR1yhxzUxoK77ts3Ymkm?=
 =?us-ascii?Q?PYXb3gAEmR3m/n5rbyBNieWUuYAPQ6zZvgq9MgN0lH0DvJLh2sIKhOl/fp+v?=
 =?us-ascii?Q?hkXyW/Y9T0eTsxZiRTa3dWAfQZIvgQNRubA2we3BTn412kXPK8Vw7BvzKyac?=
 =?us-ascii?Q?Bp+xStZ3W59eATNGcik3qzjVu9/D9jFg2hemYWkPTTGIFo0K8ky9ExnwCPl7?=
 =?us-ascii?Q?x+/br9MONkFEXFyDpj2pCnPFExzhnnmAUTNAkpUHfgrDFi6ce0N0vrXBXJuQ?=
 =?us-ascii?Q?GgI8jvXDNbmOlwHK9G3x78QpcvBkgwH1mNFy1/3pWgYXOCtbeHoBotVA7cfn?=
 =?us-ascii?Q?k9xC8ZU7K+OVNip4cZS1O0pnD5LvscEjXpM7kjQZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f35ff8-ab69-4c40-157c-08daf822a67b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 00:34:53.1382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/W65RPhhIgGdw74cTjyoI2R7ZbgckDxk7z3nKU+f4ASWr5blOW6XvNOuQMSQVlAB3GZxeYJiEpzjazX3ST8jYjOK7GquQCVaMXOZ97QTyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6155
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Monday, January 16, 2023 6:43 PM
> To: Ryan Chen <ryan_chen@aspeedtech.com>; openbmc@lists.ozlabs.org; Rob
> Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Linus
> Walleij <linus.walleij@linaro.org>; linux-aspeed@lists.ozlabs.org
> Cc: BMC-SW <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH 0/2] Add ASPEED AST2600 miss pinctrl
>=20
>=20
>=20
> On Mon, 16 Jan 2023, at 14:03, Ryan Chen wrote:
> > Hello Andrew,
> > 	Could you help review this series patch?
>=20
> Yep, I hope to get to it this week, just trying to pick up the pieces aft=
er the new
> year break :)
>=20
Hello Andrew,
	Thank your response. enjoy your holiday
Ryan
