Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A713820452
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 13:15:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454TP26MMmzDqbf
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 21:15:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EIPRZXqe"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454TMQ3WkczDqZS
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 21:14:09 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id c13so1426619pgt.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YqYG5ROMU1jr98UFSb4lwRYp5AhBZ3Sz3t+nYFWpTiM=;
 b=EIPRZXqeRdT4TZZPAUGo+5tFlpzl8jfy0bNRfnKN1m6nD0bL4gafIcfsmfYn1wzEWo
 L9tquDHAaZdXGcZtfVzS0/Rk70b8Ni68+dYNdmpJChVeA4CFN+o+MmTpRyRUKs+svXGP
 ybygpNO5cXzQhg4dYUEeFjcbjzsZzz7OXJLbU1p+Fo9QEgI2FIuER0wa4LRGjnJdC221
 Q0BG2r2QA4SiQtD1AcvWDwaeHsvP9c5Gc420AXNQBCWLApyicty9JcmhLQKPTsadWXOr
 4mFsSZWHYk88Fk+NAVmJXTD7JbcaLkNXZF4JetPBkWL3wsg/aoJiAgDT5fFQVXpGC8Zk
 TQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YqYG5ROMU1jr98UFSb4lwRYp5AhBZ3Sz3t+nYFWpTiM=;
 b=TaaR1+kljqCxzoiWPNumXlbnMaO/PIq3SomztzdVuMoO1bZbSsGfQj6todY6xqQVhY
 Cxq1rYN7xA/d3YDIh0+ijWm+FZvS8uPSX38LHuxWzYqAg+GlitmPcbMS9TelODhCK1BX
 Biqv/md0NoWX3ydydANO6620DqXqLg6171TX+VhnYwunr1vPWWRABRICGqXP9RDZYK0M
 LsnVVDMn9AlWTA3oJh+Qn49bW/FdVGsA2PJ10wkwjsDhcRuYDufs+hxhsM4pV8Ihl0ff
 DtNY/LX65JxF1zkydoQQn45BVEAjF+IXf88pn3hTNOyxbk3x0qr8iUQnxiMmMTopZxLx
 vlxw==
X-Gm-Message-State: APjAAAU82i4QIjt+AdqbA9M25UahYeamcC5YNmIbpuDgTk00aM+LGwl2
 XWEmcxmJ4QgOg5/RpB+LL30=
X-Google-Smtp-Source: APXvYqwHwz2aZKdRAif6MQBLBM4FrF0yuzIANIEos2ehc9KqLg2dOtO7W/73rMFFbJZgxaczZBcIuQ==
X-Received: by 2002:aa7:98c6:: with SMTP id e6mr52955207pfm.191.1558005247316; 
 Thu, 16 May 2019 04:14:07 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id n2sm5962742pgp.27.2019.05.16.04.14.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 May 2019 04:14:06 -0700 (PDT)
From: Fran Hsu <franhsutw@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v4 2/4] ARM: dts: nuvoton: Add Quanta GSJ BMC Device
 Tree.
Date: Thu, 16 May 2019 19:11:58 +0800
Message-Id: <20190516111200.13859-2-franhsutw@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516111200.13859-1-franhsutw@gmail.com>
References: <20190516111200.13859-1-franhsutw@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Quanta GSJ BMC device tree part 2.
This file included the definition of following two functions:
1.GPIO
2.LED

Signed-off-by: Fran Hsu <franhsutw@gmail.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 195 ++++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 7cac83c6566b..bebd3878fcb3 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -409,5 +409,200 @@
 		};
 	};
 
+	pinctrl: pinctrl@f0800000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <
+				/* GPI pins*/
+				&gpio8_pins
+				&gpio9_pins
+				&gpio12_pins
+				&gpio13_pins
+				&gpio14_pins
+				&gpio60_pins
+				&gpio83_pins
+				&gpio91_pins
+				&gpio92_pins
+				&gpio95_pins
+				&gpio136_pins
+				&gpio137_pins
+				&gpio141_pins
+				&gpio144_pins
+				&gpio145_pins
+				&gpio146_pins
+				&gpio147_pins
+				&gpio148_pins
+				&gpio149_pins
+				&gpio150_pins
+				&gpio151_pins
+				&gpio152_pins
+				&gpio153_pins
+				&gpio154_pins
+				&gpio155_pins
+				&gpio156_pins
+				&gpio157_pins
+				&gpio158_pins
+				&gpio159_pins
+				&gpio161_pins
+				&gpio162_pins
+				&gpio163_pins
+				&gpio164_pins
+				&gpio165_pins
+				&gpio166_pins
+				&gpio167_pins
+				&gpio168_pins
+				&gpio169_pins
+				&gpio170_pins
+				&gpio177_pins
+				&gpio191_pins
+				&gpio192_pins
+				&gpio203_pins
+				/* GPO pins*/
+				&gpio0pp_pins
+				&gpio1pp_pins
+				&gpio2pp_pins
+				&gpio3pp_pins
+				&gpio4pp_pins
+				&gpio5pp_pins
+				&gpio6pp_pins
+				&gpio7pp_pins
+				&gpio10pp_pins
+				&gpio11pp_pins
+				&gpio15od_pins
+				&gpio17pp_pins
+				&gpio18pp_pins
+				&gpio19pp_pins
+				&gpio24pp_pins
+				&gpio25pp_pins
+				&gpio37od_pins
+				&gpio59pp_pins
+				&gpio72od_pins
+				&gpio73od_pins
+				&gpio74od_pins
+				&gpio75od_pins
+				&gpio76od_pins
+				&gpio77od_pins
+				&gpio78od_pins
+				&gpio79od_pins
+				&gpio84pp_pins
+				&gpio85pp_pins
+				&gpio86pp_pins
+				&gpio87pp_pins
+				&gpio88pp_pins
+				&gpio89pp_pins
+				&gpio90pp_pins
+				&gpio93pp_pins
+				&gpio94pp_pins
+				&gpio125pp_pins
+				&gpio126od_pins
+				&gpio127od_pins
+				&gpio142od_pins
+				&gpio143ol_pins
+				&gpio175od_pins
+				&gpio176od_pins
+				&gpio190od_pins
+				&gpio194pp_pins
+				&gpio195od_pins
+				&gpio196od_pins
+				&gpio197od_pins
+				&gpio198od_pins
+				&gpio199od_pins
+				&gpio200pp_pins
+				&gpio202od_pins
+				>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-bmc-live {
+			gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		LED_U2_0_LOCATE {
+			gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_1_LOCATE {
+			gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_2_LOCATE {
+			gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_3_LOCATE {
+			gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_4_LOCATE {
+			gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_5_LOCATE {
+			gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_BMC_TRAY_PWRGD {
+			gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_7_FAULT {
+			gpios = <&gpio6 8 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_6_LOCATE {
+			gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_7_LOCATE {
+			gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_0_FAULT {
+			gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_1_FAULT {
+			gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_2_FAULT {
+			gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_3_FAULT {
+			gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_4_FAULT {
+			gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_5_FAULT {
+			gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_6_FAULT {
+			gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
 
 };
-- 
2.21.0

