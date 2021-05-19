Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87978388ECB
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 15:17:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlYLM2zmwz2yyG
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 23:16:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=ucgDJuAs;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=ucgDJuAs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.90; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=ucgDJuAs; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=ucgDJuAs; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300090.outbound.protection.outlook.com [40.107.130.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlYL12Psxz2yXb
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 23:16:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRmOVL4Q+ptI3DS+bLG5ljLjOksvt11zPVMmnW+mstw=;
 b=ucgDJuAsvub3HNiCkxXtl+uM1jvPOQ2ttXNrBHznMmPJLUGd00DAKZpyqTbc9x5TYmVSsnsCMtp9oaowfJ/4WWGcsWv9K6rd36Ts23NBiHIgKGk0qOKBkEMiqxZgQvbEJ25Lp+oyhF41b1HONXKWX0xzbCis3PosbgLYkW4LMLNsXrIFQwRhoMOPLJPZI4FXTfHc612VtN88rB/FfbUHKH07YRkUk04xWQLrHPKCqFXZuPQAaCkTWcBp/jfeLpCsSdQGcMEXv0btqtugODJFA33W0IBhfQ3pII7HxN8iTYAvMVd50eYJgkZGYtQBZLYiraq6KZMo1nfrgCfF7eS1cg==
Received: from SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) by
 HK2PR0401MB1955.apcprd04.prod.outlook.com (2603:1096:202:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 13:16:15 +0000
Received: from SG2APC01FT048.eop-APC01.prod.protection.outlook.com
 (2603:1096::cafe:0:0:98) by SG2P153CA0009.outlook.office365.com
 (2603:1096::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.2 via Frontend
 Transport; Wed, 19 May 2021 13:16:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.51) by
 SG2APC01FT048.mail.protection.outlook.com (10.152.251.160) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 13:16:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THk6DNDdRPDye0hcCFRiywF5PHcFpiDFX2tGX9WqlTIHaJZnRzlRbksRSxrmf0r/CrNtoCemEQY+igSEtOQr/e+UmZeGxmPfBffJLUXuuc3KRf/59Spv8acVZQZE6mrb5PyceA/5PAidDzgVW9Ch3AuMW3yKPP/rk7b4SE7sHj1Hx4pQ2rJIJLx2SFcqlVaNEB65ar/bmXMDMBxem6E6cZmxU/blSLkap36e9yVXf6P6wvfdF2uVA5HDzUAaV2l2iLLKlq9X8uV21I7/eHx8hVc/PqEGnur5w1sZ3KWdCXrBl1LZ0GsWPjjfGqingJx9oH02xohNrvcNsbwSTt01tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRmOVL4Q+ptI3DS+bLG5ljLjOksvt11zPVMmnW+mstw=;
 b=ZZgQaMcNO+HsLOnR0zj4pXFGrQmvN/tWv8IPPrjTKRNeGKNHFlZZ1j+SZ4RaUlL3KFxWDSmAgUa6BjO0ZH0PMfwSjDvDmGk4z93F7oUg5/c6Ou+oabvPZou4tnHJfN2bPfXjUFXqj5Zvy2l7KZMhi+IyFvavMMFGfw4vsDa8rvWLTpfWWHTPJcN9S3ov4AXSymOOIJnFO0tBPCw1PyQ1lAltHbLrCNeck/cI87SFDDrgvP44xiWCsl7r5MaSgarXjIcqdE2zLOMkJ29MD+ZnVVvvf+Q3MZu3O2PgRrlBSQrowxd1Ze8um+qQHQXCAoV0YNRVq4vMM1vKNpRIBZ75Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRmOVL4Q+ptI3DS+bLG5ljLjOksvt11zPVMmnW+mstw=;
 b=ucgDJuAsvub3HNiCkxXtl+uM1jvPOQ2ttXNrBHznMmPJLUGd00DAKZpyqTbc9x5TYmVSsnsCMtp9oaowfJ/4WWGcsWv9K6rd36Ts23NBiHIgKGk0qOKBkEMiqxZgQvbEJ25Lp+oyhF41b1HONXKWX0xzbCis3PosbgLYkW4LMLNsXrIFQwRhoMOPLJPZI4FXTfHc612VtN88rB/FfbUHKH07YRkUk04xWQLrHPKCqFXZuPQAaCkTWcBp/jfeLpCsSdQGcMEXv0btqtugODJFA33W0IBhfQ3pII7HxN8iTYAvMVd50eYJgkZGYtQBZLYiraq6KZMo1nfrgCfF7eS1cg==
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR04MB3843.apcprd04.prod.outlook.com (2603:1096:202:39::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 13:16:10 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2%4]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 13:16:10 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Firmware update for bios/CPLD 
Thread-Topic: Firmware update for bios/CPLD 
Thread-Index: AddMsF4+pmxbXL8zQj+LrCWzLOGm3g==
Date: Wed, 19 May 2021 13:16:09 +0000
Message-ID: <HK0PR04MB2964615B56B0CBB56E27B41FFD2B9@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_Publ1c
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMDE4YzhlOWQtMGQ2Yi00Yjc0LWE3MDItOTI2NGY3NTNkZWZkIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImNoelNjNk13cjlpS2pLOVJiRHFSOEVoNTJWTXZ0djF4WFNvcjJmOEdiamFYYXJvaHFUbjh5Q2tiQW9ab3RkcDkifQ==
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.49.234.34]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a67e5231-0f6c-43ca-a70e-08d91ac8475b
x-ms-traffictypediagnostic: HK2PR04MB3843:|HK2PR0401MB1955:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HK2PR0401MB1955BB796E988D3BA1BA27F8FD2B9@HK2PR0401MB1955.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3iPUgpoMmtC1q36CVkV79aJXcVNQXmKeMN9K0B0jauO53QPZaLUfIcs1hjvZwlczBgNT1b4RzwtZYUEu0MQeHpaFTC1bMv1jAqP6bqILGt0NaWAKcdUAJ+2ww1VAf63Z4r8Nz7iLQQq2Hju79qFZFsTvWi0/jWLPKq7GaVwtZFvvoN4i946IU5avjztWRHTStmnPUzJX3gNEA3oukI/bFksWSp2GQmWzq+kMY7i+M3jnukJPz4S199z56XF0qrgZjVDmIJ7l1+okdZbdLrlJXMCilCO8Jdkj9ux83wvsrPRZoB5TZD+FcGeQp0xxKfiNFgz5D92bNe8qQFtQ43+4+PAzhcYJXmm+XVf8x7O5MGEulv1P4Ah9uatyjuKnTNQfLKb2mz6SyNexh9kFp5UfL6xkXr46Kcy/hGjaW2ZsaiKWvxS9dwsyw8KRW2BMRSGDNxg+XuQqSkMAX/PzQas6hFTq35EHnGpyfnSPrG09EMk+gbKrB3FH6OGMS5pRbLZ0XiGYb553DVgtLXaAWvOnOVOxE9lPLqhbGrh1V9tM+SMWUWYVLqI8y3Kwi0qFfuiVOXMhMVJnbdVc83yy3caW09P957DD77D/RYk4UPou+xIMMeQS0b68AvPHuchWJ2jNhhi6eEvWTJ6BrX0oxMFKmwNdrHwjtg865QLpYLnY300VX9x+xetehgY8LFpIfgLIOf3ZQSmTVUeDQlbJ0i8E/c/P5IlSQZ9VKo/bvgPW1Hk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(33656002)(54906003)(15650500001)(9686003)(478600001)(7696005)(6916009)(122000001)(2906002)(186003)(55016002)(4743002)(38100700002)(66556008)(71200400001)(26005)(4326008)(316002)(5660300002)(52536014)(166002)(66446008)(6506007)(76116006)(66946007)(66476007)(86362001)(8936002)(8676002)(83380400001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?m4m4ONUUGgQ+YgWxKmIXUQVstkK+gc/a3JMjbMG7vwr57gkNJGMsJJV1kdE0?=
 =?us-ascii?Q?zvESZYMW51M1uETTnuDTv87enUSdneAKd/k44kPpAPtrVwvuTU8bstmji5lZ?=
 =?us-ascii?Q?v+Fiqvuxpg2W29y+6av0OjEFrohmum3TJrY60qg1dNCyHFBryDjUybxQNY3F?=
 =?us-ascii?Q?Ecp9unSNGjkHcGWW0chmlPQ6gGWy8WjOiJNDs4XWkrrsnVDcvGqQs3yJAvJ5?=
 =?us-ascii?Q?c5hRkILrsx2/89AOgShMFkSTfcGvXoOYwvTnPen+0FbDhqhsBCn1FzWHveIb?=
 =?us-ascii?Q?OO0FH5H5LaYRSK6GcyJMxZeY3Urg/v0fa21VCFhkpHauPyHYbbrdFUsQIyeW?=
 =?us-ascii?Q?eNIluweubpsQQwjtn2rinqQtK/PFm7FR607a8+U8olBCVQdC6BF2hymq9i61?=
 =?us-ascii?Q?1H2W0n0YUrOs137VLih0IlbvaOpfVAyFr48/FERZW7rS7sjHBlBmoN0G0317?=
 =?us-ascii?Q?wqH4/xO6dqSAqywX98vJhcJR2iH/nptsezn6/zsyR9tY67aZ1oQsHlMdYcV1?=
 =?us-ascii?Q?TMr8B386RnO2p6Ut08Z5Ju6nQOChHdJMEdAAyMg37y0oNz54iSV3COLoughJ?=
 =?us-ascii?Q?mRBBcntyCCaZ02pUZIp6ZJ4ZUwA5umxMUsavVnm8w/PUyzQcXkr2zDwOG/tT?=
 =?us-ascii?Q?lsQBiaN7dA7uTiHQMXotTSZieiIOia0BEbvxd0VOfeWVT0PdhVfuCPf/IFcB?=
 =?us-ascii?Q?TuHKTHKaiwlj7D9K3QvlvcrSUynIyis+2IysjqXfTqQTgaUTdb1M9gwJBd8Q?=
 =?us-ascii?Q?+wvavaFJWOdiIB6UegvoDJ00UUuu6QbFKAToBEQNBtmFXOh7ziNcucAMJqvB?=
 =?us-ascii?Q?2u4byr5N7fgDluQATUJQ/rfFL/TUSqllNLlHBI9vC+jdnzn8KceFk7vpn5hl?=
 =?us-ascii?Q?oEAw1uEt43TPhFZ+xa8yPS7LwGMIIck0ESV5KOWCfvzRA+sD8aMo0JdKXPbB?=
 =?us-ascii?Q?1jBvAfOP83U26pzbr2vnaxzfo+RuO1wS4ueffVsYMorOm2uSfU5dUqYNv1Yu?=
 =?us-ascii?Q?iVsg57nwJa6qE+vQwICLqz53huyVPYUJfRovaC+JHg0S/w1e7ebJaVQoQKfK?=
 =?us-ascii?Q?S7Gq89RAAZtyQwD68syGYC0YfCyzuBczATprTAhG/6DADDp+RM0eQoTOz/Pi?=
 =?us-ascii?Q?2UxQNMaSGR7FGbMRmKmqPgSWGBsO8T5rsAQqO7AzMp0QMf7qz+fvijUIBsV8?=
 =?us-ascii?Q?KLvYvM5bag9oFhruSzLqOUxgunuAVE0WQdbdVY1RBbZQ+lqXsPWtg6h6jDY7?=
 =?us-ascii?Q?8MZTJ/gcg5c3zY9hkfHocdpnIyyRU4lLqoBUNwpcKpsiVGk0y/poYdedrO6H?=
 =?us-ascii?Q?yPI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2964615B56B0CBB56E27B41FFD2B9HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3843
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT048.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 95beafb2-f5fc-46aa-30fe-08d91ac844ef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EbmHWvln53vRf44PhSNEYpXm8EeH6qr5PQDFwNxaF+Rs8o51F1pE4Oja6EebzcyWK7b+pQ+FyfTeAzA1eCQWRpntvO6Sljevojsao7tCgVHEUlNKdWlay1u1tc3RP4pFuCO/KK4zNfMqYj9rrFRjcxezXMjeWriLt44lFfS7whPUvjtk+L8ounQw1wZJeeHx5w/gskmYmUatVhWILIAKJd1oIJOjfAqPTEjPGEjRUprF5DhodvTcmHLmDx3FAddsf5lAvxOyl/mJXcrHPEg2DHyPe7vW9kJeGkHt8nb6WxSnQPWSM/iluPchnTyzDjVlZo4jUCIAjod4ge3MRZQcB7cb3p/iA41z21DXhz2Zasy39HTjWYHE7DEjeMKsbjIZVzFv/OQHRzvty4uCRmaSJNZeErsXWS2RkBRLVOlcCYT9XCrWMUBdSxMoZK2ia5csnr2ptW2XscdkRq6I3iTRh63lGCYoeE2U4jZOw8z611S6VO2tdQMi3rb33Um8KMlIKnrbk0jLoHOdRY7x52ZuTHQDSJ3y07usVs0BOsSu+duXxrJP4GY1wvDSuyBfTSwylWM7a37gLowLwgbpkOmmKzcz1tTaRe7eHki1cYwSBTtvtYPYGHgUAI3hldDiNU2ev9A0FEXfgIcWfRQidFOEyyVSGSlQuy5AZcPK9XnTK3HwaEIfh8lhVBGlpqace4kWgU8PmAhs0lACO7p9toiaBBID92zEyUuUAibLFeZZCc63AM4Je6hBcwu4uiOWfAImbQEiIF6WF0wsZcuBMl8ifvi8ImjshZ/+RTsHV0yBqw5018EvkI2UR1pdJoJaWuL6zdQudkQhqFlqdyw3SWXCLw==
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(36840700001)(478600001)(6506007)(8676002)(5660300002)(70206006)(82310400003)(54906003)(36906005)(52536014)(356005)(26005)(55016002)(7696005)(81166007)(6916009)(336012)(33656002)(8936002)(34070700002)(4326008)(4743002)(9686003)(83380400001)(186003)(86362001)(15650500001)(2906002)(82740400003)(47076005)(70586007)(36860700001)(166002)(316002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 13:16:13.8693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a67e5231-0f6c-43ca-a70e-08d91ac8475b
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT048.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB1955
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jayashree D <jayashree-d@hcl.com>,
 "geissonator@yahoo.com" <geissonator@yahoo.com>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2964615B56B0CBB56E27B41FFD2B9HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi All,

          We have implemented the firmware update for bios/CPLD for our sys=
tem.
          So, we have submitted patch for this. Please find the below Gerri=
t link.

         Openbmc-tools: YosemiteV2: Added firmware update support for bios/=
CPLD TESTED: Tested and verified in yosemitev2 (Ia7deaf0f) * Gerrit Code Re=
view (openbmc-project.xyz)<https://gerrit.openbmc-project.xyz/c/openbmc/ope=
nbmc-tools/+/39341>

         As of now, we have submitted the code in the openbmc-tools repo.

         As Patrick suggested, No recipes are pointing this repo.
         So, Could you please suggest where these code and scripts should b=
e added ?

Thanks,
Kumar.

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

--_000_HK0PR04MB2964615B56B0CBB56E27B41FFD2B9HK0PR04MB2964apcp_
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
	{font-family:Latha;
	panose-1:2 0 4 0 0 0 0 0 0 0;}
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
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; We have implemented the firmware update for bios/CPLD for our system.&nb=
sp;
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;So, we have submitted patch for this. Please find the below Gerrit =
link.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a =
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/39341"=
>
Openbmc-tools: YosemiteV2: Added firmware update support for bios/CPLD TEST=
ED: Tested and verified in yosemitev2 (Ia7deaf0f) &middot; Gerrit Code Revi=
ew (openbmc-project.xyz)</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As =
of now, we have submitted the code in the openbmc-tools repo.<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As =
Patrick suggested, No recipes are pointing this repo.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So,=
 Could you please suggest where these code and scripts should be added ?<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar. &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_HK0PR04MB2964615B56B0CBB56E27B41FFD2B9HK0PR04MB2964apcp_--
