Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD03A1667C
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 07:00:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05S0hLvz3vxM
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:58:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737107084;
	cv=none; b=WYeIYTPT+dZ3u+3OPVCOESRtG3fwlj5BNeJpu3WjA5QYygIf6pxffOBcgeUHFfYpaCiPU3jOXJ1ha86RUfV65jQGunPcm0/Ez0dObGRdbQ1ARfd2BvET/89i0wBlKlHTsj0JAelY2WHjqCUjgrFb2Avw7U6NbARUmboPVbxUY8OykH/XpLvjNmm5WKRU7ubBoM6jpcavbDKfdkF6CZAsPiK/WP7RnFgDRnGJ5SiL1/9yHHdbsaapNa7Vd36tJ8UO4PSP8RE0tm+TOHsnomIrHpnpeqtwTnJs4rreccCxKLD4mXId+2+9iTCG8FS60N4SopZWQUrUJ5atQOfwviGnNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737107084; c=relaxed/relaxed;
	bh=5JDd3lk5fh5665c2pI7RPNZYQcXzXxrEwx7ofAHJiLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJH0UED2EPSuHFKNurTZ49RncuNw08ScteM9U84UYap/jX41CFTq5+TGXWYw5XNpJPad04Ayd6ocNsozEVrcIp2oxBvJ43dUla+kktFr1ebqPdrFFDmrLx16W6EABXOebU9NdJ+XdbI8UVuYEzIH3Tm8b3MXdbRsA4wfxpc7WvdM5QKr4ScsGq/LjBt2C+Pl2cJRiHfiYnsPS+oO8dvyPU+b9VdlzScxj3TPqktX0q3C3p4oP+otOuOjsQ1ABiE/n5x3BwJwR6nqZ12hVyzc/F29AZwQ4Lent1K6hleQnFmTyhtCQvBg07GhLJpapLTSw8FUf18v4Yh6DwWzd2KgbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=wASk9zzK; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=wASk9zzK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZFFL4cl6z3cjL
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 20:44:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References
	:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=5JDd3lk5fh5665c2pI7RPNZYQcXzXxrEwx7ofAHJiLI=; b=wASk9z
	zKJMhR4cjG0F4k3TzsfRbWkB1xIcoI+xUJ7+r3GklCMtD1gNc2t8+8+6utNTWXnHoZV5JXRnD9sdS
	282p5f+E4MzHIT6eaCeQw/VWNDmeXu9UerqwZxk0U6U2G/9E135FJev0ykU8W/FmBefMTKecIc/dp
	cBeMfLVylkjAinJcvKHedCQdxKxWz3wbsroJ+khzrxXYRiZiIIPIsblNpRMdJu/Y7VEQU4AcZ/Dsi
	3EbygRBdaUBQx81SfdyIXyBZbT+orPZUdQtZoWHJ2qM59i0NNvqKxRYNghdaW/eA/DhFzNoYS+dke
	w3bQ/0ghsFp4TAgvcugUYeAKXuuA==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu3-000A1S-CY; Fri, 17 Jan 2025 10:44:35 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 05/12] common: Move old EEPROM functions into a new header
Date: Fri, 17 Jan 2025 10:44:24 +0100
Message-ID: <20250117094434.16641-6-tan.siewert@hetzner.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250117094434.16641-1-tan.siewert@hetzner.com>
References: <20250117094434.16641-1-tan.siewert@hetzner.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: tom.siewert@hetzner.com
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 20 Jan 2025 16:58:31 +1100
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
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, Tan Siewert <tan.siewert@hetzner.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Simon Glass <sjg@chromium.org>

These functions do not use driver model but are still used. Move them to a
new eeprom.h header file.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Tom Rini <trini@konsulko.com>
(cherry picked from commit cb3ef6810a27c8ddf5db8694bcef9337f27d12ce)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 board/atmel/common/mac_eeprom.c               |  1 +
 board/compulab/common/eeprom.c                |  1 +
 board/corscience/tricorder/tricorder-eeprom.c |  1 +
 board/dhelectronics/dh_imx6/dh_imx6.c         |  1 +
 board/freescale/mpc8323erdb/mpc8323erdb.c     |  1 +
 board/kosagi/novena/novena.c                  |  1 +
 board/phytec/phycore_rk3288/phycore-rk3288.c  |  1 +
 board/rockchip/tinker_rk3288/tinker-rk3288.c  |  1 +
 board/samtec/vining_fpga/socfpga.c            |  1 +
 board/ti/am43xx/board.c                       |  1 +
 board/ti/ks2_evm/board_k2g.c                  |  1 +
 cmd/eeprom.c                                  |  1 +
 drivers/misc/i2c_eeprom.c                     |  1 +
 drivers/mtd/mw_eeprom.c                       |  1 +
 drivers/rtc/rv3029.c                          |  1 +
 env/eeprom.c                                  |  1 +
 include/common.h                              | 15 ------------
 include/eeprom.h                              | 24 +++++++++++++++++++
 18 files changed, 40 insertions(+), 15 deletions(-)
 create mode 100644 include/eeprom.h

diff --git a/board/atmel/common/mac_eeprom.c b/board/atmel/common/mac_eeprom.c
index 7ff1ec7462f..5a4e45793a0 100644
--- a/board/atmel/common/mac_eeprom.c
+++ b/board/atmel/common/mac_eeprom.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <eeprom.h>
 #include <environment.h>
 #include <i2c_eeprom.h>
 #include <netdev.h>
diff --git a/board/compulab/common/eeprom.c b/board/compulab/common/eeprom.c
index a2e386f67de..1e21edcd5a8 100644
--- a/board/compulab/common/eeprom.c
+++ b/board/compulab/common/eeprom.c
@@ -7,6 +7,7 @@
  */
 
 #include <common.h>
+#include <eeprom.h>
 #include <i2c.h>
 #include <eeprom_layout.h>
 #include <eeprom_field.h>
diff --git a/board/corscience/tricorder/tricorder-eeprom.c b/board/corscience/tricorder/tricorder-eeprom.c
index 16bceea7ba7..46e9119d66e 100644
--- a/board/corscience/tricorder/tricorder-eeprom.c
+++ b/board/corscience/tricorder/tricorder-eeprom.c
@@ -5,6 +5,7 @@
  * Andreas Bießmann <andreas.biessmann@corscience.de>
  */
 #include <common.h>
+#include <eeprom.h>
 #include <i2c.h>
 
 #include "tricorder-eeprom.h"
diff --git a/board/dhelectronics/dh_imx6/dh_imx6.c b/board/dhelectronics/dh_imx6/dh_imx6.c
index f9ac5c10e1d..2457b9b0e51 100644
--- a/board/dhelectronics/dh_imx6/dh_imx6.c
+++ b/board/dhelectronics/dh_imx6/dh_imx6.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <eeprom.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/crm_regs.h>
 #include <asm/arch/imx-regs.h>
diff --git a/board/freescale/mpc8323erdb/mpc8323erdb.c b/board/freescale/mpc8323erdb/mpc8323erdb.c
index 772688186b5..276e8cb3ef9 100644
--- a/board/freescale/mpc8323erdb/mpc8323erdb.c
+++ b/board/freescale/mpc8323erdb/mpc8323erdb.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <eeprom.h>
 #include <ioports.h>
 #include <mpc83xx.h>
 #include <i2c.h>
diff --git a/board/kosagi/novena/novena.c b/board/kosagi/novena/novena.c
index 9f2586521d4..72337069f4a 100644
--- a/board/kosagi/novena/novena.c
+++ b/board/kosagi/novena/novena.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <eeprom.h>
 #include <linux/errno.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
diff --git a/board/phytec/phycore_rk3288/phycore-rk3288.c b/board/phytec/phycore_rk3288/phycore-rk3288.c
index ffe1833b06b..1d741533010 100644
--- a/board/phytec/phycore_rk3288/phycore-rk3288.c
+++ b/board/phytec/phycore_rk3288/phycore-rk3288.c
@@ -4,6 +4,7 @@
  * Author: Wadim Egorov <w.egorov@phytec.de>
  */
 
+#include <eeprom.h>
 #include <asm/io.h>
 #include <common.h>
 #include <dm.h>
diff --git a/board/rockchip/tinker_rk3288/tinker-rk3288.c b/board/rockchip/tinker_rk3288/tinker-rk3288.c
index 44f13183a5b..6363bb9e7b8 100644
--- a/board/rockchip/tinker_rk3288/tinker-rk3288.c
+++ b/board/rockchip/tinker_rk3288/tinker-rk3288.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <eeprom.h>
 #include <environment.h>
 #include <i2c_eeprom.h>
 #include <netdev.h>
diff --git a/board/samtec/vining_fpga/socfpga.c b/board/samtec/vining_fpga/socfpga.c
index d99aac68287..c1d022c4470 100644
--- a/board/samtec/vining_fpga/socfpga.c
+++ b/board/samtec/vining_fpga/socfpga.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <eeprom.h>
 #include <environment.h>
 #include <asm/arch/reset_manager.h>
 #include <asm/io.h>
diff --git a/board/ti/am43xx/board.c b/board/ti/am43xx/board.c
index e0cf0ecde6f..42d3d8689fa 100644
--- a/board/ti/am43xx/board.c
+++ b/board/ti/am43xx/board.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <eeprom.h>
 #include <environment.h>
 #include <i2c.h>
 #include <linux/errno.h>
diff --git a/board/ti/ks2_evm/board_k2g.c b/board/ti/ks2_evm/board_k2g.c
index 39a782e4796..6d2c5f2c35f 100644
--- a/board/ti/ks2_evm/board_k2g.c
+++ b/board/ti/ks2_evm/board_k2g.c
@@ -6,6 +6,7 @@
  *     Texas Instruments Incorporated, <www.ti.com>
  */
 #include <common.h>
+#include <eeprom.h>
 #include <asm/arch/clock.h>
 #include <asm/ti-common/keystone_net.h>
 #include <asm/arch/psc_defs.h>
diff --git a/cmd/eeprom.c b/cmd/eeprom.c
index 6c29b33ba34..0cc653db40c 100644
--- a/cmd/eeprom.c
+++ b/cmd/eeprom.c
@@ -22,6 +22,7 @@
 #include <common.h>
 #include <config.h>
 #include <command.h>
+#include <eeprom.h>
 #include <i2c.h>
 #include <eeprom_layout.h>
 
diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index 8f2349ad5a7..3755dbf74bb 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <eeprom.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <dm.h>
diff --git a/drivers/mtd/mw_eeprom.c b/drivers/mtd/mw_eeprom.c
index f7791b51a04..6a3a6f67518 100644
--- a/drivers/mtd/mw_eeprom.c
+++ b/drivers/mtd/mw_eeprom.c
@@ -1,6 +1,7 @@
 /* Three-wire (MicroWire) serial eeprom driver (for 93C46 and compatibles) */
 
 #include <common.h>
+#include <eeprom.h>
 #include <asm/ic/ssi.h>
 
 /*
diff --git a/drivers/rtc/rv3029.c b/drivers/rtc/rv3029.c
index 38acb9c9924..23670627770 100644
--- a/drivers/rtc/rv3029.c
+++ b/drivers/rtc/rv3029.c
@@ -10,6 +10,7 @@
 #include <common.h>
 #include <command.h>
 #include <dm.h>
+#include <eeprom.h>
 #include <i2c.h>
 #include <rtc.h>
 
diff --git a/env/eeprom.c b/env/eeprom.c
index ac2689cc148..593743b8b01 100644
--- a/env/eeprom.c
+++ b/env/eeprom.c
@@ -9,6 +9,7 @@
 
 #include <common.h>
 #include <command.h>
+#include <eeprom.h>
 #include <environment.h>
 #include <linux/stddef.h>
 #if defined(CONFIG_I2C_ENV_EEPROM_BUS)
diff --git a/include/common.h b/include/common.h
index 2c21dee8505..eb453a50bd8 100644
--- a/include/common.h
+++ b/include/common.h
@@ -269,21 +269,6 @@ phys_size_t get_effective_memsize(void);
 void	reset_phy     (void);
 void	fdc_hw_init   (void);
 
-/* $(BOARD)/eeprom.c */
-#ifdef CONFIG_CMD_EEPROM
-void eeprom_init  (int bus);
-int  eeprom_read  (unsigned dev_addr, unsigned offset, uchar *buffer, unsigned cnt);
-int  eeprom_write (unsigned dev_addr, unsigned offset, uchar *buffer, unsigned cnt);
-#else
-/*
- * Some EEPROM code is depecated because it used the legacy I2C interface. Add
- * some macros here so we don't have to touch every one of those uses
- */
-#define eeprom_init(bus)
-#define eeprom_read(dev_addr, offset, buffer, cnt) ((void)-ENOSYS)
-#define eeprom_write(dev_addr, offset, buffer, cnt) ((void)-ENOSYS)
-#endif
-
 #if !defined(CONFIG_ENV_EEPROM_IS_ON_I2C) && defined(CONFIG_SYS_I2C_EEPROM_ADDR)
 # define CONFIG_SYS_DEF_EEPROM_ADDR CONFIG_SYS_I2C_EEPROM_ADDR
 #endif
diff --git a/include/eeprom.h b/include/eeprom.h
new file mode 100644
index 00000000000..61eb826a734
--- /dev/null
+++ b/include/eeprom.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * (C) Copyright 2000-2009
+ * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
+ */
+
+#ifndef __EEPROM_LEGACY_H
+#define __EEPROM_LEGACY_H
+
+#ifdef CONFIG_CMD_EEPROM
+void eeprom_init(int bus);
+int eeprom_read(uint dev_addr, uint offset, uchar *buffer, uint cnt);
+int eeprom_write(uint dev_addr, uint offset, uchar *buffer, uint cnt);
+#else
+/*
+ * Some EEPROM code is depecated because it used the legacy I2C interface. Add
+ * some macros here so we don't have to touch every one of those uses
+ */
+#define eeprom_init(bus)
+#define eeprom_read(dev_addr, offset, buffer, cnt) ((void)-ENOSYS)
+#define eeprom_write(dev_addr, offset, buffer, cnt) ((void)-ENOSYS)
+#endif
+
+#endif
-- 
2.47.0

