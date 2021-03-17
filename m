Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 387CC33F009
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 13:11:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0psV1TTWz30L9
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 23:11:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=Wu9oT/gi;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=Wu9oT/gi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febc::720;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=Wu9oT/gi; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=Wu9oT/gi; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::720])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0psB65Ymz2y81
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 23:10:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C01aef935tFMmtuNO+32RRipevLnpyKeqNbgmOI4lx4=;
 b=Wu9oT/gi5vyZjpyAa2JzPYwST1jfHQyE/DHrxwKZmBqEo5govQMHjaD1zwTvYmFKeNg7R/Jk+a3vIg4/Xb6wT5HMe/tTLZAV4VUC9TfQMu+2W40jlHfl+9wlf4EGk/jLSlQcHiEXDxYeVwiMQN7Ckoa+8ZLdkFC/nd/XKS8J3uXh4nyY1EflxUN/Lk5H2v+/xDiQ+Jh7kW3gh7wUKLEl1k0+G0Hi3Us3mo0qtOUpy4UawHJDfK1IAwD4Oom90LmexuOqsAvowqfHHbtczdlrClDNoaIbtKAk+eMnOeMFdvjoQXtWPvdErhPOXV9SjhrChdMNEuFEZmU0zNhUvtICeQ==
Received: from SL2P216CA0100.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::15) by
 HK0PR04MB2626.apcprd04.prod.outlook.com (2603:1096:203:66::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Wed, 17 Mar 2021 12:10:32 +0000
Received: from PU1APC01FT050.eop-APC01.prod.protection.outlook.com
 (2603:1096:101:3:cafe::f1) by SL2P216CA0100.outlook.office365.com
 (2603:1096:101:3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Wed, 17 Mar 2021 12:10:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT050.mail.protection.outlook.com (10.152.253.77) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 12:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7YR7QBype/A0L+RV15iZJCLCJT67Zh+FCYpzVU2kfvAfHA0+Qs0i7BAk1PVVCB5TToUJQ42t0cnC8DkheMzEGr+fa6VJnZsDHbed8VD96uW9C2NNMzHMIhLM3Uha51cMGLftzMx8jmDKFkCJuWkT4bgZVIwtQ980AB4Bmhp/AX1ogo4Ko6KDwMxU6CgNfX7yAPz21cSvLUHUXUUCW3TxlNnT6u+qCkBTIg8sbhJcfUGmyCImKZcoVr6frd22zJfmT5HtpLEUJk8+Ko6Hb2nKuK85miJYoFyP5StgyZxRkbIrhgnG0Ml4ctFUV5sqqrS3maN6XQBdsb5gdhk5qz4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C01aef935tFMmtuNO+32RRipevLnpyKeqNbgmOI4lx4=;
 b=fyjqVqVALAeDOJBqEUnkK3kjMzRtvqyuTGax32QuP6hK1Vv7zqa51rRiM8QLO6mIBAOVeK2zXiOZyyG6tBU64Mh5gIoD7bGNLsiSga7ugVWJTE6hbucrrEhB3qfd1rhUGPmnkZLK/L1JpoGPaOOmYJExfwgdbMTbCLjlExkjLoJMZRNpLc3qnfo7XYlfz5oBMQED45lQW16s5u0cKDInFf274mVv2E8Z3oP5GS3OM9wEjeqMlWlfqitggfgnqrtNSBZo9I509ZLN32fCVTNAh6X0jXz5dXVG+eRdrvJ7PRinoIMR2CshQ0EwzCeomvhlGUh9dQ8aOw0FbIsKhMT4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C01aef935tFMmtuNO+32RRipevLnpyKeqNbgmOI4lx4=;
 b=Wu9oT/gi5vyZjpyAa2JzPYwST1jfHQyE/DHrxwKZmBqEo5govQMHjaD1zwTvYmFKeNg7R/Jk+a3vIg4/Xb6wT5HMe/tTLZAV4VUC9TfQMu+2W40jlHfl+9wlf4EGk/jLSlQcHiEXDxYeVwiMQN7Ckoa+8ZLdkFC/nd/XKS8J3uXh4nyY1EflxUN/Lk5H2v+/xDiQ+Jh7kW3gh7wUKLEl1k0+G0Hi3Us3mo0qtOUpy4UawHJDfK1IAwD4Oom90LmexuOqsAvowqfHHbtczdlrClDNoaIbtKAk+eMnOeMFdvjoQXtWPvdErhPOXV9SjhrChdMNEuFEZmU0zNhUvtICeQ==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3562.apcprd04.prod.outlook.com (2603:1096:4:95::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Wed, 17 Mar 2021 12:10:24 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::f4f5:46fc:706f:2eed]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::f4f5:46fc:706f:2eed%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 12:10:24 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Gerrit trigger CI from Jenkins
Thread-Topic: Gerrit trigger CI from Jenkins
Thread-Index: AdcbJZSlLQ4HAJI3TACjnCeG7/Gu/A==
Date: Wed, 17 Mar 2021 12:10:24 +0000
Message-ID: <SG2PR04MB3093BF84F15469B9F151FBE7E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMGY1OGI0ZmUtY2I4ZS00ZmMwLTkwZjgtODZmNTFmNmZkYzQ3IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InZNSTBpeGRJaUpYa1wvbnZWcXhGTThvRVRRelhZVXl3YkRwT1NQVmJSMEpXaXRHSk8xWTcxOHBSWlZkZVFQZitBIn0=
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:6098:3049:b863:d79b:24a3:bd53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 92e09e80-4bb1-40cd-ad93-08d8e93da894
x-ms-traffictypediagnostic: SG2PR04MB3562:|HK0PR04MB2626:
X-Microsoft-Antispam-PRVS: <HK0PR04MB2626FA77861563CB0155D83CE16A9@HK0PR04MB2626.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /cBAuHByPvW4m2F4p/pY/BpBEG1jKTfWyHsVZJnL2xIrXlu5nVpESWEsc+5/4t/beeB1aGIv08Yp8HCrafQyeFZPIammZHSs3yywscucEB6Zu1gjfQS6qguGMB+7yIYq6aeMOObD+hel8gADkmWB2Dy5QfFJtPSVEEq0TvabqXYxaK1Eh9mIErRFsNQPfJ52BncpNTeX9nhrTt6BG1KD9ATH/Uh6mRdri2WkyPgLLN0f0MDOIxa2EIUaSO4LDduKfMJZiT/uc20T29qT/x+nsLio6MGQuUeNCRcj15QxX+0oVzOy5Vw+iz5iJr1xd8SDBXgsv3N0SJBmSn11Npare+W+IC1TjfKQEOkQmbng5JkQ5j8n+ch6GkJMF0ZaEYl1BOm7riMNATFF2WRL2p/nOjPsHQbuwtb0fLSRwS5jx/hnDXRFHAJw/+K0s2cPH7mvzZRe/UVNaJTIgGs1fhWCKom4Ui9wvLBuN+P1l9r+jsQkX5tNjrxBcho/hWQtp4PFDeyKv1EWWG8uMU6FnwrTEYoyC5rtZ/rdIQlRp7Pzxn75zb8P7iiPNaTrJLB++w6T
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(478600001)(8936002)(8676002)(6506007)(86362001)(66446008)(52536014)(33656002)(316002)(83380400001)(55016002)(66556008)(6916009)(186003)(66946007)(66476007)(64756008)(2906002)(5660300002)(9686003)(71200400001)(76116006)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?FUJIWlajprVVAhlc0v/vn0kB/iejVWqfO+cA4jeGUxeBsSnsnCZ+TmqFEoV8?=
 =?us-ascii?Q?seh6g/59XbmBoA8GMEhGuBWZm335VMSi1wAq24ZXleg5H0cg1M6JKdckVVkn?=
 =?us-ascii?Q?dMr70TEjgiusHmToLD7HFn1NQXLAg7FWwSUKHRc1CbjoC7PB0DC+sbWgSu+f?=
 =?us-ascii?Q?GkKvfQSdmxzdQ4ZAD2vn4xK3usSmGXoK98crzoKqgYpxf0U1yAHl0d1iL1GF?=
 =?us-ascii?Q?/V/ysEqu0GhxOp8XmXzweR35WNaQcrL/+Kn6XrYlKTc01rwtvZGeFByX3Wwl?=
 =?us-ascii?Q?hg6rVVLnQIq151vER8g7t4ECnrW6QjCIeQgLTiuIEczA+nmcLEbfIo0a34X/?=
 =?us-ascii?Q?KnmE3IgGP4OWaBs6uZ0ELf7FWvW1PRIp+MsQUUCmCC4OOOezQbhZrUvTlZ+/?=
 =?us-ascii?Q?AfYqWOwcsE6owXy0zSThw1xODq8zi+uO4+IKPEZLJ9ZGbyYU3dGnK0evjnKT?=
 =?us-ascii?Q?3vPTPo6pkvxWcNcGcxMb5EeUfSX4sP/m4/K578v+d3Xo9fx7ViNFIKZaZp4/?=
 =?us-ascii?Q?sZ1NR16ZfofDdhi1NbkYBLpUNSa8kkX4C+pN5Cy0wB1aX10ra7tmJoDMNFsl?=
 =?us-ascii?Q?8PwaWzeobgHSWjwXMJ0aFqTUaWTvTf9yIscybCtOu61CTilduBOJeU8v7Il8?=
 =?us-ascii?Q?tTj85xBK+spo4f1RE8nLd9jTpO9tavBk6myyns8UJvd83juk+9xaVVVOQ8tV?=
 =?us-ascii?Q?2nyMMF4hyEWHiI67wEs6DfgGOpBikBHLjjrUTQj8pxpq8VUAxkyQwpfKKy4m?=
 =?us-ascii?Q?MlmVK5+s7JK1jfQppVGhMidSt6ITcUCFSchCZJg1QbFdLhWxBClmcpAUwIHg?=
 =?us-ascii?Q?UF44NsY9CDofnYGTCf7qNe8Mu/5DxFzhLdqhhaMtTUpOuilEU+sq+jk2B0sq?=
 =?us-ascii?Q?L7/uI6S6iNO9+2Xkxu+fBGZKYQ23/RW00pizZLOrkzvXRHMROZJJQcWzy/8/?=
 =?us-ascii?Q?UohEnKxafL2qa0kXMdCJLxUHwswOPgJ2y4B4iXnQo9aCLmqB6cCHHLC1J40l?=
 =?us-ascii?Q?oQaOrqvVz2YzLeUk70qYvcD/vRcbsTDI2/+bdp32hSH/ZfaWLeOIN4IITZIS?=
 =?us-ascii?Q?nTwiTJxfBHyLowp/XViKaWgk+VZ0volPC61hTdrePapZVWmVoRQEI4d3fqfB?=
 =?us-ascii?Q?jPedeIQpIjVZ4rdHX7R1tEX5Py1hkX16BxC/l7Rjb1dxrdKhMXWBw+5dpwQN?=
 =?us-ascii?Q?6H7hpYPz1Qn7M4yFTtSgcnXiFlRsWzAgEQtfPbXFqpEFBGnVL1kvxArkKGXa?=
 =?us-ascii?Q?KidD0bHeqmyhnw8BghZWrwJIA6deK3bRqAmTrgcJJSBL4ZJMKB5aWucZ9Mn2?=
 =?us-ascii?Q?CRY6eaiL2CIotxGefxWoJ7i0uFVnPLumJ7IUHtzDY7DuJh+TklDlEXvdkgt+?=
 =?us-ascii?Q?RohjenyoXvVK4Pz2mPWOwvF4m5+y?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093BF84F15469B9F151FBE7E16A9SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3562
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT050.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: cae426ce-8f4c-4a59-db96-08d8e93da557
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MRpeyos5nZ/y+OWQbk1jKyXlE5ZCgrVThD8MJXi7+k6MChwdrWen8wXrA+7eQngLki3bQdg5Xl3Sn32Em5TPEkdG21WV1/rqOiLJu1d/Aui6eW7q+RyuVBaxWPBiGzlkE95HiKgc9d1CsS4ySumKWgAooveiIZmTgOWtZMo2Fl8H90UDek9p/nlOLBU9Znj6IlvpP3IWaXhVVgfWsWmuSVJNODfkd26Yisirl4q+Y36wngzW/IZ6q9SbOmdJa9VvhymKj9tXIj0mhgFO53kKkt55KoHjt21B+ciGdhotowLDLM88eL/LF16vzn5d7Oj9Htc7PdLn3JwkaUbxJapFLtEhaHwDzbAELzKCqNvBLLvyTTeSXjF6BJtfV/qiVdHN3eGau7HI5OWAn02zPhSZ6yM15Bez64cWoJ9Zk7bHVgJyXMInR5J0+cnL9OaveUPMFsuN7Fdx3z77MkHG333tfD6csR+p26CBoySBwU3JD2Rl6whCkm+aDPWc3ls3HecuUzUAPvPFFYwhz0ZAIwP4sIIascjEy3M1C1Spk3z0rCgBij+M5wEe1llPQQ9iZVYqoYULU/Gt/6YrzxUm7/QD4O2DRnTg2UWkk2FuKDhXLOInliFK4XtbTY8kqFrquGBTcGViCQhcGlyN+FRJ9vSb4kH927uEQYntxGBa2KCoV7aEsUD7KQ4tR5PGyKLRGMjnRVIdpjfcbNkftWJMVyuSohByLR0oD7PTKcK8Q6iNe1w=
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(36840700001)(46966006)(86362001)(34020700004)(52536014)(70586007)(356005)(186003)(81166007)(6916009)(36906005)(2906002)(82310400003)(6506007)(47076005)(8936002)(33656002)(26005)(55016002)(83380400001)(9686003)(316002)(336012)(478600001)(70206006)(8676002)(5660300002)(36860700001)(7696005)(82740400003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 12:10:28.6832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e09e80-4bb1-40cd-ad93-08d8e93da894
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT050.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2626
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

--_000_SG2PR04MB3093BF84F15469B9F151FBE7E16A9SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi Team,

I am working on Gerrit Trigger Integration from Jenkins.
Is there any steps followed for continuous Integration of gerrit from Jenki=
ns ?
I am facing issue in connecting Gerrit server from Jenkins.
Could anyone please share your thoughts on this.

Regards,
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

--_000_SG2PR04MB3093BF84F15469B9F151FBE7E16A9SG2PR04MB3093apcp_
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
pan style=3D"color:green">Public</span></b><span style=3D"font-size:12.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am working on Gerrit Trigger Integration from Jenk=
ins.<o:p></o:p></p>
<p class=3D"MsoNormal">Is there any steps followed for continuous Integrati=
on of gerrit from Jenkins ?<br>
I am facing issue in connecting Gerrit server from Jenkins.<o:p></o:p></p>
<p class=3D"MsoNormal">Could anyone please share your thoughts on this.<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree.<o:p></o:p></p>
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

--_000_SG2PR04MB3093BF84F15469B9F151FBE7E16A9SG2PR04MB3093apcp_--
