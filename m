Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FAC4ACC8A
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 00:16:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt27m3NvXz3bV1
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 10:16:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ptXbHPl5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ptXbHPl5; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jt2565KTbz2ynt
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 10:13:46 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217L4Fph027522; 
 Mon, 7 Feb 2022 23:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BuuXOH3L5t1Mli2usCNz3Lt8fXX5PrUZeL/2rLhWz4A=;
 b=ptXbHPl5SQI65Nel1v0LdqPQD6mV9udF7n0yj/f5E4BSJ0V7m4G+QiNBynudS6JdlM29
 BCAyy6v/q2dN4bCaIO7WFd+CjoSCoKxY5w/3bVg0lrUTzXU++pcw12Q8XkvjibBGS3wo
 TXVWeCoPhJ67S+OaBmQXNQ4A8ZMwjVVly/mnxOW9jwh+8vlkbWeoYFsAlUvxjX2uZ3x0
 pISGWcjKjTnDdPbxsney07gR0xj1KNOa1XHTqnix4qDieo7I7gGUjuTiOMuQXXhIeKdN
 1Wigh7r5NOITGBFRGRBzcFTgyURkYieh7oEssxT7Q4vC05JAUJ1JyMPQ2wI/WohL68H3 Vw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22vm1dty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 23:13:41 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217NDUNH002417;
 Mon, 7 Feb 2022 23:13:40 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3e2bt9ve1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 23:13:40 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217NDdCg33030504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 23:13:39 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80C64AE066;
 Mon,  7 Feb 2022 23:13:39 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7FE4AE060;
 Mon,  7 Feb 2022 23:13:38 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.47])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 23:13:38 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v4 3/6] gpio: fixes for
 gpio-hog support
Date: Mon,  7 Feb 2022 17:13:31 -0600
Message-Id: <20220207231334.59845-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220207231334.59845-1-eajames@linux.ibm.com>
References: <20220207231334.59845-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zIWXQpZ80rcxBgBM0lqyUM8wx9bXff5V
X-Proofpoint-ORIG-GUID: zIWXQpZ80rcxBgBM0lqyUM8wx9bXff5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_07,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070126
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Heiko Schocher <hs@denx.de>

recently added gpio hog patch was "in discussion"
state with Simon Glass. This patch now adds most
of comments from Simon Glass.

(cherry-picked from 49b10cb4926285b856b207c1f5bb40c75487f08b)
Signed-off-by: Heiko Schocher <hs@denx.de>
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 common/board_r.c                       |   4 +-
 doc/device-tree-bindings/gpio/gpio.txt |  17 ++--
 drivers/gpio/Kconfig                   |   2 +-
 drivers/gpio/gpio-uclass.c             | 103 ++++++++++++++++++-------
 include/asm-generic/gpio.h             |  12 +--
 5 files changed, 96 insertions(+), 42 deletions(-)

diff --git a/common/board_r.c b/common/board_r.c
index 5bb8f88bd0..429b9a2833 100644
--- a/common/board_r.c
+++ b/common/board_r.c
@@ -48,7 +48,7 @@
 #include <linux/compiler.h>
 #include <linux/err.h>
 #include <efi_loader.h>
-#if defined(CONFIG_DM_GPIO_HOG)
+#if defined(CONFIG_GPIO_HOG)
 #include <asm/gpio.h>
 #endif
 
@@ -788,7 +788,7 @@ static init_fnc_t init_sequence_r[] = {
 #ifdef CONFIG_CMD_NET
 	initr_ethaddr,
 #endif
-#if defined(CONFIG_DM_GPIO_HOG)
+#if defined(CONFIG_GPIO_HOG)
 	gpio_hog_probe_all,
 #endif
 #ifdef CONFIG_BOARD_LATE_INIT
diff --git a/doc/device-tree-bindings/gpio/gpio.txt b/doc/device-tree-bindings/gpio/gpio.txt
index e774439369..e146917ff3 100644
--- a/doc/device-tree-bindings/gpio/gpio.txt
+++ b/doc/device-tree-bindings/gpio/gpio.txt
@@ -252,6 +252,7 @@ Example:
                 boot_rescue {
                         gpio-hog;
                         input;
+                        line-name = "foo-bar-gpio";
                         gpios = <7 GPIO_ACTIVE_LOW>;
                 };
         };
@@ -259,9 +260,13 @@ Example:
 For the above Example you can than access the gpio in your boardcode
 with:
 
-        desc = gpio_hog_lookup_name("boot_rescue.gpio-hog");
-        if (desc) {
-                if (dm_gpio_get_value(desc))
-                        printf("\nBooting into Rescue System\n");
-		else
-			printf("\nBoot normal\n");
+	struct gpio_desc *desc;
+	int ret;
+
+	ret = gpio_hog_lookup_name("boot_rescue", &desc);
+	if (ret)
+		return;
+	if (dm_gpio_get_value(desc) == 1)
+		printf("\nBooting into Rescue System\n");
+	else if (dm_gpio_get_value(desc) == 0)
+		printf("\nBoot normal\n");
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 56ed37c2b5..a8dc16ca0e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -14,7 +14,7 @@ config DM_GPIO
 	  particular GPIOs that they provide. The uclass interface
 	  is defined in include/asm-generic/gpio.h.
 
-config DM_GPIO_HOG
+config GPIO_HOG
 	bool "Enable GPIO hog support"
 	depends on DM_GPIO
 	default n
diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 308d0863ad..01cfa2f788 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -144,7 +144,7 @@ static int gpio_find_and_xlate(struct gpio_desc *desc,
 		return gpio_xlate_offs_flags(desc->dev, desc, args);
 }
 
-#if defined(CONFIG_DM_GPIO_HOG)
+#if defined(CONFIG_GPIO_HOG)
 
 struct gpio_hog_priv {
 	struct gpio_desc gpiod;
@@ -181,9 +181,8 @@ static int gpio_hog_ofdata_to_platdata(struct udevice *dev)
 		return ret;
 	}
 	nodename = dev_read_string(dev, "line-name");
-	if (!nodename)
-		nodename = dev_read_name(dev);
-	device_set_name(dev, nodename);
+	if (nodename)
+		device_set_name(dev, nodename);
 
 	return 0;
 }
@@ -202,9 +201,15 @@ static int gpio_hog_probe(struct udevice *dev)
 		      dev->name);
 		return ret;
 	}
-	dm_gpio_set_dir(&priv->gpiod);
-	if (plat->gpiod_flags == GPIOD_IS_OUT)
-		dm_gpio_set_value(&priv->gpiod, plat->value);
+
+	if (plat->gpiod_flags == GPIOD_IS_OUT) {
+		ret = dm_gpio_set_value(&priv->gpiod, plat->value);
+		if (ret < 0) {
+			debug("%s: node %s could not set gpio.\n", __func__,
+			      dev->name);
+			return ret;
+		}
+	}
 
 	return 0;
 }
@@ -213,32 +218,38 @@ int gpio_hog_probe_all(void)
 {
 	struct udevice *dev;
 	int ret;
+	int retval = 0;
 
 	for (uclass_first_device(UCLASS_NOP, &dev);
 	     dev;
 	     uclass_find_next_device(&dev)) {
 		if (dev->driver == DM_GET_DRIVER(gpio_hog)) {
 			ret = device_probe(dev);
-			if (ret)
-				return ret;
+			if (ret) {
+				printf("Failed to probe device %s err: %d\n",
+				       dev->name, ret);
+				retval = ret;
+			}
 		}
 	}
 
-	return 0;
+	return retval;
 }
 
-struct gpio_desc *gpio_hog_lookup_name(const char *name)
+int gpio_hog_lookup_name(const char *name, struct gpio_desc **desc)
 {
 	struct udevice *dev;
 
+	*desc = NULL;
 	gpio_hog_probe_all();
 	if (!uclass_get_device_by_name(UCLASS_NOP, name, &dev)) {
 		struct gpio_hog_priv *priv = dev_get_priv(dev);
 
-		return &priv->gpiod;
+		*desc = &priv->gpiod;
+		return 0;
 	}
 
-	return NULL;
+	return -ENODEV;
 }
 
 U_BOOT_DRIVER(gpio_hog) = {
@@ -250,9 +261,9 @@ U_BOOT_DRIVER(gpio_hog) = {
 	.platdata_auto_alloc_size = sizeof(struct gpio_hog_data),
 };
 #else
-struct gpio_desc *gpio_hog_lookup_name(const char *name)
+int gpio_hog_lookup_name(const char *name, struct gpio_desc **desc)
 {
-	return NULL;
+	return 0;
 }
 #endif
 
@@ -755,13 +766,45 @@ int dm_gpio_get_values_as_int(const struct gpio_desc *desc_list, int count)
 	return vector;
 }
 
+/**
+ * gpio_request_tail: common work for requesting a gpio.
+ *
+ * ret:		return value from previous work in function which calls
+ *		this function.
+ *		This seems bogus (why calling this function instead not
+ *		calling it and end caller function instead?).
+ *		Because on error in caller function we want to set some
+ *		default values in gpio desc and have a common error
+ *		debug message, which provides this function.
+ * nodename:	Name of node for which gpio gets requested
+ *		used for gpio label name.
+ * args:	pointer to output arguments structure
+ * list_name:	Name of GPIO list
+ *		used for gpio label name.
+ * index:	gpio index in gpio list
+ *		used for gpio label name.
+ * desc:	pointer to gpio descriptor, filled from this
+ *		function.
+ * flags:	gpio flags to use.
+ * add_index:	should index added to gpio label name
+ * gpio_dev:	pointer to gpio device from which the gpio
+ *		will be requested. If NULL try to get the
+ *		gpio device with uclass_get_device_by_ofnode()
+ *
+ * return:	In error case this function sets default values in
+ *		gpio descriptor, also emmits a debug message.
+ *		On success it returns 0 else the error code from
+ *		function calls, or the error code passed through
+ *		ret to this function.
+ *
+ */
 static int gpio_request_tail(int ret, const char *nodename,
 			     struct ofnode_phandle_args *args,
 			     const char *list_name, int index,
 			     struct gpio_desc *desc, int flags,
-			     bool add_index, struct udevice *dev)
+			     bool add_index, struct udevice *gpio_dev)
 {
-	desc->dev = dev;
+	desc->dev = gpio_dev;
 	desc->offset = 0;
 	desc->flags = 0;
 	if (ret)
@@ -771,7 +814,8 @@ static int gpio_request_tail(int ret, const char *nodename,
 		ret = uclass_get_device_by_ofnode(UCLASS_GPIO, args->node,
 						  &desc->dev);
 		if (ret) {
-			debug("%s: uclass_get_device_by_ofnode failed\n", __func__);
+			debug("%s: uclass_get_device_by_ofnode failed\n",
+			      __func__);
 			goto err;
 		}
 	}
@@ -989,10 +1033,8 @@ int gpio_dev_request_index(struct udevice *dev, const char *nodename,
 
 static int gpio_post_bind(struct udevice *dev)
 {
-#if defined(CONFIG_DM_GPIO_HOG)
 	struct udevice *child;
 	ofnode node;
-#endif
 
 #if defined(CONFIG_NEEDS_MANUAL_RELOC)
 	struct dm_gpio_ops *ops = (struct dm_gpio_ops *)device_get_ops(dev);
@@ -1024,16 +1066,21 @@ static int gpio_post_bind(struct udevice *dev)
 	}
 #endif
 
-#if defined(CONFIG_DM_GPIO_HOG)
-	dev_for_each_subnode(node, dev) {
-		if (ofnode_read_bool(node, "gpio-hog")) {
-			const char *name = ofnode_get_name(node);
-
-			device_bind_driver_to_node(dev, "gpio_hog", name,
-						   node, &child);
+	if (IS_ENABLED(CONFIG_GPIO_HOG)) {
+		dev_for_each_subnode(node, dev) {
+			if (ofnode_read_bool(node, "gpio-hog")) {
+				const char *name = ofnode_get_name(node);
+				int ret;
+
+				ret = device_bind_driver_to_node(dev,
+								 "gpio_hog",
+								 name, node,
+								 &child);
+				if (ret)
+					return ret;
+			}
 		}
 	}
-#endif
 	return 0;
 }
 
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 37f71e5708..d6cf18744f 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -352,9 +352,10 @@ int dm_gpio_lookup_name(const char *name, struct gpio_desc *desc);
  * gpio_hog_lookup_name() - Look up a named GPIO and return the gpio descr.
  *
  * @name:	Name to look up
- * @return:	Returns gpio_desc for gpio
+ * @desc:	Returns GPIO description, on success, else NULL
+ * @return:	Returns 0 if OK, else -ENODEV
  */
-struct gpio_desc *gpio_hog_lookup_name(const char *name);
+int gpio_hog_lookup_name(const char *name, struct gpio_desc **desc);
 
 /**
  * gpio_hog_probe_all() - probe all gpio devices with
@@ -523,12 +524,13 @@ int gpio_request_list_by_name_nodev(ofnode node, const char *list_name,
  * gpio_dev_request_index() - request single GPIO from gpio device
  *
  * @dev:	GPIO device
- * @nodename:	Name of node
+ * @nodename:	Name of node for which gpio gets requested, used
+ *		for the gpio label name
  * @list_name:	Name of GPIO list (e.g. "board-id-gpios")
  * @index:	Index number of the GPIO in that list use request (0=first)
  * @flags:	GPIOD_* flags
- * @dtflags:	GPIO flags read from DT
- * @desc:	GPIO descriotor filled from this function
+ * @dtflags:	GPIO flags read from DT defined see GPIOD_*
+ * @desc:	returns GPIO descriptor filled from this function
  * @return:	return value from gpio_request_tail()
  */
 int gpio_dev_request_index(struct udevice *dev, const char *nodename,
-- 
2.27.0

