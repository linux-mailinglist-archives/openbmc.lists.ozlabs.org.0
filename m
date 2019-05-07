Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A77163AE
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 14:26:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yzNM3yYRzDqLT
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 22:25:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.9; helo=cpsmtpb-ews06.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="f+LH5kCD"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews06.kpnxchange.com (cpsmtpb-ews06.kpnxchange.com
 [213.75.39.9])
 by lists.ozlabs.org (Postfix) with ESMTP id 44yzM65p5CzDqK3
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 22:24:47 +1000 (AEST)
Received: from cpsps-ews29.kpnxchange.com ([10.94.84.195]) by
 cpsmtpb-ews06.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Tue, 7 May 2019 14:24:42 +0200
X-Brand: /q/rzKX13g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=SN2Tq9nH c=1 sm=1 tr=0 cx=a_idp_e
 a=LO2mTXPAMClkaqVt2RTykg==:117 a=LO2mTXPAMClkaqVt2RTykg==:17
 a=eIHzyqS2sMcA:10 a=xqWC_Br6kY4A:10 a=E5NmQfObTbMA:10
 a=WQQ1efN1-x6dC5QYpDIA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8
 a=SSmOFEACAAAA:8 a=uTBLelbZc-ZO8c2HyK4A:9 a=BLnm9k7ePO4l2yGO:21
 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.12]) by cpsps-ews29.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 7 May 2019 14:24:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=rupydZPjfBXskClmr0AW8yFjcIlh3353+HN9qhQXnbc=;
 b=f+LH5kCDRGrhadKOJCc1Ucz/V9L1Kr6Cxasw4W1rh/FnPV3XzBiCSVofze1pHYLA7XMsQCjAgcHrF
 jbG612PEOOFnd2OdOnoP1FXE03O4bqNRtOOFXPBIAQG2x+YlK+RiXUwZ/vtYFl/XPi70Y+SaP+edJl
 VFUdkwB9imw/7kZI=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id 172b2e80-70c3-11e9-96e0-00505699772e;
 Tue, 07 May 2019 14:24:42 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 7 May
 2019 14:24:23 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Tue, 7 May 2019 14:24:23 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: webui: setting Boot.Mode and Boot.Source
Thread-Topic: webui: setting Boot.Mode and Boot.Source
Thread-Index: AdUEz6XJwfxYM0oWRg6HrRwE1eqMiw==
Date: Tue, 7 May 2019 12:24:22 +0000
Message-ID: <a345e6df8a574eb394eab94e70474cd8@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: multipart/alternative;
 boundary="_000_a345e6df8a574eb394eab94e70474cd8Eltsrv03Eltanlocal_"
MIME-Version: 1.0
X-OriginalArrivalTime: 07 May 2019 12:24:42.0562 (UTC)
 FILETIME=[D92CA220:01D504CF]
X-RcptDomain: lists.ozlabs.org
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

--_000_a345e6df8a574eb394eab94e70474cd8Eltsrv03Eltanlocal_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Currently the webui doesn't contain the functionality to change the boot mo=
de and boot source. Are there any plans to add this to the interface?

Best Regards,
Wim Vervoorn


--_000_a345e6df8a574eb394eab94e70474cd8Eltsrv03Eltanlocal_
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
	{margin:0cm;
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
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
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Currently the webui doesn&#8217;t contain the functi=
onality to change the boot mode and boot source. Are there any plans to add=
 this to the interface?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"NL" style=3D"font-size:10.0pt;font-family:&quot;Aria=
l&quot;,sans-serif">Best Regards,</span><span lang=3D"NL" style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10.0pt;font-fam=
ily:&quot;Arial&quot;,sans-serif">Wim Vervoorn<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10.0pt;font-fam=
ily:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_a345e6df8a574eb394eab94e70474cd8Eltsrv03Eltanlocal_--
