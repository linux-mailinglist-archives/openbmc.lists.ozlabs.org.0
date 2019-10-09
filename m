Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B855BD1AA7
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 23:14:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pRm34lVTzDqRp
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 08:13:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=pawel.rapkiewicz@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pRl638HtzDqRp
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 08:13:06 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 14:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,277,1566889200"; 
 d="scan'208,217";a="218807093"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
 by fmsmga004.fm.intel.com with ESMTP; 09 Oct 2019 14:11:41 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.160]) by
 irsmsx105.ger.corp.intel.com ([169.254.7.164]) with mapi id 14.03.0439.000;
 Wed, 9 Oct 2019 22:11:41 +0100
From: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
To: "anoo@linux.ibm.com" <anoo@linux.ibm.com>
Subject: Virtual Media
Thread-Topic: Virtual Media
Thread-Index: AdV+5LAlvJ1N5/oxRU68Nczyjlgxsw==
Date: Wed, 9 Oct 2019 21:11:41 +0000
Message-ID: <53D123781965AE42A2ABEE982B242E41A10E3D21@IRSMSX102.ger.corp.intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [163.33.239.180]
Content-Type: multipart/alternative;
 boundary="_000_53D123781965AE42A2ABEE982B242E41A10E3D21IRSMSX102gercor_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_53D123781965AE42A2ABEE982B242E41A10E3D21IRSMSX102gercor_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adriana,

We're currently in the middle of Virtual Media implementation based on desi=
gn: https://github.com/openbmc/docs/blob/master/designs/VirtualMedia.md
There are few patches in review to bmcweb which enables feature as above.  =
There are few minor differences which made it not 100% compatible with
yours (i.e. different endpoints), on the other hand it has some benefits, l=
ike support for Redfish Virtual Media.

As It's reasonable not to support two different implementations of same fun=
ctionality, I'd like to ask you to review those patches,
and see if we can agree to have one common implementation in bmcweb.

I'm adding Przemyslaw to the thread since he'll take care of Virtual Media =
implementation from Intel side.

Thanks in advance,
Regards,
Pawel

--------------------------------------------------------------------

Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek
przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by
others is strictly prohibited.

--_000_53D123781965AE42A2ABEE982B242E41A10E3D21IRSMSX102gercor_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"PL">Adriana,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"PL"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">We&#8217;re currently in the middle of Virtual Media=
 implementation based on design:
<a href=3D"https://github.com/openbmc/docs/blob/master/designs/VirtualMedia=
.md">https://github.com/openbmc/docs/blob/master/designs/VirtualMedia.md</a=
><o:p></o:p></p>
<p class=3D"MsoNormal">There are few patches in review to bmcweb which enab=
les feature as above. &nbsp;There are few minor differences which made it n=
ot 100% compatible with
<o:p></o:p></p>
<p class=3D"MsoNormal">yours (i.e. different endpoints), on the other hand =
it has some benefits, like support for Redfish Virtual Media.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As It&#8217;s reasonable not to support two differen=
t implementations of same functionality, I&#8217;d like to ask you to revie=
w those patches,
<o:p></o:p></p>
<p class=3D"MsoNormal">and see if we can agree to have one common implement=
ation in bmcweb.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m adding Przemyslaw to the thread since he&#=
8217;ll take care of Virtual Media implementation from Intel side.<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in advance,<o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Pawel<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p>---------------------------------------------------------------------<br>
<strong style=3D"line-height: 11.25pt;"><span  style=3D"font-size: 9pt; col=
or:
#595959;"><span style=3D"font-family: 'Arial Narrow', sans-serif;">Intel
Technology Poland sp. z o.o.<br></span></span></strong><span style=3D"color:
#595959; font-family: 'Arial Narrow', sans-serif; font-size: 9pt; line-heig=
ht:
11.25pt;">ul. S&#322owackiego 173 | 80-298 Gda&#324sk | S&#261d Rejonowy Gd=
a&#324sk
P&#243&#322noc
| VII Wydzia&#322 Gospodarczy Krajowego Rejestru S&#261dowego - KRS 101882 =
| NIP
957-07-52-316 | Kapita&#322 zak&#322adowy 200.000 PLN.</span></p><p>

<span style=3D"font-size:8.0pt;font-family:&quot;Arial
Narrow&quot;,&quot;sans-serif&quot;;
mso-fareast-font-family:&quot;Times New
Roman&quot;;mso-bidi-font-family:Arial;
color:#595959;mso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-l=
anguage:
AR-SA">Ta wiadomo&#347&#263 wraz z za&#322&#261cznikami jest przeznaczona d=
la okre&#347lonego
adresata i mo&#380e zawiera&#263 informacje poufne. W razie przypadkowego o=
trzymania
tej wiadomo&#347ci, prosimy o powiadomienie nadawcy oraz trwa&#322e jej usu=
ni&#281cie;
jakiekolwiek przegl&#261danie lub rozpowszechnianie jest zabronione.<br>
This e-mail and any attachments may contain confidential material for the s=
ole
use of the intended recipient(s). If you are not the intended recipient,
please
contact the sender and delete all copies; any review or distribution by oth=
ers
is strictly prohibited.</span></p><p class=3D"MsoNormal"><o:p></o:p></p>
</body>
</html>

--_000_53D123781965AE42A2ABEE982B242E41A10E3D21IRSMSX102gercor_--

