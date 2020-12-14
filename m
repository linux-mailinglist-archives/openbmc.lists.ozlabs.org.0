Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FA32D9CD8
	for <lists+openbmc@lfdr.de>; Mon, 14 Dec 2020 17:42:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvnGt2JSCzDqQ8
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 03:41:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.128.97; helo=kor01-ps2-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=Z320K670; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=Z320K670; 
 dkim-atps=neutral
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1280097.outbound.protection.outlook.com [40.107.128.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvnFt2YKwzDqN2
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2020 03:41:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXadq3gVaBY/omRDlymMBX4r2+JSrnh7vjCJjktqb9c=;
 b=Z320K670Nsszh39wL8QxRejKvczIus6gw5olm644RoDRcVtlChQkFqqqimMbPHuiudmcggIQ03ojc0l8RzShJV9X3zSxXB5o2IXf8qWn/sdmsW3XM1qkdTgSZLNqE/AXfQoo8HZFYDcut5kV5Z4+Lbbf1okFqXahehx1TPIsbEo=
Received: from SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19) by
 PS2PR04MB2696.apcprd04.prod.outlook.com (2603:1096:300:50::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.14; Mon, 14 Dec 2020 16:40:49 +0000
Received: from SG2APC01FT062.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b6:cafe::f2) by SGAP274CA0007.outlook.office365.com
 (2603:1096:4:b6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Mon, 14 Dec 2020 16:40:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.59) by
 SG2APC01FT062.mail.protection.outlook.com (10.152.251.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 16:40:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkGVxkM0vv88DaqEV+Na8p5c9D3N8b9CkTU2E9L0z0NEW3deON4j+Fhpkd2yMQjMszNdDp0Cge2n+VJDpawFF9FbJVTL143FU+WGNrn2h6IEbRcrNc7DW33zRjx6AS/UdlAweXYEtWYL0DKCIY+r3hssS4JFhdjaNYEMKeUp2tkyfZfRLQWa5ZVRDOCFTygue966d6IK4+lYUGU9cU4vTTcg5iV3KbFTayrUPtIvWM7aJqbHHgDSxIonl0dzpezwXiQj8JGLnzYTMAksuuIo5k33PVIck7q5996ERpQ4p+gUWPcWH1Fw8lY8Yp9gvYOOjfYLH9g63EzBWDes/wBewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXadq3gVaBY/omRDlymMBX4r2+JSrnh7vjCJjktqb9c=;
 b=DCSgiunMslhQKN8Fr3Ci+7RYJKSQf8NLx1Lcnb1gh+Sf6GAEjm36n7p5CmnCJHB8BBxzAQikR70+fw8FN6GsPqndvQ5HeCnLI1L/qk8WOaMlUnvWInmKbOUZw5Xpcc+TntNgw+Ksf2qGno29iB3sMr+/NG1eWzZxzY2Tj7nFz3koK7GR1gc9qev/e/1GegWEDhYUcqUnqFF9W5MYcedaLzFrq2a3qaMuDXh2IhvlD2ieD5jqZcAyfL9em7M2G5Yeef1dcQWV9MQ/ZARLZs88gbL/zVcjytFFiB5LibN4kXEhchRUyenTYWk11Ml7FRXqZjnaN3qqzwb/ASKlA8PWkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXadq3gVaBY/omRDlymMBX4r2+JSrnh7vjCJjktqb9c=;
 b=Z320K670Nsszh39wL8QxRejKvczIus6gw5olm644RoDRcVtlChQkFqqqimMbPHuiudmcggIQ03ojc0l8RzShJV9X3zSxXB5o2IXf8qWn/sdmsW3XM1qkdTgSZLNqE/AXfQoo8HZFYDcut5kV5Z4+Lbbf1okFqXahehx1TPIsbEo=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TY2PR04MB4077.apcprd04.prod.outlook.com (2603:1096:404:800f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Mon, 14 Dec
 2020 16:40:44 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::9c14:2bd9:c4fb:d608]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::9c14:2bd9:c4fb:d608%7]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 16:40:44 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Is there any way to initilize all the platform specific Gpio's
Thread-Topic: Is there any way to initilize all the platform specific Gpio's
Thread-Index: AQHW0jeouwAffi/GNEqA+AWPwJZfFg==
Date: Mon, 14 Dec 2020 16:40:44 +0000
Message-ID: <TY2PR04MB331168C49C1964E4D2B80E3BCAC70@TY2PR04MB3311.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [117.241.156.116]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c7211e69-fb7a-45f1-623b-08d8a04f025e
x-ms-traffictypediagnostic: TY2PR04MB4077:|PS2PR04MB2696:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PS2PR04MB2696C23D15D105F1008AC03ACAC70@PS2PR04MB2696.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 73U0MVE4OGgz7yaBsQI82xBxrMcWWoDyA6mOICxXKMriUYrSG6c2fJiW7WISU3f3ZIWe3eQ2rQoZiPP7+u9i8zVx2BR63yNuRUW8OGL3BuTy3EiBW0s1LWpZbJgNu9dQ4iA9bp1OnAf9TVPMdjT9FVBhoGJzCXUVeK9G9xw74KNeC0gD46/UiKh6LFXpQGv9msIleBkTa4+c0EKMW6l4xGzhTnDHmYV7327R1fEvlibnF6uakAY+Ctg5v/prFXxf1hBKbQMuf44r3eTgk5FjIxu8Nl43mRIoH6dfEstDWVtXKPDnBSnKhJyjk4ZeNKM1QzN94p+jfNiYjwlad/vRqObXUEq8KkjkBZzRRyXh3vkArO++WiboM4fbTS1lR9Ev
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(26005)(7696005)(19627405001)(8676002)(5660300002)(6506007)(66946007)(76116006)(52536014)(91956017)(66446008)(33656002)(186003)(4326008)(83380400001)(55016002)(86362001)(9686003)(2906002)(66476007)(66556008)(71200400001)(316002)(6916009)(8936002)(478600001)(64756008)(43043002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?/xd91FY2i3ZiR9bakhQS35uSd4nQ0d9Vua0lOpfCGyE0JGR23NUZr16OGj?=
 =?iso-8859-1?Q?Cw/ki8Hj3ryR/iwMJDsJ8euD2/y9ZAA6PRs/kTDXbEhmBDMwSF+IvUbbF0?=
 =?iso-8859-1?Q?JtxVUQ4/8YmODAiAFaScb5C8rsahWAJcO5BsT9Vhvj8a/R6piaKXLe837x?=
 =?iso-8859-1?Q?4UWVzHqZwm8r2MfVZCGXSl/JMmEaSK/oVIViHgqbne+66bnsSKZOhPqrkp?=
 =?iso-8859-1?Q?KqgNPxkKzIUBj2CkFIoMYOL9hKAprMGXkPOVuvqc2m8IpoVJOm5gO+gyGD?=
 =?iso-8859-1?Q?/xx3sTkYeKt3WRCiqHAmm5MAcmbONrpGpP56x8Lf48F1Fjm2XEc3NuBR/O?=
 =?iso-8859-1?Q?hnKHgPmMfKltjCFfjTQ0MYbIKbE+ySfpKYpqCft4A0d4Qfn1C5EUa9EL8V?=
 =?iso-8859-1?Q?yHqYkoXuWhTU67nHky2Vycyqzms5Y/ABV/FbK40uTkGpRJMFutfysrqOBy?=
 =?iso-8859-1?Q?FpWUf80Mfs1O/QfLdTy3TweE9z4Hd6JHLW2YV79LS9ia2wY55X49Jllbxu?=
 =?iso-8859-1?Q?MJLkEuSUS76ZNzBuH3spys4M82ZkJaQOI/ODfFw5ZdEfjTJ1moI8kvyOPS?=
 =?iso-8859-1?Q?dC7mX40G1biMj6rOmlldURybfJIAnwqzPRgSw/ee1qwQtLAfeLkh4/ppaY?=
 =?iso-8859-1?Q?VPsBREjBwLkgvbY/n70T91gZ1arqTYEWqdwkzI/C5q0tOP6B/PrDNg2bNK?=
 =?iso-8859-1?Q?t4GSS0VUbC7itGl1zSwWavbml+wCr+mCMToHzD12/JDrKx/NpggwNKDLjz?=
 =?iso-8859-1?Q?OWrR1rk965v+Ldel8akYVuAcrdjuPRK6+fXpHNsx9SuBojrZbpgtcMFr1F?=
 =?iso-8859-1?Q?aetO3M3eJX4+bIPfRC1N+ZdfHQJDTQmEWTkJfpDmJwKKMq42J6pjFeT2bt?=
 =?iso-8859-1?Q?5aavsFoJ3FNBD2XGQ2+WNHhJoZXY9MPncpVuhp0HQRnSe891XsEAAbiW0F?=
 =?iso-8859-1?Q?OCdtxoI+Dle5IiuAnC+kH0iKJpb77WNoEgMRzi4nXm9sQOLasDzB5ZgawM?=
 =?iso-8859-1?Q?8KfTeSL6r/Ul+ZBOo=3D?=
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB331168C49C1964E4D2B80E3BCAC70TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4077
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT062.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1d2a54c7-82f4-4a96-f0e8-08d8a04f0084
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vxm2FeynYzMwVho79nURQcRL5ZPNJgFkgTCEsaEPncBGuWIIt6wRszBRBPlFAM0xrQldSrBF4et0Jl0xJiDnXGJ0aM638LuIP0ahjmLdoWCHsWSjnmedqs5T876gwoiI79iXH6knXp4ZEkJKsDEeJCFUi9Y57JzO28oUF0ME7ACMpMp9H09f64iKhy6cU2pcpfnOUPIGHv4f/oHBB56sU+HRRSVbn9B8+lpzT5LNbOGvEs8QewbPzShk3z1I0WjtCBs0zXSmo5I4cCJfzeRfVyV0fjszuPYaqX7UiqZlNuBMIGzkCuKrgajG7FsjgptalL9zu3TzHKSNtvzRoSgvEsoQIbXMmnWwproQ1dZo5H5yaKcM/oMGIMui9zSnk7pywr+m5iMugEFMg74y6kbzMy2ECqKbgJ8Tu181qBwt4Rk=
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(70586007)(186003)(52536014)(83380400001)(336012)(86362001)(33656002)(2906002)(5660300002)(26005)(55016002)(478600001)(356005)(70206006)(6506007)(9686003)(7696005)(81166007)(19627405001)(6916009)(36906005)(4326008)(8936002)(316002)(47076004)(8676002)(82310400003)(82740400003)(43043002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 16:40:46.7539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7211e69-fb7a-45f1-623b-08d8a04f025e
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT062.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB2696
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

--_000_TY2PR04MB331168C49C1964E4D2B80E3BCAC70TY2PR04MB3311apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Is there any way or any application available to initilize all the platform=
 specific Gpio's.


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

--_000_TY2PR04MB331168C49C1964E4D2B80E3BCAC70TY2PR04MB3311apcp_
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
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Is there any way or any application available to initilize all the platform=
 specific Gpio's.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
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

--_000_TY2PR04MB331168C49C1964E4D2B80E3BCAC70TY2PR04MB3311apcp_--
