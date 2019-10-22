Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F4DFCF9
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 07:09:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y1l72z2bzDqL9
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 16:09:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=manojeda@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y1kQ6j57zDqJT
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 16:08:45 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9M57jxp101841
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 01:08:42 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vssxea5jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 01:08:42 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <manojeda@in.ibm.com>;
 Tue, 22 Oct 2019 05:08:42 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 22 Oct 2019 05:08:39 -0000
Received: from us1a3-mail220.a3.dal06.isc4sb.com ([10.146.71.127])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2019102205083896-31189 ;
 Tue, 22 Oct 2019 05:08:38 +0000 
In-Reply-To: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
From: "Manojkiran Eda" <manojeda@in.ibm.com>
To: ed.tanous@intel.com
Date: Tue, 22 Oct 2019 05:08:39 +0000
Sensitivity: 
MIME-Version: 1.0
References: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP59 September 23, 2019 at 18:08
X-LLNOutbound: False
X-Disclaimed: 14703
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19102205-1335-0000-0000-000001E23915
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.017564
X-IBM-SpamModules-Versions: BY=3.00011980; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01278947; UDB=6.00677601; IPR=6.01061078; 
 MB=3.00029187; MTD=3.00000008; XFM=3.00000015; UTC=2019-10-22 05:08:41
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-10-22 03:21:01 - 6.00010555
x-cbparentid: 19102205-1336-0000-0000-00000E5A9D6D
Message-Id: <OFF3D99839.B1902FBB-ON0025849B.001C0A51-0025849B.001C4203@notes.na.collabserv.com>
Subject: Re:  It's been fun
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-22_02:, , signatures=0
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
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Good luck for your =
future endeavours Ed, It was great learning experience working with you .</=
div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Ed Tanous &lt;ed.t=
anous@intel.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+manojeda=3Din=
.ibm.com@lists.ozlabs.org&gt;<br>To: "openbmc@lists.ozlabs.org" &lt;openbmc=
@lists.ozlabs.org&gt;<br>Cc:<br>Subject: [EXTERNAL] It's been fun<br>Date: =
Tue, Oct 22, 2019 2:04 AM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >All,<br><br>This week will be my last week at Intel. &nbsp;I'll be mov=
ing onto something<br>else non-OpenBMC related for a bit; &nbsp;While I may=
 check in on the project<br>from time to time, it's going to stop being my =
day job.<br><br>You'll still be able to reach me at my other email, ed@tano=
us.net, and<br>several key people across the project including the TSC have=
 my cell<br>number if there's some unknown OpenBMC "emergency", but I doubt=
 that's<br>going to be needed. &nbsp;Functionally, I've made sure that ever=
y repo I<br>maintain has backup maintainers, so as of the 25th, it will fal=
l to<br>those individuals to do new reviews for those individual repos. &nb=
sp;I'll be<br>pushing updates to the MAINTAINERS files shortly to that effe=
ct.<br><br>Thanks you for all the patches, ideas, reviews, and merges that =
others<br>have done for me over the last couple years.<br><br>Until we meet=
 again,<br><br>-Ed</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

