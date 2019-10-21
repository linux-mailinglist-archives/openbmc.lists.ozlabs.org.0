Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B614DEA57
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 13:03:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xYdd4PjmzDqsR
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 22:03:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.2;
 helo=mail1.bemta24.messagelabs.com; envelope-from=rli11@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xYcn63L3zDqWx
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 22:02:15 +1100 (AEDT)
Received: from [67.219.251.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-c.us-west-2.aws.symcld.net id C2/52-04713-3309DAD5;
 Mon, 21 Oct 2019 11:02:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRWlGSWpSXmKPExsWSLveKTdd4wtp
 Yg4YN8hanWl6wODB6nJ+xkDGAMYo1My8pvyKBNWPes6eMBRe0KrZM+8jawPhCrYuRk0NIYD6T
 xPr9Wl2MXED2a0aJxU2PWSCcfYwSzRe/sIFUsQkoSbS8WsEOYosIWEosedAOFOfgEBZwlbj1r
 Bgi7CZx7PEcFgjbSOLG3Pdg5SwCqhKnDx8Es3mBWl/eXM4EsdhSYvP03WDjOQWsJDofzmUGsR
 kFZCWeLHgGVsMsIC5x7mIrWK+EgIDEkj3nmSFsUYmXj/+xQtgKEs17XrOAnMMskCDx4VscxCp
 BiZMzn7BMYBSehWTSLISqWUiqIEp0JBbs/sQGYWtLLFv4mhnGPnPgMROy+AJG9lWM5klFmekZ
 JbmJmTm6hgYGuoaGRrqGxma6RiZ6iVW6yXqlxbrlqcUlukZ6ieXFesWVuck5KXp5qSWbGIERl
 lLQIbGDccusN3qHGCU5mJREefP018QK8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuC917M2VkiwKD
 U9tSItMwcY7TBpCQ4eJRFerX6gNG9xQWJucWY6ROoUoz3HhJdzFzFzHDw6D0h+XLUESH4HkUI
 sefl5qVLivNP7gNoEQNoySvPghsKS0yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzfQabw
 ZOaVwO1+BXQWE9BZqyVXg5xVkoiQkmpgKlSIf7Zn3sqAuJmPZU8x/0xJ6yn/L77yYhnDemv2v
 YyHHr44N20Jh25HeldxzdxzTX9FPYqDzZjiIlfLRazx+1nG1cMhqlg1p3NR3syspROvM1hvY1
 1ad7ZZSrlL8ivbgu2JwYeaBa//y5wjGcExxUA4XND/3Z3ES4+f3LOfMtH3TPi1Jw/6fZY8O3y
 zduHmoLeTdRetLFe0exc2oXjxq9jJTrnWWybXTZ+6ZHn5Ab22dEbPHx7mbwL/b/gcZnfxa/O+
 TR66HZ9Lanr6Nl5pWHbY+c4rUcMPSqdWn3IP0PwRN8c+5n6ta+uLxr9SbAs9bjV8/8y+7F0iz
 5Ep4vUqV4TF5mp0r572O8A6NdnDUomlOCPRUIu5qDgRAOr+8BHJAwAA
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-13.tower-366.messagelabs.com!1571655728!40979!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29037 invoked from network); 21 Oct 2019 11:02:11 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.6)
 by server-13.tower-366.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2019 11:02:11 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 253704289DB067C9EE87
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 19:02:08 +0800 (CST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Mon, 21 Oct 2019 19:02:07 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Mon, 21 Oct 2019 19:02:07 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [External]  Power-on monitor for phosphor-hwmon question
Thread-Topic: [External]  Power-on monitor for phosphor-hwmon question
Thread-Index: AdWFmneCVr4/n3pvSRGIHQDzMHL2IgCY86tQ
Date: Mon, 21 Oct 2019 11:02:07 +0000
Message-ID: <82798e33e5a34f81ac30553c099ad964@lenovo.com>
References: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
In-Reply-To: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_82798e33e5a34f81ac30553c099ad964lenovocom_"
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

--_000_82798e33e5a34f81ac30553c099ad964lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Does anyone have suggestion for this ?

Thanks your great support in advance.
From: openbmc <openbmc-bounces+rli11=3Dlenovo.com@lists.ozlabs.org> On Beha=
lf Of Ivan Li11
Sent: Friday, October 18, 2019 5:59 PM
To: openbmc@lists.ozlabs.org
Subject: [External] Power-on monitor for phosphor-hwmon question

Hi Team,

We found that there's no power-on monitor mechanism in phosphor-hwmon.
https://github.com/openbmc/phosphor-hwmon

And it will cause incorrect threshold logs to be added to journal log by 's=
el-logger' when system is in power off(S5) state.
Is there any plan to implement it? Or other repository we can refer to ?

Thanks,
Ivan

--_000_82798e33e5a34f81ac30553c099ad964lenovocom_
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Hi Team=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Does an=
yone have suggestion for this ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Thanks =
your great support in advance.<o:p></o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt">F=
rom:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt"> openbmc &lt=
;openbmc-bounces&#43;rli11=3Dlenovo.com@lists.ozlabs.org&gt;
<b>On Behalf Of </b>Ivan Li11<br>
<b>Sent:</b> Friday, October 18, 2019 5:59 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> [External] Power-on monitor for phosphor-hwmon question<o:p=
></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
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
</div>
</body>
</html>

--_000_82798e33e5a34f81ac30553c099ad964lenovocom_--
