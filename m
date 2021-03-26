Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5D34AFF9
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 21:15:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Y9m4MBzz3c6Q
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 07:15:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qs0d6H9e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qs0d6H9e; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6Y934z02z3bxc
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 07:14:31 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QK4HvU026740; Fri, 26 Mar 2021 16:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=q8Y4C34XtHA5A5EqxlChyD+z3AcqRWWgnpEG/I9ZjqM=;
 b=qs0d6H9eG+qnK7hxOI7yBIQ5f8iM3jQJ8Dh4j6VKF0sI8bDeXIqfPN7/qsyMSiYsuWGL
 YRWYuOsVXXVZBijW5N4gDgAHDW9gIpyY+BWrzfBep3Dlc+TIPwgIEe8GS8rBfZM61XEI
 QxRH1Tqx2e9fzOm9oLbfEefHPdyderRhMnCVuDMwS+Vr4dgreZOCQ0xb5w2pGZ1TWz9a
 LvwC9Dvb4W3YfyOfMELql1syCGFvswJdgLMr7s5oQ3bQIy93z9+2DsrlRCGMb4PROPgU
 i0aY0NK+ot7W9fh4UnXkAbEalZumqXYZf+tEQlQqN0LdOAbFmW+t68jSGlzFSw3cuYHa dA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hcdut3e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 16:14:26 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QKDnSD001280;
 Fri, 26 Mar 2021 20:14:25 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 37h150hmmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 20:14:25 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QKEN5V27066712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 20:14:24 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D631C7805F;
 Fri, 26 Mar 2021 20:14:23 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 599DE7805C;
 Fri, 26 Mar 2021 20:14:22 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.195.191])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 20:14:22 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/4] u-boot: Move definitions to common locations
Date: Fri, 26 Mar 2021 17:14:07 -0300
Message-Id: <20210326201410.13906-2-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326201410.13906-1-klaus@linux.vnet.ibm.com>
References: <20210326201410.13906-1-klaus@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Hc41mlsCT8RD9zmOD-Fnqdg3z5YF62KQ
X-Proofpoint-ORIG-GUID: Hc41mlsCT8RD9zmOD-Fnqdg3z5YF62KQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_08:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2103250000 definitions=main-2103260149
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
index b9d8270027..6b7c1c3a7d 100644
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
@@ -698,33 +667,6 @@ do_assemble_fitimage_initramfs() {
 
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

