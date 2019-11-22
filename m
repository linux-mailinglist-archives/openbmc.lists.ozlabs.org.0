Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E77FA1075F5
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 17:48:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KMnG1kDpzDrJw
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 03:48:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=kathryn.elainex.pine@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KMmR23cKzDqnF
 for <openbmc@lists.ozlabs.org>; Sat, 23 Nov 2019 03:47:28 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 08:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; 
 d="scan'208,217";a="382126767"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by orsmga005.jf.intel.com with ESMTP; 22 Nov 2019 08:47:24 -0800
Received: from orsmsx122.amr.corp.intel.com (10.22.225.227) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 22 Nov 2019 08:47:23 -0800
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.200]) by
 ORSMSX122.amr.corp.intel.com ([169.254.11.73]) with mapi id 14.03.0439.000;
 Fri, 22 Nov 2019 08:47:24 -0800
From: "Pine, Kathryn ElaineX" <kathryn.elainex.pine@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: GUI: New navigation
Thread-Topic: GUI: New navigation
Thread-Index: AdWhUPD9apZI6UsnSdi0LolLJFMEnA==
Date: Fri, 22 Nov 2019 16:47:23 +0000
Message-ID: <FD0BD680739BFC41807C96BD23118BB1319422@ORSMSX113.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzliMjAxYWItMDE1NC00OTczLWE1NTItNDY3NDk0ZjQxMzM5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicDAzV0xrRThKVzFcL0pFYmFJek5iaHkxb0hYSFk3MXJCNGRnYkJlQXlxYWFlblJQQ1wveXhcL3Q3bUR1d2g4bGtKQiJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: multipart/alternative;
 boundary="_000_FD0BD680739BFC41807C96BD23118BB1319422ORSMSX113amrcorpi_"
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

--_000_FD0BD680739BFC41807C96BD23118BB1319422ORSMSX113amrcorpi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Through the last two GUI Design work group meetings, we've been working thr=
ough some of the design changes I shared a couple of weeks ago with this li=
st.

In order to provide time to consider each design change, get feedback, and =
make them reasonable for review, we've decided to break the commits into sm=
aller pieces.

The first commit has been revised to just include changes to the phosphor-w=
ebui navigation.

Below is a screenshot link of the navigation change to an accordion-style m=
enu, keeping the color palette consistent with the existing UI.
Screenshot:
https://invis.io/DPT0CJ52AVC#/394775350_Navigation-Upstream

As a follow up to requests in the GUI Design work group, I've made changes =
to the original commit that:

  *   Makes the buttons, focus states & colors consistent with accessibilit=
y guidelines
  *   Uses the Teal50 color to show the active page (this is one of the few=
 colors from existing palette that meets accessibility reqts and works aest=
hetically)
  *   Makes the hover over background (rectangle box/on screenshot this is =
shown on "Access") the same color as the nav. background, just a bit lighte=
r
  *   Uses existing color palette and background color
  *   Implements better alignment & spacing

You can also view the commit here:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/26539

--_000_FD0BD680739BFC41807C96BD23118BB1319422ORSMSX113amrcorpi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:781461333;
	mso-list-type:hybrid;
	mso-list-template-ids:537316674 -1551594704 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Through the last two GUI Design work group meetings,=
 we&#8217;ve been working through some of the design changes I shared a cou=
ple of weeks ago with this list.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In order to provide time to consider each design cha=
nge, get feedback, and make them reasonable for review, we&#8217;ve decided=
 to break the commits into smaller pieces.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The first commit has been revised to just include ch=
anges to the phosphor-webui navigation.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Below is a screenshot link of the navigation change =
to an accordion-style menu, keeping the color palette consistent with the e=
xisting UI.<o:p></o:p></p>
<p class=3D"MsoNormal">Screenshot:<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://invis.io/DPT0CJ52AVC#/394775350_N=
avigation-Upstream">https://invis.io/DPT0CJ52AVC#/394775350_Navigation-Upst=
ream</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As a follow up to requests in the GUI Design work gr=
oup, I&#8217;ve made changes to the original commit that:<o:p></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Makes the buttons, focus states &amp; colors consistent with accessib=
ility guidelines<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"mar=
gin-left:0in;mso-list:l0 level1 lfo1">Uses the Teal50 color to show the act=
ive page (this is one of the few colors from existing palette that meets ac=
cessibility reqts and works aesthetically)<o:p></o:p></li><li class=3D"MsoL=
istParagraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1">Makes the h=
over over background (rectangle box/on screenshot this is shown on &#8220;A=
ccess&#8221;) the same color as the nav. background, just a bit lighter
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l0 level1 lfo1">Uses existing color palette and background color<o:p>=
</o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list=
:l0 level1 lfo1">Implements better alignment &amp; spacing<o:p></o:p></li><=
/ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">You can also view the commit here:<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://gerrit.openbmc-project.xyz/c/open=
bmc/phosphor-webui/&#43;/26539">https://gerrit.openbmc-project.xyz/c/openbm=
c/phosphor-webui/&#43;/26539</a><o:p></o:p></p>
</div>
</body>
</html>

--_000_FD0BD680739BFC41807C96BD23118BB1319422ORSMSX113amrcorpi_--
