Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B560A8039AD
	for <lists+openbmc@lfdr.de>; Mon,  4 Dec 2023 17:08:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kYBvfM1q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkT9Y1Gf6z3cWB
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 03:08:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kYBvfM1q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkT8z2xy5z3bw9
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 03:08:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701706084; x=1733242084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CyMweha2ZvuLisSoPmNJvwBvM8UVF+24ES7V+e13w7A=;
  b=kYBvfM1qo1RDhbXD4vQl/Otd6KNsQuTjlFW4UQ1oXFNxfsq0RVhZH4wI
   DJqNFXErwnxt+BHlgsAr+LgniaZ8rMQjQWfhsu8p/dmekLQyGGkdDGiYz
   eG8BE9FMOIKu1s6DpxRwFlh2IjP9qlmvmlTFFQ41d3V13ce3SSlugYiVD
   TZdJmGrbsyV/x/A0CX5ziiLNjh5kTjkXnkJMSqxG2ke/jqIIY4p5IFi6j
   A/0tocNeWUFPoIeGga32fgvFYeUoWjPuzhZkPgVF+2i1DC55lR6clHl3K
   6UXuZEJwdbOAxD8dXV5SdAFGrLtlfOqzYGgGtvwQ0Zpr9MDp0PEPqo3/C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="632529"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="632529"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:08:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861422786"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="861422786"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 08:07:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3C299A7D; Mon,  4 Dec 2023 18:00:43 +0200 (EET)
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
Subject: [PATCH v1 5/5] pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP()
Date: Mon,  4 Dec 2023 17:56:36 +0200
Message-ID: <20231204160033.1872569-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
References: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
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

The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
Utilize them instead of open coded variants in the driver.

Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 0cff44b07b29..4589900244c7 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -474,9 +474,8 @@ enum {
 #undef WPCM450_GRP
 };
 
-static struct group_desc wpcm450_groups[] = {
-#define WPCM450_GRP(x) { .name = #x, .pins = x ## _pins, \
-			.num_pins = ARRAY_SIZE(x ## _pins) }
+static struct pingroup wpcm450_groups[] = {
+#define WPCM450_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	WPCM450_GRPS
 #undef WPCM450_GRP
 };
@@ -852,7 +851,7 @@ static int wpcm450_get_group_pins(struct pinctrl_dev *pctldev,
 				  const unsigned int **pins,
 				  unsigned int *npins)
 {
-	*npins = wpcm450_groups[selector].num_pins;
+	*npins = wpcm450_groups[selector].npins;
 	*pins  = wpcm450_groups[selector].pins;
 
 	return 0;
@@ -901,7 +900,7 @@ static int wpcm450_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	struct wpcm450_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	wpcm450_setfunc(pctrl->gcr_regmap, wpcm450_groups[group].pins,
-			wpcm450_groups[group].num_pins, function);
+			wpcm450_groups[group].npins, function);
 
 	return 0;
 }
-- 
2.43.0.rc1.1.gbec44491f096

