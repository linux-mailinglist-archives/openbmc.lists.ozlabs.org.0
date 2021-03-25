Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4635348916
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 07:28:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5Ztf5HScz30hc
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 17:28:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=H7qkBh33;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=H7qkBh33;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.138; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=H7qkBh33; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=H7qkBh33; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320138.outbound.protection.outlook.com [40.107.132.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5ZtL1w5Hz309W
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 17:28:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0ZpilgsmGVv0l1O/HGOYeSCvxHOZk4ppOeEsVv635k=;
 b=H7qkBh33osqxDT3Ca0Ngru/cDHt5wO92LeZsgpwjFfELAYH1LTOCY8jcl5HlUS2PE3RHvobPB/K9PtyGAfkZESBZIlrNSLvk6731Eel3Q0psT+jw3apmVoi0BZHGs3WwJUBFmJeiRPw3QzzVtRoIIptt75fATBXg3aTyQniaFLk3PhLLqJafJRIsBmG1pRVVYfZqY7NyEy9zaKUJDFjWLTWaTp8fUPTneHFdkisybuU4aLxm/c9ODCQprv7tkCY12gPA8hIfU6LyhiLYNZd8bVY++/dxOb/EWEgmmJjPRYcARpEy4/uj6Z/l8gsvp63kPE3F1k9jQdjWdn8jKLeiCA==
Received: from SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9) by
 TY2PR04MB4077.apcprd04.prod.outlook.com (2603:1096:404:800f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 25 Mar
 2021 06:28:09 +0000
Received: from SG2APC01FT004.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c6:cafe::bd) by SG2P153CA0040.outlook.office365.com
 (2603:1096:4:c6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.1 via Frontend
 Transport; Thu, 25 Mar 2021 06:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.52) by
 SG2APC01FT004.mail.protection.outlook.com (10.152.250.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 06:28:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzzmF6O0RKKIAOy3uQOZaAIjhxMHxF17tmFDmr2N2MolxI0c4TbkXyxL6wupQtjWFScS0W6kb+o/UwkBKIvQkOyoCTqIh7gtm3Kh0RQmtQFy2HEq0p6obkEvUA01xA7ekxoCmTUwI6fH6HliuKpq/rQnVCI4KBOlKa3ts+r0oTg6E1mWa0Ity1OCB/vz+n+KQON94GdtXJOw8YOT9uwDkHG15rxKz5yxaAPn3vOO9lcG3ZDqvzmzsin9cISygYGJ1FDrQyny3FI/rUKhYFMzXlqgNNqkYnZ8CxlAEn0Gz7WrlfaNWAM3018s9f0zY0enLrETrRlll3W3ElBZfAgR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0ZpilgsmGVv0l1O/HGOYeSCvxHOZk4ppOeEsVv635k=;
 b=VOUPcV+ZoREBxr9l1VVtriJR3GctxSxywEsvl+sA7pPTuuvN7kH3/Yb4ygduOzxG75BEdpwYAZX7lI1JOUtbgx46+JB9V94YpwrPt7BgpwkeUA7ZEgaE32l4lIrDo1ivIlrwozEOl+zZeJPxYXYd5+5z6JyaQQNpa9DE+H9i85TmCZkyHiwFAMJBZ+JSYnteb0ZbY/JWu6kc2FyovjTxCNRsKqpRMo3Fm2NRiiFn22BbqjiUg7JhE6qZETBGvhxthOjyR1sa67tCrGZfz1p1o5Yz6v6cOPPZ+ElxVm7MHUCAWVTHEQEnMeyez5CDaCzImKwWT1TjaPHvStl1QWXPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0ZpilgsmGVv0l1O/HGOYeSCvxHOZk4ppOeEsVv635k=;
 b=H7qkBh33osqxDT3Ca0Ngru/cDHt5wO92LeZsgpwjFfELAYH1LTOCY8jcl5HlUS2PE3RHvobPB/K9PtyGAfkZESBZIlrNSLvk6731Eel3Q0psT+jw3apmVoi0BZHGs3WwJUBFmJeiRPw3QzzVtRoIIptt75fATBXg3aTyQniaFLk3PhLLqJafJRIsBmG1pRVVYfZqY7NyEy9zaKUJDFjWLTWaTp8fUPTneHFdkisybuU4aLxm/c9ODCQprv7tkCY12gPA8hIfU6LyhiLYNZd8bVY++/dxOb/EWEgmmJjPRYcARpEy4/uj6Z/l8gsvp63kPE3F1k9jQdjWdn8jKLeiCA==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2281.apcprd04.prod.outlook.com (2603:1096:4:5::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Thu, 25 Mar 2021 06:28:04 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::f4f5:46fc:706f:2eed]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::f4f5:46fc:706f:2eed%5]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 06:28:04 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Gerrit trigger CI from Jenkins
Thread-Topic: Gerrit trigger CI from Jenkins
Thread-Index: AdcbJZSlLQ4HAJI3TACjnCeG7/Gu/AGGiKCA
Date: Thu, 25 Mar 2021 06:28:04 +0000
Message-ID: <SG2PR04MB3093138F50B102737D402D6CE1629@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB3093BF84F15469B9F151FBE7E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB3093BF84F15469B9F151FBE7E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMGY1OGI0ZmUtY2I4ZS00ZmMwLTkwZjgtODZmNTFmNmZkYzQ3IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InZNSTBpeGRJaUpYa1wvbnZWcXhGTThvRVRRelhZVXl3YkRwT1NQVmJSMEpXaXRHSk8xWTcxOHBSWlZkZVFQZitBIn0=
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:6c96:4410:31d1:a16:ec2e:44f]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 67732e49-07c3-44e9-ca1d-08d8ef572717
x-ms-traffictypediagnostic: SG2PR04MB2281:|TY2PR04MB4077:
X-Microsoft-Antispam-PRVS: <TY2PR04MB407768411B9CD792162D2A88E1629@TY2PR04MB4077.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uIu8Rs51tlEUKV4l+bOi9yDquCT8mQokmeQ5Mwpqf8OI4/RdHCiUcj2hrNlsLKrTrVBlzV8geYgmjI9sxUGNoqApboXuWVSt+xo5cF1x3nKFjIxm0vCkPkNNZ5V85mZxVVjqF/Ug4DQ8jYuN/3cETC20ykiUu3/i8pVdSlEnwgq2YIdY8KWUpVFnUdQ0FTGPwZoYicemqKpcA17yUfuurQE0HcRCZagnU+MzCfS1G5qTd9E3La48gHhgVSMaNhnp1N5OFVVd6qSYm4fTuToMkzBHx4ztVUGjIxKQ3KJe55kpeZk30B7gT7Kq9hxGDiQyREMWEgsAlvhkAm1jDQshD8xYZKnWOb3spoKhygKQsQSQ8gjuiLBqSevwej72Z1XA4tgny5ZkXFcOHpRU8sk7w8GOp8YhGmJnRpwynoI9iywUPoOWbR+b/+QvwIZPPceb0Pv+iPfvfAOpnVatEuvwK2CM/osT9Yk9yFKx9kh5qAIJHk4X4zXRjL2UGgnvUEn2yR3kNAeb5f6W3FI++7QDvVNZGeqWr02LF7shsPZwP3OXElZ4ZEEDJ+7hZ7sTURfShAYZJvi1/aK1YPzLckJNgyojJXRIXRVLvjFg8Dg6DQlMEis7/UFmfUKslcT7MnPI82/mKXJThej9jpXTXn2aiqE1uJgl6PePkQi3jnAhOQk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(33656002)(8936002)(8676002)(71200400001)(83380400001)(86362001)(5660300002)(2906002)(6506007)(186003)(53546011)(38100700001)(66476007)(66446008)(52536014)(76116006)(316002)(7696005)(66946007)(66556008)(64756008)(478600001)(9686003)(6916009)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iWY47UHLQgdeg1PbiCe1yNQgQl0467iLbltKNGnHZ02Qvgyj9DMOeKL3d6EY?=
 =?us-ascii?Q?G2Bumdpa2D5kD5wKMAW4epNgREea2/tacKYSvvSZzIT0E05e/9xiQzGO0vEr?=
 =?us-ascii?Q?jzQNQb5IDlsBmxcY7VQCY4h4JHyIL1TGAsZniZTV3wBcwaxp2xZ/lOOB2Cg6?=
 =?us-ascii?Q?rjps1nxla4JIHu7sqJbR8PQzpqs/ktA89DsFHgZX9zWjQwTmKPE1D+/PpUSV?=
 =?us-ascii?Q?nMVn6XhouRazUxE4Dlt+j33UZLd9tK/eefOcuIpI51Sl4aoQKYxmZ06eaY25?=
 =?us-ascii?Q?DxnMdEjvaDg4stqQQaYkiiFa5HvZ3FyoMjReV0wAWPYgQfq4NRfMmDuERQyg?=
 =?us-ascii?Q?BdWiTpmy9yCOQGk5ywHXEGZuQtTi7Qq5bFyS9CD67UhDE/74BZBgkxq43CUS?=
 =?us-ascii?Q?R1ZkFeDGvt0KXhaEDNlceNmyW7sFdtleAikN8JzS44vi8aPsaUfrHPDR8vdF?=
 =?us-ascii?Q?4rNdm8bVn7AV1rv8XzI9TSdlANSFc5MBWBO3CnUuBkne0dxZTrlxwbPB5bW0?=
 =?us-ascii?Q?SRWgX/EYBQKRrOfBAugHHq2X0npZBceUYRpjNZCFdTjbql7oLgY9ifCr8+yF?=
 =?us-ascii?Q?CmJsMWTlFAd3QoYiFVkFQrdtI3q/sB3+TNYCjKxt646mSDoZjjztUcES7z7a?=
 =?us-ascii?Q?VtzvHp6pMj4wSY6SI3Mx90opzsTz4mpZ0m0XbImzCdkqRoSmufN+Az2RvA8y?=
 =?us-ascii?Q?fY9jgNLbWRRC5ZM0mxmq0saV7Rf9mSHb6kNezEzH6YaFnKIvzWPBQveY1Rhy?=
 =?us-ascii?Q?5U51Tif+fNcGc5rKxwbvrrR/7vpbyUM6YKQ+Ks7RvJim1JU8Zr9rW8Gbv/0E?=
 =?us-ascii?Q?hIALyRqIeN+dI3+sfx5YpwoQ58q+byESHC0Ir1uXZItue1Ex/3caPPMdSY+o?=
 =?us-ascii?Q?214DCz8MrVmj87Fhfa7q2jAAoUpdzyxHphHdOLMGjsudhkQKcADJI44iikzI?=
 =?us-ascii?Q?CDf3UbM9rTN/nFJHHx+0Kr7IlPXkN9X+hVtkdCNI6EoKbl+RW8AVPEs7+fmz?=
 =?us-ascii?Q?FFpXCQj+tPoSo/aODA6OHqWmyXjxFvf7pxl3/lCXtxzCtaqxJHoNofUHHFFS?=
 =?us-ascii?Q?c/X80Dc4FDADY4JOBG/Y7XoVeKcecB63o3R9fDjZTQbbYp/rvA3gRgUt875G?=
 =?us-ascii?Q?RvQrZRWgOOIv/0xArrq47Djtp09NsrO54aubv9d1DNBf6hnWWio5CqhE0/3e?=
 =?us-ascii?Q?9lIpU3GAZ3OHnwsrtwMoVT/4NEXs9TYeDsYGTefm2pDr1IzRme4eADY88aNM?=
 =?us-ascii?Q?vVCexTcHiAA+DFjhMQAhfL1zJoPIMYqGK0dg5CvrlQ9EQoRXBuibAV3kAOm7?=
 =?us-ascii?Q?jbT3q08MRkgV2pQZw5Ph3moUe0005E4sMLeOP1+kjoiX3KFAZLPLAUmEIoJJ?=
 =?us-ascii?Q?v0sjzag=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093138F50B102737D402D6CE1629SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2281
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT004.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c017840a-f655-476d-8f63-08d8ef57257e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hN7/qbqLQeLHNg6avyDFzb/iaxU441JTxXID/MPu1UpJaUwyfFKqHOu0ORGrOh9WXF1UAu3px6cjw0kyilsvu46o8YCyI8PsnPuei7NFEXTvSAMTEhdPT6s3TcRl0sUwWKsXZpHluq4yVZLZN5OA3/yNTBeINGjdq/tq9VUOilX5EhAwxc8ZVBZk+k5qHxIiLsqSsXfuDagXaInDtiyLh48QTMPoJs7FkoivyPtR2brUghNWzc6Y0VNkEnhHnrmLNeDODuH3MDvmOTzqNlKyXUkOJI+/R4U21rtqKOv8m202HsPHexGBlH6Jrr5S0GTuF+VGBbsZT8cQP4/cbmeFbofzGEmPRxHzepA6BNwgiBWbOfQNPHnDJBFzfDtr42GzOA8i1dSmxxBB1/60+SKxGKs9Tjs7lgy1TWR7A+SN+jE+KyeyRihm4F1TMfduKMDgaK/vWwbskO9rjWKchuJFDbEZ5sOiH7FOyz9OJOTpcJA8irbLO/eA+DT3TT0FRmSMsEJBZn31EJ5/IjUXRs0fuY4zdlNSBISU3sCmMoRP77kH7VyuR35xerbv4zk+DaOE+0fVyXLUCpGujhjwMib2UikCm9e7mVZuOdAHhBroW7JhKATBE7Ldodt28oPBrsO+N1K5feNpGlsEC37xvnjXJcsFuaVgT4LLUo2cqzOeESvU5awnbqcpbkJmsufzHTZ6HTJ96gko35ZW4Rrx7/L3T5bZR820AUUKtJ223tXUob0=
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(36840700001)(83380400001)(55016002)(82740400003)(336012)(86362001)(82310400003)(34020700004)(356005)(8936002)(26005)(53546011)(70586007)(70206006)(33656002)(36860700001)(2906002)(6506007)(9686003)(6916009)(47076005)(7696005)(52536014)(5660300002)(81166007)(316002)(36906005)(8676002)(186003)(478600001)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 06:28:06.4171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67732e49-07c3-44e9-ca1d-08d8ef572717
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT004.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4077
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

--_000_SG2PR04MB3093138F50B102737D402D6CE1629SG2PR04MB3093apcp_
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


From: Jayashree D
Sent: Wednesday, March 17, 2021 5:40 PM
To: openbmc@lists.ozlabs.org
Subject: Gerrit trigger CI from Jenkins

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

--_000_SG2PR04MB3093138F50B102737D402D6CE1629SG2PR04MB3093apcp_
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi Team,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Jay=
ashree D <br>
<b>Sent:</b> Wednesday, March 17, 2021 5:40 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Gerrit trigger CI from Jenkins<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_SG2PR04MB3093138F50B102737D402D6CE1629SG2PR04MB3093apcp_--
