Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F62970C0
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 15:37:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHlfS4Vr6zDqB5
	for <lists+openbmc@lfdr.de>; Sat, 24 Oct 2020 00:37:52 +1100 (AEDT)
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
 header.s=pp1 header.b=lOBkgGC2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHlWc1Qn7zDr2w
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 00:31:54 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09NDIsj2062875
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 09:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=UT3JMu7NmRuSu9tR+7IoMJR968p23zWLvJ+dTChxfZ4=;
 b=lOBkgGC2mHQY5AIiehhOo0zuRVYhnqQXWdeqfGpYj4sepzG79Kx8Q1ZivvQopcRAG7oL
 fEA3TRJyp21WNMGfn5mESS16JgUYxh0BOINTZy8buLVlkSAgVGsO06Ys3jAyuRYq0O0/
 Y6l8KVU3SwAtVhcd/kKBeLHqy+AdxRmnEKOJpFzo+Iukf5cgac/vuzuYDkSGvbvolfOo
 y4L9/qMFiWe+Y/jjFXaixJQFls4hhFvgCLj1fhQZXG7zmyj5ld+5V5YOmUt44aQeJKfZ
 EkMJOmWes0AJB/KSY7b8uwMMPnAZK3ggYmgdmA5F6I2eguPktnbDDK9g7zJFVULuGk8V 6Q== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34b73rv23c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 09:31:51 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Fri, 23 Oct 2020 13:31:50 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 23 Oct 2020 13:31:48 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2020102313314791-395479 ;
 Fri, 23 Oct 2020 13:31:47 +0000 
In-Reply-To: 
Subject: webui-vue GUI Documentation live on GitHub pages
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 23 Oct 2020 13:31:47 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 8967
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20102313-8877-0000-0000-000004C42D73
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.394815; ST=0; TS=0; UL=0; ISC=; MB=0.000009
X-IBM-SpamModules-Versions: BY=3.00014062; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01453332; UDB=6.00781656; IPR=6.01236026; 
 MB=3.00034670; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-23 13:31:49
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-23 11:21:28 - 6.00011989
x-cbparentid: 20102313-8878-0000-0000-0000F06B2ED5
Message-Id: <OF7B64577B.2C000508-ON0025860A.004A170E-0025860A.004A527C@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-23_04:2020-10-23,
 2020-10-23 signatures=0
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

We have some exciting news. After discussing at the previous GUI
Design Work Group, and Dixsie Wolmer's OpenBMC Learning video on
GUI development, we agreed that to deploy documentation to the
GitHub pages. Thanks to Jason Bills for suggesting using GitHub
actions, we have accomplished that goal.=20

For anyone interested in learning about the webui-vue client-side
development best practices, how to customize the GUI theme for your
own organization, or just learning a bit more about the libraries used,
please take a look at:

https://openbmc.github.io/webui-vue/

Thank you!
=20
Derick Montague
IBM Cognitive Systems User Experience

