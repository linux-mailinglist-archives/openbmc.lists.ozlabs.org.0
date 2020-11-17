Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D442B591A
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 06:24:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZvX44n6kzDqQn
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 16:24:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KVVX1oxU; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZvWF3MrtzDqQP
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 16:24:06 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id 5so2829887plj.8
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 21:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4cBPPk0APDsAXh7hE4WgWec1IGA/wNTTOv/JbLmhkEM=;
 b=KVVX1oxUe9l8kd13n9jo0DuL0A3NomMIfnziKCVNXClimQOHhjncrNnMrrS2O9nIfl
 i+Q6dl91NMzbLfGLPZS5TxFaGmZNBtNSzcdu/wOhOTZW/DerhdxgHeBu+odOyt+gcAlD
 39VXDP3RqEA+0v3YA23bUYKpQ0pwOmvsOJ5GzSkXgBpHlu7yQruW+fD0ZyDWNVP496PK
 NU1JU2sjSWn29MAx8xowZQ0Q0YySa2QrsfM3lB+9Rg772mRM6CypZqgjdkHtDNo/DMGo
 2IiFxwQvaBLDCG/6aYUW1J/kDOw031hy1AIoImqgm5MVjaCb4sWTA5QEikwY9jGgmgxy
 6Elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4cBPPk0APDsAXh7hE4WgWec1IGA/wNTTOv/JbLmhkEM=;
 b=Tx1ZuahmUF0dD06bdE+5wApLX0tCFTAhLzEriSkYjk0edgNInlin5DZbI4RrdpjOLK
 k0l3mzwBGaeFfSR0EQPXNr9LEdKJ3rWPhzpiDoZvIfzF0mHYS1gwnTSb5H2OWVTYd8fI
 BAVXg78HoxWfbvjZqz9K3qYSCFJ1WJwDT1p0/lJIhsas+wL8ey1/rScQPB0vyXTE5pyO
 rWqjPPdriw0G8hXv1rqgNX2+RMGpwE8piQYJPvqxJ+OIkCG7/QVi660laELbE1WZHazD
 rDBs0gKr3aEPBbeDnaM+w2Ih7I1JQyQCx75MBmjR6r2KrMs8KFbNV46Tb4SF4sMeKURc
 oZuQ==
X-Gm-Message-State: AOAM530Uut+byIwTDup3OokfxXNyTyZkh/bWCgM3wB4iXFCovDvDNmd7
 sK6CkEl2KWk65lILN34QxxG1nVn5SXSnHw==
X-Google-Smtp-Source: ABdhPJw/irPeixf+mSI1r1T9zA7CaR4uoFGlmTm8sJb4yD8cxw13VsTT2M7g5K0LLBcAENcgjfgAjA==
X-Received: by 2002:a17:902:d34c:b029:d7:ca4a:3d83 with SMTP id
 l12-20020a170902d34cb02900d7ca4a3d83mr15971415plk.55.1605590640108; 
 Mon, 16 Nov 2020 21:24:00 -0800 (PST)
Received: from voyager.ozlabs.ibm.com ([125.63.148.35])
 by smtp.gmail.com with ESMTPSA id e6sm19595206pfn.190.2020.11.16.21.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 21:23:59 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.8] soc: aspeed: Remove misc control interface
 driver
Date: Tue, 17 Nov 2020 15:53:49 +1030
Message-Id: <20201117052349.1222669-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This driver is no longer in use. There were two consumers in OpenBMC
userspace:

 - hb_settings

    This was used to set the ASPEED LPC scratch registers.

    The scratch registers are no longer used after the SuperIO controller
    was disabled to mitigate the pantsdown issues.

 - uart-render-controller

   This was used for controlling the ASPEED VGA mux, to switch between
   the internal graphics device and the VGA device.

   The mux now has an upstream sysfs control as part of the DRM driver
   and userspace has been updated to use that.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/soc/aspeed/Kconfig           |   8 --
 drivers/soc/aspeed/Makefile          |   1 -
 drivers/soc/aspeed/aspeed-bmc-misc.c | 190 ---------------------------
 3 files changed, 199 deletions(-)
 delete mode 100644 drivers/soc/aspeed/aspeed-bmc-misc.c

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 2665ca89bdf8..9bdd4cebc65d 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -5,14 +5,6 @@ config SOC_ASPEED
 	def_bool y
 	depends on ARCH_ASPEED || COMPILE_TEST
 
-config ASPEED_BMC_MISC
-	bool "Miscellaneous ASPEED BMC interfaces"
-	depends on ARCH_ASPEED || COMPILE_TEST
-	default ARCH_ASPEED
-	help
-	  Say yes to expose VGA and LPC scratch registers, and other
-	  miscellaneous control interfaces specific to the ASPEED BMC SoCs
-
 config ASPEED_LPC_CTRL
 	depends on SOC_ASPEED && REGMAP && MFD_SYSCON
 	tristate "Aspeed ast2400/2500 HOST LPC to BMC bridge control"
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index 217d876fec25..977b046dfb73 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_ASPEED_BMC_MISC)	+= aspeed-bmc-misc.o
 obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
 obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)	+= aspeed-p2a-ctrl.o
diff --git a/drivers/soc/aspeed/aspeed-bmc-misc.c b/drivers/soc/aspeed/aspeed-bmc-misc.c
deleted file mode 100644
index 314007bad74f..000000000000
--- a/drivers/soc/aspeed/aspeed-bmc-misc.c
+++ /dev/null
@@ -1,190 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-// Copyright 2018 IBM Corp.
-
-#include <linux/kobject.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
-
-#define DEVICE_NAME "aspeed-bmc-misc"
-
-struct aspeed_bmc_ctrl {
-	const char *name;
-	u32 offset;
-	u32 mask;
-	u32 shift;
-	struct regmap *map;
-	struct kobj_attribute attr;
-};
-
-struct aspeed_bmc_misc {
-	struct device *dev;
-	struct regmap *map;
-	struct aspeed_bmc_ctrl *ctrls;
-	int nr_ctrls;
-};
-
-static int aspeed_bmc_misc_parse_dt_child(struct device_node *child,
-					  struct aspeed_bmc_ctrl *ctrl)
-{
-	int rc;
-
-	/* Example child:
-	 *
-	 * ilpc2ahb {
-	 *     offset = <0x80>;
-	 *     bit-mask = <0x1>;
-	 *     bit-shift = <6>;
-	 *     label = "foo";
-	 * }
-	 */
-	if (of_property_read_string(child, "label", &ctrl->name))
-		ctrl->name = child->name;
-
-	rc = of_property_read_u32(child, "offset", &ctrl->offset);
-	if (rc < 0)
-		return rc;
-
-	rc = of_property_read_u32(child, "bit-mask", &ctrl->mask);
-	if (rc < 0)
-		return rc;
-
-	rc = of_property_read_u32(child, "bit-shift", &ctrl->shift);
-	if (rc < 0)
-		return rc;
-
-	ctrl->mask <<= ctrl->shift;
-
-	return 0;
-}
-
-static int aspeed_bmc_misc_parse_dt(struct aspeed_bmc_misc *bmc,
-				    struct device_node *parent)
-{
-	struct aspeed_bmc_ctrl *ctrl;
-	struct device_node *child;
-	int rc;
-
-	bmc->nr_ctrls = of_get_child_count(parent);
-	bmc->ctrls = devm_kcalloc(bmc->dev, bmc->nr_ctrls, sizeof(*bmc->ctrls),
-				  GFP_KERNEL);
-	if (!bmc->ctrls)
-		return -ENOMEM;
-
-	ctrl = bmc->ctrls;
-	for_each_child_of_node(parent, child) {
-		rc = aspeed_bmc_misc_parse_dt_child(child, ctrl++);
-		if (rc < 0) {
-			of_node_put(child);
-			return rc;
-		}
-	}
-
-	return 0;
-}
-
-static ssize_t aspeed_bmc_misc_show(struct kobject *kobj,
-				    struct kobj_attribute *attr, char *buf)
-{
-	struct aspeed_bmc_ctrl *ctrl;
-	unsigned int val;
-	int rc;
-
-	ctrl = container_of(attr, struct aspeed_bmc_ctrl, attr);
-	rc = regmap_read(ctrl->map, ctrl->offset, &val);
-	if (rc)
-		return rc;
-
-	val &= ctrl->mask;
-	val >>= ctrl->shift;
-
-	return sprintf(buf, "%u\n", val);
-}
-
-static ssize_t aspeed_bmc_misc_store(struct kobject *kobj,
-				     struct kobj_attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct aspeed_bmc_ctrl *ctrl;
-	long val;
-	int rc;
-
-	rc = kstrtol(buf, 0, &val);
-	if (rc)
-		return rc;
-
-	ctrl = container_of(attr, struct aspeed_bmc_ctrl, attr);
-	val <<= ctrl->shift;
-	rc = regmap_update_bits(ctrl->map, ctrl->offset, ctrl->mask, val);
-
-	return rc < 0 ? rc : count;
-}
-
-static int aspeed_bmc_misc_add_sysfs_attr(struct aspeed_bmc_misc *bmc,
-					  struct aspeed_bmc_ctrl *ctrl)
-{
-	ctrl->map = bmc->map;
-
-	sysfs_attr_init(&ctrl->attr.attr);
-	ctrl->attr.attr.name = ctrl->name;
-	ctrl->attr.attr.mode = 0664;
-	ctrl->attr.show = aspeed_bmc_misc_show;
-	ctrl->attr.store = aspeed_bmc_misc_store;
-
-	return sysfs_create_file(&bmc->dev->kobj, &ctrl->attr.attr);
-}
-
-static int aspeed_bmc_misc_populate_sysfs(struct aspeed_bmc_misc *bmc)
-{
-	int rc;
-	int i;
-
-	for (i = 0; i < bmc->nr_ctrls; i++) {
-		rc = aspeed_bmc_misc_add_sysfs_attr(bmc, &bmc->ctrls[i]);
-		if (rc < 0)
-			return rc;
-	}
-
-	return 0;
-}
-
-static int aspeed_bmc_misc_probe(struct platform_device *pdev)
-{
-	struct aspeed_bmc_misc *bmc;
-	int rc;
-
-	bmc = devm_kzalloc(&pdev->dev, sizeof(*bmc), GFP_KERNEL);
-	if (!bmc)
-		return -ENOMEM;
-
-	bmc->dev = &pdev->dev;
-	bmc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
-	if (IS_ERR(bmc->map))
-		return PTR_ERR(bmc->map);
-
-	rc = aspeed_bmc_misc_parse_dt(bmc, pdev->dev.of_node);
-	if (rc < 0)
-		return rc;
-
-	return aspeed_bmc_misc_populate_sysfs(bmc);
-}
-
-static const struct of_device_id aspeed_bmc_misc_match[] = {
-	{ .compatible = "aspeed,bmc-misc" },
-	{ },
-};
-
-static struct platform_driver aspeed_bmc_misc = {
-	.driver = {
-		.name		= DEVICE_NAME,
-		.of_match_table = aspeed_bmc_misc_match,
-	},
-	.probe = aspeed_bmc_misc_probe,
-};
-
-module_platform_driver(aspeed_bmc_misc);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
-- 
2.29.2

