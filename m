Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA3255039D
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 11:06:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ95X1NCTz3bvW
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 19:06:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Phpa+fx3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=39jstyggkb-8urmzuxfnxffxcv.tfdfgvesdtczjkj.fqcrsj.fix@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Phpa+fx3;
	dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQ91z1CYKz3cCN
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2022 19:03:50 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id u6-20020a63d346000000b00407d7652203so3303640pgi.18
        for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2022 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LMIQNnZEwwqGiSeXz8z/8RKfV/iWOQOCuFlB8bYEhsE=;
        b=Phpa+fx39/Nb7dSVBjcwGd88U21xdp1E3aulagrvdP4DYKWTek3bM15WKB6xgv72wX
         a9rfRLI0tk0hhMl3FQHPWCb7CK5kfbUeyK41fYYM91FwzBz1aRnY7y1wNdei0fwUtGeI
         Y3P3T8SYRo2OiftnpYJaZzfkfCaAgw+Gm4zXoV5BZ8ujPhjXF+vJ7PHNXTFjt5kzxSUU
         QtVklWuHQKH0PylESH86mof6JR2T1eu18CSDJ2dX/uhV/RffzXzEsftvVWvj2Yi1YQMm
         5w65IJ0WhFpZtb7N9Mbszfpcxd1myHfvhxktyQRa1rXthwrfQjG3Rkk5hB/ReuFf+Tf2
         wO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LMIQNnZEwwqGiSeXz8z/8RKfV/iWOQOCuFlB8bYEhsE=;
        b=fyuXRedBMkEGc6rVO9/3mnwDyhMrtnRPon9GihZvb9PihPWOCBnWgY8Mh9oqPt8pk1
         S25SP7WskqAEcblkFcH+O7VpPeciLgsC4+zmBqxSJnjf+7Yn15YP67xXrfcHjZD7GAWd
         ZeQxEpNOmpFYYuOD+N0kA3tYFlVqASpz86enFhkhNAl2KnGgqr8Oh1LqbREHKbLL8X+7
         o1mpaLhQeWBLWT0BoPoZGpXk1aJMzcZ2KwrPZRAl+tEGzYHYAC2TCZnIDQug0AkkPCRL
         IIMkK2mI3hm7tSyqZJHqR2efwFvMTfv4W1jpnP5nKZxP73Of00Zta4NHmfgs+zgyDvmS
         92ew==
X-Gm-Message-State: AJIora92E+HmX8hWBoMqYf3atKPgNY3qNmdi/M8rkxSeqR3fK4Vs8X4E
	TRxGsw6u92NZ48DR2ZGlnPXLsD/QRWf2QQ==
X-Google-Smtp-Source: AGRyM1uHmQxNnvKsRYmQgfAR+LylxXOrPWxsvi5RkRWzjMVI7YEH1yKl6XQnHFmjJ8zObEZziHkt0BPy1E0UGw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6a00:21c8:b0:4c4:4bd:dc17 with SMTP
 id t8-20020a056a0021c800b004c404bddc17mr14303884pfj.57.1655543028691; Sat, 18
 Jun 2022 02:03:48 -0700 (PDT)
Date: Sat, 18 Jun 2022 17:03:09 +0800
In-Reply-To: <20220618090310.1174932-1-davidgow@google.com>
Message-Id: <20220618090310.1174932-5-davidgow@google.com>
Mime-Version: 1.0
References: <20220618090310.1174932-1-davidgow@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 4/5] nitro_enclaves: test: Use kunit_test_suite() macro
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Daniel Latypov <dlatypov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andra Paraschiv <andraprs@amazon.com>, 
	Longpeng <longpeng2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Gow <davidgow@google.com>, linux-aspeed@lists.ozlabs.org, =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The kunit_test_suite() macro previously conflicted with module_init,
making it unsuitable for use in the nitro_enclaves test. Now that it's
fixed, we can use it instead of a custom call into internal KUnit
functions to run the test.

As a side-effect, this means that the test results are properly included
with other suites when built-in. To celebrate, enable the test by
default when KUNIT_ALL_TESTS is set (and NITRO_ENCLAVES enabled).

The nitro_enclave tests can now be run via kunit_tool with:
	./tools/testing/kunit/kunit.py run --arch=x86_64 \
	--kconfig_add CONFIG_PCI=y --kconfig_add CONFIG_SMP=y \
	--kconfig_add CONFIG_HOTPLUG_CPU=y \
	--kconfig_add CONFIG_VIRT_DRIVERS=y \
	--kconfig_add CONFIG_NITRO_ENCLAVES=y \
	'ne_misc_dev_test'

(This is a pretty long command, so it may be worth adding a .kunitconfig
file at some point, instead.)

Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/thunderbolt/Kconfig                   |  5 ++--
 drivers/virt/nitro_enclaves/Kconfig           |  5 ++--
 drivers/virt/nitro_enclaves/ne_misc_dev.c     | 27 -------------------
 .../virt/nitro_enclaves/ne_misc_dev_test.c    |  5 +---
 4 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 4bfec8a28064..2a063d344b94 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -28,8 +28,9 @@ config USB4_DEBUGFS_WRITE
 	  this for production systems or distro kernels.
 
 config USB4_KUNIT_TEST
-	bool "KUnit tests"
-	depends on KUNIT=y
+	bool "KUnit tests" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
 
 config USB4_DMA_TEST
 	tristate "DMA traffic test driver"
diff --git a/drivers/virt/nitro_enclaves/Kconfig b/drivers/virt/nitro_enclaves/Kconfig
index 2d3d98158121..ce91add81401 100644
--- a/drivers/virt/nitro_enclaves/Kconfig
+++ b/drivers/virt/nitro_enclaves/Kconfig
@@ -16,8 +16,9 @@ config NITRO_ENCLAVES
 	  The module will be called nitro_enclaves.
 
 config NITRO_ENCLAVES_MISC_DEV_TEST
-	bool "Tests for the misc device functionality of the Nitro Enclaves"
-	depends on NITRO_ENCLAVES && KUNIT=y
+	bool "Tests for the misc device functionality of the Nitro Enclaves" if !KUNIT_ALL_TESTS
+	depends on NITRO_ENCLAVES && KUNIT
+	default KUNIT_ALL_TESTS
 	help
 	  Enable KUnit tests for the misc device functionality of the Nitro
 	  Enclaves. Select this option only if you will boot the kernel for
diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 20c881b6a4b6..241b94f62e56 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -1759,35 +1759,10 @@ static long ne_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 #if defined(CONFIG_NITRO_ENCLAVES_MISC_DEV_TEST)
 #include "ne_misc_dev_test.c"
-
-static inline int ne_misc_dev_test_init(void)
-{
-	return __kunit_test_suites_init(ne_misc_dev_test_suites);
-}
-
-static inline void ne_misc_dev_test_exit(void)
-{
-	__kunit_test_suites_exit(ne_misc_dev_test_suites);
-}
-#else
-static inline int ne_misc_dev_test_init(void)
-{
-	return 0;
-}
-
-static inline void ne_misc_dev_test_exit(void)
-{
-}
 #endif
 
 static int __init ne_init(void)
 {
-	int rc = 0;
-
-	rc = ne_misc_dev_test_init();
-	if (rc < 0)
-		return rc;
-
 	mutex_init(&ne_cpu_pool.mutex);
 
 	return pci_register_driver(&ne_pci_driver);
@@ -1798,8 +1773,6 @@ static void __exit ne_exit(void)
 	pci_unregister_driver(&ne_pci_driver);
 
 	ne_teardown_cpu_pool();
-
-	ne_misc_dev_test_exit();
 }
 
 module_init(ne_init);
diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev_test.c b/drivers/virt/nitro_enclaves/ne_misc_dev_test.c
index 265797bed0ea..74df43b925be 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev_test.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev_test.c
@@ -151,7 +151,4 @@ static struct kunit_suite ne_misc_dev_test_suite = {
 	.test_cases = ne_misc_dev_test_cases,
 };
 
-static struct kunit_suite *ne_misc_dev_test_suites[] = {
-	&ne_misc_dev_test_suite,
-	NULL
-};
+kunit_test_suite(ne_misc_dev_test_suite);
-- 
2.36.1.476.g0c4daa206d-goog

