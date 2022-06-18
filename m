Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32666550393
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 11:03:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ9200pjHz3cBm
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 19:03:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UIxQ5FEc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=34pstyggkb90c9uhcfnvfnnfkd.bnlnodmalbkhrsr.nyk9ar.nqf@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UIxQ5FEc;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQ91j0GN6z3bbQ
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2022 19:03:35 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id e3-20020a170902ef4300b0016a14be17daso171043plx.5
        for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2022 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ptVKPuGcbB2+la+8ZiODjieQiW7k/oxo/Oz/EdgWumA=;
        b=UIxQ5FEc5KUGjUFI0jmR+pzVeOpPYkxsewDr7QpplKnl9i8FqbhtassrfzcyyW/VG4
         q4zTZ1jlJegFa1PmQn4JCa7rgZpA9GXdHeGc7DZThZ3KQpZ5ijja2/D22gi939kN75as
         w19ZMHfgy7cHjfLdCoqYjwhPvt3gyoPZQIRTlpXEuBVi1hRUi93DrwXHyRyr6uPntB+C
         f5qLDoDNzx+/aL9DTUn2OsNZ3Fo0QayufVMnNZ/CwjjPTMgirdUroVvDRqUjhR2FhpvJ
         nwHs/ieBLMWCoE89Zwm+PIiFZpaoTHinYCTLH2LFGLCAwEinnlsS9UG+rWKeGDt9sn12
         wlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ptVKPuGcbB2+la+8ZiODjieQiW7k/oxo/Oz/EdgWumA=;
        b=HJZDSAusi9qysGM9Cn9tA6I/s+1pQnt9sLtNvAIiIcNd5FRw0WwYwcvls16catUDGY
         idcnaPVZve3vFGQvmT2TjVl2f5dZcauvbwndQlGE3V3XrY25l9KCwfYKDBOZoGtJh5Ze
         utyFf26JGBpUcr9IYA5cWjctRyrNQ0A7zeQiCeWC3vflwmdebhQUmlEoCimszyj8OZwD
         3m27hdcaZuloZmKu0rec7KmWj1eeM2IEdlioGwd1vUWZFzomCmdWIGikvu+mRnAlfleB
         M55FEUE762rLeO65gIBn0hUo6vKFgTU4IQ7eFmJkcVZbKA+b8Pb+KwCA0GwpSwWpn1G0
         Fsxg==
X-Gm-Message-State: AJIora/PMk56Fc9stunq9mu4wbBHEghadnNSth/B5a03AfzMfxAapXPF
	7VbQnproW+I8AO/9CUXg5m/BdHEgmxqtCQ==
X-Google-Smtp-Source: AGRyM1sH2PfcGj8ViDV0lllmFpU71ukSxzCtMA3vIatOWbHB6KvOeV6QomY8XXQV6nt0d4lCuh4I6QRng8JeMg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:903:11cc:b0:168:eae:da4a with SMTP id
 q12-20020a17090311cc00b001680eaeda4amr13290211plh.21.1655543010775; Sat, 18
 Jun 2022 02:03:30 -0700 (PDT)
Date: Sat, 18 Jun 2022 17:03:05 +0800
Message-Id: <20220618090310.1174932-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 0/5] Rework KUnit test execution in modules
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

This patch series makes two changes to how KUnit test suites are stored
and executed:
- The .kunit_test_suites section is now used for tests in modules (in
  lieu of a module_init funciton), as well as for built-in tests. The
  module loader will now trigger test execution. This frees up the
  module_init function for other uses.
- Instead of storing an array of arrays of suites, have the
  kunit_test_suite() and kunit_test_suites() macros append to one global
  (or per-module) list of test suites. This removes a needless layer of
  indirection.

The upshot of this is that it should now be possible to use the
kunit_test_suite() and kunit_test_suites() macros to register test
suites even from within modules which otherwise had module_init
functions. This was proving to be quite a common issue, resulting in
several modules calling into KUnit's private suite execution functions
to run their tests (often introducing incompatibilities with the KUnit
tooling).

This series also fixes the thunderbolt, nitro_enclaves, and
sdhci-of-aspeed tests to use kunit_test_suite() now that it works.

Huge thanks to Jeremy Kerr, who designed and implemented the module
loader changes, and to Daniel Latypov for pushing the simplification of
the nested arrays in .kunit_test_suites.

I've tested this series both with builtin tests, and with modules on
x86_64, but there's always the possibility that there's something subtle
and nasty on another architecture, so please test!

Cheers,
-- David

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
 lib/kunit/executor.c                          | 117 ++++-----------
 lib/kunit/executor_test.c                     | 139 +++++-------------
 lib/kunit/test.c                              |  54 ++++++-
 16 files changed, 152 insertions(+), 334 deletions(-)

-- 
2.36.1.476.g0c4daa206d-goog

