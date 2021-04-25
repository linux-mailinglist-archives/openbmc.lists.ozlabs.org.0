Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AFE36BCD6
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 03:05:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTk8H5NRFz2yjP
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 11:05:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pRz0l7oB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=jrdr.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pRz0l7oB; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FSnMQ1jyvz2yQy;
 Sun, 25 Apr 2021 22:26:39 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id g16so10626643plq.3;
 Sun, 25 Apr 2021 05:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Q7owk5I/h07ZR9RenvZgNntZV/8AwXDtuPUVeIWpklw=;
 b=pRz0l7oBO6FtwOfvsLCp3Sidezt3fCH+ojSHWrry3APSCneGlpxrA6PEKMxcbk2qzh
 KQOxiKsrLb9dnTLpfqEKkE8Us6ALirJIweZLTpUTrrpXDVcKm2MmMPa6c7i9esjSNs9G
 ogLFlWM4iy4AMRL/N0tJUiI4gflasVm/kol8aVm/4iglSJSSXlg72bHBh84wzpSDvmg9
 tKMygsxycBjUnurIBrqEmpzaVsgK4XI00+VBKCb2f8CCt3w1C/+fy6E0yOo869DRVAmi
 8lUpwbXtp8oKCpXDA/Dt1J4QVXYDqBShIjBGIx7yel7mFur5uhUEJ3xjRATxu83hU7yN
 yaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Q7owk5I/h07ZR9RenvZgNntZV/8AwXDtuPUVeIWpklw=;
 b=ul78es39OXsrecfzgYnKxjT0xH/88J6KM8yom+75H9hYD2eRdsm6e2Mx4rUWQwjE4F
 hNfSAoy7WwGwrRVmwK/3OxtlbOWx0K1r1L+uVGYTmT8niIHmJw+WoEhL1AvfoPK7O1vh
 eaqwhCko9g3/KvQbUldmF+rS8g50panthxJEFtE2CnZ4C+wgI4qMNHwXHSQEXJ8+VsIx
 XTqqrJNR6d2WQw4rAOUslj4pTtATIBvEHyeiSHdN0doVpjNgJsofpEwzxyNJghtx/WUs
 dA1F8i1PknG7uPEG+er4q9aV1tq79ftYN6mXtCyC8OC5+49FOT/1I5w4+VwsPuVOO6as
 lvvQ==
X-Gm-Message-State: AOAM532cDUZeaoa4ecVoQEW3VhqBoqSZiApvP/yexM4tpYJfnRu5bgDC
 B3o3Lwu5w41oLKE0WdXoLmo=
X-Google-Smtp-Source: ABdhPJyA4qBnZ0a7f1/UsEw+YIdSkmMmpLnxCfTeSt7ZilQ33L2out6vc8cXFAwOyMKEehZzLcUS7A==
X-Received: by 2002:a17:90a:a081:: with SMTP id
 r1mr5108610pjp.101.1619353595209; 
 Sun, 25 Apr 2021 05:26:35 -0700 (PDT)
Received: from localhost.localdomain ([49.37.83.82])
 by smtp.gmail.com with ESMTPSA id ir3sm11695075pjb.42.2021.04.25.05.26.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Apr 2021 05:26:34 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: andrew@aj.id.au,
	linus.walleij@linaro.org,
	joel@jms.id.au
Subject: [PATCH] pinctrl: aspeed: Fix minor documentation error
Date: Sun, 25 Apr 2021 17:56:24 +0530
Message-Id: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 27 Apr 2021 11:04:39 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Souptick Joarder <jrdr.linux@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Kernel test robot throws below warning ->

drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c:2705: warning: This comment
starts with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst
drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2614: warning: This comment
starts with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst
drivers/pinctrl/aspeed/pinctrl-aspeed.c:111: warning: This comment
starts with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst
drivers/pinctrl/aspeed/pinmux-aspeed.c:24: warning: This comment starts
with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst

Fix minor documentation error.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 4 ++--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 4 ++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 3 ++-
 drivers/pinctrl/aspeed/pinmux-aspeed.c     | 3 ++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 996ebcb..4c0d266 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2702,8 +2702,8 @@ static int aspeed_g5_sig_expr_eval(struct aspeed_pinmux_data *ctx,
 }
 
 /**
- * Configure a pin's signal by applying an expression's descriptor state for
- * all descriptors in the expression.
+ * aspeed_g5_sig_expr_set() - Configure a pin's signal by applying an
+ * expression's descriptor state for all descriptors in the expression.
  *
  * @ctx: The pinmux context
  * @expr: The expression associated with the function whose signal is to be
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 5c1a109..eeab093 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2611,8 +2611,8 @@
 };
 
 /**
- * Configure a pin's signal by applying an expression's descriptor state for
- * all descriptors in the expression.
+ * aspeed_g6_sig_expr_set() - Configure a pin's signal by applying an
+ * expression's descriptor state for all descriptors in the expression.
  *
  * @ctx: The pinmux context
  * @expr: The expression associated with the function whose signal is to be
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 9c65d56..9bbfe5c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -108,7 +108,8 @@ static int aspeed_sig_expr_disable(struct aspeed_pinmux_data *ctx,
 }
 
 /**
- * Disable a signal on a pin by disabling all provided signal expressions.
+ * aspeed_disable_sig() - Disable a signal on a pin by disabling all provided
+ * signal expressions.
  *
  * @ctx: The pinmux context
  * @exprs: The list of signal expressions (from a priority level on a pin)
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.c b/drivers/pinctrl/aspeed/pinmux-aspeed.c
index 57305ca..894e2ef 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.c
@@ -21,7 +21,8 @@ static inline void aspeed_sig_desc_print_val(
 }
 
 /**
- * Query the enabled or disabled state of a signal descriptor
+ * aspeed_sig_desc_eval() - Query the enabled or disabled state of a signal
+ * descriptor.
  *
  * @desc: The signal descriptor of interest
  * @enabled: True to query the enabled state, false to query disabled state
-- 
1.9.1

