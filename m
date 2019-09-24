Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC958BBFFB
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 04:26:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46clSR1lY7zDqP6
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 12:26:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46clRh4QZbzDqNw
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 12:26:02 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 19:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,542,1559545200"; 
 d="scan'208,217";a="193291660"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga006.jf.intel.com with ESMTP; 23 Sep 2019 19:25:58 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Sep 2019 19:25:58 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Sep 2019 19:25:57 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Sep 2019 19:25:57 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.113]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.23]) with mapi id 14.03.0439.000;
 Tue, 24 Sep 2019 10:25:56 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC CVE issues in openssl
Thread-Topic: OpenBMC CVE issues in openssl
Thread-Index: AdVyfreiWxhXubG7QG+GhqVvf1a70w==
Date: Tue, 24 Sep 2019 02:25:56 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E7724E52C8BD@shsmsx102.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
Content-Type: multipart/alternative;
 boundary="_000_959CAFA1E282D14FB901BE9A7BF4E7724E52C8BDshsmsx102ccrcor_"
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
Cc: "Jia, Chunhui" <chunhui.jia@intel.com>, "Shi, Yilei" <yilei.shi@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Mihm,
 James" <james.mihm@intel.com>, "Xu, Qiang" <qiang.xu@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_959CAFA1E282D14FB901BE9A7BF4E7724E52C8BDshsmsx102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brad,
Openssl is already upgrade to 1.1.1d, so please help sync to the latest ver=
sion.
https://github.com/openembedded/openembedded-core/tree/master/meta/recipes-=
connectivity/openssl

Please let me know, if you need me to submit patch for this upgrading.

Thanks,
Kwin.

> Hi,
>
> Some openssl vulnerabilities are found by security scan on latest OpenBMC
> which is using openssl 1.1.1c
>
> CVE-2019-1549
> CVE-2019-1563
> CVE-2019-1547
>
> They are fixed in latest openssl version 1.1.1d.
>
> Do we have plan to upgrade openssl recently?
>
> Thanks

I don't think 1.1.1d has landed upstream yet.  If you update oe-core to
1.1.1d I will pick it up once it lands there.

-brad


--_000_959CAFA1E282D14FB901BE9A7BF4E7724E52C8BDshsmsx102ccrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
	{font-family:"\@SimSun";
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Brad,<o:p></o:p></p>
<p class=3D"MsoNormal">Openssl is already upgrade to 1.1.1d, so please help=
 sync to the latest version.<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openembedded/openembed=
ded-core/tree/master/meta/recipes-connectivity/openssl">https://github.com/=
openembedded/openembedded-core/tree/master/meta/recipes-connectivity/openss=
l</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please let me know, if you need me to submit patch f=
or this upgrading.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kwin.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i> Hi,<o:p></o:p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i><o:p>&nbsp;</o:p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i> Some openssl vulnerabilities are found=
 by security scan on latest OpenBMC&nbsp;
<o:p></o:p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i> which is using openssl 1.1.1c<o:p></o:=
p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i><o:p>&nbsp;</o:p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i> CVE-2019-1549<o:p></o:p></i></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i> CVE-2019-1563<o:p></o:p></i></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i> CVE-2019-1547<o:p></o:p></i></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i><o:p>&nbsp;</o:p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i> They are fixed in latest openssl versi=
on 1.1.1d.<o:p></o:p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i><o:p>&nbsp;</o:p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i> Do we have plan to upgrade openssl rec=
ently?<o:p></o:p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i><o:p>&nbsp;</o:p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&gt;<i> Thanks<o:p></o:p></i></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">I don&#8217;t think 1.1.1d has landed upstream=
 yet.&nbsp; If you update oe-core to&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">1.1.1d I will pick it up once it lands there.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">-brad<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_959CAFA1E282D14FB901BE9A7BF4E7724E52C8BDshsmsx102ccrcor_--
