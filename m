Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B295672E
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2024 11:35:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnSBp25w2z2ywS
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2024 19:35:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 332 seconds by postgrey-1.37 at boromir; Mon, 19 Aug 2024 19:35:41 AEST
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnSBj5Ryxz2xYl
	for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2024 19:35:41 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 19 Aug
 2024 17:28:50 +0800
Received: from twmbx02.aspeed.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 19 Aug 2024 17:28:50 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<ryan_chen@aspeedtech.com>
Subject: [PATCH v13 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Date: Mon, 19 Aug 2024 17:28:47 +0800
Message-ID: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

This series add AST2600 i2cv2 new register set driver. The i2cv2 driver
is new register set that have new clock divider option for more
flexiable generation. And also have separate i2c master and slave register
set for control, patch #2 is i2c master driver only, patch #3 is add
i2c slave mode driver.

The legacy register layout is mix master/slave register control together.
The following is add more detail description about new register layout.
And new feature set add for register.

-Add new clock divider option for more flexible and accurate clock rate
generation -Add tCKHighMin timing to guarantee SCL high pulse width.
-Add support dual pool buffer mode, split 32 bytes pool buffer of each
device into 2 x 16 bytes for Tx and Rx individually.
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

aspeed,global-regs:
This global register is needed, global register is setting for
new clock divide control, and new register set control.

ASPEED SOC chip is server product, i2c bus may have fingerprint
connect to another board. And also support hotplug.
The following is board-specific design example.
Board A                                         Board B
-------------------------                       ------------------------
|i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
|i2c bus#2(master)-> tmp i2c device |          |                       |
|i2c bus#3(master)-> adc i2c device |          |                       |
-------------------------                       ------------------------

i2c-scl-clk-low-timeout-us:
For example I2C controller as slave mode, and suddenly disconnected.
Slave state machine will keep waiting for master clock in for rx/tx
transmit. So it need timeout setting to enable timeout unlock controller
state. And in another side. In Master side also need avoid suddenly
slave miss(un-plug), Master will timeout and release the SDA/SCL.

aspeed,enable-dma:
For example The bus#1 have trunk data needed for transfer,
it can enable bus dma mode transfer, it can reduce cpu utilized.
Others bus bus#2/3 use defautl buffer mode.

v13:
 -separate i2c master and slave driver to be two patchs.
 -modify include header list, add bits.h include. remove of*.h
 -modify (((x) >> 24) & GENMASK(5, 0)) to (((x) & GENMASK(29, 24)) >> 24)
 -modify ast2600_select_i2c_clock function implement.
 -modify ast2600_i2c_recover_bus function u32 claim to u32 state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);

v12:
-aspeed,i2c.yaml
 -add Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
-i2c-ast2600.c
 -update include by alphabetical order
 -make just a one TAB and put the last two lines on the single one
 -remove no used timing_table structre
 -remove enum explicit assinment
 -rewritten to avoid this and using loop in ast2600_select_i2c_clock
 -use GENMASK for most 0xffff
 -remove too many parentheses
 -use str_read_write replace read write string
 -remove redundant blank line after ast2600_i2c_bus_of_table
 -fix wrong multi-line style of the comment
 -use macro for i2c standard speeds
 -remove useless noise dev_info

v11:
-aspeed,i2c.yaml
 -no change, the same with v10.
-i2c-ast2600.c
 -modify alert_enable from int -> boolean.
 -modify dbg string recovery -> recover.
 -remove no need to init 0.
 -remove new line after break.
 -remove unneeded empty line.
 -modify dma_alloc_coherent to dmam_alloc_coherent
 -modify probe nomem return dev_err_probe
 -modify i2c_add_adapter to devm_i2c_adapter
 -modify checkpatch: Alignment should match open parenthesis
 -modify checkpatch: braces {} should be used on all arms of this statement
 -modify checkpatch: Unbalanced braces around else statement

v10:
-aspeed,i2c.yaml
 -move unevaluatedProperties after allOf.
 -remove extra one blank line.
-i2c-ast2600.c
 -no change, the same with v8.

v9:
-aspeed,i2c.yaml
 -backoff to v7.
  -no fix typo in maintainer's name and email. this would be another patch.
  -no remove address-cells, size-cells, this would be another patch.
 -use aspeed,enable-dma property instead of aspeed,xfer-mode selection.
 -fix allOf and else false properties for aspeed,ast2600-i2cv2.
-i2c-ast2600.c
 -no change, the same with v8

v8:
-aspeed,i2c.yaml
 -modify commit message.
  -Fix typo in maintainer's name and email.
 -remove address-cells, size-cells.
-i2c-ast2600.c
 -move "i2c timeout counter" comment description before property_read.
 -remove redundant code "return ret" in probe end.

v7:
-aspeed,i2c.yaml
 -Update ASPEED I2C maintainers email.
 -use aspeed,enable-dma property instead of aspeed,xfer-mode selection.
 -fix allOf and else false properties for aspeed,ast2600-i2cv2.
-i2c-ast2600.c
 -remove aspeed,xfer-mode instead of aspeed,enable-dma mode. buffer mode
is default.
 -remove aspeed,timeout instead of i2c-scl-clk-low-timeout-us for
timeout setting.

v6:
-remove aspeed,i2cv2.yaml, merge to aspeed,i2c.yaml -add support for
 i2cv2 properites.
-i2c-ast2600.c
 -fix ast2600_i2c_remove ordering.
 -remove ast2600_i2c_probe goto labels, and add dev_err_probe -remove
  redundant deb_dbg debug message.
 -rename gr_regmap -> global_regs

v5:
-remove ast2600-i2c-global.yaml, i2c-ast2600-global.c.
-i2c-ast2600.c
 -remove legacy clock divide, all go for new clock divide.
 -remove duplicated read isr.
 -remove no used driver match
 -fix probe return for each labels return.
 -global use mfd driver, driver use phandle to regmap read/write.
-rename aspeed,i2c-ast2600.yaml to aspeed,i2cv2.yaml -remove bus-frequency.
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
Ryan Chen (3):
  dt-bindings: i2c: aspeed: support for AST2600-i2cv2
  i2c: aspeed: support AST2600 i2c new register mode driver
  i2c: aspeed: support AST2600 i2c new register slave mode driver

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |   51 +-
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-ast2600.c              | 1586 +++++++++++++++++
 4 files changed, 1646 insertions(+), 3 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-ast2600.c

-- 
2.34.1

