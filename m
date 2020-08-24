Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD72507C6
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 20:35:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb1635vCWzDqQn
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 04:35:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=USYQV3t+; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb0zY4q7tzDqNH;
 Tue, 25 Aug 2020 04:30:17 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id m34so4962600pgl.11;
 Mon, 24 Aug 2020 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PvahKbRIpaFw4iDFms58BHKJX5qJVF7TGaQHbBglo1Q=;
 b=USYQV3t+wV42/UGZaeIIOH0qk8f3VEaRroVBT74bC6gIah8i5jwxPLwwMA2ElVq6wG
 w0nU3uXq+y8QnaBpZRtQwX/U7jY/2OXZX7ALpJjv9upxAkVMLamh5rUHwvE1JM2vyN3L
 s8x2HoCtkKU/l6MwQepHdfmgEvgd8o7PzgqaZbjyxCeHohEp43LcxI6xPxJWvZh/wutO
 i3W+ufTYc61BXBcbRpO6tjF2abCwFjrUZcg/WtzhwP8pudifB7GFGjJbRdxAU+3SKwRj
 cM5NRcSpKgBiKUe0+f7tp5/gx5mvMq8wrqLs8cH7mQC+f73PCIRo+TincUihwrqkYU9U
 Q6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PvahKbRIpaFw4iDFms58BHKJX5qJVF7TGaQHbBglo1Q=;
 b=T8w8qvS25qN6qBKopqkzrnheLxI/BbjR0+MlqLDrrYYfn3+/zh9povoQ3ZYyRopkDO
 KCXftBhTh8G9QVpHUYNELBqFS19uZXisTjWNg49Q9QMtFzY05ssiJLOHXtH2o6wyOn3x
 HbMWbWkdBYpl+lwx6Xi/mViH2jlde3bChbliOW9Hv4XqUro4Wme11xqG1q16b7XyrD8c
 SDSCRpt5FT+w6sLcjXIxIfXGPQAkyYXxauHElz+/020SjaWrSpe1UP6sdHAIzAQYLAQt
 o9l7UDqNFo9Qp7L9uvidjfFV9ni3Bq/KdpgPQnQP0wr7o/TBWtIBBWLReOMhzgIoS8MJ
 vP6w==
X-Gm-Message-State: AOAM531ST/TxdQPv0VykAao0WgUYAspX5BiV+deZBxnRjCGBGKuFxote
 nqrcbF3I73YPpbiF0B5P3D0=
X-Google-Smtp-Source: ABdhPJwOcYBnWFbgKF+6O2k9o9I+Z1j8AlUiizd4ou69B2Cwjcf4cGLwm9hW0621dJdwD7JdcGWN8w==
X-Received: by 2002:a17:902:7790:: with SMTP id
 o16mr4315839pll.299.1598293813850; 
 Mon, 24 Aug 2020 11:30:13 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id a66sm3920460pfa.176.2020.08.24.11.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:30:13 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 2/2] ARM: dts: aspeed: wedge40: Update UART4 pin settings
Date: Mon, 24 Aug 2020 11:29:55 -0700
Message-Id: <20200824182955.7988-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824182955.7988-1-rentao.bupt@gmail.com>
References: <20200824182955.7988-1-rentao.bupt@gmail.com>
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

Enable UART4's NRTS4 (A19) pin because the pin is used for RS485
software emulation.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index 3f2a48fa77b3..8c426ba2f8ab 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -71,7 +71,8 @@
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_txd4_default
-		     &pinctrl_rxd4_default>;
+		     &pinctrl_rxd4_default
+		     &pinctrl_ndts4_default>;
 };
 
 &uart5 {
-- 
2.17.1

