Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BB83D3254
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 05:49:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWFgm2mD8z30CQ
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 13:49:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QdogLg15;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=QdogLg15; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWFgL07m5z2yNw;
 Fri, 23 Jul 2021 13:49:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ftxXD+615Sr9nOCpiYUCXYRWxt8w1W0jBYcrbNw9gUM=; b=QdogLg15yH+3jnjlnYrKRd6Dqm
 X6eWDuihL7IX278H+wtGKb5i13JqkZGCgeqGtvviF++bp6ieuUcjLFh6p0vTCwQR5iS0Ubpx9p/nv
 yhgcUmMbi8TLkWRfnKPr0Rfw+OFV56nf8hRlvJphzjSS/LpSP9sB9Ret5jRU7RF9xTAb5CJA8NmrB
 BwjuvxE3wcr0mh+kKqxMp+VcrH4MrkqgfhnlX952yGWHfDcX892InBS7Nlpb8rBSWFfXIqE0QFDR2
 vjtF1I+tnGe/nigtOazk6qkqj0anqn4IbeQDXqMs/2Cj3EH+oFx+pEVGTMGPSFVBgiqnD/4OsbFLz
 czN3gNXg==;
Received: from [2601:1c0:6280:3f0::a22f] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6mB2-00AxAt-TO; Fri, 23 Jul 2021 03:48:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: 
Subject: [PATCH] pinctrl: aspeed: placate kernel-doc warnings
Date: Thu, 22 Jul 2021 20:48:40 -0700
Message-Id: <20210723034840.8752-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org,
 Aditya Srivastava <yashsri421@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Eliminate kernel-doc warnings in drivers/pinctrl/aspeed by using
proper kernel-doc notation.

Fixes these kernel-doc warnings:

drivers/pinctrl/aspeed/pinmux-aspeed.c:61: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Query the enabled or disabled state for a mux function's signal on a pin
drivers/pinctrl/aspeed/pinctrl-aspeed.c:135: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Search for the signal expression needed to enable the pin's signal for the

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Aditya Srivastava <yashsri421@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: openbmc@lists.ozlabs.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c |    4 ++--
 drivers/pinctrl/aspeed/pinmux-aspeed.c  |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20210722.orig/drivers/pinctrl/aspeed/pinmux-aspeed.c
+++ linux-next-20210722/drivers/pinctrl/aspeed/pinmux-aspeed.c
@@ -59,7 +59,8 @@ int aspeed_sig_desc_eval(const struct as
 }
 
 /**
- * Query the enabled or disabled state for a mux function's signal on a pin
+ * aspeed_sig_expr_eval - Query the enabled or disabled state for a
+ * mux function's signal on a pin
  *
  * @ctx: The driver context for the pinctrl IP
  * @expr: An expression controlling the signal for a mux function on a pin
--- linux-next-20210722.orig/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ linux-next-20210722/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -133,8 +133,8 @@ static int aspeed_disable_sig(struct asp
 }
 
 /**
- * Search for the signal expression needed to enable the pin's signal for the
- * requested function.
+ * aspeed_find_expr_by_name - Search for the signal expression needed to
+ * enable the pin's signal for the requested function.
  *
  * @exprs: List of signal expressions (haystack)
  * @name: The name of the requested function (needle)
