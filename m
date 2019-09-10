Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CED5FAE25A
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 04:31:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S8Cs1wvdzDqMT
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 12:31:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S8C35R3hzDqLr
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 12:30:21 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 19:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,487,1559545200"; 
 d="scan'208,217";a="184010866"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2019 19:30:19 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 9 Sep 2019 19:30:19 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 9 Sep 2019 19:30:18 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.113]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.132]) with mapi id 14.03.0439.000;
 Tue, 10 Sep 2019 10:30:16 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Updating BMC GUI Front End Framework
Thread-Topic: Updating BMC GUI Front End Framework
Thread-Index: AdVndaGbsNWzqN9KQhex8d/GNxeMpQ==
Date: Tue, 10 Sep 2019 02:30:15 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E7724E5253FB@shsmsx102.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDU1Mzk2YWMtYjM3ZS00MTVmLThhMTgtMjRjMDUyYjkxY2RhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTVJYcmF6WUdcL0x5b1wvZFhMSXFYbVRXdkJSXC9XQkUzRFwvWWFnVHMwYng4dk9tK0Z3XC93emxJdEc2cDU4RlwvWVhUaSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
x-originating-ip: [10.239.127.40]
Content-Type: multipart/alternative;
 boundary="_000_959CAFA1E282D14FB901BE9A7BF4E7724E5253FBshsmsx102ccrcor_"
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
Cc: DEG SSE OpenBMC <deg.sse.openbmc@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_959CAFA1E282D14FB901BE9A7BF4E7724E5253FBshsmsx102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, it's time to do it.
I suggest to use Vue, there are several reasons:

1.       MIT license https://github.com/vuejs/vue/blob/dev/LICENSE

2.       The sizes of the libraries: Vue is about 80KB, much smaller than A=
ngular (500+KB), React(100KB)

It is sensitive on space for our OpenBMC embedded system. So Vue is the bes=
t candidate.

3.       It is already used by big internet company like Gitlab/Alibaba.

4.       Vue is the most popular frameworks, according to the number of sta=
rs on GitHub projects for Angular, React, and Vue.
Angular                React      Vue

# Watchers         3.3k                        3.7k        5.7k

# Stars                  43k                         71k         122k

# Forks                 11k                         16k         17k

5.       Vue is two-way binding

6.       Vue is based on JS+HTML, it's easy for existing AngularJS develope=
r to transfer, but not like Angular (TS) and React (JSX)

Thanks,
Kwin.


On 9/6/19 9:51 AM, Derick Montague wrote:

> Hello,

> We would like to start the discussion of migrating the BMC GUI off of

> AngularJS. The AngularJS long term support period is 3 years and

> started on 7/1/2018 and will end on 7/30/2021. You can read more about

> this on the angular blog -

> https://blog.angular.io/stable-angularjs-and-long-term-support-7e077635ee=
9c.

> The most likely options for migration are Angular, React, and Vue.

> LogRocket has a decent comparison of the 3 frameworks -

> https://blog.logrocket.com/angular-vs-react-vs-vue-a-performance-comparis=
on/.<https://blog.logrocket.com/angular-vs-react-vs-vue-a-performance-compa=
rison/>

> There is also a really interesting framework called Svelte for

> building reactive apps that might be worth considering as well -

> https://github.com/sveltejs/svelte

> My first thought based on the size of the application, the need for a

> smaller footprint, and the benefit of a small learning curve would

> be Vue. However, I'm just throwing that out there to start the

> conversation.



Derick, thanks for looking into this.  I agree a small footprint and

short learning curve are important criteria.   Some other criteria to

consider:

- Licensing terms, looking for permissive licenses like Apache 2.0 or MIT.

- Community support, especially for security fixes.



- Joseph



> Does anyone else have a preference on the next front end framework?

>


Thanks,
Kwin.


--_000_959CAFA1E282D14FB901BE9A7BF4E7724E5253FBshsmsx102ccrcor_
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
@font-face
	{font-family:"Bodoni MT Poster Compressed";
	panose-1:2 7 7 6 8 6 1 5 2 4;}
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
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1574271064;
	mso-list-type:hybrid;
	mso-list-template-ids:-1781865520 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
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
<p class=3D"MsoNormal">Yes, it&#8217;s time to do it.<o:p></o:p></p>
<p class=3D"MsoNormal">I suggest to use Vue, there are several reasons:<o:p=
></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">1.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>MIT license <a href=3D"https://github.com/vuejs/vue=
/blob/dev/LICENSE">
https://github.com/vuejs/vue/blob/dev/LICENSE</a><o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>The sizes of the libraries: <b>Vue is about 80KB, m=
uch smaller than Angular (500&#43;KB), React(100KB)</b><o:p></o:p></p>
<p class=3D"MsoListParagraph">It is sensitive on space for our OpenBMC embe=
dded system. So Vue is the best candidate.<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>It is already used by big internet company like Git=
lab/Alibaba.<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">4.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Vue is the most popular frameworks, according to th=
e number of stars on GitHub projects for Angular, React, and Vue.<o:p></o:p=
></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in;text-indent:.5in">Angular=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; React&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style=3D"background:yellow;mso-highlight:yellow">Vue</span><o:p></o:p=
></p>
<p class=3D"MsoListParagraph"># Watchers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 3.3k&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 3.7k&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style=3D"background:yellow;mso-highlight:yellow">5.7k</span><o:p></o:=
p></p>
<p class=3D"MsoListParagraph"># Stars&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 43k&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 71k&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style=3D"background:yellow;mso-highlight:yellow">122k</span><o:p></o:=
p></p>
<p class=3D"MsoListParagraph"># Forks &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11k&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16k&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
<span style=3D"background:yellow;mso-highlight:yellow">17k</span><o:p></o:p=
></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">5.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Vue is two-way binding<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">6.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Vue is based on JS&#43;HTML, it&#8217;s easy for ex=
isting AngularJS developer to transfer, but not like Angular (TS) and React=
 (JSX)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kwin.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre><span style=3D"color:black">On 9/6/19 9:51 AM, Derick Montague wrote:<=
o:p></o:p></span></pre>
<pre><span style=3D"color:black">&gt;<i> Hello,<o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> We would like to start the discuss=
ion of migrating the BMC GUI off of <o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> AngularJS. The AngularJS long term=
 support period is 3 years and <o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> started on 7/1/2018 and will end o=
n 7/30/2021. You can read more about <o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> this on the angular blog - <o:p></=
o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> <a href=3D"https://blog.angular.io=
/stable-angularjs-and-long-term-support-7e077635ee9c.">https://blog.angular=
.io/stable-angularjs-and-long-term-support-7e077635ee9c.</a><o:p></o:p></i>=
</span></pre>
<pre><span style=3D"color:black">&gt;<i> The most likely options for migrat=
ion are Angular, React, and Vue. <o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> LogRocket has a decent comparison =
of the 3 frameworks - <o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> <a href=3D"https://blog.logrocket.=
com/angular-vs-react-vs-vue-a-performance-comparison/">https://blog.logrock=
et.com/angular-vs-react-vs-vue-a-performance-comparison/.</a><o:p></o:p></i=
></span></pre>
<pre><span style=3D"color:black">&gt;<i> There is also a really interesting=
 framework called&nbsp;Svelte for <o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> building reactive apps that might =
be worth considering as well - <o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> <a href=3D"https://github.com/svel=
tejs/svelte">https://github.com/sveltejs/svelte</a><o:p></o:p></i></span></=
pre>
<pre><span style=3D"color:black">&gt;<i> My first thought based on the size=
 of the application, the need for a <o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> smaller footprint, and the benefit=
 of&nbsp;a small learning curve would <o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> be&nbsp;Vue. However, I'm just thr=
owing that out there to start the <o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<i> conversation.<o:p></o:p></i></span=
></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">Derick, thanks for looking into this.&nbsp=
; I agree a small footprint and <o:p></o:p></span></pre>
<pre><span style=3D"color:black">short learning curve are important criteri=
a.&nbsp;&nbsp; Some other criteria to <o:p></o:p></span></pre>
<pre><span style=3D"color:black">consider:<o:p></o:p></span></pre>
<pre><span style=3D"color:black">- Licensing terms, looking for permissive =
licenses like Apache 2.0 or MIT.<o:p></o:p></span></pre>
<pre><span style=3D"color:black">- Community support, especially for securi=
ty fixes.<o:p></o:p></span></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">- Joseph<o:p></o:p></span></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">&gt;<i> Does anyone else have a preference=
&nbsp;on the next front end framework?<o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">&gt;<o:p>&nbsp;</o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:24.0pt;font-family:&quot=
;Bodoni MT Poster Compressed&quot;,serif;color:#00B0F0">Thanks,<o:p></o:p><=
/span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:24.0pt;font-family:&quot=
;Bodoni MT Poster Compressed&quot;,serif;color:#00B0F0">Kwin.<o:p></o:p></s=
pan></i></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_959CAFA1E282D14FB901BE9A7BF4E7724E5253FBshsmsx102ccrcor_--
