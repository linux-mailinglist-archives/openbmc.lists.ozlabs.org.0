Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4118D55A720
	for <lists+openbmc@lfdr.de>; Sat, 25 Jun 2022 07:11:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVMXF0VVFz3cNM
	for <lists+openbmc@lfdr.de>; Sat, 25 Jun 2022 15:11:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EqD8y2+a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3z5i2yggkb_ybytgbemuemmejc.amkmnclzkajgqrq.mxjyzq.mpe@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EqD8y2+a;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVMWm4Hg2z3byP
	for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2022 15:10:43 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-317ab78a345so37058067b3.10
        for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2022 22:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=w4sImYlkO8ijtHtHqXjuNpZj0tKuVZDrJNUstUmHo0Y=;
        b=EqD8y2+aOVUkTGcq5ZUmSJSlcNdi0/42WaEgggkl5B3OgbsWkhjLvSidKJ/JJ0Ii8D
         n5a4Jh42vH8vTZ+mrg+TgQiYpMZMV5Wwr7Ontt6SKvDFTSV2uVH5HifBJwaRiN+Mta7o
         R5UWn0iyCaAL68/7Educg/KLDyigRQWkyUnoluYUe7nfxYLaByKZUDwGF46yZEtAKhbG
         8UsVYqpRwR/p+mL+pPSwt9lVlTi4ocx+NI0DRkaxQZ5aSTH7oaa9h7Btr1uOipe43x6N
         IqIiTq7UsvFiUg2NM3r57zmp1YW3HI30VyzT2gakok84AaaSUhD3aDEahzIZwKyBUfhd
         4f/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=w4sImYlkO8ijtHtHqXjuNpZj0tKuVZDrJNUstUmHo0Y=;
        b=hDmjhZ+fOblNvfEH9BDLmMQRnCDPDKGo6cF5aja0lIFVfpDnCvg2TlWurhX68NCpKq
         KQ4XjB6qlGEOhGgzZmC8sGf7PY3MvUBOPH/AcyYaVg7ZuyRDGU215Fm31CBOSlTUXmzs
         B1Hbm+DcIou4yW4e9eThDbnJ9xxBmmMcaPM7VgiyTugoUHJ4m0nRdo2MUzwLlVutj/+I
         b1xUDqRa9ZYtkfw+ymbdYVOb5+c39gT4tK258wjFluFFJ+lCbP0Uw5bv9Gcmi+1y6Src
         ATvgmuNQ0wCXDZzx2K5EuycuhokzgEevvVLYTdi2lVVu42VUNEorLKRjihCda14TBwWg
         QmHA==
X-Gm-Message-State: AJIora+JSIYZsco0nWVsq30KvygNFnAFa9x4Lsa21N7+3ONF2thceXKH
	6JzqOMqe4cQjfgCrkoVRdJXqoLsigqt3YA==
X-Google-Smtp-Source: AGRyM1un+sBPc/7wBD+YQSQ7XAND66LYZk9RBj7rFNjc67YShu92PiqgyBy4jeaAtiwe0X78yPXPHI8EK15Tmw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a81:7cd6:0:b0:317:b6a2:6f15 with SMTP id
 x205-20020a817cd6000000b00317b6a26f15mr2708816ywc.234.1656133839830; Fri, 24
 Jun 2022 22:10:39 -0700 (PDT)
Date: Sat, 25 Jun 2022 13:08:34 +0800
Message-Id: <20220625050838.1618469-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 0/5] Rework KUnit test execution in modules
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Daniel Latypov <dlatypov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andra Paraschiv <andraprs@amazon.com>, 
	Longpeng <longpeng2@huawei.com>, Greg KH <gregkh@linuxfoundation.org>
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

I've tested this series both with builtin tests on a number of
architectures, and with modules on x86_64, and it seems good-to-go to
me. More testing (particularly of modules) with more interesting setups
never hurts, though!

Cheers,
-- David

Changes since v2:
https://lore.kernel.org/linux-kselftest/20220621085345.603820-1-davidgow@google.com/
- Add various Reviewed-by and Acked-by tags.
- Fix the Kconfig for thunderbolt to not allow USB4=y and KUNIT=m with
  tests enabled.
- Clean up the sdhci-of-aspeed init a bit more (Thanks Daniel)

Changes since v1:
https://lore.kernel.org/linux-kselftest/20220618090310.1174932-1-davidgow@google.com/
- Fix a compile issue when CONFIG_KUNIT=m (Thanks Christophe)
- No longer NULL-terminate suite_sets.
- Move the thunderbird Kconfig to the correct patch (Thanks Andra)
- Add all the Tested-by and Acked-by tags.

---
Daniel Latypov (1):

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
 drivers/mmc/host/sdhci-of-aspeed.c            |  34 +----
 drivers/thunderbolt/Kconfig                   |   6 +-
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
 16 files changed, 154 insertions(+), 343 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

