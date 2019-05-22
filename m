Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968825C8B
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 06:11:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457zj41XbtzDqNK
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 14:11:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sivas.srr@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457zhd1XmtzDqC7
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 14:11:11 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M47alw004442
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 00:11:08 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.104])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2smxuw8m05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 00:11:08 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Wed, 22 May 2019 04:11:07 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.47.44) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 22 May 2019 04:11:05 -0000
Received: from us1b3-mail65.a3dr.sjc01.isc4sb.com ([10.122.7.228])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019052204110539-14913 ;
 Wed, 22 May 2019 04:11:05 +0000 
In-Reply-To: 
Subject: OpenBMC Functional Test Specification 
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 22 May 2019 04:11:05 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17394-1588 | IBM Domino Build
 SCN1812108_20180501T0841_FP38 April 10, 2019 at 11:56
X-KeepSent: 95F531BE:2AB46A8E-00258402:0016F642;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 3647
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19052204-7301-0000-0000-000007066B66
X-IBM-SpamModules-Scores: BY=0.000006; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.392621; ST=0; TS=0; UL=0; ISC=; MB=0.274089
X-IBM-SpamModules-Versions: BY=3.00011140; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01206801; UDB=6.00633729; IPR=6.00987775; 
 BA=6.00006316; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00026995; XFM=3.00000015;
 UTC=2019-05-22 04:11:06
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-05-21 23:27:52 - 6.00009953
x-cbparentid: 19052204-7302-0000-0000-00005F9E9B30
Message-Id: <OF95F531BE.2AB46A8E-ON00258402.0016F642-00258402.0016FCD1@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_02:, , signatures=0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hi All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Here with sending OpenBMC functional test specification f=
or your review.</div>
<div dir=3D"ltr" >Document is attached in the below issue.</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openbmc-test-automa=
tion/issues/1769" >https://github.com/openbmc/openbmc-test-automation/issue=
s/1769</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Please take a look and let know your inputs.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >With regards,</div>
<div dir=3D"ltr" >Sivas</div></div><BR>

