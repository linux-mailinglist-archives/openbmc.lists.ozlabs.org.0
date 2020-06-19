Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A3C201A16
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 20:13:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pRl6491LzDrTK
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 04:13:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pRft1zBbzDrTK
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 04:10:06 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JI3GM9092766
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 14:10:04 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31s0paat57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 14:10:03 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 19 Jun 2020 18:10:03 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 19 Jun 2020 18:09:55 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020061918095479-734599 ;
 Fri, 19 Jun 2020 18:09:54 +0000 
In-Reply-To: <20200619165154.GA20461@cnn>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Date: Fri, 19 Jun 2020 18:09:55 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20200619165154.GA20461@cnn>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 37575
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20061918-4409-0000-0000-00000305A032
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.424974; ST=0; TS=0; UL=0; ISC=; MB=0.000960
X-IBM-SpamModules-Versions: BY=3.00013312; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01393884; UDB=6.00746056; IPR=6.01176167; 
 MB=3.00032629; MTD=3.00000008; XFM=3.00000015; UTC=2020-06-19 18:10:01
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-06-19 16:54:29 - 6.00011502
x-cbparentid: 20061918-4410-0000-0000-00006256AC0D
Message-Id: <OFB20C104E.283BBF6D-ON0025858C.0062CC5B-0025858C.0063C8F2@notes.na.collabserv.com>
Subject: Re:  [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_20:2020-06-19,
 2020-06-19 signatures=0
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 manikandan.e@hcl.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, patrickw3@fb.com, saipsdasari@fb.com,
 vijaykhemka@fb.com, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On : 06/19/2020 abiout 12:46PM in some timezone,  Manikandan Elumalai  wrot=
e:

>The adm1278 temp attribute need it for openbmc platform .
>This feature not enabled by default, so PMON=5FCONFIG needs to enable
>it.
>
>Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
>---
>---    v4 -Reported-by: kernel test robot <lkp@intel.com>

Thie above tag should be Adjacent to the Signed-off-by.

>---    v3 -fix invalid signed-off.
>---       -removed checkpath warnings.
>---       -write ADM1278=5FTEMP1=5FEN and ADM1278=5FVOUT=5FEN conf in sing=
le
>line operation.
>---    v2 -add Signed-off-by.
>---       -removed ADM1278=5FTEMP1=5FEN check.
>---

The canonical format is to have a line of 3 dashes then the trailing change=
log=20

Please read the documentation at=20

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#usin=
g-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-=
canonical-patch-format

milton

