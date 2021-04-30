Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9B136F801
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 11:37:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWnNM0j83z2yxL
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 19:37:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=J0mTFkTD;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=J0mTFkTD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.110; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=J0mTFkTD; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=J0mTFkTD; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320110.outbound.protection.outlook.com [40.107.132.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWnN33qldz2xYg
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 19:37:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA7fkx7U7IM4Jdgoj6FNWWgh6ozQIERorVZMqz+kcOY=;
 b=J0mTFkTDatOHSwF47SfBcqPGSnHyzLN4ozCgibGVC/+BXZA8r3j8bw0BDTwAxJGoor/wbb2dsdzIc5BDu5++RoQMkwGt3YsbDOgJLy99o8WTsAXBy9/QQpreROuSPsxZt5d26F/HUVrsuFqs8sZiChNvxwkokL/REoPHqvJzbFcevdy/9OD3tYyflTBX/8SApaOpjuw2hPDQh/8svGZm6v0LsSW9RIgovxh5sa5SCQLnD3QrQgn+RisEf74rG5AYoL4lo6/YLAkiJ7yRkVSukfaN/HZyn5dTsJMx2t5qioTr2atuMR6rmBnqQu14wPU7JJPf8Nwg3kAV3B9smN78/A==
Received: from PS2PR01CA0072.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::36) by PSAPR04MB4487.apcprd04.prod.outlook.com
 (2603:1096:301:77::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Fri, 30 Apr
 2021 09:37:24 +0000
Received: from PU1APC01FT033.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:57:cafe::93) by PS2PR01CA0072.outlook.office365.com
 (2603:1096:300:57::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Fri, 30 Apr 2021 09:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.53) by
 PU1APC01FT033.mail.protection.outlook.com (10.152.252.223) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 09:37:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfbOiL9sTg2HuHr7e74vAM60SiZaRwHoilFyiZOlz2jM1fsUoenBEt47leN2Nj+boYUkrVy/1BKBi+VLE6O7BP3J+RUpdwLEIAL5t+CCpVTPekC7g3VmAZgb1meJENxCGwcUaa+aTnKnIEepCtzEdP8R4BfYXZgrqIaMW/tAL13oL2yfsoHXDc+Ky0xWBSE/XfR/14WWhMTlgfsSj8I+QF+lmQGYCSy/Ah6muRDBXJ8z0WZPouaEcd2H0GHU3XST8YpRHO3LelPhk24KPeGe+UxXZArsE+J0E6EEE1+TqJ7eMCuplot07my7A+lY4JnbiMa89UnyXXQUA8LpNkECcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA7fkx7U7IM4Jdgoj6FNWWgh6ozQIERorVZMqz+kcOY=;
 b=gS4VoeMD8pKYmMqur+gsd2TVvBoQFF2ugtF1hWLp6PQA9ysyi9vnJTpMYkewYUvjSIuz7hWMcx2jVArJmXQHzsjAxv660RYOPEekNUzcHbHu4WMaZRO8E463GLfiR4LVq6TRBMJ+LMUKVk83vk2hMYJbYdJkI46woYg/pBmdy6xKcAirt43z8FadC8dLr8ewdcJ8bSdBd9sfaeVwtGtXnidcl0QgSwSsUVYX55xFDWV1FrR1Vdie2MjggBj5SC5CGqjUa3+gAq9i77M8am7uWn26j5hsSbYN8hbNnXu0K++fljPRcyOkaMa5qDvH9/z53RkX6vEKkbIZpyQbRAx0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA7fkx7U7IM4Jdgoj6FNWWgh6ozQIERorVZMqz+kcOY=;
 b=J0mTFkTDatOHSwF47SfBcqPGSnHyzLN4ozCgibGVC/+BXZA8r3j8bw0BDTwAxJGoor/wbb2dsdzIc5BDu5++RoQMkwGt3YsbDOgJLy99o8WTsAXBy9/QQpreROuSPsxZt5d26F/HUVrsuFqs8sZiChNvxwkokL/REoPHqvJzbFcevdy/9OD3tYyflTBX/8SApaOpjuw2hPDQh/8svGZm6v0LsSW9RIgovxh5sa5SCQLnD3QrQgn+RisEf74rG5AYoL4lo6/YLAkiJ7yRkVSukfaN/HZyn5dTsJMx2t5qioTr2atuMR6rmBnqQu14wPU7JJPf8Nwg3kAV3B9smN78/A==
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR04MB3521.apcprd04.prod.outlook.com (2603:1096:202:3f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Fri, 30 Apr
 2021 09:37:18 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2%4]) with mapi id 15.20.4065.033; Fri, 30 Apr 2021
 09:37:17 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Include sensor monitor for our platform
Thread-Topic: Include sensor monitor for our platform
Thread-Index: Adc9o96EIrVJD470RVytXsEFBmz39g==
Date: Fri, 30 Apr 2021 09:37:17 +0000
Message-ID: <HK0PR04MB2964D4D925F6883DF2342D48FD5E9@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_C0nf1dent1al
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNzkyM2M1ZDctY2ZhYS00Y2Q5LWEyMzctM2I1YTA3ZWNhYWVkIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX0MwbmYxZGVudDFhbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlRuU2tnNzVBV0lQQ3cxQzBRRWR1N1QzY1NwbU5MVnJGKzNBaGdQZUJKT0FKQWE5dUJuMVg1K1VVenl3YlJZajMifQ==
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.211.243.210]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 695ba97c-51c2-4a96-8f2b-08d90bbb8e99
x-ms-traffictypediagnostic: HK2PR04MB3521:|PSAPR04MB4487:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PSAPR04MB448709F101674BF6EC77ED12FD5E9@PSAPR04MB4487.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Xv1Uavw8PH++nydZyG7f3ipidufOUf/dXsF2MSZqRT/OGRgMWh3vNRaa5WxBodY7PwHagFL+4iHu/tvJqp5F96VzXxK6jvdaAv58aYqYObw4f0Tffp8ihwCqY000oSAaaepMaeKCJKZx9pJDIsJJfg3TV6CMKUqLIX7K8krgWtFW3Abqbd1gHCnbUEi4dlN6/tmveOyY044k57HOQI7QLol50MWtlTdOyKGCXOlXoBVW0LTNmyEcqOkhWmKXIGMs+T8/Jm7tPfp4HAM+nt9iJ/femnXaR8M+A4DANy3vxGW6dfSq6K0uifjDCoTJS9u2IgydG3M4k8Wzuhje/N9CVo8HdaNkZU2PAOaVw7WHUjysJW/UnudOkvdbj6CoHIN0sW8ubGZqVdAHf4Iwp+GJKQtiU06oq7TOmXiIf1YcKbAzRKutBgWKJP2KemACSHJBRR9V+BexoJOdxBLHV6g3G6n25zOVXf3NTLdkk/8C/sezM3x7Xdx6IsnCpMqtv9GwNZlSkQv8eWA350GkmzjCsWPZLHgQkkW0YBuWBCL2PEhHpWCj/55ouI+xrk6ws78rdjXPSvF+TPE13OWQhP4EjYMmVpzZYPi3OrnRqnKq0L0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(6916009)(4326008)(83380400001)(55236004)(52536014)(2906002)(26005)(478600001)(7696005)(316002)(186003)(9686003)(55016002)(71200400001)(76116006)(6506007)(66476007)(54906003)(66446008)(64756008)(66556008)(8936002)(38100700002)(66946007)(8676002)(5660300002)(33656002)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wxu5BRlyTpu4/v7IeAQhsRWUImQu0rolhXF4s7BEq7u9/g6T2U2eycr0xViU?=
 =?us-ascii?Q?JmfGPKenkdIenqHgqpQiETD1qt/Uza6PBZh65ahcgqDEVQAa0qEmmcI6jD3L?=
 =?us-ascii?Q?V/nCAAiEJa6KkO9APk5fQtFGxPsKymXdw4lQMQz47PCMDOAz6ucZc/VgF0zJ?=
 =?us-ascii?Q?xdiwHBSgwnn7aQqAJguWTEjaP7fc40O+CxnpoJdQhmdQybL5WV3PkqIUagTk?=
 =?us-ascii?Q?o03Rs4QfwQtBxhj1cy6kOJT1oqGB5WX/U9tBB7BddvBonHfrooFR6XkBLeeE?=
 =?us-ascii?Q?vpFT7cZKmugnaX4m3qweVeWu27TiZzhFcFB+jMHj6RFx0EqPkfUaYm7K0Lto?=
 =?us-ascii?Q?GeTjWWnETIbhg06Ohgr4JP/nrmjR+gEnRAcnrdgi8TB1MM20xSh0L67ov9ss?=
 =?us-ascii?Q?j71dShRhUkPrP/lPt+g0yYdTt1XbfiW3gWrElL0rBmWrwSmSY22sgjbWrCZU?=
 =?us-ascii?Q?Td9lzbfWQDORlBvj9m1TT/Sep5rQrMcc45XKo61+4TxxrvB0TwXgfAM2m4rQ?=
 =?us-ascii?Q?15IqNoiaGket9Jga6SJnzYmrxrhyaV2FqyTwGyTo0uLJxlsH+4MvOUTQ43z2?=
 =?us-ascii?Q?5AxFKm65M//JokyM3pIHT5uIqcWbl9AoPCFkpxKiTufkGuOlG4XEu5DdYzH3?=
 =?us-ascii?Q?9atLaFBhv9aV4innXlGaYvlOZJ5Q2ax3nyWUhhX0SOkTxmGNvchHihBBxTrs?=
 =?us-ascii?Q?ZYmcQlssLpH903mxtVo8TTBaRIumxNyMGvEktD7oJsFLQIiOw84Gt4WBeJok?=
 =?us-ascii?Q?cPvcN35l7yDJX1h+eImyn4IZOsF04lS2JaZGTtopyljMNRirAnbLEYBVmyLN?=
 =?us-ascii?Q?A7VAj/rxrHV4DvDxu5vX3MbtbZAsc2wu7UIs03FNBPifVOJ6MnDAF/i7S9kI?=
 =?us-ascii?Q?NI+KIzrFPptW6el0v/fE3MaeAqm7t2Wwu8vxRY2dFweBoxs0HVfZtYM869Ze?=
 =?us-ascii?Q?FcbAWNG91k9GZf2WhjWz8Eork7EI0nKbMOQ0BNPylfuGUpnIYqKzS9dNLRJt?=
 =?us-ascii?Q?D4NqUIewGhvmN+itWCnDEJMpl6ZbTCJ2ZBNNk4BXZrvJ4Wty1Fck3tIduXyr?=
 =?us-ascii?Q?x19Hg+15lpISSIKg1TwR3OSJ7lF5d3bBLv2s3wW8t3FEGaYIJmJcwynKLqlD?=
 =?us-ascii?Q?GL64Wt+Mcyd46LNrMeG2hrSobFRAksBxAiOAGgJ/2rb8hewMnZLmzHGu1sA6?=
 =?us-ascii?Q?SIH/bo4916ipDsD0XRmXNS8+9zT0KIF8NEToveyht5//eoZGGryO4H/nKLnh?=
 =?us-ascii?Q?r08kTSottGpatdwgdfg4lARog4BozbT5apktHLWHFloAHXtKS9Y7gAcWQYZ8?=
 =?us-ascii?Q?ZykXUPW6UmAaoHQkoZUuvAXQ?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2964D4D925F6883DF2342D48FD5E9HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3521
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT033.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c42f662d-0a1d-46e8-2d03-08d90bbb8baf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vd+gJH/C0BaRmbdvsFsI+D/Wwu1fmafJu33xqAp7Yl5L1OX3soeifruXWJ91sPriY4kvqphIjPNwcN1aWB4u/Z8K+MlaiZJUjAGJ3hij7HEFsG6Ga0ImpBl64Oxsl7UC30ytQCYHdnfWGq0b/vltT0nQ4649tQvCqj7wHmytrH/v1rQguvTU2TvrGfq45uoFvKluynfmEouquo47oqhjRhMgH7pIWhngLu33WK/d2/wyLGTTkiaBftwAF0vfFSPiTDnYH9nAqzmkHgtj0GFI2ECHALuH4sI617yA2KmqVm3nBB2ArYM2anzjcyg7MGnvkMABOxXKCDVVHlDLn1wasA5dwGscJ/k9gK6OUzZRnZE9jofH81ysPdBBV8svQ5TaGnhk/5S/ScpyM92lAWSpZzlo4s8MrChXAqNYNnV5nPV8nRIkTKc6Tsj+LDJ/PMeqAj/Q7zyGphW+Qkqpx5hcYPIqSLrfh0JrXsdS4JV4sG6yCE5ihLXk1DkuvxecVda/YUGKgolC2+nknXQwlob3dvmYm9WhZsmIUsHLs5VHI4BfltvIxzNcd7AdkpAYF9xGfrOOW0Yd7jzMZ+1N1v+F+dNAAfJGKQr5EC7+9MbKlQD0iJ0r3rPvQHurJAiqc8HGfJm0t4Z2KUfzcEEajIYLzPvrtr3cca9HeJ6y9+rQdT7IeAaj1EnaIbBlPiYp5m5vj4NXSTS7nwDNFqKCC6Kq/h4t2hffi0FYljc36qSaCcs=
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(478600001)(86362001)(52536014)(55016002)(8936002)(47076005)(316002)(4326008)(54906003)(36860700001)(5660300002)(9686003)(7696005)(6916009)(2906002)(36906005)(55236004)(186003)(82310400003)(82740400003)(83380400001)(34020700004)(81166007)(6506007)(33656002)(8676002)(356005)(336012)(26005)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 09:37:22.2736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 695ba97c-51c2-4a96-8f2b-08d90bbb8e99
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT033.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4487
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
Cc: "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Amithash Prasad <amithash@fb.com>,
 Manish Kumar Thakur <manishkumar-thakur@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2964D4D925F6883DF2342D48FD5E9HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Confidential
Hi All,

          We wanted to enable the sensor monitors like "ShutdownAlaramMonit=
or" and "ThesholdAlaramLogger" to our system to monitor the sensor values o=
f our fan.
           These monitors were created under phosphor-fan-presence.

           We did not have any bbappend files for phosphor-fan-presence. We=
 enabled the fan feature using phosphor-pid-control.
           So, Could you please provide any pointers or examples to enable =
this feature for our platform.

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

--_000_HK0PR04MB2964D4D925F6883DF2342D48FD5E9HK0PR04MB2964apcp_
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
pan style=3D"color:#B45F04">Confidential</span></b><span style=3D"font-size=
:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;We wanted to enable the sensor monitors like &#8220;ShutdownAlaramM=
onitor&#8221; and &#8220;ThesholdAlaramLogger&#8221; to our system to
<span style=3D"color:black">monitor the sensor values of our fan</span>. <o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;These monitors were created under phosphor-fan-presence.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;We did not have any bbappend files for phosphor-fan-presence.=
 We enabled the fan feature using phosphor-pid-control.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; So, Could you please provide any pointers or examples to enable th=
is feature for our platform.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
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

--_000_HK0PR04MB2964D4D925F6883DF2342D48FD5E9HK0PR04MB2964apcp_--
