Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 638BF55A722
	for <lists+openbmc@lfdr.de>; Sat, 25 Jun 2022 07:11:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVMY029nRz3ch4
	for <lists+openbmc@lfdr.de>; Sat, 25 Jun 2022 15:11:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kEbHA6Ve;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=305i2yggkb_ofcxkfiqyiqqing.eqoqrgpdoenkuvu.q1ncdu.qti@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kEbHA6Ve;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVMWp5C0yz3c87
	for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2022 15:10:46 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id z188-20020a2565c5000000b0066c086258ddso2848912ybb.9
        for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2022 22:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=vrjZekKBybPl/drx0oLqOH79U/y2dy8euPYI76X69ME=;
        b=kEbHA6VeUQla5W6034Rg8coOQxVxBzPZzFXk3CpNJfQ/QS8JAU39CFSWQ0JQL95P9n
         q8nSPy8mB7Ujdv8IhmhD7LZR81D+tj/P19bx3ZVzT6i2VsqY0U5qbdMxDDcnJPN7xVGm
         fb9p13aYbt8Sx+kxyTRdn3dBl2zrcGZ1gYYadx1S8UeqGLN+JtNvTjPG4EApZ5qgQkbc
         A3SX334PUv5H+3V5AFjIjoghU5RpwbpL+JFg0bvui8TbuRAf69GxXK+EaTuRKoIO9ncE
         K9gMTvSttjBE0btTiCl7q25ec6gSIedgOILmGT0AKBNEaZrrSi2pGK73wzTg75AxPMFX
         eTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=vrjZekKBybPl/drx0oLqOH79U/y2dy8euPYI76X69ME=;
        b=YO2feF9q9ncHyszC/UfnzRevwWA3OMXP4CExuA/1z+9jY6d/nSoTq1s+oyX2NzHwx2
         WU9LtLlBZ5NYYhq6s6joiOLMGk6IrI0vIxKe36+ikdSIDuqIrIY79ck+n30U5H0YH4L7
         z/ScpJ+K+jmX92FlmJMOycmyQlxR0h2vrBZXXqqXtMpPUCwuaBoNH92EGlpZU9AZcMpZ
         1w0f4iaRKPM1whwrER1Y/G64Fu18xZ8OpJBUVws01IOabv/raP4gsRZnNIcxO1C9Htqt
         njipdoY6WdnqYBP1qDXiC4tsiqHAMoFRogkG8l03McewfL3XDrP3+IwhgbH2j2Vi0QHm
         S2CQ==
X-Gm-Message-State: AJIora81GbGZCEnahdI8Fu3srFEaCQpmjtyOwd9rvaj1uSh2c2ikcjUL
	YLz4D+418yKYV7U3PvEXKcqP6td9tvfkRw==
X-Google-Smtp-Source: AGRyM1uJnVtv6429gNEgQta4nIHvXYCSqUn3YbcYRmR8hIyXQqEzF+cOo4YMUekXPjSXwP+imECz4RQUQv6OfA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:3cc4:0:b0:668:af4d:310b with SMTP id
 j187-20020a253cc4000000b00668af4d310bmr2505700yba.487.1656133843887; Fri, 24
 Jun 2022 22:10:43 -0700 (PDT)
Date: Sat, 25 Jun 2022 13:08:35 +0800
In-Reply-To: <20220625050838.1618469-1-davidgow@google.com>
Message-Id: <20220625050838.1618469-2-davidgow@google.com>
Mime-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 1/5] kunit: unify module and builtin suite definitions
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Daniel Latypov <dlatypov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andra Paraschiv <andraprs@amazon.com>, 
	Longpeng <longpeng2@huawei.com>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

From: Jeremy Kerr <jk@codeconstruct.com.au>

Currently, KUnit runs built-in tests and tests loaded from modules
differently. For built-in tests, the kunit_test_suite{,s}() macro adds a
list of suites in the .kunit_test_suites linker section. However, for
kernel modules, a module_init() function is used to run the test suites.

This causes problems if tests are included in a module which already
defines module_init/exit_module functions, as they'll conflict with the
kunit-provided ones.

This change removes the kunit-defined module inits, and instead parses
the kunit tests from their own section in the module. After module init,
we call __kunit_test_suites_init() on the contents of that section,
which prepares and runs the suite.

This essentially unifies the module- and non-module kunit init formats.

Tested-by: Ma=C3=ADra Canal <maira.canal@usp.br>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Signed-off-by: Daniel Latypov <dlatypov@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

No changes to this patch since v2:
https://lore.kernel.org/linux-kselftest/20220621085345.603820-2-davidgow@go=
ogle.com/

Changes since v1:
https://lore.kernel.org/linux-kselftest/20220618090310.1174932-2-davidgow@g=
oogle.com/
- Fix a compile error with CONFIG_KUNIT=3Dm (Thanks Christophe Leroy,
  kernel test robot)
- Add Ma=C3=ADra's Tested-by.

Changes since RFC:
https://lore.kernel.org/linux-kselftest/101d12fc9250b7a445ff50a9e7a25cd74d0=
e16eb.camel@codeconstruct.com.au/
- I've basically just rebased it, tweaked some wording, and it made it
still compile when CONFIG_MODULES is not set.

---
 include/kunit/test.h   | 47 ++++----------------------------------
 include/linux/module.h |  5 ++++
 kernel/module/main.c   |  6 +++++
 lib/kunit/test.c       | 52 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 67 insertions(+), 43 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 8ffcd7de9607..54306271cfbf 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -250,41 +250,8 @@ static inline int kunit_run_all_tests(void)
 }
 #endif /* IS_BUILTIN(CONFIG_KUNIT) */
=20
-#ifdef MODULE
-/**
- * kunit_test_suites_for_module() - used to register one or more
- *			 &struct kunit_suite with KUnit.
- *
- * @__suites: a statically allocated list of &struct kunit_suite.
- *
- * Registers @__suites with the test framework. See &struct kunit_suite fo=
r
- * more information.
- *
- * If a test suite is built-in, module_init() gets translated into
- * an initcall which we don't want as the idea is that for builtins
- * the executor will manage execution.  So ensure we do not define
- * module_{init|exit} functions for the builtin case when registering
- * suites via kunit_test_suites() below.
- */
-#define kunit_test_suites_for_module(__suites)				\
-	static int __init kunit_test_suites_init(void)			\
-	{								\
-		return __kunit_test_suites_init(__suites);		\
-	}								\
-	module_init(kunit_test_suites_init);				\
-									\
-	static void __exit kunit_test_suites_exit(void)			\
-	{								\
-		return __kunit_test_suites_exit(__suites);		\
-	}								\
-	module_exit(kunit_test_suites_exit)
-#else
-#define kunit_test_suites_for_module(__suites)
-#endif /* MODULE */
-
 #define __kunit_test_suites(unique_array, unique_suites, ...)		       \
 	static struct kunit_suite *unique_array[] =3D { __VA_ARGS__, NULL };     =
\
-	kunit_test_suites_for_module(unique_array);			       \
 	static struct kunit_suite **unique_suites			       \
 	__used __section(".kunit_test_suites") =3D unique_array
=20
@@ -294,16 +261,12 @@ static inline int kunit_run_all_tests(void)
  *
  * @__suites: a statically allocated list of &struct kunit_suite.
  *
- * Registers @suites with the test framework. See &struct kunit_suite for
- * more information.
- *
- * When builtin,  KUnit tests are all run via executor; this is done
- * by placing the array of struct kunit_suite * in the .kunit_test_suites
- * ELF section.
+ * Registers @suites with the test framework.
+ * This is done by placing the array of struct kunit_suite * in the
+ * .kunit_test_suites ELF section.
  *
- * An alternative is to build the tests as a module.  Because modules do n=
ot
- * support multiple initcall()s, we need to initialize an array of suites =
for a
- * module.
+ * When builtin, KUnit tests are all run via the executor at boot, and whe=
n
+ * built as a module, they run on module load.
  *
  */
 #define kunit_test_suites(__suites...)						\
diff --git a/include/linux/module.h b/include/linux/module.h
index abd9fa916b7d..2490223c975d 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -505,6 +505,11 @@ struct module {
 	int num_static_call_sites;
 	struct static_call_site *static_call_sites;
 #endif
+#if IS_ENABLED(CONFIG_KUNIT)
+	int num_kunit_suites;
+	struct kunit_suite ***kunit_suites;
+#endif
+
=20
 #ifdef CONFIG_LIVEPATCH
 	bool klp; /* Is this a livepatch module? */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index fed58d30725d..4542db7cdf54 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2087,6 +2087,12 @@ static int find_module_sections(struct module *mod, =
struct load_info *info)
 					      sizeof(*mod->static_call_sites),
 					      &mod->num_static_call_sites);
 #endif
+#ifdef CONFIG_KUNIT
+	mod->kunit_suites =3D section_objs(info, ".kunit_test_suites",
+					      sizeof(*mod->kunit_suites),
+					      &mod->num_kunit_suites);
+#endif
+
 	mod->extable =3D section_objs(info, "__ex_table",
 				    sizeof(*mod->extable), &mod->num_exentries);
=20
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index a5053a07409f..3052526b9b89 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -10,6 +10,7 @@
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/sched/debug.h>
 #include <linux/sched.h>
@@ -609,6 +610,49 @@ void __kunit_test_suites_exit(struct kunit_suite **sui=
tes)
 }
 EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
=20
+#ifdef CONFIG_MODULES
+static void kunit_module_init(struct module *mod)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < mod->num_kunit_suites; i++)
+		__kunit_test_suites_init(mod->kunit_suites[i]);
+}
+
+static void kunit_module_exit(struct module *mod)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < mod->num_kunit_suites; i++)
+		__kunit_test_suites_exit(mod->kunit_suites[i]);
+}
+
+static int kunit_module_notify(struct notifier_block *nb, unsigned long va=
l,
+			       void *data)
+{
+	struct module *mod =3D data;
+
+	switch (val) {
+	case MODULE_STATE_LIVE:
+		kunit_module_init(mod);
+		break;
+	case MODULE_STATE_GOING:
+		kunit_module_exit(mod);
+		break;
+	case MODULE_STATE_COMING:
+	case MODULE_STATE_UNFORMED:
+		break;
+	}
+
+	return 0;
+}
+
+static struct notifier_block kunit_mod_nb =3D {
+	.notifier_call =3D kunit_module_notify,
+	.priority =3D 0,
+};
+#endif
+
 struct kunit_kmalloc_array_params {
 	size_t n;
 	size_t size;
@@ -703,13 +747,19 @@ EXPORT_SYMBOL_GPL(kunit_cleanup);
 static int __init kunit_init(void)
 {
 	kunit_debugfs_init();
-
+#ifdef CONFIG_MODULES
+	return register_module_notifier(&kunit_mod_nb);
+#else
 	return 0;
+#endif
 }
 late_initcall(kunit_init);
=20
 static void __exit kunit_exit(void)
 {
+#ifdef CONFIG_MODULES
+	unregister_module_notifier(&kunit_mod_nb);
+#endif
 	kunit_debugfs_cleanup();
 }
 module_exit(kunit_exit);
--=20
2.37.0.rc0.161.g10f37bed90-goog

