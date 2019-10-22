Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0ADFF11
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 10:09:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y5lM2cwvzDqN5
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 19:09:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=frederick_lee@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.b="m8REHgCD"; 
 dkim-atps=neutral
X-Greylist: delayed 310 seconds by postgrey-1.36 at bilbo;
 Tue, 22 Oct 2019 19:04:54 AEDT
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 46y5df3ZsHzDqGh
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 19:04:53 +1100 (AEDT)
Received: from EXCHAPP03.whq.wistron (unverified [10.37.38.26]) by 
 TWNHUMSW5.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdb009abd33c0a816731a94@TWNHUMSW5.wistron.com> for 
 <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 15:59:38 +0800
Received: from EXCHAPP01.whq.wistron (10.37.38.24) by EXCHAPP03.whq.wistron 
 (10.37.38.26) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Tue, 22 Oct 2019 15:59:36 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.37.38.70) by 
 mail.wistron.com (10.37.38.24) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 
 15.1.1713.5 via Frontend Transport; Tue, 22 Oct 2019 15:59:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none; 
 b=fGDlh67eG1fdKWY2NAn5KG/l06C4yPcQmsx94Z33GloBbSMdrzlpiXbqINk5GUIfXcG0dapMcfs+uGBMe1S+L30wxhIUGwNAvf7l/eOveZpunDT97t2QffQKoRTIxAIbiuO0eLPDAHwUVOn0XnypqfQBNkkKb4sNYqqdpm4h7jEevybH0GOekesJvXEmZgpgqegHSVt0Zv6UBWQ2qEqukiVRg8p400Nh6wG3+6FnHFM9mixbHRf3GvYKgt8ekbFM8oH5jvPbcDKdqC0v/cuK3Jbj5Yz0rIkjSA1qKRKWWApTsKpUhOhQbhSF/1qzhPmYxJrBRd4Y4i45L3tRI5z2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0gUsHcMJbggeZstV7hnAGtCAoHDVBS8//gxvsPgI64=; 
 b=lb9uflhPOCNq9ku47Ebe9kopIBm/C9ClUsQ67+noc9VFgwxSsUuCh+rh7K5wK3qxM0sDEAo6SsSkq0Dfjb4Fhun52Ml3gxDlOQIrCn4MWc4NsyhqMpNdYr5ePv9eqvcfLW+sUyIxe/+S8RTFVk+9xnPrOBKlm9NWMjXe5WULzZ3AEk52OshN4MzqMBW5J0nRe22DaovZSYDz/dllWFygerMIc2vbZ4nTD3wG1Ua59pN/KoknKWvxKa3ihoE2YTQqVwOtd77xhp7KIhh2zAT5BAPS9sEeSFwfBfm4VE9UNnkZn+kJqdERuEpECkAi2LhgWV9Zkd0FrI+fziS3pwLmTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass 
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none 
 header.from=wiwynn.com; dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0gUsHcMJbggeZstV7hnAGtCAoHDVBS8//gxvsPgI64=; 
 b=m8REHgCD4/kWmQl8Z/UBHRkbrzgHuvdWo6wDEgfNDE8whOfJKUatG9/D9ZZbqPSLaICbQzBdgX0BrN3myXDQn2qsHy4XHqyekgJXewwosnlN1vU/UwuPRqbVIs4vwGrfnyyYNl5VbWWuXRfPg+g2tIz3nt7XjlteQXyQ0YlWUtM=
Received: from HK0PR02MB2578.apcprd02.prod.outlook.com (52.133.210.18) by 
 HK0PR02MB2898.apcprd02.prod.outlook.com (20.177.27.80) with Microsoft 
 SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 
 15.20.2347.16; Tue, 22 Oct 2019 07:59:31 +0000
Received: from HK0PR02MB2578.apcprd02.prod.outlook.com 
 ([fe80::fc93:3479:c38c:473d]) by 
 HK0PR02MB2578.apcprd02.prod.outlook.com 
 ([fe80::fc93:3479:c38c:473d%6]) with mapi id 15.20.2347.029; Tue, 22 
 Oct 2019 07:59:31 +0000
From: Frederick Lee/WYHQ/Wiwynn <Frederick_Lee@wiwynn.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-host-ipmid][chassishandler.cpp] IPMI Set Power Cycle
 Interval CMD
Thread-Topic: [phosphor-host-ipmid][chassishandler.cpp] IPMI Set Power Cycle 
 Interval CMD
Thread-Index: AdWIqqvf2cpvTRIoQKiaBpPmOY7Myg==
Date: Tue, 22 Oct 2019 07:59:31 +0000
Message-ID: <HK0PR02MB2578EDF90996A2181475BAE0F5680@HK0PR02MB2578.apcprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) 
 smtp.mailfrom=Frederick_Lee@wiwynn.com; 
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1103cc57-067d-4703-e6ed-08d756c5c557
x-ms-traffictypediagnostic: HK0PR02MB2898:
x-microsoft-antispam-prvs: <HK0PR02MB289836850EB01A6F5064E452F5680@HK0PR02MB2898.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(189003)(199004)(4744005)(2351001)(486006)(25786009)(476003)(6436002)(2906002)(6916009)(54896002)(9686003)(6306002)(80792005)(316002)(2501003)(256004)(33656002)(8936002)(478600001)(81156014)(81166006)(1730700003)(6116002)(8676002)(7736002)(5660300002)(26005)(66446008)(66556008)(64756008)(6506007)(790700001)(3846002)(186003)(71200400001)(71190400001)(55016002)(66066001)(86362001)(5640700003)(74316002)(66946007)(66476007)(99286004)(7696005)(102836004)(52536014)(76116006)(14454004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT;SFP:1102;SCL:1;SRVR:HK0PR02MB2898;
 H:HK0PR02MB2578.apcprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;
 PTR:InfoNoRecords;MX:1;A:1;
received-spf: None 
 (protection.outlook.com: wiwynn.com does not designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NpQicRXbf3YXqle3DHX2iMyVdLUoyPz5JqU5MW9TvT2wy2Sq+6oeNCoJDT8FoY3L21fNzZUhGJhF4qepm3n3P05PWw1PTs6EihJupl2GbcuWEhcNvLz5ggf02FtrxyZQTGMzmJCCyXFx5cmqmqiEwJHXSDEnsjFpwUjExdQLjz3Bzj45FU7WyPUJ6y/ytsN88NVr/NuwJuxwvGBhQ5YWw1O6HUfBUP7xJAIn079KjcgnVA2+lt0Tr5MsEBs/JlN6y5hTqLuRaMI6YLml6HCkHf03PToj/NGrsHcqDaeDsNdaCXrxBmAd/qg6JHI/e8kuZmV/S63MBB5FM/I0o8SnXh2q2CAeq2t8phiYxsD4lQLMRrl3BvdW2E5oplXUO6HLKBXfTjB7Gd7QJdFM4GI3dWO5FORPys4yYTitcYZate46M36Setg7mjLW93MPZhFm
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative; 
 boundary="_000_HK0PR02MB2578EDF90996A2181475BAE0F5680HK0PR02MB2578apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1103cc57-067d-4703-e6ed-08d756c5c557
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 07:59:31.3843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+BDJo3E1OPckAIDSnfOvXs7oMYwE96WXUA6+MiXcGmMbm/RRXXHIp5Rsp+4NNvl2L9ZegiuMrF3xIycj9VsMRLlEpNQIbiS7/S8iYrhmhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2898
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: C43AC8D521393A34BF836C88FA23477212772A221242A323EF0876B7CD38C4772000:8
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

--_000_HK0PR02MB2578EDF90996A2181475BAE0F5680HK0PR02MB2578apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,
We would like to contribute our "IPMI Set Power Cycle Internal" command imp=
lementation to the phosphor-host-ipmid package.
The current command behavior is to modify the configuration file, reboot.co=
nf, when receiving a new interval setting from a user.
Is this command behavior acceptable to be committed?

Thank you,

Sincerely,
Frederick Lee

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

--_000_HK0PR02MB2578EDF90996A2181475BAE0F5680HK0PR02MB2578apcp_
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
	panose-1:2 2 5 0 0 0 0 0 0 0;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We would like to contribute our=
 &#8220;IPMI Set Power Cycle Internal&#8221; command implementation to the =
phosphor-host-ipmid package.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The current command behavior is=
 to modify the configuration file, reboot.conf, when receiving a new interv=
al setting from a user.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is this command behavior accept=
able to be committed?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Sincerely,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Frederick Lee<o:p></o:p></span>=
</p>
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

--_000_HK0PR02MB2578EDF90996A2181475BAE0F5680HK0PR02MB2578apcp_--
