Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB613C879C
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 17:31:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQ1h30gZgz307Z
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 01:31:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iB+ayEas;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iB+ayEas; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ1gk6qPqz2yMx
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jul 2021 01:31:29 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EF4Tqj032534
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 11:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-type : references :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=TUuUZsUeZD5Lo1RH+q69U5mYOPjwkJsAsvTtcQKk8fQ=;
 b=iB+ayEasY0fI45plkxlIgL3ogK+i56DicsXPQD7LBiS2hHVtzTeQE/99k5gO8lsH/R4X
 rx5dtuzqE26bGneTI8OoiOE5PWY23tetsNjxzPxvHO+lUekZDdMxuplRnVtvRsbgZeaM
 l/7NDOY1gEBa5TMSFAwExjIV0h7jQirmN6DlUK09nFEyE+KKqqrCxr7SIgHuDmJti0y0
 2oosunfy5mxEuAyEF1miCcpz9usfVmLA5YMi8x2W7EpPa0MoDRjcz+Hm17xDMFbF0p91
 M1GanlLJVLyFXp7wqu+Tds2faqLaVx2NWcgUj9FJlhWLcJ69jqEjLL6Z9RKD6Xxq+guH BQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39sdy6hmtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 11:31:26 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EFBamo003089
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 15:31:25 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 39q36cfw20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 15:31:25 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16EFVOBG21692860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 15:31:24 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C4256A069;
 Wed, 14 Jul 2021 15:31:24 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EBA26A067;
 Wed, 14 Jul 2021 15:31:24 +0000 (GMT)
Received: from mww0332.dal12m.mail.ibm.com (unknown [9.208.69.80])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 14 Jul 2021 15:31:24 +0000 (GMT)
In-Reply-To: <20210714130837.3609-1-bentyner@linux.ibm.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Ben Tyner <bentyner@linux.ibm.com>
Date: Wed, 14 Jul 2021 15:31:22 +0000
Message-ID: <OF32AECC21.91513A97-ON00258712.0054F99F-00258712.0055452A@ibm.com>
Content-Type: text/plain; charset=UTF-8
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20210714130837.3609-1-bentyner@linux.ibm.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0332/03/M/IBM at 07/14/2021 15:31:22,
 Serialize complete at 07/14/2021 15:31:22
X-Disclaimed: 22371
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YrBDm2Ds3BQ7FcVLB8UeyP86kJVlhFQS
X-Proofpoint-GUID: YrBDm2Ds3BQ7FcVLB8UeyP86kJVlhFQS
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: Re: [PATCH docs:designs:device-tree-gpio-naming] Add
 vrm-fault-standby pin name
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_07:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140090
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
Cc: openbmc@lists.ozlabs.org, Ben Tyner <Ben.Tyner@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On July 14, 2021, Ben Tyner wrote:
>Pin vrm-fault-standby indicates that the voltage regulator for
>standby
>voltage reported a fault condition.
>
>Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
>---
> designs/device-tree-gpio-naming.md | 1 +
> 1 file changed, 1 insertion(+)

Thanks Ben

Most OpenBMC sub-projects use our gerrit system.  The exception is upstream=
=20
projects where we use whatever upstream uses (eg patches for u-boot and
Linux kernel, pull requests for systemd).

For details please see CONTRIBUTING.md in the docs repository.
 https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-cha=
nges-via-gerrit-server-to-openbmc


milton

