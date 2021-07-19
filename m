Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF53CCBBC
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 02:18:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSj9s0M1yz308b
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 10:18:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=k3hAZ7iq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=k3hAZ7iq; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSj925Kb0z2xv9;
 Mon, 19 Jul 2021 10:17:41 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 h6-20020a17090a6486b029017613554465so1212744pjj.4; 
 Sun, 18 Jul 2021 17:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BHNRWvNe8lxqEgkTN+Pq/ZUg7iyzUjJYcM1nQZBO3r0=;
 b=k3hAZ7iqpFgkMGOAGroPjCxgHstNs+5xyNCahw7Xj3c+jAavEmpZ0wCwZmIeoxI7qd
 Juvgbbkg+ATLTkqJiw6rEf4mXqjq0C446LPSKpVvgGEMdFnoKcV0Q+2xFxBzAaif25eS
 ppkybrMSDj96k/gHhQG5I0Ee6Vo++IQJ2Xvm+5tUDFbCiLQIyoPhoBssAJ4GogxBJrDj
 aotH3459/JHkWa4g7h8wrXpOWRUEUWYLgOof12xgQe75SDnZr/ZFre9ZrYe4TzRZDpBz
 f//HWZCtpI053N9OEVkaCddVZOyC8F8EEGxoCJePGE5qkCWv35/mveosI1XwHny2oo8e
 qXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BHNRWvNe8lxqEgkTN+Pq/ZUg7iyzUjJYcM1nQZBO3r0=;
 b=OV4ZeLpPrp6GBHYMLK+0+txGSlwZBUwm8PA4lSLihhwHNHrZ6+R0RgzGeFh+/nQ8s0
 dOE0DL8VeqEIrT+2/NrmwVdN5C4tJyi6UtX+dvFh5D/Yp/uGen4U8r99bsMwpOfx4wB/
 JreMgJqU7lc/Qlg1+IzPkq2kn8FFFGP5/RJYtJci3TLLm4e2qIW8htreKldC16G4AkHu
 Lg2h7YA6gfEhyVjXtQBiO86Q2ZbU+4A7KHcOpV0WR/KAR/OnVcSOnNf3YXvhRxdnjMnj
 9ccZk5um6R/uMb/LuxR87tCoXVl0cdlbiW+manjMVYS/e3rpTi2/y14hxc1vWww5VBNx
 nqpg==
X-Gm-Message-State: AOAM533iMNPxakcJsGhzBpHK+McfVyfyKb24h8KYX8Sb65HBMdJ+YpMR
 1OXiwzhfMhcqfEpw6MgBiIw=
X-Google-Smtp-Source: ABdhPJyDbFhNMaG8afSEbgfqPufO9cEJD4fReUGCqFjKkqqzCPigl143R1J2U8F0abL2KLgCinfzzQ==
X-Received: by 2002:a17:90a:9ac:: with SMTP id
 41mr27060197pjo.97.1626653859124; 
 Sun, 18 Jul 2021 17:17:39 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id x7sm1059847pfn.70.2021.07.18.17.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 17:17:38 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 2/4] ARM: dts: aspeed: wedge40: Remove redundant ADC device
Date: Sun, 18 Jul 2021 17:17:22 -0700
Message-Id: <20210719001724.6410-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719001724.6410-1-rentao.bupt@gmail.com>
References: <20210719001724.6410-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Remove ADC device from wedge40 device tree because the device is already
enabled in "ast2400-facebook-netbmc-common.dtsi".

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index 2dcfeae3c92a..6624855d8ebd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -23,10 +23,6 @@
 	status = "disabled";
 };
 
-&adc {
-	status = "okay";
-};
-
 &pwm_tacho {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.17.1

