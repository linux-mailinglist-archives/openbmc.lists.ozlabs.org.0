Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B79180A73
	for <lists+openbmc@lfdr.de>; Tue, 10 Mar 2020 22:30:08 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cSt50mVrzDqYC
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 08:30:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.93; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org;
 dkim=temperror header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=jfCsLCzk; 
 dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=jfCsLCzk; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320093.outbound.protection.outlook.com [40.107.132.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cJHn344JzDqQc
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 02:03:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5QEauMo5BZdrU7TW+ApZQu8izzPzcOHToATDCKd0yE=;
 b=jfCsLCzkzUdUjHt0XIxZccJpLN+g4OfXbxJ1mJI7n3Gu93mt6K4wwvwrdtxzKMf2zls9TDBmYaerrygZhp914+H50AAnCz43uGCHEj+8nDzU/i87jxCmgDoneDthwt60itS3ta1GO7VV2RXUi+UokFJyzoH5/xfec0Kqmf/sqdQ=
Received: from OSAPR01CA0295.jpnprd01.prod.outlook.com (2603:1096:604:2c::19)
 by PS1PR0401MB2092.apcprd04.prod.outlook.com (2603:1096:803:9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14; Tue, 10 Mar
 2020 15:03:04 +0000
Received: from PU1APC01FT057.eop-APC01.prod.protection.outlook.com
 (2603:1096:604:2c:cafe::cc) by OSAPR01CA0295.outlook.office365.com
 (2603:1096:604:2c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend
 Transport; Tue, 10 Mar 2020 15:03:04 +0000
Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=JPN01-TY1-obe.outbound.protection.outlook.com;
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT057.mail.protection.outlook.com (10.152.253.7) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.11 via Frontend Transport; Tue, 10 Mar 2020 15:03:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsRwsI4xf4dM/rkTW3tbSYD77A5JD3jJBXaTa5e41iJzHuGFs/crUNUh14q2MqSbeL6/L7negB8euYvToZCDG3w/OIMwgZXSDrav6SLRhwYVlu8feKnA//GEyNVSFomdZssPQ1xi0n6sCJbtgdWAQCAw5rcfNUl4iIO68SOJxXa1C3Jjbfl2/t3PwVAp0ujAekurnyILGewlgCkxe5I3vObL+c/gveTZi/e0xzNaXoB813uMYKgKlf8KNGZ2TOch3+QEZct1xq0T+R4l7i5ACCq7IcGMEzGapP8hZE7qPKh/cOnDUmdxzp2ZgUrI71sNC7s3a5ceqB0wSL7KpGRlKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5QEauMo5BZdrU7TW+ApZQu8izzPzcOHToATDCKd0yE=;
 b=AAbgS2zY+h0z4WE/5f0/d7nUOu9JQvy8v8GeeNYANbk79rnsP0QxVFP5VE9O6lL4axk6RIBJsOkJsjiBlokpzk86NlFGcNuYHAtXtaQiEQn6rEj7lML2J2mNiL2vY6moAhu4m3AaAgFQZOkJW0HNzRIryH/4oFLYL5SlJ2gxoTgsZUvQfby4yp9ZsXB29x3s861GnMpVc3v+4QdwDyDNRhGj2iudrIVg462YSJ0/3gwR5gFz4G1O8zgfyJqia3Tu2uGEWQjGL0MAGGUlf+B4m7oV+f2+kLp1rvu5zrUdnJOyJPBR2SUgXl7TQGDDT0onGI9CkAwz8JKCIwpMKsAahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5QEauMo5BZdrU7TW+ApZQu8izzPzcOHToATDCKd0yE=;
 b=jfCsLCzkzUdUjHt0XIxZccJpLN+g4OfXbxJ1mJI7n3Gu93mt6K4wwvwrdtxzKMf2zls9TDBmYaerrygZhp914+H50AAnCz43uGCHEj+8nDzU/i87jxCmgDoneDthwt60itS3ta1GO7VV2RXUi+UokFJyzoH5/xfec0Kqmf/sqdQ=
Received: from TYAPR04MB2304.apcprd04.prod.outlook.com (52.133.190.146) by
 TYASPR01MB0009.apcprd04.prod.outlook.com (20.178.137.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.14; Tue, 10 Mar 2020 15:02:55 +0000
Received: from TYAPR04MB2304.apcprd04.prod.outlook.com
 ([fe80::b953:bc31:1c69:8f00]) by TYAPR04MB2304.apcprd04.prod.outlook.com
 ([fe80::b953:bc31:1c69:8f00%6]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 15:02:55 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Multi-host support on x86-power-control
Thread-Topic: Multi-host support on x86-power-control
Thread-Index: AdX27LL0KRNtY+TARyWcKvKsVO2blg==
Date: Tue, 10 Mar 2020 15:02:55 +0000
Message-ID: <TYAPR04MB2304A73BA8079FC4063F159FCAFF0@TYAPR04MB2304.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: null
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiY2EyMWU5OWQtYzAyYi00N2QzLWFkZDEtNTI5NDI2MzYwODg5IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjZtY0dkN1piMFdhZHNjSU9nNVUzRkpsaWFcL0pzM3FaaWc3K3dmSUR3WVdCeWd0Sm1mbEtOTlJcL1p3aEhtUmwwTyJ9
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=PriyatharshanP@hcl.com; 
x-originating-ip: [192.8.177.106]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 60127de9-71a0-428e-722b-08d7c5042171
X-MS-TrafficTypeDiagnostic: TYASPR01MB0009:|TYASPR01MB0009:|PS1PR0401MB2092:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PS1PR0401MB20927155E08C793B9EE54496CAFF0@PS1PR0401MB2092.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:6790;
x-forefront-prvs: 033857D0BD
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(199004)(189003)(478600001)(9686003)(2906002)(55016002)(52536014)(8936002)(8676002)(316002)(71200400001)(6916009)(5660300002)(81156014)(7696005)(54906003)(81166006)(9326002)(6506007)(76116006)(66446008)(86362001)(33656002)(186003)(26005)(66556008)(66476007)(64756008)(66946007)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYASPR01MB0009;
 H:TYAPR04MB2304.apcprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hcl.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: UYwQEM9A+CCxBZmGCeXkKpTJAq9VjVMFY5c0/nTdmIbXpQCT6JQuJplqKieCqDXjhTRb/uqkCHBdODn7dMU82NLhrX18daSp653mS4+7ZgawKkElXBl1TDrpM6Ic2d/ZMCMTYpU2U/hkCRbELnRHgdfCHcJC1Xa5mhJ5Sj8s5B/K9SkmYZLdf4zG2OaBmivlfDD97xuvbyyS8uDJelgo1gwntUOKHbGWkNSk0zFT20MMSEx6cSOyXwaC/RhzfDxjWjph57nTWBL9Q1GOe9XFUcxPImQUg32a4a8hfvNm6BiFIGLxl232I+aYx7sI2QkWLDulhS6HI2qBvRSeocsHvy6En/U7WkzxWbuZE9xdVkNsp7t0TmvpPaDnNhcBrDNNlwyJfPItXNHnnUxlIlAKdv952wTA62ODimsRusfv4o47k0ffv9hHdwkNe61PCkgB
x-ms-exchange-antispam-messagedata: 7apQrBiuv5cj4w9LLQIxna8L4IHwyvOCQy19SkDBovffNQZQRqT7ssHVR43154fK5YZAp/f0OxEo4/dBjppKCmH1cfVgfxTEdf1VrZAfdPi0/k5F2e257ziwg2k4dq4rxIzIVLLXISX7nIxXuQM1+Q==
Content-Type: multipart/alternative;
 boundary="_000_TYAPR04MB2304A73BA8079FC4063F159FCAFF0TYAPR04MB2304apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYASPR01MB0009
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT057.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.195.57; IPV:; CTRY:IN; EFV:NLI; SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(316002)(6506007)(2906002)(5660300002)(9686003)(70206006)(81166006)(336012)(4326008)(186003)(70586007)(26005)(9326002)(478600001)(8676002)(8936002)(55016002)(7696005)(81156014)(86362001)(6916009)(54906003)(52536014)(33656002)(356004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PS1PR0401MB2092;
 H:JPN01-TY1-obe.outbound.protection.outlook.com; FPR:; SPF:Pass; LANG:en;
 PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 23afba10-c35e-4cab-5e72-08d7c5041d58
X-Forefront-PRVS: 033857D0BD
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8LphQBbZVh9leMFGlgTXsXA5iF9suICXCnzPwTd+JzSfqdBSjWVlBSjdqhDk/qAtFGjCJptmDHtNXM8sVDKWi+771/EL9EyRH7zYtpWvJFQXg9A0XL6Oj3mWrgeqWtzrlNUoCwqT9JxCRG78PBwcFnGa3oo1R3lyNxzAzLBfvWSUqERAD0d5GZJtVfqGxOG72ShbZYwYYW37Rsf+p9cFzH8dcwllN3JilLJnI+Aun+1xfa4/CIvSapY3t5IjVJseX9z4bPRIiT3BkAlKtlON9MiLvuqBm+TKwiddkNy5upWDCpc0o5gcP4tTBJeQ7NQpJStFqUW/tG78Ic/QIg32DbYTVM5bXzX0x4BWr9jelS1URK0maCtC/4GstvEk3+1LX2R8YVdox+rBHPMDa/F03JzLCWP4cWRFzygvwHmwMIidiY2jWbfVqN4s3BBBjhRw
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2020 15:03:02.0258 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60127de9-71a0-428e-722b-08d7c5042171
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[JPN01-TY1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0401MB2092
X-Mailman-Approved-At: Wed, 11 Mar 2020 08:27:50 +1100
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
Cc: Jason Bills <jason.m.bills@intel.com>,
 Kumar Thangavel <thangavel.k@hcl.com>, Kuiying Wang <kuiying.wang@intel.com>,
 "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>, Manikandan E <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TYAPR04MB2304A73BA8079FC4063F159FCAFF0TYAPR04MB2304apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

x86-power-control currently support single host. Is there any proposal/plan=
 to support Multi-host?


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

--_000_TYAPR04MB2304A73BA8079FC4063F159FCAFF0TYAPR04MB2304apcp_
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">x86-power-control currently support single host. Is =
there any proposal/plan to support Multi-host?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Priyatharshan P<o:p></o:p></p>
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

--_000_TYAPR04MB2304A73BA8079FC4063F159FCAFF0TYAPR04MB2304apcp_--
