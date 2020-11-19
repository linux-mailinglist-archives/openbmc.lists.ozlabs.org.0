Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C662B9918
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 18:15:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcRBX521TzDqml
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 04:15:00 +1100 (AEDT)
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
 header.s=pp1 header.b=m/nEh5V6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcR9g0s2HzDqmh
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 04:14:14 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJH3O2W144198
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 12:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : mime-version : references : content-transfer-encoding :
 content-type : message-id; s=pp1;
 bh=nSQj5aMbORFAoriv1LDa+6pY5NpP3hLKbM5bibhJ0HM=;
 b=m/nEh5V64oNqAYaqV9oj6ANztwG+uZQnBJsrm19EdjBsnNV7+Sk1MeqgVPmwcxFrhw5H
 JwWy54g4jY6BMgqFWA25H/5zwijcGlezSBzhpY0+Sz5VEODAfcL+2b89umpIlItytMkN
 qpDuPSu3tf8NmHMGlVfrrne3KarNDllH4mcUKbc2ehZfABo0ZqFxWCDi06XJn15NZ+uq
 wVgy2TCZGkygbojctpi+zj7fqNnr1x9tmbxHMap6sKYAoR/BP9jx35Ml52IPm/XA8kET
 n8RPo7GmHpUDFsPatlLkh6f7ZGJ4muAc5YINLMea6D2XOWb/23GulwX23ibzPumUG4W5 jw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.114])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg136y73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 12:14:10 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Thu, 19 Nov 2020 17:14:10 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.47.58) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 19 Nov 2020 17:14:09 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020111917140867-622832 ;
 Thu, 19 Nov 2020 17:14:08 +0000 
In-Reply-To: 
Subject: GUI Design Work Group - Wednesday11/25
From: "Derick Montague" <Derick.Montague@ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Thu, 19 Nov 2020 17:14:08 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 15907
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20111917-1639-0000-0000-000003074357
X-IBM-SpamModules-Scores: BY=0.000001; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.000011
X-IBM-SpamModules-Versions: BY=3.00014217; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01466119; UDB=6.00789241; IPR=6.01248757; 
 MB=3.00035120; MTD=3.00000008; XFM=3.00000015; UTC=2020-11-19 17:14:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-11-19 08:37:28 - 6.00012071
x-cbparentid: 20111917-1640-0000-0000-0000C7E14562
Message-Id: <OF8B9C9502.B727E6AE-ON00258625.005EADD1-00258625.005EADD6@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_09:2020-11-19,
 2020-11-19 signatures=0
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

Hello!

Next weeks work group falls the day before a U.S. holiday and there will be
many people off this week from the IBM team, including myself. Is anyone
opposed to cancelling this work group?

If so, please let me know so we can decide on the host and what webex
to use for the meeting.

Thank you!
=20
Derick Montague
IBM Cognitive Systems User Experience

