Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E29553B347E
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 19:13:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9mtf5TbQz3bvT
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 03:13:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=TRaCN0yl;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=TRaCN0yl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.97; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=TRaCN0yl; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=TRaCN0yl; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310097.outbound.protection.outlook.com [40.107.131.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9mtH5wysz2xVt
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jun 2021 03:13:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMHvaLkV67bHeZFQxhMymWcGcPa63oUwwcvIVzPePyg=;
 b=TRaCN0yl4SXEVThqZ7AC0ZfU7FscPw+wEeZOyanO6QEIkz8IuUxLOwQ1CRFvJSgD6YavI4WBEVRDRYIlZR6MyoupFhZQ08mH9jHifqcPvAAHaOxh57AuBCTHglEttzt/+YX0mtYgvJhXsESMpiJDvZrX2JIUARn+8eT+Um9xtqZcqvp16cBp6uMf7lyGUBtME4xKkMNg3LHoQZGgBpOzy6k+U70Cz1oopSARTJ3TR0O4IOdiAzfxEZ9c0RKzO3r4YFPRjQd2mMBIxPOA+ngxsM7sbpMwpadty7KjL6clNoVdM4EMVkU7VClCh4k2nG6YWbuoTkMUg388ufW5ORkyVg==
Received: from HK2PR02CA0136.apcprd02.prod.outlook.com (2603:1096:202:16::20)
 by TYZPR04MB5177.apcprd04.prod.outlook.com (2603:1096:400:130::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 17:12:59 +0000
Received: from HK2APC01FT047.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:16:cafe::1f) by HK2PR02CA0136.outlook.office365.com
 (2603:1096:202:16::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 17:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.51) by
 HK2APC01FT047.mail.protection.outlook.com (10.152.249.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 17:12:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0vJhqSjOW/eZs4PsTZZZruYy6bqVAEtjA7qqfC03j28C1UBnvQDmblWL7i/z6geGiGyTxM16d8/6FFRs5MW18FJP+S1Gy/x+EML5SSvwn2Nuzd/8NhfYN1fa3ovNJ9GgIu0s6QgIjiI886MCGvJtEj0x5QyK5qbYWLPuG0JuQtsrHMYqTAecSgeUh2gRcDBUCvK4wPFgvwxEZvPkbKttcjwkPT5z5Lfth/tbMjOSgfJ+zgClJTwOx1j1hJaQhd1aJ8joePfu97NZj93NZ+jHZE9v0d7z1i2uQv9jGQEn034TwsTkqfDIMgQ54Q2nyep7dvX+G2Lru55ndMkOW3IfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMHvaLkV67bHeZFQxhMymWcGcPa63oUwwcvIVzPePyg=;
 b=ZVPayguwX5dcbsOytrq4yMY4u2SvQc0oEBleNoKORc47LhJG2Io32Ffl3eTt40cjpZmeGW0+SMZvkCZ6RlyMpizk3bsEYAvXC7+IYXp2jUGsFkPiJgDMBFKu7CVxwcSXfyZ0hstS9c7GFZNG5F9thz46/b4H4AQQBMi6br57IMaLVBdqh5puIp9ckOI+UiKvUafGAj0kzMwtekZOa+UB6nylfEz522CIXmcXH5XMvhL8+PnMp3wgTih8Eg2fhOKRKMwOTm3K2lMCE0n1cTGH0QriTZISWgmRfAoNpNEJlZbLBkAIs825HpM8mxpFh686QI5LjNJxZazKjJMPRhJqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMHvaLkV67bHeZFQxhMymWcGcPa63oUwwcvIVzPePyg=;
 b=TRaCN0yl4SXEVThqZ7AC0ZfU7FscPw+wEeZOyanO6QEIkz8IuUxLOwQ1CRFvJSgD6YavI4WBEVRDRYIlZR6MyoupFhZQ08mH9jHifqcPvAAHaOxh57AuBCTHglEttzt/+YX0mtYgvJhXsESMpiJDvZrX2JIUARn+8eT+Um9xtqZcqvp16cBp6uMf7lyGUBtME4xKkMNg3LHoQZGgBpOzy6k+U70Cz1oopSARTJ3TR0O4IOdiAzfxEZ9c0RKzO3r4YFPRjQd2mMBIxPOA+ngxsM7sbpMwpadty7KjL6clNoVdM4EMVkU7VClCh4k2nG6YWbuoTkMUg388ufW5ORkyVg==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3644.apcprd04.prod.outlook.com (2603:1096:4:a0::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.20; Thu, 24 Jun 2021 17:12:55 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d93a:6771:3a9b:d411]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d93a:6771:3a9b:d411%7]) with mapi id 15.20.4219.025; Thu, 24 Jun 2021
 17:12:55 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: SDR sensor implementation query
Thread-Topic: SDR sensor implementation query
Thread-Index: AddniihthhcI0wJVSX62mHUtKfy5RwBkUH0A
Date: Thu, 24 Jun 2021 17:12:54 +0000
Message-ID: <SG2PR04MB3093E0EC673F8D5AEEEB7613E1079@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30932F39EFCE1A165A5F9A94E1099@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30932F39EFCE1A165A5F9A94E1099@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNjllNmVjZGMtZGZkZS00MjdjLWE2YjctM2E4NGM2NTE3NzYxIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlwvQ2pETVdnRlhoeW50REIwYnNwZnhFcG5cL1p6MDZ3dVp3QUFBZzE3R3lzak1JXC83YTdzSklVUmxNQzlWUlEySzAifQ==
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2401:4900:234b:b0:15ef:30b:96d2:d229]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 60205e69-88db-4c5c-ac3a-08d937335052
x-ms-traffictypediagnostic: SG2PR04MB3644:|TYZPR04MB5177:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TYZPR04MB51777776E634A9EF46DB4CAAE1079@TYZPR04MB5177.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Gj1VIq+H2xWI+Sq/t+vbHKRSxn/22VoZniqsIpyveSv9nB3F3em7yv3tle7+tBKLnXtDM82FvhslbqTEQhQCrCi4Vd8y0SjFaIvHUubzM0Nsre9WAhHyIakVZuISJ5M3Pnxk/FgScvgmvSnD+IWttfEEOCbiqNw9ayKUnxoCr4W3fL77o698/nxhMNa27F155jZa8FBlGj3LrIh1++fazzusMcBRHxPapHmrBRQ5tYe39wBT+jpDPT50TbcxWZvmt/HCgCmCMlhCwBTy4pJdoxvZ7Usv8n219ecTnJ/X63IetczWXjJsNrqu5JtJ5woeVNsnPOmfwZfcqDaU/xRp7/Z5AhTU07eJVzOfnRyrcadbmfWUd7EcMDrrr0D4rnryMdHWwG+GLBctKOlGYiRguxmCO2yxtSS9jWbAHzJI6hfFg5p8jei/hcxTFyUTLD5vrnuXgkmCFHSjPKEPxpxhy426aYqvNc14bOw5rXgF8e4Z2Lbb0zRyjIsa0TE84l399+rc0FVrQP+7SxPErCRPT4YmrI8Ow7hbHRokMrAtEB4J0TRk7/3XI9uKPtxpvrOF4ca5rUHq8AXxzzcve4pKjYXrZpXog9Iirx6qGjRQBaI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(2906002)(83380400001)(38100700002)(4326008)(8936002)(122000001)(3480700007)(86362001)(33656002)(186003)(9686003)(71200400001)(53546011)(66446008)(52536014)(8676002)(6916009)(7696005)(316002)(66556008)(478600001)(66476007)(5660300002)(64756008)(6506007)(55016002)(76116006)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Fh6d60Xpo0q0Ix1OanPEsnbUcPQ6uU74H85JmFhtGMjETbx8foO0sLoKqFQd?=
 =?us-ascii?Q?uX5zX0cEf9a7XNzAy8O7ztTczRq/xvGzIOHxJvHmXpLPaSSmLSYaifB24/Lx?=
 =?us-ascii?Q?fNrl4cEfxxqnWaEPLVebWyPHI8JRfrkxUc/+nrhU7E8SacPD6Q7r111vDV3z?=
 =?us-ascii?Q?rQBugYpKuA4c2tEb/I9fmMwcAf/d2cH3cqNR7ydzzu4tChxQWi2eBMg5AKVL?=
 =?us-ascii?Q?gyAYwue81W72N4WgMs/Y/ThuomCVyW58uGuApeulnSMQELGDiqlTkwUM9KL8?=
 =?us-ascii?Q?FeOoWs71XF+AjBVWi6Or8RleV/3vLctpIMu6E/3fPtpfd43LyzC6vrnM/Cwp?=
 =?us-ascii?Q?6K+wxUT1ZK4ZKAS8jyIUNGHxn+99E8EbdeQG48rNVrkWAXmwpVK9p8Zo+Ixr?=
 =?us-ascii?Q?TBlE7ZzSpwoXjQWuX1mkoDE3k8qI+yp70MoNy/CWEtfC/licyJL3WH7R9+JX?=
 =?us-ascii?Q?LRwS4ObTBPXfqQiiyEXBviaX3pIQFsjwomsYL/Wc/WtKT4MeZV9MzXwofJBy?=
 =?us-ascii?Q?uKqZJo4wkpuOHg6J5pmgCyUM0EJKuHWvH8vCszqjqN+Bz9htz9QoCxkMkC1x?=
 =?us-ascii?Q?nna1LrgM5NDU0BDjrruEteUBGf7DVGCVlQxzcody4HGGIx1VM0Y2zsWCLFGC?=
 =?us-ascii?Q?bVTBSgxtSxTAR18xb19i9wB2xXykprflPaDrbFJm2bC+00RBROryqVLe76Ub?=
 =?us-ascii?Q?f4WqMirHim3dGvgP6/mZd4xMBu5yxKQUHfafHHbArgKrsLYoLHnCYVGamnXA?=
 =?us-ascii?Q?7xQXJHIP9qjWgEIyCRGj1b0RUJCzv/kkwptdVBxPXSQVq/UqoPh3+gPexhGT?=
 =?us-ascii?Q?l4KgUm2NB7bwbDW0W9re7bV7R0MqX88/xN+fg8zDOVIiWqzi5EhGBWgHdJln?=
 =?us-ascii?Q?NnYqplCRN0uiab5M0JFR2V/1kLFvop/580FksnH5bL4p880QcxbbFUyK8CVM?=
 =?us-ascii?Q?Yy5/5k0hTfZKkz21Gn8kCh0KZ3LO2xClcZBidc8rCTcgx7aP/HT1JNz63F+c?=
 =?us-ascii?Q?RJOEX4csMG1rzF7Z0P9/5/9Yw9t4rIkR5mcZN4BKCbMxtzjZwoxvoMlqFymw?=
 =?us-ascii?Q?zq7G0+/vxxwaA9AsPHLXdvhVKZK8C/lHgey7cbvob43jacvOWIZTMg+E15Zt?=
 =?us-ascii?Q?jUmw0wdNBoL1ydcN9ZLWfFmL7Xbpi4+8okwEmWdpMLtMwvytKWKrZtu9PXYS?=
 =?us-ascii?Q?to4zyS/Jt7UpauNv9SN86JH69mZVuiKuaIYlYSVMRQ0O2kXo1TSUqc1VBWJc?=
 =?us-ascii?Q?vkbjdNBEAXEFc7n+6iA6TbS+verYq3jpoFffaITX5qpuvb4v59ju/j6wypwp?=
 =?us-ascii?Q?Zw/t6DyizSwfA/sbj5ITGro9lIUwh1+R37SR85qSfR/Fp2zHk4NUtMnFfwaC?=
 =?us-ascii?Q?IaUtEvA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093E0EC673F8D5AEEEB7613E1079SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3644
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT047.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2647a0a4-763a-450c-82ca-08d937334ea8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fDCX6OqKWdM69ZTWzP65RVM2hEiLcs51MIsYn2ls8MeSODbqOWWy9Fxs0FqVu28jzP2lf1Ukan2HTNuO316dMfkLiLdqjva+OIrXKQJqxB7xeqFVwBkGuRDCHN+qfGt2GdhIJQkgASfhWrwIQh4EfHv6vLzd0QR521wRWdUJ4bizX0yGJzyd3Oe5pssRCdHhLG69IYJxGgKNqBzRIu/u7ggse3MQv2zt/ib5ML9D+/3TM/LBCan0kR8q7h0w7qhS73/fbG3YsYHMsjUzh+001RWTChtUOoauJV4+es2NXMZl/gRv4G+FpZGNSfDYFnXdEtUwu1ehfgCW3uWRhCyZPfwLBcu/DsQlq3F2tiRzatOhQObc3tmUbiW8ScJi7mfbuDZAH9eOnFiYJlEnO1NsvRJ6YzhkLUlNR7o8s0iSKWAfwkT2fzvdUeDyCFV61MDzEocJdMLKaewvU2DqZQst0B1toUSc0llIXVUZ7hzzRZD7qFLuZ6qE8VMNyPtmui9Ut2EJoTNB37MQF4rzKA+HPdKHwvafpGueF2bgfxrqKeKNJ63xY8CHAU3fZudRL5AIib+wOoaC3ifhZ/QOaI3q8wfR21BXL3ZcrPEZzxxGVA4Fa/QmZey2ypLySiVAOrQEIGcuNMwJ2KL4sJ1cldmpagQnjApdahEmuip7lJDUGuG/Z6RzNkA8bfMnNk5qGEAV
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(36840700001)(46966006)(70586007)(6916009)(5660300002)(70206006)(52536014)(316002)(53546011)(4326008)(7696005)(36860700001)(33656002)(6506007)(3480700007)(2906002)(8676002)(86362001)(26005)(82740400003)(82310400003)(336012)(81166007)(478600001)(356005)(186003)(55016002)(47076005)(83380400001)(8936002)(9686003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 17:12:57.7001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60205e69-88db-4c5c-ac3a-08d937335052
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT047.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5177
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB3093E0EC673F8D5AEEEB7613E1079SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi Team,

I am working on SDR sensors, where sensors details can be read from the hos=
t and displayed in dbus path.

1.      From entity manager configuration file, "bus" type will be get from=
 the entity manager. "Bus" will represents the number of host.

2.      Based on the "bus", we can get the SDR info and record count of the=
 sensor for each bus using IPMB SendRequest.

3.      Also, SDR command for Reservation ID will also be received from Res=
erve SDR cmd using IPMB SendRequest..

4.      After getting the record count and reservation ID, packet will be f=
ramed to get the full information of each sensor like sensor name, type, un=
it, threshold values, sensor number using IPMB SendRequest..

5.      Then the data will processed and mapped to dbus path.

6.      Again, for next bus it will continue from step 2.

This implementation is based on line by line execution and also from previo=
us output.

It has 4 dbus method call, whether this approach can be implemented in asyn=
c_method_call() ?

Could you please share your suggestions on this.



Thanks,

Jayashree.

From: Jayashree D
Sent: Tuesday, June 22, 2021 10:51 PM
To: openbmc@lists.ozlabs.org
Cc: Velumani T-ERS,HCLTech <velumanit@hcl.com>
Subject: SDR sensor implementation query

Classification: Public
Hi Team,

I am working on SDR sensors, where sensors details can be read from the hos=
t and displayed in dbus path.

1.      From entity manager configuration file, "bus" type will be get from=
 the entity manager.

2.      Based on the "bus", we can get the SDR info and record count of the=
 sensor for each bus using IPMB SendRequest.

3.      Also, SDR command for Reservation ID will also be received from Res=
erve SDR cmd using IPMB SendRequest..

4.      After getting the record count and reservation ID, packet will be f=
ramed to get the full information of each sensor like sensor name, type, un=
it, threshold values, sensor number using IPMB SendRequest..

5.      Then the data will processed and mapped to dbus path.

6.      Again, for next bus it will continue from step 2.

This implementation is based on line by line execution and also from previo=
us output.

It has 4 dbus method call, whether this approach can be implemented in asyn=
c_method_call() ?

Could you please share your suggestions on this.



Thanks,

Jayashree.

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

--_000_SG2PR04MB3093E0EC673F8D5AEEEB7613E1079SG2PR04MB3093apcp_
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
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:195899434;
	mso-list-type:hybrid;
	mso-list-template-ids:-1080509262 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:374890565;
	mso-list-type:hybrid;
	mso-list-template-ids:-1080509262 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am working on SDR sensors, where sensors details c=
an be read from the host and displayed in dbus path.
<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo2;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"border:none windowtext 1.0pt;padding:0i=
n"><span style=3D"mso-list:Ignore">1.<span style=3D"font:7.0pt &quot;Times =
New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"border:none windowtext 1.0pt;=
padding:0in">From entity manager configuration file, &#8220;bus&#8221; type=
 will be get from the entity manager. &#8220;Bus&#8221; will represents the=
 number of host.<o:p></o:p></span></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo2;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Based on the &#8220;bus&#8221;, we can get the SDR =
info and record count of the sensor for each bus using IPMB SendRequest.<o:=
p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo2;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Also, SDR command for Reservation ID will also be r=
eceived from Reserve SDR cmd using IPMB SendRequest..<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo2;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">4.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>After getting the record count and reservation ID, =
packet will be framed to get the full information of each sensor like senso=
r name, type, unit, threshold values, sensor number using IPMB SendRequest.=
.<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo2;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">5.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Then the data will processed and mapped to dbus pat=
h.<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 lfo2;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">6.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Again, for next bus it will continue from step 2.<o=
:p></o:p></p>
<p style=3D"vertical-align:baseline">This implementation is based on line b=
y line execution and also from previous output.
<o:p></o:p></p>
<p style=3D"vertical-align:baseline">It has 4 dbus method call, whether thi=
s approach can be implemented in async_method_call() ?<o:p></o:p></p>
<p style=3D"vertical-align:baseline">Could you please share your suggestion=
s on this.<o:p></o:p></p>
<p style=3D"vertical-align:baseline"><o:p>&nbsp;</o:p></p>
<p style=3D"vertical-align:baseline">Thanks,<o:p></o:p></p>
<p style=3D"vertical-align:baseline">Jayashree.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Jay=
ashree D <br>
<b>Sent:</b> Tuesday, June 22, 2021 10:51 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Cc:</b> Velumani T-ERS,HCLTech &lt;velumanit@hcl.com&gt;<br>
<b>Subject:</b> SDR sensor implementation query<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:green">Public</span></b><span style=3D"font-size:12.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am working on SDR sensors, where sensors details c=
an be read from the host and displayed in dbus path.
<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l1 level1 lfo3;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"border:none windowtext 1.0pt;padding:0i=
n"><span style=3D"mso-list:Ignore">1.<span style=3D"font:7.0pt &quot;Times =
New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"border:none windowtext 1.0pt;=
padding:0in">From entity manager configuration file, &#8220;bus&#8221; type=
 will be get from the entity manager.
<o:p></o:p></span></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l1 level1 lfo3;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Based on the &#8220;bus&#8221;, we can get the SDR =
info and record count of the sensor for each bus using IPMB SendRequest.<o:=
p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l1 level1 lfo3;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Also, SDR command for Reservation ID will also be r=
eceived from Reserve SDR cmd using IPMB SendRequest..<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l1 level1 lfo3;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">4.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>After getting the record count and reservation ID, =
packet will be framed to get the full information of each sensor like senso=
r name, type, unit, threshold values, sensor number using IPMB SendRequest.=
.<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l1 level1 lfo3;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">5.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Then the data will processed and mapped to dbus pat=
h.<o:p></o:p></p>
<p style=3D"margin-left:.5in;text-indent:-.25in;mso-list:l1 level1 lfo3;ver=
tical-align:baseline">
<![if !supportLists]><span style=3D"mso-list:Ignore">6.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Again, for next bus it will continue from step 2.<o=
:p></o:p></p>
<p style=3D"vertical-align:baseline">This implementation is based on line b=
y line execution and also from previous output.
<o:p></o:p></p>
<p style=3D"vertical-align:baseline">It has 4 dbus method call, whether thi=
s approach can be implemented in async_method_call() ?<o:p></o:p></p>
<p style=3D"vertical-align:baseline">Could you please share your suggestion=
s on this.<o:p></o:p></p>
<p style=3D"vertical-align:baseline"><o:p>&nbsp;</o:p></p>
<p style=3D"vertical-align:baseline">Thanks,<o:p></o:p></p>
<p style=3D"vertical-align:baseline">Jayashree.<o:p></o:p></p>
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

--_000_SG2PR04MB3093E0EC673F8D5AEEEB7613E1079SG2PR04MB3093apcp_--
