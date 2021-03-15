Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F67933C314
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 18:00:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzjNg3HbMz30By
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 04:00:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O+QpQTYX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O+QpQTYX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzjLK0hClz3034
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 03:58:48 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGXq31125704; Mon, 15 Mar 2021 12:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eQp685R8YXm1Umk7zUeyNvKo8hNi1VWF+TCQwBNo+t4=;
 b=O+QpQTYXpaHl/NpZnY1Z68SbxxkCVaxutGuTyBLIke73zq9t38zGqQBndtG/HfQ9W96X
 C2dvbWTuhY/xyNrvJFgphc2fqPt2wuElgSzWe04dn/MfEapZQkd2/vw3FNMWt9vLKMtV
 Y5YU3aeQObRf4oKV1AUjR5HoJHFGc6iyPmuPIFmJCu/7n65MvRxMxqCV2BRaTpGMsUig
 mMiXEK5BBxsjqKBll71LLK/69AmYOfOMUk2c2Y1hO3Zce+tzdE42J+dENQAc+m44OJwA
 Vm859oOnM08LxC77aT83pIgbzCzQ8+VaTovyRVItA8aiNdzsNnlBoTP5mD8k28V/98LB 4g== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37a9qpmp7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:58:43 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FGkSPD012849;
 Mon, 15 Mar 2021 16:58:43 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 37a6t32cky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:58:43 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGwgKc8979106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:58:42 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 587C8AC05E;
 Mon, 15 Mar 2021 16:58:42 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D295AC059;
 Mon, 15 Mar 2021 16:58:41 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.168.62])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:58:40 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] oe-selftest: Add U-Boot fitImage signing testcases
Date: Mon, 15 Mar 2021 13:58:06 -0300
Message-Id: <20210315165806.1633-5-klaus@linux.vnet.ibm.com>
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
 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 adultscore=0 phishscore=0
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

Derived from the similar kernel fitImage sign testcase, the U-Boot
fitImage testcases will test both the standalone (only SPL_SIGN_ENABLE
set) as well as cascaded (both UBOOT_SIGN_ENABLE as well as
SPL_SIGN_ENABLE) scenarios.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 293 +++++++++++++++++++++++
 1 file changed, 293 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 02692de822..ece1ad460b 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -231,6 +231,299 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         result = runCmd('grep "### uboot-mkimage signing wrapper message" %s/log.do_assemble_fitimage' % tempdir, ignore_status=True)
         self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN did not work')
 
+    def test_sign_standalone_uboot_fit_image(self):
+        """
+        Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
+                     created and signed correctly for the scenario where only
+                     the U-Boot proper fitImage is being signed.
+        Expected:    1) U-Boot its and FIT image are built successfully
+                     2) Scanning the its file indicates signing is enabled
+                        as requested by SPL_SIGN_ENABLE (using keys generated
+                        via UBOOT_FIT_GENERATE_KEYS)
+                     3) Dumping the FIT image indicates signature values
+                        are present
+                     4) Examination of the do_uboot_assemble_fitimage
+                     runfile/logfile indicate that UBOOT_MKIMAGE, UBOOT_MKIMAGE_SIGN
+                     and SPL_MKIMAGE_SIGN_ARGS are working as expected.
+        Product:     oe-core
+        Author:      Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com> based upon
+                     work by Paul Eggleton <paul.eggleton@microsoft.com> and
+                     Usama Arif <usama.arif@arm.com>
+        """
+        config = """
+# There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
+# least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
+MACHINE = "beaglebone-yocto"
+UBOOT_MACHINE = "am57xx_evm_defconfig"
+USER_CLASSES = " test-mkimage-wrapper "
+SPL_SIGN_ENABLE = "1"
+SPL_SIGN_KEYNAME = "spl-oe-selftest"
+SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
+UBOOT_DTB_BINARY = "u-boot.dtb"
+UBOOT_ENTRYPOINT  = "0x80000000"
+UBOOT_LOADADDRESS = "0x80000000"
+UBOOT_DTB_LOADADDRESS = "0x82000000"
+UBOOT_ARCH = "arm"
+SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
+UBOOT_EXTLINUX = "0"
+UBOOT_FIT_GENERATE_KEYS = "1"
+UBOOT_FIT_HASH_ALG = "sha256"
+"""
+        self.write_config(config)
+
+        # this scenario exercises standalone u-boot fitImage sign
+        bitbake("u-boot")
+
+        image_type = "core-image-minimal"
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        machine = get_bb_var('MACHINE')
+        fitimage_its_path = os.path.join(deploy_dir_image,
+            "u-boot-its-%s" % (machine,))
+        fitimage_path = os.path.join(deploy_dir_image,
+            "u-boot-fitImage-%s" % (machine,))
+
+        self.assertTrue(os.path.exists(fitimage_its_path),
+            "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertTrue(os.path.exists(fitimage_path),
+            "%s FIT image doesn't exist" % (fitimage_path))
+
+        req_itspaths = [
+            ['/', 'images', 'uboot'],
+            ['/', 'images', 'uboot', 'signature'],
+            ['/', 'images', 'fdt'],
+            ['/', 'images', 'fdt', 'signature'],
+        ]
+
+        itspath = []
+        itspaths = []
+        linect = 0
+        sigs = {}
+        with open(fitimage_its_path) as its_file:
+            linect += 1
+            for line in its_file:
+                line = line.strip()
+                if line.endswith('};'):
+                    itspath.pop()
+                elif line.endswith('{'):
+                    itspath.append(line[:-1].strip())
+                    itspaths.append(itspath[:])
+                elif itspath and itspath[-1] == 'signature':
+                    itsdotpath = '.'.join(itspath)
+                    if not itsdotpath in sigs:
+                        sigs[itsdotpath] = {}
+                    if not '=' in line or not line.endswith(';'):
+                        self.fail('Unexpected formatting in %s sigs section line %d:%s' % (fitimage_its_path, linect, line))
+                    key, value = line.split('=', 1)
+                    sigs[itsdotpath][key.rstrip()] = value.lstrip().rstrip(';')
+
+        for reqpath in req_itspaths:
+            if not reqpath in itspaths:
+                self.fail('Missing section in its file: %s' % reqpath)
+
+        reqsigvalues_image = {
+            'algo': '"sha256,rsa2048"',
+            'key-name-hint': '"spl-oe-selftest"',
+        }
+
+        for itspath, values in sigs.items():
+            reqsigvalues = reqsigvalues_image
+            for reqkey, reqvalue in reqsigvalues.items():
+                value = values.get(reqkey, None)
+                if value is None:
+                    self.fail('Missing key "%s" in its file signature section %s' % (reqkey, itspath))
+                self.assertEqual(value, reqvalue)
+
+        # Dump the image to see if it really got signed
+        bitbake("u-boot-tools-native -c addto_recipe_sysroot")
+        result = runCmd('bitbake -e u-boot-tools-native | grep ^RECIPE_SYSROOT_NATIVE=')
+        recipe_sysroot_native = result.output.split('=')[1].strip('"')
+        dumpimage_path = os.path.join(recipe_sysroot_native, 'usr', 'bin', 'dumpimage')
+        result = runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
+        in_signed = None
+        signed_sections = {}
+        for line in result.output.splitlines():
+            if line.startswith((' Image')):
+                in_signed = re.search('\((.*)\)', line).groups()[0]
+            elif re.match(' \w', line):
+                in_signed = None
+            elif in_signed:
+                if not in_signed in signed_sections:
+                    signed_sections[in_signed] = {}
+                key, value = line.split(':', 1)
+                signed_sections[in_signed][key.strip()] = value.strip()
+        self.assertIn('uboot', signed_sections)
+        self.assertIn('fdt', signed_sections)
+        for signed_section, values in signed_sections.items():
+            value = values.get('Sign algo', None)
+            self.assertEqual(value, 'sha256,rsa2048:spl-oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
+            value = values.get('Sign value', None)
+            self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
+
+        # Check for SPL_MKIMAGE_SIGN_ARGS
+        result = runCmd('bitbake -e u-boot | grep ^T=')
+        tempdir = result.output.split('=', 1)[1].strip().strip('')
+        result = runCmd('grep "a smart U-Boot comment" %s/run.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
+        self.assertEqual(result.status, 0, 'SPL_MKIMAGE_SIGN_ARGS value did not get used')
+
+        # Check for evidence of test-mkimage-wrapper class
+        result = runCmd('grep "### uboot-mkimage wrapper message" %s/log.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
+        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE did not work')
+        result = runCmd('grep "### uboot-mkimage signing wrapper message" %s/log.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
+        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN did not work')
+
+    def test_sign_cascaded_uboot_fit_image(self):
+        """
+        Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
+                     created and signed correctly for the scenario where only
+                     both U-Boot proper and Kernel fitImages are being signed.
+        Expected:    1) U-Boot its and FIT image are built successfully
+                     2) Scanning the its file indicates signing is enabled
+                        as requested by SPL_SIGN_ENABLE (using keys generated
+                        via UBOOT_FIT_GENERATE_KEYS)
+                     3) Dumping the FIT image indicates signature values
+                        are present
+                     4) Examination of the do_uboot_assemble_fitimage
+                     runfile/logfile indicate that UBOOT_MKIMAGE, UBOOT_MKIMAGE_SIGN
+                     and SPL_MKIMAGE_SIGN_ARGS are working as expected.
+        Product:     oe-core
+        Author:      Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com> based upon
+                     work by Paul Eggleton <paul.eggleton@microsoft.com> and
+                     Usama Arif <usama.arif@arm.com>
+        """
+        config = """
+# There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
+# least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
+MACHINE = "beaglebone-yocto"
+UBOOT_MACHINE = "am57xx_evm_defconfig"
+SPL_SIGN_ENABLE = "1"
+SPL_SIGN_KEYNAME = "spl-cascaded-oe-selftest"
+SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
+UBOOT_DTB_BINARY = "u-boot.dtb"
+UBOOT_ENTRYPOINT  = "0x80000000"
+UBOOT_LOADADDRESS = "0x80000000"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart cascaded Kernel comment'"
+UBOOT_DTB_LOADADDRESS = "0x82000000"
+UBOOT_ARCH = "arm"
+SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart cascaded U-Boot comment'"
+UBOOT_EXTLINUX = "0"
+UBOOT_FIT_GENERATE_KEYS = "1"
+UBOOT_FIT_HASH_ALG = "sha256"
+KERNEL_IMAGETYPES += " fitImage "
+KERNEL_CLASSES = " kernel-fitimage test-mkimage-wrapper "
+UBOOT_SIGN_ENABLE = "1"
+FIT_GENERATE_KEYS = "1"
+UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
+UBOOT_SIGN_KEYNAME = "kernel-oe-selftest"
+FIT_SIGN_INDIVIDUAL = "1"
+"""
+        self.write_config(config)
+
+        # this scenario exercises a cascading (i.e., Kernel + u-boot)
+        # fitImage sign
+        bitbake("u-boot")
+
+        image_type = "core-image-minimal"
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        machine = get_bb_var('MACHINE')
+        fitimage_its_path = os.path.join(deploy_dir_image,
+            "u-boot-its-%s" % (machine,))
+        fitimage_path = os.path.join(deploy_dir_image,
+            "u-boot-fitImage-%s" % (machine,))
+
+        self.assertTrue(os.path.exists(fitimage_its_path),
+            "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertTrue(os.path.exists(fitimage_path),
+            "%s FIT image doesn't exist" % (fitimage_path))
+
+        req_itspaths = [
+            ['/', 'images', 'uboot'],
+            ['/', 'images', 'uboot', 'signature'],
+            ['/', 'images', 'fdt'],
+            ['/', 'images', 'fdt', 'signature'],
+        ]
+
+        itspath = []
+        itspaths = []
+        linect = 0
+        sigs = {}
+        with open(fitimage_its_path) as its_file:
+            linect += 1
+            for line in its_file:
+                line = line.strip()
+                if line.endswith('};'):
+                    itspath.pop()
+                elif line.endswith('{'):
+                    itspath.append(line[:-1].strip())
+                    itspaths.append(itspath[:])
+                elif itspath and itspath[-1] == 'signature':
+                    itsdotpath = '.'.join(itspath)
+                    if not itsdotpath in sigs:
+                        sigs[itsdotpath] = {}
+                    if not '=' in line or not line.endswith(';'):
+                        self.fail('Unexpected formatting in %s sigs section line %d:%s' % (fitimage_its_path, linect, line))
+                    key, value = line.split('=', 1)
+                    sigs[itsdotpath][key.rstrip()] = value.lstrip().rstrip(';')
+
+        for reqpath in req_itspaths:
+            if not reqpath in itspaths:
+                self.fail('Missing section in its file: %s' % reqpath)
+
+        reqsigvalues_image = {
+            'algo': '"sha256,rsa2048"',
+            'key-name-hint': '"spl-cascaded-oe-selftest"',
+        }
+
+        for itspath, values in sigs.items():
+            reqsigvalues = reqsigvalues_image
+            for reqkey, reqvalue in reqsigvalues.items():
+                value = values.get(reqkey, None)
+                if value is None:
+                    self.fail('Missing key "%s" in its file signature section %s' % (reqkey, itspath))
+                self.assertEqual(value, reqvalue)
+
+        # Dump the image to see if it really got signed
+        bitbake("u-boot-tools-native -c addto_recipe_sysroot")
+        result = runCmd('bitbake -e u-boot-tools-native | grep ^RECIPE_SYSROOT_NATIVE=')
+        recipe_sysroot_native = result.output.split('=')[1].strip('"')
+        dumpimage_path = os.path.join(recipe_sysroot_native, 'usr', 'bin', 'dumpimage')
+        result = runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
+        in_signed = None
+        signed_sections = {}
+        for line in result.output.splitlines():
+            if line.startswith((' Image')):
+                in_signed = re.search('\((.*)\)', line).groups()[0]
+            elif re.match(' \w', line):
+                in_signed = None
+            elif in_signed:
+                if not in_signed in signed_sections:
+                    signed_sections[in_signed] = {}
+                key, value = line.split(':', 1)
+                signed_sections[in_signed][key.strip()] = value.strip()
+        self.assertIn('uboot', signed_sections)
+        self.assertIn('fdt', signed_sections)
+        for signed_section, values in signed_sections.items():
+            value = values.get('Sign algo', None)
+            self.assertEqual(value, 'sha256,rsa2048:spl-cascaded-oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
+            value = values.get('Sign value', None)
+            self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
+
+        # Check for SPL_MKIMAGE_SIGN_ARGS
+        result = runCmd('bitbake -e virtual/kernel | grep ^T=')
+        tempdir = result.output.split('=', 1)[1].strip().strip('')
+        result = runCmd('grep "a smart cascaded U-Boot comment" %s/run.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
+        self.assertEqual(result.status, 0, 'SPL_MKIMAGE_SIGN_ARGS value did not get used')
+
+        # Check for evidence of test-mkimage-wrapper class
+        result = runCmd('grep "### uboot-mkimage wrapper message" %s/log.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
+        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE did not work')
+        result = runCmd('grep "### uboot-mkimage signing wrapper message" %s/log.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
+        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN did not work')
+
+
+
     def test_initramfs_bundle(self):
         """
         Summary:     Verifies the content of the initramfs bundle node in the FIT Image Tree Source (its)
-- 
2.25.1

