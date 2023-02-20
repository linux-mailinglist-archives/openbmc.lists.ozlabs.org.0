Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD40869C55A
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 07:24:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKsp05SGgz3cDp
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 17:24:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKsmw2H4tz3bnP;
	Mon, 20 Feb 2023 17:23:27 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 31K64vFx022736;
	Mon, 20 Feb 2023 14:04:57 +0800 (GMT-8)
	(envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 20 Feb
 2023 14:17:51 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/2] Add ASPEED AST2600 I2Cv2 controller driver
Date: Mon, 20 Feb 2023 14:17:43 +0800
Message-ID: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 31K64vFx022736
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series add AST2600 i2cv2 new register set driver. The i2cv2 new
register set have new clock divider option for more flexiable generation.
And also have separate i2c master and slave register set for control.

The legacy register layout is mix master/slave register control together.
The following is add more detail description about new register layout.
And new feature set add for register.

-Add new clock divider option for more flexible and accurate clock
rate generation
-Add tCKHighMin timing to guarantee SCL high pulse width.
-Add support dual pool buffer mode, split 32 bytes pool buffer of
each device into 2 x 16 bytes for Tx and Rx individually.
-Increase DMA buffer size to 4096 bytes and support byte alignment.
-Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
-Re-define registers for separating master and slave mode control.
-Support 4 individual DMA buffers for master Tx and Rx, slave Tx and Rx.

And following is new register set for package transfer sequence.
-New Master operation mode:
 S -> Aw -> P
 S -> Aw -> TxD -> P
 S -> Ar -> RxD -> P
 S -> Aw -> RxD -> Sr -> Ar -> TxD -> P
-Bus SDA lock auto-release capability for new master DMA command mode.
-Bus auto timeout for new master/slave DMA mode.

The following is two versus register layout.
Old:
{I2CD00}: Function Control Register     
{I2CD04}: Clock and AC Timing Control Register
{I2CD08}: Clock and AC Timing Control Register
{I2CD0C}: Interrupt Control Register
{I2CD10}: Interrupt Status Register 
{I2CD14}: Command/Status Register   
{I2CD18}: Slave Device Address Register
{I2CD1C}: Pool Buffer Control Register
{I2CD20}: Transmit/Receive Byte Buffer Register
{I2CD24}: DMA Mode Buffer Address Register
{I2CD28}: DMA Transfer Length Register
{I2CD2C}: Original DMA Mode Buffer Address Setting
{I2CD30}: Original DMA Transfer Length Setting and Final Status

New Register mode
{I2CC00}: Master/Slave Function Control Register
{I2CC04}: Master/Slave Clock and AC Timing Control Register
{I2CC08}: Master/Slave Transmit/Receive Byte Buffer Register
{I2CC0C}: Master/Slave Pool Buffer Control Register
{I2CM10}: Master Interrupt Control Register
{I2CM14}: Master Interrupt Status Register  
{I2CM18}: Master Command/Status Register
{I2CM1C}: Master DMA Buffer Length Register
{I2CS20}: Slave~ Interrupt Control Register
{I2CS24}: Slave~ Interrupt Status Register
{I2CS28}: Slave~ Command/Status Register
{I2CS2C}: Slave~ DMA Buffer Length Register
{I2CM30}: Master DMA Mode Tx Buffer Base Address
{I2CM34}: Master DMA Mode Rx Buffer Base Address
{I2CS38}: Slave~ DMA Mode Tx Buffer Base Address
{I2CS3C}: Slave~ DMA Mode Rx Buffer Base Address
{I2CS40}: Slave Device Address Register
{I2CM48}: Master DMA Length Status Register
{I2CS4C}: Slave  DMA Length Status Register
{I2CC50}: Current DMA Operating Address Status
{I2CC54}: Current DMA Operating Length  Status

v5:
-remove ast2600-i2c-global.yaml, i2c-ast2600-global.c.
-i2c-ast2600.c
 -remove legacy clock divide, all go for new clock divide.
 -remove duplicated read isr.
 -remove no used driver match
 -fix probe return for each labels return.
 -global use mfd driver, driver use phandle to regmap read/write.
-rename aspeed,i2c-ast2600.yaml to aspeed,i2cv2.yaml
-remove bus-frequency.
-add required aspeed,gr
-add timeout, byte-mode, buff-mode properites.

v4:
-fix i2c-ast2600.c driver buffer mode use single buffer conflit in
 master slave mode both enable.
-fix kmemleak issue when use dma mode.
-fix typo aspeed,i2c-ast2600.yaml compatible is "aspeed,ast2600-i2c"
-fix typo aspeed,i2c-ast2600.ymal to aspeed,i2c-ast2600.yaml

v3:
-fix i2c global clock divide default value.
-remove i2c slave no used dev_dbg info.

v2:
-add i2c global ymal file commit.
-rename file name from new to ast2600.
 aspeed-i2c-new-global.c -> i2c-ast2600-global.c
 aspeed-i2c-new-global.h -> i2c-ast2600-global.h
 i2c-new-aspeed.c -> i2c-ast2600.c
-rename all driver function name to ast2600.

Ryan Chen (2):
  dt-bindings: i2c: Add support for ASPEED i2Cv2
  i2c: aspeed: support ast2600 i2cv2 new register mode driver

 .../devicetree/bindings/i2c/aspeed,i2cv2.yaml |   83 +
 MAINTAINERS                                   |    9 +
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-ast2600.c              | 1703 +++++++++++++++++
 5 files changed, 1807 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2cv2.yaml
 create mode 100644 drivers/i2c/busses/i2c-ast2600.c

-- 
2.34.1

