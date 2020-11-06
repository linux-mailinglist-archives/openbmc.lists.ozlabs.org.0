Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 399432A8C0F
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 02:26:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CS2mK1w4WzDr8H
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 12:26:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CS2lV2qcPzDr7l
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 12:25:56 +1100 (AEDT)
IronPort-SDR: xO7n8J9VC6zyMuuJLo0LEZGp7Kb3KhvgLf8JktkrkG4Ek3msbtw0pWERR4BQbKtH4eb9dTE2U6
 o08gL4Mj/qRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="169597233"
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; 
 d="scan'208,217";a="169597233"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 17:25:53 -0800
IronPort-SDR: 7X6v9sOW++lvRoY/xVbLd4zX3403zxwXeocujg/KOhIDRDVPLEQNEDKPpGHcsiIAjvkymwmDgD
 IAD5KbHYx9Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; 
 d="scan'208,217";a="528167798"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 05 Nov 2020 17:25:53 -0800
Received: from yongli3MOBL1 (yongli3-MOBL1.ccr.corp.intel.com [10.238.12.197])
 by linux.intel.com (Postfix) with ESMTP id 7D4BE580841;
 Thu,  5 Nov 2020 17:25:51 -0800 (PST)
From: "Yong Li" <yong.b.li@linux.intel.com>
To: =?iso-2022-jp?B?J0JydWNlIExlZSAoGyRCTXt6ND1UGyhCKSc=?=
 <Bruce_Lee@quantatw.com>, <cheng.c.yang@linux.intel.com>,
 <yugang.chen@linux.intel.com>, <kuiying.wang@intel.com>
References: <da65b69b77144a94ad9e278b0fe72b5d@quantatw.com>
In-Reply-To: <da65b69b77144a94ad9e278b0fe72b5d@quantatw.com>
Subject: RE: Please help provide some examples for how to use smbios-mdr via
 intel-ipmi-oem
Date: Fri, 6 Nov 2020 09:25:50 +0800
Message-ID: <003f01d6b3db$c4440490$4ccc0db0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0040_01D6B41E.D267E0D0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEa3FXvdEiRqvs0iqCzyPwKXgD2EKsx/o6w
Content-Language: en-us
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multipart message in MIME format.

------=_NextPart_000_0040_01D6B41E.D267E0D0
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit

The below example?

https://github.com/openbmc/intel-ipmi-oem/blob/master/src/smbiosmdrv2handler
.cpp#L1211



Thanks,

Yong

From: openbmc <openbmc-bounces+yong.b.li=linux.intel.com@lists.ozlabs.org>
On Behalf Of Bruce Lee (???)
Sent: Thursday, November 5, 2020 2:30 PM
To: cheng.c.yang@linux.intel.com; yugang.chen@linux.intel.com;
kuiying.wang@intel.com
Cc: openbmc@lists.ozlabs.org
Subject: Please help provide some examples for how to use smbios-mdr via
intel-ipmi-oem



Hi all,



Please help provide some examples for how to use smbios-mdr via
intel-ipmi-oem,

maybe it’s a lots series intel-ipmi-oem,

I want to know how to send a smbios file via function ‘storeDatatoFlash’

and then smbios-mdr functions will to read smbios file via function
‘readDataFromFlash’



below links is reference from upstream,

https://github.com/openbmc/smbios-mdr

https://github.com/openbmc/intel-ipmi-oem



thanks,

Bruce.


------=_NextPart_000_0040_01D6B41E.D267E0D0
Content-Type: text/html;
	charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-2022-jp">
<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta name=3DGenerator =
content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:ZH-TW;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
link=3D"#0563C1" vlink=3D"#954F72" =
style=3D'text-justify-trim:punctuation'><div class=3DWordSection1><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;mso-fareast-language:ZH-CN'>The below =
example?<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;mso-fareast-language:ZH-CN'><a =
href=3D"https://github.com/openbmc/intel-ipmi-oem/blob/master/src/smbiosm=
drv2handler.cpp#L1211">https://github.com/openbmc/intel-ipmi-oem/blob/mas=
ter/src/smbiosmdrv2handler.cpp#L1211</a><o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;mso-fareast-language:ZH-CN'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;mso-fareast-language:ZH-CN'>Thanks,<o:p></o:p><=
/span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;mso-fareast-language:ZH-CN'>Yong<o:p></o:p></sp=
an></p><div><div style=3D'border:none;border-top:solid #E1E1E1 =
1.0pt;padding:3.0pt 0in 0in 0in'><p class=3DMsoNormal><b><span =
style=3D'font-size:11.0pt'>From:</span></b><span =
style=3D'font-size:11.0pt'> openbmc =
&lt;openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org&gt; =
<b>On Behalf Of </b>Bruce Lee (???)<br><b>Sent:</b> Thursday, November =
5, 2020 2:30 PM<br><b>To:</b> cheng.c.yang@linux.intel.com; =
yugang.chen@linux.intel.com; kuiying.wang@intel.com<br><b>Cc:</b> =
openbmc@lists.ozlabs.org<br><b>Subject:</b> Please help provide some =
examples for how to use smbios-mdr via =
intel-ipmi-oem<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Hi =
all,<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Please help provide some examples for how to use =
smbios-mdr via intel-ipmi-oem,<o:p></o:p></p><p class=3DMsoNormal>maybe =
it=1B$B!G=1B(Js a lots series intel-ipmi-oem, <o:p></o:p></p><p =
class=3DMsoNormal>I want to know how to send a smbios file via function =
=1B$B!F=1B(JstoreDatatoFlash=1B$B!G=1B(J<o:p></o:p></p><p =
class=3DMsoNormal>and then smbios-mdr functions will to read smbios file =
via function =1B$B!F=1B(JreadDataFromFlash=1B$B!G=1B(J<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>below links =
is reference from upstream,<o:p></o:p></p><p class=3DMsoNormal><a =
href=3D"https://github.com/openbmc/smbios-mdr">https://github.com/openbmc=
/smbios-mdr</a><o:p></o:p></p><p class=3DMsoNormal><a =
href=3D"https://github.com/openbmc/intel-ipmi-oem">https://github.com/ope=
nbmc/intel-ipmi-oem</a><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Bruce.<o:p></o:p></p></div></body></html>
------=_NextPart_000_0040_01D6B41E.D267E0D0--

