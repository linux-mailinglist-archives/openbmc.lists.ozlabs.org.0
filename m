Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8572EB4CF
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 22:22:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9QS80dVzzDqbs
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 08:22:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TUgJl8Hj; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9QR13S8szDqY7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 08:21:15 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 105L9ZE8022941
 for <openbmc@lists.ozlabs.org>; Tue, 5 Jan 2021 16:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XI0tKsNmmBwmdbWuZhGka+DkW7Z1ACM1fYwqDDLyxqA=;
 b=TUgJl8HjPtVyWYi6szfis4dn5rZXCOz28pMRZduIa00I8HmbNROQn2Ap0wKSkFqHP8rF
 PHYJI0JZWqaA/2lQwQ11sc/u5KDxs4bZei8OrA0t2q1MIs4n+9A0f0b1o0ynixQQ1qKB
 1j+bydOXDKIoMFvZb+UwpfxE3N/sIgqtafbeXvnH2M5nPGtoMdAIxVqU7e+K8FNnd4uW
 j0sCITadh+6p51Yn6dyU3NvO2RBkSOdHuYXzZQIc+ERmJZssqDdkLRUCyLF62gxHSxdK
 YG+pHk7I7VjI0LpEbQYZfSaNvmzs6/ZqMGnSGOFQBpB3TPJ6mPQsa7TMQEYSJacnAiFo Xw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35vxpdsvta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jan 2021 16:21:12 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 5 Jan 2021 21:21:12 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 5 Jan 2021 21:21:10 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2021010521210924-757302 ;
 Tue, 5 Jan 2021 21:21:09 +0000 
In-Reply-To: 
Subject: GUI Design Work Group - Wednesday 1/6/21 at 10:00 AM CT
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 5 Jan 2021 21:21:09 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 3591
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 21010521-9463-0000-0000-000004F59E08
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.431006; ST=0; TS=0; UL=0; ISC=; MB=0.000145
X-IBM-SpamModules-Versions: BY=3.00014502; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01488690; UDB=6.00802680; IPR=6.01271261; 
 MB=3.00035746; MTD=3.00000008; XFM=3.00000015; UTC=2021-01-05 21:21:11
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-01-05 13:32:49 - 6.00012197
x-cbparentid: 21010521-9464-0000-0000-00005FFCACF9
Message-Id: <OF4C9F3310.A836F7E5-ON00258654.00754AF3-00258654.00754AF7@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_07:2021-01-05,
 2021-01-05 signatures=0
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

Please join us for the GUI Design Work Group if you are interested in the f=
ollowing items:

- Review dumps layout and copy
- Discuss strategy for handling functionality and/or content (copy, termino=
logy) that does not share community consensus or need=20

If you have a topic, please feel free to add it to the agenda, reply to thi=
s email, or mention me in the discord channel (https://discord.gg/wWU5rTcb).
=20
Meeting info: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group=
#meeting-info


Thank you!
=20
Derick Montague
IBM Cognitive Systems User Experience

