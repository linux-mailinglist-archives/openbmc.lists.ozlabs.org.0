Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D316C552D75
	for <lists+openbmc@lfdr.de>; Tue, 21 Jun 2022 10:54:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LS0gc5c9tz3c95
	for <lists+openbmc@lfdr.de>; Tue, 21 Jun 2022 18:54:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ogsxr29v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3iiexyggkbxeurczux5dx55x2v.t5356v4s3t2z9a9.5g2rs9.58x@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ogsxr29v;
	dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LS0gB1J1Qz2xbY
	for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2022 18:53:56 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id br7-20020a056a00440700b00522d222b51bso5166658pfb.22
        for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2022 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=nf95HhrfWFUahqXSIitMKY23Se4rd+JJ9W9asuRVrfE=;
        b=Ogsxr29vx7siAKBfxHcDd5vtA34uCszdFjp4M0pFwM3VCiNoCHpKhuGE5wgAtGqqHl
         aCbOy32LCBU1l6SioJ723Ij5R8zHkMv6Ki0aQhFeYBWTMupd7de4Yq4HKQEgTBvLeYFY
         qfTvVI3VxufEyM+pOkc9/Y0+8xQt6AYeRLNmovW+8Nn7Ai7EnB7tqpMZ0cplADz6SWN3
         4WRDtNJUjqYiW80yyV3yZ+tn7w0CUK29zSyHR1iRT5yuA1kTdYdl4fVhmLRy0APOiM7m
         EvlxApHEF4iDoOVP0PaNNrl7zYefWUgZo5Bou5AAzguAE+BIysGEnbHAffq1DWjcIYWq
         qeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=nf95HhrfWFUahqXSIitMKY23Se4rd+JJ9W9asuRVrfE=;
        b=bRJWhR34KCvc13QLlol4eqVvQBf30devgS7bynZt7l8LbzriIAl7d2sDX+4tq+SQe/
         zZZXDlpJRyTzNqhTKiHkLBFaS8v/zK6qrrWaT7nnqyTp2PdWektMpyWbPaaaAphMgpBD
         HxpsFVqsiK67v/8bYMpszsrbTp6Wl8SwFBsH2JHrdzVZ3YAcCto6sX6Q6LCuVvdkOu79
         rTn4LBqlXOERTwaKpGPiZiNzhr4/1NBjX+Czdm6qaR4GiEHv65xox93FpZDco6JwOVeX
         BsIWajh59BbtupHwY2pSOtyp7LhBt4ZjG46jmod1q43km+FMM3bZJozDFvhXGL0E+kH0
         r0Hg==
X-Gm-Message-State: AJIora8DM5NtpQgnmnyHXVDp01MgJ5PiUUJ7yDWrsVdU8QyFsW0sI9AV
	UUavIpl7bYBhUZlrRFF0eKYHszR2nYu1tA==
X-Google-Smtp-Source: AGRyM1vm7uKvTRSoy8DBny3ZH2I/R3zY1c/M5lzSFFKf5zbsgHT5nrh/r0nP22nRH6TvP9voZc09YjHiLsB5UA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:90a:4a97:b0:1ea:fa24:467c with SMTP
 id f23-20020a17090a4a9700b001eafa24467cmr694965pjh.1.1655801632812; Tue, 21
 Jun 2022 01:53:52 -0700 (PDT)
Date: Tue, 21 Jun 2022 16:53:40 +0800
Message-Id: <20220621085345.603820-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH v2 0/5] Rework KUnit test execution in modules
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
Cc: David Gow <davidgow@google.com>, linux-aspeed@lists.ozlabs.org, =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kselftest@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, Paraschiv@google.com, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series makes two changes to how KUnit test suites are stored
and executed:
- The .kunit_test_suites section is now used for tests in modules (in
  lieu of a module_init funciton), as well as for built-in tests. The
  module loader will now trigger test execution. This frees up the
  module_init function for other uses.
- Instead of storing an array of arrays of suites, have the
  kunit_test_suite() and kunit_test_suites() macros append to one global
  (or per-module) list of test suites. This removes a needless layer of
  indirection, and removes the need to NULL-terminate suite_sets.

The upshot of this is that it should now be possible to use the
kunit_test_suite() and kunit_test_suites() macros to register test
suites even from within modules which otherwise had module_init
functions. This was proving to be quite a common issue, resulting in
several modules calling into KUnit's private suite execution functions
to run their tests (often introducing incompatibilities with the KUnit
tooling).

This series also fixes the thunderbolt, nitro_enclaves, and
sdhci-of-aspeed tests to use kunit_test_suite() now that it works. This
is required, as otherwise the first two patches may break these tests
entirely.

Huge thanks to Jeremy Kerr, who designed and implemented the module
loader changes, and to Daniel Latypov for pushing the simplification of
the nested arrays in .kunit_test_suites.

I've tested this series both with builtin tests, and with modules on
x86_64, but there's always the possibility that there's something subtle
and nasty on another architecture, so please test!

Cheers,
-- David

Changes since v1:
https://lore.kernel.org/linux-kselftest/20220618090310.1174932-1-davidgow@google.com/
- Fix a compile issue when CONFIG_KUNIT=m (Thanks Christophe)
- No longer NULL-terminate suite_sets.
- Move the thunderbird Kconfig to the correct patch (Thanks Andra)
- Add all the Tested-by and Acked-by tags.

---
Daniel Latypov (1):
  kunit: flatten kunit_suite*** to kunit_suite** in .kunit_test_suites

David Gow (3):
  thunderbolt: test: Use kunit_test_suite() macro
  nitro_enclaves: test: Use kunit_test_suite() macro
  mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro

Jeremy Kerr (1):
  kunit: unify module and builtin suite definitions

 drivers/mmc/host/Kconfig                      |   5 +-
 drivers/mmc/host/sdhci-of-aspeed-test.c       |   8 +-
 drivers/mmc/host/sdhci-of-aspeed.c            |  27 ----
 drivers/thunderbolt/Kconfig                   |   5 +-
 drivers/thunderbolt/domain.c                  |   3 -
 drivers/thunderbolt/tb.h                      |   8 -
 drivers/thunderbolt/test.c                    |  12 +-
 drivers/virt/nitro_enclaves/Kconfig           |   5 +-
 drivers/virt/nitro_enclaves/ne_misc_dev.c     |  27 ----
 .../virt/nitro_enclaves/ne_misc_dev_test.c    |   5 +-
 include/kunit/test.h                          |  60 ++------
 include/linux/module.h                        |   5 +
 kernel/module/main.c                          |   6 +
 lib/kunit/executor.c                          | 115 ++++----------
 lib/kunit/executor_test.c                     | 144 +++++-------------
 lib/kunit/test.c                              |  54 ++++++-
 16 files changed, 152 insertions(+), 337 deletions(-)

-- 
2.37.0.rc0.104.g0611611a94-goog

