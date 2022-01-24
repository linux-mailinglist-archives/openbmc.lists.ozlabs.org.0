Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0D498B8A
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 20:15:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjKSg1bxjz3bP4
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 06:15:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q+JG3lhE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q+JG3lhE; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjKSH1g58z2ymg
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jan 2022 06:15:10 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OIkc9i026076; 
 Mon, 24 Jan 2022 19:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=N55ku1HwR34+Bk2i6dDoIGIJpv8L5/y0FuS71+Acazw=;
 b=q+JG3lhEdMIMI6bpPlJXl//PYW64q8gYS+ohLR/2+p5oswGOqb7oH+1KCyHRkGl2/t4D
 CfStZMrd0L08Nli/7lOWow16LV0/sI/wHiveMeXylKFCruXuF9kDHZfURQz05gvGhaad
 YPtP9Wl5sVIefo8JxqZ1lAzHdq14uNOVX5A0clQj4ctNFdLlokAZ/6c3CCniowAAA0oG
 hpR4I/f6BR2li4arQ3xrO+4hdd2Z3c3aAN3BbnFunooenbytA8k4guEcat21bm/yY4E5
 5wDhXf8hSK33KKdFLYovLmPejREoZfDNkDG2WRhRnHLbwq1Pmvt3TnZm/Sg3pMbFHJvZ lQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dt1pj8mgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:06 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OJ7UPb024704;
 Mon, 24 Jan 2022 19:15:06 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3dr9j9n2q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:06 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OJF53X17170722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 19:15:05 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50C49C606C;
 Mon, 24 Jan 2022 19:15:05 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 158F6C605F;
 Mon, 24 Jan 2022 19:15:05 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.14.245])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 19:15:04 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc 2/6] gpio: add gpio-hog support
Date: Mon, 24 Jan 2022 13:14:59 -0600
Message-Id: <20220124191503.88452-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220124191503.88452-1-eajames@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: haFMPucJ1TgmFcyV6S9vMaCkT7LqXQgP
X-Proofpoint-ORIG-GUID: haFMPucJ1TgmFcyV6S9vMaCkT7LqXQgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201240125
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

From: Heiko Schocher <hs@denx.de>

add gpio-hog support. GPIO hogging is a mechanism
providing automatic GPIO request and configuration
as part of the gpio-controller's driver probe function.

for more infos see:
doc/device-tree-bindings/gpio/gpio.txt

Signed-off-by: Heiko Schocher <hs@denx.de>
Tested-by: Michal Simek <michal.simek@xilinx.com> (zcu102)
Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
---
 common/board_r.c                       |   6 +
 doc/device-tree-bindings/gpio/gpio.txt |  55 ++++++++
 drivers/gpio/Kconfig                   |  10 ++
 drivers/gpio/gpio-uclass.c             | 181 ++++++++++++++++++++++---
 include/asm-generic/gpio.h             |  32 +++++
 5 files changed, 268 insertions(+), 16 deletions(-)

diff --git a/common/board_r.c b/common/board_r.c
index 472987d5d5..5bb8f88bd0 100644
--- a/common/board_r.c
+++ b/common/board_r.c
@@ -48,6 +48,9 @@
 #include <linux/compiler.h>
 #include <linux/err.h>
 #include <efi_loader.h>
+#if defined(CONFIG_DM_GPIO_HOG)
+#include <asm/gpio.h>
+#endif
 
 DECLARE_GLOBAL_DATA_PTR;
 
@@ -785,6 +788,9 @@ static init_fnc_t init_sequence_r[] = {
 #ifdef CONFIG_CMD_NET
 	initr_ethaddr,
 #endif
+#if defined(CONFIG_DM_GPIO_HOG)
+	gpio_hog_probe_all,
+#endif
 #ifdef CONFIG_BOARD_LATE_INIT
 	board_late_init,
 #endif
diff --git a/doc/device-tree-bindings/gpio/gpio.txt b/doc/device-tree-bindings/gpio/gpio.txt
index f7a158d858..e774439369 100644
--- a/doc/device-tree-bindings/gpio/gpio.txt
+++ b/doc/device-tree-bindings/gpio/gpio.txt
@@ -210,3 +210,58 @@ Example 2:
 Here, three GPIO ranges are defined wrt. two pin controllers. pinctrl1 GPIO
 ranges are defined using pin numbers whereas the GPIO ranges wrt. pinctrl2
 are named "foo" and "bar".
+
+3) GPIO hog definitions
+-----------------------
+
+The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
+providing automatic GPIO request and configuration as part of the
+gpio-controller's driver probe function.
+
+Each GPIO hog definition is represented as a child node of the GPIO controller.
+Required properties:
+- gpio-hog:   A property specifying that this child node represents a GPIO hog.
+- gpios:      Store the GPIO information (id, flags) for the GPIO to
+	      affect.
+
+              ! Not yet support more than one gpio !
+
+Only one of the following properties scanned in the order shown below.
+- input:      A property specifying to set the GPIO direction as input.
+- output-low  A property specifying to set the GPIO direction as output with
+	      the value low.
+- output-high A property specifying to set the GPIO direction as output with
+	      the value high.
+
+Optional properties:
+- line-name:  The GPIO label name. If not present the node name is used.
+
+Example:
+
+        tca6416@20 {
+                compatible = "ti,tca6416";
+                reg = <0x20>;
+                #gpio-cells = <2>;
+                gpio-controller;
+
+                env_reset {
+                        gpio-hog;
+                        input;
+                        gpios = <6 GPIO_ACTIVE_LOW>;
+                };
+                boot_rescue {
+                        gpio-hog;
+                        input;
+                        gpios = <7 GPIO_ACTIVE_LOW>;
+                };
+        };
+
+For the above Example you can than access the gpio in your boardcode
+with:
+
+        desc = gpio_hog_lookup_name("boot_rescue.gpio-hog");
+        if (desc) {
+                if (dm_gpio_get_value(desc))
+                        printf("\nBooting into Rescue System\n");
+		else
+			printf("\nBoot normal\n");
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a519a0a169..56ed37c2b5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -14,6 +14,16 @@ config DM_GPIO
 	  particular GPIOs that they provide. The uclass interface
 	  is defined in include/asm-generic/gpio.h.
 
+config DM_GPIO_HOG
+	bool "Enable GPIO hog support"
+	depends on DM_GPIO
+	default n
+	help
+	  Enable gpio hog support
+	  The GPIO chip may contain GPIO hog definitions. GPIO hogging
+	  is a mechanism providing automatic GPIO request and config-
+	  uration as part of the gpio-controller's driver probe function.
+
 config ALTERA_PIO
 	bool "Altera PIO driver"
 	depends on DM_GPIO
diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index da5e9ba6e5..308d0863ad 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -5,6 +5,9 @@
 
 #include <common.h>
 #include <dm.h>
+#include <dm/device-internal.h>
+#include <dm/lists.h>
+#include <dm/uclass-internal.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <errno.h>
 #include <fdtdec.h>
@@ -141,6 +144,118 @@ static int gpio_find_and_xlate(struct gpio_desc *desc,
 		return gpio_xlate_offs_flags(desc->dev, desc, args);
 }
 
+#if defined(CONFIG_DM_GPIO_HOG)
+
+struct gpio_hog_priv {
+	struct gpio_desc gpiod;
+};
+
+struct gpio_hog_data {
+	int gpiod_flags;
+	int value;
+	u32 val[2];
+};
+
+static int gpio_hog_ofdata_to_platdata(struct udevice *dev)
+{
+	struct gpio_hog_data *plat = dev_get_platdata(dev);
+	const char *nodename;
+	int ret;
+
+	plat->value = 0;
+	if (dev_read_bool(dev, "input")) {
+		plat->gpiod_flags = GPIOD_IS_IN;
+	} else if (dev_read_bool(dev, "output-high")) {
+		plat->value = 1;
+		plat->gpiod_flags = GPIOD_IS_OUT;
+	} else if (dev_read_bool(dev, "output-low")) {
+		plat->gpiod_flags = GPIOD_IS_OUT;
+	} else {
+		printf("%s: missing gpio-hog state.\n", __func__);
+		return -EINVAL;
+	}
+	ret = dev_read_u32_array(dev, "gpios", plat->val, 2);
+	if (ret) {
+		printf("%s: wrong gpios property, 2 values needed %d\n",
+		       __func__, ret);
+		return ret;
+	}
+	nodename = dev_read_string(dev, "line-name");
+	if (!nodename)
+		nodename = dev_read_name(dev);
+	device_set_name(dev, nodename);
+
+	return 0;
+}
+
+static int gpio_hog_probe(struct udevice *dev)
+{
+	struct gpio_hog_data *plat = dev_get_platdata(dev);
+	struct gpio_hog_priv *priv = dev_get_priv(dev);
+	int ret;
+
+	ret = gpio_dev_request_index(dev->parent, dev->name, "gpio-hog",
+				     plat->val[0], plat->gpiod_flags,
+				     plat->val[1], &priv->gpiod);
+	if (ret < 0) {
+		debug("%s: node %s could not get gpio.\n", __func__,
+		      dev->name);
+		return ret;
+	}
+	dm_gpio_set_dir(&priv->gpiod);
+	if (plat->gpiod_flags == GPIOD_IS_OUT)
+		dm_gpio_set_value(&priv->gpiod, plat->value);
+
+	return 0;
+}
+
+int gpio_hog_probe_all(void)
+{
+	struct udevice *dev;
+	int ret;
+
+	for (uclass_first_device(UCLASS_NOP, &dev);
+	     dev;
+	     uclass_find_next_device(&dev)) {
+		if (dev->driver == DM_GET_DRIVER(gpio_hog)) {
+			ret = device_probe(dev);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+struct gpio_desc *gpio_hog_lookup_name(const char *name)
+{
+	struct udevice *dev;
+
+	gpio_hog_probe_all();
+	if (!uclass_get_device_by_name(UCLASS_NOP, name, &dev)) {
+		struct gpio_hog_priv *priv = dev_get_priv(dev);
+
+		return &priv->gpiod;
+	}
+
+	return NULL;
+}
+
+U_BOOT_DRIVER(gpio_hog) = {
+	.name	= "gpio_hog",
+	.id	= UCLASS_NOP,
+	.ofdata_to_platdata = gpio_hog_ofdata_to_platdata,
+	.probe = gpio_hog_probe,
+	.priv_auto_alloc_size = sizeof(struct gpio_hog_priv),
+	.platdata_auto_alloc_size = sizeof(struct gpio_hog_data),
+};
+#else
+struct gpio_desc *gpio_hog_lookup_name(const char *name)
+{
+	return NULL;
+}
+#endif
+
 int dm_gpio_request(struct gpio_desc *desc, const char *label)
 {
 	struct udevice *dev = desc->dev;
@@ -640,22 +755,25 @@ int dm_gpio_get_values_as_int(const struct gpio_desc *desc_list, int count)
 	return vector;
 }
 
-static int gpio_request_tail(int ret, ofnode node,
+static int gpio_request_tail(int ret, const char *nodename,
 			     struct ofnode_phandle_args *args,
 			     const char *list_name, int index,
-			     struct gpio_desc *desc, int flags, bool add_index)
+			     struct gpio_desc *desc, int flags,
+			     bool add_index, struct udevice *dev)
 {
-	desc->dev = NULL;
+	desc->dev = dev;
 	desc->offset = 0;
 	desc->flags = 0;
 	if (ret)
 		goto err;
 
-	ret = uclass_get_device_by_ofnode(UCLASS_GPIO, args->node,
-					  &desc->dev);
-	if (ret) {
-		debug("%s: uclass_get_device_by_ofnode failed\n", __func__);
-		goto err;
+	if (!desc->dev) {
+		ret = uclass_get_device_by_ofnode(UCLASS_GPIO, args->node,
+						  &desc->dev);
+		if (ret) {
+			debug("%s: uclass_get_device_by_ofnode failed\n", __func__);
+			goto err;
+		}
 	}
 	ret = gpio_find_and_xlate(desc, args);
 	if (ret) {
@@ -663,8 +781,7 @@ static int gpio_request_tail(int ret, ofnode node,
 		goto err;
 	}
 	ret = dm_gpio_requestf(desc, add_index ? "%s.%s%d" : "%s.%s",
-			       ofnode_get_name(node),
-			       list_name, index);
+			       nodename, list_name, index);
 	if (ret) {
 		debug("%s: dm_gpio_requestf failed\n", __func__);
 		goto err;
@@ -678,7 +795,7 @@ static int gpio_request_tail(int ret, ofnode node,
 	return 0;
 err:
 	debug("%s: Node '%s', property '%s', failed to request GPIO index %d: %d\n",
-	      __func__, ofnode_get_name(node), list_name, index, ret);
+	      __func__, nodename, list_name, index, ret);
 	return ret;
 }
 
@@ -692,8 +809,8 @@ static int _gpio_request_by_name_nodev(ofnode node, const char *list_name,
 	ret = ofnode_parse_phandle_with_args(node, list_name, "#gpio-cells", 0,
 					     index, &args);
 
-	return gpio_request_tail(ret, node, &args, list_name, index, desc,
-				 flags, add_index);
+	return gpio_request_tail(ret, ofnode_get_name(node), &args, list_name,
+				 index, desc, flags, add_index, NULL);
 }
 
 int gpio_request_by_name_nodev(ofnode node, const char *list_name, int index,
@@ -707,13 +824,14 @@ int gpio_request_by_name(struct udevice *dev, const char *list_name, int index,
 			 struct gpio_desc *desc, int flags)
 {
 	struct ofnode_phandle_args args;
+	ofnode node;
 	int ret;
 
 	ret = dev_read_phandle_with_args(dev, list_name, "#gpio-cells", 0,
 					 index, &args);
-
-	return gpio_request_tail(ret, dev_ofnode(dev), &args, list_name,
-				 index, desc, flags, index > 0);
+	node = dev_ofnode(dev);
+	return gpio_request_tail(ret, ofnode_get_name(node), &args, list_name,
+				 index, desc, flags, index > 0, NULL);
 }
 
 int gpio_request_list_by_name_nodev(ofnode node, const char *list_name,
@@ -854,8 +972,28 @@ static int gpio_pre_remove(struct udevice *dev)
 	return gpio_renumber(dev);
 }
 
+int gpio_dev_request_index(struct udevice *dev, const char *nodename,
+			   char *list_name, int index, int flags,
+			   int dtflags, struct gpio_desc *desc)
+{
+	struct ofnode_phandle_args args;
+
+	args.node =  ofnode_null();
+	args.args_count = 2;
+	args.args[0] = index;
+	args.args[1] = dtflags;
+
+	return gpio_request_tail(0, nodename, &args, list_name, index, desc,
+				 flags, 0, dev);
+}
+
 static int gpio_post_bind(struct udevice *dev)
 {
+#if defined(CONFIG_DM_GPIO_HOG)
+	struct udevice *child;
+	ofnode node;
+#endif
+
 #if defined(CONFIG_NEEDS_MANUAL_RELOC)
 	struct dm_gpio_ops *ops = (struct dm_gpio_ops *)device_get_ops(dev);
 	static int reloc_done;
@@ -885,6 +1023,17 @@ static int gpio_post_bind(struct udevice *dev)
 		reloc_done++;
 	}
 #endif
+
+#if defined(CONFIG_DM_GPIO_HOG)
+	dev_for_each_subnode(node, dev) {
+		if (ofnode_read_bool(node, "gpio-hog")) {
+			const char *name = ofnode_get_name(node);
+
+			device_bind_driver_to_node(dev, "gpio_hog", name,
+						   node, &child);
+		}
+	}
+#endif
 	return 0;
 }
 
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index d03602696f..37f71e5708 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -348,6 +348,22 @@ const char *gpio_get_bank_info(struct udevice *dev, int *offset_count);
  */
 int dm_gpio_lookup_name(const char *name, struct gpio_desc *desc);
 
+/**
+ * gpio_hog_lookup_name() - Look up a named GPIO and return the gpio descr.
+ *
+ * @name:	Name to look up
+ * @return:	Returns gpio_desc for gpio
+ */
+struct gpio_desc *gpio_hog_lookup_name(const char *name);
+
+/**
+ * gpio_hog_probe_all() - probe all gpio devices with
+ * gpio-hog subnodes.
+ *
+ * @return:	Returns return value from device_probe()
+ */
+int gpio_hog_probe_all(void);
+
 /**
  * gpio_lookup_name - Look up a GPIO name and return its details
  *
@@ -503,6 +519,22 @@ int gpio_request_list_by_name_nodev(ofnode node, const char *list_name,
 				    struct gpio_desc *desc_list, int max_count,
 				    int flags);
 
+/**
+ * gpio_dev_request_index() - request single GPIO from gpio device
+ *
+ * @dev:	GPIO device
+ * @nodename:	Name of node
+ * @list_name:	Name of GPIO list (e.g. "board-id-gpios")
+ * @index:	Index number of the GPIO in that list use request (0=first)
+ * @flags:	GPIOD_* flags
+ * @dtflags:	GPIO flags read from DT
+ * @desc:	GPIO descriotor filled from this function
+ * @return:	return value from gpio_request_tail()
+ */
+int gpio_dev_request_index(struct udevice *dev, const char *nodename,
+			   char *list_name, int index, int flags,
+			   int dtflags, struct gpio_desc *desc);
+
 /**
  * dm_gpio_free() - Free a single GPIO
  *
-- 
2.27.0

