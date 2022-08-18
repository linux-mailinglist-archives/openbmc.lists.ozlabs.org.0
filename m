Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7816B59CC56
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 01:42:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBTRQ3716z3c1N
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 09:42:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pavotek.com.tr header.i=@pavotek.com.tr header.a=rsa-sha256 header.s=mail1 header.b=CGAmsJw6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pavotek.com.tr (client-ip=213.74.56.236; helo=pavotekmailgw.pavotek.com.tr; envelope-from=oguzhan.caglar@pavotek.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pavotek.com.tr header.i=@pavotek.com.tr header.a=rsa-sha256 header.s=mail1 header.b=CGAmsJw6;
	dkim-atps=neutral
Received: from pavotekmailgw.pavotek.com.tr (mail1.pavelsis.com [213.74.56.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7c5r4GRjz2xHJ
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 17:31:57 +1000 (AEST)
Received: from Exchange2016.pavotek.com.tr (unknown [192.168.66.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by Forcepoint Email with ESMTPS id B00C0EF317FD70BDEE44;
	Thu, 18 Aug 2022 10:31:50 +0300 (+03)
Content-Language: tr-TR
Content-Type: multipart/alternative;
	boundary="_000_3a0124036959480c9c8444aeb663ab0apavotekcomtr_"
DKIM-Signature: v=1; a=rsa-sha256; d=pavotek.com.tr; s=mail1;
	c=relaxed/relaxed; t=1660807910; h=from:subject:to:date:message-id;
	bh=ylu45p+88wiLs89g6XQSzz4/VOvZ83IPy4lDmCrrNiM=;
	b=CGAmsJw6I3eGvj5Rs1NdEutifXjveKv90kKbY/V9+okrWPgEsgzyNtn7+SGcR7MOlO3oXCQ/xEt
	uUws/ZxX83sQHHtH1JtpIQtDvZeEYrqwFijN3pudN5jkWaqGkxO85XsZOO2yJcsty3LXkowl1t1jC
	2i7rgKU003tWz6XCpeRSJpFmd7ya3GtxJS1edoWJ8bjqIVOcVUZKyXTOx/CvTWMn2uAJaOK2BOqqn
	M8vJxWERwAFK7Y+pLCqDBOC3o6Kz1gFIQoDpziTAEaP8L3rH/sYnW/my7uWNzq/uBMbR1SO0RScPr
	EZM2yPZ7FNBwi8vPJ//3ZvktozHc+oW0Pn/A==
Received: from Exchange2016.pavotek.com.tr (192.168.66.180) by
 Exchange2016.pavotek.com.tr (192.168.66.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2507.6; Thu, 18 Aug 2022 10:31:50 +0300
Received: from Exchange2016.pavotek.com.tr ([::1]) by
 Exchange2016.pavotek.com.tr ([::1]) with mapi id 15.01.2507.006; Thu, 18 Aug
 2022 10:31:50 +0300
From: =?iso-8859-9?Q?O=F0uzhan_=C7A=D0LAR?= <oguzhan.caglar@pavotek.com.tr>
To: Andrei Kartashev <a.kartashev@yadro.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: Ynt: Ynt: Ynt: Ynt: (External) Re: Adding Inventory
Thread-Topic: Ynt: Ynt: Ynt: (External) Re: Adding Inventory
Thread-Index: AQHYp9i2xlvHHPf9DkStj7/J201ola2p7wYAgADnrMyAAKbZAIAEHrnlgAAD5ICAAFTiI4ACuS2AgAGlV5M=
Date: Thu, 18 Aug 2022 07:31:50 +0000
Message-ID: <3a0124036959480c9c8444aeb663ab0a@pavotek.com.tr>
References: <6fbe1a4cf05a483b86986e1cdf5f53aa@pavotek.com.tr>
	 ,<794cf20fd781d5a28746800c05b41b866c099483.camel@yadro.com>
	 <dbe33b3b957344ae9efa8c56e4c6a554@pavotek.com.tr>
	 ,<e10b60146c5a120eb615be8a4513f9a9f9a91756.camel@yadro.com>
	 <b46a5098aabb470b8515c16aa1ef9f65@pavotek.com.tr>
	,<fe14142bd0ce01238f87262c107b5c71425c3ab8.camel@yadro.com>
	 <615cc43556cb43b1926482f7a78fc75f@pavotek.com.tr>,<a985c9e1c388f5e35a0c9c4f6c97794b758a0412.camel@yadro.com>
In-Reply-To: <a985c9e1c388f5e35a0c9c4f6c97794b758a0412.camel@yadro.com>
Accept-Language: tr-TR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.61.1.176]
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Aug 2022 09:39:56 +1000
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

--_000_3a0124036959480c9c8444aeb663ab0apavotekcomtr_
Content-Type: text/plain; charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable


Thank you, It is too helpful!


1) What is the interface over which the Intel x86 CPU sends data to the BMC=
? KCS or something?

2) I see /var/lib/smbios but don't see /var/lib/smbios/smbios2 in my system=
. It will be created when the file is received?

3) When the file arrives from the CPU to the BMC, Can I see the information=
 in webui? Do I have to create any configuration files in entity-manager or=
 phosphor-inventory-manager to do this?

4) Besides the CPU and DIMM information, How can I see the information of t=
he chassis and board? I think the only way to do this is FRU? I mean, this =
information is kept in any EEPROM as binary in the production process of bo=
ards. If I think wrong, Is there any way to see the information of the chas=
sis or board?


Regards.


O=F0uzhan =C7a=F0lar

Software Design Engineer





[https://posta.pavotek.com.tr/owa/]








[https://posta.pavotek.com.tr/owa/]


Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.

Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL




       [https://posta.pavotek.com.tr/owa/] <http://pavotek.com.tr/>


Tel             : +90 (216) 354 72 86


Faks         : +90 (216) 354 76 77


Gsm          : +90 (507) 585 10 60


oguzhan.caglar@pavotek.com.tr<mailto:oguzhan.caglar@pavotek.com.tr>





www.pavotek.com.tr<http://www.pavotek.com.tr/>




________________________________
G=F6nderen: Andrei Kartashev <a.kartashev@yadro.com>
G=F6nderildi: 17 A=F0ustos 2022 =C7ar=FEamba 12:02:39
Kime: O=F0uzhan =C7A=D0LAR; openbmc@lists.ozlabs.org
Konu: Re: Ynt: Ynt: Ynt: (External) Re: Adding Inventory


Warning: This e-mail came from an external source. If you do not trust the =
sender or if there is anything suspicious in the content of the e-mail, ple=
ase inform the IT department.



On Mon, 2022-08-15 at 12:36 +0000, O=F0uzhan =C7A=D0LAR wrote:
>
> Thank you, Andrei,
>
> I successfully built it now. Why do I get this error?

cpuinfo is additional daemon, that actually do nothing with smbios, but
it can get some CPU-related information by using PECI interface. For
about couple of years PECI wasn't supported by upstream OpenBMC, the
implementation was only in Intel's fork.
I don't know actual situation, but I guess you just miss some libraries
for PECI support.
Anyway, you don't need this at this stage.

> In addition, I guess I have to dive into BIOS to get information
> about CPU and DIMM. Is it right?

Yes, smbiosmdrv2 daemon reads SMBIOS information from the file
/var/lib/smbios/smbios2 and you have to somehow deliver it to the BMC
filesystem.

> Is there any example to do that?

Not sure. I think I saw somewhere in the Internet example of delivering
it using phosphor-ipmi-blobs.

> What exactly do the smbios-mdr daemon?
>

Well, it just parse SMBIOS tables from binary file and expose extracted
information to dbus for other daemons use.

> O=F0uzhan =C7a=F0lar
> Yaz=FDl=FDm M=FChendisi
>
>
>
> Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.
> Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL
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
> G=F6nderildi: 15 A=F0ustos 2022 Pazartesi 13:23:33
> Kime: O=F0uzhan =C7A=D0LAR; openbmc@lists.ozlabs.org
> Konu: Re: Ynt: Ynt: (External) Re: Adding Inventory
>
>
> Warning: This e-mail came from an external source. If you do not
> trust the sender or if there is anything suspicious in the content of
> the e-mail, please inform the IT department.
>
>
>
> As I assumed, it is PCUInfo issue:
>
> |
> /home/pavo/oguz/pavoopenbmc/aspeedopenbmc/openbmc/build/epca/tmp/work
> /a
> rm1176jzs-openbmc-linux-gnueabi/smbios-mdr/1.0+gitAUTOINC+e4ea37716d-
> r1/git/src/cpuinfo_main.cpp:407:14: error: 'icxd' was not declared in
> this scope; did you mean 'icx'?
> |   407 |         case icxd:
> |       |              ^~~~
> |       |              icx
> |
> /home/pavo/oguz/pavoopenbmc/aspeedopenbmc/openbmc/build/epca/tmp/work
> /a
> rm1176jzs-openbmc-linux-gnueabi/smbios-mdr/1.0+gitAUTOINC+e4ea37716d-
> r1/git/src/cpuinfo_main.cpp:408:14: error: 'spr' was not declared in
> this scope
> |   408 |         case spr:
> |       |              ^~~
>
>
> Turn it off in you bbappend with `PACKAGECONFIG:remove =3D " cpuinfo"`
>
>
>
> On Mon, 2022-08-15 at 07:25 +0000, O=F0uzhan =C7A=D0LAR wrote:
> >
> > I'm sharing with you that my yocto errors are related to smbios-
> > mdr in the .txt file.
> >
> > I don't understand, How can the CPU information match with entity-
> > manager configuration files? I saw your comment in openbmc list
> > about
> > PCIe. It probes only with xyz.openbmc_project.FruDevice.
> >
> >
> > O=F0uzhan =C7a=F0lar
> > Software Design Engineer
> >
> >
> >
> > Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.
> > Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL
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
> > G=F6nderildi: 12 A=F0ustos 2022 Cuma 22:14:38
> > Kime: O=F0uzhan =C7A=D0LAR; openbmc@lists.ozlabs.org
> > Konu: Re: Ynt: (External) Re: Adding Inventory
> >
> >
> > Warning: This e-mail came from an external source. If you do not
> > trust the sender or if there is anything suspicious in the content
> > of
> > the e-mail, please inform the IT department.
> >
> >
> >
> > I have no idea on what do you mean saying "added the CPU and DIMM
> > configuration files within the .yaml files", but I guess you are
> > trying
> > to hardcode this information, which I believe not what ou actually
> > expect to get.
> > You probably should learn how the OpenBMC works inside. You can use
> > busctl tool for that.
> >
> > Regarding compilation error of smbios-mdr daemon, I can say nothing
> > without knowing the issue. There should not be any special
> > configuration files for this smbios-mdr recipe but probably you
> > trying
> > to build CPUInfo part of the recipe without having PECI library.
> > You
> > likely should disable cpuinfo app.
> >
> > On Fri, 2022-08-12 at 06:50 +0000, O=F0uzhan =C7A=D0LAR wrote:
> > > Hi Andrei,
> > >
> > > Thank you for your information. I have already added the CPU and
> > > DIMM
> > > configuration files within the .yaml files. When I added these
> > > files(related to the path: xyz.openbmc_project.Inventory.Item.Cpu
> > > and xyz.openbmc_project.Inventory.Item.Dimm), I see the CPU and
> > > DIMM
> > > entries over WebUI. However, In this way, I add the properties
> > > such
> > > as (PartNumber, SerialNumber, etc.) on my own. I have already
> > > generated a .bin file that has FRU information (chassis, board
> > > etc.)
> > > and I included this in BMC's image file. In addition, I see the
> > > properties related to Chassis, Board on WebUI.
> > >
> > > I have already checked the smbios-mdr daemon in openbmc. However,
> > > when I include this daemon in my yocto image, the bitbake shows
> > > some
> > > errors that are related to smbios-mdr's .cpp files. I guess I
> > > have
> > > to
> > > create some configuration files before doing it. Is it wrong?
> > > What
> > > should I do?
> > >
> > > I guess I have to need some code in BIOS. Is there any example to
> > > do
> > > this? I don't know where I should start.
> > >
> > > Thank you.
> > >
> > > O=F0uzhan =C7a=F0lar
> > > Software Design Engineer
> > >
> > >
> > >
> > > Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.
> > > Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL
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
> > > G=F6nderen: Andrei Kartashev <a.kartashev@yadro.com>
> > > G=F6nderildi: 11 A=F0ustos 2022 Per=FEembe 22:28:16
> > > Kime: O=F0uzhan =C7A=D0LAR; openbmc@lists.ozlabs.org
> > > Konu: (External) Re: Adding Inventory
> > >
> > >
> > > Warning: This e-mail came from an external source. If you do not
> > > trust the sender or if there is anything suspicious in the
> > > content
> > > of
> > > the e-mail, please inform the IT department.
> > >
> > >
> > >
> > > Hello Oguzhan,
> > >
> > > This is a very common question for newcomers, I believe is was
> > > already
> > > answered somewhere in the list.
> > > BMC out of the box don't have any knowledge on host's equipment
> > > (CPU,
> > > DIMM, Drive, AIC, etc) - it is up to you to deliver this
> > > information
> > > from host to BMC. As for now the most common way to feed BMC the
> > > information regarding CPU and DIMM is to transfer smbios tables
> > > via
> > > ipmi. You can implement any other mechanism but any way, you need
> > > to
> > > have some code in your BIOS.
> > >
> > > As soon as you have the CPU/DIMM information on BMC it can be
> > > shown
> > > in
> > > bmcweb by implementing corresponding dbus interfaces
> > > (xyz.openbmc_project.Inventory.Item.Cpu and
> > > xyz.openbmc_project.Inventory.Item.Dimm). smbiosmdrv2 daemon do
> > > this,
> > > but you also can add EntityManager configuration files for this
> > > or
> > > write your own daemon to expose the interfaces.
> > >
> > > On Thu, 2022-08-04 at 08:07 +0000, O=F0uzhan =C7A=D0LAR wrote:
> > > > Hello,
> > > >
> > > > I'm working on openbmc for ast2500 bmc. I want to add inventory
> > > > such
> > > > as CPU and DIMM etc. I added the chassis from .json file but I
> > > > couldn't add the CPU and DIMM. I know this is to related with
> > > > entity-
> > > > manager. How can I add these inventory on WEBUI? Can you give
> > > > some
> > > > information about this issue?
> > > >
> > > > Regards.
> > > >
> > > > O=F0uzhan =C7a=F0lar
> > > > Software Design Engineer
> > > >
> > > >
> > > >
> > > > Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.
> > > > Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL
> > > >
> > > >
> > > > Tel             : +90 (216) 354 72 86
> > > > Faks         : +90 (216) 354 76 77
> > > > Gsm          : +90 (507) 585 10 60
> > > > oguzhan.caglar@pavotek.com.tr
> > > >
> > > > www.pavotek.com.tr<http://www.pavotek.com.tr>
> > > >
> > > >
> > >
> > > --
> > > Best regards,
> > > Andrei Kartashev,
> > > Lead BMC Developer
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


--_000_3a0124036959480c9c8444aeb663ab0apavotekcomtr_
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
<p><br>
</p>
<meta content=3D"text/html; charset=3DUTF-8">
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; co=
lor: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, =
&quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, =
&quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p>Thank you, It is too helpful!</p>
<p><br>
</p>
<p>1) What is the interface over which the Intel x86 CPU&nbsp;sends data to=
 the BMC? KCS or something?</p>
<p>2) I see /var/lib/smbios but don't see /var/lib/smbios/smbios2 in my sys=
tem. It will be created when the file is received?</p>
<p>3) When the file arrives from the CPU to the BMC, Can I see the informat=
ion in webui? Do I have to create any configuration files in entity-manager=
 or phosphor-inventory-manager to do this?&nbsp;</p>
<p>4) Besides the CPU and DIMM information, How can I see the information o=
f the&nbsp;chassis and&nbsp;board? I think the only way to do this is FRU? =
I mean, this information is kept in any EEPROM as binary in the production =
process of boards. If I think wrong, Is there
 any way to see the information of the chassis or board?</p>
<p><br>
</p>
<p>Regards.</p>
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
;,sans-serif">O=F0uzhan =C7a=F0lar</span></b></p>
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
<img width=3D"535" height=3D"9" style=3D"user-select: none;" src=3D"https:/=
/posta.pavotek.com.tr/owa/"><span lang=3D"TR"></span></p>
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
<img width=3D"17" height=3D"127" style=3D"user-select: none;" src=3D"https:=
//posta.pavotek.com.tr/owa/"><span lang=3D"TR"></span></p>
</td>
<td width=3D"348" rowspan=3D"2" valign=3D"top" style=3D"width:311.6pt; padd=
ing:0in 5.4pt 0in 5.4pt; height:25.05pt">
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<b><span lang=3D"TR" style=3D"font-size:9.0pt; font-family:&quot;Arial&quot=
;,sans-serif">Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.</span></b><b><=
span lang=3D"TR" style=3D"font-family:&quot;Arial&quot;,sans-serif"></span>=
</b></p>
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
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
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<b><span lang=3D"TR" style=3D"font-size:8.0pt">&nbsp;</span></b></p>
<p class=3D"x_MsoNormal" style=3D"margin-bottom:0in; margin-bottom:.0001pt;=
 line-height:normal">
<b><span lang=3D"TR">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b><span =
lang=3D"TR"><a href=3D"http://pavotek.com.tr/" id=3D"LPNoLP"><b><span lang=
=3D"EN-US" style=3D"color:windowtext"><img border=3D"0" width=3D"131" heigh=
t=3D"23" style=3D"user-select: none;" src=3D"https://posta.pavotek.com.tr/o=
wa/"></span></b></a><b></b></span></p>
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
<b>G=F6nderildi:</b> 17 A=F0ustos 2022 =C7ar=FEamba 12:02:39<br>
<b>Kime:</b> O=F0uzhan =C7A=D0LAR; openbmc@lists.ozlabs.org<br>
<b>Konu:</b> Re: Ynt: Ynt: Ynt: (External) Re: Adding Inventory</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"PlainText"><br>
Warning: This e-mail came from an external source. If you do not trust the =
sender or if there is anything suspicious in the content of the e-mail, ple=
ase inform the IT department.<br>
<br>
<br>
<br>
On Mon, 2022-08-15 at 12:36 &#43;0000, O=F0uzhan =C7A=D0LAR wrote:<br>
&gt;<br>
&gt; Thank you, Andrei,<br>
&gt;<br>
&gt; I successfully built it now. Why do I get this error?<br>
<br>
cpuinfo is additional daemon, that actually do nothing with smbios, but<br>
it can get some CPU-related information by using PECI interface. For<br>
about couple of years PECI wasn't supported by upstream OpenBMC, the<br>
implementation was only in Intel's fork.<br>
I don't know actual situation, but I guess you just miss some libraries<br>
for PECI support.<br>
Anyway, you don't need this at this stage.<br>
<br>
&gt; In addition, I guess I have to dive into BIOS to get information<br>
&gt; about CPU and DIMM. Is it right?<br>
<br>
Yes, smbiosmdrv2 daemon reads SMBIOS information from the file<br>
/var/lib/smbios/smbios2 and you have to somehow deliver it to the BMC<br>
filesystem.<br>
<br>
&gt; Is there any example to do that?<br>
<br>
Not sure. I think I saw somewhere in the Internet example of delivering<br>
it using phosphor-ipmi-blobs.<br>
<br>
&gt; What exactly do the smbios-mdr daemon?<br>
&gt;<br>
<br>
Well, it just parse SMBIOS tables from binary file and expose extracted<br>
information to dbus for other daemons use.<br>
<br>
&gt; O=F0uzhan =C7a=F0lar<br>
&gt; Yaz=FDl=FDm M=FChendisi<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.<br>
&gt; Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL<br>
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
&gt; G=F6nderildi: 15 A=F0ustos 2022 Pazartesi 13:23:33<br>
&gt; Kime: O=F0uzhan =C7A=D0LAR; openbmc@lists.ozlabs.org<br>
&gt; Konu: Re: Ynt: Ynt: (External) Re: Adding Inventory<br>
&gt;<br>
&gt;<br>
&gt; Warning: This e-mail came from an external source. If you do not<br>
&gt; trust the sender or if there is anything suspicious in the content of<=
br>
&gt; the e-mail, please inform the IT department.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; As I assumed, it is PCUInfo issue:<br>
&gt;<br>
&gt; |<br>
&gt; /home/pavo/oguz/pavoopenbmc/aspeedopenbmc/openbmc/build/epca/tmp/work<=
br>
&gt; /a<br>
&gt; rm1176jzs-openbmc-linux-gnueabi/smbios-mdr/1.0&#43;gitAUTOINC&#43;e4ea=
37716d-<br>
&gt; r1/git/src/cpuinfo_main.cpp:407:14: error: 'icxd' was not declared in<=
br>
&gt; this scope; did you mean 'icx'?<br>
&gt; |&nbsp;&nbsp; 407 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se icxd:<br>
&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~<br>
&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icx<br>
&gt; |<br>
&gt; /home/pavo/oguz/pavoopenbmc/aspeedopenbmc/openbmc/build/epca/tmp/work<=
br>
&gt; /a<br>
&gt; rm1176jzs-openbmc-linux-gnueabi/smbios-mdr/1.0&#43;gitAUTOINC&#43;e4ea=
37716d-<br>
&gt; r1/git/src/cpuinfo_main.cpp:408:14: error: 'spr' was not declared in<b=
r>
&gt; this scope<br>
&gt; |&nbsp;&nbsp; 408 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se spr:<br>
&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~<br>
&gt;<br>
&gt;<br>
&gt; Turn it off in you bbappend with `PACKAGECONFIG:remove =3D &quot; cpui=
nfo&quot;`<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, 2022-08-15 at 07:25 &#43;0000, O=F0uzhan =C7A=D0LAR wrote:<br>
&gt; &gt;<br>
&gt; &gt; I'm sharing with you that my yocto errors are related to smbios-<=
br>
&gt; &gt; mdr in the .txt file.<br>
&gt; &gt;<br>
&gt; &gt; I don't understand, How can the CPU information match with entity=
-<br>
&gt; &gt; manager configuration files? I saw your comment in openbmc list<b=
r>
&gt; &gt; about<br>
&gt; &gt; PCIe. It probes only with xyz.openbmc_project.FruDevice.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; O=F0uzhan =C7a=F0lar<br>
&gt; &gt; Software Design Engineer<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.<br>
&gt; &gt; Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL<br>
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
&gt; &gt; G=F6nderildi: 12 A=F0ustos 2022 Cuma 22:14:38<br>
&gt; &gt; Kime: O=F0uzhan =C7A=D0LAR; openbmc@lists.ozlabs.org<br>
&gt; &gt; Konu: Re: Ynt: (External) Re: Adding Inventory<br>
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
&gt; &gt; I have no idea on what do you mean saying &quot;added the CPU and=
 DIMM<br>
&gt; &gt; configuration files within the .yaml files&quot;, but I guess you=
 are<br>
&gt; &gt; trying<br>
&gt; &gt; to hardcode this information, which I believe not what ou actuall=
y<br>
&gt; &gt; expect to get.<br>
&gt; &gt; You probably should learn how the OpenBMC works inside. You can u=
se<br>
&gt; &gt; busctl tool for that.<br>
&gt; &gt;<br>
&gt; &gt; Regarding compilation error of smbios-mdr daemon, I can say nothi=
ng<br>
&gt; &gt; without knowing the issue. There should not be any special<br>
&gt; &gt; configuration files for this smbios-mdr recipe but probably you<b=
r>
&gt; &gt; trying<br>
&gt; &gt; to build CPUInfo part of the recipe without having PECI library.<=
br>
&gt; &gt; You<br>
&gt; &gt; likely should disable cpuinfo app.<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 2022-08-12 at 06:50 &#43;0000, O=F0uzhan =C7A=D0LAR wrote=
:<br>
&gt; &gt; &gt; Hi Andrei,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thank you for your information. I have already added the CPU=
 and<br>
&gt; &gt; &gt; DIMM<br>
&gt; &gt; &gt; configuration files within the .yaml files. When I added the=
se<br>
&gt; &gt; &gt; files(related to the path: xyz.openbmc_project.Inventory.Ite=
m.Cpu<br>
&gt; &gt; &gt; and xyz.openbmc_project.Inventory.Item.Dimm), I see the CPU =
and<br>
&gt; &gt; &gt; DIMM<br>
&gt; &gt; &gt; entries over WebUI. However, In this way, I add the properti=
es<br>
&gt; &gt; &gt; such<br>
&gt; &gt; &gt; as (PartNumber, SerialNumber, etc.) on my own. I have alread=
y<br>
&gt; &gt; &gt; generated a .bin file that has FRU information (chassis, boa=
rd<br>
&gt; &gt; &gt; etc.)<br>
&gt; &gt; &gt; and I included this in BMC's image file. In addition, I see =
the<br>
&gt; &gt; &gt; properties related to Chassis, Board on WebUI.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have already checked the smbios-mdr daemon in openbmc. How=
ever,<br>
&gt; &gt; &gt; when I include this daemon in my yocto image, the bitbake sh=
ows<br>
&gt; &gt; &gt; some<br>
&gt; &gt; &gt; errors that are related to smbios-mdr's .cpp files. I guess =
I<br>
&gt; &gt; &gt; have<br>
&gt; &gt; &gt; to<br>
&gt; &gt; &gt; create some configuration files before doing it. Is it wrong=
?<br>
&gt; &gt; &gt; What<br>
&gt; &gt; &gt; should I do?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I guess I have to need some code in BIOS. Is there any examp=
le to<br>
&gt; &gt; &gt; do<br>
&gt; &gt; &gt; this? I don't know where I should start.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thank you.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; O=F0uzhan =C7a=F0lar<br>
&gt; &gt; &gt; Software Design Engineer<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.<br>
&gt; &gt; &gt; Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL<br>
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
&gt; &gt; &gt; G=F6nderen: Andrei Kartashev &lt;a.kartashev@yadro.com&gt;<b=
r>
&gt; &gt; &gt; G=F6nderildi: 11 A=F0ustos 2022 Per=FEembe 22:28:16<br>
&gt; &gt; &gt; Kime: O=F0uzhan =C7A=D0LAR; openbmc@lists.ozlabs.org<br>
&gt; &gt; &gt; Konu: (External) Re: Adding Inventory<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Warning: This e-mail came from an external source. If you do=
 not<br>
&gt; &gt; &gt; trust the sender or if there is anything suspicious in the<b=
r>
&gt; &gt; &gt; content<br>
&gt; &gt; &gt; of<br>
&gt; &gt; &gt; the e-mail, please inform the IT department.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello Oguzhan,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This is a very common question for newcomers, I believe is w=
as<br>
&gt; &gt; &gt; already<br>
&gt; &gt; &gt; answered somewhere in the list.<br>
&gt; &gt; &gt; BMC out of the box don't have any knowledge on host's equipm=
ent<br>
&gt; &gt; &gt; (CPU,<br>
&gt; &gt; &gt; DIMM, Drive, AIC, etc) - it is up to you to deliver this<br>
&gt; &gt; &gt; information<br>
&gt; &gt; &gt; from host to BMC. As for now the most common way to feed BMC=
 the<br>
&gt; &gt; &gt; information regarding CPU and DIMM is to transfer smbios tab=
les<br>
&gt; &gt; &gt; via<br>
&gt; &gt; &gt; ipmi. You can implement any other mechanism but any way, you=
 need<br>
&gt; &gt; &gt; to<br>
&gt; &gt; &gt; have some code in your BIOS.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; As soon as you have the CPU/DIMM information on BMC it can b=
e<br>
&gt; &gt; &gt; shown<br>
&gt; &gt; &gt; in<br>
&gt; &gt; &gt; bmcweb by implementing corresponding dbus interfaces<br>
&gt; &gt; &gt; (xyz.openbmc_project.Inventory.Item.Cpu and<br>
&gt; &gt; &gt; xyz.openbmc_project.Inventory.Item.Dimm). smbiosmdrv2 daemon=
 do<br>
&gt; &gt; &gt; this,<br>
&gt; &gt; &gt; but you also can add EntityManager configuration files for t=
his<br>
&gt; &gt; &gt; or<br>
&gt; &gt; &gt; write your own daemon to expose the interfaces.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 2022-08-04 at 08:07 &#43;0000, O=F0uzhan =C7A=D0LAR =
wrote:<br>
&gt; &gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I'm working on openbmc for ast2500 bmc. I want to add i=
nventory<br>
&gt; &gt; &gt; &gt; such<br>
&gt; &gt; &gt; &gt; as CPU and DIMM etc. I added the chassis from .json fil=
e but I<br>
&gt; &gt; &gt; &gt; couldn't add the CPU and DIMM. I know this is to relate=
d with<br>
&gt; &gt; &gt; &gt; entity-<br>
&gt; &gt; &gt; &gt; manager. How can I add these inventory on WEBUI? Can yo=
u give<br>
&gt; &gt; &gt; &gt; some<br>
&gt; &gt; &gt; &gt; information about this issue?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Regards.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; O=F0uzhan =C7a=F0lar<br>
&gt; &gt; &gt; &gt; Software Design Engineer<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Pavo Tasar=FDm =DCretim Elektronik Tic. A.=DE.<br>
&gt; &gt; &gt; &gt; Teknopark =DDstanbul, Kurtk=F6y Pendik =DDSTANBUL<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Tel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; : &#43;90 (216) 354 72 86<br>
&gt; &gt; &gt; &gt; Faks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : =
&#43;90 (216) 354 76 77<br>
&gt; &gt; &gt; &gt; Gsm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; : &#43;90 (507) 585 10 60<br>
&gt; &gt; &gt; &gt; oguzhan.caglar@pavotek.com.tr<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"http://www.pavotek.com.tr">www.pavotek.com.t=
r</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Best regards,<br>
&gt; &gt; &gt; Andrei Kartashev,<br>
&gt; &gt; &gt; Lead BMC Developer<br>
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
</span></font></div>
</body>
</html>

--_000_3a0124036959480c9c8444aeb663ab0apavotekcomtr_--
