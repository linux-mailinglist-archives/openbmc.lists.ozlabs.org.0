Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1227EABA
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 16:14:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1dY01h8BzDqV4
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 00:14:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vara.prasad.garlapati@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fPjcLm2L; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1dWc5tFVzDqTw
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 00:12:56 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08UE3AZb018922
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 10:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : mime-version : content-transfer-encoding :
 content-type : message-id; s=pp1;
 bh=iFBgZuWkVscICDw5QroyyoWFY3sxGZudf+ZnR5W2IdA=;
 b=fPjcLm2LbwiMAdstks4FKFuFoFDvilXIauvNJZUtCF7iTQ6pez45ZHTQB6ywV3gv+gnB
 ydQa6rGPYWUax2UFt6ewwet2G+2ndL4tzRk758HXzDCSnD6eo9o/B15geyfJg1hpAu72
 Lo2000wOdWVy2I4RH41VIHU1iLntPfhyA08sktnb2eFYAZIhqEj4eQMAqWTZpSGx7D0+
 eUThN8J+sFKhTzPiKJcXspAJ/Y1qSYiFX+Bqk4CZyzXH34OSco5vOLg0r0wkEIDmEU+c
 03e9aexrvW0OaZQUpTIrLiEyVquC/vLlztLAJZGzkPZKykq2dQHPlTMUEFFtYavlEsBJ qw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33vtayk2bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 10:12:54 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Vara.prasad.Garlapati@ibm.com>;
 Wed, 30 Sep 2020 14:12:54 -0000
Received: from us1b3-smtp03.a3dr.sjc01.isc4sb.com (10.122.7.173)
 by smtp.notes.na.collabserv.com (10.122.47.50) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 30 Sep 2020 14:12:51 -0000
Received: from us1b3-mail107.a3dr.sjc01.isc4sb.com ([10.122.203.109])
 by us1b3-smtp03.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020093014125153-450626 ;
 Wed, 30 Sep 2020 14:12:51 +0000 
In-Reply-To: 
Subject: Need info
From: "Vara prasad Garlapati" <Vara.prasad.Garlapati@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 30 Sep 2020 14:12:50 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-KeepSent: C6A04727:81CE0726-002585F3:004DBCDD;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 38579
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20093014-1059-0000-0000-000002DB2340
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.413459; ST=0; TS=0; UL=0; ISC=; MB=0.000192
X-IBM-SpamModules-Versions: BY=3.00013923; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01442359; UDB=6.00775119; IPR=6.01225048; 
 MB=3.00034323; MTD=3.00000008; XFM=3.00000015; UTC=2020-09-30 14:12:52
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-09-30 09:11:10 - 6.00011901
x-cbparentid: 20093014-1060-0000-0000-000055AC2481
Message-Id: <OFC6A04727.81CE0726-ON002585F3.004DBCDD-002585F3.004E147F@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_07:2020-09-30,
 2020-09-30 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >GM All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Are there any&nbsp; open source tools that are available =
to run against Functional verification tests, written in Python, robot, tha=
t can evaluate&nbsp; code coverage?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Appreciate any help on this.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socma=
ildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-seri=
f;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D=
"font-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"lt=
r" ><div style=3D"font-size: 12pt; font-weight: bold; font-family: sans-ser=
if; color: #7C7C5F;" >Regards,</div>
<div style=3D"font-size: 12pt; font-weight: bold; font-family: sans-serif; =
color: #7C7C5F;" >Prasad Garlapati</div>
<div style=3D"font-size: 12pt; font-weight: bold; font-family: sans-serif; =
color: #7C7C5F;" >E-mail: vara.prasad.garlapati@ibm.com</div></div></div></=
div></div></div></div><BR>

