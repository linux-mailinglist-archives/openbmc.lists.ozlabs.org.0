Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C612B1E457D
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 16:15:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XCXy2bk3zDqPG
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 00:15:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PjQbU/S/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XCWj74PdzDqPK
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 00:14:41 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04RE1urV098164
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 10:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : mime-version : references : content-transfer-encoding :
 content-type : message-id; s=pp1;
 bh=KROOFCKzAlE5DKEdGRqX/BPw/JWPVQ36yit15QMyQEw=;
 b=PjQbU/S/r/tL/yKlDYgLRI4kN0r7OzVaS2yM0cUUyOyexvdu3pZeBt6jUh3h0uWdPK45
 bHWPcwkNygLGnsKOy4czRTiXgDAryJJIAyqhHPxvoHl+sfHRp/D2pkm7WVCoch9Bg1o3
 UvPSq21NZe3zzgGYE3aSWgphIvrRnhz0ROShlF/M3RRnoHS0tznEVR+pH1HynJiPOOXI
 9jf+96XlLp3kJIHxh1RMZfzJarxLALR/pquC8EyHSvLndN5jm0WWvnj+2PmZF3OoOw9u
 XYzfzxrvceOdFy8H5/aM5V2hEJg6/vwRwXbLEDTPSQTpyJklODGDiOWGMvCdBlXsbJ43 qg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 316vqh7qwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 10:14:38 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 27 May 2020 14:14:37 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 27 May 2020 14:14:35 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020052714143530-520993 ;
 Wed, 27 May 2020 14:14:35 +0000 
In-Reply-To: 
Subject: GUI Design Workgroup - Today at 10:00 AM Central
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 27 May 2020 14:14:34 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 53171
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20052714-8889-0000-0000-000002CA5208
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.394815; ST=0; TS=0; UL=0; ISC=; MB=0.088523
X-IBM-SpamModules-Versions: BY=3.00013175; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01382853; UDB=6.00739498; IPR=6.01165129; 
 MB=3.00032344; MTD=3.00000008; XFM=3.00000015; UTC=2020-05-27 14:14:36
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-05-27 11:11:00 - 6.00011412
x-cbparentid: 20052714-8890-0000-0000-000066605709
Message-Id: <OF123D71B8.0538A973-ON00258575.004E3D2F-00258575.004E3D34@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-27_03:2020-05-27,
 2020-05-27 signatures=0
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

Hello,


We have a workgroup this morning. The meeting agenda today includes:


1. Working demo of Vue progress
2. Help Wanted functionality review
3. Design Review stories review

Visit the wiki page for details for joining the meeting.

OpenBMC GUI Design Workgroup Wiki: https://github.com/openbmc/openbmc/wiki/=
GUI-Design-work-group

=20
Derick Montague
FED Lead | OpenBMC Design Team Lead
Cognitive Systems User Experience

