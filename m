Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B397E2865C0
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 19:19:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C61KH6df9zDqRW
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 04:19:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.117; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=B5Pvxzr8; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=B5Pvxzr8; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300117.outbound.protection.outlook.com [40.107.130.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C61JG4WkQzDqNF
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 04:18:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjb/v4CVRQzfy5cgJDQbK97x0WoWz0FUW7QhV09kXv0=;
 b=B5Pvxzr8K9lP+2GUcbrcJYyEGAFcJwGPnKg8z+JG1C5bAhW93SrnV6azyg6ZrRfY2t4qjHUvhNSHGFBgacsRmNWsvt/7EaNChrxVO8WXMuNVbdz4HrCUMB4B+8jOufhgFvYj956ViZ+SUgCEuXYMMNnt+84k0yU5D2SlcJCy3IE=
Received: from PS1PR03CA0007.apcprd03.prod.outlook.com (2603:1096:803:3d::19)
 by TY2PR04MB2637.apcprd04.prod.outlook.com (2603:1096:404:44::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 17:18:10 +0000
Received: from PU1APC01FT049.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:3d:cafe::36) by PS1PR03CA0007.outlook.office365.com
 (2603:1096:803:3d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.15 via Frontend
 Transport; Wed, 7 Oct 2020 17:18:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; stwcx.xyz; dkim=pass (signature was verified)
 header.d=HCL.COM;stwcx.xyz; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.53) by
 PU1APC01FT049.mail.protection.outlook.com (10.152.253.9) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 17:18:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FusflX4uxsgr0v1kgVwFn6ZhxR6g0Yc9I/8NT59Ukkq7RpLlFnpXoR00juhrjalUFb10rdCVizAfErP+/0SEQ+RcRqtSKhDBLFSQJK4SZCYGHhHbzhtSkxf7Lxyp99YrAV6U/r373TK0NNDYaMVcNwgBVZHtkrnZAEhTnyy30o3y0GcH2VqcRL0n27UP4h7kSUx+hV9D4oiuWE+Dg5yMycoGizHpwuu8WrD4SP8XO9dzXfkRrVlEFK97D0LLDXEGU+1Ah6MGjRRxPftQ+t5LY/fGR6Reokci22crCrMvnfp/jDHstB5KMh9SPYXpPGbHQstFBT6U1Ll6WIvPNP7qvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjb/v4CVRQzfy5cgJDQbK97x0WoWz0FUW7QhV09kXv0=;
 b=Kx9lryhYzN2PxcBesh72grNlbgEE1O75zehFQi/1HlbT2F4RCoMELMXc9Ag1WmzjyjS9aiXs0l3K3ajLTpl07m3Nav5KxrYAIDaIl1cGGpG2lDlH6T9VG115ln8BDiyzxJ9kNgkKl0EfEK6bTlL9sb+pgP7teAhXF/fuCjmk5q3qCg34ST7STB2tWu+IfrHlujPViXusf43YYSSAgTIx2cxn1p/3OH5Dfdd9jMmW3tmLc1EW1ytXOYe3b2J5JaooxNa2SssLp9/E6Uu1a8FPfiwTGCQ8JSB5iEUJrRDI+33rQ7Aud8aFbHi4utqVhnPOrBeh5Iv3ZyXm+SEanVPDFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjb/v4CVRQzfy5cgJDQbK97x0WoWz0FUW7QhV09kXv0=;
 b=B5Pvxzr8K9lP+2GUcbrcJYyEGAFcJwGPnKg8z+JG1C5bAhW93SrnV6azyg6ZrRfY2t4qjHUvhNSHGFBgacsRmNWsvt/7EaNChrxVO8WXMuNVbdz4HrCUMB4B+8jOufhgFvYj956ViZ+SUgCEuXYMMNnt+84k0yU5D2SlcJCy3IE=
Received: from PU1PR04MB2248.apcprd04.prod.outlook.com (2603:1096:803:2d::14)
 by PS1PR04MB2840.apcprd04.prod.outlook.com (2603:1096:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 17:18:06 +0000
Received: from PU1PR04MB2248.apcprd04.prod.outlook.com
 ([fe80::88e0:657:b223:abe0]) by PU1PR04MB2248.apcprd04.prod.outlook.com
 ([fe80::88e0:657:b223:abe0%6]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 17:18:06 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: Patrick Williams <patrick@stwcx.xyz>, Richard Hanley <rhanley@google.com>
Subject: RE: adding sync method in phosphor-time-manager
Thread-Topic: adding sync method in phosphor-time-manager
Thread-Index: AdacBv9Bki3TPVlHTNSiDfy0xL6NpgAInOyAAAhGMwAAILBTEA==
Date: Wed, 7 Oct 2020 17:18:06 +0000
Message-ID: <PU1PR04MB22481EAF83C8BD20C42B4799A70A0@PU1PR04MB2248.apcprd04.prod.outlook.com>
References: <PU1PR04MB2248961AEF87BA87C7749050A70D0@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <CAH1kD+b=4NhQ=XUmtGXov2WErqLB1T=ZZBYgYBkuVLT=-hdfvw@mail.gmail.com>
 <20201007013824.GF6152@heinlein>
In-Reply-To: <20201007013824.GF6152@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNjczM2JlMjAtZGExNi00MmYwLTg1ODItOGQxNmU2OTIwNTg5IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTGxWb3RqS2RsdEdrdXBneDZ5OXQyY1B5QkFDeUthcDk0KzArR2ZEMnNvc29PQndicjFIT3pqeXVFcTRHMkxETiJ9
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [117.221.6.226]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7a7a2e52-1e32-44a0-648a-08d86ae4f6ec
x-ms-traffictypediagnostic: PS1PR04MB2840:|TY2PR04MB2637:
X-Microsoft-Antispam-PRVS: <TY2PR04MB26376CFE414D952A2FA1B8E2A70A0@TY2PR04MB2637.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Nws5lVwFAAPvwKLLpUALj1VA22aSDe+Y8zZsAJp7um7zw5wXyZLfxc3WL0F5DPWYtalC8PmvEs1byKFWaTfQtDU/4OJ5j4umkk0dcrsN0bQhGmjnrqvkwVnAjEXeeEXee0kEs9dIXa4j53yrKUMQr1n05tpVuU9yQszBPEB6NbxDYaXVurPDo9yruTRgeE49qMDkfL+fM1/YUQfvbVEfvxZhcpZSoiBJ1Kd+AXmLv8QdZiqKMuMH3SN4LmGECgjI32WeRWjCCB02/LBsflHoEaLqXZcQF79PlyaSfKu3m8bucESj7Ivag8OP+D/P1WnKFwrwAW9RyvPWzlwGiIdPwQD0UE6I/XbNgqqsTjHLnXSOf3n58X63L98yhoaPIgU5/dhc65ml1ykDPk39d9EM2g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PU1PR04MB2248.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(55016002)(71200400001)(83380400001)(83080400001)(9686003)(33656002)(966005)(110136005)(316002)(6506007)(54906003)(53546011)(7696005)(8936002)(4326008)(186003)(26005)(478600001)(2906002)(66446008)(64756008)(5660300002)(66476007)(76116006)(66946007)(86362001)(8676002)(66556008)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: p14heFR6PNS7Nf8vnohgiEjUYIwbJlXlhy/8dAYSdIS1fe4PgDCBQqk+p1EDv5xrN2hzwOIVqGw641iA6r9y5Mmf45HHP1WjLufUgeV6yi6B34hMXguJB8A0+yJxbT/Frmk19X5ofIIlw3wEF13bl+EnBiYNTathJyn1NQDT/nWoamHxsaQMI2ZEzcBxHxBlXG1e+XrwqS8FICbQx+w5VGcMBstyaI6u8Wv9WOvQRWTzX/xLA/50omc8AKXgknLc8LUlZcRFafywil7CiK4ZwjXzIJfdwhOuGilELsfnX23QX8z696D4HoUryP/OF6dnxFfQbXtV/gvuGme35/3/5pc6bcA/sx8ITAaCopWQmaUQDtpjQi4GY83SzIZs6anaGj2fPyqlpmsZ7zuUCtPsu02Wt2y5JP29Bw9mb21AiQCXMm28aYtDupmikmQRDa6cXx3FYrI9eKQXVXzCKfrpN7fOHWCnUsCqDCGTCiqRM5U+waq9RiQeiAeuS3aL7vgjJ+Me9jIoYqHV+HasNnONVOKZQu73qIWr52z3yF9Kh46l/Lurg6Hrx0mKvKMVxd1dchfv9F7na6wHNU6h3imcO54Dkle8+snAwY+SPFd1O7j+nmwMc/kS9RRPqZYWqOilJEslrxjGF7TdBQqiF/HkkA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR04MB2840
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3ed783af-5a04-4e80-e0db-08d86ae4f511
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vvmDnme7ZAFKdGQQeIoWFuBESqts3f0PfnrN4T5glHbyrmhzMnIy5dkKWlwoJqkxxZo5z2FpRhija1u2qIQS3sEYCwD6XOv2zOjJLSiSZUssMwUeRlfKeHKbZxw5Jyi+937z166QDFWrvF/t+tbJt1EW7ojWY88eRppkqBWEeSJHff9AMbLSZv1uju74b5NwkxmIdQ7MTVYttUYkleF9TwkX6DAyRnIlBDsvnzbzNB4eEU0IJ+WnvYpSx0BSp3H0M2tfBNp4MXYLLgIO2u+ESgAvtO5vPxHJv9cKn/+CB06VQOiZEUrHi2igffIkYs7lnL520fkrtX+3vOHpI9VOIwktGLnq3K1ECVSYGKIRAX1oZmj9HC9qq98LtZ28B7HL6/gXk38qHIw8/SWvwaRAoHkYc3d0juFyWBXAQmiG5Ne6WibcbscwdQdKjf1tyF99+wFICjCeOvQ96sEidrk1ZHKafZBnmYK34D4iqL54l0Xrle1i7j31JbwZGP+UmsSy
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(26005)(55016002)(6506007)(47076004)(316002)(53546011)(186003)(54906003)(82740400003)(7696005)(110136005)(2906002)(36906005)(8936002)(336012)(966005)(9686003)(8676002)(86362001)(83380400001)(478600001)(5660300002)(52536014)(82310400003)(356005)(34020700004)(4326008)(81166007)(83080400001)(70206006)(33656002)(70586007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 17:18:09.3353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7a2e52-1e32-44a0-648a-08d86ae4f6ec
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2637
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: HCL Internal

Time owner module was a different module which decides who owns the time BM=
C/host and set the time using NTP mode or Manual Mode.
in Time owner module ,user set the host time using the below command manual=
ly by providing  the time.
busctl set-property xyz.openbmc_project.Time.Manager \
       /xyz/openbmc_project/time/host xyz.openbmc_project.Time.EpochTime \
                   Elapsed t <value-in-microseconds>

we are now actually not repeating the time owner implementation instead we =
are adding one more mode(HostSync) to time manager setting.
    a.NTP
    b.Manual
    c.HostSync

    How HostSync intent to work:
                1.host sync mode will get time from the host.
                   1.1 Add an empty system service file in this repo and sp=
awn this service when HostSync enabled
                   1.2 This service file can be override by the platform ma=
chine layer.
                   1.3 The platform machine layer install the service file =
and the shell script to get the time from host.
                 2.it will set the time to BMC using the shell script.
Regards,
Velu
-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Wednesday, October 7, 2020 7:08 AM
To: Richard Hanley <rhanley@google.com>
Cc: Velumani T-ERS,HCLTech <velumanit@hcl.com>; openbmc@lists.ozlabs.org; P=
atrick Williams <patrickw3@fb.com>
Subject: Re: adding sync method in phosphor-time-manager

On Tue, Oct 06, 2020 at 02:41:29PM -0700, Richard Hanley wrote:
> While we're on the subject, has anyone ever taken a look at using
> roughtime on a BMC? I imagine it could a really valuable extension to
> phosphor-time-manager some time in the future.
> https://blog.cloudflare.com/roughtime/

One of the problems I see is that there are a few different proposals for "=
next generation time" protocols beyond NTP.  Unless a project member has an=
 explicit requirement for one of them, it doesn't seem like we should go ou=
t of our way to pick one of them.  If someone is especially interested in i=
mplementing one of them in their spare time though, they're more than welco=
me.

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
