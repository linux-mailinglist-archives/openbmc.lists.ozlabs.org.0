Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AC636F63C
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 09:15:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWkCQ395Jz2yyt
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 17:14:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=hUuRH1QQ;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=hUuRH1QQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.118; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=hUuRH1QQ; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=hUuRH1QQ; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300118.outbound.protection.outlook.com [40.107.130.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWkC52qfXz2xy8
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 17:14:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn56leSZn7/ciwqiIyWlHVSL29MFEb8j35bPBucnF3o=;
 b=hUuRH1QQ42+YtlM64uWKDntqPNhKsbaD99TDR5eNvjFglf5yD2FqHdm/M0dOKxNu4li3SKWB6JOkFX4nxTy9yDfrGpOszVALQmQZKVkXzhpQBI33fFQ8BNLqpEPJ6ZbCKk8HYZBobqVInCrGLM16hHju3GT3p3YZytHcUHVOoe2cHbz78gZHJsPC9T1BXjBeMsl8cgJLwVaduXgHb+ztXGvhEl6/3CB/XSYIQT4kbxgSHInzUlf8rqPQksUjdPDU+RCw73CT3CH/oAutCbwbnlzVZjvNiTuXoPlww/YH/l/zpbU6CVzMQBAq5BcdyqyJkbrKc8yAu+vHzqnpHQNFJg==
Received: from SGAP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::28) by
 KL1PR0401MB4178.apcprd04.prod.outlook.com (2603:1096:820:2f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 07:14:24 +0000
Received: from HK2APC01FT024.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b6:cafe::1e) by SGAP274CA0016.outlook.office365.com
 (2603:1096:4:b6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Fri, 30 Apr 2021 07:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.51) by
 HK2APC01FT024.mail.protection.outlook.com (10.152.248.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 07:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnAhP9Vl9xAjdsnR+Byp9M5BdcFVNp9WCERWpA5ywfwyog7UAm+nVrILoq7d6Q1LBjl6NI9C2ChKAkhJV58BjIzVe6ngHA+msSpsBLSTRHh1S9xzOSrNma0L6TdLIicCrgjKiFNlrAAac2cbdIVv73/xEWb7tyepmv8fTZ2uFERBXsrOp9+hNb0aq3P8noKBFefsLM/jMqrQnoJBfOMAXjkEkkb8Qzhz1nEl7pLrOZrhrZx9jhrvFDUMJpRyS4D7SBOaJRHcaS73NbodooNi04J9LhaHbhrSGJMtEhRfZzNPIBCYoUF7QP6YVUnv45dLBnQWyO2XeJqXlU97snk6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn56leSZn7/ciwqiIyWlHVSL29MFEb8j35bPBucnF3o=;
 b=iIIuBUR5qUk7GN9W/9aTcN8ztecXoXGKhFih3YALFLIn09zbiOMCUh5d3UfzND1zZys4nA+3hSBDbrBg511lXv9baDA7f+guoZoTqXyE+tEmCrGEkkl2WxYHK9uB7h5Xa6mHHW0kLbMEiI9keUlvRTwNHEfHzfngoVfDbBhlPJA6moF0d3x+GzsBI8pRAvrUmL0ca5nn4GJrtv0WYJCCDANviyfvJpMAabdexAjWJlrzvbUlF5CBqB8lour3KHlpny3EbrH3dxPFKBznmOAVCHTNuqoObvnFUehBqSPAWGYMkLJCqK36vJKpjWwydOtL2gBeCqelZbv3sSiJ4a9Obw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn56leSZn7/ciwqiIyWlHVSL29MFEb8j35bPBucnF3o=;
 b=hUuRH1QQ42+YtlM64uWKDntqPNhKsbaD99TDR5eNvjFglf5yD2FqHdm/M0dOKxNu4li3SKWB6JOkFX4nxTy9yDfrGpOszVALQmQZKVkXzhpQBI33fFQ8BNLqpEPJ6ZbCKk8HYZBobqVInCrGLM16hHju3GT3p3YZytHcUHVOoe2cHbz78gZHJsPC9T1BXjBeMsl8cgJLwVaduXgHb+ztXGvhEl6/3CB/XSYIQT4kbxgSHInzUlf8rqPQksUjdPDU+RCw73CT3CH/oAutCbwbnlzVZjvNiTuXoPlww/YH/l/zpbU6CVzMQBAq5BcdyqyJkbrKc8yAu+vHzqnpHQNFJg==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3561.apcprd04.prod.outlook.com (2603:1096:4:a0::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.26; Fri, 30 Apr 2021 07:14:20 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::54f8:a70d:5570:fac9]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::54f8:a70d:5570:fac9%6]) with mapi id 15.20.4065.031; Fri, 30 Apr 2021
 07:14:19 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Issue in displaying hardware name using Redfish
Thread-Topic: Issue in displaying hardware name using Redfish
Thread-Index: Adc9faE074rZmKWfSR+zByZ0gUXogg==
Date: Fri, 30 Apr 2021 07:14:19 +0000
Message-ID: <SG2PR04MB3093D4832CB9DFE036DAA41DE15E9@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYzFhNTY1ODktY2U1OC00MGExLWJhM2UtNzVjZTkzMjNiODdjIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InZcL1FLUGE2RW1XNXZhS1JVRTVzdnEzc0l3UnBHR2Z6TzZMMWRHdlFub2pJQVpuY0M0dU51a2R0SEVUVXowRW1qIn0=
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:649f:2e7d:191e:6879:2074:5ad8]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 65c5b6e7-187a-43df-71ff-08d90ba79439
x-ms-traffictypediagnostic: SG2PR04MB3561:|KL1PR0401MB4178:
X-Microsoft-Antispam-PRVS: <KL1PR0401MB4178C39586A7F86F6DA7664CE15E9@KL1PR0401MB4178.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /dXzXlo5ghIiZOKfmqGYUyqdz19sALqyPAy7I4Z0IAKV5eJ+B4RisYVdKuqYVKbuIC8Tl6TIq3+rXB8NpRW0FTeHZf6pwsFmVzmCDACIUm/fXTzI9rH1jnc24V/V161wNNTE9A4xqV0OlM4FYSivB25mdr90y2ts6Fr+9OTRDkt5KOr+qePCBNQHee2tYY+AiyTq/EcR5dBGxb6QBmM4JaNd67NnB/q4vg5kiAUElwxUBMXBG8qtCRu7e0TX4HRUDCtMTYq1NBsss+mpfh6P5lWA2Qq/F+5VIP0O8+30uLHm+rlvOoHnBXdFy86Ovqdmbmp+pa+eHM+dMCjjPm+d6SrfPBSTX6xxe6psgc0eFJN3kyQ4kUiInNtaLzOnRYrnlWe9ZXDl+rYT9TkNTOzoqyO29bq7Z+TSaWQ3o8Hqi17KtXLNepSCr40MFGeNhTuqgsRvZb7r4Vo+Brp3XhNie9xhL7ySwHgjEUuYmi8lN4NsEHVHG5y67DjoMDm+iBeOT2FcnUezv/t3uzCIXWIxEthD1jny8nnkG5UsnyXPcyCe2fdi0YxxgPh1SOp4NylU9aV9O36noBav2g+AcMxFv84S45I2KHPdZ3RQ20nfI68=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(86362001)(122000001)(6506007)(38100700002)(316002)(7696005)(52536014)(66446008)(66556008)(186003)(66476007)(5660300002)(64756008)(966005)(33656002)(6916009)(2906002)(9686003)(55016002)(8676002)(83380400001)(71200400001)(76116006)(66946007)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MTDRQBYXx5Wi9xFy6MTeQ0VOi7/LH3QbmylHc1rmLnGJTgFjQUQagapZ0zXU?=
 =?us-ascii?Q?53grcsGJOy2FOXtW7WXT6tZ43D30dnQbuCgdyCC7G4YylhLT/MZEvkCWxjxl?=
 =?us-ascii?Q?v+WH5RWJKS/sAmPcqV9QRTIuE88/DoXKEmiG/ve6ZSHGr+A7Fzhm46gYFug5?=
 =?us-ascii?Q?yJ3U35ujChZaxAmYDOu+gYsbYulGdYUM2jHtlAauzrFMhnBFO1vF59H8CAYP?=
 =?us-ascii?Q?mGAfElM/92s0uFQvyCk2QNRH2yj0vhNJHSDgZqZu+nuXuKtStQcFAMIAROrS?=
 =?us-ascii?Q?Ga8fBMZ4+OhQUq6uQvfWqtlDB7Uz8adv7BVrsA3EDtFOWL2XanMyW7hmhqwN?=
 =?us-ascii?Q?02LJeJozqeAc6QVCxCCIolnmGEnTcneO2IWm1f77MT0dg+Us9FtWPMm0rzBV?=
 =?us-ascii?Q?4KxreF8SCuZ0IR8v8RtmLXnnRcc8j9s/4egRGYS4Btd/bhoKdFU+QtN8q79g?=
 =?us-ascii?Q?iq5XxaXu45EQACqNEfupZm7D51edUYfDJZTu6qLHW9NACI3rVy52FC6n5V6H?=
 =?us-ascii?Q?nhwxx8iJEnqDrfodFx7YuN9fGCLno4K6iQ8RYflYlFrEfhfokizlCNq0gT8B?=
 =?us-ascii?Q?QnNEzFf/EYbo3VP5VTAG76O7h0acvLzOORVVk/iQwvjyIX0zF4X8zZpa9lRG?=
 =?us-ascii?Q?BxD+QCgguAPZsRJHcF34dxfhayU5sUCvOpYzjUNd9lBugbuW8AC7q7WzNJoW?=
 =?us-ascii?Q?8iPzGe2aUbpMKrrVRckzDLmRUg4NvSSe9mfzpgSWf5OVO/2HiFYthgzQdA4y?=
 =?us-ascii?Q?m9lsc1/8uw8rw3gTVjCR74tWKeGEDX704rcn5AfUrP4I/Sd8/iTMSxFthMk/?=
 =?us-ascii?Q?eoUcX385XgYuSgaz46ksEPdBt8o3LbG30ukf+cVK6omYiMuKF7ppOfEwymC+?=
 =?us-ascii?Q?sc791vwnxXX+HvlOqCSKB+Fw0lPzoHN8XWKULIllgqfkqlVQzZ2QCbUl5ifT?=
 =?us-ascii?Q?AGKik30eSmKHAUoips+L0a58hWKwUrps7i367JK5osZLCWtOrvjP5RrtBNbt?=
 =?us-ascii?Q?AZ5ODJQyGzK1Qz2xBP53lgA9Xs6X3s3bjcSd3mooShSCf3wCTVn0qRykf9ZN?=
 =?us-ascii?Q?EvvFNOo+GPnU2ZL9woOXk31zlrUuL/lcI1GzncF9KH4x0UPyfbZLnw8zpmHH?=
 =?us-ascii?Q?SyUhXCjz3sBy5/g3CaoaQ1OTuNr7gXtRrpuEkOgXLzHS3d0MAinDXxRKqBQY?=
 =?us-ascii?Q?gb7mBUDR770baWj0Z9oyE9RyB7xNkRiz3LTtnuGSlVC5v85EwTic6gBjzdxt?=
 =?us-ascii?Q?CZnvyEtDfpn11uyFOrXp7KHXOgd74L/sY+SBgNyzy5ArT1fbwIW0dy56MOjb?=
 =?us-ascii?Q?jQ5IS24IJLDwpAl4fMs2r8zRB0Uidh3UR4I+fTl705znmdWU2jcRLU7JeRXt?=
 =?us-ascii?Q?igtR/k92CQvNJRhIQYvFSe+Qrkrb?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093D4832CB9DFE036DAA41DE15E9SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3561
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT024.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c8c84421-6ae5-466a-461e-08d90ba792c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BhmogCoKawWEWAF0fNZsoCNAua5rZs80rVS+hslJPUtfcpBBTmqBByiTSm4U7vywXtUqWnZvpsLxOyUx/GuFMbYqQjpgykBYMHneo/4gdGvpMK99GpPQObxxM+1KSh07+gOi1zadNVs9MKpvjcxvjsM4QZj1Iu34sLktAuLvcqgUK5cBObqEsN4HGt1YpDcO9w/wlMEecnLdv5me8cee7yS1VaYlD0hnqgSMfHhwjheezo9P7K4ClkySdDOT4ZyPUDR1oyFoE6Gb0P3dnfAK+ECzUQcofZNIDYRMjlf4fdOHm9kZNmzUMJ6PBZlU1B1tCSjYm73NwhXF7kFfIyPYy4OF/MWNOSYePXfU+WfQ1sT6DH8qGRI4mAB966lsE+kZQxRZoY/acB3QfhWQAA57Ju7+QnGU1VVo47D0ImuBj4MYwMgrqY1uBMyp4Jq8TwhcF/JXrhSGaBca5Yrz9YltPGZDQn4E3dLF0Omxv03+1YKkpIvQdbcbL/F/VFi2ZQizGy0nc0TAME6uzSq+TMXpCraF+DL9PIn6nDSRWoPH5yzq/uL7Hk2wgYqvIhm6OEkz5TRnW/wRMvp5PcPkoo03EsUq1yNHDYNWqm93UITTZCK8hfHi59QRUxwzMjZRgc8o0SN47x33QobAjyCY7wN+fwJVDPXd5AoHBdeKsgotKRSsGPcBP0aHrbJyKGTnS55IUw+/LxZm8vDuGlJMAU8VTjJ0oJAMmpyvAft9zAATUbg=
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966006)(36840700001)(81166007)(47076005)(2906002)(8676002)(8936002)(966005)(5660300002)(34020700004)(7696005)(83380400001)(478600001)(33656002)(316002)(82740400003)(86362001)(356005)(70206006)(186003)(55016002)(9686003)(82310400003)(36906005)(6506007)(336012)(52536014)(6916009)(36860700001)(70586007)(26005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 07:14:21.9425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c5b6e7-187a-43df-71ff-08d90ba79439
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT024.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4178
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

--_000_SG2PR04MB3093D4832CB9DFE036DAA41DE15E9SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi Team,

I am using Redfish commands to verify the details of sensor and hardware.
But I am getting the hardware name as "TiogaPass\ufffdseboard" instead of "=
TiogaPass_Baseboard".

curl -k -H "X-Auth-Token: $token" https://${bmc}/redfish/v1/Chassis
{
  "@odata.id": "/redfish/v1/Chassis",
  "@odata.type": "#ChassisCollection.ChassisCollection",
  "Members": [
    {
      "@odata.id": "/redfish/v1/Chassis/TiogaPass\ufffdseboard"
    }
  ],
  "Members@odata.count": 1,
  "Name": "Chassis Collection"
}

Could you please provide suggestions on this.

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

--_000_SG2PR04MB3093D4832CB9DFE036DAA41DE15E9SG2PR04MB3093apcp_
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
<p class=3D"MsoNormal">Hi Team, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am using Redfish commands to verify the details of=
 sensor and hardware.<o:p></o:p></p>
<p class=3D"MsoNormal">But I am getting the hardware name as &#8220;TiogaPa=
ss\ufffdseboard&#8221; instead of &#8220;TiogaPass_Baseboard&#8221;.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">curl -k -H &quot;X-Auth-Token: $token&quot; https://=
${bmc}/redfish/v1/Chassis<o:p></o:p></p>
<p class=3D"MsoNormal">{<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; &quot;@odata.id&quot;: &quot;/redfish/v1/Chas=
sis&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; &quot;@odata.type&quot;: &quot;#ChassisCollec=
tion.ChassisCollection&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; &quot;Members&quot;: [<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;@odata.id&quot;=
: &quot;/redfish/v1/Chassis/TiogaPass\ufffdseboard&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ],<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; &quot;Members@odata.count&quot;: 1,<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp; &quot;Name&quot;: &quot;Chassis Collection&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoNormal">}<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could you please provide suggestions on this.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<o:p></o:p></p>
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

--_000_SG2PR04MB3093D4832CB9DFE036DAA41DE15E9SG2PR04MB3093apcp_--
