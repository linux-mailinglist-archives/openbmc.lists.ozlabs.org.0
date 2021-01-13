Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13A2F44F9
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 08:15:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFzGs2nvYzDr0C
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 18:15:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFz9P13M9zDqvr;
 Wed, 13 Jan 2021 18:10:12 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10D73sa0005372;
 Wed, 13 Jan 2021 15:03:54 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 13 Jan
 2021 15:08:54 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, Jean Delvare <jdelvare@suse.com>, "Guenter
 Roeck" <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet
 <corbet@lwn.net>, Philipp Zabel <p.zabel@pengutronix.de>, Ryan Chen
 <ryan_chen@aspeedtech.com>, "open list:HARDWARE MONITORING"
 <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>
Subject: [PATCH v2 0/4] hwmon: aspeed2600-pwm-tacho: Add driver support
Date: Wed, 13 Jan 2021 07:08:44 +0000
Message-ID: <20210113070850.1184506-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10D73sa0005372
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
Cc: chiawei_wang@aspeedtech.com, troy_lee@aspeedtech.com, leetroy@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Aspeed AST2600 is a server management SoC which has 16 PWM channels and
16 fan tacho channel.

This series of patch provides AST2600 PWM/Fan tacho support in hwmon
class.

The driver provides a sysfs interface, and user can configure PWM duty
cycle and read current FAN speed in RPM.


Change since v1:
- dt-binding rewrote with dt schema format
- register hwmon driver with devm_hwmon_device_register_with_info()
- moving default configurations to device tree

*** BLURB HERE ***

Troy Lee (4):
  dt-bindings: hwmon: Add Aspeed AST2600 PWM/Fan
  hwmon: Add Aspeed AST2600 support
  ARM: dts: aspeed: Add Aspeed AST2600 PWM/Fan node in devicetree
  hwmon: Support Aspeed AST2600 PWM/Fan tachometer

 .../hwmon/aspeed,ast2600-pwm-tachometer.yaml  | 137 ++++
 .../hwmon/aspeed2600-pwm-tachometer.rst       |  27 +
 Documentation/hwmon/index.rst                 |   1 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts      | 152 ++++
 arch/arm/boot/dts/aspeed-g6.dtsi              |  10 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/aspeed2600-pwm-tacho.c          | 756 ++++++++++++++++++
 8 files changed, 1094 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml
 create mode 100644 Documentation/hwmon/aspeed2600-pwm-tachometer.rst
 create mode 100644 drivers/hwmon/aspeed2600-pwm-tacho.c

-- 
2.25.1

