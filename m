Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548630D1CF
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 03:53:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmT82hDqzDwlV
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 13:53:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VPqwZSgl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVdMY292YzDqpM
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 08:32:56 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112LWqY9077671
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2021 16:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ICcqAfhmm0NMID1c5SHIeu1HWfuzssflezOGxzNbXOI=;
 b=VPqwZSglTNOfsYNVa6ccwADlPLJZq78yeApd9wY/XD/th1Q+0XSfeUiDJle2FuNcFZ0u
 xFewY0JDXja+kfUYwgVuRX0SGw/3+QtUFMhhiIt0kvXeTtyUnfeYQKsZdY4nl/FS3TIJ
 vy7Ygh3LSo0tbShFAMciJBL/6z/BPO2gHWCtGBcUqdbbhSLttad0Y7R/bszoKBWmd4/c
 kRocSI8tHfwzSxlpIGCE6AZ9NQ/5FgPIB8n2DwUZYjfOkeFqpmEb0kHfwsuaeYUDB1ax
 rT0X7mAYnFD9E96lNuhzw3p/q4oKnqCPNMIVKcORMwleaN3qNVaHvWaGD3fJwfCDLNdA vw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.110])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36fdv0hkry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2021 16:32:52 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 2 Feb 2021 21:32:32 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.50) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 2 Feb 2021 21:32:30 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021020221323026-707877 ;
 Tue, 2 Feb 2021 21:32:30 +0000 
In-Reply-To: 
Subject: GUI Design Work Group - Wednesday, 2/3/21 at 10:00 AM Central
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 2 Feb 2021 21:32:29 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 43827
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 21020221-1059-0000-0000-0000036A6933
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.431006; ST=0; TS=0; UL=0; ISC=; MB=0.000050
X-IBM-SpamModules-Versions: BY=3.00014668; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01502102; UDB=6.00810685; IPR=6.01284638; 
 MB=3.00036016; MTD=3.00000008; XFM=3.00000015; UTC=2021-02-02 21:32:31
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-02-02 18:06:53 - 6.00012270
x-cbparentid: 21020221-1060-0000-0000-000089B06C16
Message-Id: <OF23D4B149.F0AC8E03-ON00258670.007599F8-00258670.007654E7@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_12:2021-02-02,
 2021-02-02 signatures=0
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

- Review WIP
- Review Help Wanted project stories (nothing has changed since last group)
- Review Design Review project stories


If you have a topic, please feel free to add it to the agenda, reply to thi=
s email, or mention me in the discord channel (https://discord.gg/wWU5rTcb).
=20
Meeting info: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group=
#meeting-info


Thank you!
=20
Derick Montague
IBM Cognitive Systems User Experience

