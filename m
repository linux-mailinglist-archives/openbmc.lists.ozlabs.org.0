Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 866372D3C9C
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 09:02:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrTzR14gtzDqFK
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 19:02:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrTy95m90zDqjM;
 Wed,  9 Dec 2020 19:01:03 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0B97uULH009071;
 Wed, 9 Dec 2020 15:56:31 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from TroyLee-PC.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Dec 2020 15:59:26 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, Jean Delvare <jdelvare@suse.com>, "Guenter
 Roeck" <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet
 <corbet@lwn.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>
Subject: [PATCH 1/4] dt-bindings: hwmon: Add Aspeed AST2600 PWM/Fan
Date: Wed, 9 Dec 2020 15:59:17 +0800
Message-ID: <20201209075921.26689-2-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209075921.26689-1-troy_lee@aspeedtech.com>
References: <20201209075921.26689-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0B97uULH009071
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
Cc: billy_tsai@aspeedtech.com, leetroy@gmail.com, troy_lee@aspeedtech.com,
 ryan_chen@aspeedtech.com, chiawei_wang@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

For supporting a new AST2600 PWM/Fan hwmon driver, we add a new binding.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 .../bindings/hwmon/aspeed2600-pwm-tacho.txt   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed2600-pwm-tacho.txt

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed2600-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed2600-pwm-tacho.txt
new file mode 100644
index 000000000000..61b11914352f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed2600-pwm-tacho.txt
@@ -0,0 +1,69 @@
+ASPEED AST2600 PWM and Fan Tacho controller device driver
+
+The ASPEED PWM controller can support upto 16 PWM outputs. The ASPEED Fan Tacho
+controller can support upto 16 Fan tachometer inputs.
+
+There can be upto 16 fans supported. Each fan can have one PWM output and
+one Fan tach inputs.
+
+Required properties for pwm-tacho node:
+- #address-cells : should be 1.
+
+- #size-cells : should be 0.
+
+- #cooling-cells: should be 2.
+
+- reg : address and length of the register set for the device.
+
+- pinctrl-names : a pinctrl state named "default" must be defined.
+
+- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
+
+- compatible : should be "aspeed,ast2600-pwm-tachometer".
+
+- clocks : phandle to clock provider with the clock number in the second cell
+
+- resets : phandle to reset controller with the reset number in the second cell
+
+fan subnode format:
+===================
+Under fan subnode there can upto 16 child nodes, with each child node
+representing a fan. There are 16 fans each fan can have one PWM port and one
+Fan tach inputs.
+For PWM port can be configured cooling-levels to create cooling device.
+Cooling device could be bound to a thermal zone for the thermal control.
+
+Required properties for each child node:
+- reg : should specify PWM source port.
+	integer value in the range 0x00 to 0x0f with 0x00 indicating PWM port 0
+	and 0x0f indicating PWM port F.
+
+- cooling-levels: PWM duty cycle values in a range from 0 to 255
+                  which correspond to thermal cooling states.
+
+- aspeed,fan-tach-ch : should specify the Fan tach input channel.
+                integer value in the range 0 through 15, with 0 indicating
+		Fan tach channel 0 and 15 indicating Fan tach channel 15.
+		Atleast one Fan tach input channel is required.
+
+- aspeed,target-pwm : Specify the frequency of PWM. The value range from 24 to
+		      780000. Default value will be set to 25000.
+
+- aspeed,pulse-pr : Specify tacho pulse per revolution of the fan. A general
+		    parameter of pulse-pr is 2.
+
+Examples:
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_tach0_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,target-pwm = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+		aspeed,pulse-pr = <2>;
+	};
+};
-- 
2.17.1

