Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06229C95F
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 21:02:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLN0g489TzDqMG
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 07:02:43 +1100 (AEDT)
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
 header.s=pp1 header.b=XRa0vM6v; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLMzx6PlgzDqLs
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 07:02:04 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09RK212S007116
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 16:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=fY/xZ8GVk8Yahv/gKpc1oqAUL5EyoDHTMFrH4tb2Wgk=;
 b=XRa0vM6v79JksuLT/d5GP0wTx6Pto+g9+IS0rG6e4cLR9qQAvQ9pt9OYb2uXeSepym9Z
 rz6ylrS0uKKoDYv9uAQtTcuri7Kmo/9/oXnfdD6FbDoOEdG3+k4mSn4KolwfYvP2UdKB
 FqnjoLzaQFYtxVQIXtT1zBhZsCqXTiYqldvl9Vf1wMfe3q7R0/BM/scw5FvZK2nxZCgT
 2vJf4rgtmVQigUW+uB28+nOVY+vEO5tD+EgI0OpaygS235sUUt78Ueg6TzCUApvB9Joi
 DvO6PZ/fLWPNBxb0nvX+ocbiji0N2Tj+ZTNPNfQ1vwRlss9Tuyt54cNKvS+51OCH7789 nA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34esjk15k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 16:02:01 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 27 Oct 2020 20:01:48 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 27 Oct 2020 20:01:47 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020102720014649-733901 ;
 Tue, 27 Oct 2020 20:01:46 +0000 
In-Reply-To: 
Subject: GUI Design Work Group - Wednesday,
 10/28/20 at 10:00 AM Central Daylight Time (CDT)
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 27 Oct 2020 20:01:46 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 47775
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20102720-7279-0000-0000-000003F6358B
X-IBM-SpamModules-Scores: BY=0.033574; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.000416
X-IBM-SpamModules-Versions: BY=3.00014088; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01455348; UDB=6.00782853; IPR=6.01238036; 
 MB=3.00034732; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-27 20:01:48
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-27 13:42:33 - 6.00012005
x-cbparentid: 20102720-7280-0000-0000-00009ABA35D2
Message-Id: <OFBB827439.53103F3D-ON0025860E.006E06B7-0025860E.006E06BC@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-27_10:2020-10-26,
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

At tomorrow's work group we are planning to review:


- Mutual TLS - https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/369=
18
- Do we need to version the GUI?
- Help Wanted stories - https://github.com/openbmc/webui-vue/projects/2
- Design Review items - https://github.com/openbmc/webui-vue/projects/1

If your organization is interested in these topics, please join us!


How to join and agenda can be found on the wiki page:
- https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group


Thank you!
=20
Derick Montague
IBM Cognitive Systems User Experience

