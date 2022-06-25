Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31855A724
	for <lists+openbmc@lfdr.de>; Sat, 25 Jun 2022 07:12:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVMYn32Syz3cdF
	for <lists+openbmc@lfdr.de>; Sat, 25 Jun 2022 15:12:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TtnVKNv8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=32ji2yggkbweebwjehpxhpphmf.dpnpqfocndmjtut.p0mbct.psh@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TtnVKNv8;
	dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVMWv3Zkyz3cdh
	for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2022 15:10:50 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id m6-20020a056a00080600b00524cc7fdfc2so2042365pfk.0
        for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2022 22:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=x2F3RYLe1gcG9T30KnFyDKOa7ZvJ0Ax+SKhsoQZRT1g=;
        b=TtnVKNv8Dxh1eNJ+s69ifitwcbBdutGrx++jGwUxDTR6/S8iiNIGCekxCUlj6JH0K8
         xO8xLsUF3gWh0ED+JK3D6Sd2OWE++uKSoPp7CNm4maN2JlyIv1NR1AkMHWLXsgQuSB0W
         XUJgDZrnifrL6OtlHScmb+5IQZkcrFVcjXK9gHgZsMu1cxMEVWussvu9SSGWjDFEALLl
         8t1Y8O53V9MnYsvN/zOZHx5IE6q7ta9Y9elB17eYiGQZVNNCJJAK9RrOXZz+DAam8PXY
         T2EbvMO6RDZGCaYcFJQl64Mfyksqq2H+U4HzvcHBnols/zyIY4TZ3s25UCrESsLw0GdR
         IClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=x2F3RYLe1gcG9T30KnFyDKOa7ZvJ0Ax+SKhsoQZRT1g=;
        b=mnsjBMKsmzy+BLbfTL38ScbKg6EKe52OUh+yCUtWOuEeJZ/tRcG1Vg3RtOTOGy9wLl
         TTR0fbdS+E7XwNOoVDr57XzwN7pjjvtlAZZYs9LMi4w6ubNKZLRO7ut503QtyNjGxx3+
         voohDp7YsXV1F4Odr2M/CwdU3bU5ih4LCCMWlWtY8db0y4WkKjD/19cPObJt1ZXl1SDH
         qGo3m1YCk2sxyaRyvGydRYXnj4AJonDkDl07Lwb7hmI0Sk0Qdym5DTF2Xo/UwIAcU6O0
         3hy5KrrYUxpHhw19EWClDq1UKcRNNNMEgMTFJr0fbUVFDyCtlluUaEjRDqi76Xj4UX2Y
         6oFg==
X-Gm-Message-State: AJIora/u4Ghd2DNfGaNLDm1C362nnEm4RMnOhLOuyid8PnnSuGDSKtlD
	iLCpRoBjpmxeLy1vgTXEEeF7omoK/b1RCA==
X-Google-Smtp-Source: AGRyM1sUopUkGBRaSPatEhsSSQnnC1nd4LDJKxTpS0dlWClmNfpxspH1zmtIAPjyhuuQRadr5PwY46KS578hmA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6a00:170f:b0:525:467c:3516 with SMTP
 id h15-20020a056a00170f00b00525467c3516mr2796557pfc.22.1656133848550; Fri, 24
 Jun 2022 22:10:48 -0700 (PDT)
Date: Sat, 25 Jun 2022 13:08:36 +0800
In-Reply-To: <20220625050838.1618469-1-davidgow@google.com>
Message-Id: <20220625050838.1618469-3-davidgow@google.com>
Mime-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 2/5] kunit: flatten kunit_suite*** to kunit_suite** in .kunit_test_suites
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

From: Daniel Latypov <dlatypov@google.com>

We currently store kunit suites in the .kunit_test_suites ELF section as
a `struct kunit_suite***` (modulo some `const`s).
For every test file, we store a struct kunit_suite** NULL-terminated array.

This adds quite a bit of complexity to the test filtering code in the
executor.

Instead, let's just make the .kunit_test_suites section contain a single
giant array of struct kunit_suite pointers, which can then be directly
manipulated. This array is not NULL-terminated, and so none of the test
filtering code needs to NULL-terminate anything.

Tested-by: Ma=C3=ADra Canal <maira.canal@usp.br>
Signed-off-by: Daniel Latypov <dlatypov@google.com>
Co-developed-by: David Gow <davidgow@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

No changes to this patch since v2:
https://lore.kernel.org/linux-kselftest/20220621085345.603820-3-davidgow@go=
ogle.com/

Changes since v1:
https://lore.kernel.org/linux-kselftest/20220618090310.1174932-3-davidgow@g=
oogle.com/
- No longer NULL-terminate generated suite_sets
- Add Ma=C3=ADra's Tested-by tag.

Changes since RFC:
https://lore.kernel.org/linux-kselftest/20211013191320.2490913-1-dlatypov@g=
oogle.com/
- Actually flatten the .kunit_test_suites ELF section,
  rather than constructing the flattened version at runtime.
---
 include/kunit/test.h      |  13 ++--
 include/linux/module.h    |   2 +-
 lib/kunit/executor.c      | 115 ++++++++----------------------
 lib/kunit/executor_test.c | 144 +++++++++++---------------------------
 lib/kunit/test.c          |  18 ++---
 5 files changed, 82 insertions(+), 210 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 54306271cfbf..bd8d772979a6 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -237,9 +237,9 @@ size_t kunit_suite_num_test_cases(struct kunit_suite *s=
uite);
 unsigned int kunit_test_case_num(struct kunit_suite *suite,
 				 struct kunit_case *test_case);
=20
-int __kunit_test_suites_init(struct kunit_suite * const * const suites);
+int __kunit_test_suites_init(struct kunit_suite * const * const suites, in=
t num_suites);
=20
-void __kunit_test_suites_exit(struct kunit_suite **suites);
+void __kunit_test_suites_exit(struct kunit_suite **suites, int num_suites)=
;
=20
 #if IS_BUILTIN(CONFIG_KUNIT)
 int kunit_run_all_tests(void);
@@ -250,10 +250,10 @@ static inline int kunit_run_all_tests(void)
 }
 #endif /* IS_BUILTIN(CONFIG_KUNIT) */
=20
-#define __kunit_test_suites(unique_array, unique_suites, ...)		       \
-	static struct kunit_suite *unique_array[] =3D { __VA_ARGS__, NULL };     =
\
-	static struct kunit_suite **unique_suites			       \
-	__used __section(".kunit_test_suites") =3D unique_array
+#define __kunit_test_suites(unique_array, ...)				       \
+	static struct kunit_suite *unique_array[]			       \
+	__aligned(sizeof(struct kunit_suite *))				       \
+	__used __section(".kunit_test_suites") =3D { __VA_ARGS__ }
=20
 /**
  * kunit_test_suites() - used to register one or more &struct kunit_suite
@@ -271,7 +271,6 @@ static inline int kunit_run_all_tests(void)
  */
 #define kunit_test_suites(__suites...)						\
 	__kunit_test_suites(__UNIQUE_ID(array),				\
-			    __UNIQUE_ID(suites),			\
 			    ##__suites)
=20
 #define kunit_test_suite(suite)	kunit_test_suites(&suite)
diff --git a/include/linux/module.h b/include/linux/module.h
index 2490223c975d..518296ea7f73 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -507,7 +507,7 @@ struct module {
 #endif
 #if IS_ENABLED(CONFIG_KUNIT)
 	int num_kunit_suites;
-	struct kunit_suite ***kunit_suites;
+	struct kunit_suite **kunit_suites;
 #endif
=20
=20
diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index 96f96e42ce06..2ae9a037a80f 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -9,8 +9,8 @@
  * These symbols point to the .kunit_test_suites section and are defined i=
n
  * include/asm-generic/vmlinux.lds.h, and consequently must be extern.
  */
-extern struct kunit_suite * const * const __kunit_suites_start[];
-extern struct kunit_suite * const * const __kunit_suites_end[];
+extern struct kunit_suite * const __kunit_suites_start[];
+extern struct kunit_suite * const __kunit_suites_end[];
=20
 #if IS_BUILTIN(CONFIG_KUNIT)
=20
@@ -92,62 +92,18 @@ kunit_filter_tests(struct kunit_suite *const suite, con=
st char *test_glob)
 static char *kunit_shutdown;
 core_param(kunit_shutdown, kunit_shutdown, charp, 0644);
=20
-static struct kunit_suite * const *
-kunit_filter_subsuite(struct kunit_suite * const * const subsuite,
-		      struct kunit_test_filter *filter)
-{
-	int i, n =3D 0;
-	struct kunit_suite **filtered, *filtered_suite;
-
-	n =3D 0;
-	for (i =3D 0; subsuite[i]; ++i) {
-		if (glob_match(filter->suite_glob, subsuite[i]->name))
-			++n;
-	}
-
-	if (n =3D=3D 0)
-		return NULL;
-
-	filtered =3D kmalloc_array(n + 1, sizeof(*filtered), GFP_KERNEL);
-	if (!filtered)
-		return ERR_PTR(-ENOMEM);
-
-	n =3D 0;
-	for (i =3D 0; subsuite[i] !=3D NULL; ++i) {
-		if (!glob_match(filter->suite_glob, subsuite[i]->name))
-			continue;
-		filtered_suite =3D kunit_filter_tests(subsuite[i], filter->test_glob);
-		if (IS_ERR(filtered_suite))
-			return ERR_CAST(filtered_suite);
-		else if (filtered_suite)
-			filtered[n++] =3D filtered_suite;
-	}
-	filtered[n] =3D NULL;
-
-	return filtered;
-}
-
+/* Stores an array of suites, end points one past the end */
 struct suite_set {
-	struct kunit_suite * const * const *start;
-	struct kunit_suite * const * const *end;
+	struct kunit_suite * const *start;
+	struct kunit_suite * const *end;
 };
=20
-static void kunit_free_subsuite(struct kunit_suite * const *subsuite)
-{
-	unsigned int i;
-
-	for (i =3D 0; subsuite[i]; i++)
-		kfree(subsuite[i]);
-
-	kfree(subsuite);
-}
-
 static void kunit_free_suite_set(struct suite_set suite_set)
 {
-	struct kunit_suite * const * const *suites;
+	struct kunit_suite * const *suites;
=20
 	for (suites =3D suite_set.start; suites < suite_set.end; suites++)
-		kunit_free_subsuite(*suites);
+		kfree(*suites);
 	kfree(suite_set.start);
 }
=20
@@ -156,7 +112,7 @@ static struct suite_set kunit_filter_suites(const struc=
t suite_set *suite_set,
 					    int *err)
 {
 	int i;
-	struct kunit_suite * const **copy, * const *filtered_subsuite;
+	struct kunit_suite **copy, *filtered_suite;
 	struct suite_set filtered;
 	struct kunit_test_filter filter;
=20
@@ -171,14 +127,19 @@ static struct suite_set kunit_filter_suites(const str=
uct suite_set *suite_set,
=20
 	kunit_parse_filter_glob(&filter, filter_glob);
=20
-	for (i =3D 0; i < max; ++i) {
-		filtered_subsuite =3D kunit_filter_subsuite(suite_set->start[i], &filter=
);
-		if (IS_ERR(filtered_subsuite)) {
-			*err =3D PTR_ERR(filtered_subsuite);
+	for (i =3D 0; &suite_set->start[i] !=3D suite_set->end; i++) {
+		if (!glob_match(filter.suite_glob, suite_set->start[i]->name))
+			continue;
+
+		filtered_suite =3D kunit_filter_tests(suite_set->start[i], filter.test_g=
lob);
+		if (IS_ERR(filtered_suite)) {
+			*err =3D PTR_ERR(filtered_suite);
 			return filtered;
 		}
-		if (filtered_subsuite)
-			*copy++ =3D filtered_subsuite;
+		if (!filtered_suite)
+			continue;
+
+		*copy++ =3D filtered_suite;
 	}
 	filtered.end =3D copy;
=20
@@ -201,52 +162,33 @@ static void kunit_handle_shutdown(void)
=20
 }
=20
-static void kunit_print_tap_header(struct suite_set *suite_set)
-{
-	struct kunit_suite * const * const *suites, * const *subsuite;
-	int num_of_suites =3D 0;
-
-	for (suites =3D suite_set->start; suites < suite_set->end; suites++)
-		for (subsuite =3D *suites; *subsuite !=3D NULL; subsuite++)
-			num_of_suites++;
-
-	pr_info("TAP version 14\n");
-	pr_info("1..%d\n", num_of_suites);
-}
-
 static void kunit_exec_run_tests(struct suite_set *suite_set)
 {
-	struct kunit_suite * const * const *suites;
+	size_t num_suites =3D suite_set->end - suite_set->start;
=20
-	kunit_print_tap_header(suite_set);
+	pr_info("TAP version 14\n");
+	pr_info("1..%zu\n", num_suites);
=20
-	for (suites =3D suite_set->start; suites < suite_set->end; suites++)
-		__kunit_test_suites_init(*suites);
+	__kunit_test_suites_init(suite_set->start, num_suites);
 }
=20
 static void kunit_exec_list_tests(struct suite_set *suite_set)
 {
-	unsigned int i;
-	struct kunit_suite * const * const *suites;
+	struct kunit_suite * const *suites;
 	struct kunit_case *test_case;
=20
 	/* Hack: print a tap header so kunit.py can find the start of KUnit outpu=
t. */
 	pr_info("TAP version 14\n");
=20
 	for (suites =3D suite_set->start; suites < suite_set->end; suites++)
-		for (i =3D 0; (*suites)[i] !=3D NULL; i++) {
-			kunit_suite_for_each_test_case((*suites)[i], test_case) {
-				pr_info("%s.%s\n", (*suites)[i]->name, test_case->name);
-			}
+		kunit_suite_for_each_test_case((*suites), test_case) {
+			pr_info("%s.%s\n", (*suites)->name, test_case->name);
 		}
 }
=20
 int kunit_run_all_tests(void)
 {
-	struct suite_set suite_set =3D {
-		.start =3D __kunit_suites_start,
-		.end =3D __kunit_suites_end,
-	};
+	struct suite_set suite_set =3D {__kunit_suites_start, __kunit_suites_end}=
;
 	int err =3D 0;
=20
 	if (filter_glob_param) {
@@ -264,11 +206,10 @@ int kunit_run_all_tests(void)
 	else
 		pr_err("kunit executor: unknown action '%s'\n", action_param);
=20
-	if (filter_glob_param) { /* a copy was made of each array */
+	if (filter_glob_param) { /* a copy was made of each suite */
 		kunit_free_suite_set(suite_set);
 	}
=20
-
 out:
 	kunit_handle_shutdown();
 	return err;
diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
index eac6ff480273..0cea31c27b23 100644
--- a/lib/kunit/executor_test.c
+++ b/lib/kunit/executor_test.c
@@ -9,8 +9,6 @@
 #include <kunit/test.h>
=20
 static void kfree_at_end(struct kunit *test, const void *to_free);
-static void free_subsuite_at_end(struct kunit *test,
-				 struct kunit_suite *const *to_free);
 static struct kunit_suite *alloc_fake_suite(struct kunit *test,
 					    const char *suite_name,
 					    struct kunit_case *test_cases);
@@ -41,126 +39,80 @@ static void parse_filter_test(struct kunit *test)
 	kfree(filter.test_glob);
 }
=20
-static void filter_subsuite_test(struct kunit *test)
+static void filter_suites_test(struct kunit *test)
 {
-	struct kunit_suite *subsuite[3] =3D {NULL, NULL, NULL};
-	struct kunit_suite * const *filtered;
-	struct kunit_test_filter filter =3D {
-		.suite_glob =3D "suite2",
-		.test_glob =3D NULL,
-	};
+	struct kunit_suite *subsuite[3] =3D {NULL, NULL};
+	struct suite_set suite_set =3D {.start =3D subsuite, .end =3D &subsuite[2=
]};
+	struct suite_set got;
+	int err =3D 0;
=20
 	subsuite[0] =3D alloc_fake_suite(test, "suite1", dummy_test_cases);
 	subsuite[1] =3D alloc_fake_suite(test, "suite2", dummy_test_cases);
=20
 	/* Want: suite1, suite2, NULL -> suite2, NULL */
-	filtered =3D kunit_filter_subsuite(subsuite, &filter);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered);
-	free_subsuite_at_end(test, filtered);
+	got =3D kunit_filter_suites(&suite_set, "suite2", &err);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	kfree_at_end(test, got.start);
=20
 	/* Validate we just have suite2 */
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered[0]);
-	KUNIT_EXPECT_STREQ(test, (const char *)filtered[0]->name, "suite2");
-	KUNIT_EXPECT_FALSE(test, filtered[1]);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start[0]);
+	KUNIT_EXPECT_STREQ(test, (const char *)got.start[0]->name, "suite2");
+
+	/* Contains one element (end is 1 past end) */
+	KUNIT_ASSERT_EQ(test, got.end - got.start, 1);
 }
=20
-static void filter_subsuite_test_glob_test(struct kunit *test)
+static void filter_suites_test_glob_test(struct kunit *test)
 {
-	struct kunit_suite *subsuite[3] =3D {NULL, NULL, NULL};
-	struct kunit_suite * const *filtered;
-	struct kunit_test_filter filter =3D {
-		.suite_glob =3D "suite2",
-		.test_glob =3D "test2",
-	};
+	struct kunit_suite *subsuite[3] =3D {NULL, NULL};
+	struct suite_set suite_set =3D {.start =3D subsuite, .end =3D &subsuite[2=
]};
+	struct suite_set got;
+	int err =3D 0;
=20
 	subsuite[0] =3D alloc_fake_suite(test, "suite1", dummy_test_cases);
 	subsuite[1] =3D alloc_fake_suite(test, "suite2", dummy_test_cases);
=20
 	/* Want: suite1, suite2, NULL -> suite2 (just test1), NULL */
-	filtered =3D kunit_filter_subsuite(subsuite, &filter);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered);
-	free_subsuite_at_end(test, filtered);
+	got =3D kunit_filter_suites(&suite_set, "suite2.test2", &err);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	kfree_at_end(test, got.start);
=20
 	/* Validate we just have suite2 */
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered[0]);
-	KUNIT_EXPECT_STREQ(test, (const char *)filtered[0]->name, "suite2");
-	KUNIT_EXPECT_FALSE(test, filtered[1]);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start[0]);
+	KUNIT_EXPECT_STREQ(test, (const char *)got.start[0]->name, "suite2");
+	KUNIT_ASSERT_EQ(test, got.end - got.start, 1);
=20
 	/* Now validate we just have test2 */
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered[0]->test_cases);
-	KUNIT_EXPECT_STREQ(test, (const char *)filtered[0]->test_cases[0].name, "=
test2");
-	KUNIT_EXPECT_FALSE(test, filtered[0]->test_cases[1].name);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, got.start[0]->test_cases);
+	KUNIT_EXPECT_STREQ(test, (const char *)got.start[0]->test_cases[0].name, =
"test2");
+	KUNIT_EXPECT_FALSE(test, got.start[0]->test_cases[1].name);
 }
=20
-static void filter_subsuite_to_empty_test(struct kunit *test)
+static void filter_suites_to_empty_test(struct kunit *test)
 {
-	struct kunit_suite *subsuite[3] =3D {NULL, NULL, NULL};
-	struct kunit_suite * const *filtered;
-	struct kunit_test_filter filter =3D {
-		.suite_glob =3D "not_found",
-		.test_glob =3D NULL,
-	};
+	struct kunit_suite *subsuite[3] =3D {NULL, NULL};
+	struct suite_set suite_set =3D {.start =3D subsuite, .end =3D &subsuite[2=
]};
+	struct suite_set got;
+	int err =3D 0;
=20
 	subsuite[0] =3D alloc_fake_suite(test, "suite1", dummy_test_cases);
 	subsuite[1] =3D alloc_fake_suite(test, "suite2", dummy_test_cases);
=20
-	filtered =3D kunit_filter_subsuite(subsuite, &filter);
-	free_subsuite_at_end(test, filtered); /* just in case */
+	got =3D kunit_filter_suites(&suite_set, "not_found", &err);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	kfree_at_end(test, got.start); /* just in case */
=20
-	KUNIT_EXPECT_FALSE_MSG(test, filtered,
-			       "should be NULL to indicate no match");
-}
-
-static void kfree_subsuites_at_end(struct kunit *test, struct suite_set *s=
uite_set)
-{
-	struct kunit_suite * const * const *suites;
-
-	kfree_at_end(test, suite_set->start);
-	for (suites =3D suite_set->start; suites < suite_set->end; suites++)
-		free_subsuite_at_end(test, *suites);
-}
-
-static void filter_suites_test(struct kunit *test)
-{
-	/* Suites per-file are stored as a NULL terminated array */
-	struct kunit_suite *subsuites[2][2] =3D {
-		{NULL, NULL},
-		{NULL, NULL},
-	};
-	/* Match the memory layout of suite_set */
-	struct kunit_suite * const * const suites[2] =3D {
-		subsuites[0], subsuites[1],
-	};
-
-	const struct suite_set suite_set =3D {
-		.start =3D suites,
-		.end =3D suites + 2,
-	};
-	struct suite_set filtered =3D {.start =3D NULL, .end =3D NULL};
-	int err =3D 0;
-
-	/* Emulate two files, each having one suite */
-	subsuites[0][0] =3D alloc_fake_suite(test, "suite0", dummy_test_cases);
-	subsuites[1][0] =3D alloc_fake_suite(test, "suite1", dummy_test_cases);
-
-	/* Filter out suite1 */
-	filtered =3D kunit_filter_suites(&suite_set, "suite0", &err);
-	kfree_subsuites_at_end(test, &filtered); /* let us use ASSERTs without le=
aking */
-	KUNIT_EXPECT_EQ(test, err, 0);
-	KUNIT_ASSERT_EQ(test, filtered.end - filtered.start, (ptrdiff_t)1);
-
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered.start);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered.start[0]);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered.start[0][0]);
-	KUNIT_EXPECT_STREQ(test, (const char *)filtered.start[0][0]->name, "suite=
0");
+	KUNIT_EXPECT_PTR_EQ_MSG(test, got.start, got.end,
+				"should be empty to indicate no match");
 }
=20
 static struct kunit_case executor_test_cases[] =3D {
 	KUNIT_CASE(parse_filter_test),
-	KUNIT_CASE(filter_subsuite_test),
-	KUNIT_CASE(filter_subsuite_test_glob_test),
-	KUNIT_CASE(filter_subsuite_to_empty_test),
 	KUNIT_CASE(filter_suites_test),
+	KUNIT_CASE(filter_suites_test_glob_test),
+	KUNIT_CASE(filter_suites_to_empty_test),
 	{}
 };
=20
@@ -190,20 +142,6 @@ static void kfree_at_end(struct kunit *test, const voi=
d *to_free)
 			     (void *)to_free);
 }
=20
-static void free_subsuite_res_free(struct kunit_resource *res)
-{
-	kunit_free_subsuite(res->data);
-}
-
-static void free_subsuite_at_end(struct kunit *test,
-				 struct kunit_suite *const *to_free)
-{
-	if (IS_ERR_OR_NULL(to_free))
-		return;
-	kunit_alloc_resource(test, NULL, free_subsuite_res_free,
-			     GFP_KERNEL, (void *)to_free);
-}
-
 static struct kunit_suite *alloc_fake_suite(struct kunit *test,
 					    const char *suite_name,
 					    struct kunit_case *test_cases)
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 3052526b9b89..b6495c7f9a7e 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -582,11 +582,11 @@ static void kunit_init_suite(struct kunit_suite *suit=
e)
 	suite->suite_init_err =3D 0;
 }
=20
-int __kunit_test_suites_init(struct kunit_suite * const * const suites)
+int __kunit_test_suites_init(struct kunit_suite * const * const suites, in=
t num_suites)
 {
 	unsigned int i;
=20
-	for (i =3D 0; suites[i] !=3D NULL; i++) {
+	for (i =3D 0; i < num_suites; i++) {
 		kunit_init_suite(suites[i]);
 		kunit_run_tests(suites[i]);
 	}
@@ -599,11 +599,11 @@ static void kunit_exit_suite(struct kunit_suite *suit=
e)
 	kunit_debugfs_destroy_suite(suite);
 }
=20
-void __kunit_test_suites_exit(struct kunit_suite **suites)
+void __kunit_test_suites_exit(struct kunit_suite **suites, int num_suites)
 {
 	unsigned int i;
=20
-	for (i =3D 0; suites[i] !=3D NULL; i++)
+	for (i =3D 0; i < num_suites; i++)
 		kunit_exit_suite(suites[i]);
=20
 	kunit_suite_counter =3D 1;
@@ -613,18 +613,12 @@ EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
 #ifdef CONFIG_MODULES
 static void kunit_module_init(struct module *mod)
 {
-	unsigned int i;
-
-	for (i =3D 0; i < mod->num_kunit_suites; i++)
-		__kunit_test_suites_init(mod->kunit_suites[i]);
+	__kunit_test_suites_init(mod->kunit_suites, mod->num_kunit_suites);
 }
=20
 static void kunit_module_exit(struct module *mod)
 {
-	unsigned int i;
-
-	for (i =3D 0; i < mod->num_kunit_suites; i++)
-		__kunit_test_suites_exit(mod->kunit_suites[i]);
+	__kunit_test_suites_exit(mod->kunit_suites, mod->num_kunit_suites);
 }
=20
 static int kunit_module_notify(struct notifier_block *nb, unsigned long va=
l,
--=20
2.37.0.rc0.161.g10f37bed90-goog

