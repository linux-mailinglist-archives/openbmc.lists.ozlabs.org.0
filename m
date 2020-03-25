Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54819341E
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 00:03:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nkDg1y9wzDqbt
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 10:03:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp03.wistron.com;
 envelope-from=max_lai@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-Wistron-onmicrosoft-com header.b=el1ux63d; 
 dkim-atps=neutral
Received: from segapp03.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 48nNyJ225pzDqgd
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 21:04:37 +1100 (AEDT)
Received: from EXCHAPP02.whq.wistron (unverified [10.37.38.25]) by 
 TWNHUMSW4.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tde1f46d349c0a816721630@TWNHUMSW4.wistron.com>; Wed, 25 Mar 2020 
 18:04:35 +0800
Received: from EXCHAPP03.whq.wistron (10.37.38.26) by EXCHAPP02.whq.wistron 
 (10.37.38.25) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1913.5; Wed, 25 Mar 2020 18:04:34 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.37.38.71) by 
 mail.wistron.com (10.37.38.26) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1913.5 via Frontend Transport; Wed, 25 Mar 2020 18:04:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none; 
 b=lBOPKqELL1nz1ix5eBH3jbY+QdxhW7fzFS/gfQbrFWI1XOXjRJHn4tA5qQCP1YvxCD+bj0cmh+HDwmQ9WN3HYvGdgRkzRNEqBM15jO1Apg3ccr4R7Ed7PNFWrN8IKVy88HJPmjOYPGMd5Le1ZS9Wem8Pe9kDp+cC3HoTJN/3z4fNRxuwyDvWKf2cmaSwnPIaDNWJMAYxqgSlJ1yxpUfVHP2X4MOC7S68zhfy21RX5sKC8B6D2s0WQfpBkIEi2c4uOMW8Vkv7KKxh3CvYDdD+RdEsZZ3iYNN55PX9Z6ogHNNN7fFyCGcwQq7TvVwg7dbTxPn4YJOSo+iWp9mA7vlbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKMpjd+Qmo1PiREGQ6oSx3kAvtIcq30XMadNlHuvaGI=; 
 b=SDCSZdcHjv1oMtjIO6u7i/l89Sr8znVELv4VBfATCp+rVGGEU3Agr+OfFAD0vjcvzYdX7uXWfK6aCA3gx8Kew9hFDhdmTvni5rnBTRBNJAi+lmvUMc9OHGheQXt+8UoMh8PlXiRsvMVQKe5iG8BIAo5r4/4MhGesJ88+ICTyfJWwKExfoVsp0GKgu02ZfcHofCW1xoDyIfP0MNbJkaGVA0E1euUWA/Xmlas08hBetSbdZN4v6Gcz2JlSUovk7sgI4QXE7kMXSRHh1fHAEDY5JQ2e16gkpbnQMr0HDgOEfSN7TdTdbUn4gcI9GXo9p8ChnHs0Wv+ddeghZYZOUSupGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass 
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none 
 header.from=wiwynn.com; dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKMpjd+Qmo1PiREGQ6oSx3kAvtIcq30XMadNlHuvaGI=; 
 b=el1ux63dmQEvk7O52jITrj1R+qFZfWXm9ayeewXNPG/XrcgUdvHKy3Qd23hpOjbf4ADJYpn9kMV0SM1urTvEHqs5Ifd6X+FU3crXjNQAyBt/HlHTgoPs5D6gLMT3pVAgB64oARukwihUl6qLtNz3wCjN1tusSaA+uP0zwAsRaCQ=
Received: from HK2PR02MB3826.apcprd02.prod.outlook.com (10.170.156.210) by 
 HK2PR02MB3890.apcprd02.prod.outlook.com (10.170.158.144) with 
 Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 
 15.20.2835.22; Wed, 25 Mar 2020 10:04:31 +0000
Received: from HK2PR02MB3826.apcprd02.prod.outlook.com 
 ([fe80::c52c:3509:987b:9b1d]) by 
 HK2PR02MB3826.apcprd02.prod.outlook.com 
 ([fe80::c52c:3509:987b:9b1d%6]) with mapi id 15.20.2835.023; Wed, 25 
 Mar 2020 10:04:31 +0000
From: Max Lai/WYHQ/Wiwynn <Max_Lai@wiwynn.com>
To: "tomjose@linux.vnet.ibm.com" <tomjose@linux.vnet.ibm.com>
Subject: Some questions about the handler of Add SEL Entry Command
Thread-Topic: Some questions about the handler of Add SEL Entry Command
Thread-Index: AdYCidN8vjFN1HoJSMqRwWkwqI3vpw==
Date: Wed, 25 Mar 2020 10:04:31 +0000
Message-ID: <HK2PR02MB3826E495C4A57F7F0F4C07B1EACE0@HK2PR02MB3826.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) 
 smtp.mailfrom=Max_Lai@wiwynn.com; 
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06658d28-9608-4af0-bb48-08d7d0a3e9d7
x-ms-traffictypediagnostic: HK2PR02MB3890:|HK2PR02MB3890:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR02MB38903C18F3FE11A2F81290E6EACE0@HK2PR02MB3890.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(66556008)(6916009)(26005)(86362001)(66946007)(76116006)(6506007)(7696005)(66446008)(498600001)(186003)(55016002)(8936002)(54906003)(64756008)(107886003)(9686003)(52536014)(4744005)(4326008)(81166006)(66476007)(33656002)(81156014)(71200400001)(8676002)(5660300002)(2906002);
 DIR:OUT;SFP:1102;SCL:1;SRVR:HK2PR02MB3890;
 H:HK2PR02MB3826.apcprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;
 PTR:InfoNoRecords;
received-spf: None 
 (protection.outlook.com: wiwynn.com does not designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9lAIb0p8wrzhr2/N6o1rom2bTy8Gjc2QS4eE1I2+2FN/Fri0xT3aE2TdcCVVP6uDQIZjbFCIkHJc21M/QOzu8sVxRGqm0amG9ICUw9iWOg+Dot134MIO7MRN7M18MqEbL99pdfInu7LVvj/1rHNHvViOgS3unphZZ2Lpn1zygPL3Qxc1RtXvVNcwk9nOlM4o1y3DRD66ZVERoEi12+htUeXFk08cIqnsO6FKUEE4ERs5CXnccW/F0Z/MSogstXcoSmiQnLdbyYK7kkL/cdaVT7JF+JzMKvJ41Yvuir1Y1rzchGaVOV9Ztq3PdPJl0FVFXRdZ6zh/3gUqLd1iFbtzvNBZrivrmQVQ1WPGDT0/VmL7OFvh7/5KDM0OpOC8t3lzq8qvIys3/8QNJi+eeLIBemaY8Rp2Y8RVbsKjxrDk8Rzf484CNqu+7gID5JGn8bhV
x-ms-exchange-antispam-messagedata: /V0OxDqWqT8vGkvNqQa7YF9nmG6CvdmXhhtNq8SrR3y8hvE2E+y08JCTkIlR+uG4f6dJ8flteDwO8wbh6wFE2/5+UXukhupQA22wscvGf42TqnD27BLS99juXwbSvC2SIVwNH9Xh83pYGk61y4JTjg==
Content-Type: multipart/alternative; 
 boundary="_000_HK2PR02MB3826E495C4A57F7F0F4C07B1EACE0HK2PR02MB3826apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 06658d28-9608-4af0-bb48-08d7d0a3e9d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 10:04:31.6281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0e0HHesG0tuIMGArkoZDlBtm1L2YGyY2iECbPV1858YALasXtrgDpAtQWF4MFIpV52F2R0B0DZW7rDeLg+sjsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR02MB3890
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: F63DB15D99C8A68FB5BCB424CA0B14C97F4D63586E13AEAE20010CC4D6FB5BCB2000:8
X-Mailman-Approved-At: Thu, 26 Mar 2020 10:02:36 +1100
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
 "LF_OpenBMC.WYHQ.Wiwynn" <LF_OpenBMC.WYHQ.Wiwynn@Wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR02MB3826E495C4A57F7F0F4C07B1EACE0HK2PR02MB3826apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Tom,

Our validation team met a problem in phosphor-host-ipmid (phosphor-ipmi-hos=
t) recently. We want to use the Add SEL Entry Command handled by ipmiStorag=
eAddSEL. We look forward to getting correct sel log with parameter we offer=
. But We found that the handler only use sensortype to create log entry whe=
n recordType is equal to procedureType(0xDE). Why the other parameter is ig=
nored to create log entry ? It seemed that it did't follow the ipmi spec. T=
here are more questions. What is the eSEL ? In function createProcedureLogE=
ntry(), what information was stored in the eSELFile (/tmp/esel) ? And how t=
o create the eSELFile ?

Regards,
Max Lai


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

--_000_HK2PR02MB3826E495C4A57F7F0F4C07B1EACE0HK2PR02MB3826apcp_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
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
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Tom,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Our validation team met a pr=
oblem in phosphor-host-ipmid (phosphor-ipmi-host) recently. We want to use =
the</span></b><span lang=3D"EN-US">
<b>Add SEL Entry Command handled by ipmiStorageAddSEL. We look forward to g=
etting correct sel log with parameter we offer. But We found that the handl=
er only use sensortype to create log entry when recordType is equal to proc=
edureType(0xDE). Why the other parameter
 is ignored to create log entry ? It seemed that it did&#8217;t follow the =
ipmi spec. There are more questions. What is the eSEL ? In function createP=
rocedureLogEntry(), what information was stored in the eSELFile (/tmp/esel)=
 ? And how to create the eSELFile ?<o:p></o:p></b></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Max Lai<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
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

--_000_HK2PR02MB3826E495C4A57F7F0F4C07B1EACE0HK2PR02MB3826apcp_--
