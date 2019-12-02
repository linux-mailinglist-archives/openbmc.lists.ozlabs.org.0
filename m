Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0247210E9CB
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 12:50:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RNj55gMGzDqRB
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 22:50:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.116;
 helo=mail1.bemta24.messagelabs.com; envelope-from=liuyh21@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RNh06j5RzDqDX
 for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2019 22:49:33 +1100 (AEDT)
Received: from [67.219.250.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.us-west-2.aws.symcld.net id 3B/5A-19893-A4AF4ED5;
 Mon, 02 Dec 2019 11:49:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRWlGSWpSXmKPExsWS8eIhr67nrye
 xBt//mFqcannB4sDocX7GQsYAxijWzLyk/IoE1oxl73tYCo5KVjRt62RrYOwV72Lk4hASmMck
 8X/JNFYI5wWjxOqeLUwQzm5GiSsH2xm7GDk42AS0JabvT+1i5OQQEbCUWPKgnQ3EFhZQlpjY9
 ZsRIq4h8eDMVWaQchEBPYlL+7hBwiwCKhIHXn4CK+cFap138wsTiM0oICsx7dF9MJtZQFxi7r
 RZrCC2hICAxJI955khbFGJl4//QcUVJNrbH7NA1CdIPP2/iwVipqDEyZlPWCYwCs5CMmoWkrJ
 ZSMog4joSC3Z/YoOwtSWWLXzNDGOfOfCYCVl8ASP7KkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNj
 U11DExO9xCrdJL3SYt3y1OISXSO9xPJiveLK3OScFL281JJNjMC4SSlon7CDcc6nt3qHGCU5m
 JREef9+fhIrxJeUn1KZkVicEV9UmpNafIhRhoNDSYL32w+gnGBRanpqRVpmDjCGYdISHDxKIr
 x6IGne4oLE3OLMdIjUKUZ7jgkv5y5i5jh4dB6Q/LhqCZD8DiKFWPLy81KlxHlzQdoEQNoySvP
 ghsJSziVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz8IFN4MvNK4Ha/AjqLCegs85ZHIGeV
 JCKkpBqYku1612ximc0T6nNbxfOJGvuv34tXiAr7MZqod68rcGJXEQxo1NnH8S88sv7/ZP+tZ
 9t/1LF+eiCf4vriz9m2QEXTh/Z/OO5Nnvxp98PKM72XWVdbzer/b7F+6p/oyRui+Fe3/ez5KH
 c688KeFQk+Tp7/k0piXoeeC7jy7pq2/B/DQxovzGX8p752+aUr2FXI6H9YTvudbISZeOP7+4u
 Wn5hxL5NF5WO/5xf7ooc8R27UPFl1IeW3v/63Ln+OP5tez7sgIPo29Gwfuynj00WloRNWrpnh
 slbWpkfulqDi2/deOy90L5p8hPNtlUzrmyf70iLyQz6fDAxivVN3daNx9sMz67d9cJ5dwL/tq
 1vuRiWW4oxEQy3mouJEAB6AgAa0AwAA
X-Env-Sender: liuyh21@lenovo.com
X-Msg-Ref: server-17.tower-355.messagelabs.com!1575287368!293332!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6899 invoked from network); 2 Dec 2019 11:49:29 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-17.tower-355.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Dec 2019 11:49:29 -0000
Received: from pekwpmail05.lenovo.com (unknown [10.96.93.83])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 1B71C479D6CB735DFCA5
 for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2019 06:49:27 -0500 (EST)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail05.lenovo.com
 (10.96.93.83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 2 Dec
 2019 19:49:22 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Mon, 2 Dec 2019 19:49:22 +0800
From: Yonghui YH21 Liu <liuyh21@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: IPMI Show DIMM SPD Feature
Thread-Topic: IPMI Show DIMM SPD Feature
Thread-Index: AdWpBkxzuPi2DxqTQ+W+e4RaAyzu3Q==
Date: Mon, 2 Dec 2019 11:49:22 +0000
Message-ID: <75aac0e9cbd54214971ae9bed0e817ca@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.250]
Content-Type: multipart/alternative;
 boundary="_000_75aac0e9cbd54214971ae9bed0e817calenovocom_"
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

--_000_75aac0e9cbd54214971ae9bed0e817calenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,
       Could you help double confirm whether BMC can show DIMM SPD informat=
ion by IPMI interface in current openBMC design?
       If yes, could you help provide some guidance on implementing the fea=
ture.


       Thank your great support.



--_000_75aac0e9cbd54214971ae9bed0e817calenovocom_
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
	{font-family:\7B49\7EBF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@\7B49\7EBF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:\7B49\7EBF;}
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
	font-family:\7B49\7EBF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:\7B49\7EBF;}
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
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; Could you help double confirm whether BMC can show DIMM SPD informati=
on by IPMI interface in current openBMC design?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; If yes, could you help provide some guidance on implementing the feat=
ure.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; Thank your great support.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_75aac0e9cbd54214971ae9bed0e817calenovocom_--
