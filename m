Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039B35012C
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 15:23:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Rpv6xkwz3bwC
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 00:23:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ts/rsesg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ts/rsesg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Rpg3Lptz2ypn
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 00:23:38 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12VD3LRT006386; Wed, 31 Mar 2021 09:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Zxn8bVwRI0IvCQcdSoWMEXRJ3001yP3DbS3zCoYqGuw=;
 b=Ts/rsesg6ryFXXFykk0bCRL+HVCR0GV3CwcQ7dopcmTzGAcO/SXvd0MsWP4EeowwBfLm
 trhqgrZO7Vp0BXOgvYXrrcyLH9tdPt+XsQFbmccnR2TQD3g+Dou5yXvfMRQq60Q1pEDi
 LsOgQapYMQpO+xwr+DGF+0o7utXVOwnxxgluBaJc3XDA9WtlhRGqvCKBzEP3wVWC4Z0C
 Vmue7LAHwmGnCqQnahCrbGm8I9OfP6TLeWXQorn36gmO/JV+68IGL8SiUPYe3AQQB5Hp
 XFSri83TGbyr8rWE0ShsQRFRGAQOrACOQi1JUea9BKrQTbDklMUjIZ0Y0E0LbzAYDPhV 1Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37mn0ns4du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 09:23:34 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12VDJ6oc019491;
 Wed, 31 Mar 2021 13:23:33 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 37maae6e82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 13:23:33 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12VDNWwc25559376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 13:23:32 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37F2678063;
 Wed, 31 Mar 2021 13:23:32 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 339B77805F;
 Wed, 31 Mar 2021 13:23:31 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.187.23])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 31 Mar 2021 13:23:30 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uboot: Fixes SPL verified boot on corner cases
Date: Wed, 31 Mar 2021 10:23:13 -0300
Message-Id: <20210331132313.23622-1-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jBbAM6XMLj3LC6WB4GDYLwQpTnasXa4S
X-Proofpoint-ORIG-GUID: jBbAM6XMLj3LC6WB4GDYLwQpTnasXa4S
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_03:2021-03-30,
 2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310095
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
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

* The kernel-fitimage class adds a do_assemble_fitimage_initramfs task
  regardless of INITRAMFS_IMAGE_BUNDLE setting, which in some cases can
  result in that task running after do_uboot_assemble_fitimage and
  overwriting the u-boot-spl.dtb file with the pristine version (without
  public key). Fix this by making do_uboot_assemble_fitimage dependant
  on both do_assemble_fitimage_* tasks, regardless of the aforementioned
  setting.

* Adjust 'type' and 'os' on the U-boot fitimage its script so that
  mkimage/dumpimage can recognize them.

* Move the deployment of the u-boot-spl-nodtb files outside of
  concat_spl_dtb_helper(), so that we can better isolate the scenarios
  of creating an (unsigned) U-Boot fitimage versus also signing it. This
  prevents some stale files from being deployed in the images directory.

* Remove any u-boot-fitImage and u-boot-its files from build tree, in
  case the build tree is being reused across bitbake calls.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 meta/classes/uboot-sign.bbclass          | 41 +++++++++++++-----------
 meta/lib/oeqa/selftest/cases/fitimage.py |  4 +--
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 5f1750fdcc..85304d452e 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -142,19 +142,12 @@ concat_spl_dtb_helper() {
 	# We only deploy symlinks to the u-boot-spl.dtb,as the KERNEL_PN will
 	# be responsible for deploying the real file
 	if [ -e "${SPL_DIR}/${SPL_DTB_BINARY}" ] ; then
-		deployed_spl_dtb_binary='${DEPLOY_DIR_IMAGE}/${SPL_DTB_IMAGE}'
 		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_SYMLINK}
 		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_BINARY}
 	fi
 
-	if [ -f "${SPL_DIR}/${SPL_NODTB_BINARY}" ] ; then
-		echo "Copying u-boot-nodtb binary..."
-		install -m 0644 ${SPL_DIR}/${SPL_NODTB_BINARY} ${DEPLOYDIR}/${SPL_NODTB_IMAGE}
-		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_SYMLINK}
-		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_BINARY}
-	fi
-
 	# Concatenate the SPL nodtb binary and u-boot.dtb
+	deployed_spl_dtb_binary='${DEPLOY_DIR_IMAGE}/${SPL_DTB_IMAGE}'
 	if [ -e "${DEPLOYDIR}/${SPL_NODTB_IMAGE}" -a -e "$deployed_spl_dtb_binary" ] ; then
 		cd ${DEPLOYDIR}
 		cat ${SPL_NODTB_IMAGE} $deployed_spl_dtb_binary | tee ${B}/${CONFIG_B_PATH}/${SPL_BINARY} > ${SPL_IMAGE}
@@ -343,8 +336,8 @@ uboot_fitimage_assemble() {
         uboot {
             description = "U-Boot image";
             data = /incbin/("${uboot_nodtb_bin}");
-            type = "uboot";
-            os = "U-Boot";
+            type = "standalone";
+            os = "u-boot";
             arch = "${UBOOT_ARCH}";
             compression = "none";
             load = <${UBOOT_LOADADDRESS}>;
@@ -438,6 +431,7 @@ do_uboot_assemble_fitimage() {
 		# do_assemble_fitimage task
 		cp -P ${STAGING_DATADIR}/u-boot-spl*.dtb ${B}
 		cp -P ${STAGING_DATADIR}/u-boot-nodtb*.bin ${B}
+		rm -rf ${B}/u-boot-fitImage-* ${B}/u-boot-its-*
 		kernel_uboot_fitimage_name=`basename ${STAGING_DATADIR}/u-boot-fitImage-*`
 		kernel_uboot_its_name=`basename ${STAGING_DATADIR}/u-boot-its-*`
 		cd ${B}
@@ -453,19 +447,30 @@ do_deploy_prepend_pn-${UBOOT_PN}() {
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
 		concat_dtb
 	fi
-	if [ "${SPL_SIGN_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ] ; then
-		concat_spl_dtb
-	fi
 
-	# We only deploy the symlinks to the uboot-fitImage and uboot-its
-	# images, as the KERNEL_PN will take care of deploying the real file
 	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" ] ; then
+	# Deploy the u-boot-nodtb binary and symlinks...
+		if [ -f "${SPL_DIR}/${SPL_NODTB_BINARY}" ] ; then
+			echo "Copying u-boot-nodtb binary..."
+			install -m 0644 ${SPL_DIR}/${SPL_NODTB_BINARY} ${DEPLOYDIR}/${SPL_NODTB_IMAGE}
+			ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_SYMLINK}
+			ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_BINARY}
+		fi
+
+
+		# We only deploy the symlinks to the uboot-fitImage and uboot-its
+		# images, as the KERNEL_PN will take care of deploying the real file
 		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_BINARY}
 		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_SYMLINK}
 		ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS}
 		ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS_SYMLINK}
 	fi
 
+	if [ "${SPL_SIGN_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ] ; then
+		concat_spl_dtb
+	fi
+
+
 }
 
 python () {
@@ -487,9 +492,7 @@ python () {
         # If the Kernel fitImage is being signed, we need to
         # create the U-Boot fitImage after it
         if d.getVar('UBOOT_SIGN_ENABLE') == '1':
-            if d.getVar('INITRAMFS_IMAGE_BUNDLE') == "1":
-                d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' %s:do_assemble_fitimage_initramfs' % d.getVar('KERNEL_PN'))
-            else:
-                d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' %s:do_assemble_fitimage' % d.getVar('KERNEL_PN'))
+            d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' %s:do_assemble_fitimage' % d.getVar('KERNEL_PN'))
+            d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' %s:do_assemble_fitimage_initramfs' % d.getVar('KERNEL_PN'))
 
 }
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index b911fded74..815ee48c05 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -293,7 +293,7 @@ FIT_SIGN_INDIVIDUAL = "1"
         # different architectures.
         its_field_check = [
             'description = "A model description";',
-            'type = "uboot";',
+            'type = "standalone";',
             'load = <0x80080000>;',
             'entry = <0x80080000>;',
             'default = "conf";',
@@ -376,7 +376,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
         # different architectures.
         its_field_check = [
             'description = "A model description";',
-            'type = "uboot";',
+            'type = "standalone";',
             'load = <0x80080000>;',
             'entry = <0x80080000>;',
             'default = "conf";',
-- 
2.25.1

