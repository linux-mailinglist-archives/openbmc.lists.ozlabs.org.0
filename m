Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DC434AFF5
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 21:14:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Y9F54t7z3c1F
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 07:14:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Byzj1uZl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Byzj1uZl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6Y911D14z2yyW
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 07:14:28 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QK3eKG178670; Fri, 26 Mar 2021 16:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=kj4h2szO5rVrrcCi9LjwYIw2bVW4/T5XzP2bkZMT/F0=;
 b=Byzj1uZlcLmXoBf6iboM5FHPS9bwqylO6j1BUOoHjV9lXDrah06/dwfbkyMjhGFZ6sH3
 ns1CsxpGzDqXYCR2fPKKP6xU7AomyqcToq4J1Z57ifFFE0oJfKKrj8aVW8zbcS1t05Uw
 Pd+Z/WqbrApvcCCND0cKxpg3TVJI7KuOFGtYOXNdluhKZypsxrv4iNRzCz//RZHjTB9J
 ZbjCUuLv81k7+Chw+H3XNpQEJ8PELqqJxWj3PyAblG3BCNLyquC/M3s8gBDEByI8+bPj
 STNuY1mm7NIMy1nvYJvbOMwyLOXnuFgDbKycNHV48e7zQF6Rz6iiGGAqxoSo0FkdwUxi Ow== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37hcd21ywc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 16:14:22 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QKDo5t029041;
 Fri, 26 Mar 2021 20:14:21 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 37hjsfsd3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 20:14:21 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QKELSj30736768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 20:14:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECBE67805E;
 Fri, 26 Mar 2021 20:14:20 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C49F7805C;
 Fri, 26 Mar 2021 20:14:19 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.195.191])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 20:14:19 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/4] u-boot: Support for SPL verified boot
Date: Fri, 26 Mar 2021 17:14:06 -0300
Message-Id: <20210326201410.13906-1-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8nQ-95sP6x_ljn10YOw8nhUwj69SWQPI
X-Proofpoint-ORIG-GUID: 8nQ-95sP6x_ljn10YOw8nhUwj69SWQPI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_11:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260149
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
Cc: andrew@aj.id.au, klaus@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series aims at extending U-Boot's verified boot support to
also include SPL.

Presently, setting UBOOT_SIGN_ENABLE instructs the classes uboot-sign
and kernel-fitimage to create and sign a Linux Kernel fitImage. This
proposal introduces the variables UBOOT_FITIMAGE_ENABLE and
SPL_SIGN_ENABLE that will, respectively, create and sign a U-Boot
(proper) fitImage that the SPL can load (and verify if enabled)

In order to accomplish this, the first patch moves some of necessary
infrastructure (variables, functions) used to sign the Kernel
fitImage to more common locations, and then essentially duplicates the
method currently used to sign the Kernel fitImage to also sign the
U-Boot fitImage.

If the variable UBOOT_FITIMAGE_ENABLE = "1", the uboot-sign class will
copy the SPL files (nodtb image and dtb file) from the u-boot recipe to
the staging area, so that the Kernel recipe can then create the U-Boot
fitImage.

In case SPL_SIGN_ENABLE = "1", the U-Boot fitImage will be signed using
the key provided by SPL_SIGN_KEYNAME / SPL_SIGN_KEYDIR, or will
auto-generate keys based on UBOOT_FIT_HASH_ALG, UBOOT_FIT_SIGN_ALG and
UBOOT_FIT_SIGN_NUMBITS if UBOOT_FIT_GENERATE_KEYS is "1".

After the operations above, the Kernel recipe will deploy the (signed)
U-Boot fitImage, the ITS script used to create it, as well as the SPL
concatenated with the DTB containing the pubkey to the images directory.

The reason why the U-Boot fitImage is created by the Kernel is in order
to make sure that, when UBOOT_SIGN_ENABLE is set (and the Kernel
fitImage is signed), the U-Boot fitImage being created/signed contains
the pubkey used by the Kernel recipe to sign the Kernel fitImage.

I added oe-selftest testcases and also tested this on upstream OpenBMC
with AST2600 BMC devices.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

---
Changes since V1:

 * Separated SPL_SIGN_ENABLE from UBOOT_FITIMAGE_ENABLE so that an
   U-Boot fitImage can be created without a signature

 * Completely moved the task of creating/signing the U-Boot fitImage to
   the Kernel recipe, so that we don't get collisions when reusing the
   build tree while changing the configuration. This is apparently also
   necessary for testcases to be sane.

 * Testcases changes and additions, covering the above scenarios

 meta/classes/kernel-fitimage.bbclass     |  82 ++---
 meta/classes/uboot-config.bbclass        |  58 ++++
 meta/classes/uboot-sign.bbclass          | 407 +++++++++++++++++++++++--
 meta/lib/oeqa/selftest/cases/fitimage.py | 468 +++++++++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc       |  46 ---
 5 files changed, 928 insertions(+), 133 deletions(-)

