Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C624034AFFB
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 21:16:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6YBx5vhtz3c6B
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 07:16:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=loJrbWtt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=loJrbWtt; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6Y992cjbz3c0r
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 07:14:36 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QK3J9e016779; Fri, 26 Mar 2021 16:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QIZRDKj4edNPErQWxpCzsbwX9OlVTq8PiwQDspEvha4=;
 b=loJrbWttoD7RGpRf19xVljzyiz5oGn6o2SmLB4Uwl1IM+jBXi8Gh+Cp/PtV030GkkKHU
 OMpvzIkHyK1h6p8NvhSDlyiE6JAJkvcgRygEoAsVuWfpjRZHPg04IvjsJEASbBHpSgii
 UuNGkx9j7tYFZaBDkqR1GxNBoPEJ9gPCgTnOfCDs/XsnKh7TOCZtlatUykGvVRPu4sTw
 wp7xfYRtel8TTBp47bqXdfj+RiI19c46tJS+XSKaI4mKz1ycCBmnkODmaPkDpVhP3tO6
 Xbj0WynKHzX2+6Fcx2vlUrWjHj0eea83cr4uYPABo82//0VaiZlhvC9OJlSuPCWdbc8x qg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hhqvr3m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 16:14:31 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QKCXdV017647;
 Fri, 26 Mar 2021 20:14:31 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 37h14h9nhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 20:14:31 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QKETIq28443116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 20:14:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBEFE7805C;
 Fri, 26 Mar 2021 20:14:29 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54FF17805E;
 Fri, 26 Mar 2021 20:14:28 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.195.191])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 20:14:28 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/4] u-boot: Use a different Key for SPL signing
Date: Fri, 26 Mar 2021 17:14:09 -0300
Message-Id: <20210326201410.13906-4-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326201410.13906-1-klaus@linux.vnet.ibm.com>
References: <20210326201410.13906-1-klaus@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FMtJTKYfg9HkYzNgyEGCZY8x75QmXNE1
X-Proofpoint-ORIG-GUID: FMtJTKYfg9HkYzNgyEGCZY8x75QmXNE1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_11:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
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

Duplicate the variables governing u-boot signing so that we can have a
different set of keys/parameters signing the SPL.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 meta/classes/uboot-config.bbclass |  2 ++
 meta/classes/uboot-sign.bbclass   | 53 +++++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 10 deletions(-)

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
index 30ccebe94a..5f1750fdcc 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -65,27 +65,34 @@ SPL_NODTB_SYMLINK ?= "u-boot-spl-nodtb-${MACHINE}.bin"
 # U-Boot fitImage description
 UBOOT_FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 
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
@@ -280,6 +287,32 @@ do_generate_rsa_keys() {
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
@@ -292,9 +325,9 @@ uboot_fitimage_assemble() {
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
 
@@ -365,7 +398,7 @@ EOF
 	# Assemble the U-boot FIT image
 	#
 	${UBOOT_MKIMAGE} \
-		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
 		-f ${uboot_its} \
 		${uboot_bin}
 
@@ -374,11 +407,11 @@ EOF
 		# Sign the U-boot FIT image and add public key to SPL dtb
 		#
 		${UBOOT_MKIMAGE_SIGN} \
-			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+			${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${SPL_SIGN_KEYDIR}" \
 			-K "${spl_dtb}" \
 			-r ${uboot_bin} \
-			${UBOOT_MKIMAGE_SIGN_ARGS}
+			${SPL_MKIMAGE_SIGN_ARGS}
 	fi
 
 }
-- 
2.25.1

