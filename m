Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C84803964
	for <lists+openbmc@lfdr.de>; Mon,  4 Dec 2023 17:01:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KF8BnPrk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkT1Q2DBHz3ccF
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 03:01:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KF8BnPrk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkT0m55NNz2yDD
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 03:00:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701705656; x=1733241656;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=goDby2BKVdPOi8LfllK5RKnXl6OkHzWAfmtHBKbAvNU=;
  b=KF8BnPrkFeLKm5d2iGb5dBYx13ERQbvPZtMirGnZdlH8+0i6wBv7vaC/
   qHi3vIbbleZMcGwzMUfRqAg0xgdjhd46xMr1o0OoJ4FoWUroZgpOPfxS3
   SZW+s4f7/ZAMiB3ETCGiZo/zaVGXsdrbOpW+uaI3dWavvmBbolGWbPS1e
   cICTCNOScVF/2xVak/hu6q42gIBcLb/uOTMXX5W3dqkSNjmkxTO1Myjxg
   gMXSeTn9hCSuV0O6RVrEGhEjqKoch8jFDssSwuCWzdQ7WAeKD927+z1df
   DTYXjkBjB63uyb/P4fSCPRdFSpoyKtmSR1G52woJjp4w8At+5d4Jel+nw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="392626609"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="392626609"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:00:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836625915"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="836625915"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 04 Dec 2023 08:00:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E6219368; Mon,  4 Dec 2023 18:00:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 0/5] pinctrl: Use struct pingroup and PINCTRL_PINGROUP()
Date: Mon,  4 Dec 2023 17:56:31 +0200
Message-ID: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an excerpt from v4 of the "pinctrl: Convert struct group_desc
to use struct pingroup" [1]. The series has been compiled with GCC 8
for ARM64 besides x86_64 GCC 13 and LLVM 16.

Changelog to the mother series [1]:
- added a new patch against Renesas code, so no warnings will be seen

Link: https://lore.kernel.org/r/20231129161459.1002323-1-andriy.shevchenko@linux.intel.com [1]

Andy Shevchenko (5):
  pinctrl: renesas: Mark local variable with const in ->set_mux()
  pinctrl: core: Make pins const unsigned int pointer in struct
    group_desc
  pinctrl: equilibrium: Convert to use struct pingroup
  pinctrl: keembay: Convert to use struct pingroup
  pinctrl: nuvoton: Convert to use struct pingroup and
    PINCTRL_PINGROUP()

 drivers/pinctrl/core.c                    |  2 +-
 drivers/pinctrl/core.h                    |  4 ++--
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  9 ++++----
 drivers/pinctrl/pinctrl-equilibrium.c     | 26 +++++++++++------------
 drivers/pinctrl/pinctrl-keembay.c         |  4 ++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c   |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c   |  2 +-
 7 files changed, 24 insertions(+), 25 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096

