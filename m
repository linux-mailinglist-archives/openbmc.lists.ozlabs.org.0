Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE546594E18
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 03:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6Dc52Jm2z3bdN
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 11:49:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pavotek.com.tr header.i=@pavotek.com.tr header.a=rsa-sha256 header.s=mail1 header.b=BzKhLJME;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pavotek.com.tr (client-ip=213.74.56.236; helo=pavotekmailgw.pavotek.com.tr; envelope-from=oguzhan.caglar@pavotek.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pavotek.com.tr header.i=@pavotek.com.tr header.a=rsa-sha256 header.s=mail1 header.b=BzKhLJME;
	dkim-atps=neutral
Received: from pavotekmailgw.pavotek.com.tr (mail1.panod.com.tr [213.74.56.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5v0r6G1dz2y8Q
	for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2022 22:36:42 +1000 (AEST)
Received: from Exchange2016.pavotek.com.tr (unknown [192.168.66.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by Forcepoint Email with ESMTPS id B50606DD380EFEE255AD;
	Mon, 15 Aug 2022 15:36:34 +0300 (+03)
Content-Language: tr-TR
Content-Type: multipart/alternative;
	boundary="_000_615cc43556cb43b1926482f7a78fc75fpavotekcomtr_"
DKIM-Signature: v=1; a=rsa-sha256; d=pavotek.com.tr; s=mail1;
	c=relaxed/relaxed; t=1660566994; h=from:subject:to:date:message-id;
	bh=ZyVRo2xn21xOxQiShtVnNoPX3A1iMtwtGSvZvoUTky8=;
	b=BzKhLJMEQhtUsM+ST9p07b506xmKps3sBOd6jdMwTytIQqBS0NDQMvfMjtO3/puAMCE/jmISz6C
	Wi+wcFq37y7waNBWWX+dz6QaK6ov9Oaqcub7rHqjQJxJmw7YitwxjMF+V6awPjB+nRtN1BaFMqnG7
	oEjzLCwua7XWDqhFQPf4msMtcAEhSUNKj18NjQkKsVLWlKlXEIrMThBrYN8G7Fz2NRuQBAFiy55Me
	LgpCuxj7s16vJYQyy8lHzE705hfBkdQ5yre1XcHbvpKeZ5Ajhr0CVn+TYZ28IhMcBYes2odZfJQDJ
	/mlvHuSNaPkomaKYECEaLfNpT8E5aiAkD+Fg==
Received: from Exchange2016.pavotek.com.tr (192.168.66.180) by
 Exchange2016.pavotek.com.tr (192.168.66.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2507.6; Mon, 15 Aug 2022 15:36:34 +0300
Received: from Exchange2016.pavotek.com.tr ([::1]) by
 Exchange2016.pavotek.com.tr ([::1]) with mapi id 15.01.2507.006; Mon, 15 Aug
 2022 15:36:34 +0300
From: =?iso-8859-3?Q?O=BBuzhan_=C7A=ABLAR?= <oguzhan.caglar@pavotek.com.tr>
To: Andrei Kartashev <a.kartashev@yadro.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: Ynt: Ynt: Ynt: (External) Re: Adding Inventory
Thread-Topic: Ynt: Ynt: (External) Re: Adding Inventory
Thread-Index: AQHYp9i2xlvHHPf9DkStj7/J201ola2p7wYAgADnrMyAAKbZAIAEHrnlgAAD5ICAAFTiIw==
Date: Mon, 15 Aug 2022 12:36:34 +0000
Message-ID: <615cc43556cb43b1926482f7a78fc75f@pavotek.com.tr>
References: <6fbe1a4cf05a483b86986e1cdf5f53aa@pavotek.com.tr>
	 ,<794cf20fd781d5a28746800c05b41b866c099483.camel@yadro.com>
	 <dbe33b3b957344ae9efa8c56e4c6a554@pavotek.com.tr>
	,<e10b60146c5a120eb615be8a4513f9a9f9a91756.camel@yadro.com>
	 <b46a5098aabb470b8515c16aa1ef9f65@pavotek.com.tr>,<fe14142bd0ce01238f87262c107b5c71425c3ab8.camel@yadro.com>
In-Reply-To: <fe14142bd0ce01238f87262c107b5c71425c3ab8.camel@yadro.com>
Accept-Language: tr-TR, en-US
X-MS-Has-Attach: 
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

--_000_615cc43556cb43b1926482f7a78fc75fpavotekcomtr_
Content-Type: text/plain; charset="iso-8859-3"
Content-Transfer-Encoding: quoted-printable

Thank you, Andrei,


I successfully built it now. Why do I get this error? In addition, I guess =
I have to dive into BIOS to get information about CPU and DIMM. Is it right=
? Is there any example to do that?

What exactly do the smbios-mdr daemon?


O=BBuzhan =C7a=BBlar

Yaz=B9l=B9m M=FChendisi





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
G=F6nderildi: 15 A=BBustos 2022 Pazartesi 13:23:33
Kime: O=BBuzhan =C7A=ABLAR; openbmc@lists.ozlabs.org
Konu: Re: Ynt: Ynt: (External) Re: Adding Inventory


Warning: This e-mail came from an external source. If you do not trust the =
sender or if there is anything suspicious in the content of the e-mail, ple=
ase inform the IT department.



As I assumed, it is PCUInfo issue:

|
/home/pavo/oguz/pavoopenbmc/aspeedopenbmc/openbmc/build/epca/tmp/work/a
rm1176jzs-openbmc-linux-gnueabi/smbios-mdr/1.0+gitAUTOINC+e4ea37716d-
r1/git/src/cpuinfo_main.cpp:407:14: error: 'icxd' was not declared in
this scope; did you mean 'icx'?
|   407 |         case icxd:
|       |              ^~~~
|       |              icx
|
/home/pavo/oguz/pavoopenbmc/aspeedopenbmc/openbmc/build/epca/tmp/work/a
rm1176jzs-openbmc-linux-gnueabi/smbios-mdr/1.0+gitAUTOINC+e4ea37716d-
r1/git/src/cpuinfo_main.cpp:408:14: error: 'spr' was not declared in
this scope
|   408 |         case spr:
|       |              ^~~


Turn it off in you bbappend with `PACKAGECONFIG:remove =3D " cpuinfo"`



On Mon, 2022-08-15 at 07:25 +0000, O=BBuzhan =C7A=ABLAR wrote:
>
> I'm sharing with you that my yocto errors are related to smbios-
> mdr in the .txt file.
>
> I don't understand, How can the CPU information match with entity-
> manager configuration files? I saw your comment in openbmc list about
> PCIe. It probes only with xyz.openbmc_project.FruDevice.
>
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
> G=F6nderildi: 12 A=BBustos 2022 Cuma 22:14:38
> Kime: O=BBuzhan =C7A=ABLAR; openbmc@lists.ozlabs.org
> Konu: Re: Ynt: (External) Re: Adding Inventory
>
>
> Warning: This e-mail came from an external source. If you do not
> trust the sender or if there is anything suspicious in the content of
> the e-mail, please inform the IT department.
>
>
>
> I have no idea on what do you mean saying "added the CPU and DIMM
> configuration files within the .yaml files", but I guess you are
> trying
> to hardcode this information, which I believe not what ou actually
> expect to get.
> You probably should learn how the OpenBMC works inside. You can use
> busctl tool for that.
>
> Regarding compilation error of smbios-mdr daemon, I can say nothing
> without knowing the issue. There should not be any special
> configuration files for this smbios-mdr recipe but probably you
> trying
> to build CPUInfo part of the recipe without having PECI library. You
> likely should disable cpuinfo app.
>
> On Fri, 2022-08-12 at 06:50 +0000, O=BBuzhan =C7A=ABLAR wrote:
> > Hi Andrei,
> >
> > Thank you for your information. I have already added the CPU and
> > DIMM
> > configuration files within the .yaml files. When I added these
> > files(related to the path: xyz.openbmc_project.Inventory.Item.Cpu
> > and xyz.openbmc_project.Inventory.Item.Dimm), I see the CPU and
> > DIMM
> > entries over WebUI. However, In this way, I add the properties such
> > as (PartNumber, SerialNumber, etc.) on my own. I have already
> > generated a .bin file that has FRU information (chassis, board
> > etc.)
> > and I included this in BMC's image file. In addition, I see the
> > properties related to Chassis, Board on WebUI.
> >
> > I have already checked the smbios-mdr daemon in openbmc. However,
> > when I include this daemon in my yocto image, the bitbake shows
> > some
> > errors that are related to smbios-mdr's .cpp files. I guess I have
> > to
> > create some configuration files before doing it. Is it wrong? What
> > should I do?
> >
> > I guess I have to need some code in BIOS. Is there any example to
> > do
> > this? I don't know where I should start.
> >
> > Thank you.
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
> > G=F6nderen: Andrei Kartashev <a.kartashev@yadro.com>
> > G=F6nderildi: 11 A=BBustos 2022 Per=BAembe 22:28:16
> > Kime: O=BBuzhan =C7A=ABLAR; openbmc@lists.ozlabs.org
> > Konu: (External) Re: Adding Inventory
> >
> >
> > Warning: This e-mail came from an external source. If you do not
> > trust the sender or if there is anything suspicious in the content
> > of
> > the e-mail, please inform the IT department.
> >
> >
> >
> > Hello Oguzhan,
> >
> > This is a very common question for newcomers, I believe is was
> > already
> > answered somewhere in the list.
> > BMC out of the box don't have any knowledge on host's equipment
> > (CPU,
> > DIMM, Drive, AIC, etc) - it is up to you to deliver this
> > information
> > from host to BMC. As for now the most common way to feed BMC the
> > information regarding CPU and DIMM is to transfer smbios tables via
> > ipmi. You can implement any other mechanism but any way, you need
> > to
> > have some code in your BIOS.
> >
> > As soon as you have the CPU/DIMM information on BMC it can be shown
> > in
> > bmcweb by implementing corresponding dbus interfaces
> > (xyz.openbmc_project.Inventory.Item.Cpu and
> > xyz.openbmc_project.Inventory.Item.Dimm). smbiosmdrv2 daemon do
> > this,
> > but you also can add EntityManager configuration files for this or
> > write your own daemon to expose the interfaces.
> >
> > On Thu, 2022-08-04 at 08:07 +0000, O=BBuzhan =C7A=ABLAR wrote:
> > > Hello,
> > >
> > > I'm working on openbmc for ast2500 bmc. I want to add inventory
> > > such
> > > as CPU and DIMM etc. I added the chassis from .json file but I
> > > couldn't add the CPU and DIMM. I know this is to related with
> > > entity-
> > > manager. How can I add these inventory on WEBUI? Can you give
> > > some
> > > information about this issue?
> > >
> > > Regards.
> > >
> > > O=BBuzhan =C7a=BBlar
> > > Software Design Engineer
> > >
> > >
> > >
> > > Pavo Tasar=B9m =DCretim Elektronik Tic. A.=AA.
> > > Teknopark =A9stanbul, Kurtk=F6y Pendik =A9STANBUL
> > >
> > >
> > > Tel             : +90 (216) 354 72 86
> > > Faks         : +90 (216) 354 76 77
> > > Gsm          : +90 (507) 585 10 60
> > > oguzhan.caglar@pavotek.com.tr
> > >
> > > www.pavotek.com.tr<http://www.pavotek.com.tr>
> > >
> > >
> >
> > --
> > Best regards,
> > Andrei Kartashev,
> > Lead BMC Developer
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


--_000_615cc43556cb43b1926482f7a78fc75fpavotekcomtr_
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
<p>Thank you, Andrei,</p>
<p><br>
</p>
<p>I successfully built it now. Why do I get this error? In addition,&nbsp;=
I guess I have to dive into BIOS to get information about CPU and DIMM. Is =
it right? Is there any example to do that?</p>
<p>What exactly do the smbios-mdr daemon?</p>
<p><br>
</p>
<div id=3D"x_Signature">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;App=
le Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe =
UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<span id=3D"x_ms-rterangepaste-start"></span>
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
ans-serif">Yaz=B9l=B9m M=FChendisi</span><span lang=3D"TR"></span></p>
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
<span id=3D"x_ms-rterangepaste-end"></span></div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>G=F6nderen:</b> Andrei Kartas=
hev &lt;a.kartashev@yadro.com&gt;<br>
<b>G=F6nderildi:</b> 15 A=BBustos 2022 Pazartesi 13:23:33<br>
<b>Kime:</b> O=BBuzhan =C7A=ABLAR; openbmc@lists.ozlabs.org<br>
<b>Konu:</b> Re: Ynt: Ynt: (External) Re: Adding Inventory</font>
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
As I assumed, it is PCUInfo issue:<br>
<br>
|<br>
/home/pavo/oguz/pavoopenbmc/aspeedopenbmc/openbmc/build/epca/tmp/work/a<br>
rm1176jzs-openbmc-linux-gnueabi/smbios-mdr/1.0&#43;gitAUTOINC&#43;e4ea37716=
d-<br>
r1/git/src/cpuinfo_main.cpp:407:14: error: 'icxd' was not declared in<br>
this scope; did you mean 'icx'?<br>
|&nbsp;&nbsp; 407 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ic=
xd:<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icx<br>
|<br>
/home/pavo/oguz/pavoopenbmc/aspeedopenbmc/openbmc/build/epca/tmp/work/a<br>
rm1176jzs-openbmc-linux-gnueabi/smbios-mdr/1.0&#43;gitAUTOINC&#43;e4ea37716=
d-<br>
r1/git/src/cpuinfo_main.cpp:408:14: error: 'spr' was not declared in<br>
this scope<br>
|&nbsp;&nbsp; 408 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case sp=
r:<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~<br>
<br>
<br>
Turn it off in you bbappend with `PACKAGECONFIG:remove =3D &quot; cpuinfo&q=
uot;`<br>
<br>
<br>
<br>
On Mon, 2022-08-15 at 07:25 &#43;0000, O=BBuzhan =C7A=ABLAR wrote:<br>
&gt;<br>
&gt; I'm sharing with you that my yocto errors are related to smbios-<br>
&gt; mdr in the .txt file.<br>
&gt;<br>
&gt; I don't understand, How can the CPU information match with entity-<br>
&gt; manager configuration files? I saw your comment in openbmc list about<=
br>
&gt; PCIe. It probes only with xyz.openbmc_project.FruDevice.<br>
&gt;<br>
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
&gt; G=F6nderildi: 12 A=BBustos 2022 Cuma 22:14:38<br>
&gt; Kime: O=BBuzhan =C7A=ABLAR; openbmc@lists.ozlabs.org<br>
&gt; Konu: Re: Ynt: (External) Re: Adding Inventory<br>
&gt;<br>
&gt;<br>
&gt; Warning: This e-mail came from an external source. If you do not<br>
&gt; trust the sender or if there is anything suspicious in the content of<=
br>
&gt; the e-mail, please inform the IT department.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; I have no idea on what do you mean saying &quot;added the CPU and DIMM=
<br>
&gt; configuration files within the .yaml files&quot;, but I guess you are<=
br>
&gt; trying<br>
&gt; to hardcode this information, which I believe not what ou actually<br>
&gt; expect to get.<br>
&gt; You probably should learn how the OpenBMC works inside. You can use<br=
>
&gt; busctl tool for that.<br>
&gt;<br>
&gt; Regarding compilation error of smbios-mdr daemon, I can say nothing<br=
>
&gt; without knowing the issue. There should not be any special<br>
&gt; configuration files for this smbios-mdr recipe but probably you<br>
&gt; trying<br>
&gt; to build CPUInfo part of the recipe without having PECI library. You<b=
r>
&gt; likely should disable cpuinfo app.<br>
&gt;<br>
&gt; On Fri, 2022-08-12 at 06:50 &#43;0000, O=BBuzhan =C7A=ABLAR wrote:<br>
&gt; &gt; Hi Andrei,<br>
&gt; &gt;<br>
&gt; &gt; Thank you for your information. I have already added the CPU and<=
br>
&gt; &gt; DIMM<br>
&gt; &gt; configuration files within the .yaml files. When I added these<br=
>
&gt; &gt; files(related to the path: xyz.openbmc_project.Inventory.Item.Cpu=
<br>
&gt; &gt; and xyz.openbmc_project.Inventory.Item.Dimm), I see the CPU and<b=
r>
&gt; &gt; DIMM<br>
&gt; &gt; entries over WebUI. However, In this way, I add the properties su=
ch<br>
&gt; &gt; as (PartNumber, SerialNumber, etc.) on my own. I have already<br>
&gt; &gt; generated a .bin file that has FRU information (chassis, board<br=
>
&gt; &gt; etc.)<br>
&gt; &gt; and I included this in BMC's image file. In addition, I see the<b=
r>
&gt; &gt; properties related to Chassis, Board on WebUI.<br>
&gt; &gt;<br>
&gt; &gt; I have already checked the smbios-mdr daemon in openbmc. However,=
<br>
&gt; &gt; when I include this daemon in my yocto image, the bitbake shows<b=
r>
&gt; &gt; some<br>
&gt; &gt; errors that are related to smbios-mdr's .cpp files. I guess I hav=
e<br>
&gt; &gt; to<br>
&gt; &gt; create some configuration files before doing it. Is it wrong? Wha=
t<br>
&gt; &gt; should I do?<br>
&gt; &gt;<br>
&gt; &gt; I guess I have to need some code in BIOS. Is there any example to=
<br>
&gt; &gt; do<br>
&gt; &gt; this? I don't know where I should start.<br>
&gt; &gt;<br>
&gt; &gt; Thank you.<br>
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
&gt; &gt; G=F6nderen: Andrei Kartashev &lt;a.kartashev@yadro.com&gt;<br>
&gt; &gt; G=F6nderildi: 11 A=BBustos 2022 Per=BAembe 22:28:16<br>
&gt; &gt; Kime: O=BBuzhan =C7A=ABLAR; openbmc@lists.ozlabs.org<br>
&gt; &gt; Konu: (External) Re: Adding Inventory<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Warning: This e-mail came from an external source. If you do not<=
br>
&gt; &gt; trust the sender or if there is anything suspicious in the conten=
t<br>
&gt; &gt; of<br>
&gt; &gt; the e-mail, please inform the IT department.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Hello Oguzhan,<br>
&gt; &gt;<br>
&gt; &gt; This is a very common question for newcomers, I believe is was<br=
>
&gt; &gt; already<br>
&gt; &gt; answered somewhere in the list.<br>
&gt; &gt; BMC out of the box don't have any knowledge on host's equipment<b=
r>
&gt; &gt; (CPU,<br>
&gt; &gt; DIMM, Drive, AIC, etc) - it is up to you to deliver this<br>
&gt; &gt; information<br>
&gt; &gt; from host to BMC. As for now the most common way to feed BMC the<=
br>
&gt; &gt; information regarding CPU and DIMM is to transfer smbios tables v=
ia<br>
&gt; &gt; ipmi. You can implement any other mechanism but any way, you need=
<br>
&gt; &gt; to<br>
&gt; &gt; have some code in your BIOS.<br>
&gt; &gt;<br>
&gt; &gt; As soon as you have the CPU/DIMM information on BMC it can be sho=
wn<br>
&gt; &gt; in<br>
&gt; &gt; bmcweb by implementing corresponding dbus interfaces<br>
&gt; &gt; (xyz.openbmc_project.Inventory.Item.Cpu and<br>
&gt; &gt; xyz.openbmc_project.Inventory.Item.Dimm). smbiosmdrv2 daemon do<b=
r>
&gt; &gt; this,<br>
&gt; &gt; but you also can add EntityManager configuration files for this o=
r<br>
&gt; &gt; write your own daemon to expose the interfaces.<br>
&gt; &gt;<br>
&gt; &gt; On Thu, 2022-08-04 at 08:07 &#43;0000, O=BBuzhan =C7A=ABLAR wrote=
:<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I'm working on openbmc for ast2500 bmc. I want to add invent=
ory<br>
&gt; &gt; &gt; such<br>
&gt; &gt; &gt; as CPU and DIMM etc. I added the chassis from .json file but=
 I<br>
&gt; &gt; &gt; couldn't add the CPU and DIMM. I know this is to related wit=
h<br>
&gt; &gt; &gt; entity-<br>
&gt; &gt; &gt; manager. How can I add these inventory on WEBUI? Can you giv=
e<br>
&gt; &gt; &gt; some<br>
&gt; &gt; &gt; information about this issue?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Regards.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; O=BBuzhan =C7a=BBlar<br>
&gt; &gt; &gt; Software Design Engineer<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Pavo Tasar=B9m =DCretim Elektronik Tic. A.=AA.<br>
&gt; &gt; &gt; Teknopark =A9stanbul, Kurtk=F6y Pendik =A9STANBUL<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Tel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; : &#43;90 (216) 354 72 86<br>
&gt; &gt; &gt; Faks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &#43;=
90 (216) 354 76 77<br>
&gt; &gt; &gt; Gsm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : =
&#43;90 (507) 585 10 60<br>
&gt; &gt; &gt; oguzhan.caglar@pavotek.com.tr<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"http://www.pavotek.com.tr">www.pavotek.com.tr</a>=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Best regards,<br>
&gt; &gt; Andrei Kartashev,<br>
&gt; &gt; Lead BMC Developer<br>
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

--_000_615cc43556cb43b1926482f7a78fc75fpavotekcomtr_--
