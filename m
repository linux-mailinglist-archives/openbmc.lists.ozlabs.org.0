Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D55D5618AA6
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 22:35:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3H9w5Pszz3cNX
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 08:35:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZtddkZuh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZtddkZuh;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3H9K3st3z3bdC
	for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2022 08:35:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667511277; bh=kzvI8y8uyM4os1o1QQC1oIapo3BRq4VS8eS4U1rhvTM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=ZtddkZuh3XHgOl8eSNEbAUrcTmwId+LG15klWehfO/WrvqNzcGNYuxdd4RYAeP6AR
	 /vKBkDajkJXj8BXobe+5IwaRLF9/8gMCZ8ZDT1WsEdGFumuR/JATy/w4KPPoKr37iB
	 xygbQff1BJdmbXhA0Zobt1biFtHk/INF8xs9mK3z3GhyP38RyAQuZZ2AsMX8SHA4r7
	 wCg5uBCtS+TbyPHonG73e8U0o9iEkiPKSwg3NgX80wJf72jGe2iG2zu1qvDIYP8Q0S
	 JkRUVSUQ0BeqfEnKWytcnMR4ff3PupAVkyd6+G67YHGMSFXVStt06dJyAiw+FZXAwA
	 amOnh5rktfkuw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.126.36]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyuc-1pCLTm3q0U-00x6sK; Thu, 03
 Nov 2022 22:34:37 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v6] soc: nuvoton: Add SoC info driver for WPCM450
Date: Thu,  3 Nov 2022 22:34:15 +0100
Message-Id: <20221103213420.1395507-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w29psqiulMSZj+SLdxY1H/PPfAOFhgD1+jy8eUUJFMbeDpzEN8m
 NIarEjQq2taE5HjOnkez9yoDksjdqN6slxeWdk70XzwxtMg8BJM0Jly3+7bxqzzl8bhWtoC
 Jj0oKAnBjZsv0B6MX/HyXcLJm3DYvRksuEXaw0psGlkX7rjYdvSsuSYCvQfTIfDzcMLcatq
 3XkqucMeXkuXeb3G4eLDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VPgmaCQTlTI=;iCu9aIj7cBcl8adXrHitFBPYnjm
 vm7s+PsxP824T1iTmcLDdsC/yxVqKnPyy3QqLDoWJY8guUey76BZbn4mYDdY9u0QR+7eBzmhu
 pQ23b/viv7/NLCG8PHq9/aQeIRTZg4pa/nV1yrRdQ4WZGXRH0OI8FYG4zAV2zfibc7zbUWzL4
 oOle8slvDST8OZIKjullfAHd7cVbHtL1JEWqV9aYi/IPumnyvoRWDUxiS1Ts0ng81oenn/hgA
 BvkoavxAPCAuzp6pdSSk7lCigRqnnxieYxP9mpe4fhQJsMUbrzLJiRNuFdytSdzau6cYog19P
 g3DHtjQik1VF5GLvB3/ND/sg4QHtSzC0+ozGfipZauSzLDXfWdvqmzf0++HSBo6195qsIuI6t
 7TULPM0waQOAqLuB3f/iTkpaBfjIHTKk+QVD4qWJL36Uw8NvAksf0RMYVXPtLD/JzPCduwfvo
 G2c0R7jsj7sLg7hh7QGaWrRsozHumyfbDJr77W8wQGQAWBTrMbxhuIxkb6jxHjrP+FqqtRQzW
 qRfh6qv4eIxp8m5jrP8x7SlPMFXLdq7GUTlVqGIdThidgCtQCtv6Yt8XenoI/psmv+UFLiAax
 YcHc1OqnAxBZhWG8DKLXd0lKTVVeScPu+RsTWq3KiQzl18heJzjStYmHs9HVfxZwzXV8Iqx75
 2hAGStN9pkqrcIe9aNHHULOzuN3L2v5GtOWA7MIoYwn3aLAXpW4Sgj03LXt9wuaal3FV8TNZT
 dR840+RuzWYXvlkaskqoeIs5Vi7VyX12RY8C47w7a06trBzaOvKfAvMgZ/3DZkXRUP5j0xwZL
 7ll2nQuKS3Gx56q6WC9R1A6ZihYPoKKA8kC5ObgH97GcBPDnm9JDbFOeZQN8EagmS9nRoK/jB
 XR5ZSErZnz04HIiqI1lKymGfyH4+5g+d1sv0FrLltuhieLKwBgyMED0+2Ok6YOanLifcTlZxI
 SKezQw==
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Paul Menzel <pmenzel@molgen.mpg.de>, Brian Norris <briannorris@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Hector Martin <marcan@marcan.st>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, Conor Dooley <conor.dooley@microchip.com>, Robert Jarzmik <robert.jarzmik@free.fr>
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
v6:
- Select REGMAP
- Rearrange Kconfig structure a bit

v5:
- Change Kconfig option from bool to tristate

v4:
- rebase on 5.19-rc1

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
 drivers/soc/Kconfig               |   1 +
 drivers/soc/Makefile              |   1 +
 drivers/soc/nuvoton/Kconfig       |  17 +++++
 drivers/soc/nuvoton/Makefile      |   2 +
 drivers/soc/nuvoton/wpcm450-soc.c | 109 ++++++++++++++++++++++++++++++
 5 files changed, 130 insertions(+)
 create mode 100644 drivers/soc/nuvoton/Kconfig
 create mode 100644 drivers/soc/nuvoton/Makefile
 create mode 100644 drivers/soc/nuvoton/wpcm450-soc.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index e461c071189b4..f17764a7e5884 100644
=2D-- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -15,6 +15,7 @@ source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
 source "drivers/soc/mediatek/Kconfig"
 source "drivers/soc/microchip/Kconfig"
+source "drivers/soc/nuvoton/Kconfig"
 source "drivers/soc/pxa/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 69ba6508cf2c1..9f92506854852 100644
=2D-- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_SOC_XWAY)		+=3D lantiq/
 obj-$(CONFIG_LITEX_SOC_CONTROLLER) +=3D litex/
 obj-y				+=3D mediatek/
 obj-y				+=3D microchip/
+obj-y				+=3D nuvoton/
 obj-y				+=3D pxa/
 obj-y				+=3D amlogic/
 obj-y				+=3D qcom/
diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
new file mode 100644
index 0000000000000..2167d3d739d84
=2D-- /dev/null
+++ b/drivers/soc/nuvoton/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+menu "Nuvoton SoC drivers"
+	depends on ARCH_NPCM || COMPILE_TEST
+
+config WPCM450_SOC
+	tristate "Nuvoton WPCM450 SoC driver"
+	default y if ARCH_WPCM450
+	select SOC_BUS
+	select REGMAP
+	help
+	  Say Y here to compile the SoC information driver for Nuvoton
+	  WPCM450 SoCs.
+
+	  This driver provides information such as the SoC model and
+	  revision.
+
+endmenu
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
index 0000000000000..c5e0d11c383b1
=2D-- /dev/null
+++ b/drivers/soc/nuvoton/wpcm450-soc.c
@@ -0,0 +1,109 @@
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
+static struct soc_device_attribute *wpcm450_attr;
+static struct soc_device *wpcm450_soc;
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
+	wpcm450_soc =3D soc;
+	wpcm450_attr =3D attr;
+	return 0;
+}
+module_init(wpcm450_soc_init);
+
+static void __exit wpcm450_soc_exit(void)
+{
+	if (wpcm450_soc) {
+		soc_device_unregister(wpcm450_soc);
+		wpcm450_soc =3D NULL;
+		kfree(wpcm450_attr);
+	}
+}
+module_exit(wpcm450_soc_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jonathan Neusch=C3=A4fer");
+MODULE_DESCRIPTION("Nuvoton WPCM450 SoC Identification driver");
=2D-
2.35.1

