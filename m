Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938920E9E5
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 02:10:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wl9f3HMLzDqdf
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 10:10:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BgsP9okA; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wl8M0XBqzDqcw;
 Tue, 30 Jun 2020 10:09:06 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id o1so1165097plk.1;
 Mon, 29 Jun 2020 17:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AYRl8pOAy8o2qO178aXaRH0fdWgs7Bra1sCO7acnTT8=;
 b=BgsP9okAqsbNdfU8Qix1naJZC6HZ/DB/tRSbhLZXsMdFJ3//c8ILFfjvIsdEtdbGe8
 WRNNeOa/ZbF+eJSGaDMTCfI/wS+aBk3qMC8p47zIvI8LMbSGVXMCJCT2J+XbFto6Phht
 u9IfBs6id4Woyr2Hz7pxGPdt5+63cbCRCUyetzRdWOuEDWVpVd/hpSdfjjLnKPOgKR+b
 Q1mXnrLYH4bXjUX3snuFbNYlE36BiCXwsXxAVUgD/SA/FYvVvyF1YITEafIic7jal7pj
 aWr1mhNFpjIaXjSzLdMpam2u7Jop5dpijsoH0GKhooN29zh9KQsueW/aWgIbBj6l/OVW
 s8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AYRl8pOAy8o2qO178aXaRH0fdWgs7Bra1sCO7acnTT8=;
 b=jUliad/v1fWxHtGldlhX8Zn/yO9B4r8cgrTah6mqozctmkfg9JSqY/M5OxJ5xNC4+x
 OJF8DHjVKKoBdGkr5sJdjMGX/4ZFNk9qA3AQPknNn82Un1H+xyagaiUCh/iyJh6XUylM
 6zpy3OjM9NvhWKFvXG0k6/QNcASHQSRiJ0z6mPYVL4FwMbP/Z3JjRZZ/VcB/lPOeXDdD
 5fX7SEecnrfNJxgaL/3NQjq3Wm8ft4drS13ffbD/gyX/K2oeg1geHcSEKju79c6jzdG+
 xmMXCHbWTnRot3tcMb18xCX2xlf7A4p9yjbnTJukgJZXtIY0Zfqciv0sFWN2jhY6tbVF
 FGMw==
X-Gm-Message-State: AOAM532vTXEljz3YShd/5N/Dap17Ix/zzFlphUbWnXiTVVu6avm/43V1
 mmwOdKZ9Uac7dwAyot2+PgDK8uXDZP1O7Q==
X-Google-Smtp-Source: ABdhPJw2TID2zawq32v23OdWSYQPmDRRXwFxa4iOa/bk/gIfLeZrz1CVQRgGVdgnQJcDErCNb42UDg==
X-Received: by 2002:a17:90b:4910:: with SMTP id
 kr16mr10855811pjb.126.1593475744335; 
 Mon, 29 Jun 2020 17:09:04 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id m9sm754600pgq.61.2020.06.29.17.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 17:09:03 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 2/3] ARM: dts: aspeed: wedge40: enable adc device
Date: Mon, 29 Jun 2020 17:08:50 -0700
Message-Id: <20200630000851.26879-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630000851.26879-1-rentao.bupt@gmail.com>
References: <20200630000851.26879-1-rentao.bupt@gmail.com>
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

Enable adc controller and corresponding voltage sensoring channels for
Wedge40.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index aea23c313088..1049cfa80ac2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -27,6 +27,11 @@
 	memory@40000000 {
 		reg = <0x40000000 0x20000000>;
 	};
+
+	ast-adc-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>;
+	};
 };
 
 &wdt1 {
@@ -126,3 +131,7 @@
 &vhub {
 	status = "okay";
 };
+
+&adc {
+	status = "okay";
+};
-- 
2.17.1

