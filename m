Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDF8374F36
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 08:11:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbNWK5FzCz301s
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 16:11:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=XOk6q/0Z;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=XOk6q/0Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.103; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=XOk6q/0Z; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=XOk6q/0Z; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310103.outbound.protection.outlook.com [40.107.131.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbNVy5lscz2ysr
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 16:11:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul9cBd9k5N5MjoluLfWJYJ8Qu/Q7zr1tjcHWI3btTqE=;
 b=XOk6q/0Z3KDW0v/xppxSWeqCUnVW0xgT3NJJCSfbQuvKr9MqwCkcSodzP0H2O2lDx68qaK22DGdbwuXOdekrNykJgxtvIYvUhWf3pWpJZStvVsaXOKG9IgCjbo8b79BwRXZyAtfkx7HR6xC49m//s2gS4OZ5BaVuxaKeMMcoF/LMN+JI3EvTZD18owfANiicxKjk/DzZ4PtG7cWAqjMhaAx2kHXitR3/aGyCpYXNrwh1pMmbYFJiSV1S9QBot+7OhVN/SU6+GZhQLRkwtbhmlX76o9Z7kMvKc9cQsuygwP0b2VERrgKK3nxRVLR6YZ+Y4a+ROoXD4a56le6Wh7x2zw==
Received: from SG2PR04CA0198.apcprd04.prod.outlook.com (2603:1096:4:14::36) by
 PSAPR04MB4632.apcprd04.prod.outlook.com (2603:1096:301:77::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.26; Thu, 6 May 2021 06:10:57 +0000
Received: from SG2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:14:cafe::6d) by SG2PR04CA0198.outlook.office365.com
 (2603:1096:4:14::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 6 May 2021 06:10:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; stwcx.xyz; dkim=pass (signature was verified)
 header.d=HCL.COM;stwcx.xyz; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 SG2APC01FT037.mail.protection.outlook.com (10.152.251.111) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 06:10:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odhjwKR+/9xnsYJFcakRvA1NIa4PGtrGDs4cbqDgxz0ZW6dij+Bbv5spOUHFnvSlVcA6OAzi6b2/AeLUx6wjsiLqenhrvszmUGY/oBvjWyuSqTP2laxrlauxLTCKwT/GOwA3n3rDGoT+Uy7R9/Kw8ImHQPrRa0njSSHv2QUDrmY7qgKzXWRq9kQSD2wD+41/dhuoTlP6zqwUbPKPenuN130BF7FwB/LnmjmiLaS/5+ZFmNg/PpNZHrc/Z0QejytnZ/oJX2ydf5eF4MMIL4cyu3sXDVCyMFu8Upwg4BIc424EuCuEkgTKFRUPWOTD9go3XsQI+nvtNY1E09vOu77aPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul9cBd9k5N5MjoluLfWJYJ8Qu/Q7zr1tjcHWI3btTqE=;
 b=a05yNGdDu8lSUB5+ZVYHJGQBcBD3YTZOk0frHVOoBBCzqtReuWb0wr9tUFskberXM36tQBDBAzhVl+dw++WjwkbyHehkXxp3Fvvu4cfcZOsRHSzct9f9cY0poyu3bolYaB+wqFsp9hxI6+ZlR1AcqW1gVK5m5FSKZhhlUfiV8JTZY5nD8yqBgbvmsHXq+IF47nOsRjBV/8EOIKe/VKEnGI8cKfDQoAFxyicxk3CJ6nPQ4T+eX1w7FQQrQw7ssBubxqMgKpgkMHCBaSNnNrua0BJUiFOaOWU/yUB8afIVywQ1G363L7bPKUr4pWCMsJosECoRM6HZfN+9tQmcoxabVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul9cBd9k5N5MjoluLfWJYJ8Qu/Q7zr1tjcHWI3btTqE=;
 b=XOk6q/0Z3KDW0v/xppxSWeqCUnVW0xgT3NJJCSfbQuvKr9MqwCkcSodzP0H2O2lDx68qaK22DGdbwuXOdekrNykJgxtvIYvUhWf3pWpJZStvVsaXOKG9IgCjbo8b79BwRXZyAtfkx7HR6xC49m//s2gS4OZ5BaVuxaKeMMcoF/LMN+JI3EvTZD18owfANiicxKjk/DzZ4PtG7cWAqjMhaAx2kHXitR3/aGyCpYXNrwh1pMmbYFJiSV1S9QBot+7OhVN/SU6+GZhQLRkwtbhmlX76o9Z7kMvKc9cQsuygwP0b2VERrgKK3nxRVLR6YZ+Y4a+ROoXD4a56le6Wh7x2zw==
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HKAPR04MB3922.apcprd04.prod.outlook.com (2603:1096:203:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 06:10:53 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2%4]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 06:10:53 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Patrick Williams <patrick@stwcx.xyz>, Matthew Barth
 <msbarth@linux.ibm.com>, "M:  Matt Spinler" <spinler@us.ibm.com>
Subject: RE: Include sensor monitor for our platform
Thread-Topic: Include sensor monitor for our platform
Thread-Index: Adc9o96EIrVJD470RVytXsEFBmz39gAJntKAAACqSHABHEwOAA==
Date: Thu, 6 May 2021 06:10:53 +0000
Message-ID: <HK0PR04MB2964CDB9CE28A8CB1B925D6FFD589@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB2964D4D925F6883DF2342D48FD5E9@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <YIwPdXmVD5CCJWzX@heinlein>
 <HK0PR04MB2964606A0C823C9601754AF4FD5E9@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2964606A0C823C9601754AF4FD5E9@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_C0nf1dent1al
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZDcyZDg3ZDgtYzcwYi00MDE2LTk3ZGUtMDA1ZmQzZDM0MWUwIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX0MwbmYxZGVudDFhbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ik1SaW1SMXF2dGQzU0pmc3JJMjZ1eU55XC9lVTZnMmwwMnRWQldLNkRKbTVTWk5HNFErR2JxYytTVnR6N0JtTU9OIn0=
Authentication-Results-Original: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:6e18:8da:f536:f5fd:e3d6:fcda]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 09c2db66-ee7c-49ea-4b22-08d91055b6a4
x-ms-traffictypediagnostic: HKAPR04MB3922:|PSAPR04MB4632:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PSAPR04MB4632B328777D513F477077EEFD589@PSAPR04MB4632.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /So02I30kH1N7NIswZpPtyO3eWEspfkOQj/+juILhRgHduu6izl0qn0yS4oh1x6k+HueN5ljwEfvsq88UaFP/SpxmRvDV3GWlDN+gmtBMos6iS698qVo/9b4WF527NlAkcGIMzlJgZDNrShJI0lzv/uKAX0b1+HGARFhda4cKiiuFa2vpix8N/8RDw3O4CEtwuDX6SIHdsrRJ5/HOXOPB0eLHC+z2qx0wU8fhUEUgIoPEPm2+usuBywMDkyIBlHc5IuqIDFg1gt8phl9mYfiwRyg1cW2xVDCNN5LWi4dQYwFzbap4lB/VZp3U6TVMW9y2COO6jDf9cpvMb7ng8PazXj4SAHBPykVVGfiE5/lUrFfa8UKCNHnBShl+DMp0Xo38wvnzqo5FoxtRdoz9nYy8exPGX4wCXkvjuUCPA2/b/aOt3HHXTsO1lC8T2Z0Yw25la4HW5Ctacg6ZSD50Vd/S6ifrpNWknh3Tvb10XsQu7YrU+kMyqhYlktzjZkqxWIQ4K9QuuJDIOspphzf858Jasjauk5TswniSmLxRGLNyKxnnYh1CNV8cWlUvK3BOV6bnAE5D16T8CYAxu4Jp+hZap/NcS/qqTr+ZppPwIPrAVw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(110136005)(186003)(33656002)(122000001)(7696005)(8676002)(54906003)(71200400001)(2906002)(86362001)(8936002)(76116006)(55016002)(83380400001)(5660300002)(52536014)(478600001)(66446008)(316002)(9686003)(66946007)(6506007)(4326008)(66476007)(66556008)(64756008)(53546011)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9o/qHADTmntFk/OOri/zlGUwkazTo2g38+HWUIGfeORAZ9GHAbSxdpu2ixyR?=
 =?us-ascii?Q?5f8kJrPQbTi15mtbK9KOyKFug6m28CNYi7UWcrwv4g74LKhNUB0D0tnZ2dMo?=
 =?us-ascii?Q?eht3XXN5OaR8fVLjmPl2VZMoPWiOcPfyVVo5rxcN8/U/EN4UwoQJLXYsEB44?=
 =?us-ascii?Q?31CCmQWy2+u6rWbauspDWmfU0majBT3LamGu8WUzep+j/FED2504h7BN64eX?=
 =?us-ascii?Q?pxhUCFdrz0QP3noPHycrUu7QGTHlczY/Vk3CDhiw7mGiqnOgrTQgTSBpIZ/D?=
 =?us-ascii?Q?QaLxHfXaHbxh2H+jkuuEb09ogl9tuMCj3+Jwj/ePBramfVt033PT8aAyp9wC?=
 =?us-ascii?Q?OlWhqKBeZhlJXNZdqvbUzVa/OCfMX0eDUtzeNY7CRuH3aHI4pEnbbuvr3YOB?=
 =?us-ascii?Q?oa+eoE6J77pDKVgG80iDr6nF63Jg491/Xi6hqGDJlAaaXcRLS6K7XtCmxpTL?=
 =?us-ascii?Q?Ewavmf/hNQxi/cJ5NJz5aqckRFQSaGAApIw+m45dQhe0EF8KY0WdD/OyaqCT?=
 =?us-ascii?Q?XTxGJ4fYSM+fvky4x/M6xH4q4AIbCop2V8TTkx6s3iHTZTegUtuEQV8FRGWC?=
 =?us-ascii?Q?Wv2eEed4PaOqpu3uIu91o8f8rFJdaQeBYvledDCy0RQKuCUyQ5LjKvVp2f2Q?=
 =?us-ascii?Q?khqajEEOH620j1KOGSK9fd6t2LaegX7BatN+zo+4ghMCCsOeKhPFhIjTDwWI?=
 =?us-ascii?Q?Vdtju7l0/cQiNJdL2mR/88KJflPfr9wXlb78rE2MVA+RLRTIc0KZkPzAxLbI?=
 =?us-ascii?Q?40XDIUDyKDCxMBu/+9tHaKtbM6mZPd1cU/ZeObuAHWe4XQZJ95uHEBzfQneu?=
 =?us-ascii?Q?1e7HB9gp/yDHYDjbdd7wOKVdtU578YnvCt0ENp1mxO6kasCqWEbW78wEDdUe?=
 =?us-ascii?Q?X+1RgbOncn0+yoK9i1sMFa7TX8tE78vKoBAG6i638QH9+2Sbsq5ab7VIg04G?=
 =?us-ascii?Q?PEMhoyJldjEQ6tNSZjzBcVve7rvIa0enUoQTwFUO1qnDGpfZKh8iBDUuKq9/?=
 =?us-ascii?Q?8s5vaahJZAxlZw3IHCw3ltL+5AVARCDOaCLQ9OPASX8xaV4pEYUa4yGXTIqs?=
 =?us-ascii?Q?/UkhV4nm2KXlWklwevcOWNANSM9wWUihz5yunEFu740vAfNIID5rYdJkNrFV?=
 =?us-ascii?Q?Plq77090C4PzDAHcqEdUsJ9j+cq/S4Pgi18m7YQQRJ/T1CoRZB8D4XFFL1pW?=
 =?us-ascii?Q?6AfkrcUuuV49vK/B+jytGrtyFa2zqv2WjCqE+/jcvKk5x2HNKB40kkOg9n5u?=
 =?us-ascii?Q?7NEu7MudcueLLm5hrACqtARZz63ZVNucBtmzCkiwKmktUkS7mi6EaLe1z+MC?=
 =?us-ascii?Q?tpeR9NSxWNYO6aI9LN9VHevZqkEtnS+Vd7ti/KeBPy3yzNG99H3mfd6Brb8u?=
 =?us-ascii?Q?D4C72qM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB3922
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: bcaed35c-796f-4ffd-2a3d-08d91055b4af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VIufeBBhrY7tiicVM7uUTY4rTE77ffm1Ph1nONCI7LDPM+f9aEycFPQXU77LPJstJ7fPd7WDQCZZMjyExAWbhrzkoyVpAkd7SZ3dGtjclDkXfwPLIvZk3XgMAlkwAIHhyIjmhwDg+KeYtstjmnXmL/LCtjGF0lJCC0Xq8tMr03Z8eI0q7o+HTgkzkDP6fTTVh9UiBPkNMONXC9wFJsRlqlvhABcPT9/T651ZHTZMiNBluwfVgTJZoxM6jJLhPMbIcEnnDUQpRXL+xXOWXqoO5TPLQ0bpOYtQMKhAk3/u0ipVGBvHp6YjJPYuJw7cJupNCokSM3Ivg98D3IgBIx3i1ihdB1/2fqqzdRystNTAltSMPqxnKOrsM/enYN5yh/i5bW4K9U0O/FK+Xrdx+ktx/8bF44h+n89nJqAYTfwVo4sKPCPHSwRl2NfQYNAk1Iqy5NxN/sNlH1VPqVWSNsxT3sTlbFFqI1cjM89it0pRAZC8x2wnzi+wb8Xqq0J5E4/H2qdhgOFafDu69hwtzBL9KQ7AycElQiBTp6BiOj6B+EKVYOD36odCPWsWnhdL7DY65RDrqh9Q+GOEXGIg9/NNN44kSr/RzjER3oELSC5UAqrDH3+KRn+1SxuB5Gmr0QBZ4sSdVOUloicae0bZCTFygvbdCyHNPfN9ViXF3hdK2h24jHf7gP9HUPpsXFkZwoyG
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966006)(36840700001)(6506007)(110136005)(356005)(81166007)(52536014)(70206006)(5660300002)(186003)(86362001)(36906005)(83380400001)(8676002)(33656002)(54906003)(316002)(478600001)(7696005)(53546011)(82740400003)(8936002)(55016002)(82310400003)(47076005)(4326008)(336012)(70586007)(2906002)(36860700001)(26005)(9686003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 06:10:56.3950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c2db66-ee7c-49ea-4b22-08d91055b6a4
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4632
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Amithash Prasad <amithash@fb.com>,
 Manish Kumar Thakur <manishkumar-thakur@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Confidential

Hi Matt/Matthew,

            We wanted to enable the sensor monitors like "ShutdownAlaramMon=
itor" and "ThesholdAlaramLogger" to our system to monitor the sensor values=
 of our fan.

            We created phosphor-fan_bbappend files and try to enable the se=
nsor-monitor like "control", "monitor".
            But still sensor-monitor is not enabled.

           Could you please provide any suggestions on this.

Thanks,
Kumar.

-----Original Message-----
From: Kumar Thangavel
Sent: Friday, April 30, 2021 7:58 PM
To: Patrick Williams <patrick@stwcx.xyz>; Matthew Barth <msbarth@linux.ibm.=
com>; M: Matt Spinler <spinler@us.ibm.com>
Cc: openbmc@lists.ozlabs.org; Manish Kumar Thakur <manishkumar-thakur@hcl.c=
om>; Velumani T-ERS,HCLTech <velumanit@hcl.com>; Amithash Prasad <amithash@=
fb.com>; sdasari@fb.com
Subject: RE: Include sensor monitor for our platform

Classification: Confidential

Thanks Patrick.

Added MAINTAINERS.

Thanks,
Kumar.

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Friday, April 30, 2021 7:39 PM
To: Kumar Thangavel <thangavel.k@hcl.com>
Cc: openbmc@lists.ozlabs.org; Manish Kumar Thakur <manishkumar-thakur@hcl.c=
om>; Velumani T-ERS,HCLTech <velumanit@hcl.com>; Amithash Prasad <amithash@=
fb.com>; sdasari@fb.com
Subject: Re: Include sensor monitor for our platform

On Fri, Apr 30, 2021 at 09:37:17AM +0000, Kumar Thangavel wrote:
>           We wanted to enable the sensor monitors like "ShutdownAlaramMon=
itor" and "ThesholdAlaramLogger" to our system to monitor the sensor values=
 of our fan.
>            These monitors were created under phosphor-fan-presence.

I don't think there is anyone using the monitoring of phosphor-fan-presence=
 with the control of phosphor-pid-control, but that doesn't mean it can't b=
e done.

If you look at the phosphor-fan recipe you'll see that the default PACKAGEC=
ONFIG is "presence control monitor".  I think you'll want to bbappend this =
to only enable "monitor" (and not control/presence).  This should configure=
 the package so only the monitoring parts are enabled at compile time.

You may want to cc the MAINTAINERS of phosphor-fan-presence for any detaile=
d questions you run into when giving this a try (and copy the list).

```
M:  Matthew Barth <msbarth@linux.ibm.com> <msbarth!>
M:  Matt Spinler <spinler@us.ibm.com> <mspinler[m]!> ```

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
