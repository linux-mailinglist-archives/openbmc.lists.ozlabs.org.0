Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3E983E62
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 02:32:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463CBr2xCVzDr7D
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 10:32:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="az+UmsXm"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463CBJ5LSJzDqpq;
 Wed,  7 Aug 2019 10:32:08 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id p13so14995483wru.10;
 Tue, 06 Aug 2019 17:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GGs8MT6FGlCkbNNH7TTlHmnRq/ZZmT2kM4HCkC2iAKw=;
 b=az+UmsXmDuq0cUhWJaho5IgfxSfXKToHUabQ1qKX5d/vT3zH87nkJ2i5gDs/K+jCy1
 DQefVcwEeK7GXtQWtwnU8isjUoMThDEhn5YvyURbVwRC1ppp23CPg+idSb4c2+qqZABJ
 vI5QmFWHBrhwxE1ebD2Ahhi/8ItA4cw8m7cWaYspTCRxUwI8yEbX6XN7SFoQFZz+Pv+2
 +owVGTu2fr3Rt4XaTdrV9JScsafyA9POwGXWsmRNVDCqDiNsSLuDlc/zPwusE/2JERCZ
 9oWK3+0Aoz1yhxW5n58r5gNe3ZPPJfE8XXIAwnRzZjNnwy4nAg8osT246qbwoYnNP3Z9
 yKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GGs8MT6FGlCkbNNH7TTlHmnRq/ZZmT2kM4HCkC2iAKw=;
 b=TWyIx00fsI9X31gezsyR0zKhJNqXKCOHdALgISrqX2Zq4bqqCD8aMYJCsZ3MwU/2jG
 om8PBQ2/Z6BKqBMwMRkZdFl5pLYXIAistb66F/+pX6ef1YSdxE5A5gEn5QLuEcWGGZ5K
 9KQS9A8oQtG1hBMzkGsyVH9Q43qAm2GmJkPiUeumCCXcRItRJlPh6ZGbCzg6LbMIQoR9
 /Po5GY3JWwUHr8vJJgqVNHrPW0NIovFJZWTomL7i9r6qSYQGRGPL7Yf8y+Wx5Fxl2S/E
 XKEUOqCWjsUkDJAkq6kduIFhj/qRPI5Lkem0arGwR50x8iJi4EK0igMGihI5t0bYFvke
 D7JA==
X-Gm-Message-State: APjAAAW72gIEDqceE3lO/QgvFZiiJz3y5aGUB5RpydOlv2oM4iIoVvwr
 cSln41wj+/hIiTOhdBBfXhA=
X-Google-Smtp-Source: APXvYqynFI9yVSwY6UqnrCwxba4J2DyfeETuCPqf8QdPoeXnlnppBxsfHbIvGeLFeGUQTKIz3twsdA==
X-Received: by 2002:adf:f646:: with SMTP id x6mr7256533wrp.18.1565137923815;
 Tue, 06 Aug 2019 17:32:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id 91sm183684963wrp.3.2019.08.06.17.32.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 17:32:03 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: aspeed: g6: Remove const specifier from
 aspeed_g6_sig_expr_set's ctx parameter
Date: Tue,  6 Aug 2019 17:30:37 -0700
Message-Id: <20190807003037.48457-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: linux-aspeed@lists.ozlabs.org, clang-built-linux@googlegroups.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

clang errors:

drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2325:9: error: incompatible
pointer types initializing 'int (*)(struct aspeed_pinmux_data *, const
struct aspeed_sig_expr *, bool)' with an expression of type 'int (const
struct aspeed_pinmux_data *, const struct aspeed_sig_expr *, bool)'
[-Werror,-Wincompatible-pointer-types]
        .set = aspeed_g6_sig_expr_set,
               ^~~~~~~~~~~~~~~~~~~~~~
1 error generated.

Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
changed the set function pointer declaration and the g6 one wasn't
updated (I assume because it wasn't merged yet).

Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
Link: https://github.com/ClangBuiltLinux/linux/issues/632
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 6012d7d4a22a..648ddb7f038a 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2267,7 +2267,7 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
  * Return: 0 if the expression is configured as requested and a negative error
  * code otherwise
  */
-static int aspeed_g6_sig_expr_set(const struct aspeed_pinmux_data *ctx,
+static int aspeed_g6_sig_expr_set(struct aspeed_pinmux_data *ctx,
 				  const struct aspeed_sig_expr *expr,
 				  bool enable)
 {
-- 
2.23.0.rc1

