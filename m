Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2392B33C2FC
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 17:59:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzjMJ0fg4z300j
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 03:59:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mmwzy89p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mmwzy89p; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzjL9429mz2yyk
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 03:58:41 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGrRd0003760; Mon, 15 Mar 2021 12:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lwBfOfLwRueauSDpoVZj2/HZegQ4exwKdOkc/UydLGI=;
 b=mmwzy89pxV1BPFMNpj4q1XJk6xcsqQHlH9vAiAxUoRuRgu6oLCREh6f+mNivrPekSzwp
 qYd7qYlT4gTRp+dA9dQ2UKRVfHuaMWbdJgYa0jjS4MoFwz8PPkvJLpMRx1XxCl6BaO/4
 S1Lt5qYgZcdDxKVxlPV5a5tt+rZkWidF0vErvNNqfSyaktRasuqetHh6iF9MMGcC9UDl
 jIgIHnpj8EaCNX/cXRn+eMZZUz50G8TU6Z+BpUZYhiiynbdYb7C2YwBSzKbOKrhccqXL
 JBkWFS9n3mje5Q9Op0goAlLWY1yG2sCGq4JE3G5bjtyMmNajwaKJWQEPWdEQPowHJm4L 4w== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37abgar56c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:58:36 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FGl8In008849;
 Mon, 15 Mar 2021 16:58:35 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 378n190qfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:58:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGwYoS16581080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:58:34 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B991DAC05B;
 Mon, 15 Mar 2021 16:58:34 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BF7FAC060;
 Mon, 15 Mar 2021 16:58:33 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.168.62])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:58:33 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] u-boot: Add infrastructure to SPL verified boot
Date: Mon, 15 Mar 2021 13:58:04 -0300
Message-Id: <20210315165806.1633-3-klaus@linux.vnet.ibm.com>
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
 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
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

Add the necessary infrastructure to create a U-boot proper fitimage,
sign it (using the same keys as the kernel-fitimage), and put the public
key in the SPL binary so that verified SPL boot can be accomplished.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 meta/classes/kernel-fitimage.bbclass |  11 +-
 meta/classes/uboot-sign.bbclass      | 335 +++++++++++++++++++++++++--
 2 files changed, 321 insertions(+), 25 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 76e2e6c136..cbc8d93fec 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -694,6 +694,15 @@ kernel_do_deploy_append() {
 			# ${UBOOT_DTB_IMAGE} since it contains ${PV} which is aimed
 			# for u-boot, but we are in kernel env now.
 			install -m 0644 ${B}/u-boot-${MACHINE}*.dtb "$deployDir/"
+			if [ "${SPL_SIGN_ENABLE}" = "1" -a -n "${UBOOT_BINARY}" -a -n "${SPL_DTB_BINARY}" ] ; then
+				# If we're also signing the uboot fit, now we need to
+				# deploy it, it's its file, as well as u-boot-spl.dtb
+				install -m 0644 ${B}/u-boot-spl-${MACHINE}*.dtb "$deployDir/"
+				echo "Copying u-boot-fitImage file..."
+				install -m 0644 ${B}/u-boot-fitImage-* "$deployDir/"
+				echo "Copying u-boot-its file..."
+				install -m 0644 ${B}/u-boot-its-* "$deployDir/"
+			fi
 		fi
 	fi
 }
@@ -711,4 +720,4 @@ python () {
         bb.build.deltask('do_assemble_fitimage', d)
         bb.build.deltask('generate_rsa_keys', d)
         bb.build.addtask('generate_rsa_keys', 'do_assemble_fitimage_initramfs', 'do_bundle_initramfs', d)
-}
\ No newline at end of file
+}
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index d57bef6669..86380f2234 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -36,23 +36,27 @@ inherit uboot-config
 
 # Signature activation.
 UBOOT_SIGN_ENABLE ?= "0"
+SPL_SIGN_ENABLE ?= "0"
 
 # Default value for deployment filenames.
 UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
 UBOOT_DTB_BINARY ?= "u-boot.dtb"
 UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
-UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
-UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
-UBOOT_ITS_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.its"
+UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.bin"
+UBOOT_NODTB_BINARY ?= "u-boot-nodtb.bin"
+UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.bin"
+UBOOT_ITS_IMAGE ?= "u-boot-its-${MACHINE}-${PV}-${PR}"
 UBOOT_ITS ?= "u-boot.its"
-UBOOT_ITS_SYMLINK ?= "u-boot-${MACHINE}.its"
-SPL_DIR ?= "${@os.path.dirname(d.getVar("SPL_BINARY")) or '.'}"
+UBOOT_ITS_SYMLINK ?= "u-boot-its-${MACHINE}"
+UBOOT_FITIMAGE_IMAGE ?= "u-boot-fitImage-${MACHINE}-${PV}-${PR}"
+UBOOT_FITIMAGE_BINARY ?= "u-boot-fitImage"
+UBOOT_FITIMAGE_SYMLINK ?= "u-boot-fitImage-${MACHINE}"
+SPL_DIR ?= "spl/"
 SPL_DTB_IMAGE ?= "u-boot-spl-${MACHINE}-${PV}-${PR}.dtb"
 SPL_DTB_BINARY ?= "u-boot-spl.dtb"
 SPL_DTB_SYMLINK ?= "u-boot-spl-${MACHINE}.dtb"
 SPL_NODTB_IMAGE ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb-${MACHINE}-${PV}-${PR}${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[1]}"
-SPL_NODTB_BINARY ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[1]}"
+SPL_NODTB_BINARY ?= "u-boot-spl-nodtb.bin"
 SPL_NODTB_SYMLINK ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb-${MACHINE}${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[1]}"
 
 # fitImage Hash Algo
@@ -77,8 +81,18 @@ FIT_KEY_REQ_ARGS ?= "-batch -new"
 # Standard format for public key certificate
 FIT_KEY_SIGN_PKCS ?= "-x509"
 
-# Functions in this bbclass is for u-boot only
+# Functions on this bbclass can apply to either U-boot or Kernel,
+# depending on the scenario
 UBOOT_PN = "${@d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'}"
+KERNEL_PN = "${@d.getVar('PREFERRED_PROVIDER_virtual/kernel')}"
+
+# We need u-boot-tools-native if we're about to sign the SPL
+python() {
+    if d.getVar('SPL_SIGN_ENABLE') == '1':
+        depends = d.getVar("DEPENDS")
+        depends = "%s u-boot-tools-native dtc-native" % depends
+        d.setVar("DEPENDS", depends)
+}
 
 concat_dtb_helper() {
 	if [ -e "${UBOOT_DTB_BINARY}" ]; then
@@ -92,21 +106,59 @@ concat_dtb_helper() {
 		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_BINARY}
 	fi
 
-	# Concatenate U-Boot w/o DTB & DTB with public key
-	# (cf. kernel-fitimage.bbclass for more details)
-	deployed_uboot_dtb_binary='${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}'
-	if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
-		[ -e "$deployed_uboot_dtb_binary" ]; then
-		oe_runmake EXT_DTB=$deployed_uboot_dtb_binary
-		install ${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-	elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
+	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB & U-Boot DTB
+	# with public key (otherwise it will be deployed by the equivalent
+	# concat_spl_dtb_helper function - cf. kernel-fitimage.bbclass for more details)
+	if [ "${SPL_SIGN_ENABLE}" != "1" ] ; then
+		deployed_uboot_dtb_binary='${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}'
+		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
+			[ -e "$deployed_uboot_dtb_binary" ]; then
+			oe_runmake EXT_DTB=$deployed_uboot_dtb_binary
+			install ${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
+			cd ${DEPLOYDIR}
+			cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${CONFIG_B_PATH}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
+		else
+			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+		fi
+	fi
+}
+
+concat_spl_dtb_helper() {
+	# Deploy the U-boot its file, spl dtb and the spl nodtb binary
+
+	if [ -e "${SPL_DIR}/${SPL_DTB_BINARY}" ] ; then
+		# We only deploy u-boot-spl.dtb real file if we are NOT
+		# signing the kernel, otherwise the kernel PN will do
+		# it for us (see kernel-fitimage.bbclass)
+		if [ "${UBOOT_SIGN_ENABLE}" != "1" ] ; then
+			install -m 0644 ${SPL_DIR}/${SPL_DTB_BINARY} \
+			    ${DEPLOYDIR}/${SPL_DTB_IMAGE}
+			deployed_spl_dtb_binary='${DEPLOYDIR}/${SPL_DTB_IMAGE}'
+		else
+			deployed_spl_dtb_binary='${DEPLOY_DIR_IMAGE}/${SPL_DTB_IMAGE}'
+		fi;
+		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_SYMLINK}
+		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_BINARY}
+	fi
+
+	if [ -f "${SPL_DIR}/${SPL_NODTB_BINARY}" ] ; then
+		echo "Copying u-boot-nodtb binary..."
+		install -m 0644 ${SPL_DIR}/${SPL_NODTB_BINARY} ${DEPLOYDIR}/${SPL_NODTB_IMAGE}
+		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_SYMLINK}
+		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_BINARY}
+	fi
+
+	# Concatenate the SPL nodtb binary and u-boot.dtb (with pubkey)
+	if [ -e "${DEPLOYDIR}/${SPL_NODTB_IMAGE}" -a -e "$deployed_spl_dtb_binary" ] ; then
 		cd ${DEPLOYDIR}
-		cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${CONFIG_B_PATH}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
+		cat ${SPL_NODTB_IMAGE} $deployed_spl_dtb_binary | tee ${B}/${CONFIG_B_PATH}/${SPL_BINARY} > ${SPL_IMAGE}
 	else
-		bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+		bbwarn "Failure while adding public key to spl binary. Verified U-Boot boot won't be available."
 	fi
 }
 
+
 concat_dtb() {
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" -a -n "${UBOOT_DTB_BINARY}" ]; then
 		mkdir -p ${DEPLOYDIR}
@@ -124,6 +176,24 @@ concat_dtb() {
 	fi
 }
 
+concat_spl_dtb() {
+	if [ "${SPL_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" -a -n "${SPL_DTB_BINARY}" ]; then
+		mkdir -p ${DEPLOYDIR}
+		if [ -n "${UBOOT_CONFIG}" ]; then
+			for config in ${UBOOT_MACHINE}; do
+				CONFIG_B_PATH="${config}"
+				cd ${B}/${config}
+				concat_spl_dtb_helper
+			done
+		else
+			CONFIG_B_PATH=""
+			cd ${B}
+			concat_spl_dtb_helper
+		fi
+	fi
+}
+
+
 # Install UBOOT_DTB_BINARY to datadir, so that kernel can use it for
 # signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
 install_helper() {
@@ -138,30 +208,247 @@ install_helper() {
 	fi
 }
 
+# Install SPL dtb and u-boot nodtb to datadir, 
+install_spl_helper() {
+	if [ -f "${SPL_DIR}/${SPL_DTB_BINARY}" ]; then
+		install -d ${D}${datadir}
+		install ${SPL_DIR}/${SPL_DTB_BINARY} ${D}${datadir}/${SPL_DTB_IMAGE}
+		ln -sf ${SPL_DTB_IMAGE} ${D}${datadir}/${SPL_DTB_BINARY}
+	else
+		bbwarn "${SPL_DTB_BINARY} not found"
+	fi
+	if [ -f "${UBOOT_NODTB_BINARY}" ] ; then
+		install ${UBOOT_NODTB_BINARY} ${D}${datadir}/${UBOOT_NODTB_IMAGE}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${D}${datadir}/${UBOOT_NODTB_BINARY}
+	else
+		bbwarn "${UBOOT_NODTB_BINARY} not found"
+	fi
+
+	# We need to install a 'stub' u-boot-fitimage + its to datadir,
+	# so that the KERNEL_PN can use the correct filename when
+	# assembling and deploying them
+	touch ${D}/${datadir}/${UBOOT_FITIMAGE_IMAGE}
+	touch ${D}/${datadir}/${UBOOT_ITS_IMAGE}
+}
+
 do_install_append() {
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" -a -n "${UBOOT_DTB_BINARY}" ]; then
+	if [ "${PN}" = "${UBOOT_PN}" ]; then
 		if [ -n "${UBOOT_CONFIG}" ]; then
 			for config in ${UBOOT_MACHINE}; do
 				cd ${B}/${config}
-				install_helper
+				if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ]; then
+					install_helper
+				fi
+				if [ "${SPL_SIGN_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ]; then
+					install_spl_helper
+				fi
 			done
 		else
 			cd ${B}
-			install_helper
+			if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ]; then
+				install_helper
+			fi
+			if [ "${SPL_SIGN_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ]; then
+				install_spl_helper
+			fi
+		fi
+	fi
+}
+
+do_generate_rsa_keys() {
+	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
+		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
+	fi
+
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
+
+		# Generate keys only if they don't already exist
+		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
+			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt ]; then
+
+			# make directory if it does not already exist
+			mkdir -p "${UBOOT_SIGN_KEYDIR}"
+
+			echo "Generating RSA private key for signing fitImage"
+			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
+				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
+				"${FIT_SIGN_NUMBITS}"
+
+			echo "Generating certificate for signing fitImage"
+			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
+				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
+				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
+		fi
+	fi
+}
+
+addtask generate_rsa_keys before do_uboot_assemble_fitimage after do_compile
+
+# Create a ITS file for the U-boot FIT, for use when
+# we want to sign it so that the SPL can verify it
+uboot_fitimage_assemble() {
+	uboot_its="${1}"
+	uboot_nodtb_bin="${2}"
+	uboot_dtb="${3}"
+	uboot_bin="${4}"
+	spl_dtb="${5}"
+	uboot_csum="${FIT_HASH_ALG}"
+	uboot_sign_algo="${FIT_SIGN_ALG}"
+	uboot_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+
+	rm -f ${uboot_its} ${uboot_bin}
+
+	# First we create the ITS script
+	cat << EOF >> ${uboot_its}
+/dts-v1/;
+
+/ {
+    description = "U-boot FIT";
+    #address-cells = <1>;
+
+    images {
+        uboot {
+            description = "U-Boot image";
+            data = /incbin/("${uboot_nodtb_bin}");
+            type = "standalone";
+            os = "U-Boot";
+            arch = "${UBOOT_ARCH}";
+            compression = "none";
+            load = <${UBOOT_LOADADDRESS}>;
+            entry = <${UBOOT_ENTRYPOINT}>;
+            signature {
+                algo = "${uboot_csum},${uboot_sign_algo}";
+                key-name-hint = "${uboot_sign_keyname}";
+            };
+        };
+        fdt {
+            description = "U-Boot FDT";
+            data = /incbin/("${uboot_dtb}");
+            type = "flat_dt";
+            arch = "${UBOOT_ARCH}";
+            compression = "none";
+            signature {
+                algo = "${uboot_csum},${uboot_sign_algo}";
+                key-name-hint = "${uboot_sign_keyname}";
+            };
+        };
+    };
+
+    configurations {
+        default = "conf";
+        conf {
+            description = "Boot with signed U-Boot FIT";
+            loadables = "uboot";
+            fdt = "fdt";
+        };
+    };
+};
+EOF
+
+	#
+	# Assemble the U-boot FIT image
+	#
+	${UBOOT_MKIMAGE} \
+		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		-f ${uboot_its} \
+		${uboot_bin}
+
+	#
+	# Sign the U-boot FIT image and add public key to SPL dtb
+	#
+	${UBOOT_MKIMAGE_SIGN} \
+		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		-F -k "${UBOOT_SIGN_KEYDIR}" \
+		-K "${spl_dtb}" \
+		-r ${uboot_bin} \
+		${UBOOT_MKIMAGE_SIGN_ARGS}
+
+}
+
+do_uboot_assemble_fitimage() {
+	# This function runs in both UBOOT_PN as well as KERNEL_PN contexts. The reason
+	# for that is that we need to be able to support SPL verified boot standalone,
+	# as well as in the scenario where U-boot verified boot is enabled. On the latter
+	# case, we can only sign our U-BOOT fit after the KERNEL_PN signed the fitimage,
+	# as well as placed the pubkey in the U-boot DTB. Note that the Signed U-boot
+	# FIT and SPL with the pubkey will only be available in the deploy dir, not on
+	# the u-boot package
+	if [ "${SPL_SIGN_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ] ; then
+		if [ "${PN}" = "${UBOOT_PN}" ] ; then
+			if [ -n "${UBOOT_CONFIG}" ]; then
+				for config in ${UBOOT_MACHINE}; do
+					cd ${B}/${config}
+					uboot_fitimage_assemble ${UBOOT_ITS} \
+								${UBOOT_NODTB_BINARY} \
+								${UBOOT_DTB_BINARY} \
+								${UBOOT_FITIMAGE_BINARY}\
+								${SPL_DIR}/${SPL_DTB_BINARY}
+				done
+			else
+				cd ${B}
+				uboot_fitimage_assemble ${UBOOT_ITS} ${UBOOT_NODTB_BINARY} \
+							${UBOOT_DTB_BINARY} \
+							${UBOOT_FITIMAGE_BINARY} \
+							${SPL_DIR}/${SPL_DTB_BINARY}
+			fi
+		elif [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${KERNEL_PN}" ] ; then
+			# As we are in the kernel context, we need to copy u-boot-spl.dtb from staging first.
+			# Unfortunately, need to glob on top of ${SPL_DTB_BINARY} since _IMAGE and _SYMLINK
+			# will contain U-boot's PV
+			# Similarly, we need to get the filename for the 'stub' u-boot-fitimage + its in
+			# staging so that we can use it for creating the image with the correct filename
+			# in the KERNEL_PN context.
+			# As for the u-boot.dtb (with fitimage's pubkey), it should come from the dependent
+			# do_assemble_fitimage task
+			cp -P ${STAGING_DATADIR}/u-boot-nodtb*.bin ${B}
+			kernel_uboot_fitimage_name=`basename ${STAGING_DATADIR}/u-boot-fitImage-*`
+			kernel_uboot_its_name=`basename ${STAGING_DATADIR}/u-boot-its-*`
+			cd ${B}
+			uboot_fitimage_assemble ${kernel_uboot_its_name} ${UBOOT_NODTB_BINARY} \
+						${UBOOT_DTB_BINARY} ${kernel_uboot_fitimage_name} \
+						${SPL_DTB_BINARY}
 		fi
 	fi
 }
 
+addtask uboot_assemble_fitimage before do_deploy after do_compile
+
 do_deploy_prepend_pn-${UBOOT_PN}() {
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ]; then
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
 		concat_dtb
 	fi
+	if [ "${SPL_SIGN_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ] ; then
+		concat_spl_dtb
+	fi
+}
+
+do_deploy_append_pn-${UBOOT_PN}() {
+	if [ "${SPL_SIGN_ENABLE}" = "1" -a "${UBOOT_SIGN_ENABLE}" != "1" ] ; then
+		# Only deploy u-boot-fitimage and its file
+		# if the KERNEL_PN is not already doing so
+		echo "Copying u-boot-fitimage file..."
+		install -m 0644 ${B}/${UBOOT_FITIMAGE_BINARY} ${DEPLOYDIR}/${UBOOT_FITIMAGE_IMAGE}
+		echo "Copying u-boot-its file..."
+		install -m 0644 ${B}/${UBOOT_ITS} ${DEPLOYDIR}/${UBOOT_ITS_IMAGE}
+	fi
+	ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_BINARY}
+	ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_SYMLINK}
+	ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS}
+	ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS_SYMLINK}
 }
 
 python () {
     if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == d.getVar('UBOOT_PN') and d.getVar('UBOOT_DTB_BINARY'):
-        kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
 
         # Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
-        d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % kernel_pn)
+        d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % d.getVar('KERNEL_PN'))
+
+    if d.getVar('SPL_SIGN_ENABLE') == '1' and d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == d.getVar('KERNEL_PN'):
+        # if we're signing both U-Boot and Kernel fitImages, need to
+        # run uboot_assemble_fitimage after the kernel assembles theirs
+        if d.getVar('INITRAMFS_IMAGE_BUNDLE') == "1":
+            d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' %s:do_assemble_fitimage_initramfs' % d.getVar('KERNEL_PN'))
+        else:
+            d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' %s:do_assemble_fitimage' % d.getVar('KERNEL_PN'))
+
 }
-- 
2.25.1

