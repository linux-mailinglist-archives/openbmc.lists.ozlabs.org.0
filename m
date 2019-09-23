Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFC3BAE40
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 09:01:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cFcC17vwzDqJk
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 17:01:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cFbd2JfpzDqDl
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 17:01:16 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 00:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; 
 d="scan'208,217";a="218447034"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.255])
 by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2019 00:01:11 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Alpana Kumari1'" <alpankum@in.ibm.com>
References: <000001d5706b$2d921e60$88b65b20$@linux.intel.com>
 <OF2C925502.61CFC61B-ON0025847E.0023D3A6-0025847E.00243BE6@notes.na.collabserv.com>
In-Reply-To: <OF2C925502.61CFC61B-ON0025847E.0023D3A6-0025847E.00243BE6@notes.na.collabserv.com>
Subject: RE: HostWatchdogTimer related changes
Date: Mon, 23 Sep 2019 15:01:11 +0800
Message-ID: <000401d571dc$af8e2590$0eaa70b0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0005_01D5721F.BDB2C520"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHvE8x/hp6gygUYXrPFFr6m2A8EYwJm2igupvJaZGA=
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjhiZTMzYjUtY2U3YS00ZGE3LTk2MWUtODU2N2NmYjdlNzg0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiK2lvQ3JTWDlrdmVJSmpkV1Ruc3QwR0JVRFlQckZKR2EwZDBiZ3pscUI3anpKVnhUTVA1ejNoOUQwc3dSRVliSiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: request-justification,no-action
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
Cc: openbmc@lists.ozlabs.org, ed.tanous@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multipart message in MIME format.

------=_NextPart_000_0005_01D5721F.BDB2C520
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alpana,

=20

Thanks for your update! Just curious why =E2=80=9Cnot to make this =
change=E2=80=9D?  I think it is useful to add it into redfish.

=20

Thanks,

Yong

From: Alpana Kumari1 <alpankum@in.ibm.com>=20
Sent: Monday, September 23, 2019 2:36 PM
To: yong.b.li@linux.intel.com
Cc: ed.tanous@intel.com; openbmc@lists.ozlabs.org
Subject: Re: HostWatchdogTimer related changes

=20

Hi,

=20

yes, It was on hold for long time, and later it was decided  not to  =
make this change.

=20

Closed now.

=20

=20

Thanks,

Alpana

=20

----- Original message -----
From: "Yong Li" <yong.b.li@linux.intel.com =
<mailto:yong.b.li@linux.intel.com> >
To: <alpankum@in.ibm.com <mailto:alpankum@in.ibm.com> >
Cc: "Tanous, Ed" <ed.tanous@intel.com <mailto:ed.tanous@intel.com> >, =
"'OpenBMC Maillist'" <openbmc@lists.ozlabs.org =
<mailto:openbmc@lists.ozlabs.org> >
Subject: [EXTERNAL] HostWatchdogTimer related changes
Date: Sat, Sep 21, 2019 4:26 PM
=20

Hi,

=20

I noticed there is a code review submitted my you:

https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/20308/      =20

=20

I noticed there is no any update for several days. I am working on the =
related feature too:

https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/24532/

=20

Could you please check on them?

=20

If there is any comments/questions, just let me know.

=20

Thanks,

Yong

=20

=20

=20


------=_NextPart_000_0005_01D5721F.BDB2C520
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
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal>Hi =
Alpana,<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks for your update! Just curious why =E2=80=9Cnot =
to make this change=E2=80=9D?=C2=A0 I think it is useful to add it into =
redfish.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Yong<o:p></o:p></p><p class=3DMsoNormal><a =
name=3D"_____replyseparator"></a><b>From:</b> Alpana Kumari1 =
&lt;alpankum@in.ibm.com&gt; <br><b>Sent:</b> Monday, September 23, 2019 =
2:36 PM<br><b>To:</b> yong.b.li@linux.intel.com<br><b>Cc:</b> =
ed.tanous@intel.com; openbmc@lists.ozlabs.org<br><b>Subject:</b> Re: =
HostWatchdogTimer related changes<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Hi,<o:p></o:p><=
/span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>yes, It was on =
hold for long time, and later it was decided&nbsp; not to&nbsp; make =
this change.<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Closed =
now.<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Thanks,<o:p></o=
:p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Alpana<o:p></o:=
p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p></div><blockquote style=3D'border:none;border-left:solid =
#AAAAAA 1.5pt;padding:0in 0in 0in =
4.0pt;margin-left:3.75pt;margin-top:5.0pt;margin-right:0in;margin-bottom:=
5.0pt'><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>----- Original =
message -----<br>From: &quot;Yong Li&quot; &lt;<a =
href=3D"mailto:yong.b.li@linux.intel.com">yong.b.li@linux.intel.com</a>&g=
t;<br>To: &lt;<a =
href=3D"mailto:alpankum@in.ibm.com">alpankum@in.ibm.com</a>&gt;<br>Cc: =
&quot;Tanous, Ed&quot; &lt;<a =
href=3D"mailto:ed.tanous@intel.com">ed.tanous@intel.com</a>&gt;, =
&quot;'OpenBMC Maillist'&quot; &lt;<a =
href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;=
<br>Subject: [EXTERNAL] HostWatchdogTimer related changes<br>Date: Sat, =
Sep 21, 2019 4:26 PM<br>&nbsp;<o:p></o:p></span></p><div><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Hi,<o:p></o:p><=
/span></p><p style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p><p style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>I noticed =
there is a code review submitted my you:<o:p></o:p></span></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'><a =
href=3D"https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/20308/" =
target=3D"_blank">https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+=
/20308/</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p><p style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>I noticed =
there is no any update for several days. I am working on the related =
feature too:<o:p></o:p></span></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'><a =
href=3D"https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/24532/" =
target=3D"_blank">https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+=
/24532/</a><o:p></o:p></span></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p><p style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Could you =
please check on them?<o:p></o:p></span></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p><p style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>If there is =
any comments/questions, just let me know.<o:p></o:p></span></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p><p style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Thanks,<o:p></o=
:p></span></p><p style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Yong<o:p></o:p>=
</span></p><p style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p></div></blockquote><div><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp;<o:p></o:=
p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_0005_01D5721F.BDB2C520--

