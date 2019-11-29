Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E59E10D1A7
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2019 07:57:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PQLT0V8qzDr7h
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2019 17:57:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PQKf11zLzDr58
 for <openbmc@lists.ozlabs.org>; Fri, 29 Nov 2019 17:56:52 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 22:56:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,256,1571727600"; 
 d="scan'208,217";a="359987157"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.63])
 by orsmga004.jf.intel.com with ESMTP; 28 Nov 2019 22:56:47 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: <openbmc@lists.ozlabs.org>
Subject: license conflicts with OpenSSL
Date: Fri, 29 Nov 2019 14:56:46 +0800
Message-ID: <000001d5a682$2b3fabd0$81bf0370$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0001_01D5A6C5.3963FD40"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdWmga5ssB2f9xIzTCqkh8Kxq6hw8g==
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGVjYTlkMGEtOTNkMS00OTZmLTgzNGQtMTAwYWY1YjIyMDU2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUEdoSUxsc3I1YlIzempLc3B6SkFPdnN1VUlCYTlzRjdoOHRpeHZyb0plc3pEOWxKZGpLd1J4RGczUUlXdittXC8ifQ==
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

------=_NextPart_000_0001_01D5A6C5.3963FD40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

 

Just found that some packages included in openbmc have license conflict
issues between OpenSSL and GPL

 

Ipmitool package and krb5 package are both linked to openssl and other GPL
libs. 

 

Based on the discussion in
https://lists.debian.org/debian-legal/2004/05/msg00595.html, I think they
are conflict licenses.

 

Just want to know if we need to do something? Such as add an additional
license file?

 

 

More information:

meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb

LICENSE = "BSD-3-Clause"

DEPENDS = "openssl readline ncurses"

 

Readline is GPLv3

 

meta-openembedded/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb:

LICENSE = "MIT"

DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native
openssl"

 

Util-linux is GPLv2

 

 

Thanks,

Yong


------=_NextPart_000_0001_01D5A6C5.3963FD40
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
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
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
class=3DMsoNormal>Hi All,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Just found =
that some packages included in openbmc have license conflict issues =
between OpenSSL and GPL<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Ipmitool =
package and krb5 package are both linked to openssl and other GPL libs. =
<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Based on the discussion in <a =
href=3D"https://lists.debian.org/debian-legal/2004/05/msg00595.html">http=
s://lists.debian.org/debian-legal/2004/05/msg00595.html</a>, I think =
they are conflict licenses.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Just want to =
know if we need to do something? Such as add an additional license =
file?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>More =
information:<o:p></o:p></p><p =
class=3DMsoNormal>meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmit=
ool_1.8.18.bb<o:p></o:p></p><p class=3DMsoNormal>LICENSE =3D =
&quot;BSD-3-Clause&quot;<o:p></o:p></p><p class=3DMsoNormal>DEPENDS =3D =
&quot;openssl readline ncurses&quot;<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Readline is =
GPLv3<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>meta-openembedded/meta-oe/recipes-connectivity/krb5/krb=
5_1.17.bb:<o:p></o:p></p><p class=3DMsoNormal>LICENSE =3D =
&quot;MIT&quot;<o:p></o:p></p><p class=3DMsoNormal>DEPENDS =3D =
&quot;bison-native ncurses util-linux e2fsprogs e2fsprogs-native =
openssl&quot;<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Util-linux is GPLv2<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Yong<o:p></o:p></p></div></body></html>
------=_NextPart_000_0001_01D5A6C5.3963FD40--

