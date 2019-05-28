Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD72BF83
	for <lists+openbmc@lfdr.de>; Tue, 28 May 2019 08:40:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ckkc1894zDqLW
	for <lists+openbmc@lfdr.de>; Tue, 28 May 2019 16:40:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=ray.lue@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UIrXln/g"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ckjv5ClRzDqC4
 for <openbmc@lists.ozlabs.org>; Tue, 28 May 2019 16:40:13 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id go2so7896725plb.9
 for <openbmc@lists.ozlabs.org>; Mon, 27 May 2019 23:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=K18Q/Vt7ZL/GveWEeYanQPq0QqtyB9DI7pAoTtfa/7s=;
 b=UIrXln/gvZw4tCHQDwN9dY0kUmZgTlFM00msCjyGk7h2okYOis+sSZ8ct3K5fypRVD
 4xQ4/KGf8916ub/felNCjT4I2XUlZuMQKwJ9jNKBHgu/UYL0wQdhI0FPs5MKf/had0fz
 6/Uo0YH2FsSXaWVOh9y/8PVFQYKRVdbtVcHMhLRahPe8qNcw7UgoU5CCyteVMoBMs6Zp
 xZmIpJd7iDBV1uwiBd/Z8socj+NhVpcxfyktCYDnQ1+nCYH+Mm11fpxwoRO3WWEr6e+W
 b/7IT4Bnfyd++UnmhR2y1PECoxaSZHJBhOToLmIa88cJ4ylk+2a9nyAFnunn9z81GJuv
 J1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=K18Q/Vt7ZL/GveWEeYanQPq0QqtyB9DI7pAoTtfa/7s=;
 b=sqQjMZzGEkn/SK1nThNLidFujtaWUJji60IW4KxhZuraUmStAHXiDFFpbabvJCU2Lo
 N8DMuKmO8iit96rF3mj3OkpmZmEUbhpO6eeorbDmN1oyNDZ1aNefNCMlBI9K+2/ujRyl
 xKsWy/qS4OeiZUnC5ZDsOybH+Naz8/4AW+Ju9AFQaORkQ3pJ1cjDkHS3EANyR8YkDwhB
 BuDWWBML4asXqia8QWK8YFkxEkcdze+4AcVsedJNMheQpo9TDXJ3xf5iw5SikiiwMrHu
 xgCHbgWqnjSu/dKVCwXA+98zExPmOMHLgcbrn/dfwrvKNuOzYvThBHVEXnvrUNUBwHqP
 SGQg==
X-Gm-Message-State: APjAAAV2KxOx3auI3EMoVlQoOCi+c+nBsxJNQ4H3Dl9bsLkOjkj5dQ6h
 yx6lEH/4Me2VGY9ZKIh6dDCH0iRgXIQ=
X-Google-Smtp-Source: APXvYqwraW82zHLigGwSrtYnMQsDAblTPwFhhTELD5qmcx2ag7mPsyBAm5SDeNbNwF0DMmuQAYF7wA==
X-Received: by 2002:a17:902:5c5:: with SMTP id
 f63mr2904649plf.176.1559025610579; 
 Mon, 27 May 2019 23:40:10 -0700 (PDT)
Received: from localhost.localdomain (118-163-39-90.HINET-IP.hinet.net.
 [118.163.39.90])
 by smtp.gmail.com with ESMTPSA id d15sm33224150pfm.186.2019.05.27.23.40.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 23:40:09 -0700 (PDT)
From: Ray Lue <ray.lue@gmail.com>
X-Google-Original-From: Ray Lue <ray.lue@mic.com.tw>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.1 v1 1/1] ARM: dts: aspeed: Add s7106 BMC Machine
Date: Tue, 28 May 2019 14:39:57 +0800
Message-Id: <1559025597-56042-1-git-send-email-ray.lue@mic.com.tw>
X-Mailer: git-send-email 2.7.4
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
Cc: Ray Lue <ray.lue@mic.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

s7106 is a Tyan platform family with an ASPEED AST2500 BMC

Signed-off-by: Ray Lue <ray.lue@mic.com.tw>
---
 arch/arm/boot/dts/Makefile                  |   3 +-
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 351 ++++++++++++++++++++++++++++
 2 files changed, 353 insertions(+), 1 deletion(-)
 create mode 100755 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1276167..72115e0 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1262,4 +1262,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
-	aspeed-bmc-quanta-q71l.dtb
+	aspeed-bmc-quanta-q71l.dtb \
+	aspeed-bmc-tyan-s7106.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
new file mode 100755
index 0000000..9f549c6
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+// Device Tree file for Tyan S7106 platform
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+    model = "Tyan S7106 BMC";
+    compatible = "tyan,s7106-bmc", "aspeed,ast2500";
+
+    chosen {
+        stdout-path = &uart5;
+        bootargs = "earlyprintk";
+    };
+  
+    memory {
+        reg = <0x80000000 0x20000000>;
+    };
+
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        flash_memory: region@98000000 {
+            no-map;
+            reg = <0x98000000 0x04000000>; /* 64M */
+        };
+
+        vga_memory: framebuffer@7f000000 {
+            no-map;
+            reg = <0x7f000000 0x01000000>;
+        };
+        
+        safs_memory: region@30000000 {
+            no-map;
+            reg = <0x30000000 0x08000000>; /* 128M */
+        };
+
+        gfx_memory: framebuffer {
+            size = <0x04000000>;
+            alignment = <0x01000000>;
+            compatible = "shared-dma-pool";
+            reusable;
+        };
+    };
+    
+    vga-shared-memory {
+        compatible = "aspeed,ast2500-vga-sharedmem";
+        reg = <0x9ff00000 0x100000>;
+    };
+    
+    leds {
+        compatible = "gpio-leds";
+        
+        power {
+            gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
+        };
+
+        identify {
+            gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
+        };
+
+            heartbeat {
+            gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_LOW>;
+        };
+    };
+      
+    gpio-keys {
+        compatible = "gpio-keys";
+
+        caterr {
+            label = "caterr";
+            gpios = <&gpio ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
+            linux,code = <ASPEED_GPIO(AB, 0)>;
+        };
+        
+        id-button {
+            label = "id-button";
+            gpios = <&gpio ASPEED_GPIO(C, 4) GPIO_ACTIVE_LOW>;
+            linux,code = <ASPEED_GPIO(C, 4)>;
+        };
+    };    
+
+    iio-hwmon {
+        compatible = "iio-hwmon";
+        io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+            <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+            <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+            <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
+    };
+};
+
+&fmc {
+    status = "okay";
+    flash@0 {
+        label = "bmc";
+        status = "okay";
+        m25p,fast-read;
+#include "openbmc-flash-layout.dtsi"
+    };
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+	};
+};
+
+// UART1 is used only by the host. While the BMC does not need to access it,
+// enable it here to make sure the UART's clock gets enabled.
+&uart1 {
+    status = "okay";
+    pinctrl-names = "default";
+    pinctrl-0 = <&pinctrl_txd1_default
+            &pinctrl_rxd1_default
+            &pinctrl_ncts1_default
+            &pinctrl_ndcd1_default
+            &pinctrl_ndsr1_default
+            &pinctrl_nri1_default
+            &pinctrl_ndtr1_default
+            &pinctrl_nrts1_default>;
+};
+
+// Host UART2
+&uart2 {
+    status = "okay";
+    pinctrl-names = "default";
+    pinctrl-0 = <&pinctrl_txd2_default
+            &pinctrl_rxd2_default
+            &pinctrl_ncts2_default
+            &pinctrl_ndcd2_default
+            &pinctrl_ndsr2_default
+            &pinctrl_nri2_default
+            &pinctrl_ndtr2_default
+            &pinctrl_nrts2_default>;
+};
+
+// SOL,route to UART1 or UART2
+&uart3 {
+    status = "okay";
+};
+
+&uart5 {
+    status = "okay";
+};
+
+&mac0 {
+    status = "okay";
+    
+    pinctrl-names = "default";
+    pinctrl-0 = <&pinctrl_rmii1_default>;
+    use-ncsi;
+};
+
+&mac1 {
+    status = "okay";
+
+    pinctrl-names = "default";
+    pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&i2c0 {
+    status = "okay";
+    // NCT7802 Hardware Monitor @50h
+    nct7802@28 {
+        compatible = "nuvoton,nct7802";
+        reg = <0x28>;
+    };
+};
+
+// IPMB, dedicated for AST2500 <-> Intel PCH ME 
+&i2c1 {
+    multi-master =<1>;
+    status = "okay";
+    spsfw1@10 {
+        compatible = "slave-mqueue";
+        reg = <0x10>;
+        message-size = <256>;
+        queue-size = <32>;
+    };
+};
+
+&i2c2 {
+    status = "okay";
+    // FRU 24C256 @50h 
+    eeprom@50 {
+        compatible = "atmel,24c256";
+        reg = <0x50>;
+        pagesize = <32>;
+    };
+};
+
+&i2c3 {
+    status = "okay";
+    power-supply@58 {
+        compatible = "ibm,cffps1";
+        reg = <0x58>;
+    };
+};
+
+&i2c4 {
+    status = "okay";
+};
+
+&i2c5 {
+    status = "okay";
+};
+
+&i2c6 {
+    status = "okay";
+};
+
+&i2c7 {
+    status = "okay";
+};
+
+&gfx {
+    status = "okay";
+    memory-region = <&gfx_memory>;
+};
+
+&video {
+    status = "okay";
+    memory-region = <&gfx_memory>;
+};
+
+&vhub {
+    status = "okay";
+};
+
+&pwm_tacho {
+    status = "okay";
+    pinctrl-names = "default";
+    pinctrl-0 = <&pinctrl_pwm0_default
+        &pinctrl_pwm1_default
+        &pinctrl_pwm2_default
+        &pinctrl_pwm3_default
+        &pinctrl_pwm4_default
+        &pinctrl_pwm5_default>;
+
+    cpufan@0 {
+        reg = <0x00>;
+        aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+    };
+
+    cpufan@1 {
+        reg = <0x01>;
+        aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+    };
+    
+    frontfan@1 {
+        reg = <0x02>;
+        aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+    };
+    
+    frontfan@2 {
+        reg = <0x03>;
+        aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+    };
+
+    frontfan@3 {
+        reg = <0x04>;
+        aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+    };
+
+    rearfan@1 {
+        reg = <0x04>;
+        aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+    };
+
+    rearfan@2 {
+        reg = <0x04>;
+        aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+    };
+};
+
+&lpc_ctrl {
+    status = "okay";
+    memory-region = <&flash_memory>;
+    flash = <&spi1>;
+};
+
+&lpc_snoop {
+    status = "okay";
+    snoop-ports = <0x80>;
+};
+
+&adc {
+    status = "okay";
+
+    pinctrl-names = "default";
+    pinctrl-0 = <&pinctrl_adc0_default
+            &pinctrl_adc1_default
+            &pinctrl_adc2_default
+            &pinctrl_adc3_default
+            &pinctrl_adc4_default
+            &pinctrl_adc5_default
+            &pinctrl_adc6_default
+            &pinctrl_adc7_default
+            &pinctrl_adc8_default
+            &pinctrl_adc9_default
+            &pinctrl_adc10_default
+            &pinctrl_adc12_default
+            &pinctrl_adc13_default
+            &pinctrl_adc14_default>;
+};
+
+&lpc_bmc {
+    compatible = "aspeed,ast2500-lpc-bmc", "simple-mfd", "syscon";      
+    reg = <0x0 0x80>;
+    reg-io-width = <4>;
+    #address-cells = <1>;
+    #size-cells = <1>;
+    ranges = <0x0 0x0 0x80>;
+
+    kcs1@0 {
+        compatible = "aspeed,ast2500-kcs-bmc";
+        reg = <0x0 0x80>;
+        interrupts = <8>;
+        kcs_chan = <1>;
+        kcs_addr = <0xca0>;
+        status = "okay";
+    };
+
+    kcs2@0 {
+        compatible = "aspeed,ast2500-kcs-bmc";
+        reg = <0x0 0x80>;
+        interrupts = <8>;
+        kcs_chan = <2>;
+        kcs_addr = <0xca8>;
+        status = "okay";
+    };
+
+    kcs3@0 {
+        compatible = "aspeed,ast2500-kcs-bmc";
+        reg = <0x0 0x80>;
+        interrupts = <8>;
+        kcs_chan = <3>;
+        kcs_addr = <0xca2>;
+        status = "okay";
+    };  
+};
+
-- 
2.7.4

