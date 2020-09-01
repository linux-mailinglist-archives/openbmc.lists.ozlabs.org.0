Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CC125A077
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 23:10:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh08M6x20zDqXm
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 07:10:11 +1000 (AEST)
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
 header.s=pp1 header.b=stXqqiat; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh07Z5PNYzDqTK
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 07:09:29 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 081L1jJN126503
 for <openbmc@lists.ozlabs.org>; Tue, 1 Sep 2020 17:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QNbceyZ0QxB4SiUejdl7GYv3FYCS2Z+voh1MJGtB++s=;
 b=stXqqiatGK9EuL7AU5CGhraMeHLcAxSYrQqZgsHAbNhLcfdVVsMgXW8gCPeBYxkSZP4t
 xyvsi/1keW4kRej/UHR5Thf7HeZ1/DZenLIDrhefRnEpO3AIgeABDxHbX67CkJKGtaC7
 rsmnMc4GWzmtp/GuYapbv+KtEhiJHyqvCUsiAyhLuQJbYsuf58HF2QXibQ6avoh/qAWf
 /wfVoocFCQrpkevpK70R42UsRvjCbGBbgusdk8jr8f7LJEVG9SI5vs9e2smSS8Mhy4rJ
 E2KIyk+NsUjLUpio+RSnLE80EIM0A/qg59SnVGzmMQV3NR8/uJURjqzfMQXBQb1pVGBz Kw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339v8gtu8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2020 17:09:25 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 1 Sep 2020 21:09:25 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 1 Sep 2020 21:09:23 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2020090121092281-815376 ;
 Tue, 1 Sep 2020 21:09:22 +0000 
In-Reply-To: <OF638D78EB.A08769F2-ON002585C9.004C1612-002585C9.004C7B07@LocalDomain>
Subject: OpenBMC GUI Design Workgroup - Tomorrow - Wednesday,
 9/2/20 at 10:00 AM Central Time
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 1 Sep 2020 21:09:22 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <OF638D78EB.A08769F2-ON002585C9.004C1612-002585C9.004C7B07@LocalDomain>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 47935
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20090121-6875-0000-0000-0000034DA2E5
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.413459; ST=0; TS=0; UL=0; ISC=; MB=0.000420
X-IBM-SpamModules-Versions: BY=3.00013758; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01428660; UDB=6.00767008; IPR=6.01211386; 
 MB=3.00033827; MTD=3.00000008; XFM=3.00000015; UTC=2020-09-01 21:09:24
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-09-01 18:17:05 - 6.00011791
x-cbparentid: 20090121-6876-0000-0000-000024C6A754
Message-Id: <OF22C46790.79BD0D33-ON002585D6.00740622-002585D6.007436F7@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_10:2020-09-01,
 2020-09-01 signatures=0
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

Here is the agenda for today's GUI Design Work Group.=20=20
=20=20=20

- FormFile component redesign - https://github.com/openbmc/webui-vue/issues=
/31
- How to use utility classes discussion
- Discuss Server LED layout - https://github.com/openbmc/webui-vue/issues/18
- Discuss button styles on Local user management page -https://github.com/o=
penbmc/webui-vue/issues/12
- Help wanted items - https://github.com/openbmc/webui-vue/projects/2
- Design Review items - https://github.com/openbmc/webui-vue/projects/1
- Demo of working Web UI progress

=20=20=20
=20=20=20
Please visit the wiki for connection info and notes from past groups.=20=20
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group=20=20=20
=20=20=20
=20
Thank you!=20=20
=20=20=20
Derick Montague
OpenBMC Design Team Lead
IBM Cognitive Systems User Experience=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20

