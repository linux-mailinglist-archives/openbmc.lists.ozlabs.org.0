Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFCF38E7E4
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 15:42:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpdgP07rHz306T
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 23:42:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=f+/co2W6;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=f+/co2W6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.95; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=f+/co2W6; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=f+/co2W6; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310095.outbound.protection.outlook.com [40.107.131.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpdg34tmqz2yWy
 for <openbmc@lists.ozlabs.org>; Mon, 24 May 2021 23:42:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs1T11EFZXFvJ56VVDHWHTHEG4MUGZGu3v72/D+OqiA=;
 b=f+/co2W6BpkjBPZaKia+aCmJQEKMndif59Dh7FL+hqRhMhx/rnv90Ysjtz2Yn9BHmPl4fyLon/qM5yDStnMVtdNNknmF+UD9oGJyVKF3QhjED/h3yXlU1YJubrDTAv1HKx4PBT9lCufiHyFpwazJBkh6FrtB3T5Rfh3WaVougPa/LZwB6/dkzL2ZbU3a14gaj/6kDnIYOrzCYyZRjyhWcZO/bm0sf0gKa8acvyGf5Cqf3l/H+3oMG1QnnBYomp2I31gbo65ZUVq+3VjZONkHaoIILLV9Reg9ta1qkD1H4MCcf3CQQY5pj01VoitO1satDaJjt2DOpNDbls6LUplG1g==
Received: from PS1PR03CA0021.apcprd03.prod.outlook.com (2603:1096:803:3d::33)
 by TY2PR04MB3245.apcprd04.prod.outlook.com (2603:1096:404:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 13:41:56 +0000
Received: from PU1APC01FT061.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:3d:cafe::2b) by PS1PR03CA0021.outlook.office365.com
 (2603:1096:803:3d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend
 Transport; Mon, 24 May 2021 13:41:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.51) by
 PU1APC01FT061.mail.protection.outlook.com (10.152.253.24) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 13:41:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbGQg7WUKZXyafg54fTuSI+mcBu+XNfs0WoW80lAr7f5+l0hzRee0u1sItq7roFtNtp4l/uuFQw+oOxac5zgsT4GxYRKO8ZxSS6NqttzFJOYrIxnkJS6BAZEbDfQ12M8Y5zQ4DxQ0WtWSPVY6BLrjP+BJihF4uCmG+LjP/CIeRO34STpBzbk4sNpS9ibrwBK027At2bewdvlGZOFRMad4UGOXfWAa/+A76duDR9rJh9Fp/etwlpD706sfdS1vRI/FClzLV2vCjtmkzhsxjfVWSXG2pk1aMP8avjAIUTmeY3yjRuAC4xCXJe5atOJoDQcRSf2pksJJ7JEGRR0qYS0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs1T11EFZXFvJ56VVDHWHTHEG4MUGZGu3v72/D+OqiA=;
 b=W6zTsNQaaaHfjcCzLFRhKlKBWBMsiPOQuai6LyquOnqws9lUulSnImV5zrX6aE4pmfV1RlcpLdaHXtTvgIbXRsVHBHU2SsUi9KYbLfOKZ0H6Yh6V6yGedesbXzzOZyGWnCpAGMvicLaLsE/Vi6Y/MFsMNLX3H8wLmC/YhRTUDEu8NL/Fjje0vRXVYlkoUV/WBxyUjoe1T8oXzGxsh7cFfZ2XEL+f9qqvJTqJidzAMFnxAwD5UjZPonZ+VYlHa4qU7+fnRp5RaRGCewnk9Edc9j9qCi4ae+a85Ah2j7HsvaNjGBSko1ahUP3h7/EQdvhcY13BLcJC88rD1+hbRzfAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs1T11EFZXFvJ56VVDHWHTHEG4MUGZGu3v72/D+OqiA=;
 b=f+/co2W6BpkjBPZaKia+aCmJQEKMndif59Dh7FL+hqRhMhx/rnv90Ysjtz2Yn9BHmPl4fyLon/qM5yDStnMVtdNNknmF+UD9oGJyVKF3QhjED/h3yXlU1YJubrDTAv1HKx4PBT9lCufiHyFpwazJBkh6FrtB3T5Rfh3WaVougPa/LZwB6/dkzL2ZbU3a14gaj/6kDnIYOrzCYyZRjyhWcZO/bm0sf0gKa8acvyGf5Cqf3l/H+3oMG1QnnBYomp2I31gbo65ZUVq+3VjZONkHaoIILLV9Reg9ta1qkD1H4MCcf3CQQY5pj01VoitO1satDaJjt2DOpNDbls6LUplG1g==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2282.apcprd04.prod.outlook.com (2603:1096:4:4::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.26; Mon, 24 May 2021 13:41:51 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d0a9:a582:66d3:29c3]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d0a9:a582:66d3:29c3%3]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 13:41:51 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: SEL Event logs in Redfish
Thread-Topic: SEL Event logs in Redfish
Thread-Index: AddQoVH7WtNx+xahQeqRuW6UxLfaMg==
Date: Mon, 24 May 2021 13:41:50 +0000
Message-ID: <SG2PR04MB30939A6EEB04348FF51EAC5AE1269@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNjZkNjExNTktOWIyMy00NTBiLThkYzUtNTQyZDU4ODYxNjkyIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX0MwbmYxZGVudDFhbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImdoaFVqWXJUenpkXC9cL00xRlJTdkptQ2JpNmJVd3grb3Z1bFhEXC94WjFRSWhUMUYxZjRLTnVoaXhwYnNHSzU3bk8ifQ==
x-hclclassification: HCL_Cla5s_C0nf1dent1al
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.208.137.88]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: afbeeff2-d0ca-4d75-e713-08d91eb9b1de
x-ms-traffictypediagnostic: SG2PR04MB2282:|TY2PR04MB3245:
X-Microsoft-Antispam-PRVS: <TY2PR04MB32450CC4E92D59DCCA1BBA8BE1269@TY2PR04MB3245.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MZULeSYAT+EJ3Y5lBKDngZI1RxifnB5DwbAV2ApHtY6ADA+VS4UDPibT0uFeLmxoqpwJhrvGSBIi/ZGdnSjZDSCf/LjTlcEuqWh/4CRw38hova6w8bBvPnWCMLVj/LTBRqzQK5FDpohB0/6HxAQ3RytrOJLzDXcmj2OAqtVJLOULw9PTFdeCDfes6m0hNR/bgn8n5iWioEv3tS3ym6uJtIvYYe4xsRBn/ttqecaTRTfDZJtdOqNshevQl7oOt8p5zT48kDLtpFriu77YOiwi8gMFwwYoKm3FOQXgGdOoadpOXYRv/GliwwfwPEmitu2cH154j0rMVoRDCuFz+dv8X/2wM3Lbh7FqBAuzPsuG5qXkjycckYuLNdvxECrprdA2citFVVbCK58e/waj1hHIhVynvSJXx1YzBjss63o8ZeAPok2dfPfVizumr5K8GjNDFltXE6efyEREd/PVuUuMYlPkwd1pn4j3AyYLzdnsiSBQqyINsIACdphiKsUw314l2oOU0tNCvIfwTQXiRxI+C3yYiykmBqo+D3fHSkqy8/u2FJR5moPrhN7t/ZtT2vhdssTf6Y8iEo9+Q3qVyF8hxFY5c2gJw/yadBXrEdLKRt4=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(186003)(6916009)(5660300002)(38100700002)(52536014)(6506007)(122000001)(83380400001)(7696005)(66476007)(66556008)(66446008)(64756008)(33656002)(71200400001)(2906002)(86362001)(55016002)(9686003)(8936002)(66946007)(76116006)(26005)(8676002)(316002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qxZPxJGAldDQJuoaV+Ff9ZYbGNT9a/z+FPz3vNgIDNWsU2woORl4A063Twlo?=
 =?us-ascii?Q?BG/1VH0y/DyL6bvktUwJ0nHum9QzWhlvy0DWcFBMEz//dVtuZtwny6FRj9xH?=
 =?us-ascii?Q?hpNbojIERr74Msko2GP8FWjdxazbxenOgb2Dyol3k4Pt67GGbANoa1K5b239?=
 =?us-ascii?Q?nBJ44vd3XsOubSqi12lE1F7x8AeNLbs1Tpeo+XhaGUCF3lCXrZn5WP/BYZPY?=
 =?us-ascii?Q?rb9VKIR8PYczoatGdeQk+4XMKhLFiMj+Aphkn4qodG1ZIq17KnFaFBgUkG6P?=
 =?us-ascii?Q?kJcgE+KkblN7brMfGLytJtlRxjTx3aG3brkI3qTPVnV0xcGeggq0hYbNqeyB?=
 =?us-ascii?Q?roZFmrCurdXHQ+FmkSsH8EzBWWaNcXrw+jQSOyIxkpuWQz1EYbCP4KLuU5ME?=
 =?us-ascii?Q?fju3dXlt6sxNJkWO43eXx26ZbS4EPmQRhivPQ8Hj4IkNKt1vJQgZXDzwC1m4?=
 =?us-ascii?Q?K2rt58gCmDDq0Ry4wTL+y+gK8ApXhdzDI3EqMoHRZmZlA9R/CSdPLMAPItoL?=
 =?us-ascii?Q?VoU85yCpMlbm7IqCA0paX+uSS0N1IWOua60q7OLFiTh1nzC+OjXvcG4gtyV4?=
 =?us-ascii?Q?6B2MkkXDxcNJdS2C34A+tSsPoU5n1JGTCDBaPR3jSZgEXzdtYw3itr7jotp/?=
 =?us-ascii?Q?yCJ6PsppQQME2t97l9v5Gskgp6cNUiWrAHLNTdiXFbJAYQFXeYxB/YHiDLDe?=
 =?us-ascii?Q?Js9wHpR6A6WLGySC8MK9oXgCudp0w8Ewi217VoEZjoZAk8mx0v/P4NhQ6NPO?=
 =?us-ascii?Q?3N8IC7t0gglYxEtW28lQBLUgZtx+JMIMQ5ikZl+nORCk5qQG5zUiBNHi6vx/?=
 =?us-ascii?Q?U6ryEygyXeSKdhKzTUdm2RQDlLGlYhpEFy7/jDTfrbmQ0omDSaURBbiTWhYq?=
 =?us-ascii?Q?9eF3S7uugaCJmFsc+vajhtEbImdQmyKfUi9BaLgStGp5d485KsMacgbX2wVV?=
 =?us-ascii?Q?T5nfQH+Dx+KAboCtVV1slo/5HkcAPIsuq6tf+JsdJl1UakjjkOGwFnhzNVVU?=
 =?us-ascii?Q?PkQT2REAhddyg+rUqbJGKBd1PrDDfZpCKutl5afHRzsHkT3EXp8KpKvUGBhk?=
 =?us-ascii?Q?0nWGf3tBTGiS6qF2srWLY/VYQIToe0FfUGa8Krqu7b/0nA2+XesCR76WFSRz?=
 =?us-ascii?Q?tdeiOrF7NQpFgLpl0ceFhbwOL7oh+uYiP1Unjkkz43SxssFrQRDucfSlFTZI?=
 =?us-ascii?Q?29AXWo1cGwZ3TkAS8lp8PfI5SRGTu+jLReOCKZ3Y7gvdFzNNGoiATPnv6N+z?=
 =?us-ascii?Q?ePO+9VT2N0lgUqY63nksJMGH2V4Zu62qVY8ZPMxjlodmbFlaix3eZ3FK9sPe?=
 =?us-ascii?Q?WBk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30939A6EEB04348FF51EAC5AE1269SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2282
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT061.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 098ac093-3f76-4077-58da-08d91eb9af68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GGgUyVbl7Gy4ygOD7mhabx9MW5jMlaUnKyyLWNHm7K0aP2PEZi4uei1Qq0sMzXVOxXClxXNiCoZ4Ra4V1aSAgsY/tvroZwrfo/d4Gtb/F6rIqnrQ1ewcfXYtnQjGXfVlSxyroqpniQYpIdKSyp55OUtr7iIJAWzeGgPsZQUNqzFiygin2BrbgllkVbZfNrYzW1ymTPX5Z7ph/QLImXJziHn5uB7BPmtTHQAFvXiUsYumMSdgdjpCga1HPGncg5VgvaYauFyxuXB0dt3FURV+rGuDiJ2Cj/rwUguy2HtOzNjDqb8Hq0y2NEUJoahctbFYwtrsepNxpP4MKwR93EVzf89rc9hZsaPnXHn/qk/YrKH7tKyGeSSzwVLr+jDlA0zhNG3uRKJ4pULipDI9qVwg3GJ69G3UDMeCIogBhM5VW4ds8pkgjgmSpHNgV0dfLmTsz/NMVMHB8+f3k+OBOxVVNx5SMhYn07lV7TYJK2SkUbAVg/HybsMpT+NMbJx4a0GS6BupcQyX5sECBQR38ypC3algev/Ujk4cz7BEw1XgOXmPX/Ly2m25X4sxPDUhDctbcX1VwO3fbrFs/z0EC2YfVOglxVitDDbLARTSnvurgGmGlijGAPfYdcZ3R6oOLwIEbetEB1UhqBYj4DQArj2I5JSE7Jg1dV3YCEReyiUvYUiHK8N8Nto47NVtQUhbs6UUUMmBg5cOahH011Vtrv6jkt9eXv9KPRbfMTAwQ0vhVn4=
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(46966006)(33656002)(478600001)(36906005)(82740400003)(55016002)(316002)(47076005)(26005)(8676002)(9686003)(8936002)(81166007)(6506007)(34020700004)(36860700001)(336012)(82310400003)(52536014)(2906002)(7696005)(6916009)(83380400001)(356005)(70206006)(5660300002)(70586007)(186003)(86362001)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 13:41:54.4957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afbeeff2-d0ca-4d75-e713-08d91eb9b1de
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT061.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3245
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB30939A6EEB04348FF51EAC5AE1269SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Confidential
Hi Team,

I need some clarification on SEL Logs.
In SEL Event logs, when the error is injected manually , I can able to see =
the error logs in "ipmitool sel list" command.
Whether it will also reflect in Redfish API ?

Could you please help me in this.

Thanks,
Jayashree

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

--_000_SG2PR04MB30939A6EEB04348FF51EAC5AE1269SG2PR04MB3093apcp_
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
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I need some clarification on SEL Logs.<o:p></o:p></p=
>
<p class=3D"MsoNormal">In SEL Event logs, when the error is injected manual=
ly , I can able to see the error logs in &#8220;ipmitool sel list&#8221; co=
mmand.<o:p></o:p></p>
<p class=3D"MsoNormal">Whether it will also reflect in Redfish API ?<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could you please help me in this.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<o:p></o:p></p>
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

--_000_SG2PR04MB30939A6EEB04348FF51EAC5AE1269SG2PR04MB3093apcp_--
