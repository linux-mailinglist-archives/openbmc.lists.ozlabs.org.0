Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E4C1B001C
	for <lists+openbmc@lfdr.de>; Mon, 20 Apr 2020 05:08:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495BVV5jGQzDqn1
	for <lists+openbmc@lfdr.de>; Mon, 20 Apr 2020 13:08:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495BQ96n5lzDqfp
 for <openbmc@lists.ozlabs.org>; Mon, 20 Apr 2020 13:05:05 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K31sGb113821
 for <openbmc@lists.ozlabs.org>; Sun, 19 Apr 2020 23:05:03 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmu6f6em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 19 Apr 2020 23:05:03 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 20 Apr 2020 03:05:02 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 20 Apr 2020 03:05:00 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2020042003045947-613882 ;
 Mon, 20 Apr 2020 03:04:59 +0000 
In-Reply-To: <2b2bed16.185b.1719064112f.Coremail.slm_8269@163.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: shi <slm_8269@163.com>
Date: Mon, 20 Apr 2020 03:04:59 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <2b2bed16.185b.1719064112f.Coremail.slm_8269@163.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP64 March 05, 2020 at 12:58
X-LLNOutbound: False
X-Disclaimed: 8459
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20042003-8877-0000-0000-00000349742B
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.431006; ST=0; TS=0; UL=0; ISC=; MB=0.001606
X-IBM-SpamModules-Versions: BY=3.00012936; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01364976; UDB=6.00728920; IPR=6.01147336; 
 MB=3.00031778; MTD=3.00000008; XFM=3.00000015; UTC=2020-04-20 03:05:02
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-04-20 00:24:34 - 6.00011263
x-cbparentid: 20042003-8878-0000-0000-0000A10B7B10
Message-Id: <OF3868DF77.01074283-ON00258550.0010EFAE-00258550.0010EFB7@notes.na.collabserv.com>
Subject: =?UTF-8?Q?Re:__how_run_=EF=BC=88export_TEMPLATECONF=3Dmeta-ibm/meta-romul?=
 =?UTF-8?Q?us/conf_=EF=BC=89_on_evb2500_board_?=
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-19_06:2020-04-17,
 2020-04-19 signatures=0
X-Proofpoint-Spam-Reason: safe
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On April 19, 2020 around 07:15PM in some timezone, shi wrote:

>Subject: [EXTERNAL] how run =EF=BC=88export
>TEMPLATECONF=3Dmeta-ibm/meta-romulus/conf =EF=BC=89 on evb2500 board=20
>
>

>I am now focus on the BMC=EF=BC=8E
>Build based on the openbmc https://github.com/openbmc/openbmc, then
>want to run on evb2500 board of aspeed, when download the fitimage by
>tftpserver then bootm, always stuck on the starting kernel. The
>hardware also 2500 type. Why not startup. How I changed the code can
>boot up?   Is there any clue on this?=20
>

Consder trying the evaluation board config, as ranier will have ncsi=20
configured for the network and could easily have different configs=20
such as GPIO assignments.

The ast2500 evb config is in the tree below:

https://github.com/openbmc/openbmc/tree/master/meta-evb/meta-evb-aspeed/met=
a-evb-ast2500

>
>Thanks
>Steven

milton

