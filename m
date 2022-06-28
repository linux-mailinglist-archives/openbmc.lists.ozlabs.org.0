Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A88E577E34
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:01:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbYP0JCkz3054
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:01:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fw1E9LXn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fw1E9LXn;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX8r528Hgz30Qc
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 13:16:05 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id g4so3999697pgc.1
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2022 20:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u0NPneZZ9r0x4Kp8TclBRmjdl0tXAndSbSU1SBOWrP4=;
        b=fw1E9LXnVMUacoasv60kB1mOhbXP35C4X3qHLDPEHtq6Yacn+XW8ZwRC6PEGiNgyU7
         3RIokRdKK4ROyecQ/K90qDcL+/Kp5NtdZn4zPu6Ro9IZb1hv2m6m1GfSA5gLe8czOpg+
         R4ZUjr3+cu3X4/VdQU1+xpcJlsTqffW8kKBdjuvDNH8HoLJNhxZ23jtWl8ov2NMZahLR
         l4B1jXXukACfnayrtZ4gwcEmJ+WJcD/7UCCKjEgYS4pqsFd4lNulmun7EyW/0lmvNtjP
         mBrD1Sm87h7cWH4qN5zRHnp+FimVaHLtBv/rilU3P3wS6CSSP3xtkvR+83WuN988K0zd
         t8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u0NPneZZ9r0x4Kp8TclBRmjdl0tXAndSbSU1SBOWrP4=;
        b=uuPfqvTlfRvxgmkL7NkVB8y2dSBYpvenWduEInFbN6GV40s6ZE9FK50qzjmaCBApme
         WH5m7/7Jzu1iaFJcqc9CxLFrmGDRBjC/9JcxxWzC0xImRhngsOX/Ifvx4UonXdY8D07X
         RzNTqZ1hQrnYBO0rbb+ufiPoxHIwMeH66CHjEcxPFlUQUjnkCCgzg43LTO78BL84u7CI
         glel2vH7QFu37K5Z2MKvgmM0zKlvOXUv2H0LVaUjuUrJLBSHVKAZuG5KoamZrcSzdxwD
         fAgCyQZtpOAnL38D2A0ubrGThWuMUG4FhYgpKcHwhOuoqA4eADN1ec9iW2PYmuYnshNt
         Un2A==
X-Gm-Message-State: AJIora/+CZaOjcNNS/ZPUUyWoBpEI3kEN/ScYq/A9NZ4xO7V4U4Ius2P
	AG8FOCXx1goAbTfTvZ1wLx9R2HcMuvVk0Q==
X-Google-Smtp-Source: AGRyM1uIsxYRKAULFpKJ4EUftVInR/s670YqO/w2OO6PNFD4G4cFQ2sSVpj15J9lS8nEmrtyUWRwlQ==
X-Received: by 2002:a63:2603:0:b0:40d:9b49:8984 with SMTP id m3-20020a632603000000b0040d9b498984mr15678641pgm.337.1656386162639;
        Mon, 27 Jun 2022 20:16:02 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090264d600b0016a0b31a8bdsm8046511pli.4.2022.06.27.20.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 20:16:02 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 3/4] ARM: dts: aspeed: bletchley: bind presence-sledX pins via gpio-keys
Date: Tue, 28 Jun 2022 11:13:42 +0800
Message-Id: <20220628031343.21097-4-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220628031343.21097-1-potin.lai.pt@gmail.com>
References: <20220628031343.21097-1-potin.lai.pt@gmail.com>
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:27 +1000
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
Cc: Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Bind presence-sledX pins via gpio-keys driver to monitor and export
GPIO pin values on DBUS using phosphor-gpio-presence service.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index ee33cc3efae4..7b6de9b51547 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -190,6 +190,41 @@
 			gpios = <&sled6_leds 1 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		presence-sled1 {
+			label = "presence-sled1";
+			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 2)>;
+		};
+		presence-sled2 {
+			label = "presence-sled2";
+			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 3)>;
+		};
+		presence-sled3 {
+			label = "presence-sled3";
+			gpios = <&gpio0 ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 4)>;
+		};
+		presence-sled4 {
+			label = "presence-sled4";
+			gpios = <&gpio0 ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 5)>;
+		};
+		presence-sled5 {
+			label = "presence-sled5";
+			gpios = <&gpio0 ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 6)>;
+		};
+		presence-sled6 {
+			label = "presence-sled6";
+			gpios = <&gpio0 ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 7)>;
+		};
+	};
 };
 
 &mac2 {
-- 
2.17.1

