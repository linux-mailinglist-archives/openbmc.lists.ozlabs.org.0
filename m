Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03794A300D
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 15:34:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmH084K0vz3bV6
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 01:34:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Hgl5Mpeq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Hgl5Mpeq; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmGzm0hNYz30LP
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 01:34:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643466832;
 bh=taC2dJ+Qss3OD09RIyTYnVy9WqLukbC51BxQLCbK8TU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Hgl5MpeqgmQGPgcIyTgcxiKqh2UDYBJcoCo6gqwRtq6l+0q/DqLJ5y2O169AusO7y
 Gdqlj2LK4vw18tSv5FBMMdzz/2Jlnm/0iy9WM4Kkc6F6Tp7O37kTmSVMk5kkfHhmh2
 MIOJlvy1e7qoKrApVgM5kjfNFZq+KzNR39Q43WWQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNp7-1mWpgb1rzR-00lm6m; Sat, 29
 Jan 2022 15:33:52 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] soc: nuvoton: Add SoC info driver for WPCM450
Date: Sat, 29 Jan 2022 15:33:07 +0100
Message-Id: <20220129143316.2321460-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G5UyEZgtCNbwbrQRFEb36mFglkcmK/qLhvzHOH1DipwTiYXP1ja
 5h0PCE2G/Z9CVN1syJr1WFwYpyg+8eK3TxZP7NDcn0M9z10N2wibKf4yMdh9B79NPFr9IpU
 sHXc+KHy+sTJja3jVhlvZsBSf9PZPZMLDWd7qaVm/TizztJfRHMFCmTAFhkWboDd1XSJzXP
 iH/HUf9MVgAtrPo+hpHVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sa3TxCkDkfk=:DUv+30ZLikV+PotVOxo6fH
 TCQW0Dtmt1u5HClvmap9cDIsEqSFkrEgpS9kBYL+5g/mjHmKUPdDT/Jhyf/zc1NHL13I3DZgL
 Nv2Cmq7Gj5MCR8GQdcumcOt5L77KOq46M/zsQeqfjtzibXjg3KsILwoD6mUmvSbyMiIqHajAN
 BCFthsMYdW1/tdjqqb8nAJfv4LF1Bno0mlZqnkdzrHkr3eESc1R29pZwXpF6H5akx3DmnWekC
 pCVUxK2t0hPscmYZq00hoNsQj+vwwV51kMoL4q3I4Ed9c3ymoUhwQhC5cYMZSnRE/Xqr5xn/E
 3MqJNkibCCDiscaQLrgBdyTKaPQ4AvqdzFdsLN5bsqm+1eHLKAk8Wk/Dlr8524ohmEUp9P0im
 RpK/W+bWbpRRHUEjJo1Kh6l5Z1L1tGex27OCMxsAqslQAnjHIk0a8eHIhowi3NdMXQKCbg0JW
 BzyXL/i8kOO1UX+sNh99rsActOyeKHKi5b8gLH4IZAOVna30oZBOGU6UtBVqIdGYHDF0s+Htg
 6z9C6Ny267bj3Vkx+NJ4I9fuLWWHNab6qj7B5vgvgxBSt0htmVqG4FlD976NsS1cFXJMdEZGE
 IBA9t+eYA1rLNSLQe3SqBn4g9ZCUy2iWQ8TXc+6XJqgg6xYfuchEF7USPU1iz90swE/60sZ93
 nPnci0O6lvoNl+dssprWFtoyMe952LUhPwgXZIiO9JM0SHFl21Nt2SM0bxyDMs32idzTR7LFt
 ltDecTsvceSbSUOEOjO7RoBhcgyr2H80Q4/yp0doPxqJjrIAVa8jdwpAFtTyU9/Y0PjDda1XT
 cHJml5outm1/SPe6pijyZflSxoGzWmCTacisZcVm4iJbj1yLyY8vrutphCGHdwxIPPv6FKQ4/
 dopAehKmovRBGyrXEZZN5vgpwBTuqmIdCRm/wZXA4wRo60dFQUc6sRX78SZ4tPHoLKHZsav8t
 jtrC9s45FEh66KabX6PKr0Exnf/ndG/pC0/D6a6Io2xl8a6RHg6IlNEy7m31hBMBRoWfcNm9l
 Ta1ZYOJqMGuZYMWeaYpqlfdNl8e2vW5UbzKE51xJYla2cz6Vjsju3wKWEqPh/elHCpFLil8yB
 4wbaoL21CsjBUA=
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Hector Martin <marcan@marcan.st>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
information such as the SoC revision.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

The "nuvoton,wpcm450-gcr" compatible string is defined in:

  [PATCH v5 1/9] dt-bindings: arm/npcm: Add binding for global control reg=
isters (GCR)
  https://lore.kernel.org/lkml/20220129115228.2257310-2-j.neuschaefer@gmx.=
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
index a8562678c4370..310c7e3a17723 100644
=2D-- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -13,6 +13,7 @@ source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
 source "drivers/soc/mediatek/Kconfig"
+source "drivers/soc/nuvoton/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index adb30c2d4feaa..f02c9b091a513 100644
=2D-- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -18,6 +18,7 @@ obj-y				+=3D ixp4xx/
 obj-$(CONFIG_SOC_XWAY)		+=3D lantiq/
 obj-$(CONFIG_LITEX_SOC_CONTROLLER) +=3D litex/
 obj-y				+=3D mediatek/
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
index 0000000000000..e5723d6c933bc
=2D-- /dev/null
+++ b/drivers/soc/nuvoton/wpcm450-soc.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton WPCM450 SoC Identification
+ *
+ * Copyright (C) 2021 Jonathan Neusch=C3=A4fer
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/sys_soc.h>
+#include <linux/slab.h>
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
+const struct revision revisions[] __initconst =3D {
+	{ 0x00, "Z1" },
+	{ 0x03, "Z2" },
+	{ 0x04, "Z21" },
+	{ 0x08, "A1" },
+	{ 0x09, "A2" },
+	{ 0x0a, "A3" },
+	{}
+};
+
+static const char * __init get_revision(u8 rev)
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
2.34.1

