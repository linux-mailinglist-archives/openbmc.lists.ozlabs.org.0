Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE0E176F36
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 07:17:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wmy173TSzDqXX
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 17:17:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=lkammath@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wmx40synzDqXT
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 17:16:23 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0236EHg5028128
 for <openbmc@lists.ozlabs.org>; Tue, 3 Mar 2020 01:16:20 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.119])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfn07fbx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2020 01:16:20 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <lkammath@in.ibm.com>;
 Tue, 3 Mar 2020 06:16:20 -0000
Received: from us1b3-smtp04.a3dr.sjc01.isc4sb.com (10.122.203.161)
 by smtp.notes.na.collabserv.com (10.122.182.123) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 3 Mar 2020 06:16:16 -0000
Received: from us1b3-mail34.a3dr.sjc01.isc4sb.com ([10.122.7.220])
 by us1b3-smtp04.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020030306161563-85179 ;
 Tue, 3 Mar 2020 06:16:15 +0000 
In-Reply-To: <c2ebd229-edfc-4e9c-877e-313bce3a8c3e@www.fastmail.com>
From: "Lakshminarayana R Kammath" <lkammath@in.ibm.com>
To: andrew@aj.id.au
Date: Tue, 3 Mar 2020 06:16:16 +0000
Sensitivity: 
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-KeepSent: 5C9E4DBA:CDFF53ED-00258520:00223824;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 56107
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 20030306-3975-0000-0000-000001D3C0BC
X-IBM-SpamModules-Scores: BY=0.252377; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.063633
X-IBM-SpamModules-Versions: BY=3.00012678; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01342192; UDB=6.00715407; IPR=6.01124584; 
 MB=3.00031056; MTD=3.00000008; XFM=3.00000015; UTC=2020-03-03 06:16:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-03-03 04:52:34 - 6.00011073
x-cbparentid: 20030306-3976-0000-0000-00003575DCB9
Message-Id: <OF5C9E4DBA.CDFF53ED-ON00258520.00223824-00258520.002272C3@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 33 URL's were un-rewritten
MIME-Version: 1.0
Subject: RE: [OpenBMC]: Unit test coverage analysis on openbmc repositories
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_01:2020-03-02,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Reason: safe
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

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Hi Andrew,=
</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Sure. We Will update our list and scrub the one's which a=
re archived and come back</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div dir=3D"ltr" style=3D"font-family:Arial, Helvetica, s=
ans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family:Arial, Hel=
vetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Thanks &=
amp; Regards,<br>Lakshminarayana Kamath<br>--------------------------------=
------------------------------------------------------------------<br>Senio=
r Engineer, Power Firmware Verification and DevOps Enablement (FSP &amp; BM=
C RAS)</div>
<div dir=3D"ltr" >D3 Block, <font size=3D"2" >1st Floor Floor, MD3-1F-B279<=
/font>,<br>Manyata Embassy Business Park,<br>Nagawara Outer Ring Road,<br>B=
angalore - 560045<br>email:lkammath@in.ibm.com<br>+Mobile : +91-9980-902931=
<br>-----------------------------------------------------------------------=
----------------------------</div>
<div dir=3D"ltr" >&nbsp;</div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: "Andrew Jeffery" &lt;andrew@aj.id.au&gt;<br>To: "Lakshminarayana =
R Kammath" &lt;lkammath@in.ibm.com&gt;, openbmc@lists.ozlabs.org<br>Cc:<br>=
Subject: [EXTERNAL] Re: [OpenBMC]: Unit test coverage analysis on openbmc r=
epositories<br>Date: Tue, Mar 3, 2020 10:18 AM<br>&nbsp;
<div><br><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,mon=
ospace" >On Sat, 29 Feb 2020, at 02:05, Lakshminarayana R Kammath wrote:<br=
><br>&gt; <a href=3D"https://github.com/openbmc/obmc-console.git" target=3D=
"_blank">https://github.com/openbmc/obmc-console.git</a>&nbsp;&nbsp;YES, UN=
IT TEST<br><br>I need to add coverage support to obmc-console.<br><br>&gt; =
<a href=3D"https://github.com/openbmc/openbmc-tools.git" target=3D"_blank">=
https://github.com/openbmc/openbmc-tools.git</a>&nbsp;&nbsp;NO<br><br>Not s=
ure we can expect anything for openbmc-tools - it's a collection<br>of rand=
om scripts people have written to make their life developing<br>openbmc eas=
ier. It's not something that should have strict QA<br>processes.<br><br>&gt=
; <a href=3D"https://github.com/openbmc/openpower-host-ipmi-flash.git" targ=
et=3D"_blank">https://github.com/openbmc/openpower-host-ipmi-flash.git</a>&=
nbsp;&nbsp;NO<br><br>I should add some tests here where I can.<br><br>&gt; =
<a href=3D"https://github.com/openbmc/hiomapd.git" target=3D"_blank">https:=
//github.com/openbmc/hiomapd.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a h=
ref=3D"https://github.com/openbmc/libmctp.git" target=3D"_blank">https://gi=
thub.com/openbmc/libmctp.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=
=3D"https://github.com/openbmc/phosphor-led-sysfs.git" target=3D"_blank">ht=
tps://github.com/openbmc/phosphor-led-sysfs.git</a>&nbsp;&nbsp;YES, UNIT TE=
ST<br><br>These three do in-fact have GCOV/LCOV support, you need to do the=
 usual autotools invocations to get it:<br><br>```<br>./configure --enable-=
code-coverage &amp;&amp; make check-code-coverage<br>```<br><br>&gt; <a hre=
f=3D"https://github.com/openbmc/phosphor-mboxd.git" target=3D"_blank">https=
://github.com/openbmc/phosphor-mboxd.git</a>&nbsp;&nbsp;ERROR<br><br>This i=
s archived.<br><br>...<br><br>&gt; <a href=3D"https://github.com/openbmc/u-=
boot" target=3D"_blank">https://github.com/openbmc/u-boot</a>&nbsp;&nbsp;NO=
<br><br>This uses Kbuild as a build system. I notice openbmc/linux and open=
bmc/qemu aren't included in the list.<br><br>&gt; <a href=3D"https://github=
.com/openbmc/webui-vue.git" target=3D"_blank">https://github.com/openbmc/we=
bui-vue.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc=
/witherspoon-pfault-analysis.git" target=3D"_blank">https://github.com/open=
bmc/witherspoon-pfault-analysis.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&gt; <a=
 href=3D"https://github.com/openbmc/x86-power-control.git" target=3D"_blank=
">https://github.com/openbmc/x86-power-control.git</a>&nbsp;&nbsp;NO<br>&gt=
; *************************UNIT TEST COVERAGE<br>&gt; REPORT***************=
**********<br>&gt; SUMMARY:<br>&gt; TOTAL REPOSITORIES : 110<br>&gt; TESTED=
 REPOSITORIES : 43<br>&gt; ERROR : 11<br>&gt; COVERAGE REPORT : 12<br>&gt; =
UNIT TEST REPORT : 31<br>&gt; NO REPORT : 56<br>&gt; **********************=
*****************************************************<br>&gt; Following act=
ions, we can draw from above<br>&gt;<br>&gt; &nbsp;1. *There are 12 repo's =
that have GCOV/LCOV plugged in* - We need to<br>&gt; maintain which has goo=
d coverage and try to improve those which has<br>&gt; less coverage<br>&gt;=
 &nbsp;2. *There are 31 repo's that have unit test cases added but no<br>&g=
t; coverage analysis because they aren't plugged in yet to GCOV/LCOV* - Is<=
br>&gt; there a plan for plugging in GCOV<br><br>As above at least three of=
 these are false-negatives for test coverage.<br><br>Andrew</font><br>&nbsp=
;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>

