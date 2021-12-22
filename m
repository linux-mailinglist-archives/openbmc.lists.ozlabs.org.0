Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46A47CF24
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 10:24:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJnw23C4Fz2xKJ
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 20:24:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJnvj02M0z3bhg
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 20:24:16 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BM9HtjS081426;
 Wed, 22 Dec 2021 17:17:55 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Dec
 2021 17:23:21 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 1/2] hw/misc: Implementating dummy AST2600 I3C model
Date: Wed, 22 Dec 2021 17:23:18 +0800
Message-ID: <20211222092319.2988568-2-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222092319.2988568-1-troy_lee@aspeedtech.com>
References: <20211222092319.2988568-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BM9HtjS081426
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 leetroy@gmail.com, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Introduce a dummy AST2600 I3C model.

Aspeed 2600 SDK enables I3C support by default.  The I3C driver will try
to reset the device controller and setup through device address table
register.  This dummy model response these register with default value
listed on ast2600v10 datasheet chapter 54.2.  If the device address
table register doesn't set correctly, it will cause guest machine kernel
panic due to reference to invalid address.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 hw/misc/aspeed_i3c.c         | 258 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   1 +
 include/hw/misc/aspeed_i3c.h |  30 ++++
 3 files changed, 289 insertions(+)
 create mode 100644 hw/misc/aspeed_i3c.c
 create mode 100644 include/hw/misc/aspeed_i3c.h

diff --git a/hw/misc/aspeed_i3c.c b/hw/misc/aspeed_i3c.c
new file mode 100644
index 0000000000..9d2bda203e
--- /dev/null
+++ b/hw/misc/aspeed_i3c.c
@@ -0,0 +1,258 @@
+/*
+ * ASPEED I3C Controller
+ *
+ * Copyright (C) 2021 ASPEED Technology Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "hw/misc/aspeed_i3c.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+
+/* I3C Controller Registers */
+#define R_I3CG_REG0(x)                  (((x * 0x10) + 0x10) / 4)
+#define  I3CG_REG0_SDA_PULLUP_EN_MASK   GENMASK(29, 28)
+#define  I3CG_REG0_SDA_PULLUP_EN_2K     BIT(28)
+#define  I3CG_REG0_SDA_PULLUP_EN_750    BIT(29)
+#define  I3CG_REG0_SDA_PULLUP_EN_545    (BIT(29) | BIT(28))
+
+#define R_I3CG_REG1(x)                  (((x * 0x10) + 0x14) / 4)
+#define  I3CG_REG1_I2C_MODE             BIT(0)
+#define  I3CG_REG1_TEST_MODE            BIT(1)
+#define  I3CG_REG1_ACT_MODE_MASK        GENMASK(3, 2)
+#define  I3CG_REG1_ACT_MODE(x)          (((x) << 2) & I3CG_REG1_ACT_MODE_MASK)
+#define  I3CG_REG1_PENDING_INT_MASK     GENMASK(7, 4)
+#define  I3CG_REG1_PENDING_INT(x)   (((x) << 4) & I3CG_REG1_PENDING_INT_MASK)
+#define  I3CG_REG1_SA_MASK              GENMASK(14, 8)
+#define  I3CG_REG1_SA(x)                (((x) << 8) & I3CG_REG1_SA_MASK)
+#define  I3CG_REG1_SA_EN                BIT(15)
+#define  I3CG_REG1_INST_ID_MASK         GENMASK(19, 16)
+#define  I3CG_REG1_INST_ID(x)           (((x) << 16) & I3CG_REG1_INST_ID_MASK)
+
+/* I3C Device Registers */
+#define R_DEVICE_CTRL                   (0x00 / 4)
+#define R_DEVICE_ADDR                   (0x04 / 4)
+#define R_HW_CAPABILITY                 (0x08 / 4)
+#define R_COMMAND_QUEUE_PORT            (0x0c / 4)
+#define R_RESPONSE_QUEUE_PORT           (0x10 / 4)
+#define R_RX_TX_DATA_PORT               (0x14 / 4)
+#define R_IBI_QUEUE_STATUS              (0x18 / 4)
+#define R_IBI_QUEUE_DATA                (0x18 / 4)
+#define R_QUEUE_THLD_CTRL               (0x1c / 4)
+#define R_DATA_BUFFER_THLD_CTRL         (0x20 / 4)
+#define R_IBI_QUEUE_CTRL                (0x24 / 4)
+#define R_IBI_MR_REQ_REJECT             (0x2c / 4)
+#define R_IBI_SIR_REQ_REJECT            (0x30 / 4)
+#define R_RESET_CTRL                    (0x34 / 4)
+#define R_SLV_EVENT_CTRL                (0x38 / 4)
+#define R_INTR_STATUS                   (0x3c / 4)
+#define R_INTR_STATUS_EN                (0x40 / 4)
+#define R_INTR_SIGNAL_EN                (0x44 / 4)
+#define R_INTR_FORCE                    (0x48 / 4)
+#define R_QUEUE_STATUS_LEVEL            (0x4c / 4)
+#define R_DATA_BUFFER_STATUS_LEVEL      (0x50 / 4)
+#define R_PRESENT_STATE                 (0x54 / 4)
+#define R_CCC_DEVICE_STATUS             (0x58 / 4)
+#define R_DEVICE_ADDR_TABLE_POINTER     (0x5c / 4)
+#define  DEVICE_ADDR_TABLE_DEPTH(x)     (((x) & GENMASK(31, 16)) >> 16)
+#define  DEVICE_ADDR_TABLE_ADDR(x)      ((x) & GENMASK(7, 0))
+#define R_DEV_CHAR_TABLE_POINTER        (0x60 / 4)
+#define R_VENDOR_SPECIFIC_REG_POINTER   (0x6c / 4)
+#define R_SLV_MIPI_PID_VALUE            (0x70 / 4)
+#define R_SLV_PID_VALUE                 (0x74 / 4)
+#define R_SLV_CHAR_CTRL                 (0x78 / 4)
+#define R_SLV_MAX_LEN                   (0x7c / 4)
+#define R_MAX_READ_TURNAROUND           (0x80 / 4)
+#define R_MAX_DATA_SPEED                (0x84 / 4)
+#define R_SLV_DEBUG_STATUS              (0x88 / 4)
+#define R_SLV_INTR_REQ                  (0x8c / 4)
+#define R_DEVICE_CTRL_EXTENDED          (0xb0 / 4)
+#define R_SCL_I3C_OD_TIMING             (0xb4 / 4)
+#define R_SCL_I3C_PP_TIMING             (0xb8 / 4)
+#define R_SCL_I2C_FM_TIMING             (0xbc / 4)
+#define R_SCL_I2C_FMP_TIMING            (0xc0 / 4)
+#define R_SCL_EXT_LCNT_TIMING           (0xc8 / 4)
+#define R_SCL_EXT_TERMN_LCNT_TIMING     (0xcc / 4)
+#define R_BUS_FREE_TIMING               (0xd4 / 4)
+#define R_BUS_IDLE_TIMING               (0xd8 / 4)
+#define R_I3C_VER_ID                    (0xe0 / 4)
+#define R_I3C_VER_TYPE                  (0xe4 / 4)
+#define R_EXTENDED_CAPABILITY           (0xe8 / 4)
+#define R_SLAVE_CONFIG                  (0xec / 4)
+
+static uint64_t aspeed_i3c_read(void *opaque,
+                                hwaddr addr,
+                                unsigned int size)
+{
+    AspeedI3CState *s = ASPEED_I3C(opaque);
+    uint64_t val = 0;
+
+    addr >>= 2;
+
+    if (addr >= ASPEED_I3C_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr << 2);
+    } else if (addr < 0x800) {
+        /* I3C controller register */
+        val = s->regs[addr];
+    } else {
+        /* I3C device register */
+        switch (addr & 0xff) {
+        case R_DEVICE_ADDR_TABLE_POINTER:
+            val = DEVICE_ADDR_TABLE_DEPTH(0x8) | DEVICE_ADDR_TABLE_ADDR(0x280);
+            break;
+        case R_DEV_CHAR_TABLE_POINTER:
+            val = 0x00020200;
+            break;
+        case R_VENDOR_SPECIFIC_REG_POINTER:
+            val = 0x000000b0;
+            break;
+        default:
+            val = s->regs[addr];
+            break;
+        }
+    }
+
+    printf("I3C Read[%08lx] = [%08lx]\n", addr << 2, val);
+
+    return val;
+}
+
+static void aspeed_i3c_write(void *opaque,
+                             hwaddr addr,
+                             uint64_t data,
+                             unsigned int size)
+{
+    AspeedI3CState *s = ASPEED_I3C(opaque);
+
+    printf("I3C Write[%08lx] = [%08lx]\n", addr, data);
+
+    addr >>= 2;
+
+    if (addr >= ASPEED_I3C_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr << 2);
+        return;
+    }
+
+    if (addr < 0x800) {
+        /* I3C controller register */
+        switch (addr) {
+        case R_I3CG_REG1(0):
+        case R_I3CG_REG1(1):
+        case R_I3CG_REG1(2):
+        case R_I3CG_REG1(3):
+            if (data & I3CG_REG1_I2C_MODE) {
+                qemu_log_mask(LOG_UNIMP,
+                              "%s: Not support I2C mode [%08lx]=%08lx",
+                              __func__, addr << 2, data);
+                break;
+            }
+            if (data & I3CG_REG1_SA_EN) {
+                qemu_log_mask(LOG_UNIMP,
+                              "%s: Not support slave mode [%08lx]=%08lx",
+                              __func__, addr << 2, data);
+                break;
+            }
+            s->regs[addr] = data;
+            break;
+        default:
+            s->regs[addr] = data;
+            break;
+        }
+    } else {
+        /* I3C device register */
+        switch (addr & 0xff) {
+        case R_RESET_CTRL:
+            s->regs[addr] = 0x00000000;
+            break;
+        default:
+            s->regs[addr] = data;
+            break;
+        }
+    }
+}
+
+static const MemoryRegionOps aspeed_i3c_ops = {
+    .read = aspeed_i3c_read,
+    .write = aspeed_i3c_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    }
+};
+
+static void aspeed_i3c_reset(DeviceState *dev)
+{
+    struct AspeedI3CState *s = ASPEED_I3C(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+
+    /* Init I3C controller register */
+
+
+    /* Init I3C devices register */
+    for (int i = 0; i < 4; ++i) {
+        uint32_t dev_base = (0x2000 + i * 0x1000) >> 4;
+        s->regs[dev_base + R_HW_CAPABILITY] = 0x000e00bf;
+        s->regs[dev_base + R_QUEUE_THLD_CTRL] = 0x01000101;
+
+        s->regs[dev_base + R_I3C_VER_ID] = 0x3130302a;
+        s->regs[dev_base + R_I3C_VER_TYPE] = 0x6c633033;
+    }
+}
+
+static void aspeed_i3c_realize(DeviceState *dev, Error **errp)
+{
+    AspeedI3CState *s = ASPEED_I3C(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i3c_ops, s,
+            TYPE_ASPEED_I3C, 0x8000);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_aspeed_i3c = {
+    .name = TYPE_ASPEED_I3C,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedI3CState, ASPEED_I3C_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void aspeed_i3c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_i3c_realize;
+    dc->reset = aspeed_i3c_reset;
+    dc->desc = "Aspeed I3C Controller";
+    dc->vmsd = &vmstate_aspeed_i3c;
+}
+
+static const TypeInfo aspeed_i3c_info = {
+    .name = TYPE_ASPEED_I3C,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedI3CState),
+    .class_init = aspeed_i3c_class_init,
+};
+
+static void aspeed_i3c_register_types(void)
+{
+    type_register_static(&aspeed_i3c_info);
+}
+
+type_init(aspeed_i3c_register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 73a92fc459..9e570131c2 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -103,6 +103,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_hace.c',
+  'aspeed_i3c.c',
   'aspeed_lpc.c',
   'aspeed_pwm.c',
   'aspeed_scu.c',
diff --git a/include/hw/misc/aspeed_i3c.h b/include/hw/misc/aspeed_i3c.h
new file mode 100644
index 0000000000..c8f8ae3791
--- /dev/null
+++ b/include/hw/misc/aspeed_i3c.h
@@ -0,0 +1,30 @@
+/*
+ * ASPEED I3C Controller
+ *
+ * Copyright (C) 2021 ASPEED Technology Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef ASPEED_I3C_H
+#define ASPEED_I3C_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_I3C "aspeed.i3c"
+#define ASPEED_I3C(obj) OBJECT_CHECK(AspeedI3CState, (obj), TYPE_ASPEED_I3C)
+
+#define ASPEED_I3C_NR_REGS (0x8000 >> 2)
+
+typedef struct AspeedI3CState {
+    /* <private> */
+    SysBusDevice parent;
+
+    /* <public> */
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_I3C_NR_REGS];
+} AspeedI3CState;
+#endif /* ASPEED_I3C_H */
-- 
2.25.1

