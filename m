Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ADF33E17F
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 23:38:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0Sqs6kdRz30JK
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 09:38:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=flEKuPDM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=flEKuPDM; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Sqd1dQrz2yxC
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 09:38:19 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GMXtis111066
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 18:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : mime-version : references : content-transfer-encoding :
 content-type : message-id; s=pp1;
 bh=jY5LGyg39dCRVSJu8VDoEaMYvIucAqxmHcwdBTERaLM=;
 b=flEKuPDMeO6HyeHbgfq7Da3s/tPWf0sTZ0c/bHTF5zItt0AJM5YaFPntrR73o580RK4s
 8r9Q94yyRxKNq4zMOyPVSuGkSnqMbiWo3ayvI2Zbo7c5kpx5AeBaZbf6u6NDVVmdGVZM
 uD2HbEH0nHy+SaoYt81euQixlRLWB4q7vTRsgu2sJ5jIQ3pzixd0AiCybM8v360DXX5h
 GmP5sQsm3WLyBmyueUZDdzYtO5CsET1BFN5Ull42ZalUTI72WNFk7+J+ghrRolHJtr+0
 P36Xmg2LmJfSQdq3rZCz3xlKYAucND59+RPr/l0Gs4RfzxSBfhqDTGIXLiYGFkGafgms gQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37b0krrb0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 18:38:16 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 16 Mar 2021 22:38:15 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 16 Mar 2021 22:38:14 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2021031622381396-822981 ;
 Tue, 16 Mar 2021 22:38:13 +0000 
In-Reply-To: <OF23D4B149.F0AC8E03-ON00258670.007599F8-00258670.007654E7@LocalDomain>
Subject: GUI Design Work Group - Wednesday, 3/17/21 at 10:00 AM Central
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 16 Mar 2021 22:38:13 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <OF23D4B149.F0AC8E03-ON00258670.007599F8-00258670.007654E7@LocalDomain>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 40215
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 21031622-3165-0000-0000-000005A5BDF5
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.224004
X-IBM-SpamModules-Versions: BY=3.00014881; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01521490; UDB=6.00822281; IPR=6.01304004; 
 MB=3.00036388; MTD=3.00000008; XFM=3.00000015; UTC=2021-03-16 22:38:15
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-12 19:08:28 - 6.00012368
x-cbparentid: 21031622-3166-0000-0000-0000CDACC0E6
Message-Id: <OF68399B97.6EDDCC89-ON0025869A.007C36D9-0025869A.007C5980@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_08:2021-03-16,
 2021-03-16 signatures=0
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

- Firmware: Switch to backup - https://gerrit.openbmc-project.xyz/c/openbmc=
/webui-vue/+/41022
- Moving TPM out of Power server operations and into Security panel - https=
://lists.ozlabs.org/pipermail/openbmc/2021-February/024937.html
- WIP Round table discussion


If you have a topic, please feel free to add it to the agenda, reply to thi=
s email, or mention me in the discord channel (https://discord.gg/wWU5rTcb).
=20
Meeting info: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group=
#meeting-info


Thank you!
=20
Derick Montague
IBM Cognitive Systems User Experience

