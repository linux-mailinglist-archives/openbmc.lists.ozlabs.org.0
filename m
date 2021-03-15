Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E807533C2C9
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 17:58:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzjL96hh0z3032
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 03:58:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SxwYzXXR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SxwYzXXR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzjKy3Zgvz2yRJ
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 03:58:29 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGYWp7155645; Mon, 15 Mar 2021 12:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=COEaM+7FNd6JNpNGm8NMxCIxPQnYhcUZTbVytDgoXRE=;
 b=SxwYzXXREFjl8BplH0KKC2Nk5IpxGpD1pmYGd3O1Hw/K8Yc1ot7qgLFFrj4dBBOE48pb
 zxkPtfSNCzMvntI8MD416L2Ng86Vw34W7zMn292YWzu2n6Nbc7xM/mjgS+wkuoWJFPbe
 2NYDKK7OyTWIgR610yw71BLeqL6gEf2tYyR2f8/pvuPQCY1rbOYrbNvGnrwPYb5TcwH3
 FKCmHMFEKNM5LLBfYm2YevfhBlOZXpQiahJuxbCko4sFDM91xRdPMtm0KeNveqVZLUsm
 +HaFSvAh3XIpxYrNGJLBFAerGVbfNrz8XkfrZUz3FttR+zABGRGwQhJCJvLbCQAADiXj dg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aa8rb16m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:58:21 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FGkp85021167;
 Mon, 15 Mar 2021 16:58:20 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 378n1a0r7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:58:20 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGwJPD25886998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:58:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A1B4AC05E;
 Mon, 15 Mar 2021 16:58:19 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C9A7AC059;
 Mon, 15 Mar 2021 16:58:18 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.168.62])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:58:18 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] u-boot: Support for SPL verified boot 
Date: Mon, 15 Mar 2021 13:58:02 -0300
Message-Id: <20210315165806.1633-1-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150113
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
Cc: andrew@aj.id.au, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series aims at extending U-Boot's verified boot support to
also include SPL.

Presently, setting UBOOT_SIGN_ENABLE instructs the classes uboot-sign
and kernel-fitimage to create and sign a Linux Kernel fitImage. This
proposal introduces the variable SPL_SIGN_ENABLE that aims at (re-)
creating the U-Boot (proper) uImage fitImage and signing it.

In order to accomplish this, the first patch moves some of necessary
infrastructure (variables, functions) used to sign the Kernel
fitImage to more common locations, and then essentially duplicates the
method currently used to sign the Kernel fitImage to also sign the
U-Boot fitImage.

In the UBOOT_SIGN_ENABLE = "1" scenario, nothing really changes: The
Kernel fitImage is created, then signed, and the pubkey is added to
u-boot.dtb which is concatenated with the u-boot-nodtb.bin to create
the u-boot final image.

In case SPL_SIGN_ENABLE = "1", The U-Boot PN will take care of (re-)
creating the U-Boot fitImage (using custom .its script) after compile,
sign it, and contatenate the u-boot-spl.dtb (with the public key) with
u-boot-spl-nodtb.bin to create the final U-Boot SPl on deploy.

In case both UBOOT_SIGN_ENABLE and SPL_SIGN_ENABLE are set, the Kernel
PN will take care of creating and signing the U-Boot fitImage (becase
we need to also sign the FDT image containing the Kernel pubkey), and
take care of deploying it.

One caveat is that when moving between the scenarios above, the user
might need to remove the tmp/ directory, since there could be a
collision for some of the files deployed into the images directory,
since the configuration may determine which PN does that.

I added oe-selftest testcases and also tested this on upstream OpenBMC
with AST2600 BMC devices.


 meta/classes/kernel-fitimage.bbclass     |  69 +++-------------
 meta/classes/uboot-config.bbclass        |  58 +++++++++++++
 meta/classes/uboot-sign.bbclass          | 395
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 meta/lib/oeqa/selftest/cases/fitimage.py | 293
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc       |  46 -----------
 5 files changed, 736 insertions(+), 125 deletions(-)


Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>


