Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A94817C3A7
	for <lists+openbmc@lfdr.de>; Fri,  6 Mar 2020 18:07:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YvDm6wmSzDrD0
	for <lists+openbmc@lfdr.de>; Sat,  7 Mar 2020 04:07:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Yv8j511fzDr6x;
 Sat,  7 Mar 2020 04:03:48 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id q65so3224286oif.4;
 Fri, 06 Mar 2020 09:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2MFc1XVpBGgk6AEcnsNBIvE9WhmmAcbUo/Cvs2xI85c=;
 b=RpPj9Y5q4+UJn9pW/b7Kwdrg3bhORj+0YM/8eBslXez9OwpgpeOt6UHBJPfOu92wJ2
 852AAeE2hTCZLHKpR3LXX2NcUiFqQ8kcOLS0ZnNUnS4ZOP6VJSaYrmFEz8le4qhggVaa
 pKBiNNpoRQgcVK8GUQWwQ4wFRUiJZkIlhUoH36ewsA+HX8Zz3h0yM45u0fJ3nXVEU6L9
 oORvrLHyd/alUSBEd73siT+jnOReoL/x9mgT9AGRpDOrFLsPA8GXtEAhRyfvl6gJfDh8
 Ev1AgVzuDQaDfamdchvdXXrYtXy1bQ9EZQXJ/Wt9BzTn1DMsGrMbJnUgqzkSL9Anv+4n
 7TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2MFc1XVpBGgk6AEcnsNBIvE9WhmmAcbUo/Cvs2xI85c=;
 b=OtaIg/I2XhHk8ht3IGfx9twFyAW4tF0bVPR5CWkXktMHkJ/s1wUdmhSNyLCtfmYX91
 ke7xvGHBM0nwGxvucXZuFxJXUubtPDR9OL+ruyu8DXpZw9YM6MiIfTbmf2EmBn//Qv+A
 mUjsCXf7RNn3wVaYL+A6pS1cSg8NK2zY+GWScqS7PNOeccC5Oo3Ok80TCpvGIiwKlbsj
 PRnnLS30xaG/94IO6JI5KZaxDEGGMq5WJwhqdruqJde54TXcIbWakloQ4VjpR9VToTmx
 78TVpzg45ls8K9c/MjDtHyHHuN4ykncm1ZcV1lmAGg9kQAqOo2Kk5gk+nZhN7lfW+uPT
 /bLQ==
X-Gm-Message-State: ANhLgQ1k9NGMFb6HR9adCZF/HKhhReGYfoW9zXRnOTpxndRQQvaa10Me
 Qr2RFTGa+mWbw+iHLEW0Ha0=
X-Google-Smtp-Source: ADFU+vtYviDTTw2iA0J9RyZkZwYpL04cVYUjDVyejtYkAWydvd+wZPz49nK+4daEeyjDhKT92rwoFg==
X-Received: by 2002:aca:3081:: with SMTP id w123mr3017028oiw.31.1583514166604; 
 Fri, 06 Mar 2020 09:02:46 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id t9sm11550743otm.76.2020.03.06.09.02.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 09:02:46 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
X-Google-Original-From: Andrew Geissler <geissonator@yahoo.com>
To: joel@jms.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: aspeed: zaius: Add gpio line names
Date: Fri,  6 Mar 2020 11:02:18 -0600
Message-Id: <20200306170218.79698-2-geissonator@yahoo.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200306170218.79698-1-geissonator@yahoo.com>
References: <20200306170218.79698-1-geissonator@yahoo.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Geissler <geissonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Name the GPIOs to help userspace work with them. The names describe the
functionality the lines provide, not the net or ball name. This makes it
easier to share userspace code across different systems and makes the
use of the lines more obvious.

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 37 +++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index bc60ec291681..4bcc82046362 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -478,32 +478,61 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpioh_unbiased>;
 
+	gpio-line-names =
+	/*A0-A7*/	"","cfam-reset","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"fsi-enable","","","","","led-sys-boot-status","led-attention",
+				"led-fault",
+	/*E0-E7*/	"","","","","","","","presence-pcie-e2b",
+	/*F0-F7*/	"","","","","","","","checkstop",
+	/*G0-G7*/	"fsi-clock","fsi-data","","","","","","",
+	/*H0-H7*/	"onewire0","onewire1","onewire2","onewire3","","","","",
+	/*I0-I7*/	"","","","power-button","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","iso_u164_en","","fsi-trans","",
+	/*P0-P7*/	"ncsi_mux_en_n","bmc_i2c2_sw_rst_n","","bmc_i2c5_sw_rst_n","",
+				"","fsi-mux","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"","","led-hdd-fault","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+
 	line_iso_u146_en {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(O, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "iso_u164_en";
 	};
 
 	ncsi_mux_en_n {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
 		output-low;
-		line-name = "ncsi_mux_en_n";
 	};
 
 	line_bmc_i2c2_sw_rst_n {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "bmc_i2c2_sw_rst_n";
 	};
 
 	line_bmc_i2c5_sw_rst_n {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "bmc_i2c5_sw_rst_n";
 	};
 };
 
-- 
2.21.0 (Apple Git-122)

