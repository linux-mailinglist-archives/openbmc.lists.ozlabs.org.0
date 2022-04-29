Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3266B5148FC
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 14:16:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqWgm0yKfz3bfh
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 22:16:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gQOVoQeN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gQOVoQeN; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqMcW6clDz2xtK
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 16:13:29 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id r13so13501227ejd.5
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 23:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qVdXSHSh7EwA/4nqmLTvK4Lay7sxQolbudvBwlJyLB8=;
 b=gQOVoQeNfTBai5DFopXLol0qcvPH+FLsNpUjfjRfy2qL4OVU6Q2vYHplc1VNAQndU+
 YGiPmTXclJbU4IOL85DTmUCdIatSO6fYbIxAZFPpOF+vVGtfaiSqKyAK6L9i8ECLWZQi
 QHZwtzEBVay2bJjvMWpccuYhjoa5HJupJPBlPjDS4Jlx/2I2mviW5AGFOMZjC55d1C6z
 OKaKSsdJeqAmG/MvHfbYOu9XUHKRoVMRN3NPLfcc7OmcR/P4z0hrC+h1ZCiDwkvZCGT2
 eanOlarvyLc+gGwdUzSeZns0Gg6fRRfiqZaflrPCftX66MRzTi7t08lN3AJ+MIlhqUbN
 RU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qVdXSHSh7EwA/4nqmLTvK4Lay7sxQolbudvBwlJyLB8=;
 b=kdXenzN5hhHWS3hTsHRPyJgTwVHJNc6SlyQp2XU5PR4voQKWF3sO6CrIVQBLT33bMU
 5coQkMcEkcnV6Mc0CR0Y4KJse+EvWzicu1+I0mX/tJHnvnD4Smv7pAQdx3pumHwaMBee
 Zzb8ETEaQt0/706eJNo3gxi1USilXMDuB9oUZntdqa/1Vkdu8ihDwFdLxjxn/GgfDDw9
 giTO19E0zWTQ0yOFp4mAa1Wcmws8zASPK6Jq2YppLwUvQ697zxSQxuyWrHDxbiv5XqIZ
 36a4WMrPaGxoyWW9/ZWFv7frPd7rfz1TwZ9flmGD3ckBZlHN/AmTEY9V94UD7DZ4QDbw
 IJ9g==
X-Gm-Message-State: AOAM532WpRztsUfFVPC0EDY3hJfxz5Bi+iUhBf4gZJw/63m4XCo5Twba
 4zFYhp0kS6sTdwbb4RCI2pk05Y3ylWEspQ==
X-Google-Smtp-Source: ABdhPJx9AFEol2KkE4AyRlTaUgsGtUiyykZiEpX6D8UZc2S0zDAJ2YF4sSjK1LMV90bxH51xflHx7Q==
X-Received: by 2002:a17:906:a0ce:b0:6d1:cb30:3b3b with SMTP id
 bh14-20020a170906a0ce00b006d1cb303b3bmr34598141ejb.582.1651212805367; 
 Thu, 28 Apr 2022 23:13:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 eg51-20020a05640228b300b0042617ba63casm2469039edb.84.2022.04.28.23.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 23:13:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] pinctrl: nuvoton: Fix irq_of_parse_and_map() return value
Date: Fri, 29 Apr 2022 08:13:20 +0200
Message-Id: <20220429061320.25032-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Apr 2022 22:12:55 +1000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.

Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Rebase on Linus' devel branch.
   Will later conflict with: "pinctrl: npcm7xx: Switch to use
   for_each_gpiochip_node() helper"

Changes since v1:
1. Correct the return value passed further.
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 9557fac5d11c..44b77dd06d90 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1879,11 +1879,10 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 				ioremap(res.start, resource_size(&res));
 
 			irq = irq_of_parse_and_map(np, 0);
-			if (irq < 0) {
+			if (!irq) {
 				dev_err(pctrl->dev,
 					"No IRQ for GPIO bank %u\n", id);
-				ret = irq;
-				return ret;
+				return -EINVAL;
 			}
 
 			ret = bgpio_init(&pctrl->gpio_bank[id].gc,
-- 
2.32.0

