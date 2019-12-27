Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619B12B27A
	for <lists+openbmc@lfdr.de>; Fri, 27 Dec 2019 08:34:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47kdr00W00zDqFC
	for <lists+openbmc@lfdr.de>; Fri, 27 Dec 2019 18:34:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47kdqK6YdczDqFB
 for <openbmc@lists.ozlabs.org>; Fri, 27 Dec 2019 18:33:47 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Dec 2019 23:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,362,1571727600"; 
 d="scan'208,217";a="250583031"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.48])
 by fmsmga002.fm.intel.com with ESMTP; 26 Dec 2019 23:33:42 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'AKASH G J'" <akashgj91@gmail.com>,
	<openbmc@lists.ozlabs.org>
References: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
In-Reply-To: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
Subject: RE: Serial Over Lan (SOL) no login prompt on Linux IRQ mode
Date: Fri, 27 Dec 2019 15:33:41 +0800
Message-ID: <000001d5bc87$f6fe3780$e4faa680$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0001_01D5BCCB.05263270"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH5WuithICFQcoWTZidcfuIuSdGnqeGVUDg
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWUyZmMxMGUtY2MzZC00NzUzLTlhMGQtNzg0ZGY1YmM2MDEwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoic0JlUjhqNHpkVVhjZnE0c3NoRlpDb2VFcjNJUmQrNzVrcW50QzE2d1FIZmVCQUdDVXpmUVoxcm9nbFFYMTJISSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
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

This is a multipart message in MIME format.

------=_NextPart_000_0001_01D5BCCB.05263270
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

HI Akash,

=20

Just FYI, we are using the below conf file. You can find other related =
files from =
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-as=
t2500/recipes-phosphor/console/obmc-console/obmc-console.conf

=20

cat /etc/obmc-console.conf

baud =3D 115200

local-tty =3D ttyS3

local-tty-baud =3D 115200

=20

Thanks,

Yong

From: openbmc =
<openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org> On Behalf =
Of AKASH G J
Sent: Friday, December 27, 2019 2:54 PM
To: openbmc@lists.ozlabs.org
Subject: Serial Over Lan (SOL) no login prompt on Linux IRQ mode

=20

Hi all,

=20

We are using BMC Aspeed AST-2500 in our motherboard with OpenBMC =
firmware. 'obmc-console' is used to get host messages over BMC. =
obmc-console.conf looks like=20

lpc-address =3D 0x3f8
sirq =3D 4
local-tty =3D ttyS4
local-tty-baud =3D 115200

=20

BIOS serial redirection is enabled over COM port 0 (0x3f8, sirq=3D4, =
baudrate=3D115200) for super-IO.

=20

we set /dev/ttyS0 in CentOS to work in polling mode by making its =
irq=3D0 using the following command=20

=20

$ setserial /dev/ttyS0 uart 16550a irq 0=20

Now we are getting CentOS login prompt on SOL.=20

When we change /dev/ttyS0 back to interrupt mode with irq=3D4, we are =
not getting login prompt on SOL.

=20

Whether anything is required to be done in OpenBMC firmware/BIOS to =
enable irq mode for SOL ?

=20

=20

=20

Thanks,

=20

Akash


------=_NextPart_000_0001_01D5BCCB.05263270
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>HI Akash,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Just FYI, we =
are using the below conf file. You can find other related files from <a =
href=3D"https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods=
/meta-ast2500/recipes-phosphor/console/obmc-console/obmc-console.conf">ht=
tps://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-ast2=
500/recipes-phosphor/console/obmc-console/obmc-console.conf</a><o:p></o:p=
></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>cat =
/etc/obmc-console.conf<o:p></o:p></p><p class=3DMsoNormal>baud =3D =
115200<o:p></o:p></p><p class=3DMsoNormal>local-tty =3D =
ttyS3<o:p></o:p></p><p class=3DMsoNormal>local-tty-baud =3D =
115200<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Yong<o:p></o:p></p><p class=3DMsoNormal><a =
name=3D"_____replyseparator"></a><b>From:</b> openbmc =
&lt;openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org&gt; =
<b>On Behalf Of </b>AKASH G J<br><b>Sent:</b> Friday, December 27, 2019 =
2:54 PM<br><b>To:</b> openbmc@lists.ozlabs.org<br><b>Subject:</b> Serial =
Over Lan (SOL) no login prompt on Linux IRQ mode<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Hi =
all,</span><o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>We are using =
BMC Aspeed AST-2500 in our motherboard with OpenBMC firmware. =
'obmc-console' is used to get host messages over BMC. obmc-console.conf =
looks like <br><br><i><span style=3D'color:blue'>lpc-address =3D =
0x3f8<br>sirq =3D 4<br>local-tty =3D ttyS4<br>local-tty-baud =3D =
115200</span></i></span><o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>BIOS serial =
redirection is enabled over COM port 0 (<i>0x3f8, sirq=3D4, =
baudrate=3D115200</i>) for super-IO.</span><o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>we set =
<i>/dev/ttyS0</i> in CentOS to work in polling mode by making its =
<i>irq=3D0</i> using the following command =
</span><o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:blue'>$ =
setserial /dev/ttyS0 uart 16550a irq 0 </span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'><br><br>Now we =
are getting CentOS login prompt on SOL. </span><o:p></o:p></p><div><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>When we change =
/dev/ttyS0 back to interrupt mode with irq=3D4, we are not getting login =
prompt on SOL.</span><o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Whether =
anything is required to be done in OpenBMC firmware/BIOS to enable irq =
mode for SOL</span><span style=3D'font-size:10.0pt;font-family:"Times =
New Roman",serif'> ?</span><o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Thanks,</span><=
o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Akash</span><o:=
p></o:p></p></div></div></div></div></body></html>
------=_NextPart_000_0001_01D5BCCB.05263270--

