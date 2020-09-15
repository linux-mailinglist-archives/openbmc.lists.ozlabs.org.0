Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9562F26AF98
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 23:31:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brbxy16C9zDqT1
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 07:31:02 +1000 (AEST)
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
 header.s=pp1 header.b=lbxkNtAa; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brbwt6lypzDqMn
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 07:30:05 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FL0aqs069857
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 17:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=b/iXi6VuNhv7uHhppudZAfVkbH9TbLK2bWNeO7uzdi4=;
 b=lbxkNtAaD6HryZCE/3Sr0twGVm9RVltJLxjUH5coH394qx+FWl4v94e1GNQ9OSW08b5R
 UD3p+1VPN3MW2YVoHx92giu+3kibxpalFlC5X9Ckpa0XbqUXWypicXGADPAsz4+I6rPc
 7HwFMsLouHZFAS9Z4a+WTIC6nfCJR0a9EcfR+uDzSnA1PZJQIqBtfCgop3qsrIwf9TkV
 OSA7MhjvGHY/OiHxdfiMLHKSdIXWB8A0oq8xoGrMqzrt0X6Xc47VxVIsUDTvKEj+4M8W
 HEH7qsxmOPOjC4IwMR6EDLL9rlH1ARF4aWJzcxmnHDZy0r2tjYDnEzCCxXKOixhi0E/L tg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33k33wuy0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 17:30:02 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 15 Sep 2020 21:30:01 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 15 Sep 2020 21:29:59 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020091521295868-807774 ;
 Tue, 15 Sep 2020 21:29:58 +0000 
In-Reply-To: 
Subject: GUI Design Work Group - Wednesday, 9/16 at 10:00 AM Central
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 15 Sep 2020 21:29:58 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 19243
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20091521-3649-0000-0000-00000404AB41
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.394815; ST=0; TS=0; UL=0; ISC=; MB=0.001205
X-IBM-SpamModules-Versions: BY=3.00013843; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01435366; UDB=6.00770968; IPR=6.01218044; 
 MB=3.00034072; MTD=3.00000008; XFM=3.00000015; UTC=2020-09-15 21:30:00
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-09-15 12:59:39 - 6.00011843
x-cbparentid: 20091521-3650-0000-0000-0000C0D13864
Message-Id: <OF6B026ED3.AE71A8C6-ON002585E4.007619CE-002585E4.007619D3@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_13:2020-09-15,
 2020-09-15 signatures=0
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
Hello,

At tomorrow's workgroup, we are planning to review:

- KVM and SOL layout consistency review
- Discuss parity with and the deprecation of phosphor-webui

If your organization is interested in this topic, please join us!


How to join and agenda can be found on the wiki page:
- https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group


Thank you!
=20
Derick Montague
FED Lead | OpenBMC Design Team Lead
IBM Cognitive Systems User Experience

