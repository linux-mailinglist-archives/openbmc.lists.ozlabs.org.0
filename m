Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3ADD5D2C
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 10:11:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sB9H0cppzDqZ3
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 19:11:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=wiwynn.com
 (client-ip=103.200.3.19; helo=segapp02.wistron.com;
 envelope-from=bright_cheng@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.b="Sjq+fWRT"; 
 dkim-atps=neutral
X-Greylist: delayed 311 seconds by postgrey-1.36 at bilbo;
 Mon, 14 Oct 2019 19:10:53 AEDT
Received: from segapp02.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 46sB8F4tf4zDqLZ
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 19:10:52 +1100 (AEDT)
Received: from EXCHAPP04.whq.wistron (unverified [10.37.38.27]) by 
 TWNHUMSW3.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdad76d5293c0a8167117f0@TWNHUMSW3.wistron.com> for 
 <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 16:05:36 +0800
Received: from EXCHAPP02.whq.wistron (10.37.38.25) by EXCHAPP04.whq.wistron 
 (10.37.38.27) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Mon, 14 Oct 2019 16:05:35 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (10.37.38.70) by 
 mail.wistron.com (10.37.38.25) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5 via Frontend Transport; Mon, 14 Oct 2019 16:05:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none; 
 b=T22cz2xoHRoE3Me5ZXZLxWGshRDp/s47Bvz2S/IEa4IdGkl/S9eUyvCafrPv73tJQ0sERROez/wny9JFY72MHXc+oW0OvEaHaxiMw8j1hl9/iDt8Roy3yKyZZIiYRdg+1AvepMIet9qs8mXqXGpbP7Aej8oFrQv5eM5JL0iApQqA0+Nf3n/zbetjCJJgrDHBbKalgD6ePbXDkLnYWwcq3wF3dFZN+qy0f/oESm+R9QUBfC90cIYQPIxmz9p5RL21TIRAUPnlIsSbx+pjG2InugQav0rD0PSyrOJvG0U8yQ1oiQ53rYGRgh6GYdxOx0ULUWbx0NqgKlOeYIQsx3szsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6roqZJx9fJnBzyra4uQYNYMbwzs0aQ/LR86NHBIFzX8=; 
 b=NzVO1XRpWnl0Oc2fG30rq/i4etBipaPWo0nP5L2GhcKDY8ZLQGDSw7ZYU+FibEx8bcC68bgeUJ/NswdU1eLdvMe3JbAgPlByLPoGkwRhLmO/RmBIPh+FjW3FDa2LJs98lGn3srh4EqTMA/IpQoNCwJKFxRa02uNGf0ewGlQm9ppfCB/mTepFtIOncB5tVfrVpD31dHgWFLEJ9mx3xavDOaXYHHQikhLfpICcefeHeDnJOtij8CF/KzkqAZ8VOpnWA+jL/GzDnCGYkES7/TeawzPuJiOzGfPv4a3LwEiO3uh2Dy3YvkLx8yC4R9RQrG9RXaWYTDLowqZFebUJT2TEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass 
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none 
 header.from=wiwynn.com; dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6roqZJx9fJnBzyra4uQYNYMbwzs0aQ/LR86NHBIFzX8=; 
 b=Sjq+fWRTlto05GJxP8SfI7hnUoZeVsUfIdeUY6gmLqlt/HSNTGPEzlGk8HOkzMetJtkle0CsCJHeCWeP/p7qxNXcwX86rOfemk5LB0OEDWbDRIX9Ud4Djm7eVuRBDajimdmlnq4wAfI0tHKCfbaw0RLMw5b1WBewczb6uH3cWvI=
Received: from HK0PR02MB3348.apcprd02.prod.outlook.com (20.177.68.82) by 
 HK0PR02MB2547.apcprd02.prod.outlook.com (52.133.158.12) with 
 Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 
 15.20.2347.16; Mon, 14 Oct 2019 08:05:33 +0000
Received: from HK0PR02MB3348.apcprd02.prod.outlook.com 
 ([fe80::29c9:2de0:35b9:7e4]) by 
 HK0PR02MB3348.apcprd02.prod.outlook.com 
 ([fe80::29c9:2de0:35b9:7e4%4]) with mapi id 15.20.2347.021; Mon, 14 
 Oct 2019 08:05:33 +0000
From: Bright Cheng/WYHQ/Wiwynn <Bright_Cheng@wiwynn.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to build phosphor-ipmi-flash for Windows
Thread-Topic: How to build phosphor-ipmi-flash for Windows
Thread-Index: AdWCYJs21FToIw+mTaeCTdTMasOhDA==
Date: Mon, 14 Oct 2019 08:05:33 +0000
Message-ID: <HK0PR02MB33485BCC0DF6AEFCC484A9C69F900@HK0PR02MB3348.apcprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) 
 smtp.mailfrom=Bright_Cheng@wiwynn.com; 
x-originating-ip: [123.51.148.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35f994a7-d713-4d98-ac3b-08d7507d49b0
x-ms-traffictypediagnostic: HK0PR02MB2547:
x-microsoft-antispam-prvs: <HK0PR02MB2547DFEF95544F288ABFC8309F900@HK0PR02MB2547.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(51874003)(199004)(8936002)(14454004)(102836004)(2501003)(52536014)(6506007)(80792005)(7696005)(186003)(2906002)(256004)(66066001)(71200400001)(81156014)(3846002)(1730700003)(8676002)(790700001)(6116002)(81166006)(71190400001)(86362001)(478600001)(25786009)(76116006)(64756008)(66556008)(66476007)(66946007)(66446008)(54896002)(6306002)(5640700003)(7736002)(4744005)(74316002)(55016002)(5660300002)(9686003)(33656002)(99286004)(316002)(26005)(6436002)(6916009)(2351001)(486006)(476003);
 DIR:OUT;SFP:1102;SCL:1;SRVR:HK0PR02MB2547;
 H:HK0PR02MB3348.apcprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;
 PTR:InfoNoRecords;MX:1;A:1;
received-spf: None 
 (protection.outlook.com: wiwynn.com does not designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w5OUBYzEBn4InDKmHM8c81mvyEGnys5ylbsYYt8h1P1bRizP9dkTele349Kaku6SiHWT8+0TkqGkpjpmgR1Ofh8k6FXE+iH1mCoG+0+lEsXkJjsUkNlX/7BEw3GYcSZZ/sgOC1VEExpaT8nlaUWZ/+26tnPrE7IMZU9hlWOgiHgCj8+BqHu2aaJFS7zZP1awopPKRKSoNxKFklP3MgWArQZGD5nbgulUZUgkjiWpJU6rL4cCAC6D4SKT0U6SRjU848WLKwGRRRYLn0V+7QeVnk63J80HT2YNk+p4McyYBopjXph4wE3e991pHSajblEI4ap215HNAhGdysUlIBbEwsikW0w2rl6lYvT3ANSgop5DrgqlgX55a8Yo2b/ZxROIm+GawCdHOxSpy1uucdh9uge2W3AfGAVMFM9BFv1Xjhc=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative; 
 boundary="_000_HK0PR02MB33485BCC0DF6AEFCC484A9C69F900HK0PR02MB3348apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f994a7-d713-4d98-ac3b-08d7507d49b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 08:05:33.1525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsnXR8x2BQ7cEpKWfJ5jCABCQVMsqnDBAhEb23eo7IF1oraX+PCs5mCrJDxbJKQieaxiRWI0AHkh3CJLwOVe1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2547
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: 6B8FF218136FB5F0CAEE87EE61A419D97E26343DAA01040807812C05835D02832000:8
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

--_000_HK0PR02MB33485BCC0DF6AEFCC484A9C69F900HK0PR02MB3348apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I want to build phosphor-ipmi-flash host-tool (burn_my_bmc) for Windows, do=
es this host-tool can run in Windows?
If yes, I'd like to know how to build phosphor-ipmi-flash host-tool for Win=
dows?

I tried to build it under Centos and used i686-w64-mingw32 4.9.0 and add op=
tion "--host=3D i686-w64-mingw32" behind ./configure.
But i686-w64-mingw32 4.9.0 doesn't support C++17.
And I tried to build it under Windows, but I cannot successfully build pciu=
til and ipmi-blob-tool.


Thanks in advanced for any insight!


Sincerely
Bright

---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient.=20
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------

--_000_HK0PR02MB33485BCC0DF6AEFCC484A9C69F900HK0PR02MB3348apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Microsoft JhengHei";
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Microsoft JhengHei";
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
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
	font-family:"Times New Roman",serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">I want to build phosphor-ipmi-fla=
sh host-tool (burn_my_bmc) for Windows, does this host-tool can run in Wind=
ows?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">If yes, I&#8217;d like to know ho=
w to build phosphor-ipmi-flash host-tool for Windows?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">I tried to build it under Centos =
and used i686-w64-mingw32 4.9.0 and add option &#8220;--host=3D i686-w64-mi=
ngw32&#8221; behind ./configure.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">But i686-w64-mingw32 4.9.0 doesn&=
#8217;t support C&#43;&#43;17.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">And I tried to build it under Win=
dows, but I cannot successfully build pciutil and ipmi-blob-tool.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Thanks in advanced for any insigh=
t!
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Sincerely<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Bright<o:p></o:p></span></p>
</div>

<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient. </b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p></body>
</html>

--_000_HK0PR02MB33485BCC0DF6AEFCC484A9C69F900HK0PR02MB3348apcp_--
