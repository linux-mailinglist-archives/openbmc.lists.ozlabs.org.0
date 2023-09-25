Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B137AE212
	for <lists+openbmc@lfdr.de>; Tue, 26 Sep 2023 01:08:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=montage-tech.com header.i=amutha.krishnasamy@montage-tech.com header.a=rsa-sha256 header.s=S1 header.b=bb2jdA6U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvdny1Cs6z3cCl
	for <lists+openbmc@lfdr.de>; Tue, 26 Sep 2023 09:08:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=montage-tech.com header.i=amutha.krishnasamy@montage-tech.com header.a=rsa-sha256 header.s=S1 header.b=bb2jdA6U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=montage-tech.com (client-ip=12.176.92.53; helo=usmail.montage-tech.com; envelope-from=prvs=163232c987=amutha.krishnasamy@montage-tech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 213 seconds by postgrey-1.37 at boromir; Tue, 26 Sep 2023 04:59:58 AEST
Received: from usmail.montage-tech.com (usmail.montage-tech.com [12.176.92.53])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvXHf2lhlz2xHT
	for <openbmc@lists.ozlabs.org>; Tue, 26 Sep 2023 04:59:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=montage-tech.com;
	s=S1; t=1695668159; x=1696272959;
	i=amutha.krishnasamy@montage-tech.com; q=dns/txt; h=Content-Transfer-Encoding:
	Content-Class:Importance:Priority:From:To:References:In-Reply-To:
	Subject:Date:Message-ID:MIME-Version:Content-Type:thread-index:
	Content-Language; bh=9N3LfV09L0y7+HxEb3RpIuk2M+dm1dVtsyvdfZfG540
	=; b=bb2jdA6Uy7PbNa0eTjZhwZn304RXobgbrojYpuYGTKou0TZX9Xio/CJaVy0
	z5+hJZWTlPCTXJKwOnkWKYz8oB8cseGX5FtqoSF6bwbMO6hYBX8GAuk/NqwlMEkd
	/NlP9yul4nrCrUYOny+8Lw9XFdZGxZBRQoi7+TGGytbRsXH+x5nqoDk9HwLuRG+Q
	K9zzFI1GgdI/Rx0jclFrvk9rjhAOsv7OckNC0rmgkTNV/rE/9d/V6Q2E2I71a29b
	bQkJHUmnavEcSuyOQEI76mt4DCdUxN/z1qE/Xq4WDJipvgKaao9qbZ+SickNbcTC
	Y0vf2kSho+wuFJirEUVhgg65HcQ==
X-MDAV-Result: clean
X-MDAV-Processed: usmail.montage-tech.com, Mon, 25 Sep 2023 11:55:59 -0700
Received: from F4981BA3FFD147ADB7D46A00689B9548 by usmail.montage-tech.com with ActiveSync id md5001006876222.msg; 
	Mon, 25 Sep 2023 11:55:59 -0700
X-Spam-Processed: usmail.montage-tech.com, Mon, 25 Sep 2023 11:55:59 -0700
	(not processed: Message from trusted or authenticated source)
X-MDArrival-Date: Mon, 25 Sep 2023 11:55:59 -0700
X-MDAS: Yes
X-Authenticated-Sender: amutha.krishnasamy@montage-tech.com
X-Return-Path: prvs=163232c987=amutha.krishnasamy@montage-tech.com
X-Envelope-From: amutha.krishnasamy@montage-tech.com
X-MDaemon-Deliver-To: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Class: urn:content-classes:message
Importance: normal
Priority: normal
X-MimeOLE: Produced By Microsoft MimeOLE
From: "Amutha Krishnasamy" <amutha.krishnasamy@montage-tech.com>
To: <openbmc@lists.ozlabs.org>
References: <008c01d9efdf$88bd19a0$9a374ce0$@montage-tech.com>
In-Reply-To: <008c01d9efdf$88bd19a0$9a374ce0$@montage-tech.com>
Subject: Regarding how to build  OpenBMC with LibSPDM And I2ctools
Date: Mon, 25 Sep 2023 14:55:54 -0400
Message-ID: <00a301d9efe1$e979bd50$bc6d37f0$@montage-tech.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00A4_01D9EFC0.626A4030"
X-Mailer: Microsoft Outlook 16.0
thread-index: AQJl1AAr6W4BARaud1I2FV6fRtO1Za8UG3fQ
Content-Language: en-us
X-MDCFSigsAdded: montage-tech.com
X-Mailman-Approved-At: Tue, 26 Sep 2023 09:07:37 +1000
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

This is a multi-part message in MIME format.

------=_NextPart_000_00A4_01D9EFC0.626A4030
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,=20

=20

This is Amutha Krishnasamy <https://github.com/amuthakrishnasamy>  from =
Montage technologies =
https://www.montage-tech.com/DDR5_SPD_PMIC_TS/M88SPD5118

=20

Currently, I am working on adding Device authentication feature for =
eSPD(enhanced Serial Presence Detect) device which is under development. =


=20

I am trying to add BMC as requestor support using LibSPDM =
(https://github.com/DMTF/libspdm.git) in OpenBMC sources.=20

=20

As I am new to BMC, I need help to understand how to add libSPDM library =
to openBMC source.=20

=20

Please share if you have the steps to add any new library to openBMC =
sources or please point me to the resources to check.  =20

=20

Also, I would like to know how to rebuild the i2c-tools =
https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/ (used in =
the intel openBMC source) and what are the tools used for this build.=20

=20

I tried to build i2ctools with =
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads - =
x86_64 Linux hosted cross toolchains - AArch64 GNU/Linux target =
(aarch64-none-linux-gnu)

arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz. This =
created a binary and when used the binary I could not execute and =
getting Execute format error.=20

Please let me know if you have any info on how to build the i2ctools to =
run on openBMC system.=20

=20

Any help on this would be appreciated.=20

=20

Thanks=20

Amutha

=20


------=_NextPart_000_00A4_01D9EFC0.626A4030
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.ui-provider
	{mso-style-name:ui-provider;}
span.EmailStyle21
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal>Hi, <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
class=3Dui-provider>This is <a =
href=3D"https://github.com/amuthakrishnasamy" target=3D"_blank" =
title=3D"https://github.com/amuthakrishnasamy">Amutha Krishnasamy</a> =
from Montage technologies <a =
href=3D"https://www.montage-tech.com/DDR5_SPD_PMIC_TS/M88SPD5118" =
target=3D"_blank" =
title=3D"https://www.montage-tech.com/ddr5_spd_pmic_ts/m88spd5118">https:=
//www.montage-tech.com/DDR5_SPD_PMIC_TS/M88SPD5118</a><o:p></o:p></span><=
/p><p class=3DMsoNormal><span =
class=3Dui-provider><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal>Currently, I am working on adding Device =
authentication feature for eSPD(enhanced Serial Presence Detect) device =
which is under development. <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I am trying =
to add BMC as requestor support using LibSPDM (<a =
href=3D"https://github.com/DMTF/libspdm.git">https://github.com/DMTF/libs=
pdm.git</a>) in OpenBMC sources. <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>As I am new =
to BMC, I need help to understand how to add libSPDM library to openBMC =
source. <o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Please share if you have the steps to add any new =
library to openBMC sources or please point me to the resources to check. =
&nbsp;&nbsp;<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Also, I would like to know how to rebuild the =
i2c-tools <a =
href=3D"https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/">ht=
tps://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/</a> (used in =
the intel openBMC source) and what are the tools used for this build. =
<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>I tried to build i2ctools with <a =
href=3D"https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads=
">https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads</a> =
- x86_64 Linux hosted cross toolchains - AArch64 GNU/Linux target =
(aarch64-none-linux-gnu)<o:p></o:p></p><p =
class=3DMsoNormal>arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-g=
nu.tar.xz. This created a binary and when used the binary I could not =
execute and getting Execute format error. <o:p></o:p></p><p =
class=3DMsoNormal>Please let me know if you have any info on how to =
build the i2ctools to run on openBMC system. <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Any help on =
this would be appreciated. <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Thanks =
<o:p></o:p></p><p class=3DMsoNormal>Amutha<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_00A4_01D9EFC0.626A4030--

