Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 577BF3F12EE
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 07:49:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gqv3z24kCz3bWB
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 15:49:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fhVU3TVK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fhVU3TVK; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gqv3W2T6fz30JT;
 Thu, 19 Aug 2021 15:49:26 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id s11so4821573pgr.11;
 Wed, 18 Aug 2021 22:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IF17aolAlURwpUnWUph8bUVhuWbBF2d6WJwX4WbnNTg=;
 b=fhVU3TVK4EAJzDg0y7JBPMoHqfMgacKk7BaEeiEhp2P/1OtoeYnQW73MiUhPEINzfd
 W1EErwSVTem6Zw3ereTktMLp0iQVdpRKMvijGloX4eD0fL9Mgl8nww1Y1yQ726jlw9lV
 x1fmbNM/gLKUsbyv+nHt+oABX4NRv5mHHX+qw+QMRoRlBPglQewt4dW3664GY2GLH5Dh
 zHOvHI/+uPAxMz6069Bm+9sPOfw16LjITtUkwaLzIsK/5jQldKpaxS8HOLjLZyysR5tw
 SyUjPxqoU5oDotEqWU7U0srYvabEBBIMn3QE/hQKOogngAn+ozVLhMpo1jQ98t2Omz/F
 pbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IF17aolAlURwpUnWUph8bUVhuWbBF2d6WJwX4WbnNTg=;
 b=QI4C/vd+sL/Wx4ZYyJtuVp5OXns8YFyL5ZovGzz70aIm7s5PtxtniT/jSkoFxZMEgn
 +58Nfs+BhBdsaabqtJwy9m7jj/ioOJv80E/YtmdjYYmUphRL3y5osLPYjojy+f+ZZRGz
 LWcJEAq/LDboEqL776XsJdFpVHQHa4+A/e8oqd2sMLGEcxFJQ4QjqA/IHjtW7JgltkwX
 d1NIdsAzewsLRgsk4+1RU4kYMgGesbwhQ6N/M3b27UmYurTUcgePrfhLwliVeMkv7qKY
 TDKx9qGPm9ufYU9BDUFn3EzZz6AEr7lSH6vc3SXjG3YroNmt034Y35cjTvyCKISyUfFd
 GC0w==
X-Gm-Message-State: AOAM530gdNxQ1AlpWACaHb7LninJZzxqamoFuQe4FYn1Kidm0GYV3oLY
 4iOILI12ZCc3HHwd8TXwgHw=
X-Google-Smtp-Source: ABdhPJwhUxuij/OaFSxq7kv9lP7YJX3qeVZtyD9ZWBFOitm1Q6pm8+MiqsKVV9CJGtOzsEC44ZOv1w==
X-Received: by 2002:a65:6805:: with SMTP id l5mr12760687pgt.0.1629352163111;
 Wed, 18 Aug 2021 22:49:23 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id x19sm1821520pfo.40.2021.08.18.22.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 22:49:22 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dtd: fp5280g2: ENable KCS 3 for MCTP binding
Date: Thu, 19 Aug 2021 13:49:08 +0800
Message-Id: <20210819054908.140514-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.30.2
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
Cc: robh+dt@kernel.org, George Liu <liuxiwei@inspur.com>,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 1752f3250e44..d0c3acbf6c8c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -3,6 +3,7 @@
 #include "aspeed-g5.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "FP5280G2 BMC";
@@ -902,4 +903,10 @@ fan@7 {
 
 };
 
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+};
+
 #include "ibm-power9-dual.dtsi"
-- 
2.30.2

