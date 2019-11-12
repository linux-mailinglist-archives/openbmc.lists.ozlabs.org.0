Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6B4F9C5C
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 22:35:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CLd51Z52zF46W
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 08:35:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CLcK2v7NzF3ds
 for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2019 08:34:39 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xACLWBUg015503
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 16:34:35 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w84g0rfxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 16:34:34 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 12 Nov 2019 21:34:33 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 12 Nov 2019 21:34:29 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2019111221342936-941065 ;
 Tue, 12 Nov 2019 21:34:29 +0000 
In-Reply-To: <c4161dca-1575-23bc-2386-dee3cf5a6d54@intel.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 12 Nov 2019 21:34:28 +0000
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 1399
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19111221-2475-0000-0000-00000156A8C6
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.114889
X-IBM-SpamModules-Versions: BY=3.00012096; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01289016; UDB=6.00683637; IPR=6.01071209; 
 MB=3.00029496; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-12 21:34:32
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-12 03:49:56 - 6.00010637
x-cbparentid: 19111221-2476-0000-0000-00002F6ED4DC
Message-Id: <OFAAC0DA11.6C700237-ON002584B0.006CB5F1-002584B0.0076834B@notes.na.collabserv.com>
Subject: RE: Updating BMC GUI Front End Framework
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-12_08:, , signatures=0
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
Cc: kuiying.wang@intel.com, gmills@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Lucida S=
ans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" st=
yle=3D"font-family:Lucida Sans Unicode, Lucida Grande, sans-serif;font-size=
:10pt" ><div dir=3D"ltr" >Bringing back the conversation on updating the GU=
I front end framework.</div>
<div dir=3D"ltr" >I have answered some of the basic questions that were bro=
ught up and our</div>
<div dir=3D"ltr" >recommendation is to update the GUI framework to use Vue.=
</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><di=
v dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div d=
ir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=
=3D"ltr" ><div><div dir=3D"ltr" ><div>&gt; Rather than try to compare frame=
works in a vacuum, I'd rather state that<br>&gt; the "new" framework must b=
e the same size or smaller than the existing<br>&gt; for the same functiona=
lity. &nbsp;If it's larger, why even upgrade given how<br>&gt; precious fla=
sh space is to us?</div>
<div>&nbsp;</div>
<div>If we switch to Vue, the footprint, even with adding VueX and Vue Rout=
er</div>
<div>will still be smaller than AngularJS.</div>
<div>&nbsp;</div>
<div>&nbsp;</div></div></div>
<div><div>&gt; IMHO good reasons include:<br>&gt; 1. Reducing the code size=
 (both in binary and in LOC checked in)<br>&gt; 2. Reducing the number of b=
ugs present, by introducing more robust concepts.<br>&gt; 3. Increasing loa=
d time and run time performance of the webui.<br>&gt; 4. Reducing the janki=
ness/brittleness of the build system (yes, I'll<br>&gt; take the blame for =
this) by replacing the frameworks with something more<br>&gt; standard that=
 yocto already understands.</div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >1. As mentioned above, the code size should be reduced us=
ing Vue. it should also</div>
<div dir=3D"ltr" >be easier to manage the application moving forward.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >2. The Vue API is much easier to use and the documentatio=
n is robust allowing for</div>
<div dir=3D"ltr" >better overall support. If we are rewriting, we will want=
 to consider building in</div>
<div dir=3D"ltr" >unit tests&nbsp;from the beginning using a framework like=
 Jest or Mocha to help</div>
<div dir=3D"ltr" >assure code quality</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >3. The way that Vue handles&nbsp;state management allows =
for optimization and a better</div>
<div dir=3D"ltr" >overall user experience. It also handles DOM manipulation=
 better than AngularJS.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >4. We know that Inspur has already created a build using =
Vue. That's all that I can&nbsp;</div>
<div dir=3D"ltr" >comment on regarding this item.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Other concerns that we have include:</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >1.&nbsp;<span style=3D"font-size: 10pt;" >Support for Ang=
ularJS (v 1.x) ends in 2021. It will longer be backed by Google</span></div>
<div dir=3D"ltr" ><span style=3D"font-size: 10pt;" >or receive any updates =
for any reason.</span></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><span style=3D"font-size: 10pt;" >2. The c</span><span st=
yle=3D"font-size: 10pt;" >ommunity is diminishing as developers move to mor=
e modern frameworks.</span></div>
<div dir=3D"ltr" ><span style=3D"font-size: 10pt;" >Updating to Vue will im=
prove future framework support as ECMAScript and browser</span></div>
<div dir=3D"ltr" ><span style=3D"font-size: 10pt;" >technologies&nbsp;evolv=
e.</span></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><span style=3D"font-size: 10pt;" >3. Lack of support for =
modern component libraries. Deciding on and using a modern</span></div>
<div dir=3D"ltr" ><span style=3D"font-size: 10pt;" >component&nbsp;library =
will allow BMC GUI developers to focus on building features instead</span><=
/div>
<div dir=3D"ltr" ><span style=3D"font-size: 10pt;" >of designing and buildi=
ng base components.</span></div></div></div><BR>

