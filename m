Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F264A5192
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:29:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MNY34wWVzDqXs
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 18:29:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MNXG3CtRzDqfv
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 18:28:45 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 01:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; 
 d="scan'208,217";a="176264940"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.66])
 by orsmga008.jf.intel.com with ESMTP; 02 Sep 2019 01:28:41 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'AKASH G J'" <akashgj91@gmail.com>,
	<openbmc@lists.ozlabs.org>
References: <CAE33tLEzV8+n+cFVtnr0vYynsqn42+5APTtojHqWGb8A5GyG2g@mail.gmail.com>
In-Reply-To: <CAE33tLEzV8+n+cFVtnr0vYynsqn42+5APTtojHqWGb8A5GyG2g@mail.gmail.com>
Subject: RE: Cannot connect to console server in s2600wf
Date: Mon, 2 Sep 2019 16:28:40 +0800
Message-ID: <000001d56168$6da06960$48e13c20$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0001_01D561AB.7BCD4650"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGa0Ye+Kvs4ir3cVweZfITevxRKOqeNKnwg
Content-Language: en-us
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
Cc: "Yang, Cheng C" <cheng.c.yang@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multipart message in MIME format.

------=_NextPart_000_0001_01D561AB.7BCD4650
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Could you share more information:

Do you want to use the SOL feature?=20

How did you build the OpenBMC?

There should be a systemd service: =
/lib/systemd/system/obmc-console@.service =
<mailto:/lib/systemd/system/obmc-console@.service> . And check the file =
/etc/systemd/system/multi-user.target.wants/obmc-console@*, is it ttyS2? =


ls -l /dev/ttyS*, can you find these ttyS items?

=20

Thanks,

Yong

=20

From: openbmc =
<openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org> On Behalf =
Of AKASH G J
Sent: Friday, August 30, 2019 8:27 PM
To: openbmc@lists.ozlabs.org
Subject: Cannot connect to console server in s2600wf

=20

Hi all,

=20

I am using OpenBMC Linux with s2600wf configuration.

=20

When I tried to execute 0bmc-console-client the following error came.

=20

root@s2600wf:~# obmc-console-client                                      =
      =20
obmc-console-client: Can't connect to console server: Connection refused

=20

in ps command output also obmc-console-server not found.

=20

=20

Thanks,

=20

Akash


------=_NextPart_000_0001_01D561AB.7BCD4650
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
class=3DMsoNormal>Could you share more information:<o:p></o:p></p><p =
class=3DMsoNormal>Do you want to use the SOL feature? <o:p></o:p></p><p =
class=3DMsoNormal>How did you build the OpenBMC?<o:p></o:p></p><p =
class=3DMsoNormal>There should be a systemd service: <a =
href=3D"mailto:/lib/systemd/system/obmc-console@.service">/lib/systemd/sy=
stem/obmc-console@.service</a>. And check the file =
/etc/systemd/system/multi-user.target.wants/obmc-console@*, is it ttyS2? =
<o:p></o:p></p><p class=3DMsoNormal>ls -l /dev/ttyS*, can you find these =
ttyS items?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Yong<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><b>From:</b> =
openbmc =
&lt;openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org&gt; =
<b>On Behalf Of </b>AKASH G J<br><b>Sent:</b> Friday, August 30, 2019 =
8:27 PM<br><b>To:</b> openbmc@lists.ozlabs.org<br><b>Subject:</b> Cannot =
connect to console server in s2600wf<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p class=3DMsoNormal>Hi =
all,<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p class=3DMsoNormal>I =
am using OpenBMC Linux with s2600wf =
configuration.<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>When I tried to execute 0bmc-console-client the =
following error came.<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>root@s2600wf:~# obmc-console-client &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
<br>obmc-console-client: Can't connect to console server: Connection =
refused<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>in <i>ps</i> command output also obmc-console-server =
not found.<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>Akash<o:p></o:p></p></div></div></div></body></html>
------=_NextPart_000_0001_01D561AB.7BCD4650--

