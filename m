Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 398A129B783
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 16:38:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLG7W5mJjzDqPj
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 02:38:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MZ1aIfOh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLG612s6wzDqNN
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 02:36:56 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09RFY9ai150300
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 11:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CGXCtCMBxjNQD6dJAOIYHgJnxNh7XOoXh5sG4u332Hc=;
 b=MZ1aIfOh+yeaoo383V0EfgsX4r1DYwJxy+1JM4e4n6i2b4EUexzZ1rQFWABXnvcI1Qhc
 QS8rBHujMfBsw0z9x//3P9Irj7GDVrsXchRqh7FLnxv2JgzkVzgLJtJspUFDWLFj9anc
 l3RCxb/HjfSXQB5cpewf5IDxX1Y1vLqPpMUKufRi8vhJM2cBWmsBTPmsxfQjBHJlz3BX
 GWPqxOALYyz4+GZVrINXDnTQFTD0/QpfCZrnBXEK8J7QgNRz1Thcq/CmubUBs3Y28I2t
 XNSfEgKPXMBmMRtKqmiK+6i8iWQKDda0vbw/6lEKiRj9FyAIkHrd/C6K1ZOW6sCiQSgy 1Q== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34ejc1rq63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 11:36:51 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 27 Oct 2020 15:36:51 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 27 Oct 2020 15:36:48 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2020102715364822-499422 ;
 Tue, 27 Oct 2020 15:36:48 +0000 
In-Reply-To: 
Subject: GUI - Mutual TLS - Help Wanted for Testing
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 27 Oct 2020 15:36:48 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 22951
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20102715-4409-0000-0000-000003F46216
X-IBM-SpamModules-Scores: BY=0.231933; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.431006; ST=0; TS=0; UL=0; ISC=; MB=0.036081
X-IBM-SpamModules-Versions: BY=3.00014087; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01455260; UDB=6.00782800; IPR=6.01237948; 
 MB=3.00034730; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-27 15:36:49
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-27 13:47:47 - 6.00012005
x-cbparentid: 20102715-4410-0000-0000-000097AF64AD
Message-Id: <OF9460841F.0EADB17B-ON0025860E.005502B4-0025860E.0055C454@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-27_08:2020-10-26,
 2020-10-27 signatures=0
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

We have recently merged a Gerrit review that added support for Mutual TLS
in the same manner that the phosphor-webui implemented it. IBM is not using
mTLS and I didn't do a good job reaching out to the community for support.

Ed Tanuous brought it to the IBM design team's attention that mTLS was a
missing feature in webui-vue, so a Help Wanted story was added. The feature
was implemented and was in a Gerrit review for roughly 4 weeks before it was
merged. However, we were not able to test the feature.

We are looking for help for someone in the community that uses mTLS to test=
 on
their systems. If for some reason the feature is not working as expected, we
will open a bug and make every effort to resolve the issue.

Gerrit review: https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/369=
18
GitHub story: https://github.com/openbmc/webui-vue/issues/30=20

Thank you!
=20
Derick Montague
IBM Cognitive Systems User Experience

