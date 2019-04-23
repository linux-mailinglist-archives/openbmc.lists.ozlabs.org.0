Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA41718547
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:17:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45036k1hpVzDqKl
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:17:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=windriver.com
 (client-ip=192.103.53.11; helo=mail5.wrs.com;
 envelope-from=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=windriver.com
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pThV4cN0zDqH2
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 02:40:25 +1000 (AEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3NFmwNQ005137
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Tue, 23 Apr 2019 08:49:08 -0700
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.439.0; Tue, 23 Apr 2019
 08:48:48 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>
Subject: [PATCH 0/5] wdt: clean up unused modular infrastructure
Date: Tue, 23 Apr 2019 11:48:30 -0400
Message-ID: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 09 May 2019 16:11:46 +1000
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
Cc: linux-watchdog@vger.kernel.org, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Wim Van Sebroeck <wim@iguana.be>, Linus Walleij <linus.walleij@linaro.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

People can embed modular includes and modular exit functions into code
that never use any of it, and they won't get any errors or warnings.

Using modular infrastructure in non-modules might seem harmless, but some
of the downfalls this leads to are:

 (1) it is easy to accidentally write unused module_exit/remove code
 (2) it can be misleading when reading the source, thinking a driver can
     be modular when the Makefile and/or Kconfig prohibit it
 (3) an unused include of the module.h header file will in turn
     include nearly everything else; adding a lot to CPP overhead.
 (4) it gets copied/replicated into other drivers and can spread.

As a data point for #3 above, an empty C file that just includes the
module.h header generates over 750kB of CPP output.  Repeating the same
experiment with init.h and the result is less than 12kB; with export.h
it is only about 1/2kB; with both it still is less than 12kB.

Here, In this series, we do what has been done for other subsystems,
like, net, x86, mfd, iommu....  and audit for uses of modular
infrastructure inside code that currently can't be built as a module.

As always, the option exists for driver authors to convert their code
to tristate, if there is a valid use case for it to be so.  But since
I don't have the context for each driver to know if such a use case
exists, I limit myself to simply removing the unused code in order to
make the driver consistent with the Makefile/Kconfig settings that
control it.

Paul.

---

Cc: Benjamin Fair <benjaminfair@google.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-watchdog@vger.kernel.org
Cc: Nancy Yuen <yuenn@google.com>
Cc: openbmc@lists.ozlabs.org
Cc: Patrick Venture <venture@google.com>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Wim Van Sebroeck <wim@iguana.be>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>


Paul Gortmaker (5):
  watchdog: rtd119x: drop unused module.h include
  watchdog: watchdog_core: make it explicitly non-modular
  watchdog: npcm: make it explicitly non-modular
  watchdog: intel_scu: make it explicitly non-modular
  watchdog: coh901327: make it explicitly non-modular

 drivers/watchdog/coh901327_wdt.c      | 24 ++++--------------------
 drivers/watchdog/intel_scu_watchdog.c | 18 ------------------
 drivers/watchdog/npcm_wdt.c           | 13 ++++++-------
 drivers/watchdog/rtd119x_wdt.c        |  1 -
 drivers/watchdog/watchdog_core.c      | 15 +--------------
 5 files changed, 11 insertions(+), 60 deletions(-)

-- 
2.7.4

