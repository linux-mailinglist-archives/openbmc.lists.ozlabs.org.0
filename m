Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177CDFE16
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 09:17:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y4Zd3STjzDqJ8
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 18:17:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sivas.srr@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y4Yn3Xr8zDqHh
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 18:16:28 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9M7558Y108791
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 03:16:22 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vstjjvcvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 03:16:22 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Tue, 22 Oct 2019 07:16:21 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 22 Oct 2019 07:16:19 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2019102207161834-149810 ;
 Tue, 22 Oct 2019 07:16:18 +0000 
In-Reply-To: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: ed.tanous@intel.com
Date: Tue, 22 Oct 2019 07:16:18 +0000
Sensitivity: 
MIME-Version: 1.0
References: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP59 September 23, 2019 at 18:08
X-LLNOutbound: False
X-Disclaimed: 36475
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19102207-4409-0000-0000-000000E54AEB
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.018125
X-IBM-SpamModules-Versions: BY=3.00011981; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01278989; UDB=6.00677627; IPR=6.01061121; 
 MB=3.00029187; MTD=3.00000008; XFM=3.00000015; UTC=2019-10-22 07:16:20
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-10-22 03:56:26 - 6.00010555
x-cbparentid: 19102207-4410-0000-0000-0000180CAED4
Message-Id: <OFFD9A29C1.E720BC4A-ON0025849B.0027F118-0025849B.0027F228@notes.na.collabserv.com>
Subject: Re:  It's been fun
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-22_03:, , signatures=0
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
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Nice Interacting wi=
th you Ed Tanous especially related to LDAP. All the best.</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Ed Tanous &lt;ed.t=
anous@intel.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+sivas.srr=3Di=
n.ibm.com@lists.ozlabs.org&gt;<br>To: "openbmc@lists.ozlabs.org" &lt;openbm=
c@lists.ozlabs.org&gt;<br>Cc:<br>Subject: [EXTERNAL] It's been fun<br>Date:=
 Tue, Oct 22, 2019 2:05 AM<br>&nbsp;<br><tt><font size=3D"3" face=3D"" >All=
,</font></tt><br><br><tt><font size=3D"3" face=3D"" >This week will be my l=
ast week at Intel. &nbsp;I'll be moving onto something</font></tt><br><tt><=
font size=3D"3" face=3D"" >else non-OpenBMC related for a bit; &nbsp;While =
I may check in on the project</font></tt><br><tt><font size=3D"3" face=3D""=
 >from time to time, it's going to stop being my day job.</font></tt><br><b=
r><tt><font size=3D"3" face=3D"" >You'll still be able to reach me at my ot=
her email, ed@tanous.net, and</font></tt><br><tt><font size=3D"3" face=3D""=
 >several key people across the project including the TSC have my cell</fon=
t></tt><br><tt><font size=3D"3" face=3D"" >number if there's some unknown O=
penBMC "emergency", but I doubt that's</font></tt><br><tt><font size=3D"3" =
face=3D"" >going to be needed. &nbsp;Functionally, I've made sure that ever=
y repo I</font></tt><br><tt><font size=3D"3" face=3D"" >maintain has backup=
 maintainers, so as of the 25th, it will fall to</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >those individuals to do new reviews for those individu=
al repos. &nbsp;I'll be</font></tt><br><tt><font size=3D"3" face=3D"" >push=
ing updates to the MAINTAINERS files shortly to that effect.</font></tt><br=
><br><tt><font size=3D"3" face=3D"" >Thanks you for all the patches, ideas,=
 reviews, and merges that others</font></tt><br><tt><font size=3D"3" face=
=3D"" >have done for me over the last couple years.</font></tt><br><br><tt>=
<font size=3D"3" face=3D"" >Until we meet again,</font></tt><br><br><tt><fo=
nt size=3D"3" face=3D"" >-Ed</font></tt></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

