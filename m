Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 409F444EDEB
	for <lists+openbmc@lfdr.de>; Fri, 12 Nov 2021 21:30:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HrVZt0LRTz3bN5
	for <lists+openbmc@lfdr.de>; Sat, 13 Nov 2021 07:30:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SK1hig5U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SK1hig5U; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HrVZL2Lflz2yfr;
 Sat, 13 Nov 2021 07:30:01 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ACKD3RF013752; 
 Fri, 12 Nov 2021 20:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HXFplJHayDK9tdmNj0AR0yX2Zw7ksjGKwNpuy5qtPLg=;
 b=SK1hig5Uo6+sR99lEHxi5XheBsuci4yxgnNXm3S7ANQHv7Sk9j2yf+fVw4kkyyYFVjuN
 W9n6pXXgoYsv9MoD3ZulQvPxr7WAt+Nns6eir5eKTJhGnfDP7M3X8zZXL6SC3q7J7xT9
 wAoc4ALcGv0DJgDIbcdn1b9OilMbKoQvbwrLxQc2pHTXWh4tNnFvOtuWWLjwtXn0QPkV
 koLi5dPGXong/jfRr7OSFb7dxa2A5kAbTCc8VANsjyO+GjmpY0gL0Yeax9sK5f/27lo8
 y6NnECCOX2XXdWzcPuSHYquCG26vJY5VxnsPUTUsXrZLYfGWcftoWjDk2SIL8LkJ+YtT CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c9y43g9a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 20:29:37 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ACKFHxW021575;
 Fri, 12 Nov 2021 20:29:37 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c9y43g99t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 20:29:37 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ACKDLZ0020198;
 Fri, 12 Nov 2021 20:29:36 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3c5hbety0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 20:29:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ACKTYw257475502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Nov 2021 20:29:34 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C540C6063;
 Fri, 12 Nov 2021 20:29:34 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4779C605A;
 Fri, 12 Nov 2021 20:29:33 +0000 (GMT)
Received: from fstone01p1.aus.stglabs.ibm.com (unknown [9.3.116.196])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 12 Nov 2021 20:29:33 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: linux@armlinux.org.uk, joel@jms.id.au, andrew@aj.id.au, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: configs: aspeed: Add support for USB flash drives
Date: Fri, 12 Nov 2021 20:29:31 +0000
Message-Id: <20211112202931.2379145-1-anoo@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Li_P3rDViSUZmdcxYvh6Z2jdYEQjN8qa
X-Proofpoint-GUID: pr-DF1aqYKsbRAaOL80q7zjY_KkdZiyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_05,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111120107
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
Cc: bruce.mitchell@linux.vnet.ibm.com, openbmc@lists.ozlabs.org,
 Adriana Kobylak <anoo@us.ibm.com>, eajames@linux.ibm.com,
 liuxiwei1013@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

Add support to detect USB flash drives and create the /dev/sd* devices.
Also add support for vfat to support USB drives formatted as FAT32.
This support will be used to enable firmware updates via USB flash
drives where the firmware image is stored in the USB drive and it's
plugged into the BMC USB port.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
Tested-by: Adriana Kobylak <anoo@us.ibm.com>
---
 arch/arm/configs/aspeed_g5_defconfig | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index bee9422919aa..1b0d82c64ad4 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -37,11 +37,9 @@ CONFIG_KEXEC=y
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
-CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
-# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_BLK_DEBUG_FS is not set
 # CONFIG_MQ_IOSCHED_DEADLINE is not set
 # CONFIG_MQ_IOSCHED_KYBER is not set
@@ -98,6 +96,7 @@ CONFIG_NET_NCSI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
+CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PARTITIONED_MASTER=y
@@ -111,6 +110,8 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=y
 CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
 CONFIG_NETCONSOLE=y
 # CONFIG_NET_VENDOR_ALACRITECH is not set
@@ -230,6 +231,7 @@ CONFIG_USB_DYNAMIC_MINORS=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_ASPEED_VHUB=y
 CONFIG_USB_CONFIGFS=y
@@ -277,6 +279,7 @@ CONFIG_FSI_OCC=y
 CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
 CONFIG_OVERLAY_FS=y
+CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 # CONFIG_JFFS2_FS_WRITEBUFFER is not set
@@ -292,6 +295,8 @@ CONFIG_PSTORE_PMSG=y
 CONFIG_PSTORE_FTRACE=y
 CONFIG_PSTORE_RAM=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
 CONFIG_HARDENED_USERCOPY=y
 CONFIG_FORTIFY_SOURCE=y
 CONFIG_CRYPTO_HMAC=y
-- 
2.25.1

