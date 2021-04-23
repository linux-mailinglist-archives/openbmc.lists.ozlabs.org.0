Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74512369416
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 15:53:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRbNp3Jx4z302g
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 23:53:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=utQR3UkI;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=utQR3UkI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.139; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=utQR3UkI; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=utQR3UkI; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300139.outbound.protection.outlook.com [40.107.130.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRbNV5Fphz2xYd
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 23:53:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsjeqynLIzzR2ofRLawVWoAcTwH0KpWKT0rxT/FGREU=;
 b=utQR3UkI+XaUh5qetqsqhpklGOCU7OKadf9iwib432pQJhfeW7Pzr6X+kyQGJHpSwHfPstox59aT/j/gAg5AvBIXgH6oOGpcO8D6e+xgW2Fdpn+t0FztrXJcSJQltBhH58zNv7OZEwDzvh3/16UCev3XLB1JXGILvaSiVCT0iauJD24tPoV5/G1KZWoJI3bG1xffnt4ti7S6dMAblvXD5XIAt89HfispUQ7RtllMsxuTpc4y8HrdCcP9zJd9O9WlQk6nIf8hS+z8ZNgdhWFOzeEfSP7xFW+ke0U8B2ULHKXGiDR474U0EZ0gHBbcPQhH6thLuF8GqPA99dowtFlXXQ==
Received: from SG2PR02CA0099.apcprd02.prod.outlook.com (2603:1096:4:92::15) by
 SG2PR04MB3256.apcprd04.prod.outlook.com (2603:1096:4:6a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24; Fri, 23 Apr 2021 13:53:02 +0000
Received: from SG2APC01FT006.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:92:cafe::8d) by SG2PR02CA0099.outlook.office365.com
 (2603:1096:4:92::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 13:53:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; stwcx.xyz; dkim=pass (signature was verified)
 header.d=HCL.COM;stwcx.xyz; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=KOR01-SL2-obe.outbound.protection.outlook.com;
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (192.8.195.59) by
 SG2APC01FT006.mail.protection.outlook.com (10.152.250.165) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 13:52:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHpCGUnCrKKd13eH02ASKx0QPJxM9ksdXqHGN2Q65DfjMf+0E3Pag7K6FzopVBWdE90nMPOtYa3E6Sb4B+MMkzDSAttla1OgD3JFDTPCU4s/3+ygn9bZ40y17t08fpQ8DO7t7YS8r6pcoklNwrY3X7GLu7qgJFnUYXp+GMqAum+gfVUGSeF3Qx/ReQ3N+BZgx0WOZtG9dB9oCAm/ZOgW4YCRHWvhGFyv1cjZQUNfBYr9PvJfUPzXfeiBZLCDRYT5uVAAUi43ajL85Bmuw2BV14tsHRlSkvzPq1VD/Fkuk6QNqwCK1YCk2Qpn2fyeHqYO8S8J0ZyYjWJcqb0KPujV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsjeqynLIzzR2ofRLawVWoAcTwH0KpWKT0rxT/FGREU=;
 b=YBPKJhjHCTytmGw8n2EHHbTC3tjFCpIWgaHiBkIgFj/fSxwqO4p/B3xtS9M1aKZEVItMQXCtX7IE2v3P1PxDRsuJPwPObJaR5Gg9bModORZejOIdDdOcaZxTt0OMtEnsa76posxKC1a4pnXUqbNirvR6yzfh2jSkoNatEX615X9aY19XjrxJ6tGKUwRiE2jhSADGkUcFCMBfY145JghJEAWdQuDqUBMt5ZhxLkSfLSrvVIChqcf/VMBc37eUneU7O2w0duJC1/PfJDalSuW42aXkjaITZd1PBOBL56CHJ+jbC6k2USVYgKYptgm8RLx6i9GqGLrCi9i+JwC5iBINRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsjeqynLIzzR2ofRLawVWoAcTwH0KpWKT0rxT/FGREU=;
 b=utQR3UkI+XaUh5qetqsqhpklGOCU7OKadf9iwib432pQJhfeW7Pzr6X+kyQGJHpSwHfPstox59aT/j/gAg5AvBIXgH6oOGpcO8D6e+xgW2Fdpn+t0FztrXJcSJQltBhH58zNv7OZEwDzvh3/16UCev3XLB1JXGILvaSiVCT0iauJD24tPoV5/G1KZWoJI3bG1xffnt4ti7S6dMAblvXD5XIAt89HfispUQ7RtllMsxuTpc4y8HrdCcP9zJd9O9WlQk6nIf8hS+z8ZNgdhWFOzeEfSP7xFW+ke0U8B2ULHKXGiDR474U0EZ0gHBbcPQhH6thLuF8GqPA99dowtFlXXQ==
Received: from PSAPR04MB4726.apcprd04.prod.outlook.com (2603:1096:301:92::11)
 by PS2PR04MB2693.apcprd04.prod.outlook.com (2603:1096:300:42::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 13:52:57 +0000
Received: from PSAPR04MB4726.apcprd04.prod.outlook.com
 ([fe80::696e:7092:bd9c:23a2]) by PSAPR04MB4726.apcprd04.prod.outlook.com
 ([fe80::696e:7092:bd9c:23a2%7]) with mapi id 15.20.4042.024; Fri, 23 Apr 2021
 13:52:57 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: Patrick Williams <patrick@stwcx.xyz>, Andrew Geissler
 <geissonator@gmail.com>
Subject: RE: CI build for yosemitev2
Thread-Topic: CI build for yosemitev2
Thread-Index: AdbXrZNZbSyzw1j/SGC/V1p6jAc/hAKiyMIAAkJSCoATQF7+AAABE8og
Date: Fri, 23 Apr 2021 13:52:56 +0000
Message-ID: <PSAPR04MB47265090C4623F9336F1970BA7459@PSAPR04MB4726.apcprd04.prod.outlook.com>
References: <PU1PR04MB224835088E75178D9AB64B85A7C00@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <4C410766-951F-4543-AE09-BC3F31197F5E@gmail.com>
 <20210115132613.GA47865@patrickw3-mbp.dhcp.thefacebook.com>
 <YILJsgzS9otvmnJL@heinlein>
In-Reply-To: <YILJsgzS9otvmnJL@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiM2Y1ZTYzMDQtY2Y5YS00ODY4LTk3ZjAtYzViMzJlMDY4ZjJlIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InBUYUxRRStrblpVQXNoSEVLTzl3OEt2QThPdW9LTUMzSEhMaVFOdTJ3RGpvd0QxUDBuejdReXM2RDNKMU1lK2cifQ==
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [182.65.123.255]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: dd94650c-5f99-42fd-ca8d-08d9065f1c2b
x-ms-traffictypediagnostic: PS2PR04MB2693:|SG2PR04MB3256:
X-Microsoft-Antispam-PRVS: <SG2PR04MB325652798CB05CE9A458073BA7459@SG2PR04MB3256.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: SAXS6cQlW8HzYky157/qfQKDMFXrRBJpRlYblkiaqCEU8ynhU99KqwcoXmYJzoQaxcYuBs+MzU6sMg3JLpco+6SKx98p43rjJu+LV1azvT4E+ZkqcGh/D/GFNz5UaWGxKzaBwaSfkWlqWjw00Ptr0JoqzYW5wL1AoDDek9CIOrq2d0xGVt+UajEel4piLL8vZc1vQCjf/FAHGz+lr65HME5Ev6XHSPL+fyztTeqAFgmrpZIraZJjI7HqK+hrQuZrGSpIixOugeaFHVBttGFM2YrA95VRMC0HM3oAfKNLsckxMv5oNcnDy9YTz7AM3AXqQ9Yfn/BCP8ot/aDXvxdqMadL4rgEitqU3a/zP2Z3mxNpZ3eZC2LQpgJVQgxBLmBvTRkXyPId5v0S8l6bSTzflZslXR9aVdDjpSQlewR6OtlsT5sSnRVwby3h7yLk08c/AYjw4QmZ1g04oNHdxmTM+diRRAqBQXdGdPf47iwir+3OUJY5wn+u6rwvHSv0baM2YKiTwj1q9a2QH10GRHtZn9VxU4xgP50W9Rg0swRz548SprUZmdc/hi5Ffe88SCuhF3dLw36XoUdx/Qlr+GItwz91hAtIwAX3JPXVeDMHF0Y=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PSAPR04MB4726.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(54906003)(83380400001)(478600001)(110136005)(86362001)(316002)(52536014)(66446008)(5660300002)(186003)(66476007)(26005)(66946007)(64756008)(8676002)(76116006)(2906002)(4326008)(66556008)(33656002)(8936002)(55016002)(9686003)(38100700002)(71200400001)(7696005)(122000001)(53546011)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?O6zqhLBvOaYL5+97I0q1qanqH0HODRQF5aboWKY+uCIHGW4ziv83idw4jEeB?=
 =?us-ascii?Q?QHvU/TkmiVDrqwGHKHbWE4nwuGTNnfezTo3btyGa4f8h7/SwF5g1crUjzLsz?=
 =?us-ascii?Q?Qq9GVwRRl3tmRptcTSP7IVC6/Y6hMaMkCn2KxZTJqGXvUHnWeWHM9To3nTjq?=
 =?us-ascii?Q?DhYCusC87T9CRvxysCdyU89m3rXzfomXF5ZSog5nTuYKaD4wXV/KyJOgL3TQ?=
 =?us-ascii?Q?fqaUbT7ZRwFbNDFJ+idzr6DhHEDYxr24p9fTpArPLMD34xxHX+8L2K2ZGEhg?=
 =?us-ascii?Q?cf3f+t2sWmsGLUb15m2iYjzpnmgEReJbMsWC3zQZGz/I29SzJCER/bFBxvDH?=
 =?us-ascii?Q?ZFJA6++y3avii4YHaU5TrJ6OgX1gTce2WWyda465CjfG8x3ayy+U5G8oeZbD?=
 =?us-ascii?Q?X9WHL2PsWgNDnxBINJQh0V7LTH3Fv9+T61rFfQx1/XOXZbokZWE6NBrxbZsF?=
 =?us-ascii?Q?fMJKBD9l0bNnUZQMp7AL7p8othzA4todqlVOo/8z2KML4bYW/Snw7/YCz3O/?=
 =?us-ascii?Q?dX9AYc2HaqPUEKvD5GPYGkNuou6czp5BH+w/I1MM2AT/E6RgDbB9Uh5aX5f9?=
 =?us-ascii?Q?LMMvFWLgiOUm64dKWRRDmnoxPNA5rmbZBVYkUx13SCQrbX4rdQHkziqsNAJO?=
 =?us-ascii?Q?q1VowozBdBS39FTsFaf7Xc7okmdU2VkFdyuTOg/muJBtgeRfKmePZSdCH9XA?=
 =?us-ascii?Q?dCvtRl3ApyLQwuZTt5/u8PKstKDWH6TrCinzzOQp9YEgtCbf3HvYXcP/Oi1t?=
 =?us-ascii?Q?geagOa1okqwUJS2oDrkmdxnH2ikGDGpdgcjR7FZ16iUcBFyIYanp21vLTftM?=
 =?us-ascii?Q?v7LB6r5T24v2oG3Hqh2ryNOY9NufOQyO5Kn6qXvB9oNKVCqQrVfkQWxk6gpX?=
 =?us-ascii?Q?pKHOSwM1daN10kDnd3/EY/aEiuRs44f39WLH8VhHPZSwm0hyC8m6Lb6xG7d1?=
 =?us-ascii?Q?sZHurVvoPTXX1jiN7EBIabEBrnFxDFYtdh/qT5+tbtP3e3gDMv4qnCnYydLU?=
 =?us-ascii?Q?HV6n8bKoBN6ItQ3s2gPYwafHk+dGDHd2yOtoxPvXtQPtKsmFoKmAZyyBXanA?=
 =?us-ascii?Q?T9Dxwi0mZnyLMty9jnPiuH2555TTuJeQFa1Ii9zI3r63T0QBk8dVQek9K5xl?=
 =?us-ascii?Q?hii5o3s/TaLpoLm5WO+LD7uUYwJpO3vr5hPM3G1UnDdJzykt2Pz2yTD1ev8W?=
 =?us-ascii?Q?zcgqT5juDyf11V97EofUQLZb+zQqKexrjalNqQLEg8qGrqH3yY/Bd4FNGf9S?=
 =?us-ascii?Q?iede6vV4eD0eEzDPZtEHdzafxbG1x3RZuMXSXPkC5eqQY//T3gQ8DgN+eNCB?=
 =?us-ascii?Q?6s2ttsv+73XwCr6/wtt3hbXb?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB2693
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT006.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 789b4308-67af-449c-1ff2-08d9065f19a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jyu+kvdNCmfzgd7uWY44Mof/D7WWAMaKOjmtVvjeRuQsOdyyzotpZNGxsMOBvEEuqeFG1tQVBWffuh4wqEPCEMw542zZGTYGsUwLUEnQTNSIiSuY+Nk27Spcve3csZA2dwYX53KIJ5ZHxptISBSWBO8rYjeOvwbqJFjmsGztPNZZe+t2zeXvLEWwNNqV6f43F0n9DlmefHlthhyaztHQVgKFiMMQydCHL7DR/zmbhApLBtKiyAFqMhavqd5TyLCIgO9XeoLnQNL4X9tzkJvZH1s3rFFC7olIL3oroIiQ9gxWr1PNtIsSx1MMN4vH0oee6xJnXZFXNKzr13X7iDWRlfecp8RKVXJZ3JYVmJ/fPqHrPTYdac08YLLGSqTye+KTe60UPcsJXJ8jJX1w5OQTYerWwo9lk2Kbmbc+LEM1LiEZSCBbpwlMorHN4db0kNlkGsDfpP6AjBryKOHhmh8jlgYD1pRwZcR88anEOiu8ab8cQVV0IUQWpcElBnKUMg06ss05dD4fAqHBAB4LTaKT39HeXsKUFzC91P0SwxWb/OORPuhh+GuaiLyTx5N6Z316bhof9BXf0pfYVFIs1rv1oHHjMRxHoL+oNL7MPmvNjurpCM1dlUfztjcnkGMDb1EM9JI8ZUvUpjeZH3vVl3nSbiEPRSL8LoX/07QSVhc7PI6hnffLQeYKQfAXwyBiOypsPhxvAqIpMXFmYD0s2rVknSgOypdhEWDynB20YDpAMH4=
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KOR01-SL2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(46966006)(36840700001)(316002)(82740400003)(6506007)(86362001)(356005)(36906005)(81166007)(336012)(83380400001)(47076005)(110136005)(54906003)(9686003)(55016002)(53546011)(7696005)(8936002)(5660300002)(36860700001)(8676002)(33656002)(4326008)(2906002)(26005)(186003)(478600001)(34070700002)(70586007)(52536014)(82310400003)(70206006)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 13:52:59.7255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd94650c-5f99-42fd-ca8d-08d9065f1c2b
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[KOR01-SL2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT006.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3256
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Public

Thanks Patrick for the update and enabling CI for yv2.

Regards,
Velu

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Friday, April 23, 2021 6:51 PM
To: Andrew Geissler <geissonator@gmail.com>
Cc: openbmc@lists.ozlabs.org; bradleyb@fuzziesquirrel.com; Velumani T-ERS,H=
CLTech <velumanit@hcl.com>; Patrick Williams <patrickw3@fb.com>
Subject: Re: CI build for yosemitev2

On Fri, Jan 15, 2021 at 07:26:13AM -0600, Patrick Williams wrote:
> On Sun, Jan 03, 2021 at 07:27:06PM -0600, Andrew Geissler wrote:
> > > On Dec 21, 2020, at 9:32 AM, Velumani T-ERS,HCLTech <velumanit@hcl.co=
m> wrote:
> > > Could you please help us to add the Yosemitev2 machine in the CI buil=
d verification.
>
> > 2) Donate a jenkins compute node to openbmc CI
>
> Facebook will allocate a few compute nodes to the Jenkins pool.
> Andrew, I'll work with you to get them online and integrated with
> Jenkins.  Once that is done, we can enable Yv2?

I wanted to follow up and let everyone know that this work effort is done a=
nd Yv2 is now enabled in CI.  Facebook is currently contributing 4 pretty f=
ast machines to the Jenkins pool.

--
Patrick Williams
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
