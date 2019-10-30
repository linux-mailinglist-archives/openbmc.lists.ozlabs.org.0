Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00431E9684
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 07:42:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472zQG4tdnzF1r1
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 17:41:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cfubxFSL"; 
 dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472zCr232HzF3Wx
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:56 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id p12so778794pgn.6
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 23:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iDMyEbE5ColevdJEwW59F/OD86x49Mmi6aNDASg5oYY=;
 b=cfubxFSLY9FNpQzSTVgeKs3vEJKqFudxuDqNw6yKaPhcAfUZIUdokkbtyXotHUjaMu
 wpGC3bs5gTHiIKUGgxpohOuF0gB0PpvmOYynI9wo+neDLWV6islQjQEl/vNAHyeVMjIr
 hOA7Um/wBbqirNU39V09J/8a6EJ88ZuO/twYWs5/TsSZWhw4VcWWANLROudbPbG0ggSz
 cKRl/QW0b91sqv3+bH3BThu3m0HWhgdEnx2a6tZD1Sd6w/xaO2/8/hLrdiTiY+WXZShU
 T2WJcAm8kcUyEsYwlhLg1qfJUyySJq0qaRs6wwVNYq282+qCVmrrt5xKIhX1B+E5i7px
 P3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iDMyEbE5ColevdJEwW59F/OD86x49Mmi6aNDASg5oYY=;
 b=sbT5CsXiYBBzpYD6LB3tf3EeJAO6/DjhbKKxDS4Iz7IP3q6GUtvnTBdPJHSxFoG5+f
 CxQHIto0/oZytPBmhXWsc5JbhcvouAmRgPlgONyYxxx7Jog65BNLNFN1Ozr5ywHpJ7FZ
 nZnvAKAaAQuabGRl145b1LlrF9An0VOvgzVVHMfnQG6AVuDTph8bUlcKsMk2f0RslukI
 FPPO1Rg1gGMp8zEyrYRR+rHS/z9oqGnQFlcdeM4WuCMBTMNN7Pmng+i/A8TuH++ZyQPY
 c4+J1ei+P4Ns6Z5zDytftPHQJgszWmF3aWahIWDbSn8U55p6TAZZYxJfXYehQVjSdeSp
 ozjg==
X-Gm-Message-State: APjAAAUIBvJoiK4LmEM8T7L1m6gg54ptd/2DmliPusw3/rFzsRuwi/QW
 f7wC5tTmYCsZ7FvebWf29Dqdii3NEX8=
X-Google-Smtp-Source: APXvYqzR5wz4nS7MVREyXyVXxDjmFeOZHNakAn3vBdzELQQwTbIliSF6g6GnIM9TL/dTQ1sXagj4Jw==
X-Received: by 2002:a17:90a:178e:: with SMTP id
 q14mr323477pja.134.1572417173701; 
 Tue, 29 Oct 2019 23:32:53 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i102sm1028018pje.17.2019.10.29.23.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 23:32:53 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot aspeed-dev-v2019.04 7/7] cmd: Add FSI command
Date: Wed, 30 Oct 2019 17:02:25 +1030
Message-Id: <20191030063225.11319-8-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030063225.11319-1-joel@jms.id.au>
References: <20191030063225.11319-1-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This allows a user to issue breaks, and read and write CFAM (remote FSI)
addresses.

The master to use on the command line can be selected from the probe
command.

 # fsi probe 0
 # fsi break

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 cmd/Kconfig  |   6 ++
 cmd/Makefile |   1 +
 cmd/fsi.c    | 153 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 cmd/fsi.c

diff --git a/cmd/Kconfig b/cmd/Kconfig
index 68afd06b101e..221a07eed5a6 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -692,6 +692,12 @@ config CMD_FDC
 	help
 	  The 'fdtboot' command allows booting an image from a floppy disk.
 
+config CMD_FSI
+	bool "fsi - use FSI master"
+	depends on ASPEED_FSI
+	help
+	 The 'fsi' command allows use of the FSI master present in ASPEED SoCs
+
 config CMD_FLASH
 	bool "flinfo, erase, protect"
 	default y
diff --git a/cmd/Makefile b/cmd/Makefile
index 493f241f39d6..05bc0410d5d1 100644
--- a/cmd/Makefile
+++ b/cmd/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_CMD_FLASH) += flash.o
 obj-$(CONFIG_CMD_FPGA) += fpga.o
 obj-$(CONFIG_CMD_FPGAD) += fpgad.o
 obj-$(CONFIG_CMD_FS_GENERIC) += fs.o
+obj-$(CONFIG_CMD_FSI) += fsi.o
 obj-$(CONFIG_CMD_FUSE) += fuse.o
 obj-$(CONFIG_CMD_GETTIME) += gettime.o
 obj-$(CONFIG_CMD_GPIO) += gpio.o
diff --git a/cmd/fsi.c b/cmd/fsi.c
new file mode 100644
index 000000000000..7dacf7957961
--- /dev/null
+++ b/cmd/fsi.c
@@ -0,0 +1,153 @@
+#include <common.h>
+#include <command.h>
+#include <aspeed_fsi.h>
+#include <dm/device.h>
+#include <dm/uclass.h>
+
+struct fsi_master_aspeed *fsi;
+
+static void do_break(void)
+{
+	debug("%s\n", __func__);
+	aspeed_fsi_break(fsi, 0);
+}
+
+static void do_status(void)
+{
+	debug("%s\n", __func__);
+	aspeed_fsi_status(fsi);
+}
+
+static void do_getcfam(int argc, char *const argv[])
+{
+	int rc;
+	uint32_t addr, val;
+
+	if (argc != 3) {
+		printf("invalid arguments to getcfam\n");
+		return;
+	}
+
+	addr = simple_strtoul(argv[2], NULL, 16);
+
+	debug("%s %08x\n", __func__, addr);
+	rc = aspeed_fsi_read(fsi, 0, addr, &val, 4);
+	if (rc) {
+		printf("error reading: %d\n", rc);
+		return;
+	}
+
+	printf("0x%08x\n", be32_to_cpu(val));
+}
+
+static void do_putcfam(int argc, char *const argv[])
+{
+	int rc;
+	uint32_t addr, val;
+
+	if (argc != 4) {
+		printf("invalid arguments to putcfam\n");
+		return;
+	}
+
+	addr = simple_strtoul(argv[2], NULL, 16);
+	val = simple_strtoul(argv[3], NULL, 16);
+
+	debug("%s %08x %08x\n", __func__, addr, val);
+	rc = aspeed_fsi_write(fsi, 0, addr, &val, 4);
+	if (rc)
+		printf("error writing: %d\n", rc);
+}
+
+static void do_divisor(int argc, char *const argv[])
+{
+	int rc;
+	uint32_t val;
+
+	if (argc == 2) {
+		rc = aspeed_fsi_divisor(fsi, 0);
+		if (rc > 0)
+			printf("divsior: %d (%d MHz)\n", rc, rc * 166);
+	} else if (argc == 3) {
+		val = simple_strtoul(argv[2], NULL, 16);
+		rc = aspeed_fsi_divisor(fsi, val);
+	} else {
+		printf("invalid arguments to divisor\n");
+		return;
+	}
+
+	if (rc < 0)
+		printf("divisor error: %d\n", rc);
+}
+
+static struct fsi_master_aspeed *do_probe(int argc, char *const argv[])
+{
+	struct udevice *dev;
+	const char *devices[] = {"fsi@1e79b000", "fsi@1e79b100"};
+	int rc, id;
+
+	if (argc > 3) {
+		printf("invalid arguments to probe\n");
+		return NULL;
+	}
+
+	if (argc == 2)
+		id = 0;
+	else
+		id = simple_strtoul(argv[2], NULL, 10);
+
+	if (id > 1) {
+		printf("valid devices: 0, 1\n");
+		return NULL;
+	}
+
+	rc = uclass_get_device_by_name(UCLASS_MISC, devices[id], &dev);
+	if (rc) {
+		printf("fsi device %s not found\n", devices[id]);
+		return NULL;
+	}
+	return dev_get_priv(dev);
+}
+
+
+static int do_fsi(cmd_tbl_t *cmdtp, int flag, int argc, char *const argv[])
+{
+
+	if (!strcmp(argv[1], "probe")) {
+		fsi = do_probe(argc, argv);
+		return 0;
+	}
+
+	if (fsi == NULL) {
+		printf("Run probe first\n");
+		return -EINVAL;
+	}
+
+	if (!strcmp(argv[1], "break"))
+		do_break();
+	else if (!strcmp(argv[1], "status"))
+		do_status();
+	else if (!strncmp(argv[1], "put", 3))
+		do_putcfam(argc, argv);
+	else if (!strncmp(argv[1], "get", 3))
+		do_getcfam(argc, argv);
+	else if (!strncmp(argv[1], "div", 3))
+		do_divisor(argc, argv);
+
+	return 0;
+}
+
+static char fsi_help_text[] =
+	"fsi probe [<n>]\n"
+	"fsi break\n"
+	"fsi getcfam <addr>\n"
+	"fsi putcfam <addr> <value>\n"
+	"fsi divisor [<divisor>]\n"
+	"fsi status\n";
+
+U_BOOT_CMD(
+	fsi, 4, 1, do_fsi,
+	"IBM FSI commands",
+	fsi_help_text
+);
+
-- 
2.23.0

