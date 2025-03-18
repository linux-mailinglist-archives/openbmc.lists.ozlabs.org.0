Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AE7A671EF
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 12:00:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH84Q6WPhz3c9x
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 21:59:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742295586;
	cv=none; b=PzJFfALH/3xEYf4B/TK9O8ioo2zLiyHrl+xyezC4DHv/vaq/P/TJEvZxPj49B5/BpXrDAMuuUtQDO3VGNGGo48+N2Rx4mr0iYtVDmqeDYZNGg0eJEuLNUKvWH6V/YBwxMMbFOf1qYl78CG2uEaPGzhcEZK2W/KP7k8949WEVW6/a2ucQQAmFcv98UR+ZtEiSxhUP2VMzqNboxPWO1U9OnOj0sKtSEB6L63LvMkHyTH31ljq0Z32MoYxhHbD7MjCqH0J3/YD1AYUnMlNbgXDKEEGI/gLT+leAUujATGI5hYlDCCbF4R4GWF1IY84K0onfZohEwpi5C/QjOu49hRqVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742295586; c=relaxed/relaxed;
	bh=xhA20a1giyygMYB5F+ic7LpD6FeCXdJlQSf/S9lVgMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecoYk0f0GdIhNUUaSdhGrQKONSQFIGW1jZIPGkpWrDxxfQyJcF6sRSj96mVZmPK/6QEnknfk/t9tV8qaqUROBO6mMnD/zzU/gUcOkU47G26cmZuvXU8Ld2RAiqiKqEM0Hn/948uBvD5UEwo9Xb5sBTBzA3Jch42q+Gi5bEw4MUlN1rCskB1FzKLpt9m5e9/oyk268RwlJATeciX458bAdc/NDbc822wUs69EJf82eRYBszxUlo6Kg7ymdc9KVrLuJffhipoWcnWDk9hSklqnwVnF875BKz1ohwOhvWBLdgSJm2MiPs0/vFYejeiNJbnzLD+9yXJDPCybhW+igIMylw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nQ12QItL; dkim-atps=neutral; spf=none (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nQ12QItL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH84H2xfCz2yrY
	for <openbmc@lists.ozlabs.org>; Tue, 18 Mar 2025 21:59:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295583; x=1773831583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QrndgZbN9z1XtoTGR06yFti0xSwFxjHct0FERYdF7BA=;
  b=nQ12QItLtxX2/e9e5afO4La9C9+wfSFrOMIRtZUufVgwqwNuOC9aDog5
   Q2NF20w4aGL0eDHVW2KIDsWAw8DYzoMqYPe+HYpU5lshV1eiKzJRWhIgG
   MWXB/5i3iBGx/GMlEaCFKMB+2J9vKtBFhEoKTxNk2GNY5E7NOtqBkxzga
   nRns4E4fWk6bBlxkHSvN1oRUePbK2y7iTrnSzpt5yddwnt4KagheUO4/C
   yobOufDjiAH+zVuKShersTEZ9EWeCZ7yMgfjFRMIYBcefNZGA9BANK3Tg
   oN186Nh6fLT4mY1nH3l03319c6TqScBjbSFAhQkI+5eDvUnR6ieVJvl6R
   A==;
X-CSE-ConnectionGUID: sw3AFcE0S1WzcfaTRO/Zvw==
X-CSE-MsgGUID: 45/OOQrATN+cgPuz7YylxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781755"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781755"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: epYLmD4nSv++05dKgL+RbQ==
X-CSE-MsgGUID: oAb6QjutR1yMp+GHh+cTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215696"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E65112E2; Tue, 18 Mar 2025 12:59:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 2/5] pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP()
Date: Tue, 18 Mar 2025 12:57:15 +0200
Message-ID: <20250318105932.2090926-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Shan-Chun Hung <schung@nuvoton.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
Utilize them instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 16 ++--------------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 16 ++--------------
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 62a46d824b46..2601aacfb976 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -504,17 +504,6 @@ static const int lkgpo2_pins[] = { 9 };
 
 static const int nprd_smi_pins[] = { 190 };
 
-/*
- * pin:	     name, number
- * group:    name, npins,   pins
- * function: name, ngroups, groups
- */
-struct npcm7xx_group {
-	const char *name;
-	const unsigned int *pins;
-	int npins;
-};
-
 #define NPCM7XX_GRPS \
 	NPCM7XX_GRP(smb0), \
 	NPCM7XX_GRP(smb0b), \
@@ -642,9 +631,8 @@ enum {
 #undef NPCM7XX_GRP
 };
 
-static struct npcm7xx_group npcm7xx_groups[] = {
-#define NPCM7XX_GRP(x) { .name = #x, .pins = x ## _pins, \
-			.npins = ARRAY_SIZE(x ## _pins) }
+static struct pingroup npcm7xx_groups[] = {
+#define NPCM7XX_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	NPCM7XX_GRPS
 #undef NPCM7XX_GRP
 };
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index f6a1e684a386..eac43315a360 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -587,17 +587,6 @@ static const int hgpio5_pins[] = { 25 };
 static const int hgpio6_pins[] = { 59 };
 static const int hgpio7_pins[] = { 60 };
 
-/*
- * pin:	     name, number
- * group:    name, npins,   pins
- * function: name, ngroups, groups
- */
-struct npcm8xx_pingroup {
-	const char *name;
-	const unsigned int *pins;
-	int npins;
-};
-
 #define NPCM8XX_GRPS \
 	NPCM8XX_GRP(gpi36), \
 	NPCM8XX_GRP(gpi35), \
@@ -829,9 +818,8 @@ enum {
 #undef NPCM8XX_GRP
 };
 
-static struct npcm8xx_pingroup npcm8xx_pingroups[] = {
-#define NPCM8XX_GRP(x) { .name = #x, .pins = x ## _pins, \
-			.npins = ARRAY_SIZE(x ## _pins) }
+static struct pingroup npcm8xx_pingroups[] = {
+#define NPCM8XX_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	NPCM8XX_GRPS
 #undef NPCM8XX_GRP
 };
-- 
2.47.2

