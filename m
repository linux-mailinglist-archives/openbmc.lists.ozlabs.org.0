Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6A11FDC9
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 06:07:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bq5g1133zDqV6
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 16:07:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HTpEumY8"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZBsr1TbhzDrBG;
 Sat, 14 Dec 2019 00:51:41 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id k3so1625090pgc.3;
 Fri, 13 Dec 2019 05:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=ymqyf3ZzOKHzrjO49WfBXaPmL09jcKuafUFOn/7WrR0=;
 b=HTpEumY8ELx9uGBt9g/xDzvfDgkgQfOqBchv5PjqzQeyvS5cObNggKcmCb3UNxi/jh
 lH8Wrthu3f2BvMuy4aB3YBZ/YaGj16nw4hx2gp9xqpfMEvVwjdFdG/cotnrH9kTXamPA
 VxQtwpOp5+tjW+LcTt4Oo1USXDUKnnUA2ABLI0sAsQHlF2uZV92ZQ6Kd46Mvoagp/lku
 gX7KoNvSHEiwS5YWNpnNG3lD5Lp5BXZ8D/OWs1At06bNBCYOnT8Xv6OvKda1baIT+AYi
 1htJqU/FMpQkEYFwi05w4s8WgLjYlQpZgr59uvz7HhyglzmHD9sv/9dSziKSBfJ7JbD7
 C1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ymqyf3ZzOKHzrjO49WfBXaPmL09jcKuafUFOn/7WrR0=;
 b=s8IJJ8ti9jMx3bABxmZ1RU7wHcCC0K1m9a8WRdPt5CyIZXJTRSHhJXBah0SYYd36AP
 sUK4gJGschr8uGicyVAoXoAAqDqVeBTMeRSgsgtfUNXjrLuhPgZNXWNd8BDRCezncD2A
 cbpI1v5LIjUdpWhqZNa9j8qmPy4WKJxWetFJ8qSTTwuFTF51EKnebNWuhbDrUuc6wzzb
 bYsvYbOefjuHqRvhCzZmx3glcAzyr8oKbLLgIR0QtMQsYeowWh4VCjvUodW95nNVS5zs
 VYSHzOV0II4+KTgCR//bRzDN0bRefocCMfoXWccDxe4+gZEBFBk6tMxwvbW1uA7PPLuG
 cYTQ==
X-Gm-Message-State: APjAAAUvwknDpcU/+2ZhUe9zGQeu/0gLDiS8hYExRpmoxvQNuzv3dOwe
 LVggaO2P318eHkgXRi7zVxQ=
X-Google-Smtp-Source: APXvYqzuZ7bLsEERfyor7dwMWxIJH9JkvW3kxNrSwI6c0aHQISu84lFn0uFL6hfVfqj7GltzzZj1HQ==
X-Received: by 2002:a62:788a:: with SMTP id
 t132mr16242050pfc.134.1576245098324; 
 Fri, 13 Dec 2019 05:51:38 -0800 (PST)
Received: from cnn ([2402:3a80:47f:89b1:9c76:12d1:42df:9222])
 by smtp.gmail.com with ESMTPSA id p28sm10768389pgb.93.2019.12.13.05.51.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Dec 2019 05:51:37 -0800 (PST)
Date: Fri, 13 Dec 2019 19:21:31 +0530
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
To: andrew@aj.id.au, joel@jms.id.au
Subject: [PATCH v5] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
Message-ID: <20191213135131.GA1822@cnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 16 Dec 2019 15:59:38 +1100
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
Cc: devicetree@vger.kernel.org, manikandan.e@hcl.com,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Yosemite V2 is a facebook multi-node server
platform that host four OCP server. The BMC
in the Yosemite V2 platform based on AST2500 SoC.

This patch adds linux device tree entry related to
Yosemite V2 specific devices connected to BMC SoC.

Signed-off-by : Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Acked-by        : Andrew Jeffery <andrew@aj.id.au>
Reviewed-by  : Vijay Khemka <vkhemka@fb.com>
--- 
---      v5 - Spell and contributor name correction.
---           - License identifier changed to GPL-2.0-or-later.
---           - aspeed-gpio.h removed.
---           - FAN2 tacho channel changed.
---      v4 - Bootargs removed.
---      v3 - Uart1 Debug removed .
---      v2 - LPC and VUART removed .
---      v1 - Initial draft.
--- 
 .../boot/dts/aspeed-bmc-facebook-yosemitev2.dts    | 148 +++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
new file mode 100644
index 0000000..ffd7f4c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2018 Facebook Inc.
+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+/ {
+	model = "Facebook Yosemitev2 BMC";
+	compatible = "facebook,yosemitev2-bmc", "aspeed,ast2500";
+	aliases {
+		serial4 = &uart5;
+	};
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	iio-hwmon {
+		// VOLATAGE SENSOR
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0> , <&adc 1> , <&adc 2> ,  <&adc 3> ,
+		<&adc 4> , <&adc 5> , <&adc 6> ,  <&adc 7> ,
+		<&adc 8> , <&adc 9> , <&adc 10>, <&adc 11> ,
+		<&adc 12> , <&adc 13> , <&adc 14> , <&adc 15> ;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+	};
+};
+
+&uart5 {
+	// BMC Console
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	use-ncsi;
+};
+
+&adc {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default
+			&pinctrl_adc1_default
+			&pinctrl_adc2_default
+			&pinctrl_adc3_default
+			&pinctrl_adc4_default
+			&pinctrl_adc5_default
+			&pinctrl_adc6_default
+			&pinctrl_adc7_default
+			&pinctrl_adc8_default
+			&pinctrl_adc9_default
+			&pinctrl_adc10_default
+			&pinctrl_adc11_default
+			&pinctrl_adc12_default
+			&pinctrl_adc13_default
+			&pinctrl_adc14_default
+			&pinctrl_adc15_default>;
+};
+
+&i2c8 {
+	//FRU EEPROM
+	status = "okay";
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+};
+
+&i2c9 {
+	//INLET & OUTLET TEMP
+	status = "okay";
+	tmp421@4e {
+		compatible = "ti,tmp421";
+		reg = <0x4e>;
+	};
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+};
+
+&i2c10 {
+	//HSC
+	status = "okay";
+	adm1278@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c11 {
+	//MEZZ_TEMP_SENSOR
+	status = "okay";
+	tmp421@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+};
+
+&i2c12 {
+	//MEZZ_FRU
+	status = "okay";
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+};
+
+&pwm_tacho {
+	//FSC
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+};
-- 
2.7.4

