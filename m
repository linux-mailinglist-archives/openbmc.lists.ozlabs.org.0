Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262323E5DD
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 04:33:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BN8YB0wpjzDqwN
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 12:33:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TVz9wfGL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BN8XM0TDCzDqty
 for <openbmc@lists.ozlabs.org>; Fri,  7 Aug 2020 12:32:34 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07723VRG114004
 for <openbmc@lists.ozlabs.org>; Thu, 6 Aug 2020 22:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=qSvirqkq944ox9BJ1y232hlKtI24KDn2UGwmtROhhi4=;
 b=TVz9wfGLNMmir3jVimPRSth/xEB/efVdfzz/Npo3DaCpbAc+JzGDwup53ngcdN+EE7J7
 7Ji824BsQlqtBu1hEMuI4TH/kSHKDIaMi5dsPpQTTYU6JlqaIDuXubfWbFhmvPn6Lbo4
 99s5r7N3MbVCAiMFDZ6xe65NoFSZ/vVu2qV5Iz/tEIXZ3OLnst/T2Q9GTf400bc2n/fH
 AFa75l6qIgl0uslQKEgdhiD/kHn6VVQb5UslZ0mmTj9ttyUW5O9RSr9WE9MuD51uGnEJ
 Uwtqr3332Kg6R5T9crk33h/o5jxznXy+61QqKbhFXW8xsFYlEJeH0HDNhgSVoARSEpkQ zw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ra0s8ypk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Aug 2020 22:32:31 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 7 Aug 2020 02:32:30 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 7 Aug 2020 02:32:27 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020080702322682-1001518 ;
 Fri, 7 Aug 2020 02:32:26 +0000 
In-Reply-To: <F6868B82-B239-44DE-B90A-BD808FEA4C5B@gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Mike Jones <proclivis@gmail.com>
Date: Fri, 7 Aug 2020 02:32:27 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <F6868B82-B239-44DE-B90A-BD808FEA4C5B@gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 53143
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20080702-1335-0000-0000-00000493015F
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.081110
X-IBM-SpamModules-Versions: BY=3.00013602; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01416684; UDB=6.00759703; IPR=6.01199107; 
 MB=3.00033399; MTD=3.00000008; XFM=3.00000015; UTC=2020-08-07 02:32:28
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-08-06 19:17:43 - 6.00011693
x-cbparentid: 20080702-1336-0000-0000-0000D5850148
Message-Id: <OF66E559B6.C704B66F-ON002585BD.000DF51B-002585BD.000DF524@notes.na.collabserv.com>
Subject: Re:  Power Supplies are Turned off after boot
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_01:2020-08-06,
 2020-08-07 signatures=0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On August 5, 2020 Mike Jones wrote:

>Now that I have webui displaying telemetry for multiple PMBus
>devices, I want to solve a power supply problem.
>
>After boot, all PMBus devices have their power turned off via an
>OPERATION command. This happens about 10-20 seconds after boot
>completes. There is a message printed saying it is disabling them,
>and one line per action. Like:
>
>VOUT 1: disabling
>
>Where VOUT 1 does not match the name of the rails in the config files
>with the name and limits. It seems like a more generic term
>indicating voltage.
>
>These devices are in the device tree and have hwmon running.
>
>What service would be capable of shutting off the supplies? It would
>have to be able to discover them, perhaps by device tree, then issue
>standard PMBus commands.

I'm guessing the host watchdog was not shutdown when your HOST=20
completed boot and the watchdog requesed the system power off.
Normally an IPMI message from the host will disable the watchdog.

You should be able to see the transition files run in the systemd=20
journal if this is the case.

if not try watching for activity by using journalctl to follow=20
events live in a shell.

>>Note: the Phosphor System Manager service fails at start up. I don=E2=80=
=99t
>know if this matters, I was going to figure out what it does later.
>
>Mike
>

