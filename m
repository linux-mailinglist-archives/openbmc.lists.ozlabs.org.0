Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A855C9AB38
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 11:19:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FG754N3pzDrR2
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 19:19:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.5; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pyang4@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FG6M1TsFzDrDY
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 19:18:30 +1000 (AEST)
Received: from [67.219.250.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.us-west-2.aws.symcld.net id EB/B4-18627-36FAF5D5;
 Fri, 23 Aug 2019 09:18:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRWlGSWpSXmKPExsWS8eIhj27y+vh
 Yg6YH7BanWl6wODB6nJ+xkDGAMYo1My8pvyKBNaPr4yfmguNqFUf/vWBqYOxT7mLk4hASmM8k
 sebMYRYI5zWjxPINs9khnH2MEp8e7mLsYuTkYBNQkZizdAcLiC0iYCmx5EE7G4gtLKAoceDEW
 3aIuJrE7i//oGr0JM7OXwhWwyKgKvHkZBPYHF6g3pPNG5lAbEYBMYnvp9aA2cwC4hLnLraCzZ
 EQEJBYsuc8M4QtKvHy8T9WCFtBonnPa6D5HED1CRJTJ4dBjBSUODnzCcsERsFZSCbNQqiahaQ
 KokRHYsHuT2wQtrbEsoWvmWHsMwceMyGLL2BkX8VonlSUmZ5RkpuYmaNraGCga2hopGtobKBr
 aaqXWKWbqFdarFueWlyia6SXWF6sV1yZm5yTopeXWrKJERg1KQVN8TsYz856o3eIUZKDSUmUN
 6IzPlaILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO+TtUA5waLU9NSKtMwcYATDpCU4eJREeC+ApH
 mLCxJzizPTIVKnGO05Jrycu4iZ4+DReUDy46olQPI7iBRiycvPS5US5324DqhNAKQtozQPbig
 s4VxilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMz7BWQ5T2ZeCdzuV0BnMQGdVbkjFuSskkSE
 lFQDU9+Kvc5Nx+7U+qSX//WyOXr2sPuUMw48CnoirXr5jrtfnat7rPrfRfvop8rbK78enXa3V
 GkKl/+tgL7qhkTBvTfYmrMzn5VJv3vm98X35s+8Rq2PqzcnuO5ifS1+PmzplBtpXM9V2aoOyO
 Up2x2yS5BuWmtY7qz85dK7umoXtnZHr4UTpin+LuKzXpSsvZe1IXyeco/H8ss/d36fFr34fbL
 xL1ZfqZ9nGx6t/TWD7SDnOtZVK9uM1vV5bP/x5aDMRhbNjW6Nj4NsWub1Mdh9f3oy5lPmc8N9
 TS+zE/bIrXZTb/l9Pnf+yYUrv2V5Tjt5Xmw6p8h0dr0jn8/ttZpWOW9vesLd9cUH4lc4T3qjJ
 6fEUpyRaKjFXFScCADRn9CrswMAAA==
X-Env-Sender: pyang4@lenovo.com
X-Msg-Ref: server-12.tower-326.messagelabs.com!1566551905!86925!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27290 invoked from network); 23 Aug 2019 09:18:26 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-12.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2019 09:18:26 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 607EFDD2A3DA0E4C8134
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 05:18:25 -0400 (EDT)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Fri, 23 Aug 2019 17:18:11 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Fri, 23 Aug 2019 17:18:24 +0800
From: Payne Yang <pyang4@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question for ACPI status
Thread-Topic: Question for ACPI status
Thread-Index: AdVZk6691UFjhEL7Rh2cXX3NMUPdOA==
Date: Fri, 23 Aug 2019 09:18:24 +0000
Message-ID: <a05edc724bdb4a10a5860c88ceef10c1@lenovo.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_a05edc724bdb4a10a5860c88ceef10c1lenovocom_"
MIME-Version: 1.0
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

--_000_a05edc724bdb4a10a5860c88ceef10c1lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Is there any ACPI service to update the ACPI state ?
I could find that the property of ACPI state is defined in dbus, and the ip=
mi command is also done in package "phosphor-host-ipmid".
https://github.com/openbmc/phosphor-host-ipmid/blob/b90a53280c74e8c65e8dc58=
c8964d93a08cfd65e/apphandler.cpp#L202

However, I could not find other services to update the property "ACPIPowerS=
tate".
https://github.com/search?q=3Dorg%3Aopenbmc+ACPIPowerState&type=3DCode

Do I miss something ?
If yes, please help to share your comment or suggestion:)
If no, it seems to me that I have to write a service as ACPI state monitor.

Best Regards,
Payne


--_000_a05edc724bdb4a10a5860c88ceef10c1lenovocom_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there any ACPI service to up=
date the ACPI state ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I could find that the property =
of ACPI state is defined in dbus, and the ipmi command is also done in pack=
age &#8220;phosphor-host-ipmid&#8221;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/phosphor-host-ipmid/blob/b90a53280c74e8c65e8dc58c8964d93a08cfd65e/ap=
phandler.cpp#L202">https://github.com/openbmc/phosphor-host-ipmid/blob/b90a=
53280c74e8c65e8dc58c8964d93a08cfd65e/apphandler.cpp#L202</a><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">However, I could not find other=
 services to update the property &#8220;ACPIPowerState&#8221;.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/s=
earch?q=3Dorg%3Aopenbmc&#43;ACPIPowerState&amp;type=3DCode">https://github.=
com/search?q=3Dorg%3Aopenbmc&#43;ACPIPowerState&amp;type=3DCode</a><o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Do I miss something ?<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If yes, please help to share yo=
ur comment or suggestion</span><span lang=3D"EN-US" style=3D"font-family:Wi=
ngdings">J</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If no, it seems to me that I ha=
ve to write a service as ACPI state monitor.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Payne<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_a05edc724bdb4a10a5860c88ceef10c1lenovocom_--
