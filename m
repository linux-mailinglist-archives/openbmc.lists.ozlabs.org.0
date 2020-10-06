Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2719D28501C
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 18:45:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5Nc85lShzDqJ5
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 03:44:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.103; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=OD07jCfD; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=OD07jCfD; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300103.outbound.protection.outlook.com [40.107.130.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5NZw3nntzDqGZ
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 03:43:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw6j14hUpLE8bHrjFkcNC5Z6g636jnNCQkEOpD8MxcE=;
 b=OD07jCfDgUcHYHgqLB3B9rX/K+crkiDTpF8KNOyarGZ4FPQXyTAgCITepVXp3BT4PbtE86ozBa3frSoCLJ6lPI/h7KaElfGOHmW7BQbI2tzfOHKYYvt6qEws2oiifbTbbvYd2BXX6nVc8gHyVts3z2xuiHFY17syVtdTjOyRtFo=
Received: from SG2PR06CA0116.apcprd06.prod.outlook.com (2603:1096:1:1d::18) by
 PSBPR04MB4005.apcprd04.prod.outlook.com (2603:1096:301:b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.36; Tue, 6 Oct 2020 16:43:31 +0000
Received: from SG2APC01FT053.eop-APC01.prod.protection.outlook.com
 (2603:1096:1:1d:cafe::b6) by SG2PR06CA0116.outlook.office365.com
 (2603:1096:1:1d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Tue, 6 Oct 2020 16:43:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.52) by
 SG2APC01FT053.mail.protection.outlook.com (10.152.250.240) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Tue, 6 Oct 2020 16:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNDysh0wSxLogOYT9xXd7ptr85PU8ceY+2SAaOKhZtr+Yxn5gg7LrriTTuvFwTnmnUm3QkkTJKsRVMDYklNkMIIoa7he+gfbbHpE3t8kcAA+BVX2Iqk6Y/3mvjUuECkS1PAI8CBAJVog8aSkDimU2yrAUI4bmIfPNZRMHGb3GWscYBcRo0C/55SAwIa54BGQZhIPD1ZJIlofLuBA9T08YL/ugO1AZ7sWEQwG2WP78eXv5p0fZ1dZY9+SCD32e7kEUnLaDO5kxg7EYmFb0sE8kYnfw0dDPmnyeKlJgmOYRWvVvSl/0Gs+TadVBwwqP5QojFrkp4W51dL5r0gmA+LqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw6j14hUpLE8bHrjFkcNC5Z6g636jnNCQkEOpD8MxcE=;
 b=RaWkHkPVDKh99yzJC4X+jUNMFYPMNfroBhYJj+vgQbnTyrmycXi9KZ0ZeXmpg9sWpi391nD4GWJfIp1OcW+ARiDUxY01r1kei5qR/FbrtQmfd97jdlO+m7qvIzfgproT2tA4HZaqPEsNw2YYae5FUB89ssOov/x9wjR46uY3qUdLGNd20FEEYiB+VryCM6yGE+vfVzlScBok7vMrtVVnlSX4ZNPre3xe/chMLaApQopmOLktZfY9F714qFDclp6ztmetR2362bSFU3fYeUNdT7Rau+N1Gs+XGaOSusO6j2WoNby56fnkmvjJi28Ln5K0x9uM+3a88+7rYG4SCVo+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw6j14hUpLE8bHrjFkcNC5Z6g636jnNCQkEOpD8MxcE=;
 b=OD07jCfDgUcHYHgqLB3B9rX/K+crkiDTpF8KNOyarGZ4FPQXyTAgCITepVXp3BT4PbtE86ozBa3frSoCLJ6lPI/h7KaElfGOHmW7BQbI2tzfOHKYYvt6qEws2oiifbTbbvYd2BXX6nVc8gHyVts3z2xuiHFY17syVtdTjOyRtFo=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TY2PR04MB2957.apcprd04.prod.outlook.com (2603:1096:404:3f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Tue, 6 Oct
 2020 16:43:27 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2%6]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 16:43:27 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Vijay Khemka
 <vijaykhemka@fb.com>, "ed@tanous.net" <ed@tanous.net>
Subject: 12v slot AC Support  in x86-power-control
Thread-Topic: 12v slot AC Support  in x86-power-control
Thread-Index: AQHWm/+U/ovub+7wQkO9Ywat+ZJBqA==
Date: Tue, 6 Oct 2020 16:43:27 +0000
Message-ID: <TY2PR04MB3311FEF038529B122E1123DECA0D0@TY2PR04MB3311.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:6d8f:22e8:cc8e:a0d7:b606:e3df]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 696ab816-3d55-4387-6db3-08d86a16f4de
x-ms-traffictypediagnostic: TY2PR04MB2957:|PSBPR04MB4005:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PSBPR04MB4005CC2DAC1B8F9977EA127ECA0D0@PSBPR04MB4005.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lnEkHVsPwzfEK+WOnFd7Ljhc882Z88z9dwJ0JhBjhUoU/HGTpNHO95x1oiOpevErtZgctl9QX1tJfvpB2GmIzCPp6WHcXcygeUL6BsXwERw9sr6pItTjpCbeB1S/RnMTnGY5Axa2BpcwMbv9MQ+rLvYGHGJSIDMckGwaBfYEKgD9aKPWhgJyh5MlBWkzGrSEW1V6LgyLC25HpZWxcCY29MFHkgHTbFsF8crCwgzP2XARNR3hCgqGOTSmeO3Pdt/2u8s3esr8MCHnxsH+9p7FsOpTOWUAhFl54bW4GUuLydmtYpJ55YPmc3GutL4b6A06
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(186003)(4326008)(5660300002)(7696005)(71200400001)(316002)(86362001)(55016002)(52536014)(9686003)(110136005)(83380400001)(33656002)(8676002)(91956017)(2906002)(66476007)(19627405001)(6506007)(66946007)(478600001)(66556008)(66446008)(76116006)(8936002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: yxrwrQBcud/diqZ3Qct4Ur3gTysw5DnccWTZq1E2UR7U/LzHb97RrmTPAXUT7vozLnQnTtmLtAYv7wmcNgVkYP/kUfJP0G/hQIBLsCYivDidK8w1bimY0ui5xfOwGQm8+Jhaiu4npOIGHzb5neG0Bp1yk1JXRJTHva/R7RGtYer74toC2FCKOBPGjtzbxfsubvY8eaHQGLpFBWoukIFXAUZdSiSSoqL/Zvhio25PrNCSOhI1CM2GekjP2UMt8OOwKrGdsx96Cw9I9+ZW9XK5EuKSIJamoHZa0vpWTcmCGltjrhidk0E7Ywcz8yjFJ8itwkgftVaNDWo4NcfbNoCKXF76Y/Sk70YzuJfLQ3ARb8lErcc4aXyCXhKmx+TyFjMpQncRHa9ebospff4LjMKSoVMn64XhON5x/BSARbeRJvJja8+5uovVyToO+DxmkbZHEEsYD7aZxWoEkrjF/Q+Tna8hQtAhGLat1h57Zx2XmfD8h0vs5V3orbOcwaOCa74PcLa20yP7arnMhmoLtqiShd/LdvvMq9yaxcWcvV7JREvG/iHn5zc9r6LmejaqNtHwboaRSuvEnCUyNbMbTGxAk4jUEOpgNqvd3XNSpVpTLtYlIwU/YdmG4zpvenDs5kTVAr6PiQWzwHtPUshks47Er3VayABlmQfn/FgQcvxwY70/+VI+Hss3ojir4XBnHjE1Ij9FAvgNVAgU6UkZ63PnKw==
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB3311FEF038529B122E1123DECA0D0TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2957
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 56ce0ca0-ffa2-4162-a134-08d86a16f352
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7n56HQCv+mF8m8j7EMKGx8FMccmVJP3JLnyMZs64m0/E+KQgIMYby53S2o6Rm8TEULnC8q2c2lSn5ra5lfFctA5yqwGct5afvxwHo2r1dWwumwiPrJ/Gn5KbpJ3M2k07Iy+Z1ROJZDXXHskfYNsd2GabnmqaFAjgunwLFaTplGYO+KR9tC8vI7tNoVemc58rTZFEkNQk8pAraVd8J2KyC7hj+H6qfM87pFfNmXjEbsJYL6LFtTetik0/14sL84LA0Cla1ajUSR/dDt0CSihtiDC9CiE5Nv4VcD919/KycnoBkqZHVZjwlzAGdfU33PgzDC8v8efb7txnVQHkyQejvadgOmnKSoL6ezUvSFvSaO5uksaya68ejRZT6C6nN3Dut9FvDEaLymoJolWRe9xwFOPO32GAndZTVgUjFx5cPsS44Z9jes7mbXbIXOcnQ7d6
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966005)(26005)(478600001)(8936002)(47076004)(8676002)(186003)(5660300002)(55016002)(33656002)(9686003)(110136005)(36906005)(316002)(52536014)(82740400003)(83380400001)(19627405001)(336012)(70206006)(70586007)(356005)(4326008)(81166007)(6506007)(34020700004)(82310400003)(7696005)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 16:43:29.7710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 696ab816-3d55-4387-6db3-08d86a16f4de
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR04MB4005
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

--_000_TY2PR04MB3311FEF038529B122E1123DECA0D0TY2PR04MB3311apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Vijay,

I am working on a patch to support  12v slot AC cycle in x86-power-control.=
This can be enabled by configuring slotACPowerName in json config file.Sinc=
e you are also working on similar kind of feature in x86-power-control, I w=
ould like bring up this discussion on mailing list to understand how these =
two features, and the design you proposed for chassis reset are intended to=
 work together.Kindly go through my design changes below and share your tho=
ughts.

I have modified the existing /xyz/openbmc_project/state/chassis0 object to =
implement 12V On, Off, and Power Cycle for system which has 12V Slot power =
support.


If slotACPowerName is disabled and if,

RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
Off" then poweroff [existing functionality not changed]

RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
On" then powerOn [existing functionality not changed]

RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
PowerCycle" then PowerCycle [existing functionality not changed]

events will be called.



If slotACPowerName is enabled and if,

RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
Off" then 12V Ac Slot Off

RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
On" then 12V Ac Slot On

RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
PowerCycle" then 12V Ac Slot PowerCycle

events will be called.

Thanks,
Priyatharshan P
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

--_000_TY2PR04MB3311FEF038529B122E1123DECA0D0TY2PR04MB3311apcp_
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
Hi Vijay,
<div><br>
</div>
<div>I am working on a patch to support &nbsp;12v slot AC cycle in x86-powe=
r-control.This can be enabled by configuring slotACPowerName in json config=
 file.Since you are also working on similar kind of feature in x86-power-co=
ntrol, I would like bring up this discussion
 on mailing list to understand how these two features, and the design you p=
roposed for chassis reset are intended to work together.Kindly go through m=
y design changes below and share your thoughts.</div>
<div><br>
</div>
<div>I have modified the existing /xyz/openbmc_project/state/chassis0 objec=
t to implement 12V On, Off, and Power Cycle for system which has 12V Slot p=
ower support.</div>
<div><br>
</div>
<div><br>
</div>
<div>If slotACPowerName is disabled and if,</div>
<div><br>
</div>
<div>RequestedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.T=
ransition.Off&quot; then poweroff [existing functionality not changed]</div=
>
<div><br>
</div>
<div>RequestedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.T=
ransition.On&quot; then powerOn [existing functionality not changed]</div>
<div><br>
</div>
<div>RequestedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.T=
ransition.PowerCycle&quot; then PowerCycle [existing functionality not chan=
ged]</div>
<div>&nbsp; </div>
<div>events will be called.</div>
<div><br>
</div>
<div><br>
</div>
<div>&nbsp; </div>
<div>If slotACPowerName is enabled and if,</div>
<div><br>
</div>
<div>RequestedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.T=
ransition.Off&quot; then 12V Ac Slot Off</div>
<div><br>
</div>
<div>RequestedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.T=
ransition.On&quot; then 12V Ac Slot On
</div>
<div><br>
</div>
<div>RequestedPowerTransition =3D &quot;xyz.openbmc_project.State.Chassis.T=
ransition.PowerCycle&quot; then 12V Ac Slot PowerCycle
</div>
<div>&nbsp; </div>
events will be called.<br>
</div>
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

--_000_TY2PR04MB3311FEF038529B122E1123DECA0D0TY2PR04MB3311apcp_--
