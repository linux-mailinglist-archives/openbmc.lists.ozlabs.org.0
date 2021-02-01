Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB0330A92C
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 14:58:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTqL16P95zDrRR
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 00:58:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febe::721;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=RAEYUqnE; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=RAEYUqnE; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on0721.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::721])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTqJp0b85zDrQt
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 00:57:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mSytOqBrlwHd0zf3glbpPu01YFDW89vIbVweZwig9E=;
 b=RAEYUqnE/Cn1h1iWMumJBV4NC3J31zXEK4k49Ok4xBk49Q8ux5wBWqlgxkvXZYlPGc2ADHsIAZaSIoI93SnEn9E049GvyCDmCy6zsOTOSP0qehTx33FE1YQD3zhkBBUPVjkIlj0yZ+cpPiT5vuCXnZ8If/lHu/6fellzDQTIMZM=
Received: from PS2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::24) by PS1PR0401MB2059.apcprd04.prod.outlook.com
 (2603:1096:803:5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Mon, 1 Feb
 2021 13:57:32 +0000
Received: from PU1APC01FT050.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:58:cafe::8b) by PS2PR01CA0036.outlook.office365.com
 (2603:1096:300:58::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Mon, 1 Feb 2021 13:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.52) by
 PU1APC01FT050.mail.protection.outlook.com (10.152.253.77) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 1 Feb 2021 13:57:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gprk54gVREdX0huzmTvgR+N+tzURVf0qKNcoOgBXL1342kMcD1NLdUw0yAYakF5h7qAiNKOVG4NE6+eFY8YDfkqrizeUIanPFYK2zK00qOe6Ylmlk3OXgG5kmdF8LXK0oT7s066mGpTvHEZ/KrzWjoGX9sSrrQEWcRTcptOlOVffMMVEleDXKF5/81xk1gjpcelhJJI5nGObDuc7b/0gUwyfZ2HZbXKfybY9w4iBm6UM/TxlM/+zMlj/mOvkfMJKcUTd5M2/Uf0UIQSmCz/nIqPxHRDDrPja1Z59dRzJOQ24UeiOJrCIYB4UDiMQxjBECwRFYAY7g51vODOxG/1Slw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mSytOqBrlwHd0zf3glbpPu01YFDW89vIbVweZwig9E=;
 b=PNZJbu5oijZndEyL0a2y0O3Ck3q+50MRNH4Z3ueyt1qG32YI6qxbTOmxZxtVebK+lYmuslHezFCZlw/9p2bRJhRyP+zC5dUMj6nl+jZN+Kn43XNQl0kFOK8x7Blkg5RbIfsbkqastblo0YLcUwcLkKN0y9jac1DDN8VKyqyZOXv87Mw8cqcH1kagNlM4gKvssBSebXPS81Ri6PhtNfQ5z8Tz1Wx9YKrDhsT1VHHNB0tzyKWrOtHWVcsW5gwjL6dxu8gdi6PCcokv1EncThCs4S5VdbnVvNWX9wUSf0jw+adEbQLgNNTKO4KHF+CAebHxlbERnP4uXG4dSi5BTB97VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mSytOqBrlwHd0zf3glbpPu01YFDW89vIbVweZwig9E=;
 b=RAEYUqnE/Cn1h1iWMumJBV4NC3J31zXEK4k49Ok4xBk49Q8ux5wBWqlgxkvXZYlPGc2ADHsIAZaSIoI93SnEn9E049GvyCDmCy6zsOTOSP0qehTx33FE1YQD3zhkBBUPVjkIlj0yZ+cpPiT5vuCXnZ8If/lHu/6fellzDQTIMZM=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR0401MB2158.apcprd04.prod.outlook.com (2603:1096:3:6::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.19; Mon, 1 Feb 2021 13:57:27 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b84d:4fa9:f44b:a049]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b84d:4fa9:f44b:a049%3]) with mapi id 15.20.3805.026; Mon, 1 Feb 2021
 13:57:27 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Boot Sequence Configuration in D-BUS interfaces.
Thread-Topic: Boot Sequence Configuration in D-BUS interfaces.
Thread-Index: Adb4odLMh9asLtPXRHKRWp+tpbwnTA==
Date: Mon, 1 Feb 2021 13:57:27 +0000
Message-ID: <SG2PR04MB3093C3B95174DA7371D078D6E1B69@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYmZjY2ViMjYtZDk3NS00ZTRiLWI3ODgtMzI2MGEyYWNlNzFkIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImJlTzJGZEhBMGwyVnN0dUdpUFwvR2hwbWFQamVrWDd5elVMeDBnb3VBQ1BXRmE4dUhEcnA5WEl1VnZJZmNSTVRyIn0=
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:6d0b:31dc:88c2:b463:d608:701a]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2c174314-73bf-491a-6937-08d8c6b951c8
x-ms-traffictypediagnostic: SG2PR0401MB2158:|PS1PR0401MB2059:
X-Microsoft-Antispam-PRVS: <PS1PR0401MB20591157F536A73745C8FBADE1B69@PS1PR0401MB2059.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KpzAuLXHN7q/+fJZQSk2jcm9+sieq3mMRoPMs1SrKcwCQf1u1Dy0AO7YFLdKpZ2X2t2fzNmLSvA7C4Wm8hVQns0YC+OCemyoi3l3uQztbTcdRI1rCkmsKXqaQe+EuVbeaDLVk3LzFeC4FEsBIlQSxh8EV1c3PTu2uko/0d0Wz/uvHehWb4I4Mr9jHHlYEd+4FXuWY6FT1697kX5b7R+CKfD3r4RX68hYm07N1Atof8L6uwHsHvudauAIiGFQrE+mINh3JkSKPUTGJ3xLdJD5bXDgQ8QSRl3Tny8zXaRAWSUe6JFxyavXzktKP5hZQkPApNFAUq6G+N6ksXAYuqKMzmAlIkqsJAejbkTXqQoloFEmTB+R6k4dpnzYL1E0Y04c/wGWYRBgMyAw8x+XSoK12rEqMFGyN1xqCN0k14FTY3+g4hQPN10N7dUzLk9pCEyBl6tv43K4uw01D4WwJ+zR1e9r7iJihTj0tZrTYhEQCTU00Yj7jEqEdSEkLmzyq+kPRuFnrOdiQ22sNnf10/anFw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(8936002)(55016002)(6506007)(66476007)(86362001)(76116006)(9686003)(5660300002)(2906002)(64756008)(7696005)(71200400001)(478600001)(8676002)(6916009)(66556008)(83380400001)(186003)(52536014)(66946007)(316002)(33656002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ogEifkg43QmSRnK+hVW4bHf8Dej5QVeWvmd0XOdHIDRGk0Z8ipaunzUqUvdm?=
 =?us-ascii?Q?yH1lwbghlC4axkpqqDQCYn5+CFFIWDLjhCB4l5NvmjMat06IAXMClcnfz9b3?=
 =?us-ascii?Q?zUGVjhRmSV3T4ZvUFhH2XXa9jr9gnDLDbqpqdrA85CgCbaLxEKuNjAjfZr6B?=
 =?us-ascii?Q?6mVP4ux2s6f7qsnrK0odEGjWu1/iKxKmaYIce+8sjK2uYOScwPDq0GTKyVd6?=
 =?us-ascii?Q?cSGDvTImOqd2TA58dC3rc4aGvA5MFFK/w7WJGMhTGIFEM9hFzjXGpRQCY80X?=
 =?us-ascii?Q?6s6gZbuqApvxOFBNWyJLZiobN0XeR5G1UEJEKwqYNPO3hv6LBri1n385AIt9?=
 =?us-ascii?Q?ipj4y8BqU4pq0nuLop5A5HoQEwAzzpZrCeRmjuSLlbJYJ0nimDzMNu7gbAwJ?=
 =?us-ascii?Q?UW/fOOd1W4G/SbvK3YezSuTF5qVhBeUK3wXPBO7thek37EtmQ8ZntmMmjDQL?=
 =?us-ascii?Q?e2Rzp7DYGLC0jPDW3+eVUDdvcNTwCOJbrwK2EadqYVKXn09rFIfrlBthcH8p?=
 =?us-ascii?Q?1RHOooaQdwTfbB2b+DjG5ZM2mxx0M4lfRPwDzb5F/ycCpdNS3eMeNM759pXJ?=
 =?us-ascii?Q?X48EdTP4+cA69/sR9wEykpjWiWvf/iBXIoB14vmaOFYTw0rmgVcw0WsHFjqh?=
 =?us-ascii?Q?EypMNodmWz+HN3QUixP1mZ5n9Ei8vwQ4o1FZFeSFPMvqmJU7X6q5MX1krWlX?=
 =?us-ascii?Q?MhjWmAdEaCfrUiKyBxHxpSvneTGNgvY7Ho2q7/uVGSiJ5cMoyi7+FQomv5z4?=
 =?us-ascii?Q?G7vNXLAKDdnr2LGpxPVvW+HH3KSGtnwTVE9n3bpUzT2O6sgHogotriEyFOve?=
 =?us-ascii?Q?TbGe5HkzMOuXo3T9+UZ8QyDPAdUYvIVZXCT/8r81hnzvVwmMP60hTKsPio3Q?=
 =?us-ascii?Q?LNCwsqYUnS3xVaSwJxpqUbEURsBbOqbY9Y3Az5wSo/bV1lVPlHZF7Y+Lbues?=
 =?us-ascii?Q?aUsN+BPaXvxlydnwREdn4re6pede3WqHCqnrWhHDU0lseFHUuHl6lzNc2KYN?=
 =?us-ascii?Q?wEO+CabBR4qTvUg6HHFQwP0XLxO7hEnsYBUqY703TXVoTPfODIBYw1JzSsg6?=
 =?us-ascii?Q?SrlbM/r45lr08s8HRP619I1zLST2aXp/0JgpaEQpEUQPo7F/sXNiFTZ6pS1W?=
 =?us-ascii?Q?N/bFZ3qXNwBD?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093C3B95174DA7371D078D6E1B69SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR0401MB2158
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT050.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d535c709-7e2a-48b1-8840-08d8c6b94f50
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DOtR8gHMHTtqDCODY8KzVGZMg0hoxPNVoN/0TgNxLJbGXDUVLT5mwfG9RGjeN4daEupTc7XQbuLVlsjjA42jD5m/11P+cTL1QgJIpLgU0o/kuZosifLjAiK/AYe8Z/Mi9zpHseB5r/rkdIpg3dKKrdPQdv58QaosL3IBv5s2nBfWzpN0noibudL19dfJe8Vdc2X9E83z1/Fif/+Vtkc7qJ1Ewe6cYD5E3PHN79XepMZm4BHB7iDLRenD8BxcUqoJqEBEfE2L6v0HyLZWlhwBlpz+85BLdtc4XhqUf3bS3EJ3kzDtZxzGshSLwC/7uChF0nUcCgiSayN606IK1+NNAN9pt1v9aTYyle1XQFBfU5d4sXnBQsCG8PYUetGuDJFQprMt15ulV5g9Xz2Wm9HQ2ieHtBcHy3Y+VPgj7ZZbjXj9Af7697N40bRC4bwEIzhSOPSP7mTlyqi6BIjIFrB9hYo4Ra9OOT/KxSNRL9tM1n+t7sxRfjfa/YkcDABRWQX6PZpSGhwwUwQHdHe48H58+m+g5BBXcS4Q2aDPIUcASSOKaXkLBOosYR1kOI2wuXFLRVaq0MNuArFyG5q+Aq9dv1pHAhb1hf/lABTY7V8dPEQ=
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966006)(47076005)(82740400003)(86362001)(2906002)(6916009)(81166007)(356005)(5660300002)(8676002)(478600001)(7696005)(70586007)(70206006)(6506007)(36906005)(8936002)(186003)(52536014)(316002)(55016002)(9686003)(83380400001)(26005)(336012)(33656002)(82310400003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:57:30.6257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c174314-73bf-491a-6937-08d8c6b951c8
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT050.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0401MB2059
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

--_000_SG2PR04MB3093C3B95174DA7371D078D6E1B69SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi Team,

In phosphor-dbus-interfaces repo, boot order supports only boot mode and bo=
ot source dbus interfaces.
We need to display all the boot order sequences ( "USB_DEV", "NET_IPV6", "S=
ATA_HDD", "SATA_CD", "Others" ) using dbus interfaces.
Please provide your suggestions on this part.

Regards,
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

--_000_SG2PR04MB3093C3B95174DA7371D078D6E1B69SG2PR04MB3093apcp_
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
<p class=3D"MsoNormal">In phosphor-dbus-interfaces repo, boot order support=
s only boot mode and boot source dbus interfaces.
<o:p></o:p></p>
<p class=3D"MsoNormal">We need to display all the boot order sequences ( &q=
uot;USB_DEV&quot;, &quot;NET_IPV6&quot;, &quot;SATA_HDD&quot;, &quot;SATA_C=
D&quot;, &quot;Others&quot; ) using dbus interfaces.
<o:p></o:p></p>
<p class=3D"MsoNormal">Please provide your suggestions on this part.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
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

--_000_SG2PR04MB3093C3B95174DA7371D078D6E1B69SG2PR04MB3093apcp_--
