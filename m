Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368C173D29
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 17:39:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TZyD1K1zzDqvt
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 03:39:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TZxb2JZxzDqsj
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 03:39:15 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SGTmOK060997
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 11:39:13 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yepx5nt0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 11:39:13 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <lkammath@in.ibm.com>;
 Fri, 28 Feb 2020 16:39:12 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 28 Feb 2020 16:39:09 -0000
Received: from us1a3-mail34.a3.dal06.isc4sb.com ([10.146.6.29])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020022816390813-643901 ;
 Fri, 28 Feb 2020 16:39:08 +0000 
In-Reply-To: <ABE45DC2-0C5E-42B6-AE1F-60C5F608D1F1@fuzziesquirrel.com>
From: "Lakshminarayana R Kammath" <lkammath@in.ibm.com>
To: bradleyb@fuzziesquirrel.com
Date: Fri, 28 Feb 2020 16:39:07 +0000
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 59759
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20022816-7279-0000-0000-00000215C492
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.000001
X-IBM-SpamModules-Versions: BY=3.00012657; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01340537; UDB=6.00714412; IPR=6.01122900; 
 MB=3.00031011; MTD=3.00000008; XFM=3.00000015; UTC=2020-02-28 16:39:10
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-02-28 12:46:28 - 6.00011059
x-cbparentid: 20022816-7280-0000-0000-00004ECFDBBA
Message-Id: <OFD4A6FC95.990EBF4E-ON0025851C.005B2BE8-0025851C.005B78ED@notes.na.collabserv.com>
Subject: RE: [OpenBMC]: Unit test coverage analysis on openbmc repositories
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_05:2020-02-28,
 2020-02-28 signatures=0
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
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Yes, We ca=
n do that. Just need to figure out the API's</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div dir=3D"ltr" style=3D"font-family:Arial, Helvetica, s=
ans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family:Arial, Hel=
vetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Thanks &=
amp; Regards,<br>Lakshminarayana Kamath</div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Brad Bishop &lt;br=
adleyb@fuzziesquirrel.com&gt;<br>To: Lakshminarayana R Kammath &lt;lkammath=
@in.ibm.com&gt;<br>Cc: openbmc@lists.ozlabs.org<br>Subject: [EXTERNAL] Re: =
[OpenBMC]: Unit test coverage analysis on openbmc repositories<br>Date: Fri=
, Feb 28, 2020 10:01 PM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >at 11:30 AM, Lakshminarayana R Kammath &lt;lkammath@in.ibm.com&gt; wro=
te:<br><br>&gt; sure Brad!<br>&gt;<br>&gt; If Some one can confirm the list=
 of repo's that can be ignored we can put &nbsp;<br>&gt; them to blacklist<=
br><br>Is it possible to use the GitHub api to query this? &nbsp;Then we do=
n=E2=80=99t need to &nbsp;<br>maintain a blacklist. &nbsp;How are you build=
ing the list of repos?</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>

