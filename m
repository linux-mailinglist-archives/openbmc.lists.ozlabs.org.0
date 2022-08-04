Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4460E58A466
	for <lists+openbmc@lfdr.de>; Fri,  5 Aug 2022 03:13:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzSKT1S5sz2xH2
	for <lists+openbmc@lfdr.de>; Fri,  5 Aug 2022 11:13:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pavotek.com.tr header.i=@pavotek.com.tr header.a=rsa-sha256 header.s=mail1 header.b=QpKsKv8m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pavotek.com.tr (client-ip=213.74.56.236; helo=pavotekmailgw.pavotek.com.tr; envelope-from=oguzhan.caglar@pavotek.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pavotek.com.tr header.i=@pavotek.com.tr header.a=rsa-sha256 header.s=mail1 header.b=QpKsKv8m;
	dkim-atps=neutral
X-Greylist: delayed 944 seconds by postgrey-1.36 at boromir; Thu, 04 Aug 2022 18:23:04 AEST
Received: from pavotekmailgw.pavotek.com.tr (mail1.pavotek.com.tr [213.74.56.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lz1vD3h5Vz2xjw
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 18:23:03 +1000 (AEST)
Received: from Exchange2016.pavotek.com.tr (unknown [192.168.66.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by Forcepoint Email with ESMTPS id B55FEEB20CCB837F15AD
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 11:07:11 +0300 (+03)
Content-Language: tr-TR
Content-Type: multipart/alternative;
	boundary="_000_6fbe1a4cf05a483b86986e1cdf5f53aapavotekcomtr_"
DKIM-Signature: v=1; a=rsa-sha256; d=pavotek.com.tr; s=mail1;
	c=relaxed/relaxed; t=1659600431; h=from:subject:to:date:message-id;
	bh=iwV/s0jav4Am59HmT/4QfB3FgmTzpHX5PEkuVGYgnw8=;
	b=QpKsKv8m3avB94Q0yKTJ+gBWITwURjN+ZanZNnACqTf9pkleI206PShPwZtotA7eKNFvalic9w+
	ssogt62j9f3UbX2Y+C1yS6F4dUwkSM5bH0/MonTLQoPZBnFIwAz4ATh1dF8ohqWPXykjbhfz27xHK
	O/By0V1vtdIxEy/4/1iNrfFw+mV6kLasWSq4V9oeIQO6OsCjZIgf4F/TN9vS7I/AymnjPzwf6Bzpb
	XofcCY2vRVUJTIbzmziH5D+WgHNZR15elMQNdJop2TKoYTF2ldntmX2HmRUr2oFcz5MtnjSv3Fp8B
	W/AVCvhBPAq2bP9w5DpdQlLOXhvtGQp4ZWeA==
Received: from Exchange2016.pavotek.com.tr (192.168.66.180) by
 Exchange2016.pavotek.com.tr (192.168.66.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2507.6; Thu, 4 Aug 2022 11:07:11 +0300
Received: from Exchange2016.pavotek.com.tr ([::1]) by
 Exchange2016.pavotek.com.tr ([::1]) with mapi id 15.01.2507.006; Thu, 4 Aug
 2022 11:07:11 +0300
From: =?iso-8859-9?Q?O=F0uzhan_=C7A=D0LAR?= <oguzhan.caglar@pavotek.com.tr>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Adding Inventory
Thread-Topic: Adding Inventory
Thread-Index: AQHYp9i2xlvHHPf9DkStj7/J201olQ==
Date: Thu, 4 Aug 2022 08:07:11 +0000
Message-ID: <6fbe1a4cf05a483b86986e1cdf5f53aa@pavotek.com.tr>
Accept-Language: tr-TR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.61.1.176]
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Aug 2022 11:13:04 +1000
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

--_000_6fbe1a4cf05a483b86986e1cdf5f53aapavotekcomtr_
Content-Type: text/plain; charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable

Hello,


I'm working on openbmc for ast2500 bmc. I want to add inventory such as CPU=
 and DIMM etc. I added the chassis from .json file but I couldn't add the C=
PU and DIMM. I know this is to related with entity-manager. How can I add t=
hese inventory on WEBUI? Can you give some information about this issue?


Regards.

O=F0uzhan =C7a=F0lar
Software Design Engineer



[X]





[X]

Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.
Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL


       [X] <http://pavotek.com.tr/>

Tel             : +90 (216) 354 72 86

Faks         : +90 (216) 354 76 77

Gsm          : +90 (507) 585 10 60

oguzhan.caglar@pavotek.com.tr<mailto:oguzhan.caglar@pavotek.com.tr>



www.pavotek.com.tr<http://www.pavotek.com.tr/>



--_000_6fbe1a4cf05a483b86986e1cdf5f53aapavotekcomtr_
Content-Type: text/html; charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
9">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Hello,</p>
<p><br>
</p>
<p>I'm working on openbmc for ast2500 bmc. I want to add inventory such as =
CPU and DIMM etc. I added the chassis from&nbsp;.json file but I couldn't a=
dd the CPU and DIMM. I know this is to related with entity-manager.&nbsp;Ho=
w can I add these inventory on WEBUI? Can
 you give some information about this issue?</p>
<p><br>
</p>
<p>Regards.</p>
<p><br>
</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<span id=3D"ms-rterangepaste-start"></span>
<table class=3D"MsoTableGrid" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"border-collapse:collapse; border:none">
<tbody>
<tr>
<td width=3D"549" colspan=3D"3" valign=3D"top" style=3D"width:453.1pt; padd=
ing:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<b><span lang=3D"TR" style=3D"font-size:9.0pt; font-family:&quot;Arial&quot=
;,sans-serif">O=F0uzhan =C7a=F0lar</span></b></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<span lang=3D"TR" style=3D"font-size:9.0pt; font-family:&quot;Arial&quot;,s=
ans-serif">Software Design Engineer</span><span lang=3D"TR"></span></p>
</td>
<td width=3D"0" style=3D"border:none">
<p class=3D"MsoNormal">&nbsp;</p>
</td>
</tr>
<tr>
<td width=3D"549" colspan=3D"3" valign=3D"top" style=3D"width:453.1pt; padd=
ing:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<img width=3D"535" height=3D"9" style=3D"user-select: none;" src=3D"file://=
/C:/Users/OGUZHA~1.CAG/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png=
"><span lang=3D"TR"></span></p>
</td>
<td width=3D"0" style=3D"border:none">
<p class=3D"MsoNormal">&nbsp;</p>
</td>
</tr>
<tr style=3D"height:25.05pt">
<td width=3D"170" valign=3D"top" style=3D"width:127.35pt; padding:0in 5.4pt=
 0in 5.4pt; height:25.05pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<b><span lang=3D"TR">&nbsp;</span></b></p>
</td>
<td width=3D"31" rowspan=3D"7" valign=3D"top" style=3D"width:14.15pt; paddi=
ng:0in 5.4pt 0in 5.4pt; height:25.05pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<img width=3D"17" height=3D"127" style=3D"user-select: none;" src=3D"file:/=
//C:/Users/OGUZHA~1.CAG/AppData/Local/Temp/msohtmlclip1/01/clip_image004.pn=
g"><span lang=3D"TR"></span></p>
</td>
<td width=3D"348" rowspan=3D"2" valign=3D"top" style=3D"width:311.6pt; padd=
ing:0in 5.4pt 0in 5.4pt; height:25.05pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<b><span lang=3D"TR" style=3D"font-size:9.0pt; font-family:&quot;Arial&quot=
;,sans-serif">Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.</span></b><b><=
span lang=3D"TR" style=3D"font-family:&quot;Arial&quot;,sans-serif"></span>=
</b></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<span lang=3D"TR" style=3D"font-size:8.0pt; font-family:&quot;Arial&quot;,s=
ans-serif">Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL</span><span la=
ng=3D"TR" style=3D"font-size:10.0pt; font-family:&quot;Arial&quot;,sans-ser=
if"></span></p>
</td>
<td width=3D"0" height=3D"50" style=3D"height:25.05pt; border:none"></td>
</tr>
<tr style=3D"height:13.45pt">
<td width=3D"170" rowspan=3D"5" valign=3D"top" style=3D"width:127.35pt; pad=
ding:0in 5.4pt 0in 5.4pt; height:13.45pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<b><span lang=3D"TR" style=3D"font-size:8.0pt">&nbsp;</span></b></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<b><span lang=3D"TR">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b><span =
lang=3D"TR"><a href=3D"http://pavotek.com.tr/" id=3D"LPNoLP"><b><span lang=
=3D"EN-US" style=3D"color:windowtext"><img border=3D"0" width=3D"131" heigh=
t=3D"23" style=3D"user-select: none;" src=3D"file:///C:/Users/OGUZHA~1.CAG/=
AppData/Local/Temp/msohtmlclip1/01/clip_image006.png"></span></b></a><b></b=
></span></p>
</td>
<td width=3D"0" height=3D"27" style=3D"height:13.45pt; border:none"></td>
</tr>
<tr style=3D"height:9.2pt">
<td width=3D"348" valign=3D"top" style=3D"width:311.6pt; padding:0in 5.4pt =
0in 5.4pt; height:9.2pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<span lang=3D"TR" style=3D"font-size:8.0pt; font-family:&quot;Arial&quot;,s=
ans-serif">Tel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; : &#43;90 (216) 354 72 86</span></p>
</td>
<td width=3D"0" height=3D"18" style=3D"height:9.2pt; border:none"></td>
</tr>
<tr style=3D"height:8.85pt">
<td width=3D"348" valign=3D"top" style=3D"width:311.6pt; padding:0in 5.4pt =
0in 5.4pt; height:8.85pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<span lang=3D"TR" style=3D"font-size:8.0pt; font-family:&quot;Arial&quot;,s=
ans-serif">Faks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &#43;90 (=
216) 354 76 77</span></p>
</td>
<td width=3D"0" height=3D"18" style=3D"height:8.85pt; border:none"></td>
</tr>
<tr style=3D"height:5.75pt">
<td width=3D"348" valign=3D"top" style=3D"width:311.6pt; padding:0in 5.4pt =
0in 5.4pt; height:5.75pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<span lang=3D"TR" style=3D"font-size:8.0pt; font-family:&quot;Arial&quot;,s=
ans-serif">Gsm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &#43=
;90 (507) 585 10 60
</span></p>
</td>
<td width=3D"0" height=3D"12" style=3D"height:5.75pt; border:none"></td>
</tr>
<tr style=3D"height:2.9pt">
<td width=3D"348" valign=3D"top" style=3D"width:311.6pt; padding:0in 5.4pt =
0in 5.4pt; height:2.9pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<span lang=3D"TR" style=3D"font-size:8.0pt; font-family:&quot;Arial&quot;,s=
ans-serif"><a href=3D"mailto:oguzhan.caglar@pavotek.com.tr" id=3D"LPNoLP">o=
guzhan.caglar@pavotek.com.tr</a><span style=3D"color:#0050DC"></span></span=
></p>
</td>
<td width=3D"0" height=3D"6" style=3D"height:2.9pt; border:none"></td>
</tr>
<tr style=3D"height:6.7pt">
<td width=3D"170" valign=3D"top" style=3D"width:127.35pt; padding:0in 5.4pt=
 0in 5.4pt; height:6.7pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<span lang=3D"TR">&nbsp;</span></p>
</td>
<td width=3D"348" valign=3D"top" style=3D"width:311.6pt; padding:0in 5.4pt =
0in 5.4pt; height:6.7pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt; l=
ine-height:normal">
<span lang=3D"TR"><a href=3D"http://www.pavotek.com.tr/" id=3D"LPNoLP"><spa=
n style=3D"font-size:8.0pt; font-family:&quot;Arial&quot;,sans-serif; color=
:#0050DC">www.pavotek.com.tr</span></a></span><span lang=3D"TR" style=3D"fo=
nt-size:8.0pt; font-family:&quot;Arial&quot;,sans-serif; color:#0050DC"></s=
pan></p>
</td>
<td width=3D"0" height=3D"13" style=3D"height:6.7pt; border:none"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span lang=3D"TR">&nbsp;</span></p>
<span id=3D"ms-rterangepaste-end"></span></div>
</div>
</div>
</body>
</html>

--_000_6fbe1a4cf05a483b86986e1cdf5f53aapavotekcomtr_--
