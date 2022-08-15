Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DEA594E17
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 03:49:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6DbG5CRyz3bZC
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 11:49:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pavotek.com.tr header.i=@pavotek.com.tr header.a=rsa-sha256 header.s=mail1 header.b=e77a6GH2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pavotek.com.tr (client-ip=213.74.56.236; helo=pavotekmailgw.pavotek.com.tr; envelope-from=oguzhan.caglar@pavotek.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pavotek.com.tr header.i=@pavotek.com.tr header.a=rsa-sha256 header.s=mail1 header.b=e77a6GH2;
	dkim-atps=neutral
Received: from pavotekmailgw.pavotek.com.tr (mail1.pavotek.com.tr [213.74.56.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5m653Q8cz2xGx
	for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2022 17:25:47 +1000 (AEST)
Received: from Exchange2016.pavotek.com.tr (unknown [192.168.66.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by Forcepoint Email with ESMTPS id 16A493B5184FB7E45901;
	Mon, 15 Aug 2022 10:25:38 +0300 (+03)
Content-Language: tr-TR
Content-Type: multipart/mixed;
	boundary="_004_b46a5098aabb470b8515c16aa1ef9f65pavotekcomtr_"
DKIM-Signature: v=1; a=rsa-sha256; d=pavotek.com.tr; s=mail1;
	c=relaxed/relaxed; t=1660548338; h=from:subject:to:date:message-id;
	bh=xiEpSph5NWmcirksMh91aYSuQkpRL92RRjEbVqDmh8E=;
	b=e77a6GH2r0ujaIqwWe961RE1xLiU+oQ1D3nVR4LZ5ngtBe4VGvId9FvlixON7y+JJjeBA4Dwv6y
	lTYF+Js6/m82Nn7PF1UiximN73ZYTtv+aK9TXYtTPIoRqiropUNTGoEHihk8Uz9J6ZRLfVTeasdHR
	5k8pPWkXIbYCZT6Jj9WUHyUPEVjB5QJhjtFwrjum5SVELVlO10d3lXwfGBuqbAzo8fKdlock3/ClR
	JAyv09CtB7wIPPmt74keYV/+CR3r6ccQf3EL2plZCjVxm2cOM0lwIMmERCjIoB63NwWEKuVN8pZRh
	q0DiY/AQmDKu99RiutjwSmp4gWu0lA74FPhQ==
Received: from Exchange2016.pavotek.com.tr (192.168.66.180) by
 Exchange2016.pavotek.com.tr (192.168.66.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2507.6; Mon, 15 Aug 2022 10:25:37 +0300
Received: from Exchange2016.pavotek.com.tr ([::1]) by
 Exchange2016.pavotek.com.tr ([::1]) with mapi id 15.01.2507.006; Mon, 15 Aug
 2022 10:25:37 +0300
From: =?iso-8859-3?Q?O=BBuzhan_=C7A=ABLAR?= <oguzhan.caglar@pavotek.com.tr>
To: Andrei Kartashev <a.kartashev@yadro.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: Ynt: Ynt: (External) Re: Adding Inventory
Thread-Topic: Ynt: (External) Re: Adding Inventory
Thread-Index: AQHYp9i2xlvHHPf9DkStj7/J201ola2p7wYAgADnrMyAAKbZAIAEHrnl
Date: Mon, 15 Aug 2022 07:25:37 +0000
Message-ID: <b46a5098aabb470b8515c16aa1ef9f65@pavotek.com.tr>
References: <6fbe1a4cf05a483b86986e1cdf5f53aa@pavotek.com.tr>
	,<794cf20fd781d5a28746800c05b41b866c099483.camel@yadro.com>
	 <dbe33b3b957344ae9efa8c56e4c6a554@pavotek.com.tr>,<e10b60146c5a120eb615be8a4513f9a9f9a91756.camel@yadro.com>
In-Reply-To: <e10b60146c5a120eb615be8a4513f9a9f9a91756.camel@yadro.com>
Accept-Language: tr-TR, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.61.1.176]
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Aug 2022 11:48:48 +1000
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

--_004_b46a5098aabb470b8515c16aa1ef9f65pavotekcomtr_
Content-Type: multipart/alternative;
	boundary="_000_b46a5098aabb470b8515c16aa1ef9f65pavotekcomtr_"

--_000_b46a5098aabb470b8515c16aa1ef9f65pavotekcomtr_
Content-Type: text/plain; charset="iso-8859-3"
Content-Transfer-Encoding: quoted-printable

I'm sharing with you that my yocto errors are related to smbios-mdr in the =
.txt file.


I don't understand, How can the CPU information match with entity-manager c=
onfiguration files? I saw your comment in openbmc list about PCIe. It probe=
s only with xyz.openbmc_project.FruDevice.



O=BBuzhan =C7a=BBlar

Software Design Engineer





[X]








[X]


Pavo Tasar=B9m =DCretim Elektronik Tic. A.=AA.

Teknopark =A9stanbul, Kurtk=F6y Pendik =A9STANBUL




       [X] <http://pavotek.com.tr/>


Tel             : +90 (216) 354 72 86


Faks         : +90 (216) 354 76 77


Gsm          : +90 (507) 585 10 60


oguzhan.caglar@pavotek.com.tr<mailto:oguzhan.caglar@pavotek.com.tr>





www.pavotek.com.tr<http://www.pavotek.com.tr/>




________________________________
G=F6nderen: Andrei Kartashev <a.kartashev@yadro.com>
G=F6nderildi: 12 A=BBustos 2022 Cuma 22:14:38
Kime: O=BBuzhan =C7A=ABLAR; openbmc@lists.ozlabs.org
Konu: Re: Ynt: (External) Re: Adding Inventory


Warning: This e-mail came from an external source. If you do not trust the =
sender or if there is anything suspicious in the content of the e-mail, ple=
ase inform the IT department.



I have no idea on what do you mean saying "added the CPU and DIMM
configuration files within the .yaml files", but I guess you are trying
to hardcode this information, which I believe not what ou actually
expect to get.
You probably should learn how the OpenBMC works inside. You can use
busctl tool for that.

Regarding compilation error of smbios-mdr daemon, I can say nothing
without knowing the issue. There should not be any special
configuration files for this smbios-mdr recipe but probably you trying
to build CPUInfo part of the recipe without having PECI library. You
likely should disable cpuinfo app.

On Fri, 2022-08-12 at 06:50 +0000, O=BBuzhan =C7A=ABLAR wrote:
> Hi Andrei,
>
> Thank you for your information. I have already added the CPU and DIMM
> configuration files within the .yaml files. When I added these
> files(related to the path: xyz.openbmc_project.Inventory.Item.Cpu
> and xyz.openbmc_project.Inventory.Item.Dimm), I see the CPU and DIMM
> entries over WebUI. However, In this way, I add the properties such
> as (PartNumber, SerialNumber, etc.) on my own. I have already
> generated a .bin file that has FRU information (chassis, board etc.)
> and I included this in BMC's image file. In addition, I see the
> properties related to Chassis, Board on WebUI.
>
> I have already checked the smbios-mdr daemon in openbmc. However,
> when I include this daemon in my yocto image, the bitbake shows some
> errors that are related to smbios-mdr's .cpp files. I guess I have to
> create some configuration files before doing it. Is it wrong? What
> should I do?
>
> I guess I have to need some code in BIOS. Is there any example to do
> this? I don't know where I should start.
>
> Thank you.
>
> O=BBuzhan =C7a=BBlar
> Software Design Engineer
>
>
>
> Pavo Tasar=B9m =DCretim Elektronik Tic. A.=AA.
> Teknopark =A9stanbul, Kurtk=F6y Pendik =A9STANBUL
>
>
> Tel             : +90 (216) 354 72 86
> Faks         : +90 (216) 354 76 77
> Gsm          : +90 (507) 585 10 60
> oguzhan.caglar@pavotek.com.tr
>
> www.pavotek.com.tr<http://www.pavotek.com.tr>
>
>
> G=F6nderen: Andrei Kartashev <a.kartashev@yadro.com>
> G=F6nderildi: 11 A=BBustos 2022 Per=BAembe 22:28:16
> Kime: O=BBuzhan =C7A=ABLAR; openbmc@lists.ozlabs.org
> Konu: (External) Re: Adding Inventory
>
>
> Warning: This e-mail came from an external source. If you do not
> trust the sender or if there is anything suspicious in the content of
> the e-mail, please inform the IT department.
>
>
>
> Hello Oguzhan,
>
> This is a very common question for newcomers, I believe is was
> already
> answered somewhere in the list.
> BMC out of the box don't have any knowledge on host's equipment (CPU,
> DIMM, Drive, AIC, etc) - it is up to you to deliver this information
> from host to BMC. As for now the most common way to feed BMC the
> information regarding CPU and DIMM is to transfer smbios tables via
> ipmi. You can implement any other mechanism but any way, you need to
> have some code in your BIOS.
>
> As soon as you have the CPU/DIMM information on BMC it can be shown
> in
> bmcweb by implementing corresponding dbus interfaces
> (xyz.openbmc_project.Inventory.Item.Cpu and
> xyz.openbmc_project.Inventory.Item.Dimm). smbiosmdrv2 daemon do this,
> but you also can add EntityManager configuration files for this or
> write your own daemon to expose the interfaces.
>
> On Thu, 2022-08-04 at 08:07 +0000, O=BBuzhan =C7A=ABLAR wrote:
> > Hello,
> >
> > I'm working on openbmc for ast2500 bmc. I want to add inventory
> > such
> > as CPU and DIMM etc. I added the chassis from .json file but I
> > couldn't add the CPU and DIMM. I know this is to related with
> > entity-
> > manager. How can I add these inventory on WEBUI? Can you give some
> > information about this issue?
> >
> > Regards.
> >
> > O=BBuzhan =C7a=BBlar
> > Software Design Engineer
> >
> >
> >
> > Pavo Tasar=B9m =DCretim Elektronik Tic. A.=AA.
> > Teknopark =A9stanbul, Kurtk=F6y Pendik =A9STANBUL
> >
> >
> > Tel             : +90 (216) 354 72 86
> > Faks         : +90 (216) 354 76 77
> > Gsm          : +90 (507) 585 10 60
> > oguzhan.caglar@pavotek.com.tr
> >
> > www.pavotek.com.tr<http://www.pavotek.com.tr>
> >
> >
>
> --
> Best regards,
> Andrei Kartashev,
> Lead BMC Developer
>

--
Best regards,
Andrei Kartashev,
Lead BMC Developer


--_000_b46a5098aabb470b8515c16aa1ef9f65pavotekcomtr_
Content-Type: text/html; charset="iso-8859-3"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
3">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>I'm sharing with you that my yocto errors are related to smbios-mdr&nbsp=
;in the .txt file.&nbsp;</p>
<p><br>
</p>
<p>I don't understand, How can the CPU information match with entity-manage=
r configuration files? I saw your comment in openbmc list about PCIe. It pr=
obes only with&nbsp;<span>xyz.openbmc_project.FruDevice.&nbsp;</span></p>
<p><br>
</p>
<p><br>
</p>
<div id=3D"x_Signature">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;App=
le Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe =
UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<table class=3D"x_MsoTableGrid" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"border-collapse:collapse; border:none">
<tbody>
<tr>
<td width=3D"549" colspan=3D"3" valign=3D"top" style=3D"width:453.1pt; padd=
ing:0in 5.4pt 0in 5.4pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<b><span lang=3D"TR" style=3D"font-size:9.0pt; font-family:&quot;Arial&quot=
;,sans-serif">O=BBuzhan =C7a=BBlar</span></b></p>
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<span lang=3D"TR" style=3D"font-size:9.0pt; font-family:&quot;Arial&quot;,s=
ans-serif">Software Design Engineer</span><span lang=3D"TR"></span></p>
</td>
<td width=3D"0" style=3D"border:none">
<p class=3D"x_MsoNormal">&nbsp;</p>
</td>
</tr>
<tr>
<td width=3D"549" colspan=3D"3" valign=3D"top" style=3D"width:453.1pt; padd=
ing:0in 5.4pt 0in 5.4pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<img width=3D"535" height=3D"9" style=3D"" src=3D"file:///C:/Users/OGUZHA~1=
.CAG/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png"><span lang=3D"TR=
"></span></p>
</td>
<td width=3D"0" style=3D"border:none">
<p class=3D"x_MsoNormal">&nbsp;</p>
</td>
</tr>
<tr style=3D"height:25.05pt">
<td width=3D"170" valign=3D"top" style=3D"width:127.35pt; padding:0in 5.4pt=
 0in 5.4pt; height:25.05pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<b><span lang=3D"TR">&nbsp;</span></b></p>
</td>
<td width=3D"31" rowspan=3D"7" valign=3D"top" style=3D"width:14.15pt; paddi=
ng:0in 5.4pt 0in 5.4pt; height:25.05pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<img width=3D"17" height=3D"127" style=3D"" src=3D"file:///C:/Users/OGUZHA~=
1.CAG/AppData/Local/Temp/msohtmlclip1/01/clip_image004.png"><span lang=3D"T=
R"></span></p>
</td>
<td width=3D"348" rowspan=3D"2" valign=3D"top" style=3D"width:311.6pt; padd=
ing:0in 5.4pt 0in 5.4pt; height:25.05pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<b><span lang=3D"TR" style=3D"font-size:9.0pt; font-family:&quot;Arial&quot=
;,sans-serif">Pavo Tasar=B9m =DCretim Elektronik Tic. A.=AA.</span></b><b><=
span lang=3D"TR" style=3D"font-family:&quot;Arial&quot;,sans-serif"></span>=
</b></p>
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<span lang=3D"TR" style=3D"font-size:8.0pt; font-family:&quot;Arial&quot;,s=
ans-serif">Teknopark =A9stanbul, Kurtk=F6y Pendik =A9STANBUL</span><span la=
ng=3D"TR" style=3D"font-size:10.0pt; font-family:&quot;Arial&quot;,sans-ser=
if"></span></p>
</td>
<td width=3D"0" height=3D"50" style=3D"height:25.05pt; border:none"></td>
</tr>
<tr style=3D"height:13.45pt">
<td width=3D"170" rowspan=3D"5" valign=3D"top" style=3D"width:127.35pt; pad=
ding:0in 5.4pt 0in 5.4pt; height:13.45pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<b><span lang=3D"TR" style=3D"font-size:8.0pt">&nbsp;</span></b></p>
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<b><span lang=3D"TR">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b><span =
lang=3D"TR"><a href=3D"http://pavotek.com.tr/" id=3D"LPNoLP"><b><span lang=
=3D"EN-US" style=3D"color:windowtext"><img border=3D"0" width=3D"131" heigh=
t=3D"23" style=3D"" src=3D"file:///C:/Users/OGUZHA~1.CAG/AppData/Local/Temp=
/msohtmlclip1/01/clip_image006.png"></span></b></a><b></b></span></p>
</td>
<td width=3D"0" height=3D"27" style=3D"height:13.45pt; border:none"></td>
</tr>
<tr style=3D"height:9.2pt">
<td width=3D"348" valign=3D"top" style=3D"width:311.6pt; padding:0in 5.4pt =
0in 5.4pt; height:9.2pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<span lang=3D"TR" style=3D"font-size:8.0pt; font-family:&quot;Arial&quot;,s=
ans-serif">Tel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; : &#43;90 (216) 354 72 86</span></p>
</td>
<td width=3D"0" height=3D"18" style=3D"height:9.2pt; border:none"></td>
</tr>
<tr style=3D"height:8.85pt">
<td width=3D"348" valign=3D"top" style=3D"width:311.6pt; padding:0in 5.4pt =
0in 5.4pt; height:8.85pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<span lang=3D"TR" style=3D"font-size:8.0pt; font-family:&quot;Arial&quot;,s=
ans-serif">Faks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &#43;90 (=
216) 354 76 77</span></p>
</td>
<td width=3D"0" height=3D"18" style=3D"height:8.85pt; border:none"></td>
</tr>
<tr style=3D"height:5.75pt">
<td width=3D"348" valign=3D"top" style=3D"width:311.6pt; padding:0in 5.4pt =
0in 5.4pt; height:5.75pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
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
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
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
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<span lang=3D"TR">&nbsp;</span></p>
</td>
<td width=3D"348" valign=3D"top" style=3D"width:311.6pt; padding:0in 5.4pt =
0in 5.4pt; height:6.7pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
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
<p class=3D"x_MsoNormal"><span lang=3D"TR">&nbsp;</span></p>
</div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>G=F6nderen:</b> Andrei Kartas=
hev &lt;a.kartashev@yadro.com&gt;<br>
<b>G=F6nderildi:</b> 12 A=BBustos 2022 Cuma 22:14:38<br>
<b>Kime:</b> O=BBuzhan =C7A=ABLAR; openbmc@lists.ozlabs.org<br>
<b>Konu:</b> Re: Ynt: (External) Re: Adding Inventory</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText"><br>
Warning: This e-mail came from an external source. If you do not trust the =
sender or if there is anything suspicious in the content of the e-mail, ple=
ase inform the IT department.<br>
<br>
<br>
<br>
I have no idea on what do you mean saying &quot;added the CPU and DIMM<br>
configuration files within the .yaml files&quot;, but I guess you are tryin=
g<br>
to hardcode this information, which I believe not what ou actually<br>
expect to get.<br>
You probably should learn how the OpenBMC works inside. You can use<br>
busctl tool for that.<br>
<br>
Regarding compilation error of smbios-mdr daemon, I can say nothing<br>
without knowing the issue. There should not be any special<br>
configuration files for this smbios-mdr recipe but probably you trying<br>
to build CPUInfo part of the recipe without having PECI library. You<br>
likely should disable cpuinfo app.<br>
<br>
On Fri, 2022-08-12 at 06:50 &#43;0000, O=BBuzhan =C7A=ABLAR wrote:<br>
&gt; Hi Andrei,<br>
&gt;<br>
&gt; Thank you for your information. I have already added the CPU and DIMM<=
br>
&gt; configuration files within the .yaml files. When I added these<br>
&gt; files(related to the path: xyz.openbmc_project.Inventory.Item.Cpu<br>
&gt; and xyz.openbmc_project.Inventory.Item.Dimm), I see the CPU and DIMM<b=
r>
&gt; entries over WebUI. However, In this way, I add the properties such<br=
>
&gt; as (PartNumber, SerialNumber, etc.) on my own. I have already<br>
&gt; generated a .bin file that has FRU information (chassis, board etc.)<b=
r>
&gt; and I included this in BMC's image file. In addition, I see the<br>
&gt; properties related to Chassis, Board on WebUI.<br>
&gt;<br>
&gt; I have already checked the smbios-mdr daemon in openbmc. However,<br>
&gt; when I include this daemon in my yocto image, the bitbake shows some<b=
r>
&gt; errors that are related to smbios-mdr's .cpp files. I guess I have to<=
br>
&gt; create some configuration files before doing it. Is it wrong? What<br>
&gt; should I do?<br>
&gt;<br>
&gt; I guess I have to need some code in BIOS. Is there any example to do<b=
r>
&gt; this? I don't know where I should start.<br>
&gt;<br>
&gt; Thank you.<br>
&gt;<br>
&gt; O=BBuzhan =C7a=BBlar<br>
&gt; Software Design Engineer<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Pavo Tasar=B9m =DCretim Elektronik Tic. A.=AA.<br>
&gt; Teknopark =A9stanbul, Kurtk=F6y Pendik =A9STANBUL<br>
&gt;<br>
&gt;<br>
&gt; Tel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; : &#43;90 (216) 354 72 86<br>
&gt; Faks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &#43;90 (216) 3=
54 76 77<br>
&gt; Gsm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &#43;90 (5=
07) 585 10 60<br>
&gt; oguzhan.caglar@pavotek.com.tr<br>
&gt;<br>
&gt; <a href=3D"http://www.pavotek.com.tr">www.pavotek.com.tr</a><br>
&gt;<br>
&gt;<br>
&gt; G=F6nderen: Andrei Kartashev &lt;a.kartashev@yadro.com&gt;<br>
&gt; G=F6nderildi: 11 A=BBustos 2022 Per=BAembe 22:28:16<br>
&gt; Kime: O=BBuzhan =C7A=ABLAR; openbmc@lists.ozlabs.org<br>
&gt; Konu: (External) Re: Adding Inventory<br>
&gt;<br>
&gt;<br>
&gt; Warning: This e-mail came from an external source. If you do not<br>
&gt; trust the sender or if there is anything suspicious in the content of<=
br>
&gt; the e-mail, please inform the IT department.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Hello Oguzhan,<br>
&gt;<br>
&gt; This is a very common question for newcomers, I believe is was<br>
&gt; already<br>
&gt; answered somewhere in the list.<br>
&gt; BMC out of the box don't have any knowledge on host's equipment (CPU,<=
br>
&gt; DIMM, Drive, AIC, etc) - it is up to you to deliver this information<b=
r>
&gt; from host to BMC. As for now the most common way to feed BMC the<br>
&gt; information regarding CPU and DIMM is to transfer smbios tables via<br=
>
&gt; ipmi. You can implement any other mechanism but any way, you need to<b=
r>
&gt; have some code in your BIOS.<br>
&gt;<br>
&gt; As soon as you have the CPU/DIMM information on BMC it can be shown<br=
>
&gt; in<br>
&gt; bmcweb by implementing corresponding dbus interfaces<br>
&gt; (xyz.openbmc_project.Inventory.Item.Cpu and<br>
&gt; xyz.openbmc_project.Inventory.Item.Dimm). smbiosmdrv2 daemon do this,<=
br>
&gt; but you also can add EntityManager configuration files for this or<br>
&gt; write your own daemon to expose the interfaces.<br>
&gt;<br>
&gt; On Thu, 2022-08-04 at 08:07 &#43;0000, O=BBuzhan =C7A=ABLAR wrote:<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; I'm working on openbmc for ast2500 bmc. I want to add inventory<b=
r>
&gt; &gt; such<br>
&gt; &gt; as CPU and DIMM etc. I added the chassis from .json file but I<br=
>
&gt; &gt; couldn't add the CPU and DIMM. I know this is to related with<br>
&gt; &gt; entity-<br>
&gt; &gt; manager. How can I add these inventory on WEBUI? Can you give som=
e<br>
&gt; &gt; information about this issue?<br>
&gt; &gt;<br>
&gt; &gt; Regards.<br>
&gt; &gt;<br>
&gt; &gt; O=BBuzhan =C7a=BBlar<br>
&gt; &gt; Software Design Engineer<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Pavo Tasar=B9m =DCretim Elektronik Tic. A.=AA.<br>
&gt; &gt; Teknopark =A9stanbul, Kurtk=F6y Pendik =A9STANBUL<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Tel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; : &#43;90 (216) 354 72 86<br>
&gt; &gt; Faks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &#43;90 (2=
16) 354 76 77<br>
&gt; &gt; Gsm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &#43;=
90 (507) 585 10 60<br>
&gt; &gt; oguzhan.caglar@pavotek.com.tr<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"http://www.pavotek.com.tr">www.pavotek.com.tr</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt; Andrei Kartashev,<br>
&gt; Lead BMC Developer<br>
&gt;<br>
<br>
--<br>
Best regards,<br>
Andrei Kartashev,<br>
Lead BMC Developer<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_b46a5098aabb470b8515c16aa1ef9f65pavotekcomtr_--

--_004_b46a5098aabb470b8515c16aa1ef9f65pavotekcomtr_
Content-Type: text/plain; name="error.txt"
Content-Description: error.txt
Content-Disposition: attachment; filename="error.txt"; size=60420;
	creation-date="Mon, 15 Aug 2022 07:16:21 GMT";
	modification-date="Mon, 15 Aug 2022 07:16:21 GMT"
Content-Transfer-Encoding: base64

RVJST1I6IHNtYmlvcy1tZHItMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMSBkb19jb21waWxl
OiBFeGVjdXRpb25FcnJvcignL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5i
bWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1n
bnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS90ZW1wL3J1bi5k
b19jb21waWxlLjE4NTg4JywgMSwgTm9uZSwgTm9uZSkKRVJST1I6IExvZ2ZpbGUgb2YgZmFpbHVy
ZSBzdG9yZWQgaW46IC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29w
ZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFi
aS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvdGVtcC9sb2cuZG9fY29t
cGlsZS4xODU4OApMb2cgZGF0YSBmb2xsb3dzOgp8IERFQlVHOiBFeGVjdXRpbmcgc2hlbGwgZnVu
Y3Rpb24gZG9fY29tcGlsZQp8IE5PVEU6IFZFUkJPU0U9MSBjbWFrZSAtLWJ1aWxkIC9ob21lL3Bh
dm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAv
d29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRB
VVRPSU5DK2U0ZWEzNzcxNmQtcjEvYnVpbGQgLS10YXJnZXQgYWxsIC0tCnwgWzEvMTFdIC9ob21l
L3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90
bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtn
aXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJt
LW9wZW5ibWMtbGludXgtZ251ZWFiaS9hcm0tb3BlbmJtYy1saW51eC1nbnVlYWJpLWcrKyAtREJP
T1NUX0FMTF9OT19MSUIgLURCT09TVF9BU0lPX0RJU0FCTEVfVEhSRUFEUyAtREJPT1NUX0VSUk9S
X0NPREVfSEVBREVSX09OTFkgLURCT09TVF9OT19SVFRJIC1EQk9PU1RfTk9fVFlQRUlEIC1EQk9P
U1RfU1lTVEVNX05PX0RFUFJFQ0FURUQgLURESU1NX0RCVVMgLUkvaG9tZS9wYXZvL29ndXovcGF2
b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3
Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVh
Mzc3MTZkLXIxL2dpdC9pbmNsdWRlIC1JL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVl
ZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1s
aW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9idWls
ZCAtaXN5c3RlbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVu
Ym1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkv
c21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2J1aWxkL2Jvb3N0LXNyYyAt
bWFybSAtbWNwdT1hcm0xMTc2anotcyAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgIC1PMiAtRF9G
T1JUSUZZX1NPVVJDRT0yIC1XZm9ybWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0
LXNlY3VyaXR5ICAtLXN5c3Jvb3Q9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9w
ZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51
eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUt
c3lzcm9vdCAgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1h
Y3JvLXByZWZpeC1tYXA9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMv
b3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVl
YWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMT0vdXNyL3NyYy9kZWJ1
Zy9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEgICAgICAgICAgICAgICAg
ICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3Bl
ZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMt
bGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjE9L3Vz
ci9zcmMvZGVidWcvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxICAgICAg
ICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9wYXZvL29ndXovcGF2b29w
ZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6
cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3
MTZkLXIxL3JlY2lwZS1zeXNyb290PSAgICAgICAgICAgICAgICAgICAgICAtZmRlYnVnLXByZWZp
eC1tYXA9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9i
dWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlv
cy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC1uYXRpdmU9
ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4gLXN0ZD1nbnUrKzIwIC1NRCAtTVQgQ01ha2VG
aWxlcy9zbWJpb3NtZHJ2MmFwcC5kaXIvc3JjL2NwdS5jcHAubyAtTUYgQ01ha2VGaWxlcy9zbWJp
b3NtZHJ2MmFwcC5kaXIvc3JjL2NwdS5jcHAuby5kIC1vIENNYWtlRmlsZXMvc21iaW9zbWRydjJh
cHAuZGlyL3NyYy9jcHUuY3BwLm8gLWMgL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVl
ZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1s
aW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9naXQv
c3JjL2NwdS5jcHAKfCBbMi8xMV0gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9w
ZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51
eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9hcm0tb3BlbmJtYy1saW51eC1nbnVlYWJpL2FybS1vcGVu
Ym1jLWxpbnV4LWdudWVhYmktZysrIC1EQk9PU1RfQUxMX05PX0xJQiAtREJPT1NUX0FTSU9fRElT
QUJMRV9USFJFQURTIC1EQk9PU1RfRVJST1JfQ09ERV9IRUFERVJfT05MWSAtREJPT1NUX05PX1JU
VEkgLURCT09TVF9OT19UWVBFSUQgLURCT09TVF9TWVNURU1fTk9fREVQUkVDQVRFRCAtRERJTU1f
REJVUyAtSS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMv
YnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJp
b3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvZ2l0L2luY2x1ZGUgLUkvaG9tZS9w
YXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1w
L3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0
QVVUT0lOQytlNGVhMzc3MTZkLXIxL2J1aWxkIC1pc3lzdGVtIC9ob21lL3Bhdm8vb2d1ei9wYXZv
b3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2
anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEz
NzcxNmQtcjEvYnVpbGQvYm9vc3Qtc3JjIC1tYXJtIC1tY3B1PWFybTExNzZqei1zIC1mc3RhY2st
cHJvdGVjdG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdmb3JtYXQgLVdmb3Jt
YXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgIC0tc3lzcm9vdD0vaG9tZS9wYXZv
L29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dv
cmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVU
T0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290ICAtTzIgLXBpcGUgLWcgLWZlbGltaW5h
dGUtdW51c2VkLWRlYnVnLXR5cGVzIC1mbWFjcm8tcHJlZml4LW1hcD0vaG9tZS9wYXZvL29ndXov
cGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJt
MTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytl
NGVhMzc3MTZkLXIxPS91c3Ivc3JjL2RlYnVnL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRl
YTM3NzE2ZC1yMSAgICAgICAgICAgICAgICAgICAgICAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUv
cGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3Rt
cC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dp
dEFVVE9JTkMrZTRlYTM3NzE2ZC1yMT0vdXNyL3NyYy9kZWJ1Zy9zbWJpb3MtbWRyLzEuMCtnaXRB
VVRPSU5DK2U0ZWEzNzcxNmQtcjEgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgt
bWFwPS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVp
bGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3Mt
bWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3Q9ICAgICAgICAg
ICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9wYXZvL29ndXovcGF2b29wZW5i
bWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1v
cGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZk
LXIxL3JlY2lwZS1zeXNyb290LW5hdGl2ZT0gIC1mdmlzaWJpbGl0eS1pbmxpbmVzLWhpZGRlbiAt
c3RkPWdudSsrMjAgLU1EIC1NVCBDTWFrZUZpbGVzL3NtYmlvc21kcnYyYXBwLmRpci9zcmMvcGNp
ZXNsb3QuY3BwLm8gLU1GIENNYWtlRmlsZXMvc21iaW9zbWRydjJhcHAuZGlyL3NyYy9wY2llc2xv
dC5jcHAuby5kIC1vIENNYWtlRmlsZXMvc21iaW9zbWRydjJhcHAuZGlyL3NyYy9wY2llc2xvdC5j
cHAubyAtYyAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1j
L2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21i
aW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2dpdC9zcmMvcGNpZXNsb3QuY3Bw
CnwgWzMvMTFdIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5i
bWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9z
bWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3Vzci9iaW4vYXJtLW9wZW5ibWMtbGludXgtZ251ZWFiaS9hcm0tb3BlbmJtYy1saW51eC1n
bnVlYWJpLWcrKyAtREJPT1NUX0FMTF9OT19MSUIgLURCT09TVF9BU0lPX0RJU0FCTEVfVEhSRUFE
UyAtREJPT1NUX0VSUk9SX0NPREVfSEVBREVSX09OTFkgLURCT09TVF9OT19SVFRJIC1EQk9PU1Rf
Tk9fVFlQRUlEIC1EQk9PU1RfU1lTVEVNX05PX0RFUFJFQ0FURUQgLUkvaG9tZS9wYXZvL29ndXov
cGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJt
MTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytl
NGVhMzc3MTZkLXIxL2dpdC9pbmNsdWRlIC1JL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2Fz
cGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJt
Yy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9i
dWlsZCAtaXN5c3RlbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9v
cGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVh
Ymkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2J1aWxkL2Jvb3N0LXNy
YyAtbWFybSAtbWNwdT1hcm0xMTc2anotcyAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgIC1PMiAt
RF9GT1JUSUZZX1NPVVJDRT0yIC1XZm9ybWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9y
bWF0LXNlY3VyaXR5ICAtLXN5c3Jvb3Q9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVl
ZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1s
aW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNp
cGUtc3lzcm9vdCAgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAt
Zm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5i
bWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1n
bnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMT0vdXNyL3NyYy9k
ZWJ1Zy9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEgICAgICAgICAgICAg
ICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9h
c3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5i
bWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjE9
L3Vzci9zcmMvZGVidWcvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9wYXZvL29ndXovcGF2
b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3
Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVh
Mzc3MTZkLXIxL3JlY2lwZS1zeXNyb290PSAgICAgICAgICAgICAgICAgICAgICAtZmRlYnVnLXBy
ZWZpeC1tYXA9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJt
Yy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3Nt
Ymlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4gLXN0ZD1nbnUrKzIwIC1NRCAtTVQgQ01h
a2VGaWxlcy9jcHVpbmZvYXBwLmRpci9zcmMvY3B1aW5mb19tYWluLmNwcC5vIC1NRiBDTWFrZUZp
bGVzL2NwdWluZm9hcHAuZGlyL3NyYy9jcHVpbmZvX21haW4uY3BwLm8uZCAtbyBDTWFrZUZpbGVz
L2NwdWluZm9hcHAuZGlyL3NyYy9jcHVpbmZvX21haW4uY3BwLm8gLWMgL2hvbWUvcGF2by9vZ3V6
L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2Fy
bTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMr
ZTRlYTM3NzE2ZC1yMS9naXQvc3JjL2NwdWluZm9fbWFpbi5jcHAKfCBGQUlMRUQ6IENNYWtlRmls
ZXMvY3B1aW5mb2FwcC5kaXIvc3JjL2NwdWluZm9fbWFpbi5jcHAubwp8IC9ob21lL3Bhdm8vb2d1
ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9h
cm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5D
K2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9wZW5ibWMt
bGludXgtZ251ZWFiaS9hcm0tb3BlbmJtYy1saW51eC1nbnVlYWJpLWcrKyAtREJPT1NUX0FMTF9O
T19MSUIgLURCT09TVF9BU0lPX0RJU0FCTEVfVEhSRUFEUyAtREJPT1NUX0VSUk9SX0NPREVfSEVB
REVSX09OTFkgLURCT09TVF9OT19SVFRJIC1EQk9PU1RfTk9fVFlQRUlEIC1EQk9PU1RfU1lTVEVN
X05PX0RFUFJFQ0FURUQgLUkvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJt
Yy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdu
dWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2dpdC9pbmNsdWRl
IC1JL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWls
ZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1t
ZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9idWlsZCAtaXN5c3RlbSAvaG9tZS9wYXZv
L29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dv
cmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVU
T0lOQytlNGVhMzc3MTZkLXIxL2J1aWxkL2Jvb3N0LXNyYyAtbWFybSAtbWNwdT1hcm0xMTc2anot
cyAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgIC1PMiAtRF9GT1JUSUZZX1NPVVJDRT0yIC1XZm9y
bWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5ICAtLXN5c3Jvb3Q9
L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9l
cGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIv
MS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdCAgLU8yIC1waXBlIC1n
IC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUv
cGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3Rt
cC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dp
dEFVVE9JTkMrZTRlYTM3NzE2ZC1yMT0vdXNyL3NyYy9kZWJ1Zy9zbWJpb3MtbWRyLzEuMCtnaXRB
VVRPSU5DK2U0ZWEzNzcxNmQtcjEgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgt
bWFwPS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVp
bGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3Mt
bWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjE9L3Vzci9zcmMvZGVidWcvc21iaW9zLW1k
ci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxICAgICAgICAgICAgICAgICAgICAgIC1mZGVi
dWctcHJlZml4LW1hcD0vaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9v
cGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVh
Ymkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290
PSAgICAgICAgICAgICAgICAgICAgICAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvcGF2by9vZ3V6
L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2Fy
bTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMr
ZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICAtZnZpc2liaWxpdHktaW5saW5l
cy1oaWRkZW4gLXN0ZD1nbnUrKzIwIC1NRCAtTVQgQ01ha2VGaWxlcy9jcHVpbmZvYXBwLmRpci9z
cmMvY3B1aW5mb19tYWluLmNwcC5vIC1NRiBDTWFrZUZpbGVzL2NwdWluZm9hcHAuZGlyL3NyYy9j
cHVpbmZvX21haW4uY3BwLm8uZCAtbyBDTWFrZUZpbGVzL2NwdWluZm9hcHAuZGlyL3NyYy9jcHVp
bmZvX21haW4uY3BwLm8gLWMgL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5i
bWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1n
bnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9naXQvc3JjL2Nw
dWluZm9fbWFpbi5jcHAKfCAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJt
Yy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdu
dWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2dpdC9zcmMvY3B1
aW5mb19tYWluLmNwcDogSW4gZnVuY3Rpb24gJ3ZvaWQgY3B1X2luZm86OmdldFByb2Nlc3Nvcklu
Zm8oYm9vc3Q6OmFzaW86OmlvX3NlcnZpY2UmLCBjb25zdCBzdGQ6OnNoYXJlZF9wdHI8c2RidXNw
bHVzOjphc2lvOjpjb25uZWN0aW9uPiYsIGNvbnN0IHNpemVfdCYpJzoKfCAvaG9tZS9wYXZvL29n
dXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsv
YXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lO
QytlNGVhMzc3MTZkLXIxL2dpdC9zcmMvY3B1aW5mb19tYWluLmNwcDo0MDc6MTQ6IGVycm9yOiAn
aWN4ZCcgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlOyBkaWQgeW91IG1lYW4gJ2ljeCc/
CnwgICA0MDcgfCAgICAgICAgIGNhc2UgaWN4ZDoKfCAgICAgICB8ICAgICAgICAgICAgICBefn5+
CnwgICAgICAgfCAgICAgICAgICAgICAgaWN4CnwgL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1j
L2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3Bl
bmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1y
MS9naXQvc3JjL2NwdWluZm9fbWFpbi5jcHA6NDA4OjE0OiBlcnJvcjogJ3Nwcicgd2FzIG5vdCBk
ZWNsYXJlZCBpbiB0aGlzIHNjb3BlCnwgICA0MDggfCAgICAgICAgIGNhc2Ugc3ByOgp8ICAgICAg
IHwgICAgICAgICAgICAgIF5+fgp8IFs0LzExXSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMv
YXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVu
Ym1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIx
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1vcGVuYm1jLWxpbnV4LWdudWVhYmkv
YXJtLW9wZW5ibWMtbGludXgtZ251ZWFiaS1nKysgLURCT09TVF9BTExfTk9fTElCIC1EQk9PU1Rf
QVNJT19ESVNBQkxFX1RIUkVBRFMgLURCT09TVF9FUlJPUl9DT0RFX0hFQURFUl9PTkxZIC1EQk9P
U1RfTk9fUlRUSSAtREJPT1NUX05PX1RZUEVJRCAtREJPT1NUX1NZU1RFTV9OT19ERVBSRUNBVEVE
IC1JL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWls
ZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1t
ZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9naXQvaW5jbHVkZSAtSS9ob21lL3Bhdm8v
b2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29y
ay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRP
SU5DK2U0ZWEzNzcxNmQtcjEvYnVpbGQgLWlzeXN0ZW0gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVu
Ym1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMt
b3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2
ZC1yMS9idWlsZC9ib29zdC1zcmMgLW1hcm0gLW1jcHU9YXJtMTE3Nmp6LXMgLWZzdGFjay1wcm90
ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1z
ZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAgLS1zeXNyb290PS9ob21lL3Bhdm8vb2d1
ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9h
cm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5D
K2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QgIC1PMiAtcGlwZSAtZyAtZmVsaW1pbmF0ZS11
bnVzZWQtZGVidWctdHlwZXMgLWZtYWNyby1wcmVmaXgtbWFwPS9ob21lL3Bhdm8vb2d1ei9wYXZv
b3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2
anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEz
NzcxNmQtcjE9L3Vzci9zcmMvZGVidWcvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3
MTZkLXIxICAgICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9wYXZv
L29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dv
cmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVU
T0lOQytlNGVhMzc3MTZkLXIxPS91c3Ivc3JjL2RlYnVnL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9J
TkMrZTRlYTM3NzE2ZC1yMSAgICAgICAgICAgICAgICAgICAgICAtZmRlYnVnLXByZWZpeC1tYXA9
L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9l
cGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIv
MS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAg
ICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9h
c3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5i
bWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEv
cmVjaXBlLXN5c3Jvb3QtbmF0aXZlPSAgLWZ2aXNpYmlsaXR5LWlubGluZXMtaGlkZGVuIC1zdGQ9
Z251KysyMCAtTUQgLU1UIENNYWtlRmlsZXMvY3B1aW5mb2FwcC5kaXIvc3JjL3NwZWVkX3NlbGVj
dC5jcHAubyAtTUYgQ01ha2VGaWxlcy9jcHVpbmZvYXBwLmRpci9zcmMvc3BlZWRfc2VsZWN0LmNw
cC5vLmQgLW8gQ01ha2VGaWxlcy9jcHVpbmZvYXBwLmRpci9zcmMvc3BlZWRfc2VsZWN0LmNwcC5v
IC1jIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVp
bGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3Mt
bWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvZ2l0L3NyYy9zcGVlZF9zZWxlY3QuY3Bw
CnwgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3Bl
ZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMt
bGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVj
aXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzExLjIuMC92ZWN0b3I6NzIsCnwgICAgICAgICAg
ICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29w
ZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFi
aS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3Qv
dXNyL2luY2x1ZGUvYysrLzExLjIuMC9mdW5jdGlvbmFsOjYyLAp8ICAgICAgICAgICAgICAgICAg
ZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1
aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9z
LW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNs
dWRlL2Jvb3N0L2FzaW8vZGV0YWlsL2Z1bmN0aW9uYWwuaHBwOjIwLAp8ICAgICAgICAgICAgICAg
ICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1j
L2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21i
aW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9p
bmNsdWRlL2Jvb3N0L2FzaW8vYXNzb2NpYXRlZF9hbGxvY2F0b3IuaHBwOjIxLAp8ICAgICAgICAg
ICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9v
cGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVh
Ymkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290
L3Vzci9pbmNsdWRlL2Jvb3N0L2FzaW8vZGV0YWlsL2hhbmRsZXJfYWxsb2NfaGVscGVycy5ocHA6
MjMsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9h
c3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5i
bWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEv
cmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYm9vc3QvYXNpby9kZXRhaWwvYmluZF9oYW5kbGVy
LmhwcDoyMCwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVu
Ym1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMt
b3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2
ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2RldGFpbC93cmFwcGVk
X2hhbmRsZXIuaHBwOjE4LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXov
cGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJt
MTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytl
NGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2Jvb3N0L2FzaW8vaW9fY29u
dGV4dC5ocHA6MjQsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZv
b3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2
anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEz
NzcxNmQtcjEvZ2l0L2luY2x1ZGUvc3BlZWRfc2VsZWN0LmhwcDoxNiwKfCAgICAgICAgICAgICAg
ICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJt
Yy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3Nt
Ymlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9naXQvc3JjL3NwZWVkX3NlbGVj
dC5jcHA6MTU6CnwgL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3Bl
bmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJp
L3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC91
c3IvaW5jbHVkZS9jKysvMTEuMi4wL2JpdHMvdmVjdG9yLnRjYzogSW4gbWVtYmVyIGZ1bmN0aW9u
ICd2b2lkIHN0ZDo6dmVjdG9yPF9UcCwgX0FsbG9jPjo6X01fcmVhbGxvY19pbnNlcnQoc3RkOjp2
ZWN0b3I8X1RwLCBfQWxsb2M+OjppdGVyYXRvciwgX0FyZ3MmJiAuLi4pIFt3aXRoIF9BcmdzID0g
e2NvbnN0IGJvb3N0Ojphc2lvOjpkZXRhaWw6OnRpbWVyX3F1ZXVlPGJvb3N0Ojphc2lvOjpkZXRh
aWw6OmNocm9ub190aW1lX3RyYWl0czxzdGQ6OmNocm9ubzo6X1YyOjpzdGVhZHlfY2xvY2ssIGJv
b3N0Ojphc2lvOjp3YWl0X3RyYWl0czxzdGQ6OmNocm9ubzo6X1YyOjpzdGVhZHlfY2xvY2s+ID4g
Pjo6aGVhcF9lbnRyeSZ9OyBfVHAgPSBib29zdDo6YXNpbzo6ZGV0YWlsOjp0aW1lcl9xdWV1ZTxi
b29zdDo6YXNpbzo6ZGV0YWlsOjpjaHJvbm9fdGltZV90cmFpdHM8c3RkOjpjaHJvbm86Ol9WMjo6
c3RlYWR5X2Nsb2NrLCBib29zdDo6YXNpbzo6d2FpdF90cmFpdHM8c3RkOjpjaHJvbm86Ol9WMjo6
c3RlYWR5X2Nsb2NrPiA+ID46OmhlYXBfZW50cnk7IF9BbGxvYyA9IHN0ZDo6YWxsb2NhdG9yPGJv
b3N0Ojphc2lvOjpkZXRhaWw6OnRpbWVyX3F1ZXVlPGJvb3N0Ojphc2lvOjpkZXRhaWw6OmNocm9u
b190aW1lX3RyYWl0czxzdGQ6OmNocm9ubzo6X1YyOjpzdGVhZHlfY2xvY2ssIGJvb3N0Ojphc2lv
Ojp3YWl0X3RyYWl0czxzdGQ6OmNocm9ubzo6X1YyOjpzdGVhZHlfY2xvY2s+ID4gPjo6aGVhcF9l
bnRyeT5dJzoKfCAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVu
Ym1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkv
c21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vz
ci9pbmNsdWRlL2MrKy8xMS4yLjAvYml0cy92ZWN0b3IudGNjOjQyNjo3OiBub3RlOiBwYXJhbWV0
ZXIgcGFzc2luZyBmb3IgYXJndW1lbnQgb2YgdHlwZSAnc3RkOjp2ZWN0b3I8Ym9vc3Q6OmFzaW86
OmRldGFpbDo6dGltZXJfcXVldWU8Ym9vc3Q6OmFzaW86OmRldGFpbDo6Y2hyb25vX3RpbWVfdHJh
aXRzPHN0ZDo6Y2hyb25vOjpfVjI6OnN0ZWFkeV9jbG9jaywgYm9vc3Q6OmFzaW86OndhaXRfdHJh
aXRzPHN0ZDo6Y2hyb25vOjpfVjI6OnN0ZWFkeV9jbG9jaz4gPiA+OjpoZWFwX2VudHJ5LCBzdGQ6
OmFsbG9jYXRvcjxib29zdDo6YXNpbzo6ZGV0YWlsOjp0aW1lcl9xdWV1ZTxib29zdDo6YXNpbzo6
ZGV0YWlsOjpjaHJvbm9fdGltZV90cmFpdHM8c3RkOjpjaHJvbm86Ol9WMjo6c3RlYWR5X2Nsb2Nr
LCBib29zdDo6YXNpbzo6d2FpdF90cmFpdHM8c3RkOjpjaHJvbm86Ol9WMjo6c3RlYWR5X2Nsb2Nr
PiA+ID46OmhlYXBfZW50cnk+ID46Oml0ZXJhdG9yJyBjaGFuZ2VkIGluIEdDQyA3LjEKfCAgIDQy
NiB8ICAgICAgIHZlY3RvcjxfVHAsIF9BbGxvYz46Ogp8ICAgICAgIHwgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fgp8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29w
ZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6
cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3
MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2MrKy8xMS4yLjAvdmVjdG9yOjY3LAp8
ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVk
b3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxp
bnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lw
ZS1zeXNyb290L3Vzci9pbmNsdWRlL2MrKy8xMS4yLjAvZnVuY3Rpb25hbDo2MiwKfCAgICAgICAg
ICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMv
b3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVl
YWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9v
dC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2RldGFpbC9mdW5jdGlvbmFsLmhwcDoyMCwKfCAgICAg
ICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5i
bWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1n
bnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lz
cm9vdC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2Fzc29jaWF0ZWRfYWxsb2NhdG9yLmhwcDoyMSwK
fCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVl
ZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1s
aW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNp
cGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2RldGFpbC9oYW5kbGVyX2FsbG9jX2hl
bHBlcnMuaHBwOjIzLAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2
b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3
Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVh
Mzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2Jvb3N0L2FzaW8vZGV0YWlsL2Jp
bmRfaGFuZGxlci5ocHA6MjAsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1
ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9h
cm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5D
K2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYm9vc3QvYXNpby9kZXRh
aWwvd3JhcHBlZF9oYW5kbGVyLmhwcDoxOCwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUv
cGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3Rt
cC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dp
dEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29zdC9h
c2lvL2lvX2NvbnRleHQuaHBwOjI0LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZv
L29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dv
cmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVU
T0lOQytlNGVhMzc3MTZkLXIxL2dpdC9pbmNsdWRlL3NwZWVkX3NlbGVjdC5ocHA6MTYsCnwgICAg
ICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVu
Ym1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgt
Z251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvZ2l0L3NyYy9z
cGVlZF9zZWxlY3QuY3BwOjE1Ogp8IC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRv
cGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGlu
dXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBl
LXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzExLjIuMC9iaXRzL3N0bF92ZWN0b3IuaDogSW4gbWVt
YmVyIGZ1bmN0aW9uICd2b2lkIGJvb3N0Ojphc2lvOjpkZXRhaWw6OmVwb2xsX3JlYWN0b3I6OnNj
aGVkdWxlX3RpbWVyKGJvb3N0Ojphc2lvOjpkZXRhaWw6OnRpbWVyX3F1ZXVlPFRpbWVfVHJhaXRz
PiYsIGNvbnN0IHR5cGVuYW1lIFRpbWVfVHJhaXRzOjp0aW1lX3R5cGUmLCB0eXBlbmFtZSBib29z
dDo6YXNpbzo6ZGV0YWlsOjp0aW1lcl9xdWV1ZTxUaW1lX1RyYWl0cz46OnBlcl90aW1lcl9kYXRh
JiwgYm9vc3Q6OmFzaW86OmRldGFpbDo6d2FpdF9vcCopIFt3aXRoIFRpbWVfVHJhaXRzID0gYm9v
c3Q6OmFzaW86OmRldGFpbDo6Y2hyb25vX3RpbWVfdHJhaXRzPHN0ZDo6Y2hyb25vOjpfVjI6OnN0
ZWFkeV9jbG9jaywgYm9vc3Q6OmFzaW86OndhaXRfdHJhaXRzPHN0ZDo6Y2hyb25vOjpfVjI6OnN0
ZWFkeV9jbG9jaz4gPl0nOgp8IC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVu
Ym1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgt
Z251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5
c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzExLjIuMC9iaXRzL3N0bF92ZWN0b3IuaDoxMTk4OjI4OiBu
b3RlOiBwYXJhbWV0ZXIgcGFzc2luZyBmb3IgYXJndW1lbnQgb2YgdHlwZSAnX19nbnVfY3h4Ojpf
X25vcm1hbF9pdGVyYXRvcjxib29zdDo6YXNpbzo6ZGV0YWlsOjp0aW1lcl9xdWV1ZTxib29zdDo6
YXNpbzo6ZGV0YWlsOjpjaHJvbm9fdGltZV90cmFpdHM8c3RkOjpjaHJvbm86Ol9WMjo6c3RlYWR5
X2Nsb2NrLCBib29zdDo6YXNpbzo6d2FpdF90cmFpdHM8c3RkOjpjaHJvbm86Ol9WMjo6c3RlYWR5
X2Nsb2NrPiA+ID46OmhlYXBfZW50cnkqLCBzdGQ6OnZlY3Rvcjxib29zdDo6YXNpbzo6ZGV0YWls
Ojp0aW1lcl9xdWV1ZTxib29zdDo6YXNpbzo6ZGV0YWlsOjpjaHJvbm9fdGltZV90cmFpdHM8c3Rk
OjpjaHJvbm86Ol9WMjo6c3RlYWR5X2Nsb2NrLCBib29zdDo6YXNpbzo6d2FpdF90cmFpdHM8c3Rk
OjpjaHJvbm86Ol9WMjo6c3RlYWR5X2Nsb2NrPiA+ID46OmhlYXBfZW50cnksIHN0ZDo6YWxsb2Nh
dG9yPGJvb3N0Ojphc2lvOjpkZXRhaWw6OnRpbWVyX3F1ZXVlPGJvb3N0Ojphc2lvOjpkZXRhaWw6
OmNocm9ub190aW1lX3RyYWl0czxzdGQ6OmNocm9ubzo6X1YyOjpzdGVhZHlfY2xvY2ssIGJvb3N0
Ojphc2lvOjp3YWl0X3RyYWl0czxzdGQ6OmNocm9ubzo6X1YyOjpzdGVhZHlfY2xvY2s+ID4gPjo6
aGVhcF9lbnRyeT4gPiA+JyBjaGFuZ2VkIGluIEdDQyA3LjEKfCAgMTE5OCB8ICAgICAgICAgICBf
TV9yZWFsbG9jX2luc2VydChlbmQoKSwgX194KTsKfCAgICAgICB8ICAgICAgICAgICB+fn5+fn5+
fn5+fn5+fn5+fl5+fn5+fn5+fn5+fgp8IFs1LzExXSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5i
bWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1v
cGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZk
LXIxL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1vcGVuYm1jLWxpbnV4LWdudWVh
YmkvYXJtLW9wZW5ibWMtbGludXgtZ251ZWFiaS1nKysgLURCT09TVF9BTExfTk9fTElCIC1EQk9P
U1RfQVNJT19ESVNBQkxFX1RIUkVBRFMgLURCT09TVF9FUlJPUl9DT0RFX0hFQURFUl9PTkxZIC1E
Qk9PU1RfTk9fUlRUSSAtREJPT1NUX05PX1RZUEVJRCAtREJPT1NUX1NZU1RFTV9OT19ERVBSRUNB
VEVEIC1ERElNTV9EQlVTIC1JL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5i
bWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1n
bnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9naXQvaW5jbHVk
ZSAtSS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVp
bGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3Mt
bWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvYnVpbGQgLWlzeXN0ZW0gL2hvbWUvcGF2
by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93
b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFV
VE9JTkMrZTRlYTM3NzE2ZC1yMS9idWlsZC9ib29zdC1zcmMgLW1hcm0gLW1jcHU9YXJtMTE3Nmp6
LXMgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zv
cm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAgLS1zeXNyb290
PS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQv
ZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRy
LzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QgIC1PMiAtcGlwZSAt
ZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLWZtYWNyby1wcmVmaXgtbWFwPS9ob21l
L3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90
bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtn
aXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjE9L3Vzci9zcmMvZGVidWcvc21iaW9zLW1kci8xLjArZ2l0
QVVUT0lOQytlNGVhMzc3MTZkLXIxICAgICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4
LW1hcD0vaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1
aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9z
LW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxPS91c3Ivc3JjL2RlYnVnL3NtYmlvcy1t
ZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMSAgICAgICAgICAgICAgICAgICAgICAtZmRl
YnVnLXByZWZpeC1tYXA9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMv
b3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVl
YWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9v
dD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3Bhdm8vb2d1
ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9h
cm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5D
K2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlPSAgLWZ2aXNpYmlsaXR5LWlubGlu
ZXMtaGlkZGVuIC1zdGQ9Z251KysyMCAtTUQgLU1UIENNYWtlRmlsZXMvc21iaW9zbWRydjJhcHAu
ZGlyL3NyYy9zeXN0ZW0uY3BwLm8gLU1GIENNYWtlRmlsZXMvc21iaW9zbWRydjJhcHAuZGlyL3Ny
Yy9zeXN0ZW0uY3BwLm8uZCAtbyBDTWFrZUZpbGVzL3NtYmlvc21kcnYyYXBwLmRpci9zcmMvc3lz
dGVtLmNwcC5vIC1jIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29w
ZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFi
aS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvZ2l0L3NyYy9zeXN0ZW0u
Y3BwCnwgWzYvMTFdIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29w
ZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFi
aS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlL3Vzci9iaW4vYXJtLW9wZW5ibWMtbGludXgtZ251ZWFiaS9hcm0tb3BlbmJtYy1saW51
eC1nbnVlYWJpLWcrKyAtREJPT1NUX0FMTF9OT19MSUIgLURCT09TVF9BU0lPX0RJU0FCTEVfVEhS
RUFEUyAtREJPT1NUX0VSUk9SX0NPREVfSEVBREVSX09OTFkgLURCT09TVF9OT19SVFRJIC1EQk9P
U1RfTk9fVFlQRUlEIC1EQk9PU1RfU1lTVEVNX05PX0RFUFJFQ0FURUQgLURESU1NX0RCVVMgLUkv
aG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2Vw
Y2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8x
LjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2dpdC9pbmNsdWRlIC1JL2hvbWUvcGF2by9vZ3V6
L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2Fy
bTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMr
ZTRlYTM3NzE2ZC1yMS9idWlsZCAtaXN5c3RlbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMv
YXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVu
Ym1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIx
L2J1aWxkL2Jvb3N0LXNyYyAtbWFybSAtbWNwdT1hcm0xMTc2anotcyAtZnN0YWNrLXByb3RlY3Rv
ci1zdHJvbmcgIC1PMiAtRF9GT1JUSUZZX1NPVVJDRT0yIC1XZm9ybWF0IC1XZm9ybWF0LXNlY3Vy
aXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5ICAtLXN5c3Jvb3Q9L2hvbWUvcGF2by9vZ3V6L3Bh
dm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTEx
NzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRl
YTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdCAgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNl
ZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVu
Ym1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMt
b3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2
ZC1yMT0vdXNyL3NyYy9kZWJ1Zy9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQt
cjEgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3Bhdm8vb2d1
ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9h
cm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5D
K2U0ZWEzNzcxNmQtcjE9L3Vzci9zcmMvZGVidWcvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytl
NGVhMzc3MTZkLXIxICAgICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9t
ZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2Ev
dG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjAr
Z2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290PSAgICAgICAgICAgICAgICAg
ICAgICAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVl
ZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1s
aW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNp
cGUtc3lzcm9vdC1uYXRpdmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4gLXN0ZD1nbnUr
KzIwIC1NRCAtTVQgQ01ha2VGaWxlcy9zbWJpb3NtZHJ2MmFwcC5kaXIvc3JjL2RpbW0uY3BwLm8g
LU1GIENNYWtlRmlsZXMvc21iaW9zbWRydjJhcHAuZGlyL3NyYy9kaW1tLmNwcC5vLmQgLW8gQ01h
a2VGaWxlcy9zbWJpb3NtZHJ2MmFwcC5kaXIvc3JjL2RpbW0uY3BwLm8gLWMgL2hvbWUvcGF2by9v
Z3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3Jr
L2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9J
TkMrZTRlYTM3NzE2ZC1yMS9naXQvc3JjL2RpbW0uY3BwCnwgWzcvMTFdIC9ob21lL3Bhdm8vb2d1
ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9h
cm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5D
K2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9wZW5ibWMt
bGludXgtZ251ZWFiaS9hcm0tb3BlbmJtYy1saW51eC1nbnVlYWJpLWcrKyAtREJPT1NUX0FMTF9O
T19MSUIgLURCT09TVF9BU0lPX0RJU0FCTEVfVEhSRUFEUyAtREJPT1NUX0VSUk9SX0NPREVfSEVB
REVSX09OTFkgLURCT09TVF9OT19SVFRJIC1EQk9PU1RfTk9fVFlQRUlEIC1EQk9PU1RfU1lTVEVN
X05PX0RFUFJFQ0FURUQgLURESU1NX0RCVVMgLUkvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMv
YXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVu
Ym1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIx
L2dpdC9pbmNsdWRlIC1JL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMv
b3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVl
YWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9idWlsZCAtaXN5c3Rl
bSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxk
L2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1k
ci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2J1aWxkL2Jvb3N0LXNyYyAtbWFybSAtbWNw
dT1hcm0xMTc2anotcyAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgIC1PMiAtRF9GT1JUSUZZX1NP
VVJDRT0yIC1XZm9ybWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5
ICAtLXN5c3Jvb3Q9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3Bl
bmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJp
L3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdCAg
LU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZp
eC1tYXA9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9i
dWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlv
cy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMT0vdXNyL3NyYy9kZWJ1Zy9zbWJpb3Mt
bWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEgICAgICAgICAgICAgICAgICAgICAgLWZk
ZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1j
L29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251
ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjE9L3Vzci9zcmMvZGVi
dWcvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxICAgICAgICAgICAgICAg
ICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNw
ZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1j
LWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3Jl
Y2lwZS1zeXNyb290PSAgICAgICAgICAgICAgICAgICAgICAtZmRlYnVnLXByZWZpeC1tYXA9L2hv
bWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNh
L3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4w
K2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICAtZnZpc2li
aWxpdHktaW5saW5lcy1oaWRkZW4gLXN0ZD1nbnUrKzIwIC1NRCAtTVQgQ01ha2VGaWxlcy9zbWJp
b3NtZHJ2MmFwcC5kaXIvc3JjL21kcnYyX21haW4uY3BwLm8gLU1GIENNYWtlRmlsZXMvc21iaW9z
bWRydjJhcHAuZGlyL3NyYy9tZHJ2Ml9tYWluLmNwcC5vLmQgLW8gQ01ha2VGaWxlcy9zbWJpb3Nt
ZHJ2MmFwcC5kaXIvc3JjL21kcnYyX21haW4uY3BwLm8gLWMgL2hvbWUvcGF2by9vZ3V6L3Bhdm9v
cGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZq
enMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3
NzE2ZC1yMS9naXQvc3JjL21kcnYyX21haW4uY3BwCnwgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9o
b21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBj
YS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEu
MCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysr
LzExLjIuMC92ZWN0b3I6NzIsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1
ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9h
cm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5D
K2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvc2RidXNwbHVzL21lc3Nh
Z2UvdHlwZXMuaHBwOjE0LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXov
cGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJt
MTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytl
NGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL3NkYnVzcGx1cy9tZXNzYWdl
L2FwcGVuZC5ocHA6NSwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bh
dm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTEx
NzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRl
YTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9zZGJ1c3BsdXMvbWVzc2FnZS5o
cHA6NiwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1j
L2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3Bl
bmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1y
MS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9zZGJ1c3BsdXMvYnVzLmhwcDo3LAp8ICAgICAg
ICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJt
Yy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdu
dWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNy
b290L3Vzci9pbmNsdWRlL3NkYnVzcGx1cy9zZXJ2ZXIuaHBwOjMsCnwgICAgICAgICAgICAgICAg
ICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMv
YnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJp
b3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2lu
Y2x1ZGUveHl6L29wZW5ibWNfcHJvamVjdC9Mb2dnaW5nL0VudHJ5L3NlcnZlci5ocHA6NiwKfCAg
ICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9w
ZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51
eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUt
c3lzcm9vdC91c3IvaW5jbHVkZS9waG9zcGhvci1sb2dnaW5nL2Vsb2cuaHBwOjIsCnwgICAgICAg
ICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1j
L29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251
ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jv
b3QvdXNyL2luY2x1ZGUvcGhvc3Bob3ItbG9nZ2luZy9lbG9nLWVycm9ycy5ocHA6NSwKfCAgICAg
ICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5i
bWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1n
bnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9naXQvaW5jbHVk
ZS9zbWJpb3NfbWRydjIuaHBwOjE5LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZv
L29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dv
cmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVU
T0lOQytlNGVhMzc3MTZkLXIxL2dpdC9pbmNsdWRlL2NwdS5ocHA6MTgsCnwgICAgICAgICAgICAg
ICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5i
bWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9z
bWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvZ2l0L2luY2x1ZGUvbWRydjIu
aHBwOjE4LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5i
bWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1v
cGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZk
LXIxL2dpdC9zcmMvbWRydjJfbWFpbi5jcHA6MTc6CnwgL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVu
Ym1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMt
b3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2
ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9jKysvMTEuMi4wL2JpdHMvdmVjdG9yLnRj
YzogSW4gbWVtYmVyIGZ1bmN0aW9uICd2b2lkIHN0ZDo6dmVjdG9yPF9UcCwgX0FsbG9jPjo6X01f
cmVhbGxvY19pbnNlcnQoc3RkOjp2ZWN0b3I8X1RwLCBfQWxsb2M+OjppdGVyYXRvciwgX0FyZ3Mm
JiAuLi4pIFt3aXRoIF9BcmdzID0ge3NkX2J1c192dGFibGV9OyBfVHAgPSBzZF9idXNfdnRhYmxl
OyBfQWxsb2MgPSBzdGQ6OmFsbG9jYXRvcjxzZF9idXNfdnRhYmxlPl0nOgp8IC9ob21lL3Bhdm8v
b2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29y
ay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRP
SU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzExLjIuMC9i
aXRzL3ZlY3Rvci50Y2M6NDI2Ojc6IG5vdGU6IHBhcmFtZXRlciBwYXNzaW5nIGZvciBhcmd1bWVu
dCBvZiB0eXBlICdzdGQ6OnZlY3RvcjxzZF9idXNfdnRhYmxlPjo6aXRlcmF0b3InIGNoYW5nZWQg
aW4gR0NDIDcuMQp8ICAgNDI2IHwgICAgICAgdmVjdG9yPF9UcCwgX0FsbG9jPjo6CnwgICAgICAg
fCAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+CnwgL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1j
L2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3Bl
bmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1y
MS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9jKysvMTEuMi4wL2JpdHMvdmVjdG9yLnRjYzog
SW4gZnVuY3Rpb24gJ3N0ZDo6dmVjdG9yPF9UcCwgX0FsbG9jPjo6cmVmZXJlbmNlIHN0ZDo6dmVj
dG9yPF9UcCwgX0FsbG9jPjo6ZW1wbGFjZV9iYWNrKF9BcmdzJiYgLi4uKSBbd2l0aCBfQXJncyA9
IHtzZF9idXNfdnRhYmxlfTsgX1RwID0gc2RfYnVzX3Z0YWJsZTsgX0FsbG9jID0gc3RkOjphbGxv
Y2F0b3I8c2RfYnVzX3Z0YWJsZT5dJzoKfCAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNw
ZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1j
LWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3Jl
Y2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2MrKy8xMS4yLjAvYml0cy92ZWN0b3IudGNjOjEyMToy
ODogbm90ZTogcGFyYW1ldGVyIHBhc3NpbmcgZm9yIGFyZ3VtZW50IG9mIHR5cGUgJ19fZ251X2N4
eDo6X19ub3JtYWxfaXRlcmF0b3I8c2RfYnVzX3Z0YWJsZSosIHN0ZDo6dmVjdG9yPHNkX2J1c192
dGFibGU+ID4nIGNoYW5nZWQgaW4gR0NDIDcuMQp8ICAgMTIxIHwgICAgICAgICAgIF9NX3JlYWxs
b2NfaW5zZXJ0KGVuZCgpLCBzdGQ6OmZvcndhcmQ8X0FyZ3M+KF9fYXJncykuLi4pOwp8ICAgICAg
IHwgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+CnwgWzgvMTFdIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRv
cGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGlu
dXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9wZW5ibWMtbGludXgtZ251ZWFiaS9hcm0tb3Bl
bmJtYy1saW51eC1nbnVlYWJpLWcrKyAtREJPT1NUX0FMTF9OT19MSUIgLURCT09TVF9BU0lPX0RJ
U0FCTEVfVEhSRUFEUyAtREJPT1NUX0VSUk9SX0NPREVfSEVBREVSX09OTFkgLURCT09TVF9OT19S
VFRJIC1EQk9PU1RfTk9fVFlQRUlEIC1EQk9PU1RfU1lTVEVNX05PX0RFUFJFQ0FURUQgLURESU1N
X0RCVVMgLUkvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1j
L2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21i
aW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2dpdC9pbmNsdWRlIC1JL2hvbWUv
cGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3Rt
cC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dp
dEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9idWlsZCAtaXN5c3RlbSAvaG9tZS9wYXZvL29ndXovcGF2
b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3
Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVh
Mzc3MTZkLXIxL2J1aWxkL2Jvb3N0LXNyYyAtbWFybSAtbWNwdT1hcm0xMTc2anotcyAtZnN0YWNr
LXByb3RlY3Rvci1zdHJvbmcgIC1PMiAtRF9GT1JUSUZZX1NPVVJDRT0yIC1XZm9ybWF0IC1XZm9y
bWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5ICAtLXN5c3Jvb3Q9L2hvbWUvcGF2
by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93
b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFV
VE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdCAgLU8yIC1waXBlIC1nIC1mZWxpbWlu
YXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvcGF2by9vZ3V6
L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2Fy
bTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMr
ZTRlYTM3NzE2ZC1yMT0vdXNyL3NyYy9kZWJ1Zy9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0
ZWEzNzcxNmQtcjEgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21l
L3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90
bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtn
aXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjE9L3Vzci9zcmMvZGVidWcvc21iaW9zLW1kci8xLjArZ2l0
QVVUT0lOQytlNGVhMzc3MTZkLXIxICAgICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4
LW1hcD0vaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1
aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9z
LW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290PSAgICAgICAg
ICAgICAgICAgICAgICAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVu
Ym1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMt
b3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2
ZC1yMS9yZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4g
LXN0ZD1nbnUrKzIwIC1NRCAtTVQgQ01ha2VGaWxlcy9zbWJpb3NtZHJ2MmFwcC5kaXIvc3JjL21k
cnYyLmNwcC5vIC1NRiBDTWFrZUZpbGVzL3NtYmlvc21kcnYyYXBwLmRpci9zcmMvbWRydjIuY3Bw
Lm8uZCAtbyBDTWFrZUZpbGVzL3NtYmlvc21kcnYyYXBwLmRpci9zcmMvbWRydjIuY3BwLm8gLWMg
L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9l
cGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIv
MS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9naXQvc3JjL21kcnYyLmNwcAp8IEluIGZpbGUg
aW5jbHVkZWQgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9v
cGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVh
Ymkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290
L3Vzci9pbmNsdWRlL2MrKy8xMS4yLjAvdmVjdG9yOjcyLAp8ICAgICAgICAgICAgICAgICAgZnJv
bSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxk
L2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1k
ci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRl
L3NkYnVzcGx1cy9tZXNzYWdlL3R5cGVzLmhwcDoxNCwKfCAgICAgICAgICAgICAgICAgIGZyb20g
L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9l
cGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIv
MS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9z
ZGJ1c3BsdXMvbWVzc2FnZS9hcHBlbmQuaHBwOjUsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9o
b21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBj
YS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEu
MCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvc2Ri
dXNwbHVzL21lc3NhZ2UuaHBwOjYsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8v
b2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29y
ay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRP
SU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvc2RidXNwbHVzL2J1
cy5ocHA6NywKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVu
Ym1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMt
b3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2
ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9zZGJ1c3BsdXMvc2VydmVyLmhwcDozLAp8
ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVk
b3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxp
bnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lw
ZS1zeXNyb290L3Vzci9pbmNsdWRlL3h5ei9vcGVuYm1jX3Byb2plY3QvTG9nZ2luZy9FbnRyeS9z
ZXJ2ZXIuaHBwOjYsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZv
b3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2
anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEz
NzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvcGhvc3Bob3ItbG9nZ2luZy9lbG9n
LmhwcDoyLAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5i
bWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1v
cGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZk
LXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL3Bob3NwaG9yLWxvZ2dpbmcvZWxvZy1lcnJv
cnMuaHBwOjUsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3Bl
bmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpz
LW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcx
NmQtcjEvZ2l0L2luY2x1ZGUvc21iaW9zX21kcnYyLmhwcDoxOSwKfCAgICAgICAgICAgICAgICAg
IGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9i
dWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlv
cy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9naXQvaW5jbHVkZS9jcHUuaHBwOjE4
LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNw
ZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1j
LWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2dp
dC9pbmNsdWRlL21kcnYyLmhwcDoxOCwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2
by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93
b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFV
VE9JTkMrZTRlYTM3NzE2ZC1yMS9naXQvc3JjL21kcnYyLmNwcDoxNzoKfCAvaG9tZS9wYXZvL29n
dXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsv
YXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lO
QytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2MrKy8xMS4yLjAvYml0
cy92ZWN0b3IudGNjOiBJbiBtZW1iZXIgZnVuY3Rpb24gJ3ZvaWQgc3RkOjp2ZWN0b3I8X1RwLCBf
QWxsb2M+OjpfTV9yZWFsbG9jX2luc2VydChzdGQ6OnZlY3RvcjxfVHAsIF9BbGxvYz46Oml0ZXJh
dG9yLCBfQXJncyYmIC4uLikgW3dpdGggX0FyZ3MgPSB7Y29uc3QgYm9vc3Q6OmFzaW86OmRldGFp
bDo6dGltZXJfcXVldWU8Ym9vc3Q6OmFzaW86OmRldGFpbDo6Y2hyb25vX3RpbWVfdHJhaXRzPHN0
ZDo6Y2hyb25vOjpfVjI6OnN0ZWFkeV9jbG9jaywgYm9vc3Q6OmFzaW86OndhaXRfdHJhaXRzPHN0
ZDo6Y2hyb25vOjpfVjI6OnN0ZWFkeV9jbG9jaz4gPiA+OjpoZWFwX2VudHJ5Jn07IF9UcCA9IGJv
b3N0Ojphc2lvOjpkZXRhaWw6OnRpbWVyX3F1ZXVlPGJvb3N0Ojphc2lvOjpkZXRhaWw6OmNocm9u
b190aW1lX3RyYWl0czxzdGQ6OmNocm9ubzo6X1YyOjpzdGVhZHlfY2xvY2ssIGJvb3N0Ojphc2lv
Ojp3YWl0X3RyYWl0czxzdGQ6OmNocm9ubzo6X1YyOjpzdGVhZHlfY2xvY2s+ID4gPjo6aGVhcF9l
bnRyeTsgX0FsbG9jID0gc3RkOjphbGxvY2F0b3I8Ym9vc3Q6OmFzaW86OmRldGFpbDo6dGltZXJf
cXVldWU8Ym9vc3Q6OmFzaW86OmRldGFpbDo6Y2hyb25vX3RpbWVfdHJhaXRzPHN0ZDo6Y2hyb25v
OjpfVjI6OnN0ZWFkeV9jbG9jaywgYm9vc3Q6OmFzaW86OndhaXRfdHJhaXRzPHN0ZDo6Y2hyb25v
OjpfVjI6OnN0ZWFkeV9jbG9jaz4gPiA+OjpoZWFwX2VudHJ5Pl0nOgp8IC9ob21lL3Bhdm8vb2d1
ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9h
cm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5D
K2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzExLjIuMC9iaXRz
L3ZlY3Rvci50Y2M6NDI2Ojc6IG5vdGU6IHBhcmFtZXRlciBwYXNzaW5nIGZvciBhcmd1bWVudCBv
ZiB0eXBlICdzdGQ6OnZlY3Rvcjxib29zdDo6YXNpbzo6ZGV0YWlsOjp0aW1lcl9xdWV1ZTxib29z
dDo6YXNpbzo6ZGV0YWlsOjpjaHJvbm9fdGltZV90cmFpdHM8c3RkOjpjaHJvbm86Ol9WMjo6c3Rl
YWR5X2Nsb2NrLCBib29zdDo6YXNpbzo6d2FpdF90cmFpdHM8c3RkOjpjaHJvbm86Ol9WMjo6c3Rl
YWR5X2Nsb2NrPiA+ID46OmhlYXBfZW50cnksIHN0ZDo6YWxsb2NhdG9yPGJvb3N0Ojphc2lvOjpk
ZXRhaWw6OnRpbWVyX3F1ZXVlPGJvb3N0Ojphc2lvOjpkZXRhaWw6OmNocm9ub190aW1lX3RyYWl0
czxzdGQ6OmNocm9ubzo6X1YyOjpzdGVhZHlfY2xvY2ssIGJvb3N0Ojphc2lvOjp3YWl0X3RyYWl0
czxzdGQ6OmNocm9ubzo6X1YyOjpzdGVhZHlfY2xvY2s+ID4gPjo6aGVhcF9lbnRyeT4gPjo6aXRl
cmF0b3InIGNoYW5nZWQgaW4gR0NDIDcuMQp8ICAgNDI2IHwgICAgICAgdmVjdG9yPF9UcCwgX0Fs
bG9jPjo6CnwgICAgICAgfCAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+CnwgSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5i
bWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9z
bWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNy
L2luY2x1ZGUvYysrLzExLjIuMC92ZWN0b3I6NjcsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9o
b21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBj
YS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEu
MCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvc2Ri
dXNwbHVzL21lc3NhZ2UvdHlwZXMuaHBwOjE0LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9t
ZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2Ev
dG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjAr
Z2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL3NkYnVz
cGx1cy9tZXNzYWdlL2FwcGVuZC5ocHA6NSwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUv
cGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3Rt
cC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dp
dEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9zZGJ1c3Bs
dXMvbWVzc2FnZS5ocHA6NiwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6
L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2Fy
bTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMr
ZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9zZGJ1c3BsdXMvYnVzLmhw
cDo3LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMv
YXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVu
Ym1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIx
L3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL3NkYnVzcGx1cy9zZXJ2ZXIuaHBwOjMsCnwgICAg
ICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVu
Ym1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgt
Z251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5
c3Jvb3QvdXNyL2luY2x1ZGUveHl6L29wZW5ibWNfcHJvamVjdC9Mb2dnaW5nL0VudHJ5L3NlcnZl
ci5ocHA6NiwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVu
Ym1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMt
b3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2
ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9waG9zcGhvci1sb2dnaW5nL2Vsb2cuaHBw
OjIsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9h
c3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5i
bWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEv
cmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvcGhvc3Bob3ItbG9nZ2luZy9lbG9nLWVycm9ycy5o
cHA6NSwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1j
L2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3Bl
bmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1y
MS9naXQvaW5jbHVkZS9zbWJpb3NfbWRydjIuaHBwOjE5LAp8ICAgICAgICAgICAgICAgICAgZnJv
bSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxk
L2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1k
ci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2dpdC9pbmNsdWRlL2NwdS5ocHA6MTgsCnwg
ICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRv
cGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGlu
dXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvZ2l0L2lu
Y2x1ZGUvbWRydjIuaHBwOjE4LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29n
dXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsv
YXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lO
QytlNGVhMzc3MTZkLXIxL2dpdC9zcmMvbWRydjIuY3BwOjE3Ogp8IC9ob21lL3Bhdm8vb2d1ei9w
YXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0x
MTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0
ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzExLjIuMC9iaXRzL3N0
bF92ZWN0b3IuaDogSW4gbWVtYmVyIGZ1bmN0aW9uICd2b2lkIGJvb3N0Ojphc2lvOjpkZXRhaWw6
OmVwb2xsX3JlYWN0b3I6OnNjaGVkdWxlX3RpbWVyKGJvb3N0Ojphc2lvOjpkZXRhaWw6OnRpbWVy
X3F1ZXVlPFRpbWVfVHJhaXRzPiYsIGNvbnN0IHR5cGVuYW1lIFRpbWVfVHJhaXRzOjp0aW1lX3R5
cGUmLCB0eXBlbmFtZSBib29zdDo6YXNpbzo6ZGV0YWlsOjp0aW1lcl9xdWV1ZTxUaW1lX1RyYWl0
cz46OnBlcl90aW1lcl9kYXRhJiwgYm9vc3Q6OmFzaW86OmRldGFpbDo6d2FpdF9vcCopIFt3aXRo
IFRpbWVfVHJhaXRzID0gYm9vc3Q6OmFzaW86OmRldGFpbDo6Y2hyb25vX3RpbWVfdHJhaXRzPHN0
ZDo6Y2hyb25vOjpfVjI6OnN0ZWFkeV9jbG9jaywgYm9vc3Q6OmFzaW86OndhaXRfdHJhaXRzPHN0
ZDo6Y2hyb25vOjpfVjI6OnN0ZWFkeV9jbG9jaz4gPl0nOgp8IC9ob21lL3Bhdm8vb2d1ei9wYXZv
b3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2
anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEz
NzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzExLjIuMC9iaXRzL3N0bF92
ZWN0b3IuaDoxMTk4OjI4OiBub3RlOiBwYXJhbWV0ZXIgcGFzc2luZyBmb3IgYXJndW1lbnQgb2Yg
dHlwZSAnX19nbnVfY3h4OjpfX25vcm1hbF9pdGVyYXRvcjxib29zdDo6YXNpbzo6ZGV0YWlsOjp0
aW1lcl9xdWV1ZTxib29zdDo6YXNpbzo6ZGV0YWlsOjpjaHJvbm9fdGltZV90cmFpdHM8c3RkOjpj
aHJvbm86Ol9WMjo6c3RlYWR5X2Nsb2NrLCBib29zdDo6YXNpbzo6d2FpdF90cmFpdHM8c3RkOjpj
aHJvbm86Ol9WMjo6c3RlYWR5X2Nsb2NrPiA+ID46OmhlYXBfZW50cnkqLCBzdGQ6OnZlY3Rvcjxi
b29zdDo6YXNpbzo6ZGV0YWlsOjp0aW1lcl9xdWV1ZTxib29zdDo6YXNpbzo6ZGV0YWlsOjpjaHJv
bm9fdGltZV90cmFpdHM8c3RkOjpjaHJvbm86Ol9WMjo6c3RlYWR5X2Nsb2NrLCBib29zdDo6YXNp
bzo6d2FpdF90cmFpdHM8c3RkOjpjaHJvbm86Ol9WMjo6c3RlYWR5X2Nsb2NrPiA+ID46OmhlYXBf
ZW50cnksIHN0ZDo6YWxsb2NhdG9yPGJvb3N0Ojphc2lvOjpkZXRhaWw6OnRpbWVyX3F1ZXVlPGJv
b3N0Ojphc2lvOjpkZXRhaWw6OmNocm9ub190aW1lX3RyYWl0czxzdGQ6OmNocm9ubzo6X1YyOjpz
dGVhZHlfY2xvY2ssIGJvb3N0Ojphc2lvOjp3YWl0X3RyYWl0czxzdGQ6OmNocm9ubzo6X1YyOjpz
dGVhZHlfY2xvY2s+ID4gPjo6aGVhcF9lbnRyeT4gPiA+JyBjaGFuZ2VkIGluIEdDQyA3LjEKfCAg
MTE5OCB8ICAgICAgICAgICBfTV9yZWFsbG9jX2luc2VydChlbmQoKSwgX194KTsKfCAgICAgICB8
ICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fgp8IFs5LzExXSAvaG9tZS9w
YXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1w
L3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0
QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1v
cGVuYm1jLWxpbnV4LWdudWVhYmkvYXJtLW9wZW5ibWMtbGludXgtZ251ZWFiaS1nKysgLURCT09T
VF9BTExfTk9fTElCIC1EQk9PU1RfQVNJT19ESVNBQkxFX1RIUkVBRFMgLURCT09TVF9FUlJPUl9D
T0RFX0hFQURFUl9PTkxZIC1EQk9PU1RfTk9fUlRUSSAtREJPT1NUX05PX1RZUEVJRCAtREJPT1NU
X1NZU1RFTV9OT19ERVBSRUNBVEVEIC1JL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVl
ZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1s
aW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9naXQv
aW5jbHVkZSAtSS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5i
bWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9z
bWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvYnVpbGQgLWlzeXN0ZW0gL2hv
bWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNh
L3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4w
K2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9idWlsZC9ib29zdC1zcmMgLW1hcm0gLW1jcHU9YXJt
MTE3Nmp6LXMgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9
MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAgLS1z
eXNyb290PS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMv
YnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJp
b3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QgIC1PMiAt
cGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLWZtYWNyby1wcmVmaXgtbWFw
PS9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQv
ZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRy
LzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjE9L3Vzci9zcmMvZGVidWcvc21iaW9zLW1kci8x
LjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxICAgICAgICAgICAgICAgICAgICAgIC1mZGVidWct
cHJlZml4LW1hcD0vaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVu
Ym1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkv
c21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxPS91c3Ivc3JjL2RlYnVnL3Nt
Ymlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMSAgICAgICAgICAgICAgICAgICAg
ICAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9w
ZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51
eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUt
c3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3Bh
dm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAv
d29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRB
VVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlPSAgLWZ2aXNpYmlsaXR5
LWlubGluZXMtaGlkZGVuIC1zdGQ9Z251KysyMCAtTUQgLU1UIENNYWtlRmlsZXMvY3B1aW5mb2Fw
cC5kaXIvc3JjL2NwdWluZm9fdXRpbHMuY3BwLm8gLU1GIENNYWtlRmlsZXMvY3B1aW5mb2FwcC5k
aXIvc3JjL2NwdWluZm9fdXRpbHMuY3BwLm8uZCAtbyBDTWFrZUZpbGVzL2NwdWluZm9hcHAuZGly
L3NyYy9jcHVpbmZvX3V0aWxzLmNwcC5vIC1jIC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9h
c3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5i
bWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEv
Z2l0L3NyYy9jcHVpbmZvX3V0aWxzLmNwcAp8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9w
YXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1w
L3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0
QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2MrKy8xMS4y
LjAvdmVjdG9yOjcyLAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2
b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3
Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVh
Mzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2MrKy8xMS4yLjAvZnVuY3Rpb25h
bDo2MiwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1j
L2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3Bl
bmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1y
MS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2RldGFpbC9mdW5jdGlvbmFs
LmhwcDoyMCwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVu
Ym1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMt
b3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2
ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2Fzc29jaWF0ZWRfYWxs
b2NhdG9yLmhwcDoyMSwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bh
dm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTEx
NzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRl
YTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2RldGFpbC9o
YW5kbGVyX2FsbG9jX2hlbHBlcnMuaHBwOjIzLAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9t
ZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2Ev
dG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjAr
Z2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2Jvb3N0
L2FzaW8vZGV0YWlsL2JpbmRfaGFuZGxlci5ocHA6MjAsCnwgICAgICAgICAgICAgICAgICBmcm9t
IC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQv
ZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRy
LzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUv
Ym9vc3QvYXNpby9kZXRhaWwvd3JhcHBlZF9oYW5kbGVyLmhwcDoxOCwKfCAgICAgICAgICAgICAg
ICAgIGZyb20gL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJt
Yy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3Nt
Ymlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3Iv
aW5jbHVkZS9ib29zdC9hc2lvL2lvX2NvbnRleHQuaHBwOjI0LAp8ICAgICAgICAgICAgICAgICAg
ZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1
aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9z
LW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3MTZkLXIxL2dpdC9pbmNsdWRlL2NwdWluZm9fdXRp
bHMuaHBwOjE3LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9wYXZvL29ndXovcGF2b29w
ZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJtMTE3Nmp6
cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytlNGVhMzc3
MTZkLXIxL2dpdC9zcmMvY3B1aW5mb191dGlscy5jcHA6MTU6CnwgL2hvbWUvcGF2by9vZ3V6L3Bh
dm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93b3JrL2FybTEx
NzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFVVE9JTkMrZTRl
YTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9jKysvMTEuMi4wL2JpdHMvdmVj
dG9yLnRjYzogSW4gbWVtYmVyIGZ1bmN0aW9uICd2b2lkIHN0ZDo6dmVjdG9yPF9UcCwgX0FsbG9j
Pjo6X01fcmVhbGxvY19pbnNlcnQoc3RkOjp2ZWN0b3I8X1RwLCBfQWxsb2M+OjppdGVyYXRvciwg
X0FyZ3MmJiAuLi4pIFt3aXRoIF9BcmdzID0ge3N0ZDo6cGFpcjxzdGQ6Ol9fY3h4MTE6OmJhc2lj
X3N0cmluZzxjaGFyLCBzdGQ6OmNoYXJfdHJhaXRzPGNoYXI+LCBzdGQ6OmFsbG9jYXRvcjxjaGFy
PiA+LCBzdGQ6OnZhcmlhbnQ8c3RkOjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hhciwgc3RkOjpj
aGFyX3RyYWl0czxjaGFyPiwgc3RkOjphbGxvY2F0b3I8Y2hhcj4gPiwgYm9vbCwgdW5zaWduZWQg
Y2hhciwgc2hvcnQgdW5zaWduZWQgaW50LCBzaG9ydCBpbnQsIHVuc2lnbmVkIGludCwgaW50LCBs
b25nIGxvbmcgdW5zaWduZWQgaW50LCBsb25nIGxvbmcgaW50LCBkb3VibGUsIHNkYnVzcGx1czo6
bWVzc2FnZTo6ZGV0YWlsczo6c3RyaW5nX3BhdGhfd3JhcHBlcj4gPn07IF9UcCA9IHN0ZDo6cGFp
cjxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyPiwgc3RkOjp2YXJpYW50PHN0ZDo6X19j
eHgxMTo6YmFzaWNfc3RyaW5nPGNoYXIsIHN0ZDo6Y2hhcl90cmFpdHM8Y2hhcj4sIHN0ZDo6YWxs
b2NhdG9yPGNoYXI+ID4sIGJvb2wsIHVuc2lnbmVkIGNoYXIsIHNob3J0IHVuc2lnbmVkIGludCwg
c2hvcnQgaW50LCB1bnNpZ25lZCBpbnQsIGludCwgbG9uZyBsb25nIHVuc2lnbmVkIGludCwgbG9u
ZyBsb25nIGludCwgZG91YmxlLCBzZGJ1c3BsdXM6Om1lc3NhZ2U6OmRldGFpbHM6OnN0cmluZ19w
YXRoX3dyYXBwZXI+ID47IF9BbGxvYyA9IHN0ZDo6YWxsb2NhdG9yPHN0ZDo6cGFpcjxzdGQ6Ol9f
Y3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyPiwgc3RkOjp2YXJpYW50PHN0ZDo6X19jeHgxMTo6YmFz
aWNfc3RyaW5nPGNoYXIsIHN0ZDo6Y2hhcl90cmFpdHM8Y2hhcj4sIHN0ZDo6YWxsb2NhdG9yPGNo
YXI+ID4sIGJvb2wsIHVuc2lnbmVkIGNoYXIsIHNob3J0IHVuc2lnbmVkIGludCwgc2hvcnQgaW50
LCB1bnNpZ25lZCBpbnQsIGludCwgbG9uZyBsb25nIHVuc2lnbmVkIGludCwgbG9uZyBsb25nIGlu
dCwgZG91YmxlLCBzZGJ1c3BsdXM6Om1lc3NhZ2U6OmRldGFpbHM6OnN0cmluZ19wYXRoX3dyYXBw
ZXI+ID4gPl0nOgp8IC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29w
ZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFi
aS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3Qv
dXNyL2luY2x1ZGUvYysrLzExLjIuMC9iaXRzL3ZlY3Rvci50Y2M6NDI2Ojc6IG5vdGU6IHBhcmFt
ZXRlciBwYXNzaW5nIGZvciBhcmd1bWVudCBvZiB0eXBlICdzdGQ6OnZlY3RvcjxzdGQ6OnBhaXI8
c3RkOjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hhcj4sIHN0ZDo6dmFyaWFudDxzdGQ6Ol9fY3h4
MTE6OmJhc2ljX3N0cmluZzxjaGFyLCBzdGQ6OmNoYXJfdHJhaXRzPGNoYXI+LCBzdGQ6OmFsbG9j
YXRvcjxjaGFyPiA+LCBib29sLCB1bnNpZ25lZCBjaGFyLCBzaG9ydCB1bnNpZ25lZCBpbnQsIHNo
b3J0IGludCwgdW5zaWduZWQgaW50LCBpbnQsIGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQsIGxvbmcg
bG9uZyBpbnQsIGRvdWJsZSwgc2RidXNwbHVzOjptZXNzYWdlOjpkZXRhaWxzOjpzdHJpbmdfcGF0
aF93cmFwcGVyPiA+LCBzdGQ6OmFsbG9jYXRvcjxzdGQ6OnBhaXI8c3RkOjpfX2N4eDExOjpiYXNp
Y19zdHJpbmc8Y2hhcj4sIHN0ZDo6dmFyaWFudDxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxj
aGFyLCBzdGQ6OmNoYXJfdHJhaXRzPGNoYXI+LCBzdGQ6OmFsbG9jYXRvcjxjaGFyPiA+LCBib29s
LCB1bnNpZ25lZCBjaGFyLCBzaG9ydCB1bnNpZ25lZCBpbnQsIHNob3J0IGludCwgdW5zaWduZWQg
aW50LCBpbnQsIGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQsIGxvbmcgbG9uZyBpbnQsIGRvdWJsZSwg
c2RidXNwbHVzOjptZXNzYWdlOjpkZXRhaWxzOjpzdHJpbmdfcGF0aF93cmFwcGVyPiA+ID4gPjo6
aXRlcmF0b3InIGNoYW5nZWQgaW4gR0NDIDcuMQp8ICAgNDI2IHwgICAgICAgdmVjdG9yPF9UcCwg
X0FsbG9jPjo6CnwgICAgICAgfCAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+CnwgL2hvbWUvcGF2
by9vZ3V6L3Bhdm9vcGVuYm1jL2FzcGVlZG9wZW5ibWMvb3BlbmJtYy9idWlsZC9lcGNhL3RtcC93
b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL3NtYmlvcy1tZHIvMS4wK2dpdEFV
VE9JTkMrZTRlYTM3NzE2ZC1yMS9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9jKysvMTEuMi4w
L2JpdHMvdmVjdG9yLnRjYzogSW4gbWVtYmVyIGZ1bmN0aW9uICd2b2lkIHN0ZDo6dmVjdG9yPF9U
cCwgX0FsbG9jPjo6X01fcmVhbGxvY19pbnNlcnQoc3RkOjp2ZWN0b3I8X1RwLCBfQWxsb2M+Ojpp
dGVyYXRvciwgX0FyZ3MmJiAuLi4pIFt3aXRoIF9BcmdzID0ge3N0ZDo6cGFpcjxzdGQ6Ol9fY3h4
MTE6OmJhc2ljX3N0cmluZzxjaGFyLCBzdGQ6OmNoYXJfdHJhaXRzPGNoYXI+LCBzdGQ6OmFsbG9j
YXRvcjxjaGFyPiA+LCBzdGQ6OnZhcmlhbnQ8Ym9vbCwgdW5zaWduZWQgY2hhciwgc2hvcnQgdW5z
aWduZWQgaW50LCBzaG9ydCBpbnQsIHVuc2lnbmVkIGludCwgaW50LCBsb25nIGxvbmcgdW5zaWdu
ZWQgaW50LCBsb25nIGxvbmcgaW50LCBkb3VibGUsIHN0ZDo6X19jeHgxMTo6YmFzaWNfc3RyaW5n
PGNoYXIsIHN0ZDo6Y2hhcl90cmFpdHM8Y2hhcj4sIHN0ZDo6YWxsb2NhdG9yPGNoYXI+ID4sIHNk
YnVzcGx1czo6bWVzc2FnZTo6ZGV0YWlsczo6c3RyaW5nX3BhdGhfd3JhcHBlcj4gPn07IF9UcCA9
IHN0ZDo6cGFpcjxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyPiwgc3RkOjp2YXJpYW50
PGJvb2wsIHVuc2lnbmVkIGNoYXIsIHNob3J0IHVuc2lnbmVkIGludCwgc2hvcnQgaW50LCB1bnNp
Z25lZCBpbnQsIGludCwgbG9uZyBsb25nIHVuc2lnbmVkIGludCwgbG9uZyBsb25nIGludCwgZG91
YmxlLCBzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyLCBzdGQ6OmNoYXJfdHJhaXRzPGNo
YXI+LCBzdGQ6OmFsbG9jYXRvcjxjaGFyPiA+LCBzZGJ1c3BsdXM6Om1lc3NhZ2U6OmRldGFpbHM6
OnN0cmluZ19wYXRoX3dyYXBwZXI+ID47IF9BbGxvYyA9IHN0ZDo6YWxsb2NhdG9yPHN0ZDo6cGFp
cjxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyPiwgc3RkOjp2YXJpYW50PGJvb2wsIHVu
c2lnbmVkIGNoYXIsIHNob3J0IHVuc2lnbmVkIGludCwgc2hvcnQgaW50LCB1bnNpZ25lZCBpbnQs
IGludCwgbG9uZyBsb25nIHVuc2lnbmVkIGludCwgbG9uZyBsb25nIGludCwgZG91YmxlLCBzdGQ6
Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyLCBzdGQ6OmNoYXJfdHJhaXRzPGNoYXI+LCBzdGQ6
OmFsbG9jYXRvcjxjaGFyPiA+LCBzZGJ1c3BsdXM6Om1lc3NhZ2U6OmRldGFpbHM6OnN0cmluZ19w
YXRoX3dyYXBwZXI+ID4gPl0nOgp8IC9ob21lL3Bhdm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRv
cGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGlu
dXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBl
LXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzExLjIuMC9iaXRzL3ZlY3Rvci50Y2M6NDI2Ojc6IG5v
dGU6IHBhcmFtZXRlciBwYXNzaW5nIGZvciBhcmd1bWVudCBvZiB0eXBlICdzdGQ6OnZlY3Rvcjxz
dGQ6OnBhaXI8c3RkOjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hhcj4sIHN0ZDo6dmFyaWFudDxi
b29sLCB1bnNpZ25lZCBjaGFyLCBzaG9ydCB1bnNpZ25lZCBpbnQsIHNob3J0IGludCwgdW5zaWdu
ZWQgaW50LCBpbnQsIGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQsIGxvbmcgbG9uZyBpbnQsIGRvdWJs
ZSwgc3RkOjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hhciwgc3RkOjpjaGFyX3RyYWl0czxjaGFy
Piwgc3RkOjphbGxvY2F0b3I8Y2hhcj4gPiwgc2RidXNwbHVzOjptZXNzYWdlOjpkZXRhaWxzOjpz
dHJpbmdfcGF0aF93cmFwcGVyPiA+LCBzdGQ6OmFsbG9jYXRvcjxzdGQ6OnBhaXI8c3RkOjpfX2N4
eDExOjpiYXNpY19zdHJpbmc8Y2hhcj4sIHN0ZDo6dmFyaWFudDxib29sLCB1bnNpZ25lZCBjaGFy
LCBzaG9ydCB1bnNpZ25lZCBpbnQsIHNob3J0IGludCwgdW5zaWduZWQgaW50LCBpbnQsIGxvbmcg
bG9uZyB1bnNpZ25lZCBpbnQsIGxvbmcgbG9uZyBpbnQsIGRvdWJsZSwgc3RkOjpfX2N4eDExOjpi
YXNpY19zdHJpbmc8Y2hhciwgc3RkOjpjaGFyX3RyYWl0czxjaGFyPiwgc3RkOjphbGxvY2F0b3I8
Y2hhcj4gPiwgc2RidXNwbHVzOjptZXNzYWdlOjpkZXRhaWxzOjpzdHJpbmdfcGF0aF93cmFwcGVy
PiA+ID4gPjo6aXRlcmF0b3InIGNoYW5nZWQgaW4gR0NDIDcuMQp8IC9ob21lL3Bhdm8vb2d1ei9w
YXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAvd29yay9hcm0x
MTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRBVVRPSU5DK2U0
ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzExLjIuMC9iaXRzL3Zl
Y3Rvci50Y2M6IEluIHN0YXRpYyBtZW1iZXIgZnVuY3Rpb24gJ3N0YXRpYyB2b2lkIHNkYnVzcGx1
czo6bWVzc2FnZTo6ZGV0YWlsczo6cmVhZF9zaW5nbGU8VCwgdHlwZW5hbWUgc3RkOjplbmFibGVf
aWY8aGFzX2VtcGxhY2VfYmFja19tZXRob2RfdjxUPiwgdm9pZD46OnR5cGU+OjpvcChzZGJ1c3Bs
dXM6OlNkQnVzSW50ZXJmYWNlKiwgc2RfYnVzX21lc3NhZ2UqLCBTJiYpIFt3aXRoIFMgPSBzdGQ6
OnZlY3RvcjxzdGQ6OnBhaXI8c3RkOjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hhcj4sIHN0ZDo6
dmFyaWFudDxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyLCBzdGQ6OmNoYXJfdHJhaXRz
PGNoYXI+LCBzdGQ6OmFsbG9jYXRvcjxjaGFyPiA+LCBib29sLCB1bnNpZ25lZCBjaGFyLCBzaG9y
dCB1bnNpZ25lZCBpbnQsIHNob3J0IGludCwgdW5zaWduZWQgaW50LCBpbnQsIGxvbmcgbG9uZyB1
bnNpZ25lZCBpbnQsIGxvbmcgbG9uZyBpbnQsIGRvdWJsZSwgc2RidXNwbHVzOjptZXNzYWdlOjpk
ZXRhaWxzOjpzdHJpbmdfcGF0aF93cmFwcGVyPiA+LCBzdGQ6OmFsbG9jYXRvcjxzdGQ6OnBhaXI8
c3RkOjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hhcj4sIHN0ZDo6dmFyaWFudDxzdGQ6Ol9fY3h4
MTE6OmJhc2ljX3N0cmluZzxjaGFyLCBzdGQ6OmNoYXJfdHJhaXRzPGNoYXI+LCBzdGQ6OmFsbG9j
YXRvcjxjaGFyPiA+LCBib29sLCB1bnNpZ25lZCBjaGFyLCBzaG9ydCB1bnNpZ25lZCBpbnQsIHNo
b3J0IGludCwgdW5zaWduZWQgaW50LCBpbnQsIGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQsIGxvbmcg
bG9uZyBpbnQsIGRvdWJsZSwgc2RidXNwbHVzOjptZXNzYWdlOjpkZXRhaWxzOjpzdHJpbmdfcGF0
aF93cmFwcGVyPiA+ID4gPiY7IFQgPSBzdGQ6OnZlY3RvcjxzdGQ6OnBhaXI8c3RkOjpfX2N4eDEx
OjpiYXNpY19zdHJpbmc8Y2hhcj4sIHN0ZDo6dmFyaWFudDxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0
cmluZzxjaGFyLCBzdGQ6OmNoYXJfdHJhaXRzPGNoYXI+LCBzdGQ6OmFsbG9jYXRvcjxjaGFyPiA+
LCBib29sLCB1bnNpZ25lZCBjaGFyLCBzaG9ydCB1bnNpZ25lZCBpbnQsIHNob3J0IGludCwgdW5z
aWduZWQgaW50LCBpbnQsIGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQsIGxvbmcgbG9uZyBpbnQsIGRv
dWJsZSwgc2RidXNwbHVzOjptZXNzYWdlOjpkZXRhaWxzOjpzdHJpbmdfcGF0aF93cmFwcGVyPiA+
LCBzdGQ6OmFsbG9jYXRvcjxzdGQ6OnBhaXI8c3RkOjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hh
cj4sIHN0ZDo6dmFyaWFudDxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyLCBzdGQ6OmNo
YXJfdHJhaXRzPGNoYXI+LCBzdGQ6OmFsbG9jYXRvcjxjaGFyPiA+LCBib29sLCB1bnNpZ25lZCBj
aGFyLCBzaG9ydCB1bnNpZ25lZCBpbnQsIHNob3J0IGludCwgdW5zaWduZWQgaW50LCBpbnQsIGxv
bmcgbG9uZyB1bnNpZ25lZCBpbnQsIGxvbmcgbG9uZyBpbnQsIGRvdWJsZSwgc2RidXNwbHVzOjpt
ZXNzYWdlOjpkZXRhaWxzOjpzdHJpbmdfcGF0aF93cmFwcGVyPiA+ID4gPl0nOgp8IC9ob21lL3Bh
dm8vb2d1ei9wYXZvb3BlbmJtYy9hc3BlZWRvcGVuYm1jL29wZW5ibWMvYnVpbGQvZXBjYS90bXAv
d29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9zbWJpb3MtbWRyLzEuMCtnaXRB
VVRPSU5DK2U0ZWEzNzcxNmQtcjEvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzExLjIu
MC9iaXRzL3ZlY3Rvci50Y2M6MTIxOjI4OiBub3RlOiBwYXJhbWV0ZXIgcGFzc2luZyBmb3IgYXJn
dW1lbnQgb2YgdHlwZSAnX19nbnVfY3h4OjpfX25vcm1hbF9pdGVyYXRvcjxzdGQ6OnBhaXI8c3Rk
OjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hhcj4sIHN0ZDo6dmFyaWFudDxzdGQ6Ol9fY3h4MTE6
OmJhc2ljX3N0cmluZzxjaGFyLCBzdGQ6OmNoYXJfdHJhaXRzPGNoYXI+LCBzdGQ6OmFsbG9jYXRv
cjxjaGFyPiA+LCBib29sLCB1bnNpZ25lZCBjaGFyLCBzaG9ydCB1bnNpZ25lZCBpbnQsIHNob3J0
IGludCwgdW5zaWduZWQgaW50LCBpbnQsIGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQsIGxvbmcgbG9u
ZyBpbnQsIGRvdWJsZSwgc2RidXNwbHVzOjptZXNzYWdlOjpkZXRhaWxzOjpzdHJpbmdfcGF0aF93
cmFwcGVyPiA+Kiwgc3RkOjp2ZWN0b3I8c3RkOjpwYWlyPHN0ZDo6X19jeHgxMTo6YmFzaWNfc3Ry
aW5nPGNoYXI+LCBzdGQ6OnZhcmlhbnQ8c3RkOjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hhciwg
c3RkOjpjaGFyX3RyYWl0czxjaGFyPiwgc3RkOjphbGxvY2F0b3I8Y2hhcj4gPiwgYm9vbCwgdW5z
aWduZWQgY2hhciwgc2hvcnQgdW5zaWduZWQgaW50LCBzaG9ydCBpbnQsIHVuc2lnbmVkIGludCwg
aW50LCBsb25nIGxvbmcgdW5zaWduZWQgaW50LCBsb25nIGxvbmcgaW50LCBkb3VibGUsIHNkYnVz
cGx1czo6bWVzc2FnZTo6ZGV0YWlsczo6c3RyaW5nX3BhdGhfd3JhcHBlcj4gPiwgc3RkOjphbGxv
Y2F0b3I8c3RkOjpwYWlyPHN0ZDo6X19jeHgxMTo6YmFzaWNfc3RyaW5nPGNoYXI+LCBzdGQ6OnZh
cmlhbnQ8c3RkOjpfX2N4eDExOjpiYXNpY19zdHJpbmc8Y2hhciwgc3RkOjpjaGFyX3RyYWl0czxj
aGFyPiwgc3RkOjphbGxvY2F0b3I8Y2hhcj4gPiwgYm9vbCwgdW5zaWduZWQgY2hhciwgc2hvcnQg
dW5zaWduZWQgaW50LCBzaG9ydCBpbnQsIHVuc2lnbmVkIGludCwgaW50LCBsb25nIGxvbmcgdW5z
aWduZWQgaW50LCBsb25nIGxvbmcgaW50LCBkb3VibGUsIHNkYnVzcGx1czo6bWVzc2FnZTo6ZGV0
YWlsczo6c3RyaW5nX3BhdGhfd3JhcHBlcj4gPiA+ID4gPicgY2hhbmdlZCBpbiBHQ0MgNy4xCnwg
ICAxMjEgfCAgICAgICAgICAgX01fcmVhbGxvY19pbnNlcnQoZW5kKCksIHN0ZDo6Zm9yd2FyZDxf
QXJncz4oX19hcmdzKS4uLik7CnwgICAgICAgfCAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5e
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KfCAvaG9tZS9wYXZvL29ndXov
cGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1wL3dvcmsvYXJt
MTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0QVVUT0lOQytl
NGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2MrKy8xMS4yLjAvYml0cy92
ZWN0b3IudGNjOiBJbiBzdGF0aWMgbWVtYmVyIGZ1bmN0aW9uICdzdGF0aWMgdm9pZCBzZGJ1c3Bs
dXM6Om1lc3NhZ2U6OmRldGFpbHM6OnJlYWRfc2luZ2xlPFQsIHR5cGVuYW1lIHN0ZDo6ZW5hYmxl
X2lmPGhhc19lbXBsYWNlX2JhY2tfbWV0aG9kX3Y8VD4sIHZvaWQ+Ojp0eXBlPjo6b3Aoc2RidXNw
bHVzOjpTZEJ1c0ludGVyZmFjZSosIHNkX2J1c19tZXNzYWdlKiwgUyYmKSBbd2l0aCBTID0gc3Rk
Ojp2ZWN0b3I8c3RkOjpwYWlyPHN0ZDo6X19jeHgxMTo6YmFzaWNfc3RyaW5nPGNoYXI+LCBzdGQ6
OnZhcmlhbnQ8Ym9vbCwgdW5zaWduZWQgY2hhciwgc2hvcnQgdW5zaWduZWQgaW50LCBzaG9ydCBp
bnQsIHVuc2lnbmVkIGludCwgaW50LCBsb25nIGxvbmcgdW5zaWduZWQgaW50LCBsb25nIGxvbmcg
aW50LCBkb3VibGUsIHN0ZDo6X19jeHgxMTo6YmFzaWNfc3RyaW5nPGNoYXIsIHN0ZDo6Y2hhcl90
cmFpdHM8Y2hhcj4sIHN0ZDo6YWxsb2NhdG9yPGNoYXI+ID4sIHNkYnVzcGx1czo6bWVzc2FnZTo6
ZGV0YWlsczo6c3RyaW5nX3BhdGhfd3JhcHBlcj4gPiwgc3RkOjphbGxvY2F0b3I8c3RkOjpwYWly
PHN0ZDo6X19jeHgxMTo6YmFzaWNfc3RyaW5nPGNoYXI+LCBzdGQ6OnZhcmlhbnQ8Ym9vbCwgdW5z
aWduZWQgY2hhciwgc2hvcnQgdW5zaWduZWQgaW50LCBzaG9ydCBpbnQsIHVuc2lnbmVkIGludCwg
aW50LCBsb25nIGxvbmcgdW5zaWduZWQgaW50LCBsb25nIGxvbmcgaW50LCBkb3VibGUsIHN0ZDo6
X19jeHgxMTo6YmFzaWNfc3RyaW5nPGNoYXIsIHN0ZDo6Y2hhcl90cmFpdHM8Y2hhcj4sIHN0ZDo6
YWxsb2NhdG9yPGNoYXI+ID4sIHNkYnVzcGx1czo6bWVzc2FnZTo6ZGV0YWlsczo6c3RyaW5nX3Bh
dGhfd3JhcHBlcj4gPiA+ID4mOyBUID0gc3RkOjp2ZWN0b3I8c3RkOjpwYWlyPHN0ZDo6X19jeHgx
MTo6YmFzaWNfc3RyaW5nPGNoYXI+LCBzdGQ6OnZhcmlhbnQ8Ym9vbCwgdW5zaWduZWQgY2hhciwg
c2hvcnQgdW5zaWduZWQgaW50LCBzaG9ydCBpbnQsIHVuc2lnbmVkIGludCwgaW50LCBsb25nIGxv
bmcgdW5zaWduZWQgaW50LCBsb25nIGxvbmcgaW50LCBkb3VibGUsIHN0ZDo6X19jeHgxMTo6YmFz
aWNfc3RyaW5nPGNoYXIsIHN0ZDo6Y2hhcl90cmFpdHM8Y2hhcj4sIHN0ZDo6YWxsb2NhdG9yPGNo
YXI+ID4sIHNkYnVzcGx1czo6bWVzc2FnZTo6ZGV0YWlsczo6c3RyaW5nX3BhdGhfd3JhcHBlcj4g
Piwgc3RkOjphbGxvY2F0b3I8c3RkOjpwYWlyPHN0ZDo6X19jeHgxMTo6YmFzaWNfc3RyaW5nPGNo
YXI+LCBzdGQ6OnZhcmlhbnQ8Ym9vbCwgdW5zaWduZWQgY2hhciwgc2hvcnQgdW5zaWduZWQgaW50
LCBzaG9ydCBpbnQsIHVuc2lnbmVkIGludCwgaW50LCBsb25nIGxvbmcgdW5zaWduZWQgaW50LCBs
b25nIGxvbmcgaW50LCBkb3VibGUsIHN0ZDo6X19jeHgxMTo6YmFzaWNfc3RyaW5nPGNoYXIsIHN0
ZDo6Y2hhcl90cmFpdHM8Y2hhcj4sIHN0ZDo6YWxsb2NhdG9yPGNoYXI+ID4sIHNkYnVzcGx1czo6
bWVzc2FnZTo6ZGV0YWlsczo6c3RyaW5nX3BhdGhfd3JhcHBlcj4gPiA+ID5dJzoKfCAvaG9tZS9w
YXZvL29ndXovcGF2b29wZW5ibWMvYXNwZWVkb3BlbmJtYy9vcGVuYm1jL2J1aWxkL2VwY2EvdG1w
L3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvc21iaW9zLW1kci8xLjArZ2l0
QVVUT0lOQytlNGVhMzc3MTZkLXIxL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2MrKy8xMS4y
LjAvYml0cy92ZWN0b3IudGNjOjEyMToyODogbm90ZTogcGFyYW1ldGVyIHBhc3NpbmcgZm9yIGFy
Z3VtZW50IG9mIHR5cGUgJ19fZ251X2N4eDo6X19ub3JtYWxfaXRlcmF0b3I8c3RkOjpwYWlyPHN0
ZDo6X19jeHgxMTo6YmFzaWNfc3RyaW5nPGNoYXI+LCBzdGQ6OnZhcmlhbnQ8Ym9vbCwgdW5zaWdu
ZWQgY2hhciwgc2hvcnQgdW5zaWduZWQgaW50LCBzaG9ydCBpbnQsIHVuc2lnbmVkIGludCwgaW50
LCBsb25nIGxvbmcgdW5zaWduZWQgaW50LCBsb25nIGxvbmcgaW50LCBkb3VibGUsIHN0ZDo6X19j
eHgxMTo6YmFzaWNfc3RyaW5nPGNoYXIsIHN0ZDo6Y2hhcl90cmFpdHM8Y2hhcj4sIHN0ZDo6YWxs
b2NhdG9yPGNoYXI+ID4sIHNkYnVzcGx1czo6bWVzc2FnZTo6ZGV0YWlsczo6c3RyaW5nX3BhdGhf
d3JhcHBlcj4gPiosIHN0ZDo6dmVjdG9yPHN0ZDo6cGFpcjxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0
cmluZzxjaGFyPiwgc3RkOjp2YXJpYW50PGJvb2wsIHVuc2lnbmVkIGNoYXIsIHNob3J0IHVuc2ln
bmVkIGludCwgc2hvcnQgaW50LCB1bnNpZ25lZCBpbnQsIGludCwgbG9uZyBsb25nIHVuc2lnbmVk
IGludCwgbG9uZyBsb25nIGludCwgZG91YmxlLCBzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxj
aGFyLCBzdGQ6OmNoYXJfdHJhaXRzPGNoYXI+LCBzdGQ6OmFsbG9jYXRvcjxjaGFyPiA+LCBzZGJ1
c3BsdXM6Om1lc3NhZ2U6OmRldGFpbHM6OnN0cmluZ19wYXRoX3dyYXBwZXI+ID4sIHN0ZDo6YWxs
b2NhdG9yPHN0ZDo6cGFpcjxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyPiwgc3RkOjp2
YXJpYW50PGJvb2wsIHVuc2lnbmVkIGNoYXIsIHNob3J0IHVuc2lnbmVkIGludCwgc2hvcnQgaW50
LCB1bnNpZ25lZCBpbnQsIGludCwgbG9uZyBsb25nIHVuc2lnbmVkIGludCwgbG9uZyBsb25nIGlu
dCwgZG91YmxlLCBzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyLCBzdGQ6OmNoYXJfdHJh
aXRzPGNoYXI+LCBzdGQ6OmFsbG9jYXRvcjxjaGFyPiA+LCBzZGJ1c3BsdXM6Om1lc3NhZ2U6OmRl
dGFpbHM6OnN0cmluZ19wYXRoX3dyYXBwZXI+ID4gPiA+ID4nIGNoYW5nZWQgaW4gR0NDIDcuMQp8
ICAgMTIxIHwgICAgICAgICAgIF9NX3JlYWxsb2NfaW5zZXJ0KGVuZCgpLCBzdGQ6OmZvcndhcmQ8
X0FyZ3M+KF9fYXJncykuLi4pOwp8ICAgICAgIHwgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnwgbmluamE6IGJ1aWxkIHN0
b3BwZWQ6IHN1YmNvbW1hbmQgZmFpbGVkLgp8IFdBUk5JTkc6IGV4aXQgY29kZSAxIGZyb20gYSBz
aGVsbCBjb21tYW5kLgpFUlJPUjogVGFzayAoL2hvbWUvcGF2by9vZ3V6L3Bhdm9vcGVuYm1jL2Fz
cGVlZG9wZW5ibWMvb3BlbmJtYy9tZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhvc3Bob3Ivc21iaW9z
L3NtYmlvcy1tZHJfZ2l0LmJiOmRvX2NvbXBpbGUpIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAnMScK

--_004_b46a5098aabb470b8515c16aa1ef9f65pavotekcomtr_--
