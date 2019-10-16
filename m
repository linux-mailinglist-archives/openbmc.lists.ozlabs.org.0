Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28210DA215
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 01:24:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tpJx18kYzDqC0
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 10:24:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tpJG1551zDr6P
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 10:23:25 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9GNCEXg009541
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 19:23:22 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vp9r7dbd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 19:23:22 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 16 Oct 2019 23:23:21 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 16 Oct 2019 23:23:15 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2019101623231565-1105948 ;
 Wed, 16 Oct 2019 23:23:15 +0000 
In-Reply-To: <20191016230610.29462-1-andrew@aj.id.au>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Date: Wed, 16 Oct 2019 23:23:14 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20191016230610.29462-1-andrew@aj.id.au>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP59 September 23, 2019 at 18:08
X-LLNOutbound: False
X-Disclaimed: 55355
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19101623-3649-0000-0000-000000F7CD17
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.425523; ST=0; TS=0; UL=0; ISC=; MB=0.007258
X-IBM-SpamModules-Versions: BY=3.00011955; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01276454; UDB=6.00676107; IPR=6.01058581; 
 MB=3.00029128; MTD=3.00000008; XFM=3.00000015; UTC=2019-10-16 23:23:19
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-10-16 21:10:52 - 6.00010534
x-cbparentid: 19101623-3650-0000-0000-0000017D0DEF
Message-Id: <OF89958F58.DD5DED38-ON00258495.00807651-00258495.0080789F@notes.na.collabserv.com>
Subject: Re: [PATCH linux dev-5.3] soc: aspeed: Fail probe of lpc-ctrl if
 reserved memory is not aligned
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-16_08:, , signatures=0
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

On 10/16/2019 about 06:06PM in some timezone, Andrew Jeffery wrote:

>Alignment is a hardware constraint of the LPC2AHB bridge, and>misaligned
>reserved memory will present as corrupted data.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/soc/aspeed/aspeed-lpc-ctrl.c | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>
>diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
>b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
>index 12e4421dee37..5bad6a33ca43 100644
>--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
>+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
>@@ -241,6 +241,18 @@ static int aspeed=5Flpc=5Fctrl=5Fprobe(struct
>platform=5Fdevice *pdev)
>=20
> 		lpc=5Fctrl->mem=5Fsize =3D resource=5Fsize(&resm);
> 		lpc=5Fctrl->mem=5Fbase =3D resm.start;
>+
>+		if (hweight32(lpc=5Fctrl->mem=5Fsize) !=3D 1) {

is=5Fpower=5Fof=5F2 from include/linux/log2.h

>+			dev=5Ferr(dev, "Reserved memory size must be a power of 2, got>%zu\n",
>+			       lpc=5Fctrl->mem=5Fsize);
>+			return -EINVAL;
>+		}
>+
>+		if (lpc=5Fctrl->mem=5Fbase & (lpc=5Fctrl->mem=5Fsize - 1)) {

This could be IS=5FALIGNED() from kernel.h

>+			dev=5Ferr(dev, "Reserved memory must be naturally aligned for size>%zu=
\n",
>+			       lpc=5Fctrl->mem=5Fsize);
>+			return -EINVAL;
>+		}
> 	}

Regards,
milton

