Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB3FA2DD7
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 05:58:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KQgV5V0DzDrfb
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 13:58:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=zhuysh@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
X-Greylist: delayed 136 seconds by postgrey-1.36 at bilbo;
 Fri, 30 Aug 2019 13:57:20 AEST
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KQfS0sbQzDqww
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 13:57:17 +1000 (AEST)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net (Antispam) with ASMTP (SSL) id VLG68444
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 11:54:44 +0800
Received: from jtjnmail201602.home.langchao.com (10.100.2.2) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 30 Aug 2019 11:54:42 +0800
Received: from jtjnmail201602.home.langchao.com ([fe80::10a4:fd44:e4da:6c7d])
 by jtjnmail201602.home.langchao.com ([fe80::10a4:fd44:e4da:6c7d%3])
 with mapi id 15.01.1591.008; Fri, 30 Aug 2019 11:54:42 +0800
From: =?gb2312?B?U2ltb24gWmh1KNbs06Lk+Ck=?= <zhuysh@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: IPMI: Failed to execute IPMI commands with new user
Thread-Topic: IPMI: Failed to execute IPMI commands with new user
Thread-Index: AdVe5mc3p14MCCxxRfSpyY9ZFzH1AQ==
Date: Fri, 30 Aug 2019 03:54:42 +0000
Message-ID: <cd347f5849bd4d24a198bf6df1cedcf8@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.1.52]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_0B0F_01D55F29.B49E9FD0"
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

------=_NextPart_000_0B0F_01D55F29.B49E9FD0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0B10_01D55F29.B49E9FD0"


------=_NextPart_001_0B10_01D55F29.B49E9FD0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

HI all=A3=AC

=20

         I add a new user through IPMI and set privilage to =
Administrator.
E.g. Test2.

=20

         Then I executed ipmi commands with Test2 but failed. =20

In fact, not every time will fail. Sometimes it will execute =
successfully,
sometimes it will report part of the error, but it can return data.

=20

         In the case of failure, it looks like the corresponding user is =
not
found. By default, a non-existing user ID is used and resulting in an =
error.

=20

         My version is :tag 2.6.0; phosphor-ipmi-host
a3a1cdc299fbeee366fee925dc08fa3eaf8b63f2

=20

         Log infos as follow:

        =20

         $ ipmitool -I lanplus -H 100.2.76.161 -U Test2 -P Inspur2@ user
list 1

> Error: no response from RAKP 1 message

Error: Received an Unexpected RAKP 2 message

Error: Received an Unexpected Open Session Response

ID  Name             Callin  Link Auth   IPMI Msg   Channel Priv Limit

1   ADMIN            false   true       true       ADMINISTRATOR

2   shannon          false   true       true       USER

3   liangshengnan    false   true       true       NO ACCESS

4   Test1            false   true       true       ADMINISTRATOR

5   Test2            false   true       true       ADMINISTRATOR

6                    true    false      false      NO ACCESS

7                    true    false      false      NO ACCESS

8                    true    false      false      NO ACCESS

9                    true    false      false      NO ACCESS

10                   true    false      false      NO ACCESS

11                   true    false      false      NO ACCESS

12                   true    false      false      NO ACCESS

13                   true    false      false      NO ACCESS

14                   true    false      false      NO ACCESS

15                   true    false      false      NO ACCESS

=20

=20

$ ipmitool -I lanplus -H 100.2.76.161 -U Test2 -P Inspur2@ user list 1

> Error: no response from RAKP 1 message

Bad response length, len=3D52

IPMI command failed: Insufficient privilege level

=20

=20

=D6=EC=D3=A2=E4=F8 =D1=D0=B7=A2=B6=FE=B4=A6

Simon Zhu   Network BU

Inspur Electronic Information Industry Co., Ltd

Mobile:+86 18668928992 =20

=20


------=_NextPart_001_0B10_01D55F29.B49E9FD0
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Calibri Light";
	panose-1:2 15 3 2 2 2 4 3 2 4;}
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
	{font-family:"Microsoft YaHei UI Light";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"\@Microsoft YaHei UI Light";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:=BB=AA=CE=C4=D0=D0=BF=AC;
	panose-1:2 1 8 0 4 1 1 1 1 1;}
@font-face
	{font-family:"\@=BB=AA=CE=C4=D0=D0=BF=AC";
	panose-1:2 1 8 0 4 1 1 1 1 1;}
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
	color:#010445;}
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
class=3DMsoNormal><span lang=3DEN-US style=3D'color:#010445'>HI =
all</span><span =
style=3D'font-family:=CB=CE=CC=E5;color:#010445'>=A3=AC</span><span =
lang=3DEN-US style=3D'color:#010445'><o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#010445'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#010445'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
I add a new user through IPMI and set privilage to Administrator. E.g. =
Test2.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#010445'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#010445'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Then I executed ipmi commands with Test2 but failed. =
&nbsp;<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-indent:21.0pt'><span lang=3DEN-US =
style=3D'color:#010445'>In fact, not every time will fail. Sometimes it =
will execute successfully, sometimes it will report part of the error, =
but it can return data.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'color:#010445'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#010445'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
In the case of failure, it looks like the corresponding user is not =
found. By default, a non-existing user ID is used and resulting in an =
error.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#010445'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#010445'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
My version is :tag 2.6.0; phosphor-ipmi-host =
a3a1cdc299fbeee366fee925dc08fa3eaf8b63f2<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#010445'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#010445'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Log infos as follow:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'color:#010445'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#010445'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span lang=3DEN-US style=3D'color:red'>$ ipmitool -I lanplus -H =
100.2.76.161 -U Test2 -P Inspur2@ user list 1<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:red'>&gt; Error: no response from RAKP 1 =
message<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:red'>Error: Received an Unexpected RAKP 2 =
message<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:red'>Error: Received an Unexpected Open =
Session Response<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:#010445'>ID&nbsp; =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; =
Callin&nbsp; Link Auth&nbsp;&nbsp; IPMI Msg&nbsp;&nbsp; Channel Priv =
Limit<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:#010445'>1&nbsp;&nbsp; =
ADMIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp; true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ADMINISTRATOR<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:#010445'>2&nbsp;&nbsp; =
shannon&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp; true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; USER<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:#010445'>3&nbsp;&nbsp; =
liangshengnan&nbsp;&nbsp;&nbsp; false&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO =
ACCESS<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:#010445'>4&nbsp;&nbsp; Test1&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;false&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ADMINISTRATOR<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:#010445'>5&nbsp;&nbsp; =
Test2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp; true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ADMINISTRATOR<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US =
style=3D'color:#010445'>6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp; false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO ACCESS<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US =
style=3D'color:#010445'>7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp; false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO ACCESS<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US =
style=3D'color:#010445'>8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;true&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
NO ACCESS<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US =
style=3D'color:#010445'>9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp; false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO ACCESS<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US =
style=3D'color:#010445'>10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp; false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO ACCESS<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US =
style=3D'color:#010445'>11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp; false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO ACCESS<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US =
style=3D'color:#010445'>12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp; &nbsp;false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO ACCESS<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US =
style=3D'color:#010445'>13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp; false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO ACCESS<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US =
style=3D'color:#010445'>14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp; false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO ACCESS<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US =
style=3D'color:#010445'>15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
true&nbsp;&nbsp;&nbsp; false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO ACCESS<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:#010445'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:#010445'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:red'>$ ipmitool -I lanplus -H 100.2.76.161 =
-U Test2 -P Inspur2@ user list 1<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:red'>&gt; Error: no response from RAKP 1 =
message<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:red'>Bad response length, =
len=3D52<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-left:21.0pt;mso-para-margin-left:2.0gd'><span =
lang=3DEN-US style=3D'color:red'>IPMI command failed: Insufficient =
privilege level<o:p></o:p></span></p><div =
style=3D'mso-element:para-border-div;border:none;border-bottom:solid =
windowtext 1.0pt;padding:0cm 0cm 1.0pt 0cm'><p class=3DMsoNormal =
style=3D'border:none;padding:0cm'><span lang=3DEN-US =
style=3D'color:#010445'><o:p>&nbsp;</o:p></span></p></div><p =
class=3DMsoNormal align=3Dleft style=3D'text-align:left'><span =
lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:=BB=AA=CE=C4=D0=D0=BF=AC;color:#010=
445'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left'><span =
style=3D'font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-serif;color:#010445'=
>=D6=EC=D3=A2=E4=F8 =D1=D0=B7=A2=B6=FE=B4=A6<span =
lang=3DEN-US><o:p></o:p></span></span></p><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left'><span lang=3DEN-US =
style=3D'font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-serif;color:#010445'=
>Simon Zhu</span><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-ser=
if;color:#010101'>&nbsp;&nbsp; Network BU</span><span lang=3DEN-US =
style=3D'font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-serif;color:#010445'=
><o:p></o:p></span></p><p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left'><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-ser=
if;color:#010101'>Inspur Electronic Information Industry Co., =
Ltd</span><span lang=3DEN-US =
style=3D'font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-serif;color:#010445'=
><o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-ser=
if;color:#010101'>Mobile:+86 18668928992&nbsp;&nbsp;</span><span =
lang=3DEN-US style=3D'color:#010445'><o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_001_0B10_01D55F29.B49E9FD0--

------=_NextPart_000_0B0F_01D55F29.B49E9FD0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIMKzCCBOgw
ggPQoAMCAQICEHJZ3dAghQm7TR3WtIciZWowDQYJKoZIhvcNAQEFBQAwWzETMBEGCgmSJomT8ixk
ARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTEU
MBIGA1UEAxMLTGFuZ0NoYW8tQ0EwHhcNMDUwMTEyMDcyNTIyWhcNMjQxMTA3MTcyNjM4WjBbMRMw
EQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8xFDASBgoJkiaJk/Is
ZAEZFgRob21lMRQwEgYDVQQDEwtMYW5nQ2hhby1DQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAMvRSQUPw6jL6C6jqLQaQW3/yXkiew6X5DFftp11ymCmwpOEKEAHQEsOqiha/Lkj8ORt
6KjfEHc1Z4AYgzXz9YJx0lJGoM27U/o07gu73XKTYTLEbs+MCb9Juq52ptSsRsZHBb0n4AfBjFON
8gzgDmTg9TRyM2yNXDHoA1pSrHYvNT37urklW4XorW5DeMGohxlpOApkhsqlGpS2w7C2ZAR82NCp
+80yCDXraDZ5cCOhQAyZ6qHcWJIloyi8+gwzJi1MqWB91JjE4wicxof9SCyNtdbx2XwKxSL5U0zM
sZQJ+201lvmaqCrPSMcoUdZxWWKM2yYtro7oEiwB/4jpaHsCAwEAAaOCAaYwggGiMBMGCSsGAQQB
gjcUAgQGHgQAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTGbsOi
E24avQY6XrcvNNjg05z7IzCCARUGA1UdHwSCAQwwggEIMIIBBKCCAQCggf2GgbxsZGFwOi8vL0NO
PUxhbmdDaGFvLUNBLENOPWp0am5jYTAxLENOPUNEUCxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNl
cyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWhvbWUsREM9bGFuZ2NoYW8sREM9Y29t
P2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRp
b25Qb2ludIY8aHR0cDovL2p0am5jYTAxLmhvbWUubGFuZ2NoYW8uY29tL0NlcnRFbnJvbGwvTGFu
Z0NoYW8tQ0EuY3JsMBAGCSsGAQQBgjcVAQQDAgEBMCMGCSsGAQQBgjcVAgQWBBRYQgrth4/MB0pS
3hx7TTpz3BidCDANBgkqhkiG9w0BAQUFAAOCAQEAWjsuzhyiArAxdntQqbkoOaDt/caM2xEA3hWn
gjl4yJeKxxuU0U5KLs7wcaVYantJjeL7jb9r29Aeb5lRzcUHodJgk2xvNYAI0s7ZkmahMSbPIMha
w6sKSiq2bI08u7cyPoW5HxVJz3pEM4IkuLaWmMm/I3BUUQE3rxUdXy7iq2CE7KPNKIf+wDuouDgm
bWItUuIev5toOR37MxpPS02Ci1H2KxOGkMDFAWJawNgzseRaRqEJdgMelpS46KnBaT3uFI/wqG+0
1pMVfldgzOBA9Jaj4AC/AWU+v8Ks6+yX8/14Se7bkRltLqmXI6EGHo6KBiIAP2uGHg7lGzCmR/Ja
dTCCBzswggYjoAMCAQICCmo+N2gAAQABt0AwDQYJKoZIhvcNAQEFBQAwWzETMBEGCgmSJomT8ixk
ARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTEU
MBIGA1UEAxMLTGFuZ0NoYW8tQ0EwHhcNMTQxMjA5MDcyMzUwWhcNMTkxMjA4MDcyMzUwWjCBkjET
MBEGCgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPy
LGQBGRYEaG9tZTEVMBMGA1UECwwM5rWq5r2u5L+h5oGvMRIwEAYDVQQDDAnmnLHoi7Hmvo0xIDAe
BgkqhkiG9w0BCQEWEXpodXlzaEBpbnNwdXIuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEA1yXuTQ7kN2PxhnuMXOd5J7uc9Wc/oKIVFiFbdlyRmFDZVRKSQTZODDE9vJ0dtHqeNBly
LcCyi5+KKVNxavPmAh7HAJQ+2l/iuD8JIxd145AItHysfA9qFHW1joQaBhFAa7Up9PqIY6z+h/T6
59gV+nPG+gZ8nXWrX06ujcuuV/V+4DoUJVdOAsggYdrmkFwPKYWvqxLbepO1OdZfJ+QO+lYS0Ywq
E+Vqzs0PmlPQueM1X3+SsFwHFTCWRRvfRlbFkkao/sveOrn49YOMnMws1aNtI90Xx2hXzWZ5VU1T
PTIUHiYrwvSQr/Z4+SFb8649Cqdz3bzCfne7ygEhJNSfgwIDAQABo4IDxzCCA8MwCwYDVR0PBAQD
AgWgMD4GCSsGAQQBgjcVBwQxMC8GJysGAQQBgjcVCILyqR+Egdd6hqmRPYaA9xWD2I9cgUqGoq0d
hteULAIBZAIBGDBEBgkqhkiG9w0BCQ8ENzA1MA4GCCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAIC
AIAwBwYFKw4DAgcwCgYIKoZIhvcNAwcwHQYDVR0OBBYEFFqTDswje8TD8lki2Qo4fOVgSzgdMB8G
A1UdIwQYMBaAFMZuw6ITbhq9Bjpety802ODTnPsjMIIBFQYDVR0fBIIBDDCCAQgwggEEoIIBAKCB
/YaBvGxkYXA6Ly8vQ049TGFuZ0NoYW8tQ0EsQ049anRqbmNhMDEsQ049Q0RQLENOPVB1YmxpYyUy
MEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9aG9tZSxEQz1s
YW5nY2hhbyxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hjxodHRwOi8vanRqbmNhMDEuaG9tZS5sYW5nY2hhby5jb20v
Q2VydEVucm9sbC9MYW5nQ2hhby1DQS5jcmwwggEwBggrBgEFBQcBAQSCASIwggEeMIGzBggrBgEF
BQcwAoaBpmxkYXA6Ly8vQ049TGFuZ0NoYW8tQ0EsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNl
cnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9aG9tZSxEQz1sYW5nY2hhbyxE
Qz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29iamVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3Jp
dHkwZgYIKwYBBQUHMAKGWmh0dHA6Ly9qdGpuY2EwMS5ob21lLmxhbmdjaGFvLmNvbS9DZXJ0RW5y
b2xsL2p0am5jYTAxLmhvbWUubGFuZ2NoYW8uY29tX0xhbmdDaGFvLUNBKDEpLmNydDApBgNVHSUE
IjAgBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQBgjcKAwQwNQYJKwYBBAGCNxUKBCgwJjAKBggr
BgEFBQcDAjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMEMD8GA1UdEQQ4MDagIQYKKwYBBAGCNxQC
A6ATDBF6aHV5c2hAaW5zcHVyLmNvbYERemh1eXNoQGluc3B1ci5jb20wDQYJKoZIhvcNAQEFBQAD
ggEBAG465sE4KQFZ76y8g+sXlVa6VbQd68pbN3jGDlDVjSH7axCiAYrXDG4olJYLhpbw33PrAVEc
v35QtetI+ljpVG/z1ktSsaJW3WR/HWGQq99dyCq2gxFFtIEh6BjeY1aAlr/irWcoAAXxrl6ehGi1
tPfdUijAHziwMgX76mCLGsniOOddtgOEcOF05Yhj8m3UOufneGpsg697RlkGF9Y0TjRqDxHOMDrG
q5nMZULp0YQFU6NiDWF4PWLtKwdZhq4gYFvNR52rRA+Jqi1PSb375f0hG7GOkJLcgkNo2byPHpTp
Yfxd1LoLNh6k2g4Lakjlfos4Kigrj1krsFak20Sk1IwxggN9MIIDeQIBATBpMFsxEzARBgoJkiaJ
k/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhv
bWUxFDASBgNVBAMTC0xhbmdDaGFvLUNBAgpqPjdoAAEAAbdAMAkGBSsOAwIaBQCgggHpMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE5MDgzMDAzNTQ0MFowIwYJKoZI
hvcNAQkEMRYEFBLaTCMYGEpyK4uamprwtW9m96J4MHgGCSsGAQQBgjcQBDFrMGkwWzETMBEGCgmS
JomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQBGRYE
aG9tZTEUMBIGA1UEAxMLTGFuZ0NoYW8tQ0ECCmo+N2gAAQABt0AwegYLKoZIhvcNAQkQAgsxa6Bp
MFsxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmS
JomT8ixkARkWBGhvbWUxFDASBgNVBAMTC0xhbmdDaGFvLUNBAgpqPjdoAAEAAbdAMIGTBgkqhkiG
9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgB
ZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIaMAsGCWCGSAFlAwQC
AzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAKgxkYGJdhJa501o
iRxh5sAYkKhIMAneNpMWmf9rGllcHxPpYhlAzMVRLGOnD+WsoY3y73ej20DDL/43QPcZQB9joy0Y
1paZUauRyQIwC3QUuzr/mzW4Fdkce9Qfq7CrlcbMQtZaBrKvQfzC/gJFenHt+Ev61N2EJAha2Hck
d0YnmEJ7AiC7hZsnnKegSCxn63HbDx+GxnLBzRQ4kHpvpQpCTUsyfJ5eP/Vlz1cj1As3DQsIsXau
rvwsQmgUmfHtfvZkWpERR4pp1aSrIeG5OPznBvLJMvfjmZyTTSEsjP+1XF89b9n6FwPEHsqcERBD
d4P+e5O6HaH9MeXpubpTkvgAAAAAAAA=

------=_NextPart_000_0B0F_01D55F29.B49E9FD0--
