Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D4D485F49
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 04:39:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTsXV5cKQz301M
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 14:39:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inspur.com (client-ip=210.51.26.145;
 helo=unicom145.biz-email.net; envelope-from=maxiaochao@inspur.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 126 seconds by postgrey-1.36 at boromir;
 Thu, 06 Jan 2022 14:38:47 AEDT
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTsX75lJTz2xKJ
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 14:38:47 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id AUQ00012
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jan 2022 11:36:12 +0800
Received: from jtjnmail201604.home.langchao.com (10.100.2.4) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 11:36:11 +0800
Received: from jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322])
 by jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322%5])
 with mapi id 15.01.2308.020; Thu, 6 Jan 2022 11:36:11 +0800
From: =?gb2312?B?WGlhb2NoYW8gTWEgKMLt0KGzrCk=?= <maxiaochao@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Update (or generate) /etc/ipmi_pass file
Thread-Topic: Update (or generate) /etc/ipmi_pass file
Thread-Index: AdgCrg4my0csNWtVRYG20ese5zhM7g==
Date: Thu, 6 Jan 2022 03:36:11 +0000
Message-ID: <3e6afebf819c4784a4dbacacccb74214@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.192.64]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_0013_01D802F1.99A79420"
MIME-Version: 1.0
tUid: 202210611361214c5acc4862253592c33e8b896491794
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

------=_NextPart_000_0013_01D802F1.99A79420
Content-Type: multipart/related;
	boundary="----=_NextPart_001_0014_01D802F1.99A79420"


------=_NextPart_001_0014_01D802F1.99A79420
Content-Type: multipart/alternative;
	boundary="----=_NextPart_002_0015_01D802F1.99A79420"


------=_NextPart_002_0015_01D802F1.99A79420
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

Hello everyone

=20

I now want to add a default user to my own machine (I modified
obmc-phosphor-image.bbappend, use the useradd=A1=AD ),=20

but the new default user cannot use Ipmi. It is because the ipmi_pass =
file
is not updated.

  I couldn't find a method/tool to generate ipmi_pass file. So how can I
generate a new ipmi_pass file?

=20

Thanks!

=20

=20

=20


Xiaochao Ma  |  =C2=ED=D0=A1=B3=AC

=20

=20


P.R&D  |  =B2=FA=C6=B7=D1=D0=B7=A2=B2=BF

=20

=20


T: 15269453343

=20

=20


E:  <mailto:maxiaochao@inspur.com> maxiaochao@inspur.com

=20

=20


=20






=C0=CB=B3=B1=C9=CC=D3=C3=BB=FA=C6=F7=D3=D0=CF=DE=B9=AB=CB=BE


Inspur Power Commercial Systems Co., Ltd


=B1=B1=BE=A9=CA=D0=BA=A3=B5=ED=C7=F8=C9=CF=B5=D8=D0=C5=CF=A2=C2=B72=BA=C5=
C=D7=F95=B2=E3


5F,Tower C,No.2 Xinxi Road.Shangdi,Haidian District,Beijing,P.R.China

=C0=CB=B3=B1=C9=CC=D3=C3=BB=FA=C6=F7

=C0=CB=B3=B1=B7=FE=CE=F1=C6=F7

=20

=20


------=_NextPart_002_0015_01D802F1.99A79420
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><!--[if =
!mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:=CE=A2=C8=ED=D1=C5=BA=DA;
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=CE=A2=C8=ED=D1=C5=BA=DA";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"=CE=A2=C8=ED=D1=C5=BA=DA Light";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"\@=CE=A2=C8=ED=D1=C5=BA=DA Light";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
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
</o:shapelayout></xml><![endif]--></head><body lang=3DZH-CN =
link=3D"#0563C1" vlink=3D"#954F72" =
style=3D'text-justify-trim:punctuation'><div class=3DWordSection1><p =
class=3DMsoNormal><span lang=3DEN-US>Hello =
everyone<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-indent:10.5pt'><span lang=3DEN-US style=3D'color:black'>I =
now want to add a default user to my own machine (I modified =
obmc-phosphor-image.bbappend, use the useradd=A1=AD ), =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:black'>but the new default user cannot use Ipmi. It is =
because the ipmi_pass file is not updated.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US style=3D'color:black'>&nbsp; I =
couldn't find a method/tool to generate ipmi_pass file. So how can I =
generate a new ipmi_pass file?<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:black'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:black'>Thanks!<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:black'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><table =
class=3DMsoNormalTable border=3D0 cellspacing=3D0 cellpadding=3D0 =
style=3D'margin-left:31.2pt;border-collapse:collapse'><tr><td =
width=3D368 valign=3Dtop style=3D'width:276.15pt;padding:0cm 5.4pt 0cm =
5.4pt'><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:black'>Xiaochao Ma&nbsp; <b>|</b>&nbsp; </span><span =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:black'>=C2=ED=D0=A1=B3=AC</span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 valign=3Dtop =
style=3D'width:65.45pt;padding:0cm 5.4pt 0cm 5.4pt'><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left'><span lang=3DEN-US =
style=3D'color:#1F497D'>&nbsp;</span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 valign=3Dtop =
style=3D'width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt'><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left'><span lang=3DEN-US =
style=3D'color:#1F497D'>&nbsp;</span><span =
lang=3DEN-US><o:p></o:p></span></p></td></tr><tr><td width=3D368 =
valign=3Dtop style=3D'width:276.15pt;padding:0cm 5.4pt 0cm 5.4pt'><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:black'>P.R&amp;D <b>&nbsp;|</b>&nbsp; </span><span =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:black'>=B2=FA=C6=B7=D1=D0=B7=A2=B2=BF</span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 valign=3Dtop =
style=3D'width:65.45pt;padding:0cm 5.4pt 0cm 5.4pt'><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left'><span lang=3DEN-US =
style=3D'color:#1F497D'>&nbsp;</span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 valign=3Dtop =
style=3D'width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt'><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left'><span lang=3DEN-US =
style=3D'color:#1F497D'>&nbsp;</span><span =
lang=3DEN-US><o:p></o:p></span></p></td></tr><tr><td width=3D368 =
valign=3Dtop style=3D'width:276.15pt;padding:0cm 5.4pt 0cm 5.4pt'><p =
class=3DMsoNormal><b><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#165EA2'>T:</span></b><b><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'> </span></b><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>15269453343</span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 valign=3Dtop =
style=3D'width:65.45pt;padding:0cm 5.4pt 0cm 5.4pt'><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left'><span lang=3DEN-US =
style=3D'color:#1F497D'>&nbsp;</span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 valign=3Dtop =
style=3D'width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt'><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left'><span lang=3DEN-US =
style=3D'color:#1F497D'>&nbsp;</span><span =
lang=3DEN-US><o:p></o:p></span></p></td></tr><tr><td width=3D368 =
valign=3Dtop style=3D'width:276.15pt;padding:0cm 5.4pt 0cm 5.4pt'><p =
class=3DMsoNormal><b><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#165EA2'>E:</span></b><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#165EA2'> </span><span lang=3DEN-US style=3D'color:#3E3A3A'><a =
href=3D"mailto:maxiaochao@inspur.com"><span =
style=3D'color:#0563C1'>maxiaochao</span><span =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#0563C1'>@inspur.com</span></a></span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 valign=3Dtop =
style=3D'width:65.45pt;padding:0cm 5.4pt 0cm 5.4pt'><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left'><span lang=3DEN-US =
style=3D'color:#1F497D'>&nbsp;</span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 valign=3Dtop =
style=3D'width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt'><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left'><span lang=3DEN-US =
style=3D'color:#1F497D'>&nbsp;</span><span =
lang=3DEN-US><o:p></o:p></span></p></td></tr><tr><td width=3D368 =
valign=3Dtop style=3D'width:276.15pt;padding:0cm 5.4pt 0cm 5.4pt'><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#1F497D'>&nbsp;</span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 rowspan=3D4 =
valign=3Dbottom style=3D'width:65.45pt;padding:0cm 5.4pt 0cm 5.4pt'><p =
class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><span =
lang=3DEN-US style=3D'color:#1F497D'><img border=3D0 width=3D81 =
height=3D81 id=3D"=CD=BC=C6=AC_x0020_1" =
src=3D"cid:image001.jpg@01D802F1.96D0CD70" =
alt=3D"cid:image001.jpg@01D664C7.5D85FD20"></span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 rowspan=3D4 =
valign=3Dbottom style=3D'width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt'><p =
class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><span =
lang=3DEN-US style=3D'color:#1F497D'><img border=3D0 width=3D80 =
height=3D80 id=3D"=CD=BC=C6=AC_x0020_2" =
src=3D"cid:image002.jpg@01D802F1.96D0CD70" =
alt=3D"cid:image002.jpg@01D664C7.5D85FD20"></span><span =
lang=3DEN-US><o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.95pt'><td width=3D368 valign=3Dtop =
style=3D'width:276.15pt;padding:0cm 5.4pt 0cm 5.4pt;height:14.95pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:=CB=CE=CC=E5;color:#3D3B3A'>=C0=CB=B3=
=B1=C9=CC=D3=C3=BB=FA=C6=F7=D3=D0=CF=DE=B9=AB=CB=BE</span><span =
lang=3DEN-US><o:p></o:p></span></p></td></tr><tr><td width=3D368 =
valign=3Dtop style=3D'width:276.15pt;padding:0cm 5.4pt 0cm 5.4pt'><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA =
Light",sans-serif;color:#3D3B3A'>Inspur Power Commercial Systems Co., =
Ltd</span><span lang=3DEN-US><o:p></o:p></span></p></td></tr><tr><td =
width=3D368 valign=3Dtop style=3D'width:276.15pt;padding:0cm 5.4pt 0cm =
5.4pt'><p class=3DMsoNormal><span =
style=3D'font-size:7.5pt;font-family:=CB=CE=CC=E5;color:#3D3B3A'>=B1=B1=BE=
=A9=CA=D0=BA=A3=B5=ED=C7=F8=C9=CF=B5=D8=D0=C5=CF=A2=C2=B7</span><span =
lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA =
Light",sans-serif;color:#3D3B3A'>2</span><span =
style=3D'font-size:7.5pt;font-family:=CB=CE=CC=E5;color:#3D3B3A'>=BA=C5</=
span><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA =
Light",sans-serif;color:#3D3B3A'>C</span><span =
style=3D'font-size:7.5pt;font-family:=CB=CE=CC=E5;color:#3D3B3A'>=D7=F9</=
span><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA =
Light",sans-serif;color:#3D3B3A'>5</span><span =
style=3D'font-size:7.5pt;font-family:=CB=CE=CC=E5;color:#3D3B3A'>=B2=E3</=
span><span lang=3DEN-US><o:p></o:p></span></p></td></tr><tr><td =
width=3D368 valign=3Dtop style=3D'width:276.15pt;padding:0cm 5.4pt 0cm =
5.4pt'><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA =
Light",sans-serif;color:#3D3B3A'>5F,Tower C,No.2 Xinxi =
Road.Shangdi,Haidian District,Beijing,P.R.China</span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 valign=3Dtop =
style=3D'width:65.45pt;padding:0cm 5.4pt 0cm 5.4pt'><p class=3DMsoNormal =
align=3Dcenter =
style=3D'text-align:center;line-height:10.0pt;mso-line-height-rule:exactl=
y'><span =
style=3D'font-size:7.5pt;font-family:=CB=CE=CC=E5;color:#3D3B3A'>=C0=CB=B3=
=B1=C9=CC=D3=C3=BB=FA=C6=F7</span><span =
lang=3DEN-US><o:p></o:p></span></p></td><td width=3D95 valign=3Dtop =
style=3D'width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt'><p class=3DMsoNormal =
align=3Dcenter =
style=3D'text-align:center;line-height:10.0pt;mso-line-height-rule:exactl=
y'><span =
style=3D'font-size:7.5pt;font-family:=CB=CE=CC=E5;color:black'>=C0=CB=B3=B1=
=B7=FE=CE=F1=C6=F7</span><span =
lang=3DEN-US><o:p></o:p></span></p></td></tr></table><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_002_0015_01D802F1.99A79420--

------=_NextPart_001_0014_01D802F1.99A79420
Content-Type: image/jpeg;
	name="image001.jpg"
Content-Transfer-Encoding: base64
Content-ID: <image001.jpg@01D802F1.96D0CD70>

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMg
IyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCABRAFEDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD1XXdd
svDmmNf6izrbqyoSiFjknA4FYH/C0NB/556n/wCAEv8AhR8UP+RTj/6/rb/0YK4m+vvG6/FLyYf7
Z/sf+0kX5YX8nyt4zzjG3GaAPRLHx1o2oWcN1BJP5Mt0bTc8DLskAyd2R8o56mqcfxQ8My2+oTre
vssComzGcnLbRtH8XPpXO6Vrmm6Ro2vQ6tZXN9Df+Iru3FvBF5jSE4ONuRnpWf4x+HUNzPBeWujx
WeiQqJJBYRs17JuUceWRg4bHfgZoA9O0/wAQafql7f2tnOJHsCgnYfdG5dww3Q8flWYfH+hDUrqx
NxJ59tE8zfujh1XrsP8AGfQDOa8v8N6mk+g6tfaNZ3FpBIUOpW1jGSYmGRGsQ5yjAHfu6ZOKjvLP
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
KACiiigAooooAKKKKAP/2QA=

------=_NextPart_001_0014_01D802F1.99A79420
Content-Type: image/jpeg;
	name="image002.jpg"
Content-Transfer-Encoding: base64
Content-ID: <image002.jpg@01D802F1.96D0CD70>

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMg
IyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCABQAFADASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD1TXte
s/Demm/1AyCAOqfu0LkljgcCsH/hZujf8+ur/wDgvk/wo+Jv/ItW3/YRtf8A0YK4ySTxx/wtQKo1
n+xf7SHRX8nyd4zz024oA7S4+J/h610eHU5pblbaaZ4FzA27euNwI7dal1P4j6FpGqS2F290JYTG
JGWBiibwCuW6DIIrz6fWtM0bRUfW9Kg1Cyk169WQSR73QZ6pkgZzjrWr4yfSdVgsJG0rxBb3WrK7
tY2tuge58naF89CckAAYx2JoA7+98UabYTeXLI7A2zXKyRoWR1BxtVhwznso5NUNA+IGheJNQlsb
GeRbmMcxzxmM5zjAz1PtXHT63pC2GjprMF7YgRrbNHaIq2umXJY7XO45SVRyM5wOcVgaXdrY+MdX
ujplrLqUFsG0rzYyXv38w4nHOXd1yxK9aAPW9Y8X6Lomny3l1fwNHEQGWJw78kDhQc9TUVx420i2
8NWuuu85sbpwkRWIl2JJAG3r2NeeeIbLw5q/hi8h/sSDwxqjhGim1SEWwlIYF/LOSTwMH/eHrWD4
Qv7q78FWsNxPJJHba/ZJCjHIjXJOB6c0Aeo/8LN0b/n11f8A8F8n+Fb2g69Z+I9MW/08yGBnZP3i
FTlTg8GvL7eTxx/wtQrINZ/sX+0n6q/k+TvOOem3GK7L4Y/8irL/ANf9z/6NNAG74g0C08S6YbC/
MohLrJmJ9jBlORg1wd/o2gaZ4utNAvNW8QRSXcAkhlOpPtdy+wR49T1z0rW+L8c0/gV4bckSy3UK
JhsclsDmvM9f+Hr2uoeGrcPHbvdeTaXki3AldLlmbJ27s4wB0wKAPUtD8EaW9jBHd6ddRrY3s0sU
d3Ksvmlhgu3Yg9QDzXHWegeKbqTRbvR9ZtdStLeK8WG98pj5e7gqxY7iSQVX0xVC88EazqF7a6N9
ottN0O2kbMgvUlcvjDSkFg3zYHy5wM1sv4whh0+wv7COTXbrTRJC9+UNqYxI20FIQMSYA5xnG3tm
gDBv/C3juKwtkGnxXoubFop42RSUZiRufLfNKB0fqBVb7VNrWr6bYWVxBYaoYI9FmhmjLy25iBzK
rj7uSCODmtHU7PxXqmvI9tqmoXVvJZNBdXU+mi2KQs3zqqHG5scjHzdhXWW1pcLYTyeHtPMeow6Z
FZ2+oXR8qSV0IGPJfgcc7j1ziiwXOJnvJPEUniHSpL631rVXNoLBY4yobyzmURh/unavzcjOO9dX
fw+El8L6rc38Vxpri6Sa5s4pNjw3CofLRSowCQM8cc1FplrqXgTxBoukya9Dc2t4l1JLC1tEhicR
lx83J5ZvUdKpX+pWtn8MYdXvLVLzW7+4jmmUylHFwNwSTYP7uB8uMHvQBlnWNDtY2bVG8T2DPZC8
tVk1Vj9pVj8oXHTPPX0r0f4Yz6fc+DIZdKguILZppCFuJfMfdu5Jb61xGjeJdVuZLBPGGkw332bb
qSXiyqjQRkbQvloPmYcnZ156cV2XwqlSbwcZY87HvbhlyMcGQ447UAaPjq2s7jwzK1/drax27rcI
zMFDOh3KuT6kY9a8ritH1fWtL8Xyx6ZBJc3EcdrFYSF996x3oLgH7oPO7HI44r1Lx7YjUPDEkX9n
3GoMsiOkEBXJYHIzngrnqPSuEtdHm8OX0WriSzhlSx/tXUNFljJ2MrfPJCg+VCMBVPUc9qANJfC/
hnXdG1Ia1/YFnqauzXNxp9wG8jLfeYsflJOQc1Jb/YNMHha6kiCtF9pt7Y6QPOslaVtvzSHkEkj8
c+lcsPEEfiDUL/TYotIltL+NZHg0628q7uNzFvLDnguuAWJ464rudZ0uTw49tc6X9nj0y6uYIriz
uF3LCSyqphUYVDkkk9zg0IGeeppEdwV2X0Rd1DEN1yR659c/pTZtIFusshuosRDPH3t393GetL9u
svIRZbItMiBdx+UAj2Hv+ftTGurBrdkjsMTMMKxYnBI/xzj8K+i98+d9w0vFml6fc+NRa61aauZn
dZbS6srYSPd5UMysTwRGMKNvQZzVvxR4k0O2+J1rZWnh+znvTeRJc3U6EOshZcMpB5wCOo6itN9T
jtPHtxoelC4l16cCWC51J/Ot7XKb3Ea/eQFSVwPbsK5zxhoOoavevLILWXVbOZftGoaahiitVHLN
Nn5iwGGBHQCvnWfRIm1bWrbSfGc3h4wyW1vd6k962oXqeVJbTOxUyRHO0oAvysfU16d4MutKvPD6
SaIjLaiV1LMADI4bDPwSOTzn3ryf7ToFtotpDq2uWWt6uL7fDdybpFiTZgCXeNzRg5O0dzXqvge2
0q18MxJolylzal3YyIfl3k5YLwMDOcCgCPx9HHJ4dUyXT2xS5idCiM29g2QnHQMeMngda5u903Q/
Gl7Pr2uSuiabZNaXthE7ExSKd7HehG8ANjgEGuk8f3cNn4Wma4vbyzjkdYjJaRCSQ7jjaAfXOK81
8MWGleFLq8urCPxZ59xavbq50o5i3EHcPcbaAKEklto/iaDxVHe/bLK1Ai06FbUwtOVBHlEdRtVg
d7D5sV03jPXbbwv4wj1C48PTSTXiZgvDfMyHCKGbyMEfLnv1xmmSXcVr4eHjGxtv7ZvbGZ0mu9TB
gmjAwoUKvBwWPWqJOtW93o2sT6xZ+IL2MSxT2EdwshjWUhfkCDLfLyfTFAFKTVr7S5Z9V1bxbcvB
dK0lpCtqwW+i/wBkg4gYkFQcZXrWxqfjC01Dw+NS8KJfzajaWyNOhuJBHa4A5ZWG2Y5OD3PWr2n2
+m603iTwlqcUy6fYzObSUp+5s0VABh+m4bicGmG3m0Tw0y+ENQisYH/0TOoOtujSKBm4jJzvLADp
xjpQFjlbibWNQuLvUPGjxyS6IIStpFsheX7R8qnzE5+XCtjn04rU1S58X6T4lk0zQjbPd3qGe5um
eHbelcLv2NxHgEDbnnGap6Do7atdeJZ/ETaVrOpW4tQlzPdYgAfIP7xcDOMD6gCqtr8L9NfU9Vtp
73UmSzvo7OM29uHY71B3MOwGeTQBueAtA1Oz8X3GpGzi1WG6zBqEpCQraXG4NIFU/fC8crwc8dK7
7wFPZT+HnbTrI2cAu518oymT5g5BOT6nnHavNWutY0Tw7fLB4j1YvZajLpOn20FujiQxqNgPGenp
Xo3w5llm8IQPcaYdNmaRy8JVlJbPLENzknmgCD4m/wDItW3/AGEbX/0YK42SDxz/AMLUDqdZ/sX+
0gcCRvJ8neM8ZxtxXqGvaDZeI9NNjqKu0BdXwjlDkHI5FYP/AArHQ/8Anrqn/gfL/jQBj+GmCeHd
Re9bTxo66xd/2gL1SQU3/Lt7Z3Y61wvgiTQP7GuktdRj0vXzcx7bq5cKNnmNlYSo3AFOGHfI7V7F
B4J0eDwzcaCkcxsLli8itKxYkkE/N16gUzT/AADoGmnTjb2Qzp4kEJc7vvnJ3Z+97Z6dqAMLxTqG
maJ4ugtzcW9l9uhMl6l2cWlxEW2vlRyZiBgE8YyDWRrQ0nTbGHWrDzfE2hrOyXFvMVuIbKMDP7lT
gJjIA9uK7m68F6PfTma6geZzeLeZkcth16AZ/h/2elVo/h9oUSanHHFOsWphvtEYnYJ8zbjtXovI
7UAed6VHo8vjDShZ3Gm3C6ilw9/p9kP9ExFGWhzHjqOpzn5gSMVZ0TS5/Fdnc+JLPxNNpzz27y6j
Fa3LRLFcAfISADhAoyckmvS9O8LaTpWpXF/aWiJcXCIjnHACKVGB24POOtZN78M/D97eXNy0V1E1
ycypBcPGh4x90HHSgDyzw1Z319ZXNppGqC/1mbU5Ed2kZ44EwP8ATE/iVi3G/rg9K9j8HXGr3Hh6
I6/CIr6N2jYBSNyqcBuSTyBnNRaX4G0XRtFutMsIJIoLrPmOJD5nIAID9QOBWno+j2+h6etlZtM0
SsWBmlMjc+55oA//2QA=

------=_NextPart_001_0014_01D802F1.99A79420--

------=_NextPart_000_0013_01D802F1.99A79420
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
KoZIhvcNAwQCAgCAMAcGBSsOAwIHMAoGCCqGSIb3DQMHMB0GA1UdDgQWBBSQmhIT5stHwDWAnskw
M0mlgnF98zAfBgNVHSMEGDAWgBReWQOmtExYYJFO9h61pTmmMsE1ajCB0QYDVR0fBIHJMIHGMIHD
oIHAoIG9hoG6bGRhcDovLy9DTj1JTlNQVVItQ0EsQ049SlRDQTIwMTIsQ049Q0RQLENOPVB1Ymxp
YyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9aG9tZSxE
Qz1sYW5nY2hhbyxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENs
YXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MIHEBggrBgEFBQcBAQSBtzCBtDCBsQYIKwYBBQUHMAKG
gaRsZGFwOi8vL0NOPUlOU1BVUi1DQSxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMs
Q049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1ob21lLERDPWxhbmdjaGFvLERDPWNvbT9j
QUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTBHBgNV
HREEQDA+oCUGCisGAQQBgjcUAgOgFwwVbWF4aWFvY2hhb0BpbnNwdXIuY29tgRVtYXhpYW9jaGFv
QGluc3B1ci5jb20wDQYJKoZIhvcNAQELBQADggEBAGsWSCGucuJ7y3TgHBxlOjx4SQI21uq4CL6G
qb2ZIkFEyh5txT3tPEtqyq9R1ZQpMzoLviuMOhiBoeiQ9y1qee/K/ymINc5Nybv7X7lo2/tu7RVT
MWrkWgwx+i4uzTcA0S0hJOPZI9ZRCguzdHdRRR/yf4sgzPfApi/gbQIMB+1LqaNDpE9XrGW+JEIo
gxY5CGbOJcCgNYFrWm1RZQ0J55hJCi6gcPot2gTHP4XdTmn7OQEv5IVPGoiiqKD7ypIJHoC3wT3W
16jEnpKztq3AkCrtjTQLky9wGYCIKDKnMVXiGIdWsXYxPXk1/qqTqkSODudN2NfYhIPnwmNwlD1i
cdkxggOTMIIDjwIBATBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghs
YW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQQITfgAAWncu
phIKGbI09AAAAABadzAJBgUrDgMCGgUAoIIB+DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yMjAxMDYwMzM2MDlaMCMGCSqGSIb3DQEJBDEWBBRFYhqERKI1tYvz8tYM
ov7r22MBJTB/BgkrBgEEAYI3EAQxcjBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJ
k/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1D
QQITfgAAWncuphIKGbI09AAAAABadzCBgQYLKoZIhvcNAQkQAgsxcqBwMFkxEzARBgoJkiaJk/Is
ZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUx
EjAQBgNVBAMTCUlOU1BVUi1DQQITfgAAWncuphIKGbI09AAAAABadzCBkwYJKoZIhvcNAQkPMYGF
MIGCMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4G
CCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZI
AWUDBAICMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAUCi5OF2oxTjguDpdAfsb8Q/OH
eNiYbysxMfXmpwU4V5eOQINVwviNyLdDpfUD3XyGjGf1AssxLDhi7poaZm4UJuoQl4IDpTGQkvFC
f3OOmXqb9KbJ456+MDLHOXCpsb8z+3fGXpxFBdelKwcKb7KX5kBOqHX8CxQ337118QjLBFCaKNFf
IxaT5QzXmABHTNbw+X4q1/d5m2J8zVgL2TLbWJA3hYfXuJcsbOoEgy9xFs1U8vLBY03q+g+3Xfhl
Gfcnbl8BsqXi2SdcbdQ0BOrwvfhB2JXHelFjFhGbyi/i6VhLadoKxrQiyS275IxwYpLzT5qdh6gf
CMJoOlL3tYoWAAAAAAAA

------=_NextPart_000_0013_01D802F1.99A79420--
