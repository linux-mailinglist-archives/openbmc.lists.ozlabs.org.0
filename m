Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D95B2850FD
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 19:40:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5Pqg11phzDqHS
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 04:39:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.115; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=CjPX0oM0; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=CjPX0oM0; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300115.outbound.protection.outlook.com [40.107.130.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5Pp54hsLzDqH4
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 04:38:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0Tk2AsAo6UPec5ZNmMkz353RX3yncozDf5Dq5dde6I=;
 b=CjPX0oM0LRhGqPd2aSMXwgCARKTPG7G3ItdhkIKrxb1u+jXiXkxiKrgjaDJ36ezx8okM+rfFNbka6J0+b2YvoIzWODYdSyjI/juHp1oUn+AvkFCqaC3XkruIjp3vPN67HlABtTLTCrCttw5u02Cay7jvmN3g3JulZFb4HXLh9HY=
Received: from SL2PR03CA0005.apcprd03.prod.outlook.com (2603:1096:100:55::17)
 by SG2PR04MB2250.apcprd04.prod.outlook.com (2603:1096:4:a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.40; Tue, 6 Oct 2020 17:38:19 +0000
Received: from PU1APC01FT035.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:55:cafe::98) by SL2PR03CA0005.outlook.office365.com
 (2603:1096:100:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.13 via Frontend
 Transport; Tue, 6 Oct 2020 17:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=KOR01-SL2-obe.outbound.protection.outlook.com;
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (192.8.245.54) by
 PU1APC01FT035.mail.protection.outlook.com (10.152.252.214) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Tue, 6 Oct 2020 17:38:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1ARydN8SRIvFoT3cUuA96csR/GMLxyaWIhOTe3ngUCmeaVKmYZGUtX4idWtBtcFCHAz0AS+e59PWBfDGEnX1v7OtV7kHS+vyjjsWzP/b6faxPRCdr21pJHLVWbCBN3g6g6tN8faLafguJKPqNvbkIg7StyOcuVmPhrNW0AUaMjdGxMS2D3xFUHXNY7w04UDTJb2J+gCn8gDIhQs44UvXnZDGWFByMwsTpZuXNCU7XqZBaTo+pXjavSKWrnZJozUfxfdBWnZbIEGsbfgngB2cxIqiM1eBnBF5KqQyOibrMx0OXkmK4hvPHsBVRpfCQNQOJqIsVKOPxhsHGJQ9bm4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0Tk2AsAo6UPec5ZNmMkz353RX3yncozDf5Dq5dde6I=;
 b=Ud41abjU8x/FytHvYmD+1rsJ8M1uWjQQvdMUtvXXzHRAQknpHizh06EGnpmDoMApsnI8uy5VnU/meoXpQ8l1zmfR3CVIF8Rd9MqlMZoS6GJ6o/eZs33hx0ysoVM64rs+FMsbtqfayKA8B1SIcWYqqtYPjL1WON9n5pVsMhy0Ss312wc0TIMPZW51cKJanPurmrnxvT68sC5eyycK/A5hN0EKMyKxS+1CTmhiJyJmQyFZlHq9FqgoYPM5oQjmjokP8A8uAtPMflAzkEfRlIvaI63D5ux9nDcP+gzYw+zCD7NcKgSWVP17BnmjAGTNXiHKUQeY58NBbMbMy6/GDa+F5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0Tk2AsAo6UPec5ZNmMkz353RX3yncozDf5Dq5dde6I=;
 b=CjPX0oM0LRhGqPd2aSMXwgCARKTPG7G3ItdhkIKrxb1u+jXiXkxiKrgjaDJ36ezx8okM+rfFNbka6J0+b2YvoIzWODYdSyjI/juHp1oUn+AvkFCqaC3XkruIjp3vPN67HlABtTLTCrCttw5u02Cay7jvmN3g3JulZFb4HXLh9HY=
Received: from PU1PR04MB2248.apcprd04.prod.outlook.com (2603:1096:803:2d::14)
 by PS2PR04MB3894.apcprd04.prod.outlook.com (2603:1096:300:66::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Tue, 6 Oct
 2020 17:38:14 +0000
Received: from PU1PR04MB2248.apcprd04.prod.outlook.com
 ([fe80::88e0:657:b223:abe0]) by PU1PR04MB2248.apcprd04.prod.outlook.com
 ([fe80::88e0:657:b223:abe0%6]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 17:38:14 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: adding sync method in phosphor-time-manager
Thread-Topic: adding sync method in phosphor-time-manager
Thread-Index: AdacBv9Bki3TPVlHTNSiDfy0xL6Npg==
Date: Tue, 6 Oct 2020 17:38:13 +0000
Message-ID: <PU1PR04MB2248961AEF87BA87C7749050A70D0@PU1PR04MB2248.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMzI5NjNiMzEtMGIxYS00MWNiLThhNzYtZTJiMmRkYTY0MzhiIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkZDMCs1WlZsVDNUdlNZZ0xFaVlXbUdaR2V6bW83OFFLbVpwelNTNVNoOUlzRG9raUxaRlJpRVVGdnhJR2Z6ekoifQ==
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [117.217.179.5]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f6671867-fddb-4d90-fcdc-08d86a1e9c58
x-ms-traffictypediagnostic: PS2PR04MB3894:|SG2PR04MB2250:
X-Microsoft-Antispam-PRVS: <SG2PR04MB2250876BAF1869D1A8DA901AA70D0@SG2PR04MB2250.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PmU+aPwZ8Cc5MbP+3CuD//grvGyjrgtAAjNTwTVOkMXaY54M62whfDRnO5AaFqPbUnM3YoibAd8sRoKZ8vlfXQjkEBmVFKAUW3BmTQY7WAWPSjhbkbXQH8+jEwHXr9gmcTMW3qmgn1i3UvQqrEizk0joKWLJWjXZHst7KpdfiJ+HVjwQ+NQUY8yLeqRAy9KPo0oshSR8NU5eyM7ayV8khqJaCtKXQB7NUykfuPputzio+MNOj21RmiLR+G89dbmIrL1u045Lf48goh1673G/aIFuXXLzLZEDiYt9d6XNwNbLKxFCFikq1ohDyLRYrD9EsuqNWS0u0ZETqQA++qhxO8AKVE4DUrFDw0ewRIIJAMYKIOirB9K+M5pJd3+zgyc2FkTOq6PSkjJWjInvsGgC1g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PU1PR04MB2248.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(186003)(316002)(55016002)(26005)(4326008)(66446008)(9686003)(8676002)(8936002)(86362001)(54906003)(66946007)(478600001)(966005)(6916009)(83380400001)(7696005)(166002)(6506007)(66556008)(71200400001)(64756008)(33656002)(83080400001)(2906002)(5660300002)(76116006)(66476007)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jxKZeLBbhK3bhykuOhhrV1uUcMZwLEuc1o0RjGJTcZx16cr+iW75xvsfktgAol9AxIykY0f5Ej8KVwPe6cpHEOirj5+kD0ZoHDwzG4djKyAHufOnK6zDhOby/6Q40pwSJ+rQB3VHWJU+KVBe0Yltx58pGZ5SmDfPmiIZPJIsqwWmSz88ga1X2mxCk0WWOpyuuDonvmGQu6cblHYHEry1S3FviySz37Ot0W9h+AB5dICr06zBAS4HHiLHzmIutDWNpbNWyyxizidRohomQasgmKDY70hT3BvHdnow1UYskbg8cnceYVlmYuDMpoBp8Fe+G5SBDHiiXaptTUUPi97ww7rhZ9MFHpVmgUKLhvLPqgAGd6yzaDY012JTCqgXOhFmoYGC9aqnGAmpIRRILsfZJF4q19+j1UMw3xcP6UPGnfaTtu2Lco8hZmepRYuQCazCoi652PjkK6+CWZNqrCe8bCPLCb+mvPDz7KzBgKA8qDX83kLL1LEUkb6INMGuRqpAzuY58O86DIpo/uh1cf/CBA6l5B7ZTa5Wl7ahkVrIK5va84Qq7YQ4gWwQ3qS4FTF5qiXiubDm03xUE8CDlyIWCD5VthHATGgCowcGtv3eSnR2299j/m9V4XgYTtVIKqywSjCqDdpM294w8LBdpLqaFw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PU1PR04MB2248961AEF87BA87C7749050A70D0PU1PR04MB2248apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3894
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT035.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4ba8a92f-1deb-4036-7096-08d86a1e9a2f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OqyhANzvgwfM+0NUedbKUV/yl3CaD0kcWzNm9v7g4UytV78JRUAo3txnShnt1sY6TPJYm9EuUamgKbVt2gxaND3VKpqj5QoMTmz6FTRG9vrlFDl8jRUWlEl8uAlvDyNAir8USxWiDkMnBYN3mclrXH+z8vMDuQS93NpHcZbfuSbalutyHz19Vi96J0v1Ts07tE2CxaiKyhUpDwLc0LqBndTssigxlU3bk/KloJ8POHaPYVwuh29u1m2ikhrBAZOdgeV2iwglWLh5IicAEk/dfH1Np5d74cTKaYQnzcNWLV/si/Lp7shEjYDv4v7KDVQ9EsVFvGSMLawh44tsNbXA677NxzpcJ8bLL034bfZudxHlP5SwCTFrxV62o2MlkjrpL6PVm4vvy7iPO0iNuB695F4bfCEXZfo5mO1vxZ4k87h0zLz1N4UDTeZh5cdVLhwhacZhdFO0dy64nCTZ2Hryqp9c8XTuYSWMrSaU/RaSfcFWtN7Um08JoCc8rk41Zryq
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KOR01-SL2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966005)(6506007)(36906005)(166002)(26005)(86362001)(83380400001)(336012)(186003)(4326008)(6916009)(33656002)(54906003)(966005)(9686003)(52536014)(55016002)(478600001)(7696005)(316002)(2906002)(5660300002)(70206006)(356005)(82310400003)(70586007)(8936002)(82740400003)(8676002)(34020700004)(83080400001)(47076004)(81166007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 17:38:16.8919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6671867-fddb-4d90-fcdc-08d86a1e9c58
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[KOR01-SL2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT035.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2250
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
Cc: Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PU1PR04MB2248961AEF87BA87C7749050A70D0PU1PR04MB2248apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification:
Hi Team,

We wanted to add another time sync method in phosphor-time-manager to get t=
he time from the host and set it to BMC. To have this option configurable I=
 propose a dbus property in the time interface(given below). Please provide=
 your feedback/comments.

https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc=
_project/Time/Synchronization.interface.yaml
enumerations:
    - name: Method
      description: >
        Possible methods of time synchronization.
      values:
        - name: NTP
          description: >
            Sync by using the Network Time Protocol.
        - name: Manual
          description: >
            Sync time manually.
         - name: HostSync
          description: >
            Sync the time from host.

Regards,
Velu
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

--_000_PU1PR04MB2248961AEF87BA87C7749050A70D0PU1PR04MB2248apcp_
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <span=
 style=3D"font-size:12.0pt">
<o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We wanted to add another time sync method in phospho=
r-time-manager to get the time from the host and set it to BMC. To have thi=
s option configurable I propose a dbus property in the time interface(given=
 below). Please provide your feedback/comments.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/phosphor-dbus-=
interfaces/blob/master/xyz/openbmc_project/Time/Synchronization.interface.y=
aml">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/op=
enbmc_project/Time/Synchronization.interface.yaml</a><o:p></o:p></p>
<p class=3D"MsoNormal">enumerations:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; - name: Method<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; description: &gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Possible =
methods of time synchronization.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; values:<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - name: N=
TP<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; description: &gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; Sync by using the Network Time Protocol.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - name: M=
anual<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; description: &gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; Sync time manually.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - n=
ame: HostSync<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; description: &gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; Sync the time from host.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:=
p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Velu<o:p></o:p></p>
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

--_000_PU1PR04MB2248961AEF87BA87C7749050A70D0PU1PR04MB2248apcp_--
