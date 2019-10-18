Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA090DC1FA
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 11:59:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vhN04rmfzDrTC
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 20:59:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.4;
 helo=mail1.bemta24.messagelabs.com; envelope-from=rli11@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vhMM0zjnzDrQh
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 20:59:09 +1100 (AEDT)
Received: from [67.219.250.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.us-west-2.aws.symcld.net id 09/FB-25735-BEC89AD5;
 Fri, 18 Oct 2019 09:59:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRWlGSWpSXmKPExsWS8eIhr+6rnpW
 xBn8O6FqcannB4sDocX7GQsYAxijWzLyk/IoE1ozl308wFryUrnj3pY2lgXGBZBcjF4eQwHwm
 iSffHrNCOK8ZJT4tncEC4exjlNi57wWQw8nBJqAk0fJqBTuILSJgKbHkQTsbiC0sYCqx8OV2Z
 oi4lcTnuWegbD2JV29+gtWzCKhKdH38yQpi8wL1/vzwGMxmFJCVeLLgGROIzSwgLnHuYitYvY
 SAgMSSPeeZIWxRiZeP/7FC2AoSzXtes0DUJ0jsfPcLaqagxMmZT1gmMArOQjJqFpKyWUjKIOI
 6Egt2f2KDsLUlli18zQxjnznwmAlZfAEj+ypG86SizPSMktzEzBxdQwMDXUNDI11DIwtdQzO9
 xCrdRL3SYt3y1OISXSO9xPJiveLK3OScFL281JJNjMDISSloENjBuGfWG71DjJIcTEqivKaWK
 2OF+JLyUyozEosz4otKc1KLDzHKcHAoSfDO6QTKCRalpqdWpGXmAKMYJi3BwaMkwruoCyjNW1
 yQmFucmQ6ROsVozzHh5dxFzBwHj84Dkh9XLQGS30GkEEtefl6qlDjv3m6gNgGQtozSPLihsKR
 ziVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw71GQKTyZeSVwu18BncUEdNZ75eUgZ5UkIqSk
 Gpgsa5/F7XD9IzTh66aup4llCtInPq4NDJfgdk3xZDvAHpp6o1+9duGEt0vSRE7M0mJffCq+a
 5utnf5FPTWdI61NKo8ud+/L+O6eOPfBG7Z3nl/nzLu55sr17QckXR7kFtUoRx584nFm9yKZa+
 +dLNMmuaaafwoXePfuMd/CRTbdF5Tyks76OQvcUX2RHPixVfd1fUtfTP82fYXnnbv3ffO7eqa
 Ffe/7hf3TzZ4ZPRad2GJzd22n67ywvgiBD4tZIlJ9vTcuXv7rWv7iwo3Oux5MtJo/M+DgowkL
 3NzFvq2eesJrVsvsRWGzz1lMDdbK3qf83WvBpstPn3LHa0YdPTdP7ZLqlskr1z3/dCvjgLK2m
 hJLcUaioRZzUXEiAKFCl/61AwAA
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-9.tower-326.messagelabs.com!1571392745!106062!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1579 invoked from network); 18 Oct 2019 09:59:06 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-9.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Oct 2019 09:59:06 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id B91F5994C7640738ADAE
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 05:59:04 -0400 (EDT)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Fri, 18 Oct 2019 17:59:04 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Fri, 18 Oct 2019 17:59:04 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Power-on monitor for phosphor-hwmon question
Thread-Topic: Power-on monitor for phosphor-hwmon question
Thread-Index: AdWFmneCVr4/n3pvSRGIHQDzMHL2Ig==
Date: Fri, 18 Oct 2019 09:59:03 +0000
Message-ID: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_c353f372a5ce45fdbe1172678d8c029dlenovocom_"
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

--_000_c353f372a5ce45fdbe1172678d8c029dlenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

We found that there's no power-on monitor mechanism in phosphor-hwmon.
https://github.com/openbmc/phosphor-hwmon

And it will cause incorrect threshold logs to be added to journal log by 's=
el-logger' when system is in power off(S5) state.
Is there any plan to implement it? Or other repository we can refer to ?

Thanks,
Ivan

--_000_c353f372a5ce45fdbe1172678d8c029dlenovocom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">We found that there&#8217;s no =
power-on monitor mechanism in phosphor-hwmon.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/phosphor-hwmon">https://github.com/openbmc/phosphor-hwmon</a><o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And it will cause incorrect thr=
eshold logs to be added to journal log by &#8216;sel-logger&#8217; when sys=
tem is in power off(S5) state. &nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there any plan to implement =
it? Or other repository we can refer to ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ivan<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_c353f372a5ce45fdbe1172678d8c029dlenovocom_--
