Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3495418
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 04:14:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CDrd1qYQzDql6
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 12:14:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sivas.srr@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CDqZ5L7VzDqkS
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 12:13:45 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K2CbnC017643
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 22:13:42 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.112])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ug63dkes1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 22:13:42 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Tue, 20 Aug 2019 02:13:41 -0000
Received: from us1b3-smtp02.a3dr.sjc01.isc4sb.com (10.122.7.175)
 by smtp.notes.na.collabserv.com (10.122.47.54) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 20 Aug 2019 02:13:39 -0000
Received: from us1b3-mail65.a3dr.sjc01.isc4sb.com ([10.122.7.228])
 by us1b3-smtp02.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019082002133845-1094304 ;
 Tue, 20 Aug 2019 02:13:38 +0000 
In-Reply-To: <CADy_Pt3zcSaN9Eh=yM9PC1ex1Nd3XVSEWcwarohsAcm=cwz6cQ@mail.gmail.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: james.mihm@gmail.com
Date: Tue, 20 Aug 2019 02:13:38 +0000
Sensitivity: 
MIME-Version: 1.0
References: <CADy_Pt3zcSaN9Eh=yM9PC1ex1Nd3XVSEWcwarohsAcm=cwz6cQ@mail.gmail.com>,
 <OFEB757C0D.E4799559-ON0025843C.0016DC0E-0025843C.0017D3B9@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP55 May 22, 2019 at 11:09
X-KeepSent: 3B10C288:9F732822-0025845C:000C161E;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 21763
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19082002-4615-0000-0000-0000004B1022
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.363559; ST=0; TS=0; UL=0; ISC=; MB=0.002676
X-IBM-SpamModules-Versions: BY=3.00011621; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01249321; UDB=6.00659504; IPR=6.01030857; 
 MB=3.00028240; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-20 02:13:40
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-08-20 01:25:26 - 6.00010306
x-cbparentid: 19082002-4616-0000-0000-0000200639BA
Message-Id: <OF3B10C288.9F732822-ON0025845C.000C161E-0025845C.000C3C4C@notes.na.collabserv.com>
Subject: RE: [tsc] How we can make others contribute to openbmc-test-automation
 repository
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_01:, , signatures=0
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
Cc: openbmc@lists.ozlabs.org, Ravindra S Rao1 <ravindra.s@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Thank you for your =
mail James. Expecting to hear / see good progress in openbmc-test-automatio=
n.</div>
<div dir=3D"ltr" >Similarly other organization also comes up and contribute=
 in test repository then it will be good.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >With regards,</div>
<div dir=3D"ltr" >Sivas</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: James Mihm &lt;jam=
es.mihm@gmail.com&gt;<br>To: Sivas Srr &lt;sivas.srr@in.ibm.com&gt;<br>Cc: =
openbmc@lists.ozlabs.org, Ravindra S Rao1 &lt;ravindra.s@in.ibm.com&gt;<br>=
Subject: [EXTERNAL] Re: [tsc] How we can make others contribute to openbmc-=
test-automation repository<br>Date: Sat, Aug 17, 2019 10:25 AM<br>&nbsp;<br=
><font size=3D"3" >Hi&nbsp;Sivas, I'm sorry it's taken so long for me to re=
spond. We do want to participate in the openbmc-test-automation repository.=
 One of the challenges that we have is limited resources working on deliver=
ing products using our internal test automation tools versus the openbmc-te=
st-automation. I'll discuss with my team at Intel to determine when can spe=
nd some cycles on this effort.</font><br><br><font size=3D"3" >Thanks, Jame=
s.</font><br><br><font size=3D"3" >On Thu, Jul 18, 2019 at 10:51 PM Sivas S=
rr &lt;</font><a href=3D"mailto:sivas.srr@in.ibm.com" target=3D"=5Fblank" >=
<u><font size=3D"3" color=3D"#0000ff" >sivas.srr@in.ibm.com</font></u></a><=
font size=3D"3" >&gt;&nbsp;wrote:</font><br><font size=3D"3" >Hi All,</font=
><font size=3D"3" >&nbsp;</font><br><font size=3D"3" >Objective of this mai=
l is to get contribution to openbmc-test-automation repository.</font><br><=
font size=3D"3" >Not only in automation / automation test plan / code revie=
w, Even sharing test results also fine.</font><br><font size=3D"3" >As open=
bmc common for both Intel and Power platform, If some one share Intel based=
 test results of</font><br><font size=3D"3" >openbmc-test-automation test c=
ases also good.</font><font size=3D"3" >&nbsp;</font><br><font size=3D"3" >=
Would like to get your suggestions / input on how we can make openbmc-test =
better.</font><font size=3D"3" >&nbsp;</font><br><font size=3D"3" >Hi Brad,=
 Could you please have it in TSC group agenda.</font><br><font size=3D"3" >=
If needed, Will schedule separate meeting which aligns with all other conve=
nient time.</font><br><font size=3D"3" >Thank you in advance Brad.</font><f=
ont size=3D"3" >&nbsp;</font><br><font size=3D"3" >With regards,</font><br>=
<font size=3D"3" >Sivas</font><font size=3D"3" >&nbsp;</font><font size=3D"=
3" >&nbsp;</font><font size=3D"3" >&nbsp;</font></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

