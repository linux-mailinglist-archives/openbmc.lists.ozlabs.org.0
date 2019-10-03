Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF328C9ACD
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 11:34:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kSX65ZYZzDqXD
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 19:34:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.212; helo=mail1.bemta23.messagelabs.com;
 envelope-from=pyang4@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kSWB1xTrzDqSx
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 19:33:56 +1000 (AEST)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-east-1.aws.symcld.net id 71/32-29175-180C59D5;
 Thu, 03 Oct 2019 09:33:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRWlGSWpSXmKPExsWS8eIhj27Dgam
 xBucumFucannB4sDocX7GQsYAxijWzLyk/IoE1oz2/duYC9ZKV0zue8jawNgs2cXIxSEkMJ9J
 4ubDU2wQzitGiVfLmxkhnL2MEqcfbQByODnYBFQk5izdwQJiiwhYSix50M4GYgsLSEss3POQD
 SKuIPGreTFQDQeQrSfRvZYJJMwC1Hp12iUwmxeo9UZTEyuIzSggJvH91BqwOLOAuMS5i63sIL
 aEgIDEkj3nmSFsUYmXj/+xQtgKEs17XrNA1CdINK/aywoxU1Di5MwnLBMYBWchGTULSdksJGU
 QcR2JBbs/sUHY2hLLFr5mhrHPHHjMhCy+gJF9FaNZUlFmekZJbmJmjq6hgYGuoaGRrqGuoZml
 XmKVbpJeabFuamJxia6hXmJ5sV5xZW5yTopeXmrJJkZg1KQUMK7cwfh35hu9Q4ySHExKoryH6
 6fGCvEl5adUZiQWZ8QXleakFh9ilOHgUJLg5d4BlBMsSk1PrUjLzAFGMExagoNHSYT3zj6gNG
 9xQWJucWY6ROoUoz3HhJdzFzFzHDw6D0h+XLUESH4HkUIsefl5qVLivCn7gdoEQNoySvPghsI
 SziVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz6IFN4MvNK4HYDkwvQRyK81lGTQc4qSURI
 STUwdW3rP1TSl/H0mZDvm+rkaXLcB6x39x9vrAkK/Sef+sj9PeNfvfQp56Qfqc8sFlFoXvZTR
 lp63c4Fjdlx5775yjE+iem+/oH923/r5Op5hyWE56uERGhdM1j5U8P7XVCa9i2n65vuh8t3ab
 9kCzsX4sTyyO9I29IilVeZvT8/hH+a93+91PpzO8Mv29yv0Dd7Yffu3IPPEgq/t95+ezxL/MK
 G/Zu3LlT2XqX75JBU3xZ2ca0ltyok1nWbs1akSvvoiX/685hDOiHjdoiKXNrDBI3UjzvcVXKY
 euQYV9zQSY2KUNsn5Jgsa9w8/du/Ry8WpK1IP7fH4vu/VG2lRTvE/D513tSZdPqVKff6eSXsS
 izFGYmGWsxFxYkAjBs6qbMDAAA=
X-Env-Sender: pyang4@lenovo.com
X-Msg-Ref: server-20.tower-386.messagelabs.com!1570095232!94759!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32260 invoked from network); 3 Oct 2019 09:33:52 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-20.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Oct 2019 09:33:52 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 4B5BFE0E5C75555B7186
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 05:33:52 -0400 (EDT)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Thu, 3 Oct 2019 17:33:24 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Thu, 3 Oct 2019 17:33:50 +0800
From: Payne Yang <pyang4@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: IPMI chassis reset
Thread-Topic: IPMI chassis reset
Thread-Index: AdV5zQG5r6khp/gwT+Ku2Pr++yCsSg==
Date: Thu, 3 Oct 2019 09:33:49 +0000
Message-ID: <340fe3daddb7493eb596d4516e92d0e7@lenovo.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_340fe3daddb7493eb596d4516e92d0e7lenovocom_"
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

--_000_340fe3daddb7493eb596d4516e92d0e7lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

The ipmi chassis hard reset have the same action with power cycle currently=
.
https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.c=
pp#L1155

Does OpenBMC support real hard reset to pull reset button in the future upd=
ate ?

Best Regards,
Payne


--_000_340fe3daddb7493eb596d4516e92d0e7lenovocom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The ipmi chassis hard reset hav=
e the same action with power cycle currently.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L1155">https://gi=
thub.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L1155</=
a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Does OpenBMC support real hard =
reset to pull reset button in the future update ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Payne<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_340fe3daddb7493eb596d4516e92d0e7lenovocom_--
