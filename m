Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE9F32F9B8
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 12:29:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dt2Sn5trPz3dDx
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 22:29:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qjvRq75b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qjvRq75b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dt2Rl2r7qz3cPv
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 22:28:51 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 126BETuF035554; Sat, 6 Mar 2021 06:28:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dnfrhUkxLkPe7WjPOQql5KkwKPLuTTKMtuvA/fcqXSU=;
 b=qjvRq75bfI6RChVxr4Uoq+gwHVljT9HyOITRH6PdJYX7a5LERtHkV2T4aWHWLrEy/ZTW
 l6b8qFdCEvo7HVJeySvd7dUlRe5zDhf3+nVUBFP9bJDUK9O9buHrzYf6Chw33VpS7vq4
 IAkyurSyU/z2KSGjh0bWiBX8usoUOEA9HucyiMlqMBIDlQVHA9GZtPLZyuSAIEUnZ6KJ
 SDqx5y0amhTRO90ntY8iDfmuj3I1P9L0K7KQzJOfxv+pekHftCBKgU7qljAe/u7phtyy
 9bX4Fly0J54swLeTaBNNgodkmtu0+fEyqPm5CfMJJCYS9li2DwHRdmWka+mrGxmQtDSW AQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3748pe85ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Mar 2021 06:28:46 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 126BSe2Y020657;
 Sat, 6 Mar 2021 11:28:46 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 3741c920bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Mar 2021 11:28:46 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 126BSjOS24772970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 6 Mar 2021 11:28:45 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97A86AE06D;
 Sat,  6 Mar 2021 11:28:45 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 900B4AE060;
 Sat,  6 Mar 2021 11:28:44 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.167.17])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat,  6 Mar 2021 11:28:44 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][RFC 3/3] u-boot: Use a different Key for SPL signing
Date: Sat,  6 Mar 2021 08:28:22 -0300
Message-Id: <20210306112822.11668-4-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306112822.11668-1-klaus@linux.vnet.ibm.com>
References: <20210306112822.11668-1-klaus@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-06_05:2021-03-03,
 2021-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103060068
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

Duplicate the variables governing u-boot signing so that we can have a
different set of keys/parameters signing the SPL.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 meta/classes/uboot-config.bbclass |  2 ++
 meta/classes/uboot-sign.bbclass   | 55 ++++++++++++++++++++++++-------
 2 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 31487c1418..3bba02828b 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -61,6 +61,7 @@ UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
 UBOOT_MKIMAGE_DTCOPTS ??= ""
+SPL_MKIMAGE_DTCOPTS ??= ""
 
 # mkimage command
 UBOOT_MKIMAGE ?= "uboot-mkimage"
@@ -68,6 +69,7 @@ UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
 
 # Arguments passed to mkimage for signing
 UBOOT_MKIMAGE_SIGN_ARGS ?= ""
+SPL_MKIMAGE_SIGN_ARGS ?= ""
 
 python () {
     ubootmachine = d.getVar("UBOOT_MACHINE")
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index c362cbfd9c..23186f1491 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -56,27 +56,34 @@ SPL_NODTB_IMAGE ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb-${
 SPL_NODTB_BINARY ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[1]}"
 SPL_NODTB_SYMLINK ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb-${MACHINE}${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[1]}"
 
-# fitImage Hash Algo
+# Kernel / U-Boot fitImage Hash Algo
 FIT_HASH_ALG ?= "sha256"
+UBOOT_FIT_HASH_ALG ?= "sha256"
 
-# fitImage Signature Algo
+# Kernel / U-Boot fitImage Signature Algo
 FIT_SIGN_ALG ?= "rsa2048"
+UBOOT_FIT_SIGN_ALG ?= "rsa2048"
 
-# Generate keys for signing fitImage
+# Generate keys for signing Kernel / U-Boot fitImage
 FIT_GENERATE_KEYS ?= "0"
+UBOOT_FIT_GENERATE_KEYS ?= "0"
 
-# Size of private key in number of bits
+# Size of private keys in number of bits
 FIT_SIGN_NUMBITS ?= "2048"
+UBOOT_FIT_SIGN_NUMBITS ?= "2048"
 
 # args to openssl genrsa (Default is just the public exponent)
 FIT_KEY_GENRSA_ARGS ?= "-F4"
+UBOOT_FIT_KEY_GENRSA_ARGS ?= "-F4"
 
 # args to openssl req (Default is -batch for non interactive mode and
 # -new for new certificate)
 FIT_KEY_REQ_ARGS ?= "-batch -new"
+UBOOT_FIT_KEY_REQ_ARGS ?= "-batch -new"
 
 # Standard format for public key certificate
 FIT_KEY_SIGN_PKCS ?= "-x509"
+UBOOT_FIT_KEY_SIGN_PKCS ?= "-x509"
 
 # Functions on this bbclass can apply to either U-boot or Kernel,
 # depending on the scenario
@@ -276,6 +283,32 @@ do_generate_rsa_keys() {
 				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
 		fi
 	fi
+
+	if [ "${SPL_SIGN_ENABLE}" = "0" ] && [ "${UBOOT_FIT_GENERATE_KEYS}" = "1" ]; then
+		bbwarn "UBOOT_FIT_GENERATE_KEYS is set to 1 eventhough SPL_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
+	fi
+
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${UBOOT_FIT_GENERATE_KEYS}" = "1" ]; then
+
+		# Generate keys only if they don't already exist
+		if [ ! -f "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".key ] || \
+			[ ! -f "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".crt ]; then
+
+			# make directory if it does not already exist
+			mkdir -p "${SPL_SIGN_KEYDIR}"
+
+			echo "Generating RSA private key for signing U-Boot fitImage"
+			openssl genrsa ${UBOOT_FIT_KEY_GENRSA_ARGS} -out \
+				"${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".key \
+				"${UBOOT_FIT_SIGN_NUMBITS}"
+
+			echo "Generating certificate for signing U-Boot fitImage"
+			openssl req ${FIT_KEY_REQ_ARGS} "${UBOOT_FIT_KEY_SIGN_PKCS}" \
+				-key "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".key \
+				-out "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".crt
+		fi
+	fi
+
 }
 
 addtask generate_rsa_keys before do_uboot_assemble_fitimage after do_compile
@@ -288,9 +321,9 @@ uboot_fitimage_assemble() {
 	uboot_dtb="${3}"
 	uboot_bin="${4}"
 	spl_dtb="${5}"
-	uboot_csum="${FIT_HASH_ALG}"
-	uboot_sign_algo="${FIT_SIGN_ALG}"
-	uboot_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+	uboot_csum="${UBOOT_FIT_HASH_ALG}"
+	uboot_sign_algo="${UBOOT_FIT_SIGN_ALG}"
+	uboot_sign_keyname="${SPL_SIGN_KEYNAME}"
 
 	rm -f ${uboot_its} ${uboot_bin}
 
@@ -359,7 +392,7 @@ EOF
 	# Assemble the U-boot FIT image
 	#
 	${UBOOT_MKIMAGE} \
-		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
 		-f ${uboot_its} \
 		${uboot_bin}
 
@@ -367,11 +400,11 @@ EOF
 	# Sign the U-boot FIT image and add public key to SPL dtb
 	#
 	${UBOOT_MKIMAGE_SIGN} \
-		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-		-F -k "${UBOOT_SIGN_KEYDIR}" \
+		${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
+		-F -k "${SPL_SIGN_KEYDIR}" \
 		-K "${spl_dtb}" \
 		-r ${uboot_bin} \
-		${UBOOT_MKIMAGE_SIGN_ARGS}
+		${SPL_MKIMAGE_SIGN_ARGS}
 
 }
 
-- 
2.25.1

