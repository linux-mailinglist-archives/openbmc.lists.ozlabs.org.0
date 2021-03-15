Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802C833C2D0
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 17:59:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzjLb3M3Jz2yyb
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 03:59:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mgSvThAk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mgSvThAk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzjL13Qszz300m
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 03:58:33 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGYEtR085725; Mon, 15 Mar 2021 12:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PE32J5ElrDhLWC8qUfnuBZ+3yGwousWFHtlZCOQNuSU=;
 b=mgSvThAkCFPRCoDHyLYPGhk8nMOZWjhARVAgUiAPxZfsdcZ4AiLtnJs18eyQJj/Qy/eh
 LriguFH3v//Gf+6sxS6rY6AvrJBfI3senSiYeDMV4YKSxGZ6t2H3ynJkfZIbox4iij/6
 5HMc/UL+eCxK6UsIC3nLhxR6D1GiuE44+qiQvIqawijWXgSzCy7cZ729xHLBPO7Q6Owg
 Yg5sxU+de5v9+lYNcOyXgQ7lCqXzE9ValT3CvCQ290DNlwRpb5Sv3HwnTvYkIB3TAv+t
 lAmf1tIVapE70g2iZ4LDWZwvc/7YPp9de45Jc84QCQ4JFiL8Y8GAVfWWFy5jjf4Srg4o Qw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37aag5t8wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:58:27 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FGlv0W004822;
 Mon, 15 Mar 2021 16:58:26 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 378n18rp6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:58:26 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGwQC923593342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:58:26 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BF16AC064;
 Mon, 15 Mar 2021 16:58:26 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41122AC05B;
 Mon, 15 Mar 2021 16:58:25 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.168.62])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:58:25 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] u-boot: Move definitions to common locations
Date: Mon, 15 Mar 2021 13:58:03 -0300
Message-Id: <20210315165806.1633-2-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315165806.1633-1-klaus@linux.vnet.ibm.com>
References: <20210315165806.1633-1-klaus@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 mlxscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Move some definitions from u-boot.inc into uboot-config.bbclass and
similarly from kernel-fitimage.bbclass into uboot-sign.bbclass, so that
they can be useful when signing the U-boot proper fitimage, for a
verified-boot SPL.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 meta/classes/kernel-fitimage.bbclass | 58 ----------------------------
 meta/classes/uboot-config.bbclass    | 56 +++++++++++++++++++++++++++
 meta/classes/uboot-sign.bbclass      | 35 +++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc   | 46 ----------------------
 4 files changed, 91 insertions(+), 104 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f5082c93df..76e2e6c136 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -53,30 +53,6 @@ python __anonymous () {
                 d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' %s:do_populate_sysroot' % uboot_pn)
 }
 
-# Options for the device tree compiler passed to mkimage '-D' feature:
-UBOOT_MKIMAGE_DTCOPTS ??= ""
-
-# fitImage Hash Algo
-FIT_HASH_ALG ?= "sha256"
-
-# fitImage Signature Algo
-FIT_SIGN_ALG ?= "rsa2048"
-
-# Generate keys for signing fitImage
-FIT_GENERATE_KEYS ?= "0"
-
-# Size of private key in number of bits
-FIT_SIGN_NUMBITS ?= "2048"
-
-# args to openssl genrsa (Default is just the public exponent)
-FIT_KEY_GENRSA_ARGS ?= "-F4"
-
-# args to openssl req (Default is -batch for non interactive mode and
-# -new for new certificate)
-FIT_KEY_REQ_ARGS ?= "-batch -new"
-
-# Standard format for public key certificate
-FIT_KEY_SIGN_PKCS ?= "-x509"
 
 # Description string
 FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
@@ -84,13 +60,6 @@ FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 # Sign individual images as well
 FIT_SIGN_INDIVIDUAL ?= "0"
 
-# mkimage command
-UBOOT_MKIMAGE ?= "uboot-mkimage"
-UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
-
-# Arguments passed to mkimage for signing
-UBOOT_MKIMAGE_SIGN_ARGS ?= ""
-
 #
 # Emit the fitImage ITS header
 #
@@ -692,33 +661,6 @@ do_assemble_fitimage_initramfs() {
 
 addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
 
-do_generate_rsa_keys() {
-	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
-		bbwarn "FIT_GENERATE_KEYS is set to 1 eventhough UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
-	fi
-
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
-
-		# Generate keys only if they don't already exist
-		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
-			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt]; then
-
-			# make directory if it does not already exist
-			mkdir -p "${UBOOT_SIGN_KEYDIR}"
-
-			echo "Generating RSA private key for signing fitImage"
-			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
-				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
-				"${FIT_SIGN_NUMBITS}"
-
-			echo "Generating certificate for signing fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
-				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
-				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
-		fi
-	fi
-}
-
 addtask generate_rsa_keys before do_assemble_fitimage after do_compile
 
 kernel_do_deploy[vardepsexclude] = "DATETIME"
diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 89ff970fcc..31487c1418 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -11,7 +11,63 @@
 #
 # Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
 
+# Some versions of u-boot use .bin and others use .img.  By default use .bin
+# but enable individual recipes to change this value.
+UBOOT_SUFFIX ??= "bin"
 UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
+UBOOT_BINARYNAME ?= "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}"
+UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
+UBOOT_MAKE_TARGET ?= "all"
+
+# Output the ELF generated. Some platforms can use the ELF file and directly
+# load it (JTAG booting, QEMU) additionally the ELF can be used for debugging
+# purposes.
+UBOOT_ELF ?= ""
+UBOOT_ELF_SUFFIX ?= "elf"
+UBOOT_ELF_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
+UBOOT_ELF_BINARY ?= "u-boot.${UBOOT_ELF_SUFFIX}"
+UBOOT_ELF_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
+
+# Some versions of u-boot build an SPL (Second Program Loader) image that
+# should be packaged along with the u-boot binary as well as placed in the
+# deploy directory.  For those versions they can set the following variables
+# to allow packaging the SPL.
+SPL_BINARY ?= ""
+SPL_BINARYNAME ?= "${@os.path.basename(d.getVar("SPL_BINARY"))}"
+SPL_IMAGE ?= "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}"
+SPL_SYMLINK ?= "${SPL_BINARYNAME}-${MACHINE}"
+
+# Additional environment variables or a script can be installed alongside
+# u-boot to be used automatically on boot.  This file, typically 'uEnv.txt'
+# or 'boot.scr', should be packaged along with u-boot as well as placed in the
+# deploy directory.  Machine configurations needing one of these files should
+# include it in the SRC_URI and set the UBOOT_ENV parameter.
+UBOOT_ENV_SUFFIX ?= "txt"
+UBOOT_ENV ?= ""
+UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
+UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
+UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
+
+# Default name of u-boot initial env, but enable individual recipes to change
+# this value.
+UBOOT_INITIAL_ENV ?= "${PN}-initial-env"
+
+# U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux.conf
+# to find EXTLINUX conf file.
+UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
+UBOOT_EXTLINUX_CONF_NAME ?= "extlinux.conf"
+UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
+
+# Options for the device tree compiler passed to mkimage '-D' feature:
+UBOOT_MKIMAGE_DTCOPTS ??= ""
+
+# mkimage command
+UBOOT_MKIMAGE ?= "uboot-mkimage"
+UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
+
+# Arguments passed to mkimage for signing
+UBOOT_MKIMAGE_SIGN_ARGS ?= ""
 
 python () {
     ubootmachine = d.getVar("UBOOT_MACHINE")
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 713196df41..d57bef6669 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -31,6 +31,9 @@
 #
 # For more details on signature process, please refer to U-Boot documentation.
 
+# We need some variables from u-boot-config
+inherit uboot-config
+
 # Signature activation.
 UBOOT_SIGN_ENABLE ?= "0"
 
@@ -41,6 +44,38 @@ UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
 UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
 UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
+UBOOT_ITS_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.its"
+UBOOT_ITS ?= "u-boot.its"
+UBOOT_ITS_SYMLINK ?= "u-boot-${MACHINE}.its"
+SPL_DIR ?= "${@os.path.dirname(d.getVar("SPL_BINARY")) or '.'}"
+SPL_DTB_IMAGE ?= "u-boot-spl-${MACHINE}-${PV}-${PR}.dtb"
+SPL_DTB_BINARY ?= "u-boot-spl.dtb"
+SPL_DTB_SYMLINK ?= "u-boot-spl-${MACHINE}.dtb"
+SPL_NODTB_IMAGE ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb-${MACHINE}-${PV}-${PR}${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[1]}"
+SPL_NODTB_BINARY ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[1]}"
+SPL_NODTB_SYMLINK ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb-${MACHINE}${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[1]}"
+
+# fitImage Hash Algo
+FIT_HASH_ALG ?= "sha256"
+
+# fitImage Signature Algo
+FIT_SIGN_ALG ?= "rsa2048"
+
+# Generate keys for signing fitImage
+FIT_GENERATE_KEYS ?= "0"
+
+# Size of private key in number of bits
+FIT_SIGN_NUMBITS ?= "2048"
+
+# args to openssl genrsa (Default is just the public exponent)
+FIT_KEY_GENRSA_ARGS ?= "-F4"
+
+# args to openssl req (Default is -batch for non interactive mode and
+# -new for new certificate)
+FIT_KEY_REQ_ARGS ?= "-batch -new"
+
+# Standard format for public key certificate
+FIT_KEY_SIGN_PKCS ?= "-x509"
 
 # Functions in this bbclass is for u-boot only
 UBOOT_PN = "${@d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'}"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 251178db33..5398c2e621 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -24,52 +24,6 @@ PACKAGECONFIG[openssl] = ",,openssl-native"
 # file already exists it will not be overwritten.
 UBOOT_LOCALVERSION ?= ""
 
-# Some versions of u-boot use .bin and others use .img.  By default use .bin
-# but enable individual recipes to change this value.
-UBOOT_SUFFIX ??= "bin"
-UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
-UBOOT_MAKE_TARGET ?= "all"
-
-# Output the ELF generated. Some platforms can use the ELF file and directly
-# load it (JTAG booting, QEMU) additionally the ELF can be used for debugging
-# purposes.
-UBOOT_ELF ?= ""
-UBOOT_ELF_SUFFIX ?= "elf"
-UBOOT_ELF_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
-UBOOT_ELF_BINARY ?= "u-boot.${UBOOT_ELF_SUFFIX}"
-UBOOT_ELF_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
-
-# Some versions of u-boot build an SPL (Second Program Loader) image that
-# should be packaged along with the u-boot binary as well as placed in the
-# deploy directory.  For those versions they can set the following variables
-# to allow packaging the SPL.
-SPL_BINARY ?= ""
-SPL_BINARYNAME ?= "${@os.path.basename(d.getVar("SPL_BINARY"))}"
-SPL_IMAGE ?= "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}"
-SPL_SYMLINK ?= "${SPL_BINARYNAME}-${MACHINE}"
-
-# Additional environment variables or a script can be installed alongside
-# u-boot to be used automatically on boot.  This file, typically 'uEnv.txt'
-# or 'boot.scr', should be packaged along with u-boot as well as placed in the
-# deploy directory.  Machine configurations needing one of these files should
-# include it in the SRC_URI and set the UBOOT_ENV parameter.
-UBOOT_ENV_SUFFIX ?= "txt"
-UBOOT_ENV ?= ""
-UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
-UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
-UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
-
-# Default name of u-boot initial env, but enable individual recipes to change
-# this value.
-UBOOT_INITIAL_ENV ?= "${PN}-initial-env"
-
-# U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux.conf
-# to find EXTLINUX conf file.
-UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
-UBOOT_EXTLINUX_CONF_NAME ?= "extlinux.conf"
-UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
-
 do_configure () {
     if [ -n "${UBOOT_CONFIG}" ]; then
         unset i j
-- 
2.25.1

