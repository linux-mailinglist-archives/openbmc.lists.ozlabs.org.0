Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0ACAF2AE
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 23:47:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Sdsc6w2rzF1g0
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 07:47:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Sds52FQJzF0c5
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 07:46:31 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8ALahJa023647
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 17:46:28 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uxkpt8gjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 17:46:28 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 10 Sep 2019 21:46:28 -0000
Received: from us1b3-smtp07.a3dr.sjc01.isc4sb.com (10.122.203.198)
 by smtp.notes.na.collabserv.com (10.122.47.48) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 10 Sep 2019 21:46:24 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp07.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019091021462389-893246 ;
 Tue, 10 Sep 2019 21:46:23 +0000 
In-Reply-To: <69859184.bebd.16d1b45f5b3.Coremail.ouyangxuan10@163.com>
Subject: Re:how to use spi flash BIOS/Host firmware??
From: "Milton Miller II" <miltonm@us.ibm.com>
To: www <ouyangxuan10@163.com>
Date: Tue, 10 Sep 2019 21:46:23 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <69859184.bebd.16d1b45f5b3.Coremail.ouyangxuan10@163.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 22807
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19091021-1429-0000-0000-0000003E0049
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.421684; ST=0; TS=0; UL=0; ISC=; MB=0.252251
X-IBM-SpamModules-Versions: BY=3.00011751; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01259557; UDB=6.00665776; IPR=6.01041312; 
 MB=3.00028570; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-10 21:46:26
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-10 16:28:19 - 6.00010391
x-cbparentid: 19091021-1430-0000-0000-0000006B1402
Message-Id: <OF296529E4.5B358202-ON00258471.007740E2-00258471.00779A97@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_12:, , signatures=0
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

On September 10, 2019, Byron <ouyangxuan10@163.com> wrote:

>Dear all,
>
>    I want to ask a question about how to spi driver flash host/bios
>firmware? I don't want use mtd mode flash it, because the mtd mode
>need read spi-id when BMC load spi driver, may be it is risky, it
>need switch the  system spi to BMC when the host running, It may
>break host startup. Do we have other solutions to solve this problem?
>

Indeed, we did have some initial hand-off issues especially as the=20
Linux kernel spi nor layer matured.  Over time the assumptions that=20
the bios had that the chip would be set to 4-byte addressing by=20
default were not met by the kernel driver which switched to using=20
4-byte specific read and write commands.

You probably have a few options:

If you host is read-only, you can allocate a block of dram=20
and point the lpc window to the dram.  The aspeed lpc=20
controller drivers has ioctl calls for this.

If you host is directly connected to the chip and you are=20
using the spi mode mux, then you would need to handshake=20
with your bios.

If your host is using lpc to the aspeed chip and programming=20
the controller directly, you probably have given full overtake=20
of your bmc to the host.

In Openpower systems, we have implemented a protocol to map=20
sections of the SPI rom into memory, and use IPMI messages=20
to page in and out windows from this access window in memory=20
to the backing SPI chip. We also have a method.

If you are not using an aspeed bmc soc, some of these details
may be different in your system.

>thanks,
>Byron=20
>

I hope this can give you some thoughts to pursue.
milton

