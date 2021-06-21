Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248B3AE609
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 11:28:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7kjb5Bwsz306m
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 19:28:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=StHUn5le;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=StHUn5le;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.133; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=StHUn5le; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=StHUn5le; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300133.outbound.protection.outlook.com [40.107.130.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7kjF5KGhz2yWG
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 19:28:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZfBOGq2DzcN9GjxzZl21SzVMqTpWO+lQ3QpiwB73eI=;
 b=StHUn5lebMtZYp0vZHNJqMkRqJWHVXGygLgnuRSRvWMvlD3HBqxbiW5PRifiYm5Cwm7/Ox++ZMDdJwpqygJ1QemuGdyJ/gYbnJGtN70qgqYp30JyxjV+Jw9DV46qy66/v0hN9LdhaoTAvxEE4fpNsgBFtv+jqAWkeCmeVRXJkgsQJvIuxUc1oggaTMGVvv+hIaRy8qDfbYMY4i6UN1RkajGrlZlwp9pZG6ZPAEpZF4GK3W/HcDWpDlkvw6n604/nu834JwL9nDBshQlpIGajp2E7l9bUKF5Jql6eX6hG7odT2MMjN3fm2+4HMqitZcKjauhbqEjnB5g2kDt2rZnabw==
Received: from PS2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::36) by SG2PR04MB3724.apcprd04.prod.outlook.com
 (2603:1096:4:9a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:28:08 +0000
Received: from PU1APC01FT053.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:2d:cafe::2d) by PS2PR01CA0024.outlook.office365.com
 (2603:1096:300:2d::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Mon, 21 Jun 2021 09:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.54) by
 PU1APC01FT053.mail.protection.outlook.com (10.152.253.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 09:28:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6bTIF+4WAu7B/3kqZcrzBbJ1uT4V21CxmWa6x9b0TkIyYmZndMu8bW5EZ1v2J/7Y7SBpCYVf/00dOWLeyWYXIx9Rhg+ageJWIS5bYqjB/q5hchOhEobDBemUqe/BLnWzEjNDaxDC0h9Pb3yrMrM16v9GCkZXC3Fy7ygXfqwoY4HXdoVJigRXJuci3MatU4f8KYYX7sgDRv1a4j5AdSXX2YZWv1LNJ2naYqC0qEtBPdFhdwMGNMMGhba71ORFSOAksXBW5roplJDbl8zmTcKuOl/ouKa91FQWg+O+VkhaBrCc0doXZ/rF/1EfwZBn3takm/z4tiWAXqbQafyXASYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZfBOGq2DzcN9GjxzZl21SzVMqTpWO+lQ3QpiwB73eI=;
 b=ofa6zidpckiy4D0+1paZ7msumenJkjfscgLRBQBsoC1TLY0Qx5QGhpllvSpoRr4qt0sZtcXoJ9pN5FZ282xoz3S+SmGm6xPoUii03E6XgO6TsOoUdgQU7St6bMiOQpZlw3Kd7oU3bT2+Iq65lV7HzvK3BCXYldFVKrHeMXDBNPQezBYeBD+xA+FIDAC6jhdedkbWIjVGFfnZN5bFzECO1Bj+NxBS/+ENmWQC1AeoXPa43i9ALow3h8GQmyxt/BM9e4g8qNeR9Xdf2ygag+aI5BBE9ykinVNyiLtGqPGw3myxWFy2zZoXbf8Z6eib0wD6zaOBwvQp1vwxfAdQTFvXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZfBOGq2DzcN9GjxzZl21SzVMqTpWO+lQ3QpiwB73eI=;
 b=StHUn5lebMtZYp0vZHNJqMkRqJWHVXGygLgnuRSRvWMvlD3HBqxbiW5PRifiYm5Cwm7/Ox++ZMDdJwpqygJ1QemuGdyJ/gYbnJGtN70qgqYp30JyxjV+Jw9DV46qy66/v0hN9LdhaoTAvxEE4fpNsgBFtv+jqAWkeCmeVRXJkgsQJvIuxUc1oggaTMGVvv+hIaRy8qDfbYMY4i6UN1RkajGrlZlwp9pZG6ZPAEpZF4GK3W/HcDWpDlkvw6n604/nu834JwL9nDBshQlpIGajp2E7l9bUKF5Jql6eX6hG7odT2MMjN3fm2+4HMqitZcKjauhbqEjnB5g2kDt2rZnabw==
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK0PR04MB2627.apcprd04.prod.outlook.com (2603:1096:203:65::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Mon, 21 Jun
 2021 09:28:03 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2%4]) with mapi id 15.20.4150.035; Mon, 21 Jun 2021
 09:28:03 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Adding dependent service as Entity-manager to Ipmb-fru-service
Thread-Topic: Adding dependent service as Entity-manager to Ipmb-fru-service
Thread-Index: Addmc/ZZ5PCR+QoITnuDoPAFw/NnXQ==
Date: Mon, 21 Jun 2021 09:28:03 +0000
Message-ID: <HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_C0nf1dent1al
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMmQwMDk5NWQtOTJkYi00OTY2LTk3NDctZDBiY2VlYzg0YjhjIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX0MwbmYxZGVudDFhbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6Im5vYlg2ekZ5cTNaVk84OVk0VFFyR3pxbVNIZkdQK0tKNDhvYUJzWnRkME9FSnc3VE1ac0xjVStHMmpwWnhaT3kifQ==
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.211.243.235]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ab558d67-e0e6-4a38-c91a-08d93496e05a
x-ms-traffictypediagnostic: HK0PR04MB2627:|SG2PR04MB3724:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB37240575A5B2425A365A8AA0FD0A9@SG2PR04MB3724.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KB1psAXYi/5Ma6BXmPDwtPO/hBtJm6+VY54HHJWrz3LwYmfEj2Ct7N/Cc1ZvBD6u0l3fhBH4Qc1f2p4AnmFXyKlW9wDyhZsq+e5QeZKaagWISCNTj4lpLU+dLQM1vIv5a7yE2lfSFVgtDoaWHExM1amL6NfaODEgy4g4dDD7X2SN3fi/DbM4INTiLHmWLgqS0A9l8487aga3bq1RvuXH4f5f6+uI3m0Vr1V1crkD4Y+Th/a9G+OpkcIgMPXRAc4FOo6tGg+DEB5/PzrggOg64UB24uo6o0+Gp0OHkcwn0WiE7fIfK9vUAI2Iyl28gpYTed4NprWn5385IGs3YObA4GSkUpEMUKn2zZJTPMX1rSopgMRRpP5hgh8O4gLGfXF7A2GhLGsBatvHZqOW9Ggn0ZsO+1FZhL6dRapGoWt6YY3Uo9es2rnGEcT5sabk/SfYxdfqxVwn2r2kpkVuf9SiIRjiSxsEklbf0TKswQl+1Ziq+2l+ZgwMOc9pt2U+wrdlGS5zRW5I4JOTOnpsWb4woBGtxjtmEMo92nwXoOb2fsdhXuaBdZIlRXBcXDSxmBY70vpleyV87QpsL29HAiwWn4bsM40uAAGk41dFQMlnWhM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(186003)(26005)(55236004)(6506007)(8676002)(8936002)(6916009)(86362001)(2906002)(54906003)(316002)(7696005)(122000001)(33656002)(71200400001)(38100700002)(66946007)(52536014)(55016002)(66446008)(76116006)(66476007)(478600001)(9686003)(66556008)(5660300002)(83380400001)(4326008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uUVa7F1VMg/uAO3Gy9vp/5mV8Iuujkz11vE4kwbM6Dj5biggm0WVInoxP2tE?=
 =?us-ascii?Q?t7+41m3JihJkP4zcGpcIcQ5cRBUdxt18lnFcAe8f6IgZIe5ZRiMHd2ySj6yV?=
 =?us-ascii?Q?OpkEg/s27LD5ahlH5bHg8m+mgzXXsc8cCnrndm41tBVHHxbN8uuH7IK5+yVT?=
 =?us-ascii?Q?qU+pHg9+EjXclGePpNdNGLBjWIL0BM2Z3CD1aOrcCv8KRfueoJ8E5Lct4lxH?=
 =?us-ascii?Q?g1CfgSkFMNdy6CfZcG/WoiOEyVIbUYuPOFxl+7Gz5xmvWz1zyytGam1BO8sM?=
 =?us-ascii?Q?eADy2iSxwaP9jDoFyj+Do3dcXV0kFUUiuomZoCvZ+5kRvzB/PoFvw+yyPTQX?=
 =?us-ascii?Q?BNmpg/bgmKPp/TZkdBq7xEeL7CHOncQS/jthQFu3jPefhtbENTAyEDeAclUl?=
 =?us-ascii?Q?p5sFzIRA1Cr0CGJQriG7qt2o8dGfuJIV+fDbnKPz3ZBU/vrmy/EGdsKFrRSb?=
 =?us-ascii?Q?LETew4e63iLUqK0wwq73NU1Ldvn3NEN13lY9ce9lYGVyi/UYdYW4fIYDrjRA?=
 =?us-ascii?Q?kQseXaWHEIYmXgckXTwZPYKFID79agg5cn6IOoguXcMGHRSdwrCppOOUVr4/?=
 =?us-ascii?Q?ScmsTt0c/yHg0PyxX9MjyRY+ZVjCvTp6fdoxoDa3o/p09WJlv0XNr8NNA0sY?=
 =?us-ascii?Q?QLDXDpcWEPuql6iTEwmRZ8gN6TKxk8ZGrAygGm8Om/saZKSp9HZZdaxFwC4u?=
 =?us-ascii?Q?5xwRE4abmZBv/dpS6PWgFC0kc3x8CsuH2dMFMRhRDJvoukl6rlCiUjrV5t0X?=
 =?us-ascii?Q?F8VIittNdORL2kcYM9fk5+zUylv3W8lAo8PuryOOpdZc4gqqZ+Ta6wTmaLxC?=
 =?us-ascii?Q?Ny/GWBn+RseIFZ9xCceoWeTJDsoxuCGfVcbaQvzjye/mAw0kFUIhKHykV8sn?=
 =?us-ascii?Q?4eSuhAIfH36Y+Tyi0tqGiupHEEnGSJlc25UdzHxLw6Fh7KNDU+3D9QBKCVSe?=
 =?us-ascii?Q?HPoFoJj8bEIfhJsoPLRwD7LZXGxUxAy54TDdsshs/IPxrK7DIL0YG4pTfq8K?=
 =?us-ascii?Q?hIWWir4zwLBEugmrIKwEZ+LGzfqIOiFpw9+hvSJFrGbE2No1Mu234YnOUT2z?=
 =?us-ascii?Q?I0JjuKjXQa/XyNr1Fz1hjBWDRUYtkWpX/RBCYkEi5f7REf9Uc+2539nqPWSB?=
 =?us-ascii?Q?OZlDBM0Wpe+mbIC5O7/v7STU39H9fok1THqMHTywu3dgoBJZ4kk6AubZ+Hoz?=
 =?us-ascii?Q?ZxaphiCDFDgI/nV2+Yn4MkJcn5pEKsEFSBj1wWi71eAgw9X3VBgUFZMFTjS/?=
 =?us-ascii?Q?V9+tfITH+4BuF+6Vj22LF/1pf0W6NKH2e2OxF26nRvSGyEsPBA6qzosCylKe?=
 =?us-ascii?Q?pMeSOyqHzPy9lGg7x1uNmt6X?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2627
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8709aeed-a3df-4f1c-e1cb-08d93496de91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: omZ/AJBpy+2KfoAWx0xcQZ3a6HaN09iXPwDi0O9vlxm4L5bKJj5RMA0Yt1nliwdCxI11IQsE1LE4xImUWd9/vRFh/Ff6UQyiFkCUNuzr3nvPZm/Zc5550YOE2ydNzsHfrlmfSTjjuLwa8d40KxBnJgzq72EkViWjifc5SBlsOdX1QfrzGQnbgwgXLUf81DjvHgslK95duz5AWmI3K4Cl47CH7Px829mcbMgmD1GsezrDulrKfnkdMkVnU2WQlscslcHHU50re2JSy8JX8TRTrFgJp5VuTobTJk18oh8zGxjW4THOQ1l/XVaZ6ONtO/nEyGtBFyvGPES5iAEOvKNndCvWAKZ4q0dKF+1p9/EVWSmaR5QBKwKRKQwj1c3/Ao/mPcLBngyL64FRfR0axF6JgiWw9BBXtjDHP9eeFQG2iPgCm0t7Z/wA5ozf3e3FRLMB6tXQOgCp5EZsoRVVmtpxHQ2U6Q0NXuSn28+Eu/gqpVkO4JuQnnu73ZYfNkbJZA50G/lqGTiJmb23jSwEJwkZ9WqARAaWCuceRAbQkXrV6pOSlb3j/UOsnwUI3Boqyajo7uAYhZRAZwjGDVhGuazr6QM5aplip5E+yLc3LWkRTwP9y+B3Cb2T1DLPUfhtz05pT6fq+tgdhYK6TU/WRFSVjOPj7kRvmA0+zOOwUZ1hk03b8vHt21NBbgzff5Rz4j5L
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(83380400001)(356005)(33656002)(6506007)(70586007)(316002)(478600001)(6916009)(336012)(26005)(52536014)(8676002)(47076005)(5660300002)(55236004)(86362001)(4326008)(7696005)(8936002)(9686003)(36860700001)(54906003)(55016002)(186003)(82740400003)(2906002)(81166007)(36906005)(70206006)(82310400003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 09:28:05.7303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab558d67-e0e6-4a38-c91a-08d93496e05a
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3724
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
Cc: Ed Tanous <ed@tanous.net>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Confidential
Hi All,

           Ipmb-fru-device deamon trying to read some dbus objects from ent=
ity-manager to get the ipmb bus details. Entity-manager daemon initially ta=
king some time to load all the dbus objects. But Ipmb-fru-device deamon sta=
rts at system startup.

           Since, Entity-manager deamon initially taking some time to load =
all the dbus objects, ipmb-fru-device getting the below error.

          Error :
          "ipmb-fru-device[345]:   what():  sd_bus_call: org.freedesktop.DB=
us.Error.UnknownObject: Unknown object '/xyz/openbmc_project/inventory/syst=
em/board/Yosemite_V2_Baseboard/IpmbBus1'."

         When we restart EM deamon once, this error got resolved.

         I tried to add EM service as dependent service to Ipmb-fru-device =
service. Added EM service in "Wants", "After" fields in Ipmb-fru-service se=
rvice.

         But, still EM deamon taking some time load all the dbus objects.

         So, Could you please let us know to how to add the EM as dependent=
 service. Or Please let us know if any other approach.

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

--_000_HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9HK0PR04MB2964apcp_
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
p;&nbsp; Ipmb-fru-device deamon trying to read some dbus objects from entit=
y-manager to get the ipmb bus details. Entity-manager daemon initially taki=
ng some time to load all the dbus objects. But Ipmb-fru-device deamon start=
s at system
 startup.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; Since, Entity-manager deamon initially taking some time to load al=
l the dbus objects, ipmb-fru-device getting the below error.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <b>Error</b> :<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &#8220;ipmb-fru-device[345]:&nbsp;&nbsp; what():&nbsp; sd_bus_call: org.=
freedesktop.DBus.Error.UnknownObject: Unknown object '/xyz/openbmc_project/=
inventory/system/board/Yosemite_V2_Baseboard/IpmbBus1'.&#8221;<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Whe=
n we restart EM deamon once, this error got resolved.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I t=
ried to add EM service as dependent service to Ipmb-fru-device service. Add=
ed EM service in &#8220;Wants&#8221;, &#8220;After&#8221; fields in Ipmb-fr=
u-service service.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; But=
, still EM deamon taking some time load all the dbus objects.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So,=
 Could you please let us know to how to add the EM as dependent service. Or=
 Please let us know if any other approach.<o:p></o:p></p>
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

--_000_HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9HK0PR04MB2964apcp_--
