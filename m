Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB0502B88
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 16:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfyvX1DKJz3bZ2
	for <lists+openbmc@lfdr.de>; Sat, 16 Apr 2022 00:12:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=d+WBB9M0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=d+WBB9M0; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfyv33StPz3bVH
 for <openbmc@lists.ozlabs.org>; Sat, 16 Apr 2022 00:11:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650031890;
 bh=FVeV8fRQHg/l9j7MMZZioJ6C+2EQYa5pGctCmzj3fSg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=d+WBB9M0rIAasXrFsmgdjUS/5/+sPbqJ0JWHY9PjN9asftIAaOPozxy3V4zcba7hy
 fZLx/oKzuGuYSsGSACPhChQpUiMj8NS0P8tqRgxTDteqTVOw+rdDWoQdVgXh9FV+TW
 M7GHl5EYjsJKAM4YV0CpD6zYVsmumbcGxemWuaMI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([185.66.193.41]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsIv-1nyP9p2UYZ-00szkf; Fri, 15
 Apr 2022 16:11:30 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v3] soc: nuvoton: Add SoC info driver for WPCM450
Date: Fri, 15 Apr 2022 16:09:55 +0200
Message-Id: <20220415141006.782970-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s6bpKdaaDP3E4GZbrEirTXF+IIw09S517u80majvtwFSucAVftT
 7cNYwcb9NOhIRYryPPMd2KeMjJjE82NZmIFV2lgfiM/ATizTincjxfS2hv63ESZ7x/89kiN
 q4dMWI6jRiBljtI9ebCccuHdsAcKuezOAPryCQLjOBCUKT6jPuKABaeZyKGCdZtVVzdWGJ7
 rUQbWJsLHeJ+8Ha412KcQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1oLVgit9Gbw=:pgC1uRR7vDruDmkOX4qvQL
 sJVIcEpFoJDRlGX1f77zsX3+JBbJ4cGG40lmHf9wwvbfIDRcyk9LMJzduOb6zK5EO89YypapV
 +11OEBQ+lYMKdWm8CANfFhGDAGG5pr/mXcVw3HyqrQu5PkePiohODDiEH6ZHZVWLHXVeQIqT7
 4Q+NcuDdQCajK5u9taOwwke9no/eKDu9T7s2VQ355CaRVAvwI6zXLKfw7z1TWfVNPgbMM/SKK
 +Ru/Ni23FERJ+UI2kOLy6Ktrmgf2h6NhHVRi2XfEWcXCUenLjTZ1R/wIMEcDaMv8VrdqP7bwM
 isL6bvEIGjrYzojyXl9lxnpj61d3EymiLq122pSoB3281wHxcxpR60bDUF2aax3eS4jshBmi/
 NNiGUAUIb3cokcKI1KMjt7PvBpwH97fOtAhfmvXtUqQ63n2Ocr+E4KNxo8XSajdcWx7Gzy+fu
 pBOVd38MBvDscNEtWVKAbn/9VVS+tN6cU1X4cQjSscF8n9QPSloSWWBlU7hYQpcRNFTdsrj7+
 FwmUGVaMRSmPKW9A1mgB7OcDcVnlPHG5j3UrN8+GOD2jQGV7+vSM4mZlT1lVFeW8Xt0A1D1OI
 TaiEjuFF5tT+Vd8C73nDmreJBNcnpILZDXHqjrpDVw+HF1fMoZdRSqfkXgaoS4zV3ZBpDHa7f
 bZ/hZYvmPd0j7jB28BmN9ELsGT5rKx+2msWw1klE9+qfPBuuhl3H6wvCoPPzgd+Btn9qp6HNb
 NGgOjLWjCzBbLxzVlzVgAQ1IkuY3lWCidqWdJrOJIlzQVtFN9ZXRVWHWBQE0l85Gap1WmBFZv
 CXK3ikTFS8izFVtjQW1pkFxleW9Fn4EcYI7IklXrqFfMoed8Wf23vp4ct1WNSyt9bcEOBew6C
 XOHz9sUQw6mbf8piJ9IiX8CzS4pLY6EmcDKJJyv/MW5pLXWtTuFPo33DLWaglwQZAMFyYisCG
 fY/fYjpU/30D/JcRmW7OxGEe0kBpwOKwIM3SMFJgaMqTYZ7YOpBqBQXSPoxARilOo6+oAKB1Z
 e39cSkIvVvY4ex61ahh1m1k4cG55eovWGv0SM/LErpwBPBASh1+0lTPlg2geTh05F0eFgX3kQ
 U3tCEtVqKpe7NM=
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Hector Martin <marcan@marcan.st>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Conor Dooley <conor.dooley@microchip.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
information such as the SoC revision.

Usage example:

  # grep . /sys/devices/soc0/*
  /sys/devices/soc0/family:Nuvoton NPCM
  /sys/devices/soc0/revision:A3
  /sys/devices/soc0/soc_id:WPCM450

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
=2D--
v3:
- Declare revisions array as static
- Change get_revision parameter to `unsigned int`
- Add Paul's R-b tag
- Add usage example
- Sort includes

v2:
- https://lore.kernel.org/lkml/20220409173319.2491196-1-j.neuschaefer@gmx.=
net/
- Add R-b tag
- rebase on 5.18-rc1

v1:
- https://lore.kernel.org/lkml/20220129143316.2321460-1-j.neuschaefer@gmx.=
net/
=2D--
 drivers/soc/Kconfig               |  1 +
 drivers/soc/Makefile              |  1 +
 drivers/soc/nuvoton/Kconfig       | 11 ++++
 drivers/soc/nuvoton/Makefile      |  2 +
 drivers/soc/nuvoton/wpcm450-soc.c | 90 +++++++++++++++++++++++++++++++
 5 files changed, 105 insertions(+)
 create mode 100644 drivers/soc/nuvoton/Kconfig
 create mode 100644 drivers/soc/nuvoton/Makefile
 create mode 100644 drivers/soc/nuvoton/wpcm450-soc.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index c5aae42673d3b..42a5e0be77f3d 100644
=2D-- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -14,6 +14,7 @@ source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
 source "drivers/soc/mediatek/Kconfig"
 source "drivers/soc/microchip/Kconfig"
+source "drivers/soc/nuvoton/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 904eec2a78713..3239fc49eeb27 100644
=2D-- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_SOC_XWAY)		+=3D lantiq/
 obj-$(CONFIG_LITEX_SOC_CONTROLLER) +=3D litex/
 obj-y				+=3D mediatek/
 obj-y				+=3D microchip/
+obj-y				+=3D nuvoton/
 obj-y				+=3D amlogic/
 obj-y				+=3D qcom/
 obj-y				+=3D renesas/
diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
new file mode 100644
index 0000000000000..50166f37096b7
=2D-- /dev/null
+++ b/drivers/soc/nuvoton/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+menuconfig WPCM450_SOC
+	bool "Nuvoton WPCM450 SoC driver"
+	default y if ARCH_WPCM450
+	select SOC_BUS
+	help
+	  Say Y here to compile the SoC information driver for Nuvoton
+	  WPCM450 SoCs.
+
+	  This driver provides information such as the SoC model and
+	  revision.
diff --git a/drivers/soc/nuvoton/Makefile b/drivers/soc/nuvoton/Makefile
new file mode 100644
index 0000000000000..e30317b4e8290
=2D-- /dev/null
+++ b/drivers/soc/nuvoton/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_WPCM450_SOC)	+=3D wpcm450-soc.o
diff --git a/drivers/soc/nuvoton/wpcm450-soc.c b/drivers/soc/nuvoton/wpcm4=
50-soc.c
new file mode 100644
index 0000000000000..9ff876ea71361
=2D-- /dev/null
+++ b/drivers/soc/nuvoton/wpcm450-soc.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton WPCM450 SoC Identification
+ *
+ * Copyright (C) 2022 Jonathan Neusch=C3=A4fer
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+#define GCR_PDID	0
+#define PDID_CHIP(x)	((x) & 0x00ffffff)
+#define CHIP_WPCM450	0x926450
+#define PDID_REV(x)	((x) >> 24)
+
+struct revision {
+	u8 number;
+	const char *name;
+};
+
+static const struct revision revisions[] __initconst =3D {
+	{ 0x00, "Z1" },
+	{ 0x03, "Z2" },
+	{ 0x04, "Z21" },
+	{ 0x08, "A1" },
+	{ 0x09, "A2" },
+	{ 0x0a, "A3" },
+	{}
+};
+
+static const char * __init get_revision(unsigned int rev)
+{
+	int i;
+
+	for (i =3D 0; revisions[i].name; i++)
+		if (revisions[i].number =3D=3D rev)
+			return revisions[i].name;
+	return NULL;
+}
+
+static int __init wpcm450_soc_init(void)
+{
+	struct soc_device_attribute *attr;
+	struct soc_device *soc;
+	const char *revision;
+	struct regmap *gcr;
+	u32 pdid;
+	int ret;
+
+	if (!of_machine_is_compatible("nuvoton,wpcm450"))
+		return 0;
+
+	gcr =3D syscon_regmap_lookup_by_compatible("nuvoton,wpcm450-gcr");
+	if (IS_ERR(gcr))
+		return PTR_ERR(gcr);
+	ret =3D regmap_read(gcr, GCR_PDID, &pdid);
+	if (ret)
+		return ret;
+
+	if (PDID_CHIP(pdid) !=3D CHIP_WPCM450) {
+		pr_warn("Unknown chip ID in GCR.PDID: 0x%06x\n", PDID_CHIP(pdid));
+		return -ENODEV;
+	}
+
+	revision =3D get_revision(PDID_REV(pdid));
+	if (!revision) {
+		pr_warn("Unknown chip revision in GCR.PDID: 0x%02x\n", PDID_REV(pdid));
+		return -ENODEV;
+	}
+
+	attr =3D kzalloc(sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		return -ENOMEM;
+
+	attr->family =3D "Nuvoton NPCM";
+	attr->soc_id =3D "WPCM450";
+	attr->revision =3D revision;
+	soc =3D soc_device_register(attr);
+	if (IS_ERR(soc)) {
+		kfree(attr);
+		pr_warn("Could not register SoC device\n");
+		return PTR_ERR(soc);
+	}
+
+	return 0;
+}
+device_initcall(wpcm450_soc_init);
=2D-
2.35.1

