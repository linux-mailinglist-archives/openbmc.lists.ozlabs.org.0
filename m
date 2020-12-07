Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B36D02D1517
	for <lists+openbmc@lfdr.de>; Mon,  7 Dec 2020 16:53:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqSWz2PsBzDqBc
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 02:53:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.107; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=bBVdGpwO; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=bBVdGpwO; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300107.outbound.protection.outlook.com [40.107.130.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqSVv6yVJzDq63
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2020 02:52:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLITZS3OcXKn3MU2WTY+AzQY1lzHr7meKRgDpKJHBNg=;
 b=bBVdGpwOM9kb/7x6SbpSqSwoYwaY8Klq2JzMwRpXg1OqIfeUksXbXlZPDBjIhqwJS48TdRyDCoDTNU+P20yk/6MOR+9sBcrEeQPD+sbCwghzfx5Y56hi8XDCWFVpwu4Mz0Zlm5hQA6comNzS5DkBPjnbnnn5Q/esNcZyEnGfDdQ=
Received: from SL2P216CA0059.KORP216.PROD.OUTLOOK.COM (2603:1096:100:19::21)
 by KL1PR0401MB4195.apcprd04.prod.outlook.com (2603:1096:820:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 15:52:05 +0000
Received: from PU1APC01FT113.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:19:cafe::48) by SL2P216CA0059.outlook.office365.com
 (2603:1096:100:19::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Mon, 7 Dec 2020 15:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; us.ibm.com; dkim=pass (signature was verified)
 header.d=HCL.COM;us.ibm.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.51) by
 PU1APC01FT113.mail.protection.outlook.com (10.152.252.231) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 15:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEBBmWLjx93ApTVw77Kl66vACXy2Ypa8J9cqfECubcEtTLvkI3ghBDDO2NTh74s7ZNwtO1AZ94LcIsNb5PDvWxIHSN0s+qsDvaFet+BykuO9NLBTpeSS14o7AnS1mMpkMfX5CXZGwEiPQh3xyRAI5qDG3k3vwugteGTR1feTkhqDsZn1e1S5AxXuJROLMGZcaUhHP9Lp6Kh5ES0yahATzzFL3X4KkMEQ/bEFOy2LjY1ajo2xezQVL5mfACqHBfl+dRpbP42q6GCpnxi0TS3nE+1PHNvf1ICJWTVq+H6tD6YLXftC55E/bGYLQ8mYipCwb2gtS7cb6QlhpdAxFD7jpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLITZS3OcXKn3MU2WTY+AzQY1lzHr7meKRgDpKJHBNg=;
 b=lSuqWekJlKHPb9zD6Skmhbr8TjlHV2NmraU/NRbY3rShqBvIwMEA0Pauluk1MePWVOjbbgymDVwxC/DDMy4Dsi/G+k2o/o+EnxrWStEC27m6vXOAZugsPQ6UN7njI1Z9u4sQBeKuMxDuu9rsPPEeBNfdgFwIN37b9Nmb8MBjwdy9gNgOWBg1BMBNOmUxUhiQOoeLCDN4rUSvG64waCODi3Bo40U8EAJvoYPnbGs/QAM8pMSbBkoijVfcWmqjMmLti+KsBLokCbNFb8e3oOgJE2tBOF7GtA3rZ1vmfPO4QgqCJuINJ9GtaH7OuOaCCqwkNUTy8l4T2XeLLH2wzk3bXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLITZS3OcXKn3MU2WTY+AzQY1lzHr7meKRgDpKJHBNg=;
 b=bBVdGpwOM9kb/7x6SbpSqSwoYwaY8Klq2JzMwRpXg1OqIfeUksXbXlZPDBjIhqwJS48TdRyDCoDTNU+P20yk/6MOR+9sBcrEeQPD+sbCwghzfx5Y56hi8XDCWFVpwu4Mz0Zlm5hQA6comNzS5DkBPjnbnnn5Q/esNcZyEnGfDdQ=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TY2PR04MB3615.apcprd04.prod.outlook.com (2603:1096:404:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 15:52:01 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::c15e:e813:7302:4d79]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::c15e:e813:7302:4d79%4]) with mapi id 15.20.3632.017; Mon, 7 Dec 2020
 15:52:01 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: Milton Miller II <miltonm@us.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re:  NC-SI Asynchronous Event Notification (AEN) Implementation
Thread-Topic: NC-SI Asynchronous Event Notification (AEN) Implementation
Thread-Index: AQHWzKoSK7hrRB4UMEe36HFBz77EtanrwP8AgAAGI8Y=
Date: Mon, 7 Dec 2020 15:52:01 +0000
Message-ID: <TY2PR04MB33115863009D710731C97980CACE0@TY2PR04MB3311.apcprd04.prod.outlook.com>
References: <TY2PR04MB33113F1C94A2530E8033BEBFCACE0@TY2PR04MB3311.apcprd04.prod.outlook.com>,
 <OF8530AE61.94B90081-ON00258637.0054B61F-00258637.0054B627@notes.na.collabserv.com>
In-Reply-To: <OF8530AE61.94B90081-ON00258637.0054B61F-00258637.0054B627@notes.na.collabserv.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: us.ibm.com; dkim=none (message not signed)
 header.d=none;us.ibm.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [117.241.157.72]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d3aec6c3-1573-4f9f-05ed-08d89ac80b2d
x-ms-traffictypediagnostic: TY2PR04MB3615:|KL1PR0401MB4195:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0401MB41952CC429F77AE4E950FB66CACE0@KL1PR0401MB4195.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +XkEOh7wKSROlCLvYIz+cyF/vM5gjoVHpzV8U6pTiaiXYmEOAinQ6UyotbMsWXJbt5XiYeFqwoqXr6UOp2vyosqr212Sqy/vDZiK/Uxugn3Z2IpkjWQU3NJGh2RTqKJ6p86CSjj4/SccReVI6F11bmeup6RtDqN59Jd3BFmDdtT8ftSaJEwp7MzCXioDOMKrVnIwgrLdXNmqj0GkHi+xXNYGe2UXqTlJPT4BBTW1mvptx8+sbLQ+/sXWTqAoNz6mPaMuD4Q5J4ei7Q+YZX0wc1FX2+Q4nWi1o6ir50cO2ksa/WPuYcMeeBs/q5LgUYw+1Bf4kbmh7opWVQCEXUSq6Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(66556008)(316002)(66946007)(186003)(478600001)(9686003)(4326008)(86362001)(8676002)(110136005)(71200400001)(83380400001)(6506007)(66446008)(15650500001)(7696005)(26005)(91956017)(55016002)(64756008)(76116006)(8936002)(52536014)(5660300002)(19627405001)(66476007)(33656002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?M6gL0Fz/s65sdNPfnJur88d5rD6TMrBb/JI4k41tPgQXt1HJwzOwYyNlUJ?=
 =?iso-8859-1?Q?htOUTkP10CNiPHF6cA27umVinshRogOYpiv4yFhaARLZjKhpRk3CljM0GB?=
 =?iso-8859-1?Q?IkLz9A1Ik4i+MOkZV3eutUlDmzLAPqTePjmghibKEAYshjpz1T6N620WPr?=
 =?iso-8859-1?Q?3p6NuV0Lgb4UBT8cDCwlaXEZyrnb4pUaQK4j7fHTGBXj7+vlkbwSu6d24C?=
 =?iso-8859-1?Q?gvL8PxCm7SHIkEYZdVLJ8XcNbYsGHeX4Ps9tIGjQiiyBZ3ctNElEArDI80?=
 =?iso-8859-1?Q?TOVe+OFd2SDJ3sDDVBSuOOaQpqvEAY3P+N2yD8F7BKV1bVtNXJJmSYZMGc?=
 =?iso-8859-1?Q?I9I43Bp/SCYehdnVu5ZCxKNaE6fcoDNumVNhBzdCZPdVuoe9Wo/brLrn5Y?=
 =?iso-8859-1?Q?MDDihRj1EqniRKaewGcUb4jgSeU6UqE5cy+ib7H9nkusTmpKxjh3oUS6uv?=
 =?iso-8859-1?Q?NgYpPs85l14g4V3dLeqGAQ+R6T9YGMJ/QOzqm4omrz8e4t2BgszXc1yGRz?=
 =?iso-8859-1?Q?4PgdFI177nDux1dalTlnSdRXycMvqg1K6JCRnYtIAyEC4dz1v7GNP1E8R5?=
 =?iso-8859-1?Q?nF5u2shq3Hnu7mqK7onPfSXJKeZXDIhdhk8Ij99/GOdVhV67w7SW3mH+Nh?=
 =?iso-8859-1?Q?juleA6W5j8/kdO3EAMT6E0J1Q5yAdC5yXL3PjPpjjg2LuLFnXTZpkQBtTV?=
 =?iso-8859-1?Q?xcy8oEobB1U0w+k66pJdyQ9dizf0L3MAsr+ySSzVLqOga9YJn+f8dpmgWh?=
 =?iso-8859-1?Q?nPN8P5cMvBsL2q2WZ0c6pkF7Ggqbyym7RCdHkAQojWtyjHrkddJg0HzooA?=
 =?iso-8859-1?Q?YL7EdE7oXT2krHvydT4Bjxq1SDEOM9Xw9rXs+nOtFbxObbztJUY57nQ72/?=
 =?iso-8859-1?Q?FaGlWIN97Ga+Y9oNrm3LjyqZZujHfLGNkPEntrkUv1aiXYSz4GpUz3oSYd?=
 =?iso-8859-1?Q?IxengKH+x9HO7o/wRwa1H8Bt47uu1/7mekGnnOZ904cvVltjGOHWhbQC+Z?=
 =?iso-8859-1?Q?bsL4pyQBlWsjRVB4k=3D?=
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB33115863009D710731C97980CACE0TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3615
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT113.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ec10137e-e122-4e21-ee05-08d89ac80982
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FxYR6AK4J02AUFXMuvqdOBrNQGgvLn1M2DB3VoQB57bUmZij25U3mJvcFnjG4TZFAlo0QwDqCfgX3q69CEKjwthwQio0+Gc5CVnX1r/gEnfd6lt3q5PRtb8xz/TQ5pfQoqLgVdCnja9VVY2n9+AvMLmG/RqtD+F+oImvFRPiHWO+YNuKDWIarBpAUQw9/uzUA/khW/WCKz8SdDNyTufbQPqfauKWSJyrcTX5+/vwR769/tU96b8jsbiYmZlBKg0RpcwsSzE1Mx98mdFJ8rgHynfUf1jjjBK/3JVt34KEwbCJwIKqgauXRIVy8DzYRI6u1ZTzFpTZV69+mmMSLCoiRvidG07S93lEFkr6GHwuZnTK9YWoBDyZq+b6BmwBl1kr3+4k1JuZ/SYmL71S+UdeNg==
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966005)(81166007)(47076004)(5660300002)(52536014)(36906005)(8676002)(33656002)(15650500001)(70586007)(70206006)(83380400001)(9686003)(8936002)(82740400003)(110136005)(4326008)(86362001)(82310400003)(7696005)(26005)(2906002)(478600001)(55016002)(336012)(186003)(356005)(316002)(19627405001)(6506007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 15:52:03.7435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3aec6c3-1573-4f9f-05ed-08d89ac80b2d
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT113.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4195
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

--_000_TY2PR04MB33115863009D710731C97980CACE0TY2PR04MB3311apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Milton,

Thanks for the reply.

I am also expecting the link state to be reflected to userspace and was pla=
nning to capture the same in journalctl logs.

Thanks,
Priyatharshan P

>> Is NC-SI Asynchronous Event Notification (AEN) handler is already
>>implemented in OpenBMC?.If yes kindly let me know which daemon is
>>handling that.
>
>The NC-SI Asynchronous Event Notification is processed.
>
>The whole NCSI stack is inside the linux kernel.
>The code is in the net/ncsi directory.
>
>What action are you expecting on an AEN notification?
>
>There current NC-SI stack tries to handle switching the network
>to the host that is up, and there are netlink messages to control
>which packages and ports are considered for traffic.
>
>Unfornately the current model does not allow link state to be
>reflected to userspace.
>
>I have been studing the stack recently and am looking at making
>changes,but have other work that leaves me little time to work on
>this.
>
>milton

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

--_000_TY2PR04MB33115863009D710731C97980CACE0TY2PR04MB3311apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello Milton,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for the reply.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am also expecting the li<span style=3D"font-family: calibri, arial, helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: r=
gba(0, 0, 0, 0);">nk&nbsp;</span><span style=3D"font-family: calibri, arial=
, helvetica, sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0, 0=
); color: rgb(0, 0, 0); display: inline !important;">state
 to be&nbsp;</span><span style=3D"font-family: calibri, arial, helvetica, s=
ans-serif; font-size: 12pt; background-color: rgba(0, 0, 0, 0); color: rgb(=
0, 0, 0); display: inline !important;">reflected to userspace and was plann=
ing to capture the same in journalctl logs.</span></div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Priyatharshan P</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">&gt;&gt; Is NC-SI Asynchronous Event Notification =
(AEN) handler is already<br>
&gt;&gt;implemented in OpenBMC?.If yes kindly let me know which daemon is<b=
r>
&gt;&gt;handling that.<br>
&gt;<br>
&gt;The NC-SI Asynchronous Event Notification is processed.<br>
&gt;<br>
&gt;The whole NCSI stack is inside the linux kernel.<br>
&gt;The code is in the net/ncsi directory.<br>
&gt;<br>
&gt;What action are you expecting on an AEN notification?<br>
&gt;<br>
&gt;There current NC-SI stack tries to handle switching the network<br>
&gt;to the host that is up, and there are netlink messages to control<br>
&gt;which packages and ports are considered for traffic.<br>
&gt;<br>
&gt;Unfornately the current model does not allow link state to be<br>
&gt;reflected to userspace.<br>
&gt;<br>
&gt;I have been studing the stack recently and am looking at making<br>
&gt;changes,but have other work that leaves me little time to work on<br>
&gt;this.<br>
&gt;<br>
&gt;milton<br>
<br>
</div>
</span></font></div>
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

--_000_TY2PR04MB33115863009D710731C97980CACE0TY2PR04MB3311apcp_--
