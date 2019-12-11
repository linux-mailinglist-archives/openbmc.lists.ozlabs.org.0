Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1107311C0AB
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 00:39:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YD1D6fHczDqkw
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 10:39:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y6rD5qjbzDqfj
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 06:46:36 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 11:46:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="216033815"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com)
 ([10.7.153.143])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2019 11:46:32 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v11 03/14] peci: Add support for PECI bus driver core
Date: Wed, 11 Dec 2019 11:46:13 -0800
Message-Id: <20191211194624.2872-4-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
X-Mailman-Approved-At: Thu, 12 Dec 2019 10:31:04 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Gavin Schenk <g.schenk@eckelmann.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, linux-doc@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, openbmc@lists.ozlabs.org,
 Yunge Zhu <yunge.zhu@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>,
 Julia Cartwright <juliac@eso.teric.us>,
 Cyrille Pitchen <cyrille.pitchen@free-electrons.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Fengguang Wu <fengguang.wu@intel.com>, linux-arm-kernel@lists.infradead.org,
 Alan Cox <alan@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds driver implementation for PECI bus core into linux
driver framework.

PECI (Platform Environment Control Interface) is a one-wire bus interface
that provides a communication channel from Intel processors and chipset
components to external monitoring or control devices. PECI is designed to
support the following sideband functions:

* Processor and DRAM thermal management
  - Processor fan speed control is managed by comparing Digital Thermal
    Sensor (DTS) thermal readings acquired via PECI against the
    processor-specific fan speed control reference point, or TCONTROL. Both
    TCONTROL and DTS thermal readings are accessible via the processor PECI
    client. These variables are referenced to a common temperature, the TCC
    activation point, and are both defined as negative offsets from that
    reference.
  - PECI based access to the processor package configuration space provides
    a means for Baseboard Management Controllers (BMC) or other platform
    management devices to actively manage the processor and memory power
    and thermal features.

* Platform Manageability
  - Platform manageability functions including thermal, power, and error
    monitoring. Note that platform 'power' management includes monitoring
    and control for both the processor and DRAM subsystem to assist with
    data center power limiting.
  - PECI allows read access to certain error registers in the processor MSR
    space and status monitoring registers in the PCI configuration space
    within the processor and downstream devices.
  - PECI permits writes to certain registers in the processor PCI
    configuration space.

* Processor Interface Tuning and Diagnostics
  - Processor interface tuning and diagnostics capabilities
    (Intel Interconnect BIST). The processors Intel Interconnect Built In
    Self Test (Intel IBIST) allows for infield diagnostic capabilities in
    the Intel UPI and memory controller interfaces. PECI provides a port to
    execute these diagnostics via its PCI Configuration read and write
    capabilities.

* Failure Analysis
  - Output the state of the processor after a failure for analysis via
    Crashdump.

PECI uses a single wire for self-clocking and data transfer. The bus
requires no additional control lines. The physical layer is a self-clocked
one-wire bus that begins each bit with a driven, rising edge from an idle
level near zero volts. The duration of the signal driven high depends on
whether the bit value is a logic '0' or logic '1'. PECI also includes
variable data transfer rate established with every message. In this way, it
is highly flexible even though underlying logic is simple.

The interface design was optimized for interfacing between an Intel
processor and chipset components in both single processor and multiple
processor environments. The single wire interface provides low board
routing overhead for the multiple load connections in the congested routing
area near the processor and chipset components. Bus speed, error checking,
and low protocol overhead provides adequate link bandwidth and reliability
to transfer critical device operating conditions and configuration
information.

This implementation provides the basic framework to add PECI extensions to
the Linux bus and device models. A hardware specific 'Adapter' driver can
be attached to the PECI bus to provide sideband functions described above.
It is also possible to access all devices on an adapter from userspace
through the /dev interface. A device specific 'Client' driver also can be
attached to the PECI bus so each processor client's features can be
supported by the 'Client' driver through an adapter connection in the bus.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Gavin Schenk <g.schenk@eckelmann.de>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Sagar Dharia <sdharia@codeaurora.org>
Cc: David Kershner <david.kershner@unisys.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Cyrille Pitchen <cyrille.pitchen@free-electrons.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Alan Cox <alan@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Julia Cartwright <juliac@eso.teric.us>
Signed-off-by: Jason M Biils <jason.m.bills@linux.intel.com>
Signed-off-by: Yunge Zhu <yunge.zhu@linux.intel.com>
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Reviewed-by: James Feist <james.feist@linux.intel.com>
Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
---
Changes since v10:
- Split out peci-dev module from peci-core module.
- Added PECI 4.0 command set support.
- Refined 32-bit boundary alignment for all PECI ioctl command structs.
- Added DMA safe command buffer handling in peci-core.
- Refined kconfig dependencies in PECI subsystem.
- Fixed minor bugs and style issues.
- configfs support isn't added in this patch set. Will add that using a
  seperate patch set.

 drivers/Kconfig                 |    2 +
 drivers/Makefile                |    1 +
 drivers/peci/Kconfig            |   38 +
 drivers/peci/Makefile           |   11 +
 drivers/peci/busses/Kconfig     |    7 +
 drivers/peci/busses/Makefile    |    4 +
 drivers/peci/peci-core.c        | 2086 +++++++++++++++++++++++++++++++
 drivers/peci/peci-dev.c         |  348 ++++++
 include/linux/peci.h            |  150 +++
 include/uapi/linux/peci-ioctl.h |  660 ++++++++++
 10 files changed, 3307 insertions(+)
 create mode 100644 drivers/peci/Kconfig
 create mode 100644 drivers/peci/Makefile
 create mode 100644 drivers/peci/busses/Kconfig
 create mode 100644 drivers/peci/busses/Makefile
 create mode 100644 drivers/peci/peci-core.c
 create mode 100644 drivers/peci/peci-dev.c
 create mode 100644 include/linux/peci.h
 create mode 100644 include/uapi/linux/peci-ioctl.h

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 8befa53f43be..4322efa37732 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -228,4 +228,6 @@ source "drivers/interconnect/Kconfig"
 
 source "drivers/counter/Kconfig"
 
+source "drivers/peci/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index aaef17cc6512..82f78cfedf69 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -186,3 +186,4 @@ obj-$(CONFIG_SIOX)		+= siox/
 obj-$(CONFIG_GNSS)		+= gnss/
 obj-$(CONFIG_INTERCONNECT)	+= interconnect/
 obj-$(CONFIG_COUNTER)		+= counter/
+obj-$(CONFIG_PECI)		+= peci/
diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
new file mode 100644
index 000000000000..9752feee2454
--- /dev/null
+++ b/drivers/peci/Kconfig
@@ -0,0 +1,38 @@
+#
+# Platform Environment Control Interface (PECI) subsystem configuration
+#
+
+menu "PECI support"
+
+config PECI
+	tristate "PECI support"
+	select CRC8
+	default n
+	help
+	  The Platform Environment Control Interface (PECI) is a one-wire bus
+	  interface that provides a communication channel from Intel processors
+	  and chipset components to external monitoring or control devices.
+
+	  If you want PECI support, you should say Y here and also to the
+	  specific driver for your bus adapter(s) below.
+
+	  This support is also available as a module. If so, the module
+	  will be called peci-core.
+
+if PECI
+
+config PECI_CHARDEV
+	tristate "PECI device interface"
+	help
+	  Say Y here to use peci-* device files, usually found in the /dev
+	  directory on your system. They make it possible to have user-space
+	  programs use the PECI bus.
+
+	  This support is also available as a module. If so, the module
+	  will be called peci-dev.
+
+source "drivers/peci/busses/Kconfig"
+
+endif # PECI
+
+endmenu
diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
new file mode 100644
index 000000000000..da8b0a33fa42
--- /dev/null
+++ b/drivers/peci/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the PECI core drivers.
+#
+
+# Core functionality
+obj-$(CONFIG_PECI)		+= peci-core.o
+obj-$(CONFIG_PECI_CHARDEV)	+= peci-dev.o
+
+# Hardware specific bus drivers
+obj-y				+= busses/
diff --git a/drivers/peci/busses/Kconfig b/drivers/peci/busses/Kconfig
new file mode 100644
index 000000000000..d7e064f52a1c
--- /dev/null
+++ b/drivers/peci/busses/Kconfig
@@ -0,0 +1,7 @@
+#
+# PECI hardware bus configuration
+#
+
+menu "PECI Hardware Bus support"
+
+endmenu
diff --git a/drivers/peci/busses/Makefile b/drivers/peci/busses/Makefile
new file mode 100644
index 000000000000..9e9334fee297
--- /dev/null
+++ b/drivers/peci/busses/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the PECI hardware bus drivers.
+#
diff --git a/drivers/peci/peci-core.c b/drivers/peci/peci-core.c
new file mode 100644
index 000000000000..db34cf7edf63
--- /dev/null
+++ b/drivers/peci/peci-core.c
@@ -0,0 +1,2086 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018-2019 Intel Corporation
+
+#include <linux/bitfield.h>
+#include <linux/crc8.h>
+#include <linux/delay.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/peci.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/sched/task_stack.h>
+#include <linux/slab.h>
+
+/* Mask for getting minor revision number from DIB */
+#define REVISION_NUM_MASK  GENMASK(15, 8)
+
+/* CRC8 table for Assured Write Frame Check */
+#define PECI_CRC8_POLYNOMIAL  0x07
+DECLARE_CRC8_TABLE(peci_crc8_table);
+
+static bool is_registered;
+
+static DEFINE_MUTEX(core_lock);
+static DEFINE_IDR(peci_adapter_idr);
+
+struct peci_adapter *peci_get_adapter(int nr)
+{
+	struct peci_adapter *adapter;
+
+	mutex_lock(&core_lock);
+	adapter = idr_find(&peci_adapter_idr, nr);
+	if (!adapter)
+		goto out_unlock;
+
+	if (try_module_get(adapter->owner))
+		get_device(&adapter->dev);
+	else
+		adapter = NULL;
+
+out_unlock:
+	mutex_unlock(&core_lock);
+
+	return adapter;
+}
+EXPORT_SYMBOL_GPL(peci_get_adapter);
+
+void peci_put_adapter(struct peci_adapter *adapter)
+{
+	if (!adapter)
+		return;
+
+	put_device(&adapter->dev);
+	module_put(adapter->owner);
+}
+EXPORT_SYMBOL_GPL(peci_put_adapter);
+
+static ssize_t name_show(struct device *dev,
+			 struct device_attribute *attr,
+			 char *buf)
+{
+	return sprintf(buf, "%s\n", dev->type == &peci_client_type ?
+		       to_peci_client(dev)->name : to_peci_adapter(dev)->name);
+}
+static DEVICE_ATTR_RO(name);
+
+static void peci_client_dev_release(struct device *dev)
+{
+	struct peci_client *client = to_peci_client(dev);
+
+	dev_dbg(dev, "%s: %s\n", __func__, client->name);
+	peci_put_adapter(client->adapter);
+	kfree(client);
+}
+
+static struct attribute *peci_device_attrs[] = {
+	&dev_attr_name.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(peci_device);
+
+struct device_type peci_client_type = {
+	.groups		= peci_device_groups,
+	.release	= peci_client_dev_release,
+};
+EXPORT_SYMBOL_GPL(peci_client_type);
+
+/**
+ * peci_verify_client - return parameter as peci_client, or NULL
+ * @dev: device, probably from some driver model iterator
+ *
+ * Return: pointer to peci_client on success, else NULL.
+ */
+struct peci_client *peci_verify_client(struct device *dev)
+{
+	return (dev->type == &peci_client_type)
+			? to_peci_client(dev)
+			: NULL;
+}
+EXPORT_SYMBOL_GPL(peci_verify_client);
+
+/**
+ * peci_get_xfer_msg() - get a DMA safe peci_xfer_msg for the given tx and rx
+ *			 length
+ * @tx_len: the length of tx_buf. May be 0 if tx_buf isn't needed.
+ * @rx_len: the length of rx_buf. May be 0 if rx_buf isn't needed.
+ *
+ * Return: NULL if a DMA safe buffer was not obtained.
+ *	   Or a valid pointer to be used with DMA. After use, release it by
+ *	   calling peci_put_xfer_msg().
+ *
+ * This function must only be called from process context!
+ */
+struct peci_xfer_msg *peci_get_xfer_msg(u8 tx_len, u8 rx_len)
+{
+	struct peci_xfer_msg *msg;
+	u8 *tx_buf, *rx_buf;
+
+	if (tx_len) {
+		tx_buf = kzalloc(tx_len, GFP_KERNEL);
+		if (!tx_buf)
+			return NULL;
+	} else {
+		tx_buf = NULL;
+	}
+
+	if (rx_len) {
+		rx_buf = kzalloc(rx_len, GFP_KERNEL);
+		if (!rx_buf)
+			goto err_free_tx_buf;
+	} else {
+		rx_buf = NULL;
+	}
+
+	msg = kzalloc(sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		goto err_free_tx_rx_buf;
+
+	msg->tx_len = tx_len;
+	msg->tx_buf = tx_buf;
+	msg->rx_len = rx_len;
+	msg->rx_buf = rx_buf;
+
+	return msg;
+
+err_free_tx_rx_buf:
+	kfree(rx_buf);
+err_free_tx_buf:
+	kfree(tx_buf);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(peci_get_xfer_msg);
+
+/**
+ * peci_put_xfer_msg - release a DMA safe peci_xfer_msg
+ * @msg: the message obtained from peci_get_xfer_msg(). May be NULL.
+ */
+void peci_put_xfer_msg(struct peci_xfer_msg *msg)
+{
+	if (!msg)
+		return;
+
+	kfree(msg->rx_buf);
+	kfree(msg->tx_buf);
+	kfree(msg);
+}
+EXPORT_SYMBOL_GPL(peci_put_xfer_msg);
+
+/* Calculate an Assured Write Frame Check Sequence byte */
+static int peci_aw_fcs(struct peci_xfer_msg *msg, int len, u8 *aw_fcs)
+{
+	u8 *tmp_buf;
+
+	/* Allocate a temporary buffer to use a contiguous byte array */
+	tmp_buf = kmalloc(len, GFP_KERNEL);
+	if (!tmp_buf)
+		return -ENOMEM;
+
+	tmp_buf[0] = msg->addr;
+	tmp_buf[1] = msg->tx_len;
+	tmp_buf[2] = msg->rx_len;
+	memcpy(&tmp_buf[3], msg->tx_buf, len - 3);
+
+	*aw_fcs = crc8(peci_crc8_table, tmp_buf, (size_t)len, 0);
+
+	kfree(tmp_buf);
+
+	return 0;
+}
+
+static int __peci_xfer(struct peci_adapter *adapter, struct peci_xfer_msg *msg,
+		       bool do_retry, bool has_aw_fcs)
+{
+	ulong timeout = jiffies;
+	u8 aw_fcs;
+	int ret;
+
+	/*
+	 * In case if adapter uses DMA, check at here whether tx and rx buffers
+	 * are DMA capable or not.
+	 */
+	if (IS_ENABLED(CONFIG_HAS_DMA) && adapter->use_dma) {
+		if (is_vmalloc_addr(msg->tx_buf) ||
+		    is_vmalloc_addr(msg->rx_buf)) {
+			WARN_ONCE(1, "xfer msg is not dma capable\n");
+			return -EAGAIN;
+		} else if (object_is_on_stack(msg->tx_buf) ||
+			   object_is_on_stack(msg->rx_buf)) {
+			WARN_ONCE(1, "xfer msg is on stack\n");
+			return -EAGAIN;
+		}
+	}
+
+	/*
+	 * For some commands, the PECI originator may need to retry a command if
+	 * the processor PECI client responds with a 0x8x completion code. In
+	 * each instance, the processor PECI client may have started the
+	 * operation but not completed it yet. When the 'retry' bit is set, the
+	 * PECI client will ignore a new request if it exactly matches a
+	 * previous valid request.
+	 */
+
+	if (do_retry)
+		timeout += msecs_to_jiffies(PECI_DEV_RETRY_TIME_MS);
+
+	for (;;) {
+		ret = adapter->xfer(adapter, msg);
+
+		if (!do_retry || ret || !msg->rx_buf)
+			break;
+
+		/* Retry is needed when completion code is 0x8x */
+		if ((msg->rx_buf[0] & PECI_DEV_CC_RETRY_CHECK_MASK) !=
+		    PECI_DEV_CC_NEED_RETRY)
+			break;
+
+		/* Set the retry bit to indicate a retry attempt */
+		msg->tx_buf[1] |= PECI_DEV_RETRY_BIT;
+
+		/* Recalculate the AW FCS if it has one */
+		if (has_aw_fcs) {
+			ret = peci_aw_fcs(msg, 2 + msg->tx_len, &aw_fcs);
+			if (ret)
+				break;
+
+			msg->tx_buf[msg->tx_len - 1] = 0x80 ^ aw_fcs;
+		}
+
+		/*
+		 * Retry for at least 250ms before returning an error.
+		 * Retry interval guideline:
+		 *   No minimum < Retry Interval < No maximum
+		 *                (recommend 10ms)
+		 */
+		if (time_after(jiffies, timeout)) {
+			dev_dbg(&adapter->dev, "Timeout retrying xfer!\n");
+			ret = -ETIMEDOUT;
+			break;
+		}
+
+		usleep_range((PECI_DEV_RETRY_INTERVAL_USEC >> 2) + 1,
+			     PECI_DEV_RETRY_INTERVAL_USEC);
+	}
+
+	if (ret)
+		dev_dbg(&adapter->dev, "xfer error: %d\n", ret);
+
+	return ret;
+}
+
+static int peci_xfer(struct peci_adapter *adapter, struct peci_xfer_msg *msg)
+{
+	return __peci_xfer(adapter, msg, false, false);
+}
+
+static int peci_xfer_with_retries(struct peci_adapter *adapter,
+				  struct peci_xfer_msg *msg,
+				  bool has_aw_fcs)
+{
+	return __peci_xfer(adapter, msg, true, has_aw_fcs);
+}
+
+static int peci_scan_cmd_mask(struct peci_adapter *adapter)
+{
+	struct peci_xfer_msg *msg;
+	u8 revision;
+	int ret;
+	u64 dib;
+
+	/* Update command mask just once */
+	if (adapter->cmd_mask & BIT(PECI_CMD_XFER))
+		return 0;
+
+	msg = peci_get_xfer_msg(PECI_GET_DIB_WR_LEN, PECI_GET_DIB_RD_LEN);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->addr      = PECI_BASE_ADDR;
+	msg->tx_buf[0] = PECI_GET_DIB_CMD;
+
+	ret = peci_xfer(adapter, msg);
+	if (ret)
+		return ret;
+
+	dib = le64_to_cpup((__le64 *)msg->rx_buf);
+
+	/* Check special case for Get DIB command */
+	if (dib == 0) {
+		dev_dbg(&adapter->dev, "DIB read as 0\n");
+		ret = -EIO;
+		goto out;
+	}
+
+	/*
+	 * Setting up the supporting commands based on revision number.
+	 * See PECI Spec Table 3-1.
+	 */
+	revision = FIELD_GET(REVISION_NUM_MASK, dib);
+	if (revision >= 0x40) { /* Rev. 4.0 */
+		adapter->cmd_mask |= BIT(PECI_CMD_RD_IA_MSREX);
+		adapter->cmd_mask |= BIT(PECI_CMD_RD_END_PT_CFG);
+		adapter->cmd_mask |= BIT(PECI_CMD_WR_END_PT_CFG);
+		adapter->cmd_mask |= BIT(PECI_CMD_CRASHDUMP_DISC);
+		adapter->cmd_mask |= BIT(PECI_CMD_CRASHDUMP_GET_FRAME);
+	}
+	if (revision >= 0x36) /* Rev. 3.6 */
+		adapter->cmd_mask |= BIT(PECI_CMD_WR_IA_MSR);
+	if (revision >= 0x35) /* Rev. 3.5 */
+		adapter->cmd_mask |= BIT(PECI_CMD_WR_PCI_CFG);
+	if (revision >= 0x34) /* Rev. 3.4 */
+		adapter->cmd_mask |= BIT(PECI_CMD_RD_PCI_CFG);
+	if (revision >= 0x33) { /* Rev. 3.3 */
+		adapter->cmd_mask |= BIT(PECI_CMD_RD_PCI_CFG_LOCAL);
+		adapter->cmd_mask |= BIT(PECI_CMD_WR_PCI_CFG_LOCAL);
+	}
+	if (revision >= 0x32) /* Rev. 3.2 */
+		adapter->cmd_mask |= BIT(PECI_CMD_RD_IA_MSR);
+	if (revision >= 0x31) { /* Rev. 3.1 */
+		adapter->cmd_mask |= BIT(PECI_CMD_RD_PKG_CFG);
+		adapter->cmd_mask |= BIT(PECI_CMD_WR_PKG_CFG);
+	}
+
+	adapter->cmd_mask |= BIT(PECI_CMD_XFER);
+	adapter->cmd_mask |= BIT(PECI_CMD_GET_TEMP);
+	adapter->cmd_mask |= BIT(PECI_CMD_GET_DIB);
+	adapter->cmd_mask |= BIT(PECI_CMD_PING);
+
+out:
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_check_cmd_support(struct peci_adapter *adapter,
+				  enum peci_cmd cmd)
+{
+	if (!(adapter->cmd_mask & BIT(PECI_CMD_PING)) &&
+	    peci_scan_cmd_mask(adapter) < 0) {
+		dev_dbg(&adapter->dev, "Failed to scan command mask\n");
+		return -EIO;
+	}
+
+	if (!(adapter->cmd_mask & BIT(cmd))) {
+		dev_dbg(&adapter->dev, "Command %d is not supported\n", cmd);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int peci_cmd_xfer(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_xfer_msg *msg = vmsg;
+	u8 aw_fcs;
+	int ret;
+
+	if (!msg->tx_len) {
+		ret = peci_xfer(adapter, msg);
+	} else {
+		switch (msg->tx_buf[0]) {
+		case PECI_RDPKGCFG_CMD:
+		case PECI_RDIAMSR_CMD:
+		case PECI_RDIAMSREX_CMD:
+		case PECI_RDPCICFG_CMD:
+		case PECI_RDPCICFGLOCAL_CMD:
+		case PECI_RDENDPTCFG_CMD:
+		case PECI_CRASHDUMP_CMD:
+			ret = peci_xfer_with_retries(adapter, msg, false);
+			break;
+		case PECI_WRPKGCFG_CMD:
+		case PECI_WRIAMSR_CMD:
+		case PECI_WRPCICFG_CMD:
+		case PECI_WRPCICFGLOCAL_CMD:
+		case PECI_WRENDPTCFG_CMD:
+			/* Check if the AW FCS byte is already provided */
+			ret = peci_aw_fcs(msg, 2 + msg->tx_len, &aw_fcs);
+			if (ret)
+				break;
+
+			if (msg->tx_buf[msg->tx_len - 1] != (0x80 ^ aw_fcs)) {
+				/*
+				 * Add an Assured Write Frame Check Sequence
+				 * byte and increment the tx_len to include
+				 * the new byte.
+				 */
+				msg->tx_len++;
+				ret = peci_aw_fcs(msg, 2 + msg->tx_len,
+						  &aw_fcs);
+				if (ret)
+					break;
+
+				msg->tx_buf[msg->tx_len - 1] = 0x80 ^ aw_fcs;
+			}
+
+			ret = peci_xfer_with_retries(adapter, msg, true);
+			break;
+		case PECI_GET_DIB_CMD:
+		case PECI_GET_TEMP_CMD:
+		default:
+			ret = peci_xfer(adapter, msg);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static int peci_cmd_ping(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_ping_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	int ret;
+
+	msg = peci_get_xfer_msg(0, 0);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->addr   = umsg->addr;
+
+	ret = peci_xfer(adapter, msg);
+
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_get_dib(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_get_dib_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	int ret;
+
+	msg = peci_get_xfer_msg(PECI_GET_DIB_WR_LEN, PECI_GET_DIB_RD_LEN);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->addr      = umsg->addr;
+	msg->tx_buf[0] = PECI_GET_DIB_CMD;
+
+	ret = peci_xfer(adapter, msg);
+	if (ret)
+		goto out;
+
+	umsg->dib = le64_to_cpup((__le64 *)msg->rx_buf);
+
+out:
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_get_temp(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_get_temp_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	int ret;
+
+	msg = peci_get_xfer_msg(PECI_GET_TEMP_WR_LEN, PECI_GET_TEMP_RD_LEN);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->addr      = umsg->addr;
+	msg->tx_buf[0] = PECI_GET_TEMP_CMD;
+
+	ret = peci_xfer(adapter, msg);
+	if (ret)
+		goto out;
+
+	umsg->temp_raw = le16_to_cpup((__le16 *)msg->rx_buf);
+
+out:
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_rd_pkg_cfg(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_rd_pkg_cfg_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	int ret;
+
+	/* Per the PECI spec, the read length must be a byte, word, or dword */
+	if (umsg->rx_len != 1 && umsg->rx_len != 2 && umsg->rx_len != 4) {
+		dev_dbg(&adapter->dev, "Invalid read length, rx_len: %d\n",
+			umsg->rx_len);
+		return -EINVAL;
+	}
+
+	msg = peci_get_xfer_msg(PECI_RDPKGCFG_WRITE_LEN,
+				PECI_RDPKGCFG_READ_LEN_BASE + umsg->rx_len);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->addr = umsg->addr;
+	msg->tx_buf[0] = PECI_RDPKGCFG_CMD;
+	msg->tx_buf[1] = 0;         /* request byte for Host ID | Retry bit */
+				    /* Host ID is 0 for PECI 3.0 */
+	msg->tx_buf[2] = umsg->index;            /* RdPkgConfig index */
+	msg->tx_buf[3] = (u8)umsg->param;        /* LSB - Config parameter */
+	msg->tx_buf[4] = (u8)(umsg->param >> 8); /* MSB - Config parameter */
+
+	ret = peci_xfer_with_retries(adapter, msg, false);
+	if (!ret)
+		memcpy(umsg->pkg_config, &msg->rx_buf[1], umsg->rx_len);
+
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_wr_pkg_cfg(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_wr_pkg_cfg_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	int ret, i;
+	u8 aw_fcs;
+
+	/* Per the PECI spec, the write length must be a dword */
+	if (umsg->tx_len != 4) {
+		dev_dbg(&adapter->dev, "Invalid write length, tx_len: %d\n",
+			umsg->tx_len);
+		return -EINVAL;
+	}
+
+	msg = peci_get_xfer_msg(PECI_WRPKGCFG_WRITE_LEN_BASE + umsg->tx_len,
+				PECI_WRPKGCFG_READ_LEN);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->addr = umsg->addr;
+	msg->tx_buf[0] = PECI_WRPKGCFG_CMD;
+	msg->tx_buf[1] = 0;         /* request byte for Host ID | Retry bit */
+				   /* Host ID is 0 for PECI 3.0 */
+	msg->tx_buf[2] = umsg->index;            /* RdPkgConfig index */
+	msg->tx_buf[3] = (u8)umsg->param;        /* LSB - Config parameter */
+	msg->tx_buf[4] = (u8)(umsg->param >> 8); /* MSB - Config parameter */
+	for (i = 0; i < umsg->tx_len; i++)
+		msg->tx_buf[5 + i] = (u8)(umsg->value >> (i << 3));
+
+	/* Add an Assured Write Frame Check Sequence byte */
+	ret = peci_aw_fcs(msg, 8 + umsg->tx_len, &aw_fcs);
+	if (ret)
+		goto out;
+
+	msg->tx_buf[5 + i] = 0x80 ^ aw_fcs;
+
+	ret = peci_xfer_with_retries(adapter, msg, true);
+
+out:
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_rd_ia_msr(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_rd_ia_msr_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	int ret;
+
+	msg = peci_get_xfer_msg(PECI_RDIAMSR_WRITE_LEN, PECI_RDIAMSR_READ_LEN);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->addr = umsg->addr;
+	msg->tx_buf[0] = PECI_RDIAMSR_CMD;
+	msg->tx_buf[1] = 0;
+	msg->tx_buf[2] = umsg->thread_id;
+	msg->tx_buf[3] = (u8)umsg->address;
+	msg->tx_buf[4] = (u8)(umsg->address >> 8);
+
+	ret = peci_xfer_with_retries(adapter, msg, false);
+	if (!ret)
+		memcpy(&umsg->value, &msg->rx_buf[1], sizeof(uint64_t));
+
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_rd_ia_msrex(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_rd_ia_msrex_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	int ret;
+
+	msg = peci_get_xfer_msg(PECI_RDIAMSREX_WRITE_LEN,
+				PECI_RDIAMSREX_READ_LEN);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->addr = umsg->addr;
+	msg->tx_buf[0] = PECI_RDIAMSREX_CMD;
+	msg->tx_buf[1] = 0;
+	msg->tx_buf[2] = (u8)umsg->thread_id;
+	msg->tx_buf[3] = (u8)(umsg->thread_id >> 8);
+	msg->tx_buf[4] = (u8)umsg->address;
+	msg->tx_buf[5] = (u8)(umsg->address >> 8);
+
+	ret = peci_xfer_with_retries(adapter, msg, false);
+	if (!ret)
+		memcpy(&umsg->value, &msg->rx_buf[1], sizeof(uint64_t));
+
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_wr_ia_msr(struct peci_adapter *adapter, void *vmsg)
+{
+	return -ENOSYS; /* Not implemented yet */
+}
+
+static int peci_cmd_rd_pci_cfg(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_rd_pci_cfg_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	u32 address;
+	int ret;
+
+	msg = peci_get_xfer_msg(PECI_RDPCICFG_WRITE_LEN,
+				PECI_RDPCICFG_READ_LEN);
+	if (!msg)
+		return -ENOMEM;
+
+	address = umsg->reg;                  /* [11:0]  - Register */
+	address |= (u32)umsg->function << 12; /* [14:12] - Function */
+	address |= (u32)umsg->device << 15;   /* [19:15] - Device   */
+	address |= (u32)umsg->bus << 20;      /* [27:20] - Bus      */
+					      /* [31:28] - Reserved */
+	msg->addr = umsg->addr;
+	msg->tx_buf[0] = PECI_RDPCICFG_CMD;
+	msg->tx_buf[1] = 0;         /* request byte for Host ID | Retry bit */
+				   /* Host ID is 0 for PECI 3.0 */
+	msg->tx_buf[2] = (u8)address;         /* LSB - PCI Config Address */
+	msg->tx_buf[3] = (u8)(address >> 8);  /* PCI Config Address */
+	msg->tx_buf[4] = (u8)(address >> 16); /* PCI Config Address */
+	msg->tx_buf[5] = (u8)(address >> 24); /* MSB - PCI Config Address */
+
+	ret = peci_xfer_with_retries(adapter, msg, false);
+	if (!ret)
+		memcpy(umsg->pci_config, &msg->rx_buf[1], 4);
+
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_wr_pci_cfg(struct peci_adapter *adapter, void *vmsg)
+{
+	return -ENOSYS; /* Not implemented yet */
+}
+
+static int peci_cmd_rd_pci_cfg_local(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_rd_pci_cfg_local_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	u32 address;
+	int ret;
+
+	/* Per the PECI spec, the read length must be a byte, word, or dword */
+	if (umsg->rx_len != 1 && umsg->rx_len != 2 && umsg->rx_len != 4) {
+		dev_dbg(&adapter->dev, "Invalid read length, rx_len: %d\n",
+			umsg->rx_len);
+		return -EINVAL;
+	}
+
+	msg = peci_get_xfer_msg(PECI_RDPCICFGLOCAL_WRITE_LEN,
+				PECI_RDPCICFGLOCAL_READ_LEN_BASE +
+				umsg->rx_len);
+	if (!msg)
+		return -ENOMEM;
+
+	address = umsg->reg;                  /* [11:0]  - Register */
+	address |= (u32)umsg->function << 12; /* [14:12] - Function */
+	address |= (u32)umsg->device << 15;   /* [19:15] - Device   */
+	address |= (u32)umsg->bus << 20;      /* [23:20] - Bus      */
+
+	msg->addr = umsg->addr;
+	msg->tx_buf[0] = PECI_RDPCICFGLOCAL_CMD;
+	msg->tx_buf[1] = 0;         /* request byte for Host ID | Retry bit */
+				    /* Host ID is 0 for PECI 3.0 */
+	msg->tx_buf[2] = (u8)address;      /* LSB - PCI Configuration Address */
+	msg->tx_buf[3] = (u8)(address >> 8);  /* PCI Configuration Address */
+	msg->tx_buf[4] = (u8)(address >> 16); /* PCI Configuration Address */
+
+	ret = peci_xfer_with_retries(adapter, msg, false);
+	if (!ret)
+		memcpy(umsg->pci_config, &msg->rx_buf[1], umsg->rx_len);
+
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_wr_pci_cfg_local(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_wr_pci_cfg_local_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	u32 address;
+	int ret, i;
+	u8 aw_fcs;
+
+	/* Per the PECI spec, the write length must be a byte, word, or dword */
+	if (umsg->tx_len != 1 && umsg->tx_len != 2 && umsg->tx_len != 4) {
+		dev_dbg(&adapter->dev, "Invalid write length, tx_len: %d\n",
+			umsg->tx_len);
+		return -EINVAL;
+	}
+
+	msg = peci_get_xfer_msg(PECI_WRPCICFGLOCAL_WRITE_LEN_BASE +
+				umsg->tx_len, PECI_WRPCICFGLOCAL_READ_LEN);
+	if (!msg)
+		return -ENOMEM;
+
+	address = umsg->reg;                  /* [11:0]  - Register */
+	address |= (u32)umsg->function << 12; /* [14:12] - Function */
+	address |= (u32)umsg->device << 15;   /* [19:15] - Device   */
+	address |= (u32)umsg->bus << 20;      /* [23:20] - Bus      */
+
+	msg->addr = umsg->addr;
+	msg->tx_buf[0] = PECI_WRPCICFGLOCAL_CMD;
+	msg->tx_buf[1] = 0;         /* request byte for Host ID | Retry bit */
+				    /* Host ID is 0 for PECI 3.0 */
+	msg->tx_buf[2] = (u8)address;      /* LSB - PCI Configuration Address */
+	msg->tx_buf[3] = (u8)(address >> 8);  /* PCI Configuration Address */
+	msg->tx_buf[4] = (u8)(address >> 16); /* PCI Configuration Address */
+	for (i = 0; i < umsg->tx_len; i++)
+		msg->tx_buf[5 + i] = (u8)(umsg->value >> (i << 3));
+
+	/* Add an Assured Write Frame Check Sequence byte */
+	ret = peci_aw_fcs(msg, 8 + umsg->tx_len, &aw_fcs);
+	if (ret)
+		goto out;
+
+	msg->tx_buf[5 + i] = 0x80 ^ aw_fcs;
+
+	ret = peci_xfer_with_retries(adapter, msg, true);
+
+out:
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_rd_end_pt_cfg(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_rd_end_pt_cfg_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg = NULL;
+	u32 address;
+	u8 tx_size;
+	int ret;
+
+	switch (umsg->msg_type) {
+	case PECI_ENDPTCFG_TYPE_LOCAL_PCI:
+	case PECI_ENDPTCFG_TYPE_PCI:
+		/*
+		 * Per the PECI spec, the read length must be a byte, word,
+		 * or dword
+		 */
+		if (umsg->rx_len != 1 && umsg->rx_len != 2 &&
+		    umsg->rx_len != 4) {
+			dev_dbg(&adapter->dev,
+				"Invalid read length, rx_len: %d\n",
+				umsg->rx_len);
+			return -EINVAL;
+		}
+
+		msg = peci_get_xfer_msg(PECI_RDENDPTCFG_PCI_WRITE_LEN,
+					PECI_RDENDPTCFG_READ_LEN_BASE +
+					umsg->rx_len);
+		if (!msg)
+			return -ENOMEM;
+
+		address = umsg->params.pci_cfg.reg; /* [11:0] - Register */
+		address |= (u32)umsg->params.pci_cfg.function
+			   << 12; /* [14:12] - Function */
+		address |= (u32)umsg->params.pci_cfg.device
+			   << 15; /* [19:15] - Device   */
+		address |= (u32)umsg->params.pci_cfg.bus
+			   << 20; /* [27:20] - Bus      */
+				  /* [31:28] - Reserved */
+		msg->addr = umsg->addr;
+		msg->tx_buf[0] = PECI_RDENDPTCFG_CMD;
+		msg->tx_buf[1] = 0x00; /* request byte for Host ID|Retry bit */
+		msg->tx_buf[2] = umsg->msg_type;	   /* Message Type */
+		msg->tx_buf[3] = 0x00;			   /* Endpoint ID */
+		msg->tx_buf[4] = 0x00;			   /* Reserved */
+		msg->tx_buf[5] = 0x00;			   /* Reserved */
+		msg->tx_buf[6] = PECI_ENDPTCFG_ADDR_TYPE_PCI; /* Addr Type */
+		msg->tx_buf[7] = umsg->params.pci_cfg.seg; /* PCI Segment */
+		msg->tx_buf[8] = (u8)address; /* LSB - PCI Config Address */
+		msg->tx_buf[9] = (u8)(address >> 8);   /* PCI Config Address */
+		msg->tx_buf[10] = (u8)(address >> 16); /* PCI Config Address */
+		msg->tx_buf[11] =
+			(u8)(address >> 24); /* MSB - PCI Config Address */
+		break;
+
+	case PECI_ENDPTCFG_TYPE_MMIO:
+		/*
+		 * Per the PECI spec, the read length must be a byte, word,
+		 * dword, or qword
+		 */
+		if (umsg->rx_len != 1 && umsg->rx_len != 2 &&
+		    umsg->rx_len != 4 && umsg->rx_len != 8) {
+			dev_dbg(&adapter->dev,
+				"Invalid read length, rx_len: %d\n",
+				umsg->rx_len);
+			return -EINVAL;
+		}
+		/*
+		 * Per the PECI spec, the address type must specify either DWORD
+		 * or QWORD
+		 */
+		if (umsg->params.mmio.addr_type !=
+		    PECI_ENDPTCFG_ADDR_TYPE_MMIO_D &&
+		    umsg->params.mmio.addr_type !=
+		    PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q) {
+			dev_dbg(&adapter->dev,
+				"Invalid address type, addr_type: %d\n",
+				umsg->params.mmio.addr_type);
+			return -EINVAL;
+		}
+
+		if (umsg->params.mmio.addr_type ==
+			PECI_ENDPTCFG_ADDR_TYPE_MMIO_D)
+			tx_size = PECI_RDENDPTCFG_MMIO_D_WRITE_LEN;
+		else
+			tx_size = PECI_RDENDPTCFG_MMIO_Q_WRITE_LEN;
+		msg = peci_get_xfer_msg(tx_size,
+					PECI_RDENDPTCFG_READ_LEN_BASE +
+					umsg->rx_len);
+		if (!msg)
+			return -ENOMEM;
+
+		address = umsg->params.mmio.function; /* [2:0] - Function */
+		address |= (u32)umsg->params.mmio.device
+			   << 3; /* [7:3] - Device */
+
+		msg->addr = umsg->addr;
+		msg->tx_buf[0] = PECI_RDENDPTCFG_CMD;
+		msg->tx_buf[1] = 0x00; /* request byte for Host ID|Retry bit */
+		msg->tx_buf[2] = umsg->msg_type;	      /* Message Type */
+		msg->tx_buf[3] = 0x00;			      /* Endpoint ID */
+		msg->tx_buf[4] = 0x00;			      /* Reserved */
+		msg->tx_buf[5] = umsg->params.mmio.bar;       /* BAR # */
+		msg->tx_buf[6] = umsg->params.mmio.addr_type; /* Address Type */
+		msg->tx_buf[7] = umsg->params.mmio.seg;       /* PCI Segment */
+		msg->tx_buf[8] = (u8)address;	   /* Function/Device */
+		msg->tx_buf[9] = umsg->params.mmio.bus; /* PCI Bus */
+		msg->tx_buf[10] = (u8)umsg->params.mmio
+					 .offset; /* LSB - Register Offset */
+		msg->tx_buf[11] = (u8)(umsg->params.mmio.offset
+				       >> 8); /* Register Offset */
+		msg->tx_buf[12] = (u8)(umsg->params.mmio.offset
+				       >> 16); /* Register Offset */
+		msg->tx_buf[13] = (u8)(umsg->params.mmio.offset
+				       >> 24); /* MSB - DWORD Register Offset */
+		if (umsg->params.mmio.addr_type ==
+		    PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q) {
+			msg->tx_buf[14] = (u8)(umsg->params.mmio.offset
+					       >> 32); /* Register Offset */
+			msg->tx_buf[15] = (u8)(umsg->params.mmio.offset
+					       >> 40); /* Register Offset */
+			msg->tx_buf[16] = (u8)(umsg->params.mmio.offset
+					       >> 48); /* Register Offset */
+			msg->tx_buf[17] =
+				(u8)(umsg->params.mmio.offset
+				     >> 56); /* MSB - QWORD Register Offset */
+		}
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	ret = peci_xfer_with_retries(adapter, msg, false);
+	if (!ret)
+		memcpy(umsg->data, &msg->rx_buf[1], umsg->rx_len);
+
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_wr_end_pt_cfg(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_wr_end_pt_cfg_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg = NULL;
+	u8 tx_size, aw_fcs;
+	int ret, i, idx;
+	u32 address;
+
+	switch (umsg->msg_type) {
+	case PECI_ENDPTCFG_TYPE_LOCAL_PCI:
+	case PECI_ENDPTCFG_TYPE_PCI:
+		/*
+		 * Per the PECI spec, the write length must be a byte, word,
+		 * or dword
+		 */
+		if (umsg->tx_len != 1 && umsg->tx_len != 2 &&
+		    umsg->tx_len != 4) {
+			dev_dbg(&adapter->dev,
+				"Invalid write length, tx_len: %d\n",
+				umsg->tx_len);
+			return -EINVAL;
+		}
+
+		msg = peci_get_xfer_msg(PECI_WRENDPTCFG_PCI_WRITE_LEN_BASE +
+					umsg->tx_len, PECI_WRENDPTCFG_READ_LEN);
+		if (!msg)
+			return -ENOMEM;
+
+		address = umsg->params.pci_cfg.reg; /* [11:0] - Register */
+		address |= (u32)umsg->params.pci_cfg.function
+			   << 12; /* [14:12] - Function */
+		address |= (u32)umsg->params.pci_cfg.device
+			   << 15; /* [19:15] - Device   */
+		address |= (u32)umsg->params.pci_cfg.bus
+			   << 20; /* [27:20] - Bus      */
+				  /* [31:28] - Reserved */
+		msg->addr = umsg->addr;
+		msg->tx_buf[0] = PECI_WRENDPTCFG_CMD;
+		msg->tx_buf[1] = 0x00; /* request byte for Host ID|Retry bit */
+		msg->tx_buf[2] = umsg->msg_type;	   /* Message Type */
+		msg->tx_buf[3] = 0x00;			   /* Endpoint ID */
+		msg->tx_buf[4] = 0x00;			   /* Reserved */
+		msg->tx_buf[5] = 0x00;			   /* Reserved */
+		msg->tx_buf[6] = PECI_ENDPTCFG_ADDR_TYPE_PCI; /* Addr Type */
+		msg->tx_buf[7] = umsg->params.pci_cfg.seg; /* PCI Segment */
+		msg->tx_buf[8] = (u8)address; /* LSB - PCI Config Address */
+		msg->tx_buf[9] = (u8)(address >> 8);   /* PCI Config Address */
+		msg->tx_buf[10] = (u8)(address >> 16); /* PCI Config Address */
+		msg->tx_buf[11] =
+			(u8)(address >> 24); /* MSB - PCI Config Address */
+		for (i = 0; i < umsg->tx_len; i++)
+			msg->tx_buf[12 + i] = (u8)(umsg->value >> (i << 3));
+
+		/* Add an Assured Write Frame Check Sequence byte */
+		ret = peci_aw_fcs(msg, 15 + umsg->tx_len, &aw_fcs);
+		if (ret)
+			goto out;
+
+		msg->tx_buf[12 + i] = 0x80 ^ aw_fcs;
+		break;
+
+	case PECI_ENDPTCFG_TYPE_MMIO:
+		/*
+		 * Per the PECI spec, the write length must be a byte, word,
+		 * dword, or qword
+		 */
+		if (umsg->tx_len != 1 && umsg->tx_len != 2 &&
+		    umsg->tx_len != 4 && umsg->tx_len != 8) {
+			dev_dbg(&adapter->dev,
+				"Invalid write length, tx_len: %d\n",
+				umsg->tx_len);
+			return -EINVAL;
+		}
+		/*
+		 * Per the PECI spec, the address type must specify either DWORD
+		 * or QWORD
+		 */
+		if (umsg->params.mmio.addr_type !=
+		    PECI_ENDPTCFG_ADDR_TYPE_MMIO_D &&
+		    umsg->params.mmio.addr_type !=
+		    PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q) {
+			dev_dbg(&adapter->dev,
+				"Invalid address type, addr_type: %d\n",
+				umsg->params.mmio.addr_type);
+			return -EINVAL;
+		}
+
+		if (umsg->params.mmio.addr_type ==
+			PECI_ENDPTCFG_ADDR_TYPE_MMIO_D)
+			tx_size = PECI_WRENDPTCFG_MMIO_D_WRITE_LEN_BASE +
+				  umsg->tx_len;
+		else
+			tx_size = PECI_WRENDPTCFG_MMIO_Q_WRITE_LEN_BASE +
+				  umsg->tx_len;
+		msg = peci_get_xfer_msg(tx_size, PECI_WRENDPTCFG_READ_LEN);
+		if (!msg)
+			return -ENOMEM;
+
+		address = umsg->params.mmio.function; /* [2:0] - Function */
+		address |= (u32)umsg->params.mmio.device
+			   << 3; /* [7:3] - Device */
+
+		msg->addr = umsg->addr;
+		msg->tx_buf[0] = PECI_WRENDPTCFG_CMD;
+		msg->tx_buf[1] = 0x00; /* request byte for Host ID|Retry bit */
+		msg->tx_buf[2] = umsg->msg_type;	      /* Message Type */
+		msg->tx_buf[3] = 0x00;			      /* Endpoint ID */
+		msg->tx_buf[4] = 0x00;			      /* Reserved */
+		msg->tx_buf[5] = umsg->params.mmio.bar;       /* BAR # */
+		msg->tx_buf[6] = umsg->params.mmio.addr_type; /* Address Type */
+		msg->tx_buf[7] = umsg->params.mmio.seg;       /* PCI Segment */
+		msg->tx_buf[8] = (u8)address;	   /* Function/Device */
+		msg->tx_buf[9] = umsg->params.mmio.bus; /* PCI Bus */
+		msg->tx_buf[10] = (u8)umsg->params.mmio
+					 .offset; /* LSB - Register Offset */
+		msg->tx_buf[11] = (u8)(umsg->params.mmio.offset
+				       >> 8); /* Register Offset */
+		msg->tx_buf[12] = (u8)(umsg->params.mmio.offset
+				       >> 16); /* Register Offset */
+		msg->tx_buf[13] = (u8)(umsg->params.mmio.offset
+				       >> 24); /* MSB - DWORD Register Offset */
+		if (umsg->params.mmio.addr_type ==
+		    PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q) {
+			msg->tx_len = PECI_WRENDPTCFG_MMIO_Q_WRITE_LEN_BASE;
+			msg->tx_buf[14] = (u8)(umsg->params.mmio.offset
+					       >> 32); /* Register Offset */
+			msg->tx_buf[15] = (u8)(umsg->params.mmio.offset
+					       >> 40); /* Register Offset */
+			msg->tx_buf[16] = (u8)(umsg->params.mmio.offset
+					       >> 48); /* Register Offset */
+			msg->tx_buf[17] =
+				(u8)(umsg->params.mmio.offset
+				     >> 56); /* MSB - QWORD Register Offset */
+			idx = 18;
+		} else {
+			idx = 14;
+		}
+		for (i = 0; i < umsg->tx_len; i++)
+			msg->tx_buf[idx + i] = (u8)(umsg->value >> (i << 3));
+
+		/* Add an Assured Write Frame Check Sequence byte */
+		ret = peci_aw_fcs(msg, idx + 3 + umsg->tx_len, &aw_fcs);
+		if (ret)
+			goto out;
+
+		msg->tx_buf[idx + i] = 0x80 ^ aw_fcs;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	ret = peci_xfer_with_retries(adapter, msg, false);
+
+out:
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_crashdump_disc(struct peci_adapter *adapter, void *vmsg)
+{
+	struct peci_crashdump_disc_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	int ret;
+
+	/* Per the EDS, the read length must be a byte, word, or qword */
+	if (umsg->rx_len != 1 && umsg->rx_len != 2 && umsg->rx_len != 8) {
+		dev_dbg(&adapter->dev, "Invalid read length, rx_len: %d\n",
+			umsg->rx_len);
+		return -EINVAL;
+	}
+
+	msg = peci_get_xfer_msg(PECI_CRASHDUMP_DISC_WRITE_LEN,
+				PECI_CRASHDUMP_DISC_READ_LEN_BASE +
+				umsg->rx_len);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->addr = umsg->addr;
+	msg->tx_buf[0] = PECI_CRASHDUMP_CMD;
+	msg->tx_buf[1] = 0x00;        /* request byte for Host ID | Retry bit */
+				      /* Host ID is 0 for PECI 3.0 */
+	msg->tx_buf[2] = PECI_CRASHDUMP_DISC_VERSION;
+	msg->tx_buf[3] = PECI_CRASHDUMP_DISC_OPCODE;
+	msg->tx_buf[4] = umsg->subopcode;
+	msg->tx_buf[5] = umsg->param0;
+	msg->tx_buf[6] = (u8)umsg->param1;
+	msg->tx_buf[7] = (u8)(umsg->param1 >> 8);
+	msg->tx_buf[8] = umsg->param2;
+
+	ret = peci_xfer_with_retries(adapter, msg, false);
+	if (!ret)
+		memcpy(umsg->data, &msg->rx_buf[1], umsg->rx_len);
+
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+static int peci_cmd_crashdump_get_frame(struct peci_adapter *adapter,
+					void *vmsg)
+{
+	struct peci_crashdump_get_frame_msg *umsg = vmsg;
+	struct peci_xfer_msg *msg;
+	int ret;
+
+	/* Per the EDS, the read length must be a qword or dqword */
+	if (umsg->rx_len != 8 && umsg->rx_len != 16) {
+		dev_dbg(&adapter->dev, "Invalid read length, rx_len: %d\n",
+			umsg->rx_len);
+		return -EINVAL;
+	}
+
+	msg = peci_get_xfer_msg(PECI_CRASHDUMP_GET_FRAME_WRITE_LEN,
+				PECI_CRASHDUMP_GET_FRAME_READ_LEN_BASE +
+				umsg->rx_len);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->addr = umsg->addr;
+	msg->tx_buf[0] = PECI_CRASHDUMP_CMD;
+	msg->tx_buf[1] = 0x00;        /* request byte for Host ID | Retry bit */
+				      /* Host ID is 0 for PECI 3.0 */
+	msg->tx_buf[2] = PECI_CRASHDUMP_GET_FRAME_VERSION;
+	msg->tx_buf[3] = PECI_CRASHDUMP_GET_FRAME_OPCODE;
+	msg->tx_buf[4] = (u8)umsg->param0;
+	msg->tx_buf[5] = (u8)(umsg->param0 >> 8);
+	msg->tx_buf[6] = (u8)umsg->param1;
+	msg->tx_buf[7] = (u8)(umsg->param1 >> 8);
+	msg->tx_buf[8] = (u8)umsg->param2;
+	msg->tx_buf[9] = (u8)(umsg->param2 >> 8);
+
+	ret = peci_xfer_with_retries(adapter, msg, false);
+	if (!ret)
+		memcpy(umsg->data, &msg->rx_buf[1], umsg->rx_len);
+
+	umsg->cc = msg->rx_buf[0];
+	peci_put_xfer_msg(msg);
+
+	return ret;
+}
+
+typedef int (*peci_cmd_fn_type)(struct peci_adapter *, void *);
+
+static const peci_cmd_fn_type peci_cmd_fn[PECI_CMD_MAX] = {
+	peci_cmd_xfer,
+	peci_cmd_ping,
+	peci_cmd_get_dib,
+	peci_cmd_get_temp,
+	peci_cmd_rd_pkg_cfg,
+	peci_cmd_wr_pkg_cfg,
+	peci_cmd_rd_ia_msr,
+	peci_cmd_wr_ia_msr,
+	peci_cmd_rd_ia_msrex,
+	peci_cmd_rd_pci_cfg,
+	peci_cmd_wr_pci_cfg,
+	peci_cmd_rd_pci_cfg_local,
+	peci_cmd_wr_pci_cfg_local,
+	peci_cmd_rd_end_pt_cfg,
+	peci_cmd_wr_end_pt_cfg,
+	peci_cmd_crashdump_disc,
+	peci_cmd_crashdump_get_frame,
+};
+
+/**
+ * peci_command - transfer function of a PECI command
+ * @adapter: pointer to peci_adapter
+ * @vmsg: pointer to PECI messages
+ * Context: can sleep
+ *
+ * This performs a transfer of a PECI command using PECI messages parameter
+ * which has various formats on each command.
+ *
+ * Return: zero on success, else a negative error code.
+ */
+int peci_command(struct peci_adapter *adapter, enum peci_cmd cmd, void *vmsg)
+{
+	int ret;
+
+	if (cmd >= PECI_CMD_MAX || cmd < PECI_CMD_XFER)
+		return -ENOTTY;
+
+	dev_dbg(&adapter->dev, "%s, cmd=0x%02x\n", __func__, cmd);
+
+	if (!peci_cmd_fn[cmd])
+		return -EINVAL;
+
+	mutex_lock(&adapter->bus_lock);
+
+	ret = peci_check_cmd_support(adapter, cmd);
+	if (!ret)
+		ret = peci_cmd_fn[cmd](adapter, vmsg);
+
+	mutex_unlock(&adapter->bus_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(peci_command);
+
+static int peci_detect(struct peci_adapter *adapter, u8 addr)
+{
+	struct peci_ping_msg msg;
+
+	msg.addr = addr;
+
+	return peci_command(adapter, PECI_CMD_PING, &msg);
+}
+
+static const struct of_device_id *
+peci_of_match_device(const struct of_device_id *matches,
+		     struct peci_client *client)
+{
+#if IS_ENABLED(CONFIG_OF)
+	if (!(client && matches))
+		return NULL;
+
+	return of_match_device(matches, &client->dev);
+#else /* CONFIG_OF */
+	return NULL;
+#endif /* CONFIG_OF */
+}
+
+static const struct peci_device_id *
+peci_match_id(const struct peci_device_id *id, struct peci_client *client)
+{
+	if (!(id && client))
+		return NULL;
+
+	while (id->name[0]) {
+		if (!strncmp(client->name, id->name, PECI_NAME_SIZE))
+			return id;
+		id++;
+	}
+
+	return NULL;
+}
+
+static int peci_device_match(struct device *dev, struct device_driver *drv)
+{
+	struct peci_client *client = peci_verify_client(dev);
+	struct peci_driver *driver;
+
+	/* Attempt an OF style match */
+	if (peci_of_match_device(drv->of_match_table, client))
+		return 1;
+
+	driver = to_peci_driver(drv);
+
+	/* Finally an ID match */
+	if (peci_match_id(driver->id_table, client))
+		return 1;
+
+	return 0;
+}
+
+static int peci_device_probe(struct device *dev)
+{
+	struct peci_client *client = peci_verify_client(dev);
+	struct peci_driver *driver;
+	int status = -EINVAL;
+
+	if (!client)
+		return 0;
+
+	driver = to_peci_driver(dev->driver);
+
+	if (!driver->id_table &&
+	    !peci_of_match_device(dev->driver->of_match_table, client))
+		return -ENODEV;
+
+	dev_dbg(dev, "%s: name:%s\n", __func__, client->name);
+
+	status = dev_pm_domain_attach(&client->dev, true);
+	if (status == -EPROBE_DEFER)
+		return status;
+
+	if (driver->probe)
+		status = driver->probe(client);
+	else
+		status = -EINVAL;
+
+	if (status)
+		goto err_detach_pm_domain;
+
+	return 0;
+
+err_detach_pm_domain:
+	dev_pm_domain_detach(&client->dev, true);
+
+	return status;
+}
+
+static int peci_device_remove(struct device *dev)
+{
+	struct peci_client *client = peci_verify_client(dev);
+	struct peci_driver *driver;
+	int status = 0;
+
+	if (!client || !dev->driver)
+		return 0;
+
+	driver = to_peci_driver(dev->driver);
+	if (driver->remove) {
+		dev_dbg(dev, "%s: name:%s\n", __func__, client->name);
+		status = driver->remove(client);
+	}
+
+	dev_pm_domain_detach(&client->dev, true);
+
+	return status;
+}
+
+static void peci_device_shutdown(struct device *dev)
+{
+	struct peci_client *client = peci_verify_client(dev);
+	struct peci_driver *driver;
+
+	if (!client || !dev->driver)
+		return;
+
+	dev_dbg(dev, "%s: name:%s\n", __func__, client->name);
+
+	driver = to_peci_driver(dev->driver);
+	if (driver->shutdown)
+		driver->shutdown(client);
+}
+
+struct bus_type peci_bus_type = {
+	.name		= "peci",
+	.match		= peci_device_match,
+	.probe		= peci_device_probe,
+	.remove		= peci_device_remove,
+	.shutdown	= peci_device_shutdown,
+};
+EXPORT_SYMBOL_GPL(peci_bus_type);
+
+static int peci_check_addr_validity(u8 addr)
+{
+	if (addr < PECI_BASE_ADDR && addr > PECI_BASE_ADDR + PECI_OFFSET_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int peci_check_client_busy(struct device *dev, void *client_new_p)
+{
+	struct peci_client *client = peci_verify_client(dev);
+	struct peci_client *client_new = client_new_p;
+
+	if (client && client->addr == client_new->addr)
+		return -EBUSY;
+
+	return 0;
+}
+
+/**
+ * peci_get_cpu_id - read CPU ID from the Package Configuration Space of CPU
+ * @adapter: pointer to peci_adapter
+ * @addr: address of the PECI client CPU
+ * @cpu_id: where the CPU ID will be stored
+ * Context: can sleep
+ *
+ * Return: zero on success, else a negative error code.
+ */
+int peci_get_cpu_id(struct peci_adapter *adapter, u8 addr, u32 *cpu_id)
+{
+	struct peci_rd_pkg_cfg_msg msg;
+	int ret;
+
+	msg.addr = addr;
+	msg.index = PECI_MBX_INDEX_CPU_ID;
+	msg.param = PECI_PKG_ID_CPU_ID;
+	msg.rx_len = 4;
+
+	ret = peci_command(adapter, PECI_CMD_RD_PKG_CFG, &msg);
+	if (msg.cc != PECI_DEV_CC_SUCCESS)
+		ret = -EAGAIN;
+	if (ret)
+		return ret;
+
+	*cpu_id = le32_to_cpup((__le32 *)msg.pkg_config);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(peci_get_cpu_id);
+
+static struct peci_client *peci_new_device(struct peci_adapter *adapter,
+					   struct peci_board_info const *info)
+{
+	struct peci_client *client;
+	int ret;
+
+	/* Increase reference count for the adapter assigned */
+	if (!peci_get_adapter(adapter->nr))
+		return NULL;
+
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
+	if (!client)
+		goto err_put_adapter;
+
+	client->adapter = adapter;
+	client->addr = info->addr;
+	strlcpy(client->name, info->type, sizeof(client->name));
+
+	ret = peci_check_addr_validity(client->addr);
+	if (ret) {
+		dev_err(&adapter->dev, "Invalid PECI CPU address 0x%02hx\n",
+			client->addr);
+		goto err_free_client_silent;
+	}
+
+	/* Check online status of client */
+	ret = peci_detect(adapter, client->addr);
+	if (ret)
+		goto err_free_client;
+
+	ret = device_for_each_child(&adapter->dev, client,
+				    peci_check_client_busy);
+	if (ret)
+		goto err_free_client;
+
+	client->dev.parent = &client->adapter->dev;
+	client->dev.bus = &peci_bus_type;
+	client->dev.type = &peci_client_type;
+	client->dev.of_node = of_node_get(info->of_node);
+	dev_set_name(&client->dev, "%d-%02x", adapter->nr, client->addr);
+
+	ret = device_register(&client->dev);
+	if (ret)
+		goto err_put_of_node;
+
+	dev_dbg(&adapter->dev, "client [%s] registered with bus id %s\n",
+		client->name, dev_name(&client->dev));
+
+	return client;
+
+err_put_of_node:
+	of_node_put(info->of_node);
+err_free_client:
+	dev_err(&adapter->dev,
+		"Failed to register peci client %s at 0x%02x (%d)\n",
+		client->name, client->addr, ret);
+err_free_client_silent:
+	kfree(client);
+err_put_adapter:
+	peci_put_adapter(adapter);
+
+	return NULL;
+}
+
+static void peci_unregister_device(struct peci_client *client)
+{
+	if (!client)
+		return;
+
+	if (client->dev.of_node) {
+		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
+		of_node_put(client->dev.of_node);
+	}
+
+	device_unregister(&client->dev);
+}
+
+static int peci_unregister_client(struct device *dev, void *dummy)
+{
+	struct peci_client *client = peci_verify_client(dev);
+
+	peci_unregister_device(client);
+
+	return 0;
+}
+
+static void peci_adapter_dev_release(struct device *dev)
+{
+	struct peci_adapter *adapter = to_peci_adapter(dev);
+
+	dev_dbg(dev, "%s: %s\n", __func__, adapter->name);
+	mutex_destroy(&adapter->userspace_clients_lock);
+	mutex_destroy(&adapter->bus_lock);
+	kfree(adapter);
+}
+
+static ssize_t peci_sysfs_new_device(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct peci_adapter *adapter = to_peci_adapter(dev);
+	struct peci_board_info info = {};
+	struct peci_client *client;
+	char *blank, end;
+	short addr;
+	int ret;
+
+	/* Parse device type */
+	blank = strchr(buf, ' ');
+	if (!blank) {
+		dev_err(dev, "%s: Missing parameters\n", "new_device");
+		return -EINVAL;
+	}
+	if (blank - buf > PECI_NAME_SIZE - 1) {
+		dev_err(dev, "%s: Invalid device type\n", "new_device");
+		return -EINVAL;
+	}
+	memcpy(info.type, buf, blank - buf);
+
+	/* Parse remaining parameters, reject extra parameters */
+	ret = sscanf(++blank, "%hi%c", &addr, &end);
+	if (ret < 1) {
+		dev_err(dev, "%s: Can't parse client address\n", "new_device");
+		return -EINVAL;
+	}
+	if (ret > 1 && end != '\n') {
+		dev_err(dev, "%s: Extra parameters\n", "new_device");
+		return -EINVAL;
+	}
+
+	info.addr = (u8)addr;
+	client = peci_new_device(adapter, &info);
+	if (!client)
+		return -EINVAL;
+
+	/* Keep track of the added device */
+	mutex_lock(&adapter->userspace_clients_lock);
+	list_add_tail(&client->detected, &adapter->userspace_clients);
+	mutex_unlock(&adapter->userspace_clients_lock);
+	dev_dbg(dev, "%s: Instantiated device %s at 0x%02hx\n", "new_device",
+		info.type, info.addr);
+
+	return count;
+}
+static DEVICE_ATTR(new_device, 0200, NULL, peci_sysfs_new_device);
+
+static ssize_t peci_sysfs_delete_device(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct peci_adapter *adapter = to_peci_adapter(dev);
+	struct peci_client *client, *next;
+	struct peci_board_info info = {};
+	char *blank, end;
+	short addr;
+	int ret;
+
+	/* Parse device type */
+	blank = strchr(buf, ' ');
+	if (!blank) {
+		dev_err(dev, "%s: Missing parameters\n", "delete_device");
+		return -EINVAL;
+	}
+	if (blank - buf > PECI_NAME_SIZE - 1) {
+		dev_err(dev, "%s: Invalid device type\n", "delete_device");
+		return -EINVAL;
+	}
+	memcpy(info.type, buf, blank - buf);
+
+	/* Parse remaining parameters, reject extra parameters */
+	ret = sscanf(++blank, "%hi%c", &addr, &end);
+	if (ret < 1) {
+		dev_err(dev, "%s: Can't parse client address\n",
+			"delete_device");
+		return -EINVAL;
+	}
+	if (ret > 1 && end != '\n') {
+		dev_err(dev, "%s: Extra parameters\n", "delete_device");
+		return -EINVAL;
+	}
+
+	info.addr = (u8)addr;
+
+	/* Make sure the device was added through sysfs */
+	ret = -ENOENT;
+	mutex_lock(&adapter->userspace_clients_lock);
+	list_for_each_entry_safe(client, next, &adapter->userspace_clients,
+				 detected) {
+		if (client->addr == info.addr &&
+		    !strncmp(client->name, info.type, PECI_NAME_SIZE)) {
+			dev_dbg(dev, "%s: Deleting device %s at 0x%02hx\n",
+				"delete_device", client->name, client->addr);
+			list_del(&client->detected);
+			peci_unregister_device(client);
+			ret = count;
+			break;
+		}
+	}
+	mutex_unlock(&adapter->userspace_clients_lock);
+
+	if (ret < 0)
+		dev_dbg(dev, "%s: Can't find device in list\n",
+			"delete_device");
+
+	return ret;
+}
+static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, 0200, NULL,
+				  peci_sysfs_delete_device);
+
+static struct attribute *peci_adapter_attrs[] = {
+	&dev_attr_name.attr,
+	&dev_attr_new_device.attr,
+	&dev_attr_delete_device.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(peci_adapter);
+
+struct device_type peci_adapter_type = {
+	.groups		= peci_adapter_groups,
+	.release	= peci_adapter_dev_release,
+};
+EXPORT_SYMBOL_GPL(peci_adapter_type);
+
+/**
+ * peci_verify_adapter - return parameter as peci_adapter, or NULL
+ * @dev: device, probably from some driver model iterator
+ *
+ * Return: pointer to peci_adapter on success, else NULL.
+ */
+struct peci_adapter *peci_verify_adapter(struct device *dev)
+{
+	return (dev->type == &peci_adapter_type)
+			? to_peci_adapter(dev)
+			: NULL;
+}
+EXPORT_SYMBOL_GPL(peci_verify_adapter);
+
+#if IS_ENABLED(CONFIG_OF)
+static struct peci_client *peci_of_register_device(struct peci_adapter *adapter,
+						   struct device_node *node)
+{
+	struct peci_board_info info = {};
+	struct peci_client *client;
+	u32 addr;
+	int ret;
+
+	dev_dbg(&adapter->dev, "register %pOF\n", node);
+
+	ret = of_property_read_u32(node, "reg", &addr);
+	if (ret) {
+		dev_err(&adapter->dev, "invalid reg on %pOF\n", node);
+		return ERR_PTR(ret);
+	}
+
+	info.addr = addr;
+	info.of_node = node;
+
+	client = peci_new_device(adapter, &info);
+	if (!client)
+		client = ERR_PTR(-EINVAL);
+
+	return client;
+}
+
+static void peci_of_register_devices(struct peci_adapter *adapter)
+{
+	struct device_node *bus, *node;
+	struct peci_client *client;
+
+	/* Only register child devices if the adapter has a node pointer set */
+	if (!adapter->dev.of_node)
+		return;
+
+	bus = of_get_child_by_name(adapter->dev.of_node, "peci-bus");
+	if (!bus)
+		bus = of_node_get(adapter->dev.of_node);
+
+	for_each_available_child_of_node(bus, node) {
+		if (of_node_test_and_set_flag(node, OF_POPULATED))
+			continue;
+
+		client = peci_of_register_device(adapter, node);
+		if (IS_ERR(client)) {
+			dev_warn(&adapter->dev,
+				 "Failed to create PECI device for %pOF\n",
+				 node);
+			of_node_clear_flag(node, OF_POPULATED);
+		}
+	}
+
+	of_node_put(bus);
+}
+#else /* CONFIG_OF */
+static void peci_of_register_devices(struct peci_adapter *adapter) { }
+#endif /* CONFIG_OF */
+
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+static int peci_of_match_node(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+/* must call put_device() when done with returned peci_client device */
+static struct peci_client *peci_of_find_device(struct device_node *node)
+{
+	struct peci_client *client;
+	struct device *dev;
+
+	dev = bus_find_device(&peci_bus_type, NULL, node, peci_of_match_node);
+	if (!dev)
+		return NULL;
+
+	client = peci_verify_client(dev);
+	if (!client)
+		put_device(dev);
+
+	return client;
+}
+
+/* must call put_device() when done with returned peci_adapter device */
+static struct peci_adapter *peci_of_find_adapter(struct device_node *node)
+{
+	struct peci_adapter *adapter;
+	struct device *dev;
+
+	dev = bus_find_device(&peci_bus_type, NULL, node, peci_of_match_node);
+	if (!dev)
+		return NULL;
+
+	adapter = peci_verify_adapter(dev);
+	if (!adapter)
+		put_device(dev);
+
+	return adapter;
+}
+
+static int peci_of_notify(struct notifier_block *nb, ulong action, void *arg)
+{
+	struct of_reconfig_data *rd = arg;
+	struct peci_adapter *adapter;
+	struct peci_client *client;
+
+	switch (of_reconfig_get_state_change(action, rd)) {
+	case OF_RECONFIG_CHANGE_ADD:
+		adapter = peci_of_find_adapter(rd->dn->parent);
+		if (!adapter)
+			return NOTIFY_OK;	/* not for us */
+
+		if (of_node_test_and_set_flag(rd->dn, OF_POPULATED)) {
+			put_device(&adapter->dev);
+			return NOTIFY_OK;
+		}
+
+		client = peci_of_register_device(adapter, rd->dn);
+		put_device(&adapter->dev);
+
+		if (IS_ERR(client)) {
+			dev_err(&adapter->dev,
+				"failed to create client for '%pOF'\n", rd->dn);
+			of_node_clear_flag(rd->dn, OF_POPULATED);
+			return notifier_from_errno(PTR_ERR(client));
+		}
+		break;
+	case OF_RECONFIG_CHANGE_REMOVE:
+		/* already depopulated? */
+		if (!of_node_check_flag(rd->dn, OF_POPULATED))
+			return NOTIFY_OK;
+
+		/* find our device by node */
+		client = peci_of_find_device(rd->dn);
+		if (!client)
+			return NOTIFY_OK;	/* no? not meant for us */
+
+		/* unregister takes one ref away */
+		peci_unregister_device(client);
+
+		/* and put the reference of the find */
+		put_device(&client->dev);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block peci_of_notifier = {
+	.notifier_call = peci_of_notify,
+};
+#else /* CONFIG_OF_DYNAMIC */
+extern struct notifier_block peci_of_notifier;
+#endif /* CONFIG_OF_DYNAMIC */
+
+/**
+ * peci_alloc_adapter - allocate a PECI adapter
+ * @dev: the adapter, possibly using the platform_bus
+ * @size: how much zeroed driver-private data to allocate; the pointer to this
+ *	memory is in the driver_data field of the returned device,
+ *	accessible with peci_get_adapdata().
+ * Context: can sleep
+ *
+ * This call is used only by PECI adapter drivers, which are the only ones
+ * directly touching chip registers.  It's how they allocate a peci_adapter
+ * structure, prior to calling peci_add_adapter().
+ *
+ * This must be called from context that can sleep.
+ *
+ * The caller is responsible for initializing the adapter's methods before
+ * calling peci_add_adapter(); and (after errors while adding the device)
+ * calling put_device() to prevent a memory leak.
+ *
+ * Return: the peci_adapter structure on success, else NULL.
+ */
+struct peci_adapter *peci_alloc_adapter(struct device *dev, uint size)
+{
+	struct peci_adapter *adapter;
+
+	if (!dev)
+		return NULL;
+
+	adapter = kzalloc(size + sizeof(*adapter), GFP_KERNEL);
+	if (!adapter)
+		return NULL;
+
+	device_initialize(&adapter->dev);
+	adapter->dev.parent = dev;
+	adapter->dev.bus = &peci_bus_type;
+	adapter->dev.type = &peci_adapter_type;
+	peci_set_adapdata(adapter, &adapter[1]);
+
+	return adapter;
+}
+EXPORT_SYMBOL_GPL(peci_alloc_adapter);
+
+static int peci_register_adapter(struct peci_adapter *adapter)
+{
+	int ret = -EINVAL;
+
+	/* Can't register until after driver model init */
+	if (WARN_ON(!is_registered))
+		goto err_free_idr;
+
+	if (WARN(!adapter->name[0], "peci adapter has no name"))
+		goto err_free_idr;
+
+	if (WARN(!adapter->xfer, "peci adapter has no xfer function\n"))
+		goto err_free_idr;
+
+	mutex_init(&adapter->bus_lock);
+	mutex_init(&adapter->userspace_clients_lock);
+	INIT_LIST_HEAD(&adapter->userspace_clients);
+
+	dev_set_name(&adapter->dev, "peci-%d", adapter->nr);
+
+	ret = device_add(&adapter->dev);
+	if (ret) {
+		pr_err("adapter '%s': can't add device (%d)\n",
+		       adapter->name, ret);
+		goto err_free_idr;
+	}
+
+	dev_dbg(&adapter->dev, "adapter [%s] registered\n", adapter->name);
+
+	pm_runtime_no_callbacks(&adapter->dev);
+	pm_suspend_ignore_children(&adapter->dev, true);
+	pm_runtime_enable(&adapter->dev);
+
+	/* create pre-declared device nodes */
+	peci_of_register_devices(adapter);
+
+	return 0;
+
+err_free_idr:
+	mutex_lock(&core_lock);
+	idr_remove(&peci_adapter_idr, adapter->nr);
+	mutex_unlock(&core_lock);
+	return ret;
+}
+
+static int peci_add_numbered_adapter(struct peci_adapter *adapter)
+{
+	int id;
+
+	mutex_lock(&core_lock);
+	id = idr_alloc(&peci_adapter_idr, adapter,
+		       adapter->nr, adapter->nr + 1, GFP_KERNEL);
+	mutex_unlock(&core_lock);
+	if (WARN(id < 0, "couldn't get idr"))
+		return id == -ENOSPC ? -EBUSY : id;
+
+	return peci_register_adapter(adapter);
+}
+
+/**
+ * peci_add_adapter - add a PECI adapter
+ * @adapter: initialized adapter, originally from peci_alloc_adapter()
+ * Context: can sleep
+ *
+ * PECI adapters connect to their drivers using some non-PECI bus,
+ * such as the platform bus.  The final stage of probe() in that code
+ * includes calling peci_add_adapter() to hook up to this PECI bus glue.
+ *
+ * This must be called from context that can sleep.
+ *
+ * It returns zero on success, else a negative error code (dropping the
+ * adapter's refcount).  After a successful return, the caller is responsible
+ * for calling peci_del_adapter().
+ *
+ * Return: zero on success, else a negative error code.
+ */
+int peci_add_adapter(struct peci_adapter *adapter)
+{
+	struct device *dev = &adapter->dev;
+	int id;
+
+	id = of_alias_get_id(dev->of_node, "peci");
+	if (id >= 0) {
+		adapter->nr = id;
+		return peci_add_numbered_adapter(adapter);
+	}
+
+	mutex_lock(&core_lock);
+	id = idr_alloc(&peci_adapter_idr, adapter, 0, 0, GFP_KERNEL);
+	mutex_unlock(&core_lock);
+	if (WARN(id < 0, "couldn't get idr"))
+		return id;
+
+	adapter->nr = id;
+
+	return peci_register_adapter(adapter);
+}
+EXPORT_SYMBOL_GPL(peci_add_adapter);
+
+/**
+ * peci_del_adapter - delete a PECI adapter
+ * @adapter: the adpater being deleted
+ * Context: can sleep
+ *
+ * This call is used only by PECI adpater drivers, which are the only ones
+ * directly touching chip registers.
+ *
+ * This must be called from context that can sleep.
+ *
+ * Note that this function also drops a reference to the adapter.
+ */
+void peci_del_adapter(struct peci_adapter *adapter)
+{
+	struct peci_client *client, *next;
+	struct peci_adapter *found;
+	int nr;
+
+	/* First make sure that this adapter was ever added */
+	mutex_lock(&core_lock);
+	found = idr_find(&peci_adapter_idr, adapter->nr);
+	mutex_unlock(&core_lock);
+
+	if (found != adapter)
+		return;
+
+	/* Remove devices instantiated from sysfs */
+	mutex_lock(&adapter->userspace_clients_lock);
+	list_for_each_entry_safe(client, next, &adapter->userspace_clients,
+				 detected) {
+		dev_dbg(&adapter->dev, "Removing %s at 0x%x\n", client->name,
+			client->addr);
+		list_del(&client->detected);
+		peci_unregister_device(client);
+	}
+	mutex_unlock(&adapter->userspace_clients_lock);
+
+	/*
+	 * Detach any active clients. This can't fail, thus we do not
+	 * check the returned value.
+	 */
+	device_for_each_child(&adapter->dev, NULL, peci_unregister_client);
+
+	/* device name is gone after device_unregister */
+	dev_dbg(&adapter->dev, "adapter [%s] unregistered\n", adapter->name);
+
+	pm_runtime_disable(&adapter->dev);
+	nr = adapter->nr;
+	device_unregister(&adapter->dev);
+
+	/* free bus id */
+	mutex_lock(&core_lock);
+	idr_remove(&peci_adapter_idr, nr);
+	mutex_unlock(&core_lock);
+}
+EXPORT_SYMBOL_GPL(peci_del_adapter);
+
+int peci_for_each_dev(void *data, int (*fn)(struct device *, void *))
+{
+	int ret;
+
+	mutex_lock(&core_lock);
+	ret = bus_for_each_dev(&peci_bus_type, NULL, data, fn);
+	mutex_unlock(&core_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(peci_for_each_dev);
+
+/**
+ * peci_register_driver - register a PECI driver
+ * @owner: owner module of the driver being registered
+ * @driver: the driver being registered
+ * Context: can sleep
+ *
+ * Return: zero on success, else a negative error code.
+ */
+int peci_register_driver(struct module *owner, struct peci_driver *driver)
+{
+	int ret;
+
+	/* Can't register until after driver model init */
+	if (WARN_ON(!is_registered))
+		return -EAGAIN;
+
+	/* add the driver to the list of peci drivers in the driver core */
+	driver->driver.owner = owner;
+	driver->driver.bus = &peci_bus_type;
+
+	/*
+	 * When registration returns, the driver core
+	 * will have called probe() for all matching-but-unbound devices.
+	 */
+	ret = driver_register(&driver->driver);
+	if (ret)
+		return ret;
+
+	pr_debug("driver [%s] registered\n", driver->driver.name);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(peci_register_driver);
+
+/**
+ * peci_del_driver - unregister a PECI driver
+ * @driver: the driver being unregistered
+ * Context: can sleep
+ */
+void peci_del_driver(struct peci_driver *driver)
+{
+	driver_unregister(&driver->driver);
+	pr_debug("driver [%s] unregistered\n", driver->driver.name);
+}
+EXPORT_SYMBOL_GPL(peci_del_driver);
+
+static int __init peci_init(void)
+{
+	int ret;
+
+	ret = bus_register(&peci_bus_type);
+	if (ret < 0) {
+		pr_err("peci: Failed to register PECI bus type!\n");
+		return ret;
+	}
+
+	crc8_populate_msb(peci_crc8_table, PECI_CRC8_POLYNOMIAL);
+
+	if (IS_ENABLED(CONFIG_OF_DYNAMIC))
+		WARN_ON(of_reconfig_notifier_register(&peci_of_notifier));
+
+	is_registered = true;
+
+	return 0;
+}
+
+static void __exit peci_exit(void)
+{
+	if (IS_ENABLED(CONFIG_OF_DYNAMIC))
+		WARN_ON(of_reconfig_notifier_unregister(&peci_of_notifier));
+
+	bus_unregister(&peci_bus_type);
+}
+
+subsys_initcall(peci_init);
+module_exit(peci_exit);
+
+MODULE_AUTHOR("Jason M Biils <jason.m.bills@linux.intel.com>");
+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
+MODULE_DESCRIPTION("PECI bus core module");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/peci/peci-dev.c b/drivers/peci/peci-dev.c
new file mode 100644
index 000000000000..f840cd1d4901
--- /dev/null
+++ b/drivers/peci/peci-dev.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018-2019 Intel Corporation
+
+#include <linux/cdev.h>
+#include <linux/fs.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/peci.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+/*
+ * A peci_dev represents an peci_adapter ... an PECI or SMBus master, not a
+ * slave (peci_client) with which messages will be exchanged.  It's coupled
+ * with a character special file which is accessed by user mode drivers.
+ *
+ * The list of peci_dev structures is parallel to the peci_adapter lists
+ * maintained by the driver model, and is updated using bus notifications.
+ */
+struct peci_dev {
+	struct list_head	list;
+	struct peci_adapter	*adapter;
+	struct device		*dev;
+	struct cdev		cdev;
+};
+
+#define PECI_MINORS  MINORMASK
+
+static dev_t peci_devt;
+static LIST_HEAD(peci_dev_list);
+static DEFINE_SPINLOCK(peci_dev_list_lock);
+
+static struct peci_dev *peci_dev_get_by_minor(uint index)
+{
+	struct peci_dev *peci_dev;
+
+	spin_lock(&peci_dev_list_lock);
+	list_for_each_entry(peci_dev, &peci_dev_list, list) {
+		if (peci_dev->adapter->nr == index)
+			goto found;
+	}
+	peci_dev = NULL;
+found:
+	spin_unlock(&peci_dev_list_lock);
+
+	return peci_dev;
+}
+
+static struct peci_dev *peci_dev_alloc(struct peci_adapter *adapter)
+{
+	struct peci_dev *peci_dev;
+
+	if (adapter->nr >= PECI_MINORS) {
+		dev_err(&adapter->dev, "Out of device minors (%d)\n",
+			adapter->nr);
+		return ERR_PTR(-ENODEV);
+	}
+
+	peci_dev = kzalloc(sizeof(*peci_dev), GFP_KERNEL);
+	if (!peci_dev)
+		return ERR_PTR(-ENOMEM);
+	peci_dev->adapter = adapter;
+
+	spin_lock(&peci_dev_list_lock);
+	list_add_tail(&peci_dev->list, &peci_dev_list);
+	spin_unlock(&peci_dev_list_lock);
+
+	return peci_dev;
+}
+
+static void peci_dev_put(struct peci_dev *peci_dev)
+{
+	spin_lock(&peci_dev_list_lock);
+	list_del(&peci_dev->list);
+	spin_unlock(&peci_dev_list_lock);
+	kfree(peci_dev);
+}
+
+static ssize_t name_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct peci_dev *peci_dev = peci_dev_get_by_minor(MINOR(dev->devt));
+
+	if (!peci_dev)
+		return -ENODEV;
+
+	return sprintf(buf, "%s\n", peci_dev->adapter->name);
+}
+static DEVICE_ATTR_RO(name);
+
+static struct attribute *peci_dev_attrs[] = {
+	&dev_attr_name.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(peci_dev);
+
+static long peci_dev_ioctl(struct file *file, uint iocmd, ulong arg)
+{
+	struct peci_dev *peci_dev = file->private_data;
+	void __user *umsg = (void __user *)arg;
+	struct peci_xfer_msg *xmsg = NULL;
+	struct peci_xfer_msg uxmsg;
+	enum peci_cmd cmd;
+	u8 *msg = NULL;
+	uint msg_len;
+	int ret;
+
+	cmd = _IOC_NR(iocmd);
+	msg_len = _IOC_SIZE(iocmd);
+
+	switch (cmd) {
+	case PECI_CMD_XFER:
+		if (msg_len != sizeof(struct peci_xfer_msg)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		if (copy_from_user(&uxmsg, umsg, msg_len)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		xmsg = peci_get_xfer_msg(uxmsg.tx_len, uxmsg.rx_len);
+		if (IS_ERR(xmsg)) {
+			ret = PTR_ERR(xmsg);
+			break;
+		}
+
+		if (uxmsg.tx_len &&
+		    copy_from_user(xmsg->tx_buf, (__u8 __user *)uxmsg.tx_buf,
+				   uxmsg.tx_len)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		xmsg->addr = uxmsg.addr;
+		xmsg->tx_len = uxmsg.tx_len;
+		xmsg->rx_len = uxmsg.rx_len;
+
+		ret = peci_command(peci_dev->adapter, cmd, xmsg);
+		if (!ret && xmsg->rx_len &&
+		    copy_to_user((__u8 __user *)uxmsg.rx_buf, xmsg->rx_buf,
+				 xmsg->rx_len))
+			ret = -EFAULT;
+
+		break;
+
+	default:
+		msg = memdup_user(umsg, msg_len);
+		if (IS_ERR(msg)) {
+			ret = PTR_ERR(msg);
+			break;
+		}
+
+		ret = peci_command(peci_dev->adapter, cmd, msg);
+		if ((!ret || ret == -ETIMEDOUT) &&
+		    copy_to_user(umsg, msg, msg_len))
+			ret = -EFAULT;
+
+		break;
+	}
+
+	peci_put_xfer_msg(xmsg);
+	kfree(msg);
+
+	return (long)ret;
+}
+
+static int peci_dev_open(struct inode *inode, struct file *file)
+{
+	struct peci_adapter *adapter;
+	struct peci_dev *peci_dev;
+
+	peci_dev = peci_dev_get_by_minor(iminor(inode));
+	if (!peci_dev)
+		return -ENODEV;
+
+	adapter = peci_get_adapter(peci_dev->adapter->nr);
+	if (!adapter)
+		return -ENODEV;
+
+	file->private_data = peci_dev;
+
+	return 0;
+}
+
+static int peci_dev_release(struct inode *inode, struct file *file)
+{
+	struct peci_dev *peci_dev = file->private_data;
+
+	peci_put_adapter(peci_dev->adapter);
+	file->private_data = NULL;
+
+	return 0;
+}
+
+static const struct file_operations peci_dev_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= peci_dev_ioctl,
+	.open		= peci_dev_open,
+	.release	= peci_dev_release,
+	.llseek		= no_llseek,
+};
+
+static struct class *peci_dev_class;
+
+static int peci_dev_attach_adapter(struct device *dev, void *dummy)
+{
+	struct peci_adapter *adapter;
+	struct peci_dev *peci_dev;
+	dev_t devt;
+	int ret;
+
+	if (dev->type != &peci_adapter_type)
+		return 0;
+
+	adapter = to_peci_adapter(dev);
+	peci_dev = peci_dev_alloc(adapter);
+	if (IS_ERR(peci_dev))
+		return PTR_ERR(peci_dev);
+
+	cdev_init(&peci_dev->cdev, &peci_dev_fops);
+	peci_dev->cdev.owner = THIS_MODULE;
+	devt = MKDEV(MAJOR(peci_devt), adapter->nr);
+
+	ret = cdev_add(&peci_dev->cdev, devt, 1);
+	if (ret)
+		goto err_put_dev;
+
+	/* register this peci device with the driver core */
+	peci_dev->dev = device_create(peci_dev_class, &adapter->dev, devt, NULL,
+				      "peci-%d", adapter->nr);
+	if (IS_ERR(peci_dev->dev)) {
+		ret = PTR_ERR(peci_dev->dev);
+		goto err_del_cdev;
+	}
+
+	dev_info(dev, "cdev of adapter [%s] registered as minor %d\n",
+		 adapter->name, adapter->nr);
+
+	return 0;
+
+err_del_cdev:
+	cdev_del(&peci_dev->cdev);
+err_put_dev:
+	peci_dev_put(peci_dev);
+
+	return ret;
+}
+
+static int peci_dev_detach_adapter(struct device *dev, void *dummy)
+{
+	struct peci_adapter *adapter;
+	struct peci_dev *peci_dev;
+	dev_t devt;
+
+	if (dev->type != &peci_adapter_type)
+		return 0;
+
+	adapter = to_peci_adapter(dev);
+	peci_dev = peci_dev_get_by_minor(adapter->nr);
+	if (!peci_dev)
+		return 0;
+
+	cdev_del(&peci_dev->cdev);
+	devt = peci_dev->dev->devt;
+	peci_dev_put(peci_dev);
+	device_destroy(peci_dev_class, devt);
+
+	dev_info(dev, "cdev of adapter [%s] unregistered\n", adapter->name);
+
+	return 0;
+}
+
+static int peci_dev_notifier_call(struct notifier_block *nb, ulong action,
+				  void *data)
+{
+	struct device *dev = data;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		return peci_dev_attach_adapter(dev, NULL);
+	case BUS_NOTIFY_DEL_DEVICE:
+		return peci_dev_detach_adapter(dev, NULL);
+	}
+
+	return 0;
+}
+
+static struct notifier_block peci_dev_notifier = {
+	.notifier_call = peci_dev_notifier_call,
+};
+
+static int __init peci_dev_init(void)
+{
+	int ret;
+
+	pr_debug("peci /dev entries driver\n");
+
+	ret = alloc_chrdev_region(&peci_devt, 0, PECI_MINORS, "peci");
+	if (ret < 0) {
+		pr_err("peci: Failed to allocate chr dev region!\n");
+		bus_unregister(&peci_bus_type);
+		goto err;
+	}
+
+	peci_dev_class = class_create(THIS_MODULE, KBUILD_MODNAME);
+	if (IS_ERR(peci_dev_class)) {
+		ret = PTR_ERR(peci_dev_class);
+		goto err_unreg_chrdev;
+	}
+	peci_dev_class->dev_groups = peci_dev_groups;
+
+	/* Keep track of adapters which will be added or removed later */
+	ret = bus_register_notifier(&peci_bus_type, &peci_dev_notifier);
+	if (ret)
+		goto err_destroy_class;
+
+	/* Bind to already existing adapters right away */
+	peci_for_each_dev(NULL, peci_dev_attach_adapter);
+
+	return 0;
+
+err_destroy_class:
+	class_destroy(peci_dev_class);
+err_unreg_chrdev:
+	unregister_chrdev_region(peci_devt, PECI_MINORS);
+err:
+	pr_err("%s: Driver Initialization failed\n", __FILE__);
+
+	return ret;
+}
+
+static void __exit peci_dev_exit(void)
+{
+	bus_unregister_notifier(&peci_bus_type, &peci_dev_notifier);
+	peci_for_each_dev(NULL, peci_dev_detach_adapter);
+	class_destroy(peci_dev_class);
+	unregister_chrdev_region(peci_devt, PECI_MINORS);
+}
+
+module_init(peci_dev_init);
+module_exit(peci_dev_exit);
+
+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
+MODULE_DESCRIPTION("PECI /dev entries driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/peci.h b/include/linux/peci.h
new file mode 100644
index 000000000000..4bc4595c797d
--- /dev/null
+++ b/include/linux/peci.h
@@ -0,0 +1,150 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2018-2019 Intel Corporation */
+
+#ifndef __LINUX_PECI_H
+#define __LINUX_PECI_H
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/peci-ioctl.h>
+
+#define PECI_NAME_SIZE   32
+
+struct peci_board_info {
+	char			type[PECI_NAME_SIZE];
+	u8			addr;	/* CPU client address */
+	struct device_node	*of_node;
+};
+
+/**
+ * struct peci_adapter - represent a PECI adapter
+ * @owner: owner module of the PECI adpater
+ * @bus_lock: mutex for exclusion of multiple callers
+ * @dev: device interface to this driver
+ * @nr: the bus number to map
+ * @name: name of the adapter
+ * @userspace_clients_lock: mutex for exclusion of clients handling
+ * @userspace_clients: list of registered clients
+ * @xfer: low-level transfer function pointer of the adapter
+ * @cmd_mask: mask for supportable PECI commands
+ * @use_dma: flag for indicating that adapter uses DMA
+ *
+ * Each PECI adapter can communicate with one or more PECI client children.
+ * These make a small bus, sharing a single wired PECI connection.
+ */
+struct peci_adapter {
+	struct module		*owner;
+	struct mutex		bus_lock; /* mutex for bus locking */
+	struct device		dev;
+	int			nr;
+	char			name[PECI_NAME_SIZE];
+	struct mutex		userspace_clients_lock; /* clients list mutex */
+	struct list_head	userspace_clients;
+	int			(*xfer)(struct peci_adapter *adapter,
+					struct peci_xfer_msg *msg);
+	u32			cmd_mask;
+	bool			use_dma;
+};
+
+static inline struct peci_adapter *to_peci_adapter(void *d)
+{
+	return container_of(d, struct peci_adapter, dev);
+}
+
+static inline void *peci_get_adapdata(const struct peci_adapter *adapter)
+{
+	return dev_get_drvdata(&adapter->dev);
+}
+
+static inline void peci_set_adapdata(struct peci_adapter *adapter, void *data)
+{
+	dev_set_drvdata(&adapter->dev, data);
+}
+
+/**
+ * struct peci_client - represent a PECI client device
+ * @dev: driver model device node for the client
+ * @adapter: manages the bus segment hosting this PECI device
+ * @addr: address used on the PECI bus connected to the parent adapter
+ * @name: indicates the type of the device
+ * @detected: detected PECI clients list
+ *
+ * A peci_client identifies a single device (i.e. CPU) connected to a peci bus.
+ * The behaviour exposed to Linux is defined by the driver managing the device.
+ */
+struct peci_client {
+	struct device		dev;
+	struct peci_adapter	*adapter;
+	u8			addr;
+	char			name[PECI_NAME_SIZE];
+	struct list_head	detected;
+};
+
+static inline struct peci_client *to_peci_client(void *d)
+{
+	return container_of(d, struct peci_client, dev);
+}
+
+struct peci_device_id {
+	char	name[PECI_NAME_SIZE];
+	ulong	driver_data;	/* Data private to the driver */
+};
+
+/**
+ * struct peci_driver - represent a PECI device driver
+ * @probe: callback for device binding
+ * @remove: callback for device unbinding
+ * @shutdown: callback for device shutdown
+ * @driver: device driver model driver
+ * @id_table: list of PECI devices supported by this driver
+ *
+ * The driver.owner field should be set to the module owner of this driver.
+ * The driver.name field should be set to the name of this driver.
+ */
+struct peci_driver {
+	int				(*probe)(struct peci_client *client);
+	int				(*remove)(struct peci_client *client);
+	void				(*shutdown)(struct peci_client *client);
+	struct device_driver		driver;
+	const struct peci_device_id	*id_table;
+};
+
+static inline struct peci_driver *to_peci_driver(void *d)
+{
+	return container_of(d, struct peci_driver, driver);
+}
+
+/**
+ * module_peci_driver - Helper macro for registering a modular PECI driver
+ * @__peci_driver: peci_driver struct
+ *
+ * Helper macro for PECI drivers which do not do anything special in module
+ * init/exit. This eliminates a lot of boilerplate. Each module may only
+ * use this macro once, and calling it replaces module_init() and module_exit()
+ */
+#define module_peci_driver(__peci_driver) \
+	module_driver(__peci_driver, peci_add_driver, peci_del_driver)
+
+/* use a define to avoid include chaining to get THIS_MODULE */
+#define peci_add_driver(driver) peci_register_driver(THIS_MODULE, driver)
+
+extern struct bus_type peci_bus_type;
+extern struct device_type peci_adapter_type;
+extern struct device_type peci_client_type;
+
+int  peci_register_driver(struct module *owner, struct peci_driver *drv);
+void peci_del_driver(struct peci_driver *driver);
+struct peci_client *peci_verify_client(struct device *dev);
+struct peci_adapter *peci_alloc_adapter(struct device *dev, uint size);
+struct peci_adapter *peci_get_adapter(int nr);
+void peci_put_adapter(struct peci_adapter *adapter);
+int  peci_add_adapter(struct peci_adapter *adapter);
+void peci_del_adapter(struct peci_adapter *adapter);
+struct peci_adapter *peci_verify_adapter(struct device *dev);
+int  peci_for_each_dev(void *data, int (*fn)(struct device *, void *));
+struct peci_xfer_msg *peci_get_xfer_msg(u8 tx_len, u8 rx_len);
+void peci_put_xfer_msg(struct peci_xfer_msg *msg);
+int  peci_command(struct peci_adapter *adpater, enum peci_cmd cmd, void *vmsg);
+int  peci_get_cpu_id(struct peci_adapter *adapter, u8 addr, u32 *cpu_id);
+
+#endif /* __LINUX_PECI_H */
diff --git a/include/uapi/linux/peci-ioctl.h b/include/uapi/linux/peci-ioctl.h
new file mode 100644
index 000000000000..5672690297b6
--- /dev/null
+++ b/include/uapi/linux/peci-ioctl.h
@@ -0,0 +1,660 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2018-2019 Intel Corporation */
+
+#ifndef __PECI_IOCTL_H
+#define __PECI_IOCTL_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/* The PECI client's default address of 0x30 */
+#define PECI_BASE_ADDR					0x30
+
+/* Max number of CPU clients */
+#define PECI_OFFSET_MAX					8
+
+/* PECI read/write data buffer size max */
+#define PECI_BUFFER_SIZE				255
+
+/* Device Specific Completion Code (CC) Definition */
+#define PECI_DEV_CC_SUCCESS				0x40
+#define PECI_DEV_CC_NEED_RETRY				0x80
+#define PECI_DEV_CC_OUT_OF_RESOURCE			0x81
+#define PECI_DEV_CC_UNAVAIL_RESOURCE			0x82
+#define PECI_DEV_CC_INVALID_REQ				0x90
+#define PECI_DEV_CC_MCA_ERROR				0x91
+#define PECI_DEV_CC_CATASTROPHIC_MCA_ERROR		0x93
+#define PECI_DEV_CC_FATAL_MCA_DETECTED			0x94
+#define PECI_DEV_CC_PARITY_ERROR_ON_GPSB_OR_PMSB	0x98
+#define PECI_DEV_CC_PARITY_ERROR_ON_GPSB_OR_PMSB_IERR	0x9B
+#define PECI_DEV_CC_PARITY_ERROR_ON_GPSB_OR_PMSB_MCA	0x9C
+
+/* Completion Code mask to check retry needs */
+#define PECI_DEV_CC_RETRY_CHECK_MASK			0xf0
+
+#define PECI_DEV_RETRY_TIME_MS				700
+#define PECI_DEV_RETRY_INTERVAL_USEC			10000
+#define PECI_DEV_RETRY_BIT				0x01
+
+/**
+ * enum peci_cmd - PECI client commands
+ * @PECI_CMD_XFER: raw PECI transfer
+ * @PECI_CMD_PING: ping, a required message for all PECI devices
+ * @PECI_CMD_GET_DIB: get DIB (Device Info Byte)
+ * @PECI_CMD_GET_TEMP: get maximum die temperature
+ * @PECI_CMD_RD_PKG_CFG: read access to the PCS (Package Configuration Space)
+ * @PECI_CMD_WR_PKG_CFG: write access to the PCS (Package Configuration Space)
+ * @PECI_CMD_RD_IA_MSR: read access to MSRs (Model Specific Registers)
+ * @PECI_CMD_WR_IA_MSR: write access to MSRs (Model Specific Registers)
+ * @PECI_CMD_RD_IA_MSREX: read access to MSRs (Model Specific Registers)
+ * @PECI_CMD_RD_PCI_CFG: sideband read access to the PCI configuration space
+ *	maintained in downstream devices external to the processor
+ * @PECI_CMD_WR_PCI_CFG: sideband write access to the PCI configuration space
+ *	maintained in downstream devices external to the processor
+ * @PECI_CMD_RD_PCI_CFG_LOCAL: sideband read access to the PCI configuration
+ *	space that resides within the processor
+ * @PECI_CMD_WR_PCI_CFG_LOCAL: sideband write access to the PCI configuration
+ *	space that resides within the processor
+ *
+ * Available commands depend on client's PECI revision.
+ */
+enum peci_cmd {
+	PECI_CMD_XFER = 0,
+	PECI_CMD_PING,
+	PECI_CMD_GET_DIB,
+	PECI_CMD_GET_TEMP,
+	PECI_CMD_RD_PKG_CFG,
+	PECI_CMD_WR_PKG_CFG,
+	PECI_CMD_RD_IA_MSR,
+	PECI_CMD_WR_IA_MSR,
+	PECI_CMD_RD_IA_MSREX,
+	PECI_CMD_RD_PCI_CFG,
+	PECI_CMD_WR_PCI_CFG,
+	PECI_CMD_RD_PCI_CFG_LOCAL,
+	PECI_CMD_WR_PCI_CFG_LOCAL,
+	PECI_CMD_RD_END_PT_CFG,
+	PECI_CMD_WR_END_PT_CFG,
+	PECI_CMD_CRASHDUMP_DISC,
+	PECI_CMD_CRASHDUMP_GET_FRAME,
+	PECI_CMD_MAX
+};
+
+/**
+ * struct peci_xfer_msg - raw PECI transfer command
+ * @addr; address of the client
+ * @tx_len: number of data to be written in bytes
+ * @rx_len: number of data to be read in bytes
+ * @tx_buf: data to be written, or NULL
+ * @rx_buf: data to be read, or NULL
+ *
+ * raw PECI transfer
+ */
+struct peci_xfer_msg {
+	__u8	addr;
+	__u8	tx_len;
+	__u8	rx_len;
+	__u8	padding;
+	__u8	*tx_buf;
+	__u8	*rx_buf;
+} __attribute__((__packed__));
+
+/**
+ * struct peci_ping_msg - ping command
+ * @addr: address of the client
+ *
+ * Ping() is a required message for all PECI devices. This message is used to
+ * enumerate devices or determine if a device has been removed, been
+ * powered-off, etc.
+ */
+struct peci_ping_msg {
+	__u8	addr;
+	__u8	padding[3];
+} __attribute__((__packed__));
+
+/**
+ * struct peci_get_dib_msg - GetDIB command
+ * @addr: address of the client
+ * @dib: DIB data to be read
+ *
+ * The processor PECI client implementation of GetDIB() includes an 8-byte
+ * response and provides information regarding client revision number and the
+ * number of supported domains. All processor PECI clients support the GetDIB()
+ * command.
+ */
+struct peci_get_dib_msg {
+#define PECI_GET_DIB_WR_LEN	1
+#define PECI_GET_DIB_RD_LEN	8
+#define PECI_GET_DIB_CMD	0xf7
+
+	__u8	addr;
+	__u8	padding[3];
+	__u64	dib;
+} __attribute__((__packed__));
+
+/**
+ * struct peci_get_temp_msg - GetTemp command
+ * @addr: address of the client
+ * @temp_raw: raw temperature data to be read
+ *
+ * The GetTemp() command is used to retrieve the maximum die temperature from a
+ * target PECI address. The temperature is used by the external thermal
+ * management system to regulate the temperature on the die. The data is
+ * returned as a negative value representing the number of degrees centigrade
+ * below the maximum processor junction temperature.
+ */
+struct peci_get_temp_msg {
+#define PECI_GET_TEMP_WR_LEN	1
+#define PECI_GET_TEMP_RD_LEN	2
+#define PECI_GET_TEMP_CMD	0x01
+
+	__u8	addr;
+	__u8	padding;
+	__s16	temp_raw;
+} __attribute__((__packed__));
+
+/**
+ * struct peci_rd_pkg_cfg_msg - RdPkgConfig command
+ * @addr: address of the client
+ * @index: encoding index for the requested service
+ * @param: specific data being requested
+ * @rx_len: number of data to be read in bytes
+ * @cc: completion code
+ * @pkg_config: package config data to be read
+ *
+ * The RdPkgConfig() command provides read access to the Package Configuration
+ * Space (PCS) within the processor, including various power and thermal
+ * management functions. Typical PCS read services supported by the processor
+ * may include access to temperature data, energy status, run time information,
+ * DIMM temperatures and so on.
+ */
+struct peci_rd_pkg_cfg_msg {
+#define PECI_RDPKGCFG_WRITE_LEN			5
+#define PECI_RDPKGCFG_READ_LEN_BASE		1
+#define PECI_RDPKGCFG_CMD			0xa1
+
+	__u8	addr;
+	__u8	index;
+#define PECI_MBX_INDEX_CPU_ID			0  /* Package Identifier Read */
+#define PECI_MBX_INDEX_VR_DEBUG			1  /* VR Debug */
+#define PECI_MBX_INDEX_PKG_TEMP_READ		2  /* Package Temperature Read */
+#define PECI_MBX_INDEX_ENERGY_COUNTER		3  /* Energy counter */
+#define PECI_MBX_INDEX_ENERGY_STATUS		4  /* DDR Energy Status */
+#define PECI_MBX_INDEX_WAKE_MODE_BIT		5  /* "Wake on PECI" Mode bit */
+#define PECI_MBX_INDEX_EPI			6  /* Efficient Performance Indication */
+#define PECI_MBX_INDEX_PKG_RAPL_PERF		8  /* Pkg RAPL Performance Status Read */
+#define PECI_MBX_INDEX_PER_CORE_DTS_TEMP	9  /* Per Core DTS Temperature Read */
+#define PECI_MBX_INDEX_DTS_MARGIN		10 /* DTS thermal margin */
+#define PECI_MBX_INDEX_SKT_PWR_THRTL_DUR	11 /* Socket Power Throttled Duration */
+#define PECI_MBX_INDEX_CFG_TDP_CONTROL		12 /* TDP Config Control */
+#define PECI_MBX_INDEX_CFG_TDP_LEVELS		13 /* TDP Config Levels */
+#define PECI_MBX_INDEX_DDR_DIMM_TEMP		14 /* DDR DIMM Temperature */
+#define PECI_MBX_INDEX_CFG_ICCMAX		15 /* Configurable ICCMAX */
+#define PECI_MBX_INDEX_TEMP_TARGET		16 /* Temperature Target Read */
+#define PECI_MBX_INDEX_CURR_CFG_LIMIT		17 /* Current Config Limit */
+#define PECI_MBX_INDEX_DIMM_TEMP_READ		20 /* Package Thermal Status Read */
+#define PECI_MBX_INDEX_DRAM_IMC_TMP_READ	22 /* DRAM IMC Temperature Read */
+#define PECI_MBX_INDEX_DDR_CH_THERM_STAT	23 /* DDR Channel Thermal Status */
+#define PECI_MBX_INDEX_PKG_POWER_LIMIT1		26 /* Package Power Limit1 */
+#define PECI_MBX_INDEX_PKG_POWER_LIMIT2		27 /* Package Power Limit2 */
+#define PECI_MBX_INDEX_TDP			28 /* Thermal design power minimum */
+#define PECI_MBX_INDEX_TDP_HIGH			29 /* Thermal design power maximum */
+#define PECI_MBX_INDEX_TDP_UNITS		30 /* Units for power/energy registers */
+#define PECI_MBX_INDEX_RUN_TIME			31 /* Accumulated Run Time */
+#define PECI_MBX_INDEX_CONSTRAINED_TIME		32 /* Thermally Constrained Time Read */
+#define PECI_MBX_INDEX_TURBO_RATIO		33 /* Turbo Activation Ratio */
+#define PECI_MBX_INDEX_DDR_RAPL_PL1		34 /* DDR RAPL PL1 */
+#define PECI_MBX_INDEX_DDR_PWR_INFO_HIGH	35 /* DRAM Power Info Read (high) */
+#define PECI_MBX_INDEX_DDR_PWR_INFO_LOW		36 /* DRAM Power Info Read (low) */
+#define PECI_MBX_INDEX_DDR_RAPL_PL2		37 /* DDR RAPL PL2 */
+#define PECI_MBX_INDEX_DDR_RAPL_STATUS		38 /* DDR RAPL Performance Status */
+#define PECI_MBX_INDEX_DDR_HOT_ABSOLUTE		43 /* DDR Hottest Dimm Absolute Temp */
+#define PECI_MBX_INDEX_DDR_HOT_RELATIVE		44 /* DDR Hottest Dimm Relative Temp */
+#define PECI_MBX_INDEX_DDR_THROTTLE_TIME	45 /* DDR Throttle Time */
+#define PECI_MBX_INDEX_DDR_THERM_STATUS		46 /* DDR Thermal Status */
+#define PECI_MBX_INDEX_TIME_AVG_TEMP		47 /* Package time-averaged temperature */
+#define PECI_MBX_INDEX_TURBO_RATIO_LIMIT	49 /* Turbo Ratio Limit Read */
+#define PECI_MBX_INDEX_HWP_AUTO_OOB		53 /* HWP Autonomous Out-of-band */
+#define PECI_MBX_INDEX_DDR_WARM_BUDGET		55 /* DDR Warm Power Budget */
+#define PECI_MBX_INDEX_DDR_HOT_BUDGET		56 /* DDR Hot Power Budget */
+#define PECI_MBX_INDEX_PKG_PSYS_PWR_LIM3	57 /* Package/Psys Power Limit3 */
+#define PECI_MBX_INDEX_PKG_PSYS_PWR_LIM1	58 /* Package/Psys Power Limit1 */
+#define PECI_MBX_INDEX_PKG_PSYS_PWR_LIM2	59 /* Package/Psys Power Limit2 */
+#define PECI_MBX_INDEX_PKG_PSYS_PWR_LIM4	60 /* Package/Psys Power Limit4 */
+#define PECI_MBX_INDEX_PERF_LIMIT_REASON	65 /* Performance Limit Reasons */
+
+	__u16	param;
+/* When index is PECI_MBX_INDEX_CPU_ID */
+#define PECI_PKG_ID_CPU_ID			0x0000  /* CPUID Info */
+#define PECI_PKG_ID_PLATFORM_ID			0x0001  /* Platform ID */
+#define PECI_PKG_ID_UNCORE_ID			0x0002  /* Uncore Device ID */
+#define PECI_PKG_ID_MAX_THREAD_ID		0x0003  /* Max Thread ID */
+#define PECI_PKG_ID_MICROCODE_REV		0x0004  /* CPU Microcode Update Revision */
+#define PECI_PKG_ID_MACHINE_CHECK_STATUS	0x0005  /* Machine Check Status */
+
+	__u8	rx_len;
+	__u8	cc;
+	__u8	padding[2];
+	__u8	pkg_config[4];
+} __attribute__((__packed__));
+
+/**
+ * struct peci_wr_pkg_cfg_msg - WrPkgConfig command
+ * @addr: address of the client
+ * @index: encoding index for the requested service
+ * @param: specific data being requested
+ * @tx_len: number of data to be written in bytes
+ * @cc: completion code
+ * @value: package config data to be written
+ *
+ * The WrPkgConfig() command provides write access to the Package Configuration
+ * Space (PCS) within the processor, including various power and thermal
+ * management functions. Typical PCS write services supported by the processor
+ * may include power limiting, thermal averaging constant programming and so
+ * on.
+ */
+struct peci_wr_pkg_cfg_msg {
+#define PECI_WRPKGCFG_WRITE_LEN_BASE	6
+#define PECI_WRPKGCFG_READ_LEN		1
+#define PECI_WRPKGCFG_CMD		0xa5
+
+	__u8	addr;
+	__u8	index;
+#define PECI_MBX_INDEX_DIMM_AMBIENT	19
+#define PECI_MBX_INDEX_DIMM_TEMP	24
+
+	__u16	param;
+	__u8	tx_len;
+	__u8	cc;
+	__u8	padding[2];
+	__u32	value;
+} __attribute__((__packed__));
+
+/**
+ * struct peci_rd_ia_msr_msg - RdIAMSR command
+ * @addr: address of the client
+ * @thread_id: ID of the specific logical processor
+ * @address: address of MSR to read from
+ * @cc: completion code
+ * @value: data to be read
+ *
+ * The RdIAMSR() PECI command provides read access to Model Specific Registers
+ * (MSRs) defined in the processor's Intel Architecture (IA).
+ */
+struct peci_rd_ia_msr_msg {
+#define PECI_RDIAMSR_WRITE_LEN	5
+#define PECI_RDIAMSR_READ_LEN	9
+#define PECI_RDIAMSR_CMD	0xb1
+
+	__u8	addr;
+	__u8	thread_id;
+	__u16	address;
+	__u8	cc;
+	__u8	padding[3];
+	__u64	value;
+} __attribute__((__packed__));
+
+/**
+ * struct peci_wr_ia_msr_msg - WrIAMSR command
+ * @addr: address of the client
+ * @thread_id: ID of the specific logical processor
+ * @address: address of MSR to write to
+ * @tx_len: number of data to be written in bytes
+ * @cc: completion code
+ * @value: data to be written
+ *
+ * The WrIAMSR() PECI command provides write access to Model Specific Registers
+ * (MSRs) defined in the processor's Intel Architecture (IA).
+ */
+struct peci_wr_ia_msr_msg {
+#define PECI_WRIAMSR_CMD		0xb5
+
+	__u8	addr;
+	__u8	thread_id;
+	__u16	address;
+	__u8	tx_len;
+	__u8	cc;
+	__u8	padding[2];
+	__u64	value;
+} __attribute__((__packed__));
+
+/**
+ * struct peci_rd_ia_msrex_msg - RdIAMSREX command
+ * @addr: address of the client
+ * @thread_id: ID of the specific logical processor
+ * @address: address of MSR to read from
+ * @cc: completion code
+ * @value: data to be read
+ *
+ * The RdIAMSREX() PECI command provides read access to Model Specific
+ * Registers (MSRs) defined in the processor's Intel Architecture (IA).
+ * The differences between RdIAMSREX() and RdIAMSR() are that:
+ * (1)RdIAMSR() can only read MC registers, RdIAMSREX() can read all MSRs
+ * (2)thread_id of RdIAMSR() is u8, thread_id of RdIAMSREX() is u16
+ */
+struct peci_rd_ia_msrex_msg {
+#define PECI_RDIAMSREX_WRITE_LEN	6
+#define PECI_RDIAMSREX_READ_LEN	9
+#define PECI_RDIAMSREX_CMD	0xd1
+
+	__u8	addr;
+	__u8	padding0;
+	__u16	thread_id;
+	__u16	address;
+	__u8	cc;
+	__u8	padding1;
+	__u64	value;
+} __attribute__((__packed__));
+
+/**
+ * struct peci_rd_pci_cfg_msg - RdPCIConfig command
+ * @addr: address of the client
+ * @bus: PCI bus number
+ * @device: PCI device number
+ * @function: specific function to read from
+ * @reg: specific register to read from
+ * @cc: completion code
+ * @pci_config: config data to be read
+ *
+ * The RdPCIConfig() command provides sideband read access to the PCI
+ * configuration space maintained in downstream devices external to the
+ * processor.
+ */
+struct peci_rd_pci_cfg_msg {
+#define PECI_RDPCICFG_WRITE_LEN		6
+#define PECI_RDPCICFG_READ_LEN		5
+#define PECI_RDPCICFG_READ_LEN_MAX	24
+#define PECI_RDPCICFG_CMD		0x61
+
+	__u8	addr;
+	__u8	bus;
+#define PECI_PCI_BUS0_CPU0		0x00
+#define PECI_PCI_BUS0_CPU1		0x80
+#define PECI_PCI_CPUBUSNO_BUS		0x00
+#define PECI_PCI_CPUBUSNO_DEV		0x08
+#define PECI_PCI_CPUBUSNO_FUNC		0x02
+#define PECI_PCI_CPUBUSNO		0xcc
+#define PECI_PCI_CPUBUSNO_1		0xd0
+#define PECI_PCI_CPUBUSNO_VALID		0xd4
+
+	__u8	device;
+	__u8	function;
+	__u16	reg;
+	__u8	cc;
+	__u8	padding[1];
+	__u8	pci_config[4];
+} __attribute__((__packed__));
+
+/**
+ * struct peci_wr_pci_cfg_msg - WrPCIConfig command
+ * @addr: address of the client
+ * @bus: PCI bus number
+ * @device: PCI device number
+ * @function: specific function to write to
+ * @reg: specific register to write to
+ * @tx_len: number of data to be written in bytes
+ * @cc: completion code
+ * @pci_config: config data to be written
+ *
+ * The RdPCIConfig() command provides sideband write access to the PCI
+ * configuration space maintained in downstream devices external to the
+ * processor.
+ */
+struct peci_wr_pci_cfg_msg {
+#define PECI_WRPCICFG_CMD		0x65
+
+	__u8	addr;
+	__u8	bus;
+	__u8	device;
+	__u8	function;
+	__u16	reg;
+	__u8	tx_len;
+	__u8	cc;
+	__u8	pci_config[4];
+} __attribute__((__packed__));
+
+/**
+ * struct peci_rd_pci_cfg_local_msg - RdPCIConfigLocal command
+ * @addr: address of the client
+ * @bus: PCI bus number
+ * @device: PCI device number
+ * @function: specific function to read from
+ * @reg: specific register to read from
+ * @rx_len: number of data to be read in bytes
+ * @cc: completion code
+ * @pci_config: config data to be read
+ *
+ * The RdPCIConfigLocal() command provides sideband read access to the PCI
+ * configuration space that resides within the processor. This includes all
+ * processor IIO and uncore registers within the PCI configuration space.
+ */
+struct peci_rd_pci_cfg_local_msg {
+#define PECI_RDPCICFGLOCAL_WRITE_LEN		5
+#define PECI_RDPCICFGLOCAL_READ_LEN_BASE	1
+#define PECI_RDPCICFGLOCAL_CMD			0xe1
+
+	__u8	addr;
+	__u8	bus;
+	__u8	device;
+	__u8	function;
+	__u16	reg;
+	__u8	rx_len;
+	__u8	cc;
+	__u8	pci_config[4];
+} __attribute__((__packed__));
+
+/**
+ * struct peci_wr_pci_cfg_local_msg - WrPCIConfigLocal command
+ * @addr: address of the client
+ * @bus: PCI bus number
+ * @device: PCI device number
+ * @function: specific function to read from
+ * @reg: specific register to read from
+ * @tx_len: number of data to be written in bytes
+ * @cc: completion code
+ * @value: config data to be written
+ *
+ * The WrPCIConfigLocal() command provides sideband write access to the PCI
+ * configuration space that resides within the processor. PECI originators can
+ * access this space even before BIOS enumeration of the system buses.
+ */
+struct peci_wr_pci_cfg_local_msg {
+#define PECI_WRPCICFGLOCAL_WRITE_LEN_BASE	6
+#define PECI_WRPCICFGLOCAL_READ_LEN		1
+#define PECI_WRPCICFGLOCAL_CMD			0xe5
+
+	__u8	addr;
+	__u8	bus;
+	__u8	device;
+	__u8	function;
+	__u16	reg;
+	__u8	tx_len;
+	__u8	cc;
+	__u32	value;
+} __attribute__((__packed__));
+
+struct peci_rd_end_pt_cfg_msg {
+#define PECI_RDENDPTCFG_PCI_WRITE_LEN		12
+#define PECI_RDENDPTCFG_MMIO_D_WRITE_LEN	14
+#define PECI_RDENDPTCFG_MMIO_Q_WRITE_LEN	18
+#define PECI_RDENDPTCFG_READ_LEN_BASE		1
+#define PECI_RDENDPTCFG_CMD			0xc1
+
+	__u8	addr;
+	__u8	msg_type;
+#define PECI_ENDPTCFG_TYPE_LOCAL_PCI		0x03
+#define PECI_ENDPTCFG_TYPE_PCI			0x04
+#define PECI_ENDPTCFG_TYPE_MMIO			0x05
+
+	union {
+		struct {
+			__u8	seg;
+			__u8	bus;
+			__u8	device;
+			__u8	function;
+			__u16	reg;
+		} pci_cfg;
+		struct {
+			__u8	seg;
+			__u8	bus;
+			__u8	device;
+			__u8	function;
+			__u8	bar;
+			__u8	addr_type;
+#define PECI_ENDPTCFG_ADDR_TYPE_PCI		0x04
+#define PECI_ENDPTCFG_ADDR_TYPE_MMIO_D		0x05
+#define PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q		0x06
+
+			__u64	offset;
+		} mmio;
+	} params;
+	__u8	rx_len;
+	__u8	cc;
+	__u8	padding[2];
+	__u8	data[8];
+} __attribute__((__packed__));
+
+struct peci_wr_end_pt_cfg_msg {
+#define PECI_WRENDPTCFG_PCI_WRITE_LEN_BASE	13
+#define PECI_WRENDPTCFG_MMIO_D_WRITE_LEN_BASE	15
+#define PECI_WRENDPTCFG_MMIO_Q_WRITE_LEN_BASE	19
+#define PECI_WRENDPTCFG_READ_LEN		1
+#define PECI_WRENDPTCFG_CMD			0xc5
+
+	__u8	addr;
+	__u8	msg_type;
+	/* See msg_type in struct peci_rd_end_pt_cfg_msg */
+
+	union {
+		struct {
+			__u8	seg;
+			__u8	bus;
+			__u8	device;
+			__u8	function;
+			__u16	reg;
+		} pci_cfg;
+		struct {
+			__u8	seg;
+			__u8	bus;
+			__u8	device;
+			__u8	function;
+			__u8	bar;
+			__u8	addr_type;
+			/* See addr_type in struct peci_rd_end_pt_cfg_msg */
+
+			__u64	offset;
+		} mmio;
+	} params;
+	__u8	tx_len;
+	__u8	cc;
+	__u8	padding[2];
+	__u64	value;
+} __attribute__((__packed__));
+
+/* Crashdump Agent */
+#define PECI_CRASHDUMP_CORE		0x00
+#define PECI_CRASHDUMP_TOR		0x01
+
+/* Crashdump Agent Param */
+#define PECI_CRASHDUMP_PAYLOAD_SIZE	0x00
+
+/* Crashdump Agent Data Param */
+#define PECI_CRASHDUMP_AGENT_ID		0x00
+#define PECI_CRASHDUMP_AGENT_PARAM	0x01
+
+struct peci_crashdump_disc_msg {
+	__u8	addr;
+	__u8	subopcode;
+#define PECI_CRASHDUMP_ENABLED		0x00
+#define PECI_CRASHDUMP_NUM_AGENTS	0x01
+#define PECI_CRASHDUMP_AGENT_DATA	0x02
+
+	__u8	cc;
+	__u8	param0;
+	__u16	param1;
+	__u8	param2;
+	__u8	rx_len;
+	__u8	data[8];
+} __attribute__((__packed__));
+
+struct peci_crashdump_get_frame_msg {
+#define PECI_CRASHDUMP_DISC_WRITE_LEN		9
+#define PECI_CRASHDUMP_DISC_READ_LEN_BASE	1
+#define PECI_CRASHDUMP_DISC_VERSION		0
+#define PECI_CRASHDUMP_DISC_OPCODE		1
+#define PECI_CRASHDUMP_GET_FRAME_WRITE_LEN	10
+#define PECI_CRASHDUMP_GET_FRAME_READ_LEN_BASE	1
+#define PECI_CRASHDUMP_GET_FRAME_VERSION	0
+#define PECI_CRASHDUMP_GET_FRAME_OPCODE		3
+#define PECI_CRASHDUMP_CMD			0x71
+
+	__u8	addr;
+	__u8	padding0;
+	__u16	param0;
+	__u16	param1;
+	__u16	param2;
+	__u8	rx_len;
+	__u8	cc;
+	__u8	padding1[2];
+	__u8	data[16];
+} __attribute__((__packed__));
+
+#define PECI_IOC_BASE  0xb7
+
+#define PECI_IOC_XFER \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_XFER, struct peci_xfer_msg)
+
+#define PECI_IOC_PING \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_PING, struct peci_ping_msg)
+
+#define PECI_IOC_GET_DIB \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_GET_DIB, struct peci_get_dib_msg)
+
+#define PECI_IOC_GET_TEMP \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_GET_TEMP, struct peci_get_temp_msg)
+
+#define PECI_IOC_RD_PKG_CFG \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_RD_PKG_CFG, struct peci_rd_pkg_cfg_msg)
+
+#define PECI_IOC_WR_PKG_CFG \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_WR_PKG_CFG, struct peci_wr_pkg_cfg_msg)
+
+#define PECI_IOC_RD_IA_MSR \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_RD_IA_MSR, struct peci_rd_ia_msr_msg)
+
+#define PECI_IOC_WR_IA_MSR \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_WR_IA_MSR, struct peci_wr_ia_msr_msg)
+
+#define PECI_IOC_RD_IA_MSREX \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_RD_IA_MSREX, struct peci_rd_ia_msrex_msg)
+
+#define PECI_IOC_RD_PCI_CFG \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_RD_PCI_CFG, struct peci_rd_pci_cfg_msg)
+
+#define PECI_IOC_WR_PCI_CFG \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_WR_PCI_CFG, struct peci_wr_pci_cfg_msg)
+
+#define PECI_IOC_RD_PCI_CFG_LOCAL \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_RD_PCI_CFG_LOCAL, \
+	      struct peci_rd_pci_cfg_local_msg)
+
+#define PECI_IOC_WR_PCI_CFG_LOCAL \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_WR_PCI_CFG_LOCAL, \
+	      struct peci_wr_pci_cfg_local_msg)
+
+#define PECI_IOC_RD_END_PT_CFG \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_RD_END_PT_CFG, \
+	      struct peci_rd_end_pt_cfg_msg)
+
+#define PECI_IOC_WR_END_PT_CFG \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_WR_END_PT_CFG, \
+	      struct peci_wr_end_pt_cfg_msg)
+
+#define PECI_IOC_CRASHDUMP_DISC \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_CRASHDUMP_DISC, \
+	      struct peci_crashdump_disc_msg)
+
+#define PECI_IOC_CRASHDUMP_GET_FRAME \
+	_IOWR(PECI_IOC_BASE, PECI_CMD_CRASHDUMP_GET_FRAME, \
+	      struct peci_crashdump_get_frame_msg)
+
+#endif /* __PECI_IOCTL_H */
-- 
2.17.1

