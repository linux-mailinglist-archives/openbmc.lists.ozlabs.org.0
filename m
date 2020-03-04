Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF8178AC6
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 07:42:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XPT46LvrzDqYp
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 17:42:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=lkammath@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XPSH5gVfzDqPc
 for <openbmc@lists.ozlabs.org>; Wed,  4 Mar 2020 17:42:07 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0246YCGf025786
 for <openbmc@lists.ozlabs.org>; Wed, 4 Mar 2020 01:42:04 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj6nhs4nk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 01:42:04 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <lkammath@in.ibm.com>;
 Wed, 4 Mar 2020 06:42:03 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 4 Mar 2020 06:42:01 -0000
Received: from us1a3-mail34.a3.dal06.isc4sb.com ([10.146.6.29])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2020030406420048-155745 ;
 Wed, 4 Mar 2020 06:42:00 +0000 
In-Reply-To: <D26BBC58-0010-4475-B5DA-1710E2F71FF0@fuzziesquirrel.com>
From: "Lakshminarayana R Kammath" <lkammath@in.ibm.com>
To: bradleyb@fuzziesquirrel.com
Date: Wed, 4 Mar 2020 06:42:00 +0000
Sensitivity: 
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 895
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 20030406-3067-0000-0000-000002831B06
X-IBM-SpamModules-Scores: BY=0.292102; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.4332; ST=0; TS=0; UL=0; ISC=; MB=0.037945
X-IBM-SpamModules-Versions: BY=3.00012684; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01342678; UDB=6.00715696; IPR=6.01125067; 
 MB=3.00031072; MTD=3.00000008; XFM=3.00000015; UTC=2020-03-04 06:42:03
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-03-04 05:44:20 - 6.00011076
x-cbparentid: 20030406-3068-0000-0000-0000690D5A80
Message-Id: <OF1C3951DD.D07109E0-ON00258521.00243F1A-00258521.0024CDEE@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 6 URL's were un-rewritten
MIME-Version: 1.0
Subject: RE: [OpenBMC]: Unit test coverage analysis on openbmc repositories
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_08:2020-03-03,
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
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Brad/Andre=
w,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>We are using pygithub3 module to list the repo's und=
er openbmc</div>
<div>&nbsp;</div>
<div>here is the snippet of that code . we create a list based on o/p of th=
is which is i/p to the main script which does the analysis</div>
<div>&nbsp;</div>
<div>If the repo's are archived saw that this below code as well skips same=
</div>
<div>&nbsp;</div>
<div><div>#!/usr/bin/env python<br>""" Print all of the clone-urls for a Gi=
tHub organization.</div>
<div>It requires the pygithub3 module, which you can install like this::</d=
iv>
<div>&nbsp;&nbsp;&nbsp; $ sudo yum -y install python-virtualenv<br>&nbsp;&n=
bsp;&nbsp; $ mkdir scratch<br>&nbsp;&nbsp;&nbsp; $ cd scratch</div>
<div>&nbsp;&nbsp;&nbsp; $ virtualenv my-virtualenv<br>&nbsp;&nbsp;&nbsp; $ =
source my-virtualenv/bin/activate</div>
<div>&nbsp;&nbsp;&nbsp; $ pip install pygithub3</div>
<div>Usage example::</div>
<div>&nbsp;&nbsp;&nbsp; $ python list-all-repos.py</div>
<div>Advanced usage.&nbsp; This will actually clone all the repos for a<br>=
GitHub organization or user::</div>
<div>&nbsp;&nbsp;&nbsp; $ for url in $(python list-all-repos.py); do git cl=
one $url; done</div>
<div>"""</div>
<div>import pygithub3</div>
<div>gh =3D None</div>
<div><br>def gather_clone_urls(organization, no_forks=3DTrue):<br>&nbsp;&nb=
sp;&nbsp; all_repos =3D gh.repos.list(user=3Dorganization).all()<br>&nbsp;&=
nbsp;&nbsp; for repo in all_repos:</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Don't print the urls for =
repos that are forks.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if no_f=
orks and repo.fork:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; continue</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yield repo.clone_url</div>
<div><br>if __name__ =3D=3D '__main__':<br>&nbsp;&nbsp;&nbsp; gh =3D pygith=
ub3.Github()</div>
<div>&nbsp;&nbsp;&nbsp; clone_urls =3D gather_clone_urls("openbmc")<br>&nbs=
p;&nbsp;&nbsp; for url in clone_urls:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; print url</div>
<div>&nbsp;</div>
<div>&nbsp;</div></div></div>
<div dir=3D"ltr" ><div dir=3D"ltr" style=3D"font-family:Arial, Helvetica, s=
ans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family:Arial, Hel=
vetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Thanks &=
amp; Regards,<br>Lakshminarayana Kamath</div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt;<br>To: Lakshminar=
ayana R Kammath &lt;lkammath@in.ibm.com&gt;<br>Cc: openbmc@lists.ozlabs.org=
<br>Subject: [EXTERNAL] Re: [OpenBMC]: Unit test coverage analysis on openb=
mc repositories<br>Date: Fri, Feb 28, 2020 10:06 PM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >at 11:31 AM, Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt; wrote:<br=
><br>&gt; at 11:30 AM, Lakshminarayana R Kammath &lt;lkammath@in.ibm.com&gt=
; wrote:<br>&gt;<br>&gt;&gt; sure Brad!<br>&gt;&gt;<br>&gt;&gt; If Some one=
 can confirm the list of repo's that can be ignored we can &nbsp;<br>&gt;&g=
t; put them to blacklist<br>&gt;<br>&gt; Is it possible to use the GitHub a=
pi to query this? &nbsp;Then we don=E2=80=99t need &nbsp;<br>&gt; to mainta=
in a blacklist. &nbsp;How are you building the list of repos?<br><br><a hre=
f=3D"https://developer.github.com/v3/repos/#list-organization-repositories"=
 target=3D"_blank">https://developer.github.com/v3/repos/#list-organization=
-repositories</a>&nbsp;<br><br>there is an =E2=80=9Carchived=E2=80=9D prope=
rty in the response to this list-org-repos api &nbsp;<br>that seems like it=
 would work?<br><br>This looks like an interesting python module that might=
 make the API &nbsp;<br>interaction easier...<br><br><a href=3D"https://pyg=
ithub.readthedocs.io/en/latest/" target=3D"_blank">https://pygithub.readthe=
docs.io/en/latest/</a>&nbsp;</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>

