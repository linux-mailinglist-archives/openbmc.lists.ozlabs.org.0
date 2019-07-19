Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984B6E0BF
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 07:51:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qg9X1klKzDqst
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 15:51:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qd8n4QLMzDqMW
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 14:20:39 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6J4HIFC009625
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 00:20:34 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.119])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tu0uak8ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 00:20:34 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Fri, 19 Jul 2019 04:20:17 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.182.123) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 19 Jul 2019 04:20:16 -0000
Received: from us1b3-mail64.a3dr.sjc01.isc4sb.com ([10.122.7.93])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019071904201569-15473 ;
 Fri, 19 Jul 2019 04:20:15 +0000 
In-Reply-To: 
Subject: [tsc]  How we can make others contribute to openbmc-test-automation
 repository
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 19 Jul 2019 04:20:15 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP55 May 22, 2019 at 11:09
X-KeepSent: EB757C0D:E4799559-0025843C:0016DC0E;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 45175
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19071904-6115-0000-0000-000006714D61
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.413459; ST=0; TS=0; UL=0; ISC=; MB=0.080939
X-IBM-SpamModules-Versions: BY=3.00011455; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01234230; UDB=6.00650404; IPR=6.01015561; 
 BA=6.00006356; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00027791; XFM=3.00000015;
 UTC=2019-07-19 04:20:17
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-07-18 23:53:41 - 6.00010181
x-cbparentid: 19071904-6116-0000-0000-0000F2E16F96
Message-Id: <OFEB757C0D.E4799559-ON0025843C.0016DC0E-0025843C.0017D3B9@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_03:, , signatures=0
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
Cc: Ravindra S Rao1 <ravindra.s@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Hi All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Objective of this mail is to get contribution to openbmc-=
test-automation repository.</div>
<div dir=3D"ltr" >Not only in automation / automation test plan / code revi=
ew, Even sharing test results also fine.</div>
<div dir=3D"ltr" >As openbmc common for both Intel and Power platform, If s=
ome one share Intel based test results of</div>
<div dir=3D"ltr" >openbmc-test-automation test cases also good.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Would like to get your suggestions / input on how we can =
make openbmc-test better.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Hi Brad, Could you please have it in TSC group agenda.</d=
iv>
<div dir=3D"ltr" >If needed, Will schedule separate meeting which aligns wi=
th all other convenient time.</div>
<div dir=3D"ltr" >Thank you in advance Brad.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >With regards,</div>
<div dir=3D"ltr" >Sivas</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

