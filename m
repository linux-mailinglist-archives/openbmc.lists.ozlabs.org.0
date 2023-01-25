Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6C867B8A9
	for <lists+openbmc@lfdr.de>; Wed, 25 Jan 2023 18:33:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P29tY5TF5z2xHK
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 04:33:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dxc36qZJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dxc36qZJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P29pj2CGwz3cLb
	for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2023 04:30:37 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PHEF7B012866;
	Wed, 25 Jan 2023 17:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/WCqZIeIyRgrxE/upxBUXhC3VdWtV1ULXE3EMqZ14xw=;
 b=Dxc36qZJf/TYxE+CbYX1WIHmhrzUIw3onIfMd4bfOfi/76OYnJRg4L8YdY86TelFTwJP
 q1zHSMvpoB4iTluuksvQQhggzO00YqrIKg244wkwzGchhzyU1/T4QLbvfNtSoqR9XzRa
 0qi1nbT4NkUIjvsxi9YAWWGZsNXPWmP6m/kojZ1XrpZfriYlwuZ1l13cnGqMAIERYCAU
 zc+Z+APlUyhDr/MdGnhzYnUdPFMPu8J631JbK6I2URHDWZKV5VGWE7WjOxkjD/QhNQ1P
 viV3m7PBkAt4fXZgDy+XncW4IvDfbjUFSm9+WqzKk/emBJlJn57pBRRZNilixxkwgldU vQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nb8n98ees-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 17:30:31 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30PGwp5n006949;
	Wed, 25 Jan 2023 17:30:31 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3n87p7f9ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 17:30:30 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30PHUTnq47448418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 17:30:29 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 840F958058;
	Wed, 25 Jan 2023 17:30:29 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2F2B5805D;
	Wed, 25 Jan 2023 17:30:28 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.77.150.21])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jan 2023 17:30:28 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 3/4] bootm: Support boot measurement
Date: Wed, 25 Jan 2023 11:30:24 -0600
Message-Id: <20230125173025.3725606-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230125173025.3725606-1-eajames@linux.ibm.com>
References: <20230125173025.3725606-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 938YeIW76bpDUXz0DqZZ5qoMgc_AxcDz
X-Proofpoint-ORIG-GUID: 938YeIW76bpDUXz0DqZZ5qoMgc_AxcDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_11,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=935 malwarescore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250152
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a configuration option to measure the boot through the bootm
function. Add the measurement state to the booti and bootz paths
as well.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 cmd/booti.c     |  1 +
 cmd/bootm.c     |  1 +
 cmd/bootz.c     |  1 +
 common/Kconfig  | 23 ++++++++++++++++++
 common/bootm.c  | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/bootm.h |  2 ++
 include/image.h |  1 +
 7 files changed, 93 insertions(+)

diff --git a/cmd/booti.c b/cmd/booti.c
index 04353b68ec..a7ea670d1e 100644
--- a/cmd/booti.c
+++ b/cmd/booti.c
@@ -82,6 +82,7 @@ int do_booti(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 #ifdef CONFIG_SYS_BOOT_RAMDISK_HIGH
 			      BOOTM_STATE_RAMDISK |
 #endif
+			      BOOTM_STATE_MEASURE |
 			      BOOTM_STATE_OS_PREP | BOOTM_STATE_OS_FAKE_GO |
 			      BOOTM_STATE_OS_GO,
 			      &images, 1);
diff --git a/cmd/bootm.c b/cmd/bootm.c
index c3a063474a..313d895ead 100644
--- a/cmd/bootm.c
+++ b/cmd/bootm.c
@@ -128,6 +128,7 @@ int do_bootm(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 #ifdef CONFIG_SYS_BOOT_RAMDISK_HIGH
 		BOOTM_STATE_RAMDISK |
 #endif
+		BOOTM_STATE_MEASURE |
 #if defined(CONFIG_PPC) || defined(CONFIG_MIPS)
 		BOOTM_STATE_OS_CMDLINE |
 #endif
diff --git a/cmd/bootz.c b/cmd/bootz.c
index 0e75509ee9..e8622aa4e7 100644
--- a/cmd/bootz.c
+++ b/cmd/bootz.c
@@ -78,6 +78,7 @@ int do_bootz(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 #ifdef CONFIG_SYS_BOOT_RAMDISK_HIGH
 			      BOOTM_STATE_RAMDISK |
 #endif
+			      BOOTM_STATE_MEASURE |
 			      BOOTM_STATE_OS_PREP | BOOTM_STATE_OS_FAKE_GO |
 			      BOOTM_STATE_OS_GO,
 			      &images, 1);
diff --git a/common/Kconfig b/common/Kconfig
index 1a1951f874..6483add286 100644
--- a/common/Kconfig
+++ b/common/Kconfig
@@ -794,6 +794,29 @@ config TPL_HASH
 
 endmenu
 
+config MEASURED_BOOT
+	bool "Measure boot images and configuration to TPM and event log"
+	depends on HASH && TPM_V2
+	help
+	  This option enables measurement of the boot process. Measurement
+	  involves creating cryptographic hashes of the binary images that
+	  are booting and storing them in the TPM. In addition, a log of
+	  these hashes is stored in memory for the OS to verify the booted
+	  images and configuration. Enable this if the OS has configured
+	  some memory area for the event log and you intend to use some
+	  attestation tools on your system.
+
+if MEASURED_BOOT
+	config MEASURE_DEVICETREE
+	bool "Measure the devicetree image"
+	default y if MEASURED_BOOT
+	help
+	  On some platforms, the devicetree is not static as it may contain
+	  random MAC addresses or other such data that changes each boot.
+	  Therefore, it should not be measured into the TPM. In that case,
+	  disable the measurement here.
+endif # MEASURED_BOOT
+
 menu "Update support"
 
 config UPDATE_TFTP
diff --git a/common/bootm.c b/common/bootm.c
index 3adbceaa38..5ef7b3064f 100644
--- a/common/bootm.c
+++ b/common/bootm.c
@@ -18,6 +18,7 @@
 #include <lzma/LzmaTypes.h>
 #include <lzma/LzmaDec.h>
 #include <lzma/LzmaTools.h>
+#include <tpm-v2.h>
 #if defined(CONFIG_CMD_USB)
 #include <usb.h>
 #endif
@@ -599,6 +600,66 @@ static void fixup_silent_linux(void)
 }
 #endif /* CONFIG_SILENT_CONSOLE */
 
+int bootm_measure(struct bootm_headers *images)
+{
+	int ret = 0;
+
+	if (IS_ENABLED(CONFIG_MEASURED_BOOT)) {
+		struct tcg2_event_log elog;
+		struct udevice *dev;
+		void *initrd_buf;
+		void *image_buf;
+		const char *s;
+		u32 rd_len;
+
+		ret = tcg2_measurement_init(&dev, &elog);
+		if (ret)
+			return ret;
+
+		image_buf = map_sysmem(images->os.image_start,
+				       images->os.image_len);
+		ret = tcg2_measure_data(dev, &elog, 8, images->os.image_len,
+					image_buf, EV_COMPACT_HASH,
+					strlen("linux") + 1, (u8 *)"linux");
+		if (ret)
+			goto unmap_image;
+
+		rd_len = images->rd_end - images->rd_start;
+		initrd_buf = map_sysmem(images->rd_start, rd_len);
+		ret = tcg2_measure_data(dev, &elog, 8, rd_len, initrd_buf,
+					EV_COMPACT_HASH, strlen("initrd") + 1,
+					(u8 *)"initrd");
+		if (ret)
+			goto unmap_initrd;
+
+		if (IS_ENABLED(CONFIG_MEASURE_DEVICETREE)) {
+			ret = tcg2_measure_data(dev, &elog, 9, images->ft_len,
+						(u8 *)images->ft_addr,
+						EV_TABLE_OF_DEVICES,
+						strlen("dts") + 1,
+						(u8 *)"dts");
+			if (ret)
+				goto unmap_initrd;
+		}
+
+		s = env_get("bootargs");
+		if (!s)
+			s = "";
+		ret = tcg2_measure_data(dev, &elog, 1, strlen(s) + 1, (u8 *)s,
+					EV_PLATFORM_CONFIG_FLAGS,
+					strlen(s) + 1, (u8 *)s);
+
+unmap_initrd:
+		unmap_sysmem(initrd_buf);
+
+unmap_image:
+		unmap_sysmem(image_buf);
+		tcg2_measurement_term(dev, &elog, ret != 0);
+	}
+
+	return ret;
+}
+
 /**
  * Execute selected states of the bootm command.
  *
@@ -646,6 +707,9 @@ int do_bootm_states(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[],
 	if (!ret && (states & BOOTM_STATE_FINDOTHER))
 		ret = bootm_find_other(cmdtp, flag, argc, argv);
 
+	if (IS_ENABLED(CONFIG_MEASURED_BOOT) && !ret && (states & BOOTM_STATE_MEASURE))
+		bootm_measure(images);
+
 	/* Load the OS */
 	if (!ret && (states & BOOTM_STATE_LOADOS)) {
 		iflag = bootm_disable_interrupts();
diff --git a/include/bootm.h b/include/bootm.h
index e2cc6d4b99..fe70c1e824 100644
--- a/include/bootm.h
+++ b/include/bootm.h
@@ -52,6 +52,8 @@ ulong bootm_disable_interrupts(void);
 /* This is a special function used by booti/bootz */
 int bootm_find_images(int flag, int argc, char * const argv[]);
 
+int bootm_measure(struct bootm_headers *images);
+
 int do_bootm_states(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[],
 		    int states, bootm_headers_t *images, int boot_progress);
 
diff --git a/include/image.h b/include/image.h
index 937c7eee8f..41cb147571 100644
--- a/include/image.h
+++ b/include/image.h
@@ -420,6 +420,7 @@ typedef struct bootm_headers {
 #define	BOOTM_STATE_OS_PREP	(0x00000100)
 #define	BOOTM_STATE_OS_FAKE_GO	(0x00000200)	/* 'Almost' run the OS */
 #define	BOOTM_STATE_OS_GO	(0x00000400)
+#define BOOTM_STATE_MEASURE	(0x00001000)
 	int		state;
 
 #ifdef CONFIG_LMB
-- 
2.31.1

