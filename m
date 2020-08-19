Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0B24A0D1
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 15:57:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWq9Z3MQszDqwY
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 23:57:54 +1000 (AEST)
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
 header.s=pp1 header.b=TK80UZiS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWq6m2qywzDqpR
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 23:55:27 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JDVmAL066136
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 09:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5z+09tN2PpAwqrNaGe7f14+JR9psAqZpN7iHJIDGIi8=;
 b=TK80UZiSuiVGFx63WlmGrcwoxV0h+XyzjwQV6E0OpRrqTWmbqFmzNJmD8w130q/Icpad
 oHE77g5JZSzd5qK91/5mGkk8fMf2oxI5WOkM8hPNCZXv5Gw8NYRe6Ha4YoG9HnlFAk1k
 pRwDOCZD9OXPP34YuTNLgf5rCxPBNrGDJwRsSqHS624E9/cZfKIeZt+XhPNbppFa/nVq
 J3SWPfq9Yy1zkr1TTrgSNxVhhyCYyRnWsj16At2/8CmZQKSpoa+JQBfcXUdNypSPHF3v
 omERheg7jrCV4/u5u8vA6PIsReRC0eHXsdQ7lIqAl2L4AWiSRbarhCSBjvTmyPYBxgkH Ig== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.114])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3314mw1tte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 09:55:24 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 19 Aug 2020 13:55:24 -0000
Received: from us1b3-smtp07.a3dr.sjc01.isc4sb.com (10.122.203.198)
 by smtp.notes.na.collabserv.com (10.122.47.58) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 19 Aug 2020 13:55:23 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp07.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020081913552267-414826 ;
 Wed, 19 Aug 2020 13:55:22 +0000 
In-Reply-To: 
Subject: OpenBMC GUI Design Workgroup - Today 10:00 AM Central Time
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 19 Aug 2020 13:55:22 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 62279
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20081913-1639-0000-0000-0000027F1F9F
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.001358
X-IBM-SpamModules-Versions: BY=3.00013678; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01422356; UDB=6.00763236; IPR=6.01205041; 
 MB=3.00033601; MTD=3.00000008; XFM=3.00000015; UTC=2020-08-19 13:55:23
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-08-19 10:35:08 - 6.00011742
x-cbparentid: 20081913-1640-0000-0000-00006DB8219D
Message-Id: <OF638D78EB.A08769F2-ON002585C9.004C1612-002585C9.004C7B07@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-19,
 2020-08-19 signatures=0
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

=20
Hello,=20=20
=20=20=20
I apologize for the late notice. Here is the agenda for today's GUI Design =
Work Group.=20=20
=20=20=20
- Changes to BMC Web Login and continued work on phosphor-webui
- Use utility classes
- Discuss Server LED layout -https://github.com/openbmc/webui-vue/issues/18=
=20=09
- Discuss button styles on Local user management page - https://github.com/=
openbmc/webui-vue/issues/12 	Help wanted items
- Design Review items
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
FED Lead | OpenBMC Design Team Lead
IBM Cognitive Systems User Experience=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20

