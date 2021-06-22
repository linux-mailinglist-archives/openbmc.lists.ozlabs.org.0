Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB693B0B4E
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 19:19:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Y6F5RZKz30Dr
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 03:19:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=dXJFf9nj;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=dXJFf9nj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.104; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=dXJFf9nj; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=dXJFf9nj; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300104.outbound.protection.outlook.com [40.107.130.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Y5r402Vz2yjB
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 03:18:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97kfwVpWvEGAuQFfPji+b037HWYGrm9NGAGflUHcmWg=;
 b=dXJFf9nj8R/5K30TDZsU2lrfLn/+a0jMmv2mkxS7p2vGFE1FMIF7tc17GeEZSk/z+NnjljOxg8j4Gp3AnSGJTu3rY7tNLSw6E9I26Ggf1IzocdwdAp2FXWVKx0/fLTpYdCF0PQU0C1UasRPlZ3rAUnwhmHllmN57ZjYGW6KZFjbM7eO2JxVjfsko/sQSAQ2J6lJMG/5wVpEGlUzdZ7TQQ89K+zsGqnxUTj8z8mbCUpY0RGhmh6aLZF21gYORarHzOYvqYA/lozbZYuaGAs/vYNJXaPLtpbPDxmpictcMhijx20rPIdDln0CCaIMagW74TSKyPwnN2eHL7Jq+zv8ecQ==
Received: from PU1PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:803:16::36) by KL1PR0401MB4933.apcprd04.prod.outlook.com
 (2603:1096:820:88::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 22 Jun
 2021 17:18:46 +0000
Received: from PU1APC01FT049.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:16:cafe::99) by PU1PR01CA0048.outlook.office365.com
 (2603:1096:803:16::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Tue, 22 Jun 2021 17:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.54) by
 PU1APC01FT049.mail.protection.outlook.com (10.152.253.9) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 17:18:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7oG2lX9dOmrrOh89hZ/4M9KlbVmG51MiEAnPINAH+KpvWvXgt6ZYoP5rlbosSlLYLuR5tGIi7DE1VYg3AKDeh6TNB/dHJARhSuEiBzhiCK90o57lF/MzQS0kpq2uIfMIcGje9XV2NKSVFLf9qu9gOBercmz7k4Mzfwt+hWXvE/W46T3sAWKziINzUCJxFN5k5cnz07s+UOjVuCvz/GjXrkBa5TQyCh0JrHeercSuyjmAupf0NaOC+Gh8Kl2UTp3YLGS8CXE6YgeTya/vUzi4XSnYwkpXTuyaRudz4dwAYHNr87Xpm85mBUiX6DNeAXwqg71+V4w5HANsgnfGMf3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97kfwVpWvEGAuQFfPji+b037HWYGrm9NGAGflUHcmWg=;
 b=GuT5SygBzsrGlgYyUU6guj7VeusnoRKcqEOvFj59BWxDEccTs7EBg+W8+LUQCAXh0oL2gW6MERLuVrm06Tk4qhK0K4zHeKzI0HBONU9xD7BWFGxhAhV1ryLyuYQCx+bBbP1qAaquZ6/qyL/hqxhybmNteK0A6qWu/zEh2gexFC6ocaqmfDQGeO7FsN1KmZsmErkO0JTnQq7RJghmyYsJjqmLYDUBKMIrrjr6t5NsRVwJiqlZxZWOwV8OyTsaB9RY1tZkcYac9SrmbTQ9lu9BnWQvUNvkp5/IK8+b4RIreREUqWbUED/Y8yKn+0BW/xMX6/N0x7GH4igIy/HW4Rpocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97kfwVpWvEGAuQFfPji+b037HWYGrm9NGAGflUHcmWg=;
 b=dXJFf9nj8R/5K30TDZsU2lrfLn/+a0jMmv2mkxS7p2vGFE1FMIF7tc17GeEZSk/z+NnjljOxg8j4Gp3AnSGJTu3rY7tNLSw6E9I26Ggf1IzocdwdAp2FXWVKx0/fLTpYdCF0PQU0C1UasRPlZ3rAUnwhmHllmN57ZjYGW6KZFjbM7eO2JxVjfsko/sQSAQ2J6lJMG/5wVpEGlUzdZ7TQQ89K+zsGqnxUTj8z8mbCUpY0RGhmh6aLZF21gYORarHzOYvqYA/lozbZYuaGAs/vYNJXaPLtpbPDxmpictcMhijx20rPIdDln0CCaIMagW74TSKyPwnN2eHL7Jq+zv8ecQ==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR0401MB2159.apcprd04.prod.outlook.com (2603:1096:3:4::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Tue, 22 Jun 2021 17:18:41 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d93a:6771:3a9b:d411]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d93a:6771:3a9b:d411%7]) with mapi id 15.20.4219.025; Tue, 22 Jun 2021
 17:18:41 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Rsyslog using Redfish
Thread-Topic: Rsyslog using Redfish
Thread-Index: AddnfrgX+SaI3p2qRYyZExRTaER9hg==
Date: Tue, 22 Jun 2021 17:18:41 +0000
Message-ID: <SG2PR04MB3093DD642B1D80C03EFBAF91E1099@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiOTNhYmNmNWUtODQ4Ni00NDUxLWIyOTMtZThjOTU5YTIxOTc4IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlJLNlZjZlQ1VWlEOUFRR3lSdEEyR3V3QkN3bDdsQVFNNUpzNjhCTngwWXFjR3lpcFJiK3JUYTVFd1d5NlJMMHQifQ==
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2401:4900:2353:949f:a54a:fe9f:8eaf:a527]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f40bd302-6a8d-498d-388a-08d935a1ca6a
x-ms-traffictypediagnostic: SG2PR0401MB2159:|KL1PR0401MB4933:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0401MB493329882A8E9BAB1D6E9A19E1099@KL1PR0401MB4933.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JSG9IN73Q2h4OUkNbWfR3/ti+Ylxg+cFSb5l0MeLIGEzrn9uHwN1D8p2zKhUrC8sIq8bdjSYldz4Pc8MGRz0194MESMuJNCOOdSQtriekTTySEXo00LZI/1l9kzlsdukJH/amgfAuIMK7xq9+5NBy+SFa3qoFNJ3KfDg6kq//4AJHw/0AVAMsASIKOmNnRFJ2gbIUyoN1EjzqMA0RrAzbYYGTN83DLR+YCggY9/Kcjlqc//vCWkmySCLxg2mrmZgT6rUNdOaLqaKFG2SpL56uXWLsFCIRIIQ91s1mBf2bP/MbZ/EoPkDyZ2E66AUaqAFBnKMuLkdFKjecEfaxCa0GA008NlJUHrJUQNo3LoPUGfRMdMzgVBpCk8sR842p/6OIA4SunwM5J0pE3Q5m0Dn0git355bI7dOP240/I1pOHnFTKsw3+85qcpCiRkfUnKzHMa6FYL8FFLlql65EZVol7VqDK0fu4fqcG0jIH2C3aefePiPrreT5/gUoPXFAtUMHbyE9gFuEfsHHtY72sluuc8POmI1G58E+oWojnF6xWVOkuGuI2MuSkRg8OSVOMReC2hukCsT3EoxfLBOezTlsPWh5if91j3XbVDX6QvTNx5i56jcnyML5ooyeuEmEr0qqghJbN1RLKpRjZlAbvgTHhr2mVwhIjqnM5vFCcfS87y/cvDQW1JQq1w5DZVigMjwdTFp3Sm3ZmQcwjX4mQZDNQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(52536014)(5660300002)(966005)(3480700007)(478600001)(316002)(6916009)(7116003)(66946007)(66556008)(66476007)(76116006)(66446008)(54906003)(64756008)(4326008)(86362001)(9686003)(6506007)(8936002)(7696005)(33656002)(122000001)(38100700002)(55016002)(83380400001)(186003)(2906002)(8676002)(166002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RGAZeRjDvVU5c4ggug1omtLmIo/NMm8oqQmgQqiY1fGzGMZRGQ7wFWSrOflD?=
 =?us-ascii?Q?ikSkCOdpbTaEWxV7IbW4czoUMrsPp84A5wUbusO0XOWrcSvTeNKRrimd5r/7?=
 =?us-ascii?Q?W4a1muxs9bW189IfNA0uKfohGokTskZHGw7HFhJ2P9gRzbGPUYzaAVsgp6WY?=
 =?us-ascii?Q?646N6dv7+fYbtSiMTh5GWeq+6Q4RhFnoTAIi9C/eqOVitrFj24ke7pSdsg5+?=
 =?us-ascii?Q?hGsytnuYlFsqODbOm1Ma6dtXvXK+QclfNg4mqqoutJo+zVdY6XaukDluVX83?=
 =?us-ascii?Q?nUhh1qtMfDGa9MAGBT0NyWbTcWYmZnI1lmB65jYZ9YHNDxcNwsDzwFZe513j?=
 =?us-ascii?Q?SWU/Ql3PRsKZkZH50aKOcdEjd9fohKlBTsl1A2mKtqKX/Z7GkB0ZjHX9WmaD?=
 =?us-ascii?Q?CkNz+XeWsQmbnQkU68oB30xIq3qyv8XDBfSkbRpHakQqDxEHMLqS6aglVFtZ?=
 =?us-ascii?Q?AJPIOAuwgrB6h/f9R+6j8Bb9fTomolMaLFwFCh6cGsR0m05nqGLZcQFOUnuD?=
 =?us-ascii?Q?qKxjDL5BOsuFOI/S3BPIXoN5frPg20SiBLfh2ztp40YK9uXiGBSzaEi9FvIl?=
 =?us-ascii?Q?S7Za/Sxer7WGPMU7poGVFtquoTf2lcRaD87OuDgDTyRqcZQ/QjuBtiZUICNw?=
 =?us-ascii?Q?wXyczCVmr4UpfJNTyp0KK9HRaERIdfRl9q53j7JWNYflqBD5onZHDYGfeQoB?=
 =?us-ascii?Q?jVkQENFhua+BhobJcE8g9S3ytQ0imv4IN3GCBSsv35VT7N+ZsVovSIfwNqcR?=
 =?us-ascii?Q?VFLd0x0r7JlfGVwUTV7EsltW5/Vg3piF4BASuX3Mr4RS9fKB9aQc0vVN2eVo?=
 =?us-ascii?Q?ivGYzSc56W1d8U4M1Unx6PvBaVx2n3uhfjanYaEhUDBURTdlpvghDgJ4NygR?=
 =?us-ascii?Q?rad/E2bQSDnUPn+wh808KeyuldXcQdIuGR+broI5nLdmZzNMakw40Y7WJuY+?=
 =?us-ascii?Q?vnu/5vNYd1Qbc/l8g/ow33OR382N+EJiexR5LpHeHzeFlxOMGVdcqDaDPZBC?=
 =?us-ascii?Q?fMcdMck1s36B3eh3iVm60vi9F5AXi+AmMWlwn8EIhY82N70XgiZb96r7pO7e?=
 =?us-ascii?Q?7Cx49AMZBmogLbFhMjVWb6OADfQVsGyPOaJFtZyNKs16iykkpYpmPqMcvneI?=
 =?us-ascii?Q?bu6etqZjpUqAdgNugUtmg/bRMcLkCvwnxd96bhbuGf9azMBLTmUCfV5yCfVV?=
 =?us-ascii?Q?ibw49MQLch9v3hBpbJ2TrbJurp0815iuUjy5MEvmWbZmdv3L2Vo0hyIlDRvl?=
 =?us-ascii?Q?1w14HyZk2b5DMVR5cWgmZkyoDyqertFgQ3OaRwamEYbvqlh5NhIGooZZBVMy?=
 =?us-ascii?Q?2VOsTEc3FI5yzsDpX6yGdaSKuMTzVKdWcHQU9CHukUnG0cimHhoqLHt/HNr6?=
 =?us-ascii?Q?e4AE5EVDj4LQW7TQtVoC9z2ziqXD?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093DD642B1D80C03EFBAF91E1099SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR0401MB2159
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c40fc92c-eee7-443c-1858-08d935a1c83d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bTHbFHywhh5Do5XCkplODkiyly2700lCDQFnVvjXUoUr6+R26UQwNhel09srqmSLIIR6wrxmSL5qy/aJA6w/WxXuJtd3W4rl1vJQ9A7UGpS70qYCFSb7cJOG8XFIZy8uHg05fe6qWp78vNc17XolXZmmeB49dFoybQ/ek1wP6NaLbp5jftSqYNUIAaGETq6ajvylREC0bSKC3AW6lCpJOAgo+cjt+BbQJou4fLJu3dkP3e0CLW3BIwAF9vu2ohJZJKMsFbbfWOFyDnJvWVtqaMcrH1Y6DU7UmVc0jbvI/rz7E/tqdo4EnB2TZv4ZCnBWHPooBG849aUtE/ShQCRe8zIzAavvEH3OOxXocLMRxrayzh2Phx6rlOQmOrVnzXyLmWtTzC5UcUjdwprn1JEdcXVnk68cVETVKUuYp3SL3Izn4cS19/kldxTmcxTaM0syeH341vfGblJAe5mTWSCNP5Uk1a3SCdWzbYg7IJpYdFAsOANL+4wigyv7EYGf/cLKA8xun4Du886UrPB55DxKTIOS8/7YcH11uEfIjokse68SYgLSnNXDT3o4V4axS6YGchvkc7YrXiTuBpHpkYrepxU1vY30PlsDLER7nouOpy6DYcIvi3hmWj5RssDCYARImvojGGsEoqdfLeTewCghC+W7jia3tmYiX6uahEKaCql71fapOu+LjzEPhOZ0q4Kt1pA3mmVScUJVB6QOT/VuIZCyPz7LGG6eE1E7MWiG/iCg1VT6+4vTHeONEy9zSiGsSKR69HdQ7KiZcpoOqncpIwwzrXqPymQPY8ND4GNCxbNJhYzMWZJO3kKwGvPNMHbGGJViFdkL1nYMqusZxDmd7tP2TaVPTXSBZc19JTwvzD4=
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966006)(36840700001)(70206006)(7116003)(36906005)(82740400003)(356005)(9686003)(81166007)(26005)(5660300002)(8676002)(54906003)(8936002)(336012)(3480700007)(47076005)(70586007)(55016002)(6506007)(186003)(36860700001)(4326008)(316002)(966005)(52536014)(2906002)(478600001)(166002)(6916009)(86362001)(83380400001)(82310400003)(33656002)(7696005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 17:18:44.3855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f40bd302-6a8d-498d-388a-08d935a1ca6a
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4933
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
 "benjaminfair@google.com" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB3093DD642B1D80C03EFBAF91E1099SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public

Hi Ben,

I submitted the below patch in gerrit regarding rsyslog for my platform.
meta-facebook: Add rsyslog for yosemitev2. (Ife76252d) * Gerrit Code Review=
 (openbmc-project.xyz)<https://gerrit.openbmc-project.xyz/c/openbmc/openbmc=
/+/44122>

Also, there are few patches in gerrit for rsyslog which you have submitted.
https://gerrit.openbmc-project.xyz/q/topic:%22rsyslog-refactor%22+(status:o=
pen%20OR%20status:merged)
Whether these patches will be enough to store the event logs in redfish ?
or any other changes needs to be done for my platform.

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

--_000_SG2PR04MB3093DD642B1D80C03EFBAF91E1099SG2PR04MB3093apcp_
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
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Ben,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I submitted the below patch in gerrit regarding rsys=
log for my platform.<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://gerrit.openbmc-project.xyz/c/open=
bmc/openbmc/+/44122">meta-facebook: Add rsyslog for yosemitev2. (Ife76252d)=
 &middot; Gerrit Code Review (openbmc-project.xyz)</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also, there are few patches in gerrit for rsyslog wh=
ich you have submitted.
<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://gerrit.openbmc-project.xyz/q/topi=
c:%22rsyslog-refactor%22+(status:open%20OR%20status:merged)"><span style=3D=
"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;border:none w=
indowtext 1.0pt;padding:0in">https://gerrit.openbmc-project.xyz/q/topic:%22=
rsyslog-refactor%22+(status:open%20OR%20status:merged)</span></a><o:p></o:p=
></p>
<p class=3D"MsoNormal">Whether these patches will be enough to store the ev=
ent logs in redfish ?<o:p></o:p></p>
<p class=3D"MsoNormal">or any other changes needs to be done for my platfor=
m.<o:p></o:p></p>
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

--_000_SG2PR04MB3093DD642B1D80C03EFBAF91E1099SG2PR04MB3093apcp_--
