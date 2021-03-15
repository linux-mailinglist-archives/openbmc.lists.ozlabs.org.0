Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A17533C300
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 18:00:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzjMr30ljz2yyQ
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 04:00:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oIYSE/Hs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oIYSE/Hs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzjLF0Jtmz2yyj
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 03:58:44 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGkMWx056759; Mon, 15 Mar 2021 12:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wNFXshtSwleXGfduk4J/UdYxvfnTXBxEYDARZzqB13o=;
 b=oIYSE/HsfcBAiW4Yox2aKPbqi7EQDSprPdmn8nnvKKev3+66VhUORUFb01h1An6WRcYw
 ORGN3aZFSbKJCWk2DG5h0GwIJsqLxL1GrN6lcqM27Y9mC+KNeRb5N051G0WNkZ9MfJsh
 TLWiEDwO8aIg8BxU4xjUJmLE2KUg1Z0H5AeR6JDcTxhdbLchT00LwTbRA3+3gvN7gqxT
 VuogJGMmYFwMqu731PJuqnNQxrPML1tByzxixjsb9GKUFxbKmitiq+PcK/mP08G7mG/8
 /2QVJB7Pbb/99GoBpueMnqaQb53GS0sAF5ze5xO/mxtDMn6R2zRtRqfW6PPkYD652eq/ +w== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37abd6r8xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:58:39 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FGlHC4017165;
 Mon, 15 Mar 2021 16:58:39 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 37a3gc3ufr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:58:39 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGwca029098334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:58:38 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 600F9AC05B;
 Mon, 15 Mar 2021 16:58:38 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 354FDAC059;
 Mon, 15 Mar 2021 16:58:37 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.168.62])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:58:37 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] u-boot: Use a different Key for SPL signing
Date: Mon, 15 Mar 2021 13:58:05 -0300
Message-Id: <20210315165806.1633-4-klaus@linux.vnet.ibm.com>
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
 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103150113
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
index 86380f2234..2ec93e0b8e 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -59,27 +59,34 @@ SPL_NODTB_IMAGE ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb-${
 SPL_NODTB_BINARY ?= "u-boot-spl-nodtb.bin"
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
 
@@ -349,7 +382,7 @@ EOF
 	# Assemble the U-boot FIT image
 	#
 	${UBOOT_MKIMAGE} \
-		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
 		-f ${uboot_its} \
 		${uboot_bin}
 
@@ -357,11 +390,11 @@ EOF
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

