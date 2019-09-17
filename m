Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B98B571F
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 22:47:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XwCZ0wsBzF3pv
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 06:47:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XwBy3qgHzF3XY
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 06:46:49 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HKTW1Q041182
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 16:46:45 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v36bws0n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 16:46:45 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 17 Sep 2019 20:46:45 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.47.48) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 17 Sep 2019 20:46:41 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019091720464091-925371 ;
 Tue, 17 Sep 2019 20:46:40 +0000 
Subject: Re: Updating BMC GUI Front End Framework
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E5253FB@shsmsx102.ccr.corp.intel.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: ed.tanous@intel.com, kuiying.wang@intel.com
Date: Tue, 17 Sep 2019 20:46:40 +0000
Sensitivity: 
References: <959CAFA1E282D14FB901BE9A7BF4E7724E5253FB@shsmsx102.ccr.corp.intel.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-KeepSent: BF5B996D:FFFAE8E7-00258478:00712980;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 54787
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 19091720-1429-0000-0000-0000004AFDAF
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.422781; ST=0; TS=0; UL=0; ISC=; MB=0.053613
X-IBM-SpamModules-Versions: BY=3.00011791; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000291; SDB=6.01262788; UDB=6.00667778; IPR=6.01044647; 
 MB=3.00028671; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-17 20:46:44
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-17 20:17:53 - 6.00010419
x-cbparentid: 19091720-1430-0000-0000-0000244B157F
Message-Id: <OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_11:, , signatures=0
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
Cc: openbmc@lists.ozlabs.org, deg.sse.openbmc@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Lucida S=
ans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" >&=
nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" ><div><p>Yes, it=E2=80=99s ti=
me to do it.<o:p></o:p></p>
<p>I suggest to use Vue, there are several reasons:<o:p></o:p></p>
<p><!--[if !supportLists]-->1. MIT license <a href=3D"https://github.com/vu=
ejs/vue/blob/dev/LICENSE" target=3D"_blank"> https://github.com/vuejs/vue/b=
lob/dev/LICENSE</a><o:p></o:p></p>
<p><!--[if !supportLists]-->2.&nbsp;The sizes of the libraries: Vue is abou=
t 80KB, much smaller than Angular (500+KB), React(100KB).</p>
<p>&nbsp; - It is sensitive on space for our OpenBMC embedded system. So Vu=
e is the best candidate.<o:p></o:p></p>
<p><!--[if !supportLists]-->3.&nbsp;It is already used by big internet comp=
any like Gitlab/Alibaba.<o:p></o:p></p>
<p><!--[if !supportLists]-->4. Vue is the most popular frameworks, accordin=
g to the number of stars on GitHub projects for Angular, React, and Vue.<o:=
p></o:p></p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; Angular &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;React&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; Vue<o:p></o:p></p>
<p># Watchers&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3.3k&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;3.7k&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5.7k<o=
:p></o:p></p>
<p># Stars&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 43k&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;71k&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 122k<o:p></o:p></p>
<p># Forks &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 11k&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;16k&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 17k<o:p></o:p></p>
<p><!--[if !supportLists]-->5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!--[end=
if]-->Vue is two-way binding<o:p></o:p><!--[if !supportLists]--></p>
<p>6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!--[endif]-->Vue is based on JS+=
HTML, it=E2=80=99s easy for existing AngularJS developer to transfer, but n=
ot like Angular (TS) and React (JSX)\</p>
<div>- Kwin</div>
<p style=3D"text-indent: -0.25in; margin: 0px 0px 0px 36pt;" ><o:p></o:p></=
p>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p><o:p></o:p></p>
<div>&nbsp;</div>
<div><o:p>&nbsp;</o:p></div>
<div>Derick, thanks for looking into this.&nbsp; I agree a small footprint =
and <o:p></o:p></div>
<div>short learning curve are important criteria.&nbsp;&nbsp; Some other cr=
iteria to <o:p></o:p></div>
<div>consider:<o:p></o:p></div>
<div>- Licensing terms, looking for permissive licenses like Apache 2.0 or =
MIT.<o:p></o:p></div>
<div>- Community support, especially for security fixes.<o:p></o:p></div>
<div><o:p>&nbsp;</o:p></div>
<div>- Joseph<o:p></o:p></div>
<div><o:p>&nbsp;</o:p></div>
<div>&nbsp;</div>
<div><div>My first thought based on the size of the application, the need f=
or a<o:p></o:p></div>
<div>smaller footprint, and the benefit of&nbsp;a small learning curve woul=
d<o:p></o:p></div>
<div>be&nbsp;Vue. However, I'm just throwing that out there to start the<o:=
p></o:p></div>
<div>conversation.</div>
<div>&nbsp;</div>
<div>- Derick</div></div></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Just adding a consensus of the 3 responders so far. Anyon=
e else have any feedback on the future front-end framework for the GUI?</di=
v></div><BR>

