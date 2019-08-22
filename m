Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3274798AF8
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 07:56:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DYh34z0BzDqVj
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 15:56:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VQkwtzzf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gEldASJI"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DYcL3gqTzDrMG
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 15:53:37 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CFBEA21C28;
 Thu, 22 Aug 2019 01:53:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Aug 2019 01:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=gWmm2q2lnuAKPntwi2OO6xkjDT
 pnhvy2XFmI+groc2E=; b=VQkwtzzf3qNm7oEASX0HC1tItNI0THtgpKjsEnIH3c
 w1lezSAYDDvvMiA0HZAF4cuGKcynFxWu2I8FlUNeINnqwJSAHEQfeDzW3MyFm2II
 JSUpm5cHMizdT5pRQCCV6bOXczpOxRkykAeX77nvjEYtnmSDJUNvAc4ZyQSbSdmy
 JG1YbgTab9u1dR0CLJWlAr+N2IssRzBQcrHab1uLg7O3zksMd0tZH5MpqmPriq4i
 2z5LQ0c2GNsj6cRDIFxXJB6WeJSkt/Qt9uvuXAErMT9XSahtJy97/p8qRMlJjttT
 x57Vzc+Sgoo8JV3zUdRzqXkvlr+2rj76pyU0yxWBo+aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gWmm2q2lnuAKPntwi
 2OO6xkjDTpnhvy2XFmI+groc2E=; b=gEldASJIjAlpo4tRO2jegnM7kecAZoCvN
 LkOADwHRlAPfTpaw7P4G64zH+ItPlmdosLscNqRkd2oqUfzd3TYlWMNOBqyQzg5v
 heDkz4D7XcXiUI5eKDBz+09Py6bOwqt8/BBxrMC1b2hPkbNjyefQCARxSDYyuz74
 hTwLVqNUirgIhQ6BJMMhoZ70k4dvnj+BvngnJuhifxW+3V4YzNfAhx0xx9dN9Tu8
 UHFMPn5IPV4qYiTMq6jNQZCQ7dAQBsiCYyaBQ9u25x9RmgYPIXxug/Z/SRB18W+a
 UsNLnqWruinoAiUSoeGJ7RUGlBq6ReaUFoqKEg2JRMnJHsPEjNBnQ==
X-ME-Sender: <xms:3S1eXZsnizRVa23csp9KCbsQgzIma8vS5GFCW68TMgq4RGVr9vX_lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeggedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucffohhmrghinhepshhlrghvvgdrmhhrnecukfhppedvtdefrdehje
 drvdduhedrudejkeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:3S1eXRi77k9JSpVLNONqY1QLs22_y5l4ErLPDKwNcwA9AbJem6LIGQ>
 <xmx:3S1eXUmbO2X_eeRVtFGivjz3T-RziyalPylSu19eW1fENQ5odm_OyA>
 <xmx:3S1eXbzwWLDQlxETpkiel-TKXGWspvvFc78n4rQ3xSSng1wF_q_Jow>
 <xmx:3i1eXZPm4Nmb5eDxgMuFT9dvBlm3QHKFzaUSxkWaP64XLWlwmrCYrw>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 326E0D6005A;
 Thu, 22 Aug 2019 01:53:30 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au,
	clg@kaod.org
Subject: [RFC PATCH qemu] hw: Introduce models for IBM's Flexible Service
 Interface
Date: Thu, 22 Aug 2019 15:23:58 +0930
Message-Id: <20190822055358.26196-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Firstly, I'll split this patch up in the future, but wanted to get the
integrated setup sent out for any initial thoughts. Anyway:

Time for some fun with inter-processor buses. FSI allows a service
processor access to the internal busses of a host POWER processor to
perform configuration or debugging.

FSI has long existed in POWER processes and so comes with some baggage,
including how it has been integrated into the ASPEED SoC.

Working backwards from the POWER processor, the fundamental pieces of
interest for the implementation are:

1. The Common FRU Access Macro (CFAM), an address space containing
   various "engines" that drive accesses on busses internal and external
   to the POWER chip. Examples include the SBEFIFO and I2C masters. The
   engines hang off of an internal Local Bus (LBUS) which is described
   by the CFAM configuration block.

2. The FSI slave: The slave is the terminal point of the FSI bus for
   FSI symbols addressed to it. Slaves can be cascaded off of one
   another. The slave's configuration registers appear in address space
   of the CFAM to which it is attached.

3. The FSI master: A controller in the platform service processor (e.g.
   BMC) driving CFAM engine accesses into the POWER chip. At the
   hardware level FSI is a bit-based protocol supporting synchronous and
   DMA-driven accesses of engines in a CFAM.

4. The On-Chip Peripheral Bus (OPB): A low-speed bus typically found in
   POWER processors. This now makes an appearance in the ASPEED SoC due
   to tight integration of the FSI master IP with the OPB, mainly the
   existence of an MMIO-mapping of the CFAM address straight onto a
   sub-region of the OPB address space.

5. An APB-to-OPB bridge enabling access to the OPB from the ARM core in
   the AST2600. Hardware limitations prevent the OPB from being directly
   mapped into APB, so all accesses are indirect through the bridge.

The implementation appears as following in the qemu device tree:

    (qemu) info qtree
    bus: main-system-bus
      type System
      ...
      dev: aspeed.apb2opb, id ""
        gpio-out "sysbus-irq" 1
        mmio 000000001e79b000/0000000000001000
        bus: opb.1
          type opb
          dev: fsi.master, id ""
            bus: fsi.bus.1
              type fsi.bus
              dev: cfam.config, id ""
              dev: cfam, id ""
                bus: lbus.1
                  type lbus
                  dev: scratchpad, id ""
                    address = 0 (0x0)
        bus: opb.0
          type opb
          dev: fsi.master, id ""
            bus: fsi.bus.0
              type fsi.bus
              dev: cfam.config, id ""
              dev: cfam, id ""
                bus: lbus.0
                  type lbus
                  dev: scratchpad, id ""
                    address = 0 (0x0)

The LBUS is modelled to maintain the qdev bus hierarchy and to take
advantage of the object model to automatically generate the CFAM
configuration block. The configuration block presents engines in the
order they are attached to the CFAM's LBUS. Engine implementations
should subclass the LBusDevice and set the 'config' member of
LBusDeviceClass to match the engine's type.

CFAM designs offer a lot of flexibility, for instance it is possible for
a CFAM to be simultaneously driven from multiple FSI links. The modeling
is not so complete; it's assumed that each CFAM is attached to a single
FSI slave (as a consequence the CFAM subclasses the FSI slave).

As for FSI, its symbols and wire-protocol are not modelled at all. This
is not necessary to get FSI off the ground thanks to the mapping of the
CFAM address space onto the OPB address space - the models follow this
directly and map the CFAM memory region into the OPB's memory region.
Future work includes supporting more advanced accesses that drive the
FSI master directly rather than indirectly via the CFAM mapping, which
will require implementing the FSI state machine and methods for each of
the FSI symbols on the slave. Further down the track we can also look at
supporting the bitbanged SoftFSI drivers in Linux by extending the FSI
slave model to resolve sequences of GPIO IRQs into FSI symbols, and
calling the associated symbol method on the slave to map the access onto
the CFAM.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/Kconfig                         |   1 +
 hw/Makefile.objs                   |   1 +
 hw/arm/Kconfig                     |   1 +
 hw/arm/aspeed_soc.c                |   2 +-
 hw/fsi/Kconfig                     |  10 +
 hw/fsi/Makefile.objs               |   4 +
 hw/fsi/aspeed-apb2opb.c            | 351 +++++++++++++++++++++++++++++
 hw/fsi/cfam.c                      | 318 ++++++++++++++++++++++++++
 hw/fsi/engine-scratchpad.c         |  96 ++++++++
 hw/fsi/fsi-master.c                | 200 ++++++++++++++++
 hw/fsi/fsi-slave.c                 | 105 +++++++++
 hw/fsi/fsi.c                       |  55 +++++
 hw/fsi/opb.c                       | 195 ++++++++++++++++
 hw/misc/Makefile.objs              |   2 +-
 hw/misc/aspeed_fsi.c               | 115 ----------
 include/hw/arm/aspeed_soc.h        |   4 +-
 include/hw/fsi/aspeed-apb2opb.h    |  31 +++
 include/hw/fsi/bits.h              |  15 ++
 include/hw/fsi/cfam.h              |  33 +++
 include/hw/fsi/engine-scratchpad.h |  21 ++
 include/hw/fsi/fsi-master.h        |  30 +++
 include/hw/fsi/fsi-slave.h         |  29 +++
 include/hw/fsi/fsi.h               |  32 +++
 include/hw/fsi/lbus.h              |  95 ++++++++
 include/hw/fsi/opb.h               |  45 ++++
 include/hw/misc/aspeed_fsi.h       |  31 ---
 qom/object.c                       |   3 +
 27 files changed, 1675 insertions(+), 150 deletions(-)
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/Makefile.objs
 create mode 100644 hw/fsi/aspeed-apb2opb.c
 create mode 100644 hw/fsi/cfam.c
 create mode 100644 hw/fsi/engine-scratchpad.c
 create mode 100644 hw/fsi/fsi-master.c
 create mode 100644 hw/fsi/fsi-slave.c
 create mode 100644 hw/fsi/fsi.c
 create mode 100644 hw/fsi/opb.c
 delete mode 100644 hw/misc/aspeed_fsi.c
 create mode 100644 include/hw/fsi/aspeed-apb2opb.h
 create mode 100644 include/hw/fsi/bits.h
 create mode 100644 include/hw/fsi/cfam.h
 create mode 100644 include/hw/fsi/engine-scratchpad.h
 create mode 100644 include/hw/fsi/fsi-master.h
 create mode 100644 include/hw/fsi/fsi-slave.h
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 include/hw/fsi/opb.h
 delete mode 100644 include/hw/misc/aspeed_fsi.h

diff --git a/hw/Kconfig b/hw/Kconfig
index 195f541e50cd..891c70d0277f 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -9,6 +9,7 @@ source char/Kconfig
 source core/Kconfig
 source display/Kconfig
 source dma/Kconfig
+source fsi/Kconfig
 source gpio/Kconfig
 source hyperv/Kconfig
 source i2c/Kconfig
diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index ece6cc37550f..aee5aa24312f 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -39,6 +39,7 @@ devices-dirs-y += xen/
 devices-dirs-$(CONFIG_MEM_DEVICE) += mem/
 devices-dirs-y += semihosting/
 devices-dirs-y += smbios/
+devices-dirs-$(CONFIG_FSI) += fsi/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index bdf57894a856..3309d024b0ec 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -355,6 +355,7 @@ config ASPEED_SOC
     select TMP421
     select IBM_CFFPS
     select IR35221
+    select APB2OPB_ASPEED
 
 config MPS2
     bool
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 32c8998ae49b..c374aba62d4d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -361,7 +361,7 @@ static void aspeed_soc_init(Object *obj)
 
     if (ASPEED_IS_AST2600(sc->info->silicon_rev)) {
         sysbus_init_child_obj(obj, "fsi[*]", OBJECT(&s->fsi[0]),
-                              sizeof(s->fsi[0]), TYPE_ASPEED_FSI);
+                              sizeof(s->fsi[0]), TYPE_ASPEED_APB2OPB);
     }
 }
 
diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
new file mode 100644
index 000000000000..f1a66d02b193
--- /dev/null
+++ b/hw/fsi/Kconfig
@@ -0,0 +1,10 @@
+config APB2OPB_ASPEED
+    bool
+    select OPB
+
+config OPB
+    bool
+    select FSI
+
+config FSI
+    bool
diff --git a/hw/fsi/Makefile.objs b/hw/fsi/Makefile.objs
new file mode 100644
index 000000000000..6efefc45aedd
--- /dev/null
+++ b/hw/fsi/Makefile.objs
@@ -0,0 +1,4 @@
+obj-$(CONFIG_OPB) += opb.o
+obj-$(CONFIG_FSI) += fsi.o fsi-master.o fsi-slave.o cfam.o
+obj-$(CONFIG_FSI) += engine-scratchpad.o
+obj-$(CONFIG_APB2OPB_ASPEED) += aspeed-apb2opb.o
diff --git a/hw/fsi/aspeed-apb2opb.c b/hw/fsi/aspeed-apb2opb.c
new file mode 100644
index 000000000000..faf5e2c782c0
--- /dev/null
+++ b/hw/fsi/aspeed-apb2opb.c
@@ -0,0 +1,351 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * ASPEED APB-OPB FSI interface
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+
+#include "qapi/error.h"
+
+#include "hw/fsi/aspeed-apb2opb.h"
+#include "hw/qdev-core.h"
+
+#include <assert.h>
+
+#define TO_REG(x) (x >> 2)
+#define GENMASK(t, b) (((1ULL << ((t) + 1)) - 1) & ~((1ULL << (b)) - 1))
+
+#define APB2OPB_VERSION                    TO_REG(0x00)
+#define   APB2OPB_VERSION_VER              GENMASK(7, 0)
+
+#define APB2OPB_TRIGGER                    TO_REG(0x04)
+#define   APB2OPB_TRIGGER_EN               BIT(0)
+
+#define APB2OPB_CONTROL                    TO_REG(0x08)
+#define   APB2OPB_CONTROL_OFF              GENMASK(31, 13)
+
+#define APB2OPB_OPB2FSI                    TO_REG(0x0c)
+#define   APB2OPB_OPB2FSI_OFF              GENMASK(31, 22)
+
+#define APB2OPB_OPB0_SEL                   TO_REG(0x10)
+#define APB2OPB_OPB1_SEL                   TO_REG(0x28)
+#define   APB2OPB_OPB_SEL_EN               BIT(0)
+
+#define APB2OPB_OPB0_MODE                  TO_REG(0x14)
+#define APB2OPB_OPB1_MODE                  TO_REG(0x2c)
+#define   APB2OPB_OPB_MODE_RD              BIT(0)
+
+#define APB2OPB_OPB0_XFER                  TO_REG(0x18)
+#define APB2OPB_OPB1_XFER                  TO_REG(0x30)
+#define   APB2OPB_OPB_XFER_FULL            BIT(1)
+#define   APB2OPB_OPB_XFER_HALF            BIT(0)
+
+#define APB2OPB_OPB0_ADDR                  TO_REG(0x1c)
+#define APB2OPB_OPB0_WRITE_DATA            TO_REG(0x20)
+
+#define APB2OPB_OPB1_DMA_EN                TO_REG(0x24)
+#define APB2OPB_OPB1_DMA_EN_3              BIT(3)
+#define APB2OPB_OPB1_DMA_EN_2              BIT(2)
+#define APB2OPB_OPB1_DMA_EN_1              BIT(1)
+#define APB2OPB_OPB1_DMA_EN_0              BIT(0)
+
+#define APB2OPB_OPB1_ADDR                  TO_REG(0x34)
+#define APB2OPB_OPB1_WRITE_DATA                  TO_REG(0x38)
+
+#define APB2OPB_OPB_CLK                    TO_REG(0x3c)
+#define   APB2OPB_OPB_CLK_SYNC             BIT(0)
+
+#define APB2OPB_IRQ_CLEAR                  TO_REG(0x40)
+#define   APB2OPB_IRQ_CLEAR_EN             BIT(0)
+
+#define APB2OPB_IRQ_MASK                   TO_REG(0x44)
+#define   APB2OPB_IRQ_MASK_OPB1_TX_ACK     BIT(17)
+#define   APB2OPB_IRQ_MASK_OPB0_TX_ACK     BIT(16)
+#define   APB2OPB_IRQ_MASK_CH3_TCONT       BIT(15)
+#define   APB2OPB_IRQ_MASK_CH2_TCONT       BIT(14)
+#define   APB2OPB_IRQ_MASK_CH1_TCONT       BIT(13)
+#define   APB2OPB_IRQ_MASK_CH0_TCONT       BIT(12)
+#define   APB2OPB_IRQ_MASK_CH3_FIFO_EMPTY  BIT(11)
+#define   APB2OPB_IRQ_MASK_CH2_FIFO_EMPTY  BIT(10)
+#define   APB2OPB_IRQ_MASK_CH1_FIFO_EMPTY  BIT(9)
+#define   APB2OPB_IRQ_MASK_CH0_FIFO_EMPTY  BIT(8)
+#define   APB2OPB_IRQ_MASK_CH3_FIFO_FULL   BIT(7)
+#define   APB2OPB_IRQ_MASK_CH2_FIFO_FULL   BIT(6)
+#define   APB2OPB_IRQ_MASK_CH1_FIFO_FULL   BIT(5)
+#define   APB2OPB_IRQ_MASK_CH0_FIFO_FULL   BIT(4)
+#define   APB2OPB_IRQ_MASK_CH3_DMA_EOT     BIT(3)
+#define   APB2OPB_IRQ_MASK_CH2_DMA_EOT     BIT(2)
+#define   APB2OPB_IRQ_MASK_CH1_DMA_EOT     BIT(1)
+#define   APB2OPB_IRQ_MASK_CH0_DMA_EOT     BIT(0)
+
+#define APB2OPB_IRQ_STS                    TO_REG(0x48)
+#define   APB2OPB_IRQ_STS_MASTER_ERROR     BIT(28)
+#define   APB2OPB_IRQ_STS_PORT_ERROR       BIT(27)
+#define   APB2OPB_IRQ_STS_HOTPLUG          BIT(26)
+#define   APB2OPB_IRQ_STS_SLAVE_7          BIT(25)
+#define   APB2OPB_IRQ_STS_SLAVE_6          BIT(24)
+#define   APB2OPB_IRQ_STS_SLAVE_5          BIT(23)
+#define   APB2OPB_IRQ_STS_SLAVE_4          BIT(22)
+#define   APB2OPB_IRQ_STS_SLAVE_3          BIT(21)
+#define   APB2OPB_IRQ_STS_SLAVE_2          BIT(20)
+#define   APB2OPB_IRQ_STS_SLAVE_1          BIT(19)
+#define   APB2OPB_IRQ_STS_SLAVE_0          BIT(18)
+#define   APB2OPB_IRQ_STS_OPB1_TX_ACK      BIT(17)
+#define   APB2OPB_IRQ_STS_OPB0_TX_ACK      BIT(16)
+#define   APB2OPB_IRQ_STS_CH3_TCONT        BIT(15)
+#define   APB2OPB_IRQ_STS_CH2_TCONT        BIT(14)
+#define   APB2OPB_IRQ_STS_CH1_TCONT        BIT(13)
+#define   APB2OPB_IRQ_STS_CH0_TCONT        BIT(12)
+#define   APB2OPB_IRQ_STS_CH3_FIFO_EMPTY   BIT(11)
+#define   APB2OPB_IRQ_STS_CH2_FIFO_EMPTY   BIT(10)
+#define   APB2OPB_IRQ_STS_CH1_FIFO_EMPTY   BIT(9)
+#define   APB2OPB_IRQ_STS_CH0_FIFO_EMPTY   BIT(8)
+#define   APB2OPB_IRQ_STS_CH3_FIFO_FULL    BIT(7)
+#define   APB2OPB_IRQ_STS_CH2_FIFO_FULL    BIT(6)
+#define   APB2OPB_IRQ_STS_CH1_FIFO_FULL    BIT(5)
+#define   APB2OPB_IRQ_STS_CH0_FIFO_FULL    BIT(4)
+#define   APB2OPB_IRQ_STS_CH3_DMA_EOT      BIT(3)
+#define   APB2OPB_IRQ_STS_CH2_DMA_EOT      BIT(2)
+#define   APB2OPB_IRQ_STS_CH1_DMA_EOT      BIT(1)
+#define   APB2OPB_IRQ_STS_CH0_DMA_EOT      BIT(0)
+
+#define APB2OPB_OPB0_WRITE_WORD_ENDIAN     TO_REG(0x4c)
+#define   APB2OPB_OPB0_WRITE_WORD_ENDIAN_BE 0x0011bb1b
+#define APB2OPB_OPB0_WRITE_BYTE_ENDIAN     TO_REG(0x50)
+#define   APB2OPB_OPB0_WRITE_BYTE_ENDIAN_BE 0xffaa5500
+#define APB2OPB_OPB1_WRITE_WORD_ENDIAN     TO_REG(0x54)
+#define APB2OPB_OPB1_WRITE_BYTE_ENDIAN     TO_REG(0x58)
+#define APB2OPB_OPB0_READ_BYTE_ENDIAN      TO_REG(0x5c)
+#define   APB2OPB_OPB0_READ_WORD_ENDIAN_BE 0x0011bb1b
+#define APB2OPB_OPB1_READ_BYTE_ENDIAN      TO_REG(0x60)
+
+#define APB2OPB_RETRY                      TO_REG(0x64)
+#define   APB2OPB_RETRY_COUNTER            GENMASK(15, 0)
+
+#define APB2OPB_OPB0_STATUS                TO_REG(0x80)
+#define APB2OPB_OPB1_STATUS                TO_REG(0x8c)
+#define   APB2OPB_OPB_STATUS_TIMEOUT       BIT(4)
+#define   APB2OPB_OPB_STATUS_RETRY         BIT(3)
+#define   APB2OPB_OPB_STATUS_ERROR_ACK     BIT(2)
+#define   APB2OPB_OPB_STATUS_FW_ACK        BIT(1)
+#define   APB2OPB_OPB_STATUS_HW_ACK        BIT(0)
+
+#define APB2OPB_OPB0_READ_DATA         TO_REG(0x84)
+
+#define APB2OPB_OPB1_DMA_STATUS            TO_REG(0x88)
+#define   APB2OPB_OPB1_DMA_STATUS_CH3_EOT  BIT(7)
+#define   APB2OPB_OPB1_DMA_STATUS_CH2_EOT  BIT(6)
+#define   APB2OPB_OPB1_DMA_STATUS_CH1_EOT  BIT(5)
+#define   APB2OPB_OPB1_DMA_STATUS_CH0_EOT  BIT(4)
+#define   APB2OPB_OPB1_DMA_STATUS_CH3_REQ  BIT(3)
+#define   APB2OPB_OPB1_DMA_STATUS_CH2_REQ  BIT(2)
+#define   APB2OPB_OPB1_DMA_STATUS_CH1_REQ  BIT(1)
+#define   APB2OPB_OPB1_DMA_STATUS_CH0_REQ  BIT(0)
+
+#define APB2OPB_OPB1_READ_DATA         TO_REG(0x90)
+
+static uint64_t aspeed_apb2opb_read(void *opaque, hwaddr addr, unsigned size)
+{
+    AspeedAPB2OPBState *s = ASPEED_APB2OPB(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
+                  __func__, addr, size);
+
+    assert(!(addr & 3));
+    assert(size == 4);
+
+    if (addr + size > sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out of bounds read: 0x%lx for %u\n", __func__, addr, size);
+        return 0;
+    }
+
+    return s->regs[TO_REG(addr)];
+}
+
+static void aspeed_apb2opb_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    AspeedAPB2OPBState *s = ASPEED_APB2OPB(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
+                  "value=%"PRIx64"\n", __func__, addr, size, data);
+
+    assert(!(addr & 3));
+    assert(size == 4);
+
+    if (addr + size > sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out of bounds write: %lx for %u\n", __func__, addr, size);
+        return;
+    }
+
+    switch (TO_REG(addr)) {
+        case APB2OPB_CONTROL:
+            opb_fsi_master_address(&s->opb[0], data & APB2OPB_CONTROL_OFF);
+            break;
+        case APB2OPB_OPB2FSI:
+            opb_opb2fsi_address(&s->opb[0], data & APB2OPB_OPB2FSI_OFF);
+            break;
+        case APB2OPB_OPB0_WRITE_WORD_ENDIAN:
+            if (data != APB2OPB_OPB0_WRITE_WORD_ENDIAN_BE) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: Bridge needs to be driven as BE (0x%x)\n",
+                        __func__, APB2OPB_OPB0_WRITE_WORD_ENDIAN_BE);
+            }
+            break;
+        case APB2OPB_OPB0_WRITE_BYTE_ENDIAN:
+            if (data != APB2OPB_OPB0_WRITE_BYTE_ENDIAN_BE) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: Bridge needs to be driven as BE (0x%x)\n",
+                        __func__, APB2OPB_OPB0_WRITE_BYTE_ENDIAN_BE);
+            }
+            break;
+        case APB2OPB_OPB0_READ_BYTE_ENDIAN:
+            if (data != APB2OPB_OPB0_READ_WORD_ENDIAN_BE) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: Bridge needs to be driven as BE (0x%x)\n",
+                        __func__, APB2OPB_OPB0_READ_WORD_ENDIAN_BE);
+            }
+            break;
+        case APB2OPB_TRIGGER:
+        {
+            uint32_t opb, op_mode, op_size, op_addr, op_data;
+
+            assert((s->regs[APB2OPB_OPB0_SEL] & APB2OPB_OPB_SEL_EN) ^
+                   (s->regs[APB2OPB_OPB1_SEL] & APB2OPB_OPB_SEL_EN));
+
+            if (s->regs[APB2OPB_OPB0_SEL] & APB2OPB_OPB_SEL_EN) {
+                opb = 0;
+                op_mode = s->regs[APB2OPB_OPB0_MODE];
+                op_size = s->regs[APB2OPB_OPB0_XFER];
+                op_addr = s->regs[APB2OPB_OPB0_ADDR];
+                op_data = s->regs[APB2OPB_OPB0_WRITE_DATA];
+            } else if (s->regs[APB2OPB_OPB1_SEL] & APB2OPB_OPB_SEL_EN) {
+                opb = 1;
+                op_mode = s->regs[APB2OPB_OPB1_MODE];
+                op_size = s->regs[APB2OPB_OPB1_XFER];
+                op_addr = s->regs[APB2OPB_OPB1_ADDR];
+                op_data = s->regs[APB2OPB_OPB1_WRITE_DATA];
+            } else {
+                assert(false);
+            }
+
+            if (op_size & ~(APB2OPB_OPB_XFER_HALF | APB2OPB_OPB_XFER_FULL)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "OPB transaction failed: Unrecognised access width: %d\n",
+                              op_size);
+                return;
+            }
+
+            op_size += 1;
+
+            printf("%s: Trigger OPB%d for a %s of %u bytes (0x%x) at 0x%x\n",
+                   __func__, opb, op_mode ? "read" : "write", op_size, op_data,
+                   op_addr);
+
+            if (op_mode & APB2OPB_OPB_MODE_RD) {
+                int index = opb ? APB2OPB_OPB1_READ_DATA
+                                : APB2OPB_OPB0_READ_DATA;
+
+                switch (op_size) {
+                    case 1:
+                        s->regs[index] = opb_read8(&s->opb[opb], op_addr);
+                        break;
+                    case 2:
+                        s->regs[index] = opb_read16(&s->opb[opb], op_addr);
+                        break;
+                    case 4:
+                        s->regs[index] = opb_read32(&s->opb[opb], op_addr);
+                        break;
+                    default:
+                        assert(false); /* should have bailed above */
+                }
+            } else {
+                /* FIXME: Endian swizzling */
+                switch (op_size) {
+                    case 1:
+                        opb_write8(&s->opb[opb], op_addr, op_data);
+                        break;
+                    case 2:
+                        opb_write16(&s->opb[opb], op_addr, op_data);
+                        break;
+                    case 4:
+                        opb_write32(&s->opb[opb], op_addr, op_data);
+                        break;
+                    default:
+                        assert(false); /* should have bailed above */
+                }
+            }
+            s->regs[APB2OPB_IRQ_STS] |= opb ? APB2OPB_IRQ_STS_OPB1_TX_ACK
+                                            : APB2OPB_IRQ_STS_OPB0_TX_ACK;
+            break;
+        }
+    }
+
+    s->regs[TO_REG(addr)] = data;
+}
+
+static const struct MemoryRegionOps aspeed_apb2opb_ops = {
+    .read = aspeed_apb2opb_read,
+    .write = aspeed_apb2opb_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void aspeed_apb2opb_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedAPB2OPBState *s = ASPEED_APB2OPB(dev);
+
+    qbus_create_inplace(&s->opb[0], sizeof(s->opb[0]), TYPE_OP_BUS, DEVICE(s), NULL);
+    qbus_create_inplace(&s->opb[1], sizeof(s->opb[1]), TYPE_OP_BUS, DEVICE(s), NULL);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_apb2opb_ops, s,
+                          TYPE_ASPEED_APB2OPB, 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void aspeed_apb2opb_reset(DeviceState *dev)
+{
+    AspeedAPB2OPBState *s = ASPEED_APB2OPB(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+
+    s->regs[APB2OPB_VERSION] = 0x000000a1;
+    s->regs[APB2OPB_OPB0_WRITE_WORD_ENDIAN] = 0x0044eee4;
+    s->regs[APB2OPB_OPB0_WRITE_BYTE_ENDIAN] = 0x0055aaff;
+    s->regs[APB2OPB_OPB1_WRITE_WORD_ENDIAN] = 0x00117717;
+    s->regs[APB2OPB_OPB1_WRITE_BYTE_ENDIAN] = 0xffaa5500;
+    s->regs[APB2OPB_OPB0_READ_BYTE_ENDIAN] = 0x0044eee4;
+    s->regs[APB2OPB_OPB0_READ_BYTE_ENDIAN] = 0x00117717;
+}
+
+static void aspeed_apb2opb_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "ASPEED APB2OPB Bridge";
+    dc->realize = aspeed_apb2opb_realize;
+    dc->reset = aspeed_apb2opb_reset;
+#if 0
+    dc->vmsd  = &vmstate_aspeed_apb2opb;
+    dc->props = aspeed_apb2opb_properties;
+#endif
+}
+
+static const TypeInfo aspeed_apb2opb_info = {
+    .name = TYPE_ASPEED_APB2OPB,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedAPB2OPBState),
+    .class_init = aspeed_apb2opb_class_init,
+};
+
+static void aspeed_apb2opb_register_types(void)
+{
+    type_register_static(&aspeed_apb2opb_info);
+}
+
+type_init(aspeed_apb2opb_register_types);
diff --git a/hw/fsi/cfam.c b/hw/fsi/cfam.c
new file mode 100644
index 000000000000..19d7c09ef537
--- /dev/null
+++ b/hw/fsi/cfam.c
@@ -0,0 +1,318 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM On-chip Peripheral Bus
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qemu/log.h"
+
+#include "hw/fsi/bits.h"
+#include "hw/fsi/cfam.h"
+#include "hw/fsi/fsi.h"
+#include "hw/fsi/engine-scratchpad.h"
+
+#include "hw/qdev-properties.h"
+
+#define TO_REG(x)                          ((x) >> 2)
+
+#define CFAM_ENGINE_CONFIG                  TO_REG(0x04)
+
+#define CFAM_CONFIG_CHIP_ID                TO_REG(0x00)
+#define CFAM_CONFIG_CHIP_ID_P9             0xc0022d15
+#define   CFAM_CONFIG_CHIP_ID_BREAK        0xc0de0000
+
+static uint64_t cfam_config_read(void *opaque, hwaddr addr, unsigned size)
+{
+    CFAMConfig *config;
+    CFAMState *cfam;
+    LBusNode *node;
+    int i;
+
+    config = CFAM_CONFIG(opaque);
+    cfam = container_of(config, CFAMState, config);
+
+    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
+                  __func__, addr, size);
+
+    assert(size == 4);
+    assert(!(addr & 3));
+
+#if 0 /* FIXME: Make it dynamic */
+    if (addr + size > sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out of bounds read: 0x%lx for %u\n", __func__, addr, size);
+        return 0;
+    }
+
+    val = s->regs[TO_REG(addr)];
+    printf("%s: read 0x%x\n", __func__, val);
+#endif
+
+    switch (addr) {
+        case 0x00:
+            return CFAM_CONFIG_CHIP_ID_P9;
+        case 0x04:
+            return ENGINE_CONFIG_NEXT
+                | 0x00010000                    /* slots */
+                | 0x00001000                    /* version */
+                | ENGINE_CONFIG_TYPE_PEEK   /* type */
+                | 0x0000000c;                   /* crc */
+        case 0x08:
+            return ENGINE_CONFIG_NEXT
+                | 0x00010000                    /* slots */
+                | 0x00005000                    /* version */
+                | ENGINE_CONFIG_TYPE_FSI    /* type */
+                | 0x0000000a;                   /* crc */
+            break;
+        default:
+            /* FIXME: Improve this */
+            i = 0xc;
+            QLIST_FOREACH(node, &cfam->lbus.devices, next) {
+                if (i == addr)
+                    return LBUS_DEVICE_GET_CLASS(node->ldev)->config;
+                i += size;
+            }
+
+            if (i == addr)
+                return 0;
+
+            return 0xc0de0000;
+    }
+}
+
+static void cfam_config_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    CFAMConfig *s = CFAM_CONFIG(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
+                  "value=%"PRIx64"\n", __func__, addr, size, data);
+
+    assert(size == 4);
+    assert(!(addr & 3));
+
+#if 0
+    if (addr + size > sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out of bounds write: 0x%lx for %u\n", __func__, addr, size);
+        return;
+    }
+#endif
+
+    switch (TO_REG(addr)) {
+        case CFAM_CONFIG_CHIP_ID:
+        case CFAM_CONFIG_CHIP_ID + 4:
+            if (data == CFAM_CONFIG_CHIP_ID_BREAK) {
+                qbus_reset_all(qdev_get_parent_bus(DEVICE(s)));
+            }
+            break;
+    }
+}
+
+static const struct MemoryRegionOps cfam_config_ops = {
+    .read = cfam_config_read,
+    .write = cfam_config_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void cfam_config_realize(DeviceState *dev, Error **errp)
+{
+    CFAMConfig *s = CFAM_CONFIG(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &cfam_config_ops, s,
+                          TYPE_CFAM_CONFIG, 0x400);
+}
+
+static void cfam_config_reset(DeviceState *dev)
+{
+    /* Config is read-only */
+}
+
+static void cfam_config_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = cfam_config_realize;
+    dc->reset = cfam_config_reset;
+}
+
+static const TypeInfo cfam_config_info = {
+    .name = TYPE_CFAM_CONFIG,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(CFAMConfig),
+    .class_init = cfam_config_class_init,
+};
+
+static void lbus_realize(BusState *bus, Error **errp)
+{
+    LBusNode *node;
+    LBus *lbus = LBUS(bus);
+
+    memory_region_init(&lbus->mr, OBJECT(lbus), TYPE_LBUS,
+                       (2 * 1024 * 1024) - 0x400);
+
+    QLIST_FOREACH(node, &lbus->devices, next) {
+        memory_region_add_subregion(&lbus->mr, node->ldev->address,
+                                    &node->ldev->iomem);
+    }
+}
+
+static void lbus_init(Object *o)
+{
+}
+
+static void lbus_class_init(ObjectClass *klass, void *data)
+{
+    BusClass *k = BUS_CLASS(klass);
+    k->realize = lbus_realize;
+}
+
+static const TypeInfo lbus_info = {
+    .name = TYPE_LBUS,
+    .parent = TYPE_BUS,
+    .instance_init = lbus_init,
+    .instance_size = sizeof(LBus),
+    .class_init = lbus_class_init,
+};
+
+static Property lbus_device_props[] = {
+    DEFINE_PROP_UINT32("address", LBusDevice, address, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+DeviceState *lbus_create_device(LBus *bus, const char *type, uint32_t addr)
+{
+    DeviceState *dev;
+    LBusNode *node;
+
+    dev = qdev_create(&bus->bus, type);
+    qdev_prop_set_uint8(dev, "address", addr);
+    qdev_init_nofail(dev);
+
+    /* Move to post_load */
+    node = g_malloc(sizeof(struct LBusNode));
+    node->ldev = LBUS_DEVICE(dev);
+    QLIST_INSERT_HEAD(&bus->devices, node, next);
+
+    return dev;
+}
+
+static void lbus_device_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *k = DEVICE_CLASS(klass);
+    k->bus_type = TYPE_LBUS;
+    k->props = lbus_device_props;
+}
+
+static const TypeInfo lbus_device_type_info = {
+    .name = TYPE_LBUS_DEVICE,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(LBusDevice),
+    .abstract = true,
+    .class_init = lbus_device_class_init,
+    .class_size = sizeof(LBusDeviceClass),
+};
+
+static uint64_t cfam_unimplemented_read(void *opaque, hwaddr addr, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
+                  __func__, addr, size);
+
+    return 0;
+}
+
+static void cfam_unimplemented_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
+                  "value=%"PRIx64"\n", __func__, addr, size, data);
+}
+
+static const struct MemoryRegionOps cfam_unimplemented_ops = {
+    .read = cfam_unimplemented_read,
+    .write = cfam_unimplemented_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void cfam_realize(DeviceState *dev, Error **errp)
+{
+    CFAMState *cfam = CFAM(dev);
+    FSISlaveState *slave = FSI_SLAVE(dev);
+    Error *err = NULL;
+
+    /* Each slave has a 2MiB address space */
+    memory_region_init_io(&cfam->mr, OBJECT(cfam), &cfam_unimplemented_ops, cfam,
+                          TYPE_CFAM, 2 * 1024 * 1024);
+    address_space_init(&cfam->as, &cfam->mr, TYPE_CFAM);
+
+    qdev_set_parent_bus(DEVICE(&cfam->config), qdev_get_parent_bus(dev));
+
+    object_property_set_bool(OBJECT(&cfam->config), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_bool(OBJECT(&cfam->lbus), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&cfam->mr, 0, &cfam->config.iomem);
+    /* memory_region_add_subregion(&cfam->mr, 0x800, &cfam->lbus.peek.iomem); */
+    memory_region_add_subregion(&cfam->mr, 0x800, &slave->iomem);
+    memory_region_add_subregion(&cfam->mr, 0xc00, &cfam->lbus.mr);
+}
+
+static void cfam_reset(DeviceState *dev)
+{
+    /* TODO: Figure out how inherited reset works */
+}
+
+static void cfam_init(Object *o)
+{
+    CFAMState *s = CFAM(o);
+
+    object_initialize_child(o, TYPE_CFAM_CONFIG, &s->config,
+                            sizeof(s->config), TYPE_CFAM_CONFIG,
+                            &error_abort, NULL);
+
+    qbus_create_inplace(&s->lbus, sizeof(s->lbus), TYPE_LBUS, DEVICE(s), NULL);
+
+    lbus_create_device(&s->lbus, TYPE_SCRATCHPAD, 0);
+}
+
+static void cfam_finalize(Object *o)
+{
+    CFAMState *s = CFAM(o);
+
+    address_space_destroy(&s->as);
+}
+
+static void cfam_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = cfam_realize;
+    dc->reset = cfam_reset;
+}
+
+static const TypeInfo cfam_info = {
+    .name = TYPE_CFAM,
+    .parent = TYPE_FSI_SLAVE,
+    .instance_init = cfam_init,
+    .instance_finalize = cfam_finalize,
+    .instance_size = sizeof(CFAMState),
+    .class_init = cfam_class_init,
+};
+
+static void cfam_register_types(void)
+{
+    type_register_static(&cfam_config_info);
+    type_register_static(&lbus_info);
+    type_register_static(&lbus_device_type_info);
+    type_register_static(&cfam_info);
+}
+
+type_init(cfam_register_types);
diff --git a/hw/fsi/engine-scratchpad.c b/hw/fsi/engine-scratchpad.c
new file mode 100644
index 000000000000..dac5f979518f
--- /dev/null
+++ b/hw/fsi/engine-scratchpad.c
@@ -0,0 +1,96 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM On-chip Peripheral Bus
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qemu/log.h"
+
+#include "hw/fsi/engine-scratchpad.h"
+
+static uint64_t scratchpad_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ScratchPad *s = SCRATCHPAD(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
+                  __func__, addr, size);
+
+    if (addr) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out of bounds read: 0x%lx for %u\n", __func__, addr, size);
+        return 0;
+    }
+
+    return s->reg;
+}
+
+static void scratchpad_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    ScratchPad *s = SCRATCHPAD(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
+                  "value=%"PRIx64"\n", __func__, addr, size, data);
+
+    if (addr) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out of bounds write: 0x%lx for %u\n", __func__, addr, size);
+        return;
+    }
+
+    s->reg = data;
+}
+
+static const struct MemoryRegionOps scratchpad_ops = {
+    .read = scratchpad_read,
+    .write = scratchpad_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void scratchpad_realize(DeviceState *dev, Error **errp)
+{
+    LBusDevice *ldev = LBUS_DEVICE(dev);
+
+    memory_region_init_io(&ldev->iomem, OBJECT(ldev), &scratchpad_ops,
+                          ldev, TYPE_SCRATCHPAD, 0x400);
+}
+
+static void scratchpad_reset(DeviceState *dev)
+{
+    ScratchPad *s = SCRATCHPAD(dev);
+
+    s->reg = 0;
+}
+
+static void scratchpad_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    LBusDeviceClass *ldc = LBUS_DEVICE_CLASS(klass);
+
+    dc->realize = scratchpad_realize;
+    dc->reset = scratchpad_reset;
+
+    ldc->config =
+          ENGINE_CONFIG_NEXT            /* valid */
+        | 0x00010000                    /* slots */
+        | 0x00001000                    /* version */
+        | ENGINE_CONFIG_TYPE_SCRATCHPAD /* type */
+        | 0x00000007;                   /* crc */
+}
+
+static const TypeInfo scratchpad_info = {
+    .name = TYPE_SCRATCHPAD,
+    .parent = TYPE_LBUS_DEVICE,
+    .instance_size = sizeof(ScratchPad),
+    .class_init = scratchpad_class_init,
+    .class_size = sizeof(LBusDeviceClass),
+};
+
+static void scratchpad_register_types(void)
+{
+    type_register_static(&scratchpad_info);
+}
+
+type_init(scratchpad_register_types);
diff --git a/hw/fsi/fsi-master.c b/hw/fsi/fsi-master.c
new file mode 100644
index 000000000000..6e5127e1465b
--- /dev/null
+++ b/hw/fsi/fsi-master.c
@@ -0,0 +1,200 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM On-chip Peripheral Bus
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+
+#include "qemu/log.h"
+
+#include "hw/fsi/bits.h"
+#include "hw/fsi/fsi-master.h"
+
+#define TO_REG(x)                               ((x) >> 2)
+
+#define FSI_MMODE                               TO_REG(0x000)
+#define   FSI_MMODE_IPOLL_DMA_EN                BE_BIT(0)
+#define   FSI_MMODE_HW_ERROR_RECOVERY_EN        BE_BIT(1)
+#define   FSI_MMODE_RELATIVE_ADDRESS_EN         BE_BIT(2)
+#define   FSI_MMODE_PARITY_CHECK_EN             BE_BIT(3)
+#define   FSI_MMODE_CLOCK_DIVIDER_0             BE_GENMASK(4, 13)
+#define   FSI_MMODE_CLOCK_DIVIDER_1             BE_GENMASK(14, 23)
+#define   FSI_MMODE_DEBUG_EN                    BE_BIT(24)
+
+#define FSI_MDELAY                              TO_REG(0x004)
+#define   FSI_MDELAY_ECHO_0                     BE_GENMASK(0, 3)
+#define   FSI_MDELAY_SEND_0                     BE_GENMASK(4, 7)
+#define   FSI_MDELAY_ECHO_1                     BE_GENMASK(8, 11)
+#define   FSI_MDELAY_SEND_1                     BE_GENMASK(12, 15)
+
+#define FSI_MENP0                               TO_REG(0x010)
+#define FSI_MENP32                              TO_REG(0x014)
+#define FSI_MSENP0                              TO_REG(0x018)
+#define FSI_MLEVP0                              TO_REG(0x018)
+#define FSI_MSENP32                             TO_REG(0x01c)
+#define FSI_MLEVP32                             TO_REG(0x01c)
+#define FSI_MCENP0                              TO_REG(0x020)
+#define FSI_MREFP0                              TO_REG(0x020)
+#define FSI_MCENP32                             TO_REG(0x024)
+#define FSI_MREFP32                             TO_REG(0x024)
+
+#define FSI_MAEB                                TO_REG(0x070)
+#define   FSI_MAEB_ANY_CPU_ERROR                BE_BIT(0)
+#define   FSI_MAEB_ANY_DMA_ERROR                BE_GENMASK(1, 16)
+#define   FSI_MAEB_ANY_PARITY_ERROR             BE_BIT(17)
+
+#define FSI_MVER                                TO_REG(0x074)
+#define   FSI_MVER_VERSION                      BE_GENMASK(0, 7)
+#define   FSI_MVER_BRIDGES                      BE_GENMASK(8, 15)
+#define   FSI_MVER_PORTS                        BE_GENMASK(16, 23)
+
+#define FSI_MRESP0                              TO_REG(0x0d0)
+#define   FSI_MRESP0_RESET_PORT_GENERAL         BE_BIT(0)
+#define   FSI_MRESP0_RESET_PORT_ERROR           BE_BIT(1)
+#define   FSI_MRESP0_RESET_ALL_BRIDGES_GENERAL  BE_BIT(2)
+#define   FSI_MRESP0_RESET_ALL_PORTS_GENERAL    BE_BIT(3)
+#define   FSI_MRESP0_RESET_MASTER               BE_BIT(4)
+#define   FSI_MRESP0_RESET_PARITY_ERROR_LATCH   BE_BIT(5)
+
+#define FSI_MRESB0                              TO_REG(0x1d0)
+#define   FSI_MRESB0_RESET_GENERAL              BE_BIT(0)
+#define   FSI_MRESB0_RESET_ERROR                BE_BIT(1)
+#define   FSI_MRESB0_SET_DMA_SUSPEND            BE_BIT(5)
+#define   FSI_MRESB0_CLEAR_DMA_SUSPEND          BE_BIT(6)
+#define   FSI_MRESB0_SET_DELAY_MEASURE          BE_BIT(7)
+
+#define FSI_MECTRL                              TO_REG(0x2e0)
+#define   FSI_MECTRL_TEST_PULSE                 BE_GENMASK(0, 7)
+#define   FSI_MECTRL_INHIBIT_PARITY_ERROR       BE_GENMASK(8, 15)
+#define   FSI_MECTRL_ENABLE_OPB_ERR_ACK         BE_BIT(16)
+#define   FSI_MECTRL_AUTO_TERMINATE             BE_BIT(17)
+#define   FSI_MECTRL_PORT_ERROR_FREEZE          BE_BIT(18)
+
+static uint64_t fsi_master_read(void *opaque, hwaddr addr, unsigned size)
+{
+    FSIMasterState *s = FSI_MASTER(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
+                  __func__, addr, size);
+
+    if (addr + size > sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out of bounds read: 0x%lx for %u\n", __func__, addr, size);
+        return 0;
+    }
+
+    return s->regs[TO_REG(addr)];
+}
+
+static void fsi_master_write(void *opaque, hwaddr addr, uint64_t data, unsigned size)
+{
+    FSIMasterState *s = FSI_MASTER(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
+                  "value=%"PRIx64"\n", __func__, addr, size, data);
+
+    if (addr + size > sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out of bounds write: %lx for %u\n", __func__, addr, size);
+        return;
+    }
+
+    switch (TO_REG(addr)) {
+        case FSI_MENP0:
+            s->regs[FSI_MENP0] = data;
+            break;
+        case FSI_MENP32:
+            s->regs[FSI_MENP32] = data;
+            break;
+        case FSI_MSENP0:
+            s->regs[FSI_MENP0] |= data;
+            break;
+        case FSI_MSENP32:
+            s->regs[FSI_MENP32] |= data;
+            break;
+        case FSI_MCENP0:
+            s->regs[FSI_MENP0] &= ~data;
+            break;
+        case FSI_MCENP32:
+            s->regs[FSI_MENP32] &= ~data;
+            break;
+        case FSI_MRESP0:
+            /* Perform necessary resets leave register 0 to indicate no errors */
+            break;
+        case FSI_MRESB0:
+            if (data & FSI_MRESB0_RESET_GENERAL) {
+                qdev_reset_all(DEVICE(opaque));
+            }
+            if (data & FSI_MRESB0_RESET_ERROR) {
+                /* FIXME: this seems dubious */
+                qdev_reset_all(DEVICE(opaque));
+            }
+            break;
+        default:
+            s->regs[TO_REG(addr)] = data;
+    }
+}
+
+static const struct MemoryRegionOps fsi_master_ops = {
+    .read = fsi_master_read,
+    .write = fsi_master_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void fsi_master_realize(DeviceState *dev, Error **errp)
+{
+    FSIMasterState *s = FSI_MASTER(dev);
+    Error *err = NULL;
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &fsi_master_ops, s,
+                          TYPE_FSI_MASTER, 0x10000000);
+    memory_region_init(&s->opb2fsi, OBJECT(s), "fsi.opb2fsi", 0x10000000);
+
+    object_property_set_bool(OBJECT(&s->bus), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->opb2fsi, 0, &s->bus.slave.mr);
+}
+
+static void fsi_master_init(Object *o)
+{
+    FSIMasterState *s = FSI_MASTER(o);
+
+    qbus_create_inplace(&s->bus, sizeof(s->bus), TYPE_FSI_BUS, DEVICE(s), NULL);
+}
+
+static void fsi_master_reset(DeviceState *dev)
+{
+    FSIMasterState *s = FSI_MASTER(dev);
+
+    /* ASPEED default */
+    s->regs[FSI_MVER] = 0xe0050101;
+}
+
+static void fsi_master_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "FSI Master";
+    dc->realize = fsi_master_realize;
+    dc->reset = fsi_master_reset;
+}
+
+static const TypeInfo fsi_master_info = {
+    .name = TYPE_FSI_MASTER,
+    .parent = TYPE_DEVICE,
+    .instance_init = fsi_master_init,
+    .instance_size = sizeof(FSIMasterState),
+    .class_init = fsi_master_class_init,
+};
+
+static void fsi_register_types(void)
+{
+    type_register_static(&fsi_master_info);
+}
+
+type_init(fsi_register_types);
diff --git a/hw/fsi/fsi-slave.c b/hw/fsi/fsi-slave.c
new file mode 100644
index 000000000000..2546610d7943
--- /dev/null
+++ b/hw/fsi/fsi-slave.c
@@ -0,0 +1,105 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM On-chip Peripheral Bus
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qemu/log.h"
+
+#include "hw/fsi/bits.h"
+#include "hw/fsi/fsi-slave.h"
+
+#define TO_REG(x)                               ((x) >> 2)
+
+#define FSI_SMODE               TO_REG(0x00)
+#define   FSI_SMODE_WSTART      BE_BIT(0)
+#define   FSI_SMODE_AUX_EN      BE_BIT(1)
+#define   FSI_SMODE_SLAVE_ID    BE_GENMASK(6, 7)
+#define   FSI_SMODE_ECHO_DELAY  BE_GENMASK(8, 11)
+#define   FSI_SMODE_SEND_DELAY  BE_GENMASK(12, 15)
+#define   FSI_SMODE_LBUS_DIV    BE_GENMASK(20, 23)
+#define   FSI_SMODE_BRIEF_LEFT  BE_GENMASK(24, 27)
+#define   FSI_SMODE_BRIEF_RIGHT BE_GENMASK(28, 31)
+
+#define FSI_SDMA                TO_REG(0x04)
+#define FSI_SISC                TO_REG(0x08)
+#define FSI_SCISC               TO_REG(0x08)
+#define FSI_SISM                TO_REG(0x0c)
+#define FSI_SISS                TO_REG(0x10)
+#define FSI_SSISM               TO_REG(0x10)
+#define FSI_SCISM               TO_REG(0x14)
+
+static uint64_t fsi_slave_read(void *opaque, hwaddr addr, unsigned size)
+{
+    FSISlaveState *s = FSI_SLAVE(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
+                  __func__, addr, size);
+
+    if (addr + size > sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out of bounds read: 0x%lx for %u\n", __func__, addr, size);
+        return 0;
+    }
+
+    return 0;
+}
+
+static void fsi_slave_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    FSISlaveState *s = FSI_SLAVE(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
+                  "value=%"PRIx64"\n", __func__, addr, size, data);
+
+    if (addr + size > sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out of bounds write: 0x%lx for %u\n", __func__, addr, size);
+        return;
+    }
+
+    s->regs[TO_REG(addr)] = data;
+}
+
+static const struct MemoryRegionOps fsi_slave_ops = {
+    .read = fsi_slave_read,
+    .write = fsi_slave_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void fsi_slave_init(Object *o)
+{
+    FSISlaveState *s = FSI_SLAVE(o);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &fsi_slave_ops,
+                          s, TYPE_FSI_SLAVE, 0x400);
+}
+
+static void fsi_slave_reset(DeviceState *dev)
+{
+    /* FIXME */
+}
+
+static void fsi_slave_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->reset = fsi_slave_reset;
+}
+
+static const TypeInfo fsi_slave_info = {
+    .name = TYPE_FSI_SLAVE,
+    .parent = TYPE_DEVICE,
+    .instance_init = fsi_slave_init,
+    .instance_size = sizeof(FSISlaveState),
+    .class_init = fsi_slave_class_init,
+};
+
+static void fsi_slave_register_types(void)
+{
+    type_register_static(&fsi_slave_info);
+}
+
+type_init(fsi_slave_register_types);
diff --git a/hw/fsi/fsi.c b/hw/fsi/fsi.c
new file mode 100644
index 000000000000..349601e49959
--- /dev/null
+++ b/hw/fsi/fsi.c
@@ -0,0 +1,55 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM Flexible Service Interface
+ */
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+
+#include "hw/fsi/fsi.h"
+#include "hw/fsi/cfam.h"
+
+static void fsi_bus_realize(BusState *bus, Error **errp)
+{
+    FSIBus *s = FSI_BUS(bus);
+    Error *err = NULL;
+
+    /* FIXME: Should be realised elsewhere and added to the bus */
+    object_property_set_bool(OBJECT(&s->slave), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+    }
+}
+
+static void fsi_bus_init(Object *o)
+{
+    FSIBus *s = FSI_BUS(o);
+
+    /* FIXME: Move this elsewhere */
+    object_initialize_child(o, TYPE_CFAM, &s->slave, sizeof(s->slave),
+                            TYPE_CFAM, &error_abort, NULL);
+    qdev_set_parent_bus(DEVICE(&s->slave), BUS(o));
+}
+
+static void fsi_bus_class_init(ObjectClass *klass, void *data)
+{
+    BusClass *bc = BUS_CLASS(klass);
+    bc->realize = fsi_bus_realize;
+}
+
+static const TypeInfo fsi_bus_info = {
+    .name = TYPE_FSI_BUS,
+    .parent = TYPE_BUS,
+    .instance_init = fsi_bus_init,
+    .instance_size = sizeof(FSIBus),
+    .class_init = fsi_bus_class_init,
+};
+
+static void fsi_bus_register_types(void)
+{
+    type_register_static(&fsi_bus_info);
+}
+
+type_init(fsi_bus_register_types);
diff --git a/hw/fsi/opb.c b/hw/fsi/opb.c
new file mode 100644
index 000000000000..77d9d0c0bde1
--- /dev/null
+++ b/hw/fsi/opb.c
@@ -0,0 +1,195 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM On-chip Peripheral Bus
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qemu/log.h"
+
+#include "hw/fsi/opb.h"
+
+static MemTxResult opb_read(OPBus *opb, hwaddr addr, void *data, size_t len)
+{
+    return address_space_read(&opb->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+                              len);
+}
+
+uint8_t opb_read8(OPBus *opb, hwaddr addr)
+{
+    MemTxResult tx;
+    uint8_t data;
+
+    tx = opb_read(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+
+    return data;
+}
+
+uint16_t opb_read16(OPBus *opb, hwaddr addr)
+{
+    MemTxResult tx;
+    uint16_t data;
+
+    tx = opb_read(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+
+    return data;
+}
+
+uint32_t opb_read32(OPBus *opb, hwaddr addr)
+{
+    MemTxResult tx;
+    uint32_t data;
+
+    tx = opb_read(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+
+    return data;
+}
+
+static MemTxResult opb_write(OPBus *opb, hwaddr addr, void *data, size_t len)
+{
+    return address_space_write(&opb->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+                               len);
+}
+
+void opb_write8(OPBus *opb, hwaddr addr, uint8_t data)
+{
+    MemTxResult tx;
+
+    tx = opb_write(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+}
+
+void opb_write16(OPBus *opb, hwaddr addr, uint16_t data)
+{
+    MemTxResult tx;
+
+    tx = opb_write(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+}
+
+void opb_write32(OPBus *opb, hwaddr addr, uint32_t data)
+{
+    MemTxResult tx;
+
+    tx = opb_write(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+}
+
+void opb_fsi_master_address(OPBus *opb, hwaddr addr)
+{
+    memory_region_transaction_begin();
+    memory_region_set_address(&opb->fsi.iomem, addr);
+    memory_region_transaction_commit();
+}
+
+void opb_opb2fsi_address(OPBus *opb, hwaddr addr)
+{
+    memory_region_transaction_begin();
+    memory_region_set_address(&opb->fsi.opb2fsi, addr);
+    memory_region_transaction_commit();
+}
+
+static uint64_t opb_unimplemented_read(void *opaque, hwaddr addr, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
+                  __func__, addr, size);
+
+    return 0;
+}
+
+static void opb_unimplemented_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
+                  "value=%"PRIx64"\n", __func__, addr, size, data);
+}
+
+static const struct MemoryRegionOps opb_unimplemented_ops = {
+    .read = opb_unimplemented_read,
+    .write = opb_unimplemented_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void opb_realize(BusState *bus, Error **errp)
+{
+    OPBus *opb = OP_BUS(bus);
+    Error *err = NULL;
+
+    memory_region_init_io(&opb->mr, OBJECT(opb), &opb_unimplemented_ops, opb,
+                          NULL, UINT32_MAX);
+    address_space_init(&opb->as, &opb->mr, "opb");
+
+    object_property_set_bool(OBJECT(&opb->fsi), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(&opb->mr, 0x80000000, &opb->fsi.iomem);
+
+    /* OPB2FSI region */
+    /*
+     * Avoid endianness issues by mapping each slave's memory region directly.
+     * Manually bridging multiple address-spaces causes endian swapping
+     * headaches as memory_region_dispatch_read() and
+     * memory_region_dispatch_write() correct the endianness based on the
+     * target machine endianness and not relative to the device endianness on
+     * either side of the bridge.
+     */
+    /*
+     * XXX: This is a bit hairy and will need to be fixed when I sort out the
+     * bus/slave relationship and any changes to the CFAM modelling (multiple
+     * slaves, LBUS)
+     */
+    memory_region_add_subregion(&opb->mr, 0xa0000000, &opb->fsi.opb2fsi);
+}
+
+static void opb_init(Object *o)
+{
+    OPBus *opb = OP_BUS(o);
+
+    object_initialize_child(o, "fsi-master", &opb->fsi, sizeof(opb->fsi),
+                            TYPE_FSI_MASTER, &error_abort, NULL);
+    qdev_set_parent_bus(DEVICE(&opb->fsi), BUS(o));
+}
+
+static void opb_finalize(Object *o)
+{
+    OPBus *opb = OP_BUS(o);
+
+    address_space_destroy(&opb->as);
+}
+
+static void opb_class_init(ObjectClass *klass, void *data)
+{
+    BusClass *bc = BUS_CLASS(klass);
+    bc->realize = opb_realize;
+}
+
+static const TypeInfo opb_info = {
+    .name = TYPE_OP_BUS,
+    .parent = TYPE_BUS,
+    .instance_init = opb_init,
+    .instance_finalize = opb_finalize,
+    .instance_size = sizeof(OPBus),
+    .class_init = opb_class_init,
+    .class_size = sizeof(OPBusClass),
+};
+
+static void opb_register_types(void)
+{
+    type_register_static(&opb_info);
+}
+
+type_init(opb_register_types);
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index eb0ae224a022..a02351cbfbab 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -78,7 +78,7 @@ obj-$(CONFIG_PVPANIC) += pvpanic.o
 obj-$(CONFIG_AUX) += auxbus.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_xdma.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o aspeed_ibt.o
-obj-$(CONFIG_ASPEED_SOC) += aspeed_pwm.o aspeed_lpc.o aspeed_fsi.o
+obj-$(CONFIG_ASPEED_SOC) += aspeed_pwm.o aspeed_lpc.o
 obj-$(CONFIG_MSF2) += msf2-sysreg.o
 obj-$(CONFIG_NRF51_SOC) += nrf51_rng.o
 
diff --git a/hw/misc/aspeed_fsi.c b/hw/misc/aspeed_fsi.c
deleted file mode 100644
index 324bb8c3552c..000000000000
--- a/hw/misc/aspeed_fsi.c
+++ /dev/null
@@ -1,115 +0,0 @@
-/*
- *  ASPEED FSI Controller
- *
- *  Copyright (C) 2019 IBM Corp.
- *
- * This code is licensed under the GPL version 2 or later.  See
- * the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/log.h"
-#include "qemu/error-report.h"
-#include "hw/misc/aspeed_fsi.h"
-#include "qapi/error.h"
-
-#define TO_REG(offset) ((offset) >> 2)
-
-#define FSI_VERSION          TO_REG(0x00)
-
-static uint64_t aspeed_fsi_read(void *opaque, hwaddr offset, unsigned size)
-{
-    AspeedFsiState *s = ASPEED_FSI(opaque);
-    int reg = TO_REG(offset);
-
-    if (reg >= ARRAY_SIZE(s->regs)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
-                      __func__, offset);
-        return 0;
-    }
-
-    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
-                  __func__, offset, size);
-    return s->regs[reg];
-}
-
-static void aspeed_fsi_write(void *opaque, hwaddr offset, uint64_t data,
-                             unsigned int size)
-{
-    AspeedFsiState *s = ASPEED_FSI(opaque);
-    int reg = TO_REG(offset);
-
-    if (reg >= ARRAY_SIZE(s->regs)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
-                      __func__, offset);
-        return;
-    }
-
-    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
-                  "value=%"PRIx64"\n", __func__, offset, size, data);
-    s->regs[reg] = data;
-}
-
-static const MemoryRegionOps aspeed_fsi_ops = {
-    .read = aspeed_fsi_read,
-    .write = aspeed_fsi_write,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-    .valid.min_access_size = 4,
-    .valid.max_access_size = 4,
-};
-
-static void aspeed_fsi_reset(DeviceState *dev)
-{
-    struct AspeedFsiState *s = ASPEED_FSI(dev);
-
-    memset(s->regs, 0, sizeof(s->regs));
-}
-
-static void aspeed_fsi_realize(DeviceState *dev, Error **errp)
-{
-    AspeedFsiState *s = ASPEED_FSI(dev);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-
-    sysbus_init_irq(sbd, &s->irq);
-
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_fsi_ops, s,
-            TYPE_ASPEED_FSI, 0x100);
-
-    sysbus_init_mmio(sbd, &s->iomem);
-}
-
-static const VMStateDescription vmstate_aspeed_fsi = {
-    .name = TYPE_ASPEED_FSI,
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, AspeedFsiState, ASPEED_FSI_NR_REGS),
-        VMSTATE_END_OF_LIST(),
-    }
-};
-
-static void aspeed_fsi_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = aspeed_fsi_realize;
-    dc->reset = aspeed_fsi_reset;
-    dc->desc = "Aspeed FSI Controller",
-    dc->vmsd = &vmstate_aspeed_fsi;
-}
-
-static const TypeInfo aspeed_fsi_info = {
-    .name = TYPE_ASPEED_FSI,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(AspeedFsiState),
-    .class_init = aspeed_fsi_class_init,
-};
-
-static void aspeed_fsi_register_types(void)
-{
-    type_register_static(&aspeed_fsi_info);
-}
-
-type_init(aspeed_fsi_register_types);
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index b78c0d926a1e..855edadbe7b8 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -29,7 +29,7 @@
 #include "hw/misc/aspeed_ibt.h"
 #include "hw/misc/aspeed_pwm.h"
 #include "hw/misc/aspeed_lpc.h"
-#include "hw/misc/aspeed_fsi.h"
+#include "hw/fsi/aspeed-apb2opb.h"
 
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_WDTS_NUM  4
@@ -63,7 +63,7 @@ typedef struct AspeedSoCState {
     AspeedIBTState ibt;
     AspeedPWMState pwm;
     AspeedLPCState lpc;
-    AspeedFsiState fsi[2];
+    AspeedAPB2OPBState fsi[2];
 } AspeedSoCState;
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
diff --git a/include/hw/fsi/aspeed-apb2opb.h b/include/hw/fsi/aspeed-apb2opb.h
new file mode 100644
index 000000000000..96c53de854b8
--- /dev/null
+++ b/include/hw/fsi/aspeed-apb2opb.h
@@ -0,0 +1,31 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * ASPEED APB2OPB Bridge
+ */
+#ifndef FSI_ASPEED_APB2OPB_H
+#define FSI_ASPEED_APB2OPB_H
+
+#include "hw/sysbus.h"
+#include "hw/fsi/opb.h"
+
+#define TYPE_ASPEED_APB2OPB "aspeed.apb2opb"
+#define ASPEED_APB2OPB(obj) OBJECT_CHECK(AspeedAPB2OPBState, (obj), TYPE_ASPEED_APB2OPB)
+
+#define ASPEED_APB2OPB_NR_REGS ((0xe8 >> 2) + 1)
+
+typedef struct AspeedAPB2OPBState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    uint32_t regs[ASPEED_APB2OPB_NR_REGS];
+    qemu_irq irq;
+
+    OPBus opb[2];
+} AspeedAPB2OPBState;
+
+#endif /* FSI_ASPEED_APB2OPB_H */
diff --git a/include/hw/fsi/bits.h b/include/hw/fsi/bits.h
new file mode 100644
index 000000000000..373d8cd48aea
--- /dev/null
+++ b/include/hw/fsi/bits.h
@@ -0,0 +1,15 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * Bit operation macros
+ */
+#ifndef FSI_BITS_H
+#define FSI_BITS_H
+
+#define BE_BIT(x)                          BIT(31 - (x))
+#define GENMASK(t, b) \
+    (((1ULL << ((t) + 1)) - 1) & ~((1ULL << (b)) - 1))
+#define BE_GENMASK(t, b)                   GENMASK(BE_BIT(t), BE_BIT(b))
+
+#endif /* FSI_BITS_H */
diff --git a/include/hw/fsi/cfam.h b/include/hw/fsi/cfam.h
new file mode 100644
index 000000000000..07cfb893905c
--- /dev/null
+++ b/include/hw/fsi/cfam.h
@@ -0,0 +1,33 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM Common FRU Access Macro
+ */
+#ifndef FSI_CFAM_H
+#define FSI_CFAM_H
+
+#include "exec/memory.h"
+
+#include "hw/fsi/fsi-slave.h"
+#include "hw/fsi/lbus.h"
+
+#define TYPE_CFAM "cfam"
+#define CFAM(obj) OBJECT_CHECK(CFAMState, (obj), TYPE_CFAM)
+
+#define CFAM_NR_REGS ((0x2e0 >> 2) + 1)
+
+struct CFAMState {
+    /* < private > */
+    FSISlaveState parent;
+
+    MemoryRegion mr;
+    AddressSpace as;
+
+    CFAMConfig config;
+    CFAMPeek peek;
+
+    LBus lbus;
+};
+
+#endif /* FSI_CFAM_H */
diff --git a/include/hw/fsi/engine-scratchpad.h b/include/hw/fsi/engine-scratchpad.h
new file mode 100644
index 000000000000..9b5694dc1159
--- /dev/null
+++ b/include/hw/fsi/engine-scratchpad.h
@@ -0,0 +1,21 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM On-chip Peripheral Bus
+ */
+#ifndef FSI_ENGINE_SCRATCHPAD_H
+#define FSI_ENGINE_SCRATCHPAD_H
+
+#include "hw/fsi/lbus.h"
+
+#define TYPE_SCRATCHPAD "scratchpad"
+#define SCRATCHPAD(obj) OBJECT_CHECK(ScratchPad, (obj), TYPE_SCRATCHPAD)
+
+typedef struct ScratchPad {
+	LBusDevice parent;
+
+	uint32_t reg;
+} ScratchPad;
+
+#endif /* FSI_ENGINE_SCRATCHPAD_H */
diff --git a/include/hw/fsi/fsi-master.h b/include/hw/fsi/fsi-master.h
new file mode 100644
index 000000000000..62aa2f1ed4ed
--- /dev/null
+++ b/include/hw/fsi/fsi-master.h
@@ -0,0 +1,30 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM On-Chip Peripheral Bus
+ */
+#ifndef FSI_FSI_MASTER_H
+#define FSI_FSI_MASTER_H
+
+#include "exec/memory.h"
+#include "hw/qdev-core.h"
+#include "hw/fsi/fsi.h"
+
+#define TYPE_FSI_MASTER "fsi.master"
+#define FSI_MASTER(obj) OBJECT_CHECK(FSIMasterState, (obj), TYPE_FSI_MASTER)
+
+#define FSI_MASTER_NR_REGS ((0x2e0 >> 2) + 1)
+
+typedef struct FSIMasterState {
+    DeviceState parent;
+    MemoryRegion iomem;
+    MemoryRegion opb2fsi;
+
+    FSIBus bus;
+
+    uint32_t regs[FSI_MASTER_NR_REGS];
+} FSIMasterState;
+
+
+#endif /* FSI_FSI_H */
diff --git a/include/hw/fsi/fsi-slave.h b/include/hw/fsi/fsi-slave.h
new file mode 100644
index 000000000000..035330150dbb
--- /dev/null
+++ b/include/hw/fsi/fsi-slave.h
@@ -0,0 +1,29 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM On-Chip Peripheral Bus
+ */
+#ifndef FSI_FSI_SLAVE_H
+#define FSI_FSI_SLAVE_H
+
+#include "exec/memory.h"
+#include "hw/qdev-core.h"
+
+#include "hw/fsi/lbus.h"
+
+#include <stdint.h>
+
+#define TYPE_FSI_SLAVE "fsi.slave"
+#define FSI_SLAVE(obj) \
+    OBJECT_CHECK(FSISlaveState, (obj), TYPE_FSI_SLAVE)
+#define FSI_SLAVE_CONTROL_NR_REGS ((0x40 >> 2) + 1)
+
+typedef struct FSISlaveState {
+    DeviceState parent;
+
+    MemoryRegion iomem;
+    uint32_t regs[FSI_SLAVE_CONTROL_NR_REGS];
+} FSISlaveState;
+
+#endif /* FSI_FSI_H */
diff --git a/include/hw/fsi/fsi.h b/include/hw/fsi/fsi.h
new file mode 100644
index 000000000000..fa5a9d7cec9e
--- /dev/null
+++ b/include/hw/fsi/fsi.h
@@ -0,0 +1,32 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM On-Chip Peripheral Bus
+ */
+#ifndef FSI_FSI_H
+#define FSI_FSI_H
+
+#include "hw/qdev-core.h"
+
+/* TODO: Maybe unwind this dependency with const links? Store a pointer in
+ * FSIBus?
+ */
+#include "hw/fsi/cfam.h"
+
+#define TYPE_FSI_BUS "fsi.bus"
+#define FSI_BUS(obj) OBJECT_CHECK(FSIBus, (obj), TYPE_FSI_BUS)
+#define FSI_BUS_CLASS(klass) OBJECT_CLASS_CHECK(FSIBusClass, (klass), TYPE_FSI_BUS)
+#define FSI_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(FSIBusClass, (obj), TYPE_FSI_BUS)
+
+/* TODO: Figure out what's best with a point-to-point bus */
+typedef struct FSISlaveState FSISlaveState;
+
+typedef struct FSIBus {
+    BusState bus;
+
+    /* XXX: It's point-to-point, just instantiate the slave directly for now */
+    CFAMState slave;
+} FSIBus;
+
+#endif
diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
new file mode 100644
index 000000000000..50f1aa217339
--- /dev/null
+++ b/include/hw/fsi/lbus.h
@@ -0,0 +1,95 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM Common FRU Access Macro
+ */
+#ifndef FSI_LBUS_H
+#define FSI_LBUS_H
+
+#include "exec/memory.h"
+#include "hw/qdev-core.h"
+
+#include "hw/fsi/bits.h"
+
+#define ENGINE_CONFIG_NEXT              BE_BIT(0)
+#define ENGINE_CONFIG_VPD               BE_BIT(1)
+#define ENGINE_CONFIG_SLOTS             BE_GENMASK(8, 15)
+#define ENGINE_CONFIG_VERSION           BE_GENMASK(16, 19)
+#define ENGINE_CONFIG_TYPE              BE_GENMASK(20, 27)
+#define   ENGINE_CONFIG_TYPE_PEEK       (0x02 << 4)
+#define   ENGINE_CONFIG_TYPE_FSI        (0x03 << 4)
+#define   ENGINE_CONFIG_TYPE_SCRATCHPAD (0x06 << 4)
+#define ENGINE_CONFIG_CRC              BE_GENMASK(28, 31)
+
+#define TYPE_CFAM_CONFIG "cfam.config"
+#define CFAM_CONFIG(obj) \
+    OBJECT_CHECK(CFAMConfig, (obj), TYPE_CFAM_CONFIG)
+/* P9-ism */
+#define CFAM_CONFIG_NR_REGS 0x28
+
+typedef struct CFAMState CFAMState;
+
+/* TODO: Generalise this accommodate different CFAM configurations */
+typedef struct CFAMConfig {
+    DeviceState parent;
+
+    MemoryRegion iomem;
+} CFAMConfig;
+
+#define TYPE_CFAM_PEEK "cfam.peek"
+#define CFAM_PEEK(obj) \
+    OBJECT_CHECK(CFAMPeek, (obj), TYPE_CFAM_PEEK)
+#define CFAM_PEEK_NR_REGS ((0x130 >> 2) + 1)
+
+typedef struct CFAMPeek {
+    DeviceState parent;
+
+    MemoryRegion iomem;
+} CFAMPeek;
+
+#define TYPE_LBUS_DEVICE "lbus.device"
+#define LBUS_DEVICE(obj) \
+    OBJECT_CHECK(LBusDevice, (obj), TYPE_LBUS_DEVICE)
+#define LBUS_DEVICE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(LBusDeviceClass, (klass), TYPE_LBUS_DEVICE)
+#define LBUS_DEVICE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(LBusDeviceClass, (obj), TYPE_LBUS_DEVICE)
+
+typedef struct LBusDevice {
+    DeviceState parent;
+
+    MemoryRegion iomem;
+    uint32_t address;
+} LBusDevice;
+
+typedef struct LBusDeviceClass {
+    DeviceClass parent;
+
+    uint32_t config;
+} LBusDeviceClass;
+
+typedef struct LBusNode {
+    LBusDevice *ldev;
+
+    QLIST_ENTRY(LBusNode) next;
+} LBusNode;
+
+#define TYPE_LBUS "lbus"
+#define LBUS(obj) OBJECT_CHECK(LBus, (obj), TYPE_LBUS)
+#define LBUS_CLASS(klass) \
+    OBJECT_CLASS_CHECK(LBusClass, (klass), TYPE_LBUS)
+#define LBUS_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(LBusClass, (obj), TYPE_LBUS)
+
+typedef struct LBus {
+    BusState bus;
+
+    MemoryRegion mr;
+
+    QLIST_HEAD(, LBusNode) devices;
+} LBus;
+
+DeviceState *lbus_create_device(LBus *bus, const char *type, uint32_t addr);
+int lbus_add_device(LBus *bus, LBusDevice *dev);
+#endif /* FSI_LBUS_H */
diff --git a/include/hw/fsi/opb.h b/include/hw/fsi/opb.h
new file mode 100644
index 000000000000..5643fc364d68
--- /dev/null
+++ b/include/hw/fsi/opb.h
@@ -0,0 +1,45 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019 IBM Corp.
+ *
+ * IBM On-Chip Peripheral Bus
+ */
+#ifndef FSI_OPB_H
+#define FSI_OPB_H
+
+#include "exec/memory.h"
+#include "hw/fsi/fsi-master.h"
+
+#define TYPE_OP_BUS "opb"
+#define OP_BUS(obj) OBJECT_CHECK(OPBus, (obj), TYPE_OP_BUS)
+#define OP_BUS_CLASS(klass) OBJECT_CLASS_CHECK(OPBusClass, (klass), TYPE_OP_BUS)
+#define OP_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(OPBusClass, (obj), TYPE_OP_BUS)
+
+typedef struct OPBus {
+	/*< private >*/
+	BusState bus;
+
+	/*< public >*/
+	MemoryRegion mr;
+	AddressSpace as;
+
+	/* Model OPB as dumb enough just to provide an address-space */
+	/* TODO: Maybe don't store device state in the bus? */
+	FSIMasterState fsi;
+} OPBus;
+
+typedef struct OPBusClass {
+	BusClass parent_class;
+} OPBusClass;
+
+uint8_t opb_read8(OPBus *opb, hwaddr addr);
+uint16_t opb_read16(OPBus *opb, hwaddr addr);
+uint32_t opb_read32(OPBus *opb, hwaddr addr);
+void opb_write8(OPBus *opb, hwaddr addr, uint8_t data);
+void opb_write16(OPBus *opb, hwaddr addr, uint16_t data);
+void opb_write32(OPBus *opb, hwaddr addr, uint32_t data);
+
+void opb_fsi_master_address(OPBus *opb, hwaddr addr);
+void opb_opb2fsi_address(OPBus *opb, hwaddr addr);
+
+#endif /* FSI_OPB_H */
diff --git a/include/hw/misc/aspeed_fsi.h b/include/hw/misc/aspeed_fsi.h
deleted file mode 100644
index e436371a7824..000000000000
--- a/include/hw/misc/aspeed_fsi.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- *  ASPEED FSI Controller
- *
- *  Copyright (C) 2019 IBM Corp.
- *
- * This code is licensed under the GPL version 2 or later.  See
- * the COPYING file in the top-level directory.
- */
-
-#ifndef ASPEED_FSI_H
-#define ASPEED_FSI_H
-
-#include "hw/sysbus.h"
-
-#define TYPE_ASPEED_FSI "aspeed.fsi"
-#define ASPEED_FSI(obj) OBJECT_CHECK(AspeedFsiState, (obj), TYPE_ASPEED_FSI)
-
-#define ASPEED_FSI_NR_REGS (0x100 >> 2)
-
-typedef struct AspeedFsiState {
-    /* <private> */
-    SysBusDevice parent;
-
-    /*< public >*/
-    MemoryRegion iomem;
-    qemu_irq irq;
-
-    uint32_t regs[ASPEED_FSI_NR_REGS];
-} AspeedFsiState;
-
-#endif /* _ASPEED_FSI_H_ */
diff --git a/qom/object.c b/qom/object.c
index 1555547727c4..0919c5da4593 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -463,6 +463,9 @@ static void object_initialize_with_type(void *data, size_t size, TypeImpl *type)
     object_ref(obj);
     obj->properties = g_hash_table_new_full(g_str_hash, g_str_equal,
                                             NULL, object_property_free);
+    if (!strcmp("opb", type->name)) {
+        printf("type: %s, properties: %p\n", type->name, obj->properties);
+    }
     object_init_with_type(obj, type);
     object_post_init_with_type(obj, type);
 }
-- 
2.20.1

