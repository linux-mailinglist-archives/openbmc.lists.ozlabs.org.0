Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3912A4CDE
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:42:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBB44zjJzDqbr
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:42:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--maennich.bounces.google.com
 (client-ip=2607:f8b0:4864:20::e49; helo=mail-vs1-xe49.google.com;
 envelope-from=3gzfdxqgkb-iqeirrmglksskpi.gsqstirfqgpmwxw.sdpefw.svk@flex--maennich.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="azHJSvsi"; 
 dkim-atps=neutral
Received: from mail-vs1-xe49.google.com (mail-vs1-xe49.google.com
 [IPv6:2607:f8b0:4864:20::e49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D5h22hFYzDq83
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 21:55:11 +1000 (AEST)
Received: by mail-vs1-xe49.google.com with SMTP id t76so621016vst.16
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 04:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=bHbcOKILLPdv0N+k3FU5OjG4A3ej44x3m/KW3HJrByE=;
 b=azHJSvsiLzYUTcJv9QIk4GCkL+z6GD0Ye/2Gh1vnJykRePiXhtrJCYEB6kQusyv5rf
 OLghKlPPQnXhoQl7JxfAwBC3YkvyQJKpAShbUinxoKNvxtHjizAdOUphPtkJbdIt3e0T
 lJMDblH9eSr9I1gIY73eYLYpqGJVE2ZBjSaUSoWGNO6krEv06cYVjTQ/RBJFwl6OFN2i
 iHO5sjhOC8/QX74xagc/O7vs5y5MGcqtNBZqsYPxdmDfncCD3/0xPYPmOCTG+fQuuiMO
 NMdmSMMQ3StligMPYX+Bfe+CvvRkLCAt8RK9pWe0Xiin/E27rK+hCUA/r7Oenl1hMnQD
 y3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=bHbcOKILLPdv0N+k3FU5OjG4A3ej44x3m/KW3HJrByE=;
 b=fG0dG5LC9WBT1t6Auk+yC/GhWaNdHhJhAYAj3WqnIk+R3h44kkigHpktiT/yCWX+Lf
 GxWxu9hKtAmsfHgE63TW14OTAHCX6Q6kGcvvdJKZHoJRcWXrkKuLJ8+PJajlL4N1HQv9
 Z2MD1+WBjdJ7aFxZA2YAYPbQac0D1ZourkjgcplJP6QYj/eFfWCLAiuBIWCIUb/c4Kj9
 h5cSXqVlRVoysoOy4D+3M2/4nxN0i23of2SqqN30Vvr6BSWhKJoie00Wddz3dP49RbGp
 Rb1A1il6RWPrgWreHGWnyN4Jzx+/rsdxWOqO25ax6Ij22p0JpE2bJ4BeJXryvLu4bE72
 jySw==
X-Gm-Message-State: APjAAAUEuYRWXWeAPRS2qpDuj8xjEAhgfIkK75i8sV8EqwOXUj+jyNta
 PV6j8of894E23VsP+Fh1tC2N22+wBXYkrg==
X-Google-Smtp-Source: APXvYqzNI9d8sIGBzlwHv8z8Ka9I3OWRrsUvRMfvURHLSGiDhtMDCv50Xgiy5udWfgMePbYxSqImToCkJVqm+w==
X-Received: by 2002:ab0:6648:: with SMTP id b8mr1902164uaq.99.1566388507995;
 Wed, 21 Aug 2019 04:55:07 -0700 (PDT)
Date: Wed, 21 Aug 2019 12:49:26 +0100
In-Reply-To: <20190821114955.12788-1-maennich@google.com>
Message-Id: <20190821114955.12788-12-maennich@google.com>
Mime-Version: 1.0
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v3 11/11] RFC: watchdog: export core symbols in WATCHDOG_CORE
 namespace
From: Matthias Maennich <maennich@google.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, lucas.de.marchi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arch@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, mingo@redhat.com,
 geert@linux-m68k.org, NXP Linux Team <linux-imx@nxp.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 maennich@google.com, tglx@linutronix.de, michal.lkml@markovi.net,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, yamada.masahiro@socionext.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kukjin Kim <kgene@kernel.org>, kernel-team@android.com, sspatil@google.com,
 linux-watchdog@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, pombredanne@nexb.com,
 linux-m68k@lists.linux-m68k.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Barry Song <baohua@kernel.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>, oneukum@suse.com,
 Patrice Chotard <patrice.chotard@st.com>, Stefan Wahren <wahrenst@gmx.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kstewart@linuxfoundation.org,
 usb-storage@lists.one-eyed-alien.net, linux-tegra@vger.kernel.org,
 patches@opensource.cirrus.com, joel@joelfernandes.org, sam@ravnborg.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Eric Anholt <eric@anholt.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list@broadcom.com, stern@rowland.harvard.edu,
 arnd@arndb.de, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-hwmon@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Andreas Werner <andreas.werner@men.de>, Avi Fishman <avifishman70@gmail.com>,
 maco@google.com, jeyu@kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Baruch Siach <baruch@tkos.co.il>, Mans Rullgard <mans@mansr.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Jerry Hoemann <jerry.hoemann@hpe.com>, Tali Perry <tali.perry1@gmail.com>,
 hpa@zytor.com, linux-scsi@vger.kernel.org, openbmc@lists.ozlabs.org,
 x86@kernel.org, Andy Gross <agross@kernel.org>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Baolin Wang <baolin.wang@linaro.org>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-modules@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Modules using these symbols are required to explicitly import the
namespace. This patch was generated with the following steps and serves
as a reference to use the symbol namespace feature:

 1) Use EXPORT_SYMBOL_NS* macros instead of EXPORT_SYMBOL* for symbols
    in watchdog_core.c
 2) make  (see warnings during modpost about missing imports)
 3) make nsdeps

I used 'allmodconfig' for the above steps to ensure all occurrences are
patched.

Defining DEFAULT_SYMBOL_NAMESPACE in the Makefile is not trivial in this
case as not only watchdog_core is defined in drivers/watchdog/Makefile.
Hence this patch uses the variant of using the EXPORT_SYMBOL_NS* macros
to export into a different namespace.

An alternative to this patch would be a single definition line before
any use of EXPORT_SYMBOL*:
 #define DEFAULT_SYMBOL_NAMESPACE WATCHDOG_CORE

Signed-off-by: Matthias Maennich <maennich@google.com>
---
 drivers/hwmon/ftsteutates.c         |  1 +
 drivers/hwmon/sch56xx-common.c      |  1 +
 drivers/rtc/rtc-abx80x.c            |  1 +
 drivers/watchdog/armada_37xx_wdt.c  |  1 +
 drivers/watchdog/asm9260_wdt.c      |  1 +
 drivers/watchdog/aspeed_wdt.c       |  1 +
 drivers/watchdog/at91sam9_wdt.c     |  1 +
 drivers/watchdog/atlas7_wdt.c       |  1 +
 drivers/watchdog/bcm2835_wdt.c      |  1 +
 drivers/watchdog/bcm47xx_wdt.c      |  1 +
 drivers/watchdog/bcm7038_wdt.c      |  1 +
 drivers/watchdog/bcm_kona_wdt.c     |  1 +
 drivers/watchdog/bd70528_wdt.c      |  1 +
 drivers/watchdog/cadence_wdt.c      |  1 +
 drivers/watchdog/da9052_wdt.c       |  1 +
 drivers/watchdog/da9055_wdt.c       |  1 +
 drivers/watchdog/da9062_wdt.c       |  1 +
 drivers/watchdog/da9063_wdt.c       |  1 +
 drivers/watchdog/davinci_wdt.c      |  1 +
 drivers/watchdog/digicolor_wdt.c    |  1 +
 drivers/watchdog/dw_wdt.c           |  1 +
 drivers/watchdog/ebc-c384_wdt.c     |  1 +
 drivers/watchdog/ep93xx_wdt.c       |  1 +
 drivers/watchdog/ftwdt010_wdt.c     |  1 +
 drivers/watchdog/gpio_wdt.c         |  1 +
 drivers/watchdog/hpwdt.c            |  1 +
 drivers/watchdog/i6300esb.c         |  1 +
 drivers/watchdog/iTCO_wdt.c         |  1 +
 drivers/watchdog/ie6xx_wdt.c        |  1 +
 drivers/watchdog/imgpdc_wdt.c       |  1 +
 drivers/watchdog/imx2_wdt.c         |  1 +
 drivers/watchdog/intel-mid_wdt.c    |  1 +
 drivers/watchdog/it87_wdt.c         |  1 +
 drivers/watchdog/kempld_wdt.c       |  1 +
 drivers/watchdog/lpc18xx_wdt.c      |  1 +
 drivers/watchdog/max63xx_wdt.c      |  1 +
 drivers/watchdog/max77620_wdt.c     |  1 +
 drivers/watchdog/mei_wdt.c          |  1 +
 drivers/watchdog/mena21_wdt.c       |  1 +
 drivers/watchdog/menf21bmc_wdt.c    |  1 +
 drivers/watchdog/menz69_wdt.c       |  1 +
 drivers/watchdog/meson_gxbb_wdt.c   |  1 +
 drivers/watchdog/meson_wdt.c        |  1 +
 drivers/watchdog/mlx_wdt.c          |  1 +
 drivers/watchdog/moxart_wdt.c       |  1 +
 drivers/watchdog/mtk_wdt.c          |  1 +
 drivers/watchdog/ni903x_wdt.c       |  1 +
 drivers/watchdog/nic7018_wdt.c      |  1 +
 drivers/watchdog/npcm_wdt.c         |  1 +
 drivers/watchdog/of_xilinx_wdt.c    |  1 +
 drivers/watchdog/omap_wdt.c         |  1 +
 drivers/watchdog/pm8916_wdt.c       |  1 +
 drivers/watchdog/qcom-wdt.c         |  1 +
 drivers/watchdog/rave-sp-wdt.c      |  1 +
 drivers/watchdog/renesas_wdt.c      |  1 +
 drivers/watchdog/retu_wdt.c         |  1 +
 drivers/watchdog/rn5t618_wdt.c      |  1 +
 drivers/watchdog/rza_wdt.c          |  1 +
 drivers/watchdog/s3c2410_wdt.c      |  1 +
 drivers/watchdog/sama5d4_wdt.c      |  1 +
 drivers/watchdog/sirfsoc_wdt.c      |  1 +
 drivers/watchdog/softdog.c          |  1 +
 drivers/watchdog/sp5100_tco.c       |  1 +
 drivers/watchdog/sprd_wdt.c         |  1 +
 drivers/watchdog/st_lpc_wdt.c       |  1 +
 drivers/watchdog/stmp3xxx_rtc_wdt.c |  1 +
 drivers/watchdog/stpmic1_wdt.c      |  1 +
 drivers/watchdog/sunxi_wdt.c        |  1 +
 drivers/watchdog/tangox_wdt.c       |  1 +
 drivers/watchdog/tegra_wdt.c        |  1 +
 drivers/watchdog/tqmx86_wdt.c       |  1 +
 drivers/watchdog/ts4800_wdt.c       |  1 +
 drivers/watchdog/ts72xx_wdt.c       |  1 +
 drivers/watchdog/twl4030_wdt.c      |  1 +
 drivers/watchdog/uniphier_wdt.c     |  1 +
 drivers/watchdog/via_wdt.c          |  1 +
 drivers/watchdog/w83627hf_wdt.c     |  1 +
 drivers/watchdog/watchdog_core.c    | 10 +++++-----
 drivers/watchdog/wdat_wdt.c         |  1 +
 drivers/watchdog/wm831x_wdt.c       |  1 +
 drivers/watchdog/wm8350_wdt.c       |  1 +
 drivers/watchdog/xen_wdt.c          |  1 +
 drivers/watchdog/ziirave_wdt.c      |  1 +
 83 files changed, 87 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index 371ce7745f5e..fa67f7c565be 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -830,3 +830,4 @@ module_i2c_driver(fts_driver);
 MODULE_AUTHOR("Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>");
 MODULE_DESCRIPTION("FTS Teutates driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.=
c
index 6c84780e358e..06dd840f3bf7 100644
--- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -571,6 +571,7 @@ static void __exit sch56xx_exit(void)
 MODULE_DESCRIPTION("SMSC SCH56xx Hardware Monitoring Common Code");
 MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
=20
 module_init(sch56xx_init);
 module_exit(sch56xx_exit);
diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 73830670a41f..3ff3b96d14d7 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -880,3 +880,4 @@ MODULE_AUTHOR("Philippe De Muyter <phdm@macqel.be>");
 MODULE_AUTHOR("Alexandre Belloni <alexandre.belloni@bootlin.com>");
 MODULE_DESCRIPTION("Abracon ABX80X RTC driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/armada_37xx_wdt.c b/drivers/watchdog/armada_3=
7xx_wdt.c
index e5dcb26d85f0..00e153ae70eb 100644
--- a/drivers/watchdog/armada_37xx_wdt.c
+++ b/drivers/watchdog/armada_37xx_wdt.c
@@ -370,4 +370,5 @@ MODULE_AUTHOR("Marek Behun <marek.behun@nic.cz>");
 MODULE_DESCRIPTION("Armada 37xx CPU Watchdog");
=20
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:armada_37xx_wdt");
diff --git a/drivers/watchdog/asm9260_wdt.c b/drivers/watchdog/asm9260_wdt.=
c
index 45047e514b8e..fd7289df2cb3 100644
--- a/drivers/watchdog/asm9260_wdt.c
+++ b/drivers/watchdog/asm9260_wdt.c
@@ -374,3 +374,4 @@ module_platform_driver(asm9260_wdt_driver);
 MODULE_DESCRIPTION("asm9260 WatchDog Timer Driver");
 MODULE_AUTHOR("Oleksij Rempel <linux@rempel-privat.de>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index cc71861e033a..2607158965d6 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -334,3 +334,4 @@ module_exit(aspeed_wdt_exit);
=20
 MODULE_DESCRIPTION("Aspeed Watchdog Driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wd=
t.c
index 292b5a1ca831..e7aa31fe4336 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -416,3 +416,4 @@ module_platform_driver_probe(at91wdt_driver, at91wdt_pr=
obe);
 MODULE_AUTHOR("Renaud CERRATO <r.cerrato@til-technologies.fr>");
 MODULE_DESCRIPTION("Watchdog driver for Atmel AT91SAM9x processors");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/atlas7_wdt.c b/drivers/watchdog/atlas7_wdt.c
index 9bfe650d802f..f67e6f101102 100644
--- a/drivers/watchdog/atlas7_wdt.c
+++ b/drivers/watchdog/atlas7_wdt.c
@@ -218,4 +218,5 @@ module_platform_driver(atlas7_wdt_driver);
 MODULE_DESCRIPTION("CSRatlas7 watchdog driver");
 MODULE_AUTHOR("Guo Zeng <Guo.Zeng@csr.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:atlas7-wdt");
diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.=
c
index dec6ca019bea..2f41b8a6e2f6 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -242,3 +242,4 @@ MODULE_ALIAS("platform:bcm2835-wdt");
 MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
 MODULE_DESCRIPTION("Driver for Broadcom BCM2835 watchdog timer");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/bcm47xx_wdt.c b/drivers/watchdog/bcm47xx_wdt.=
c
index 05425c1dfd4c..231009f01024 100644
--- a/drivers/watchdog/bcm47xx_wdt.c
+++ b/drivers/watchdog/bcm47xx_wdt.c
@@ -241,3 +241,4 @@ MODULE_AUTHOR("Aleksandar Radovanovic");
 MODULE_AUTHOR("Hauke Mehrtens <hauke@hauke-m.de>");
 MODULE_DESCRIPTION("Watchdog driver for Broadcom BCM47xx");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.=
c
index 979caa18d3c8..e66184997775 100644
--- a/drivers/watchdog/bcm7038_wdt.c
+++ b/drivers/watchdog/bcm7038_wdt.c
@@ -212,5 +212,6 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (defau=
lt=3D"
 	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_DESCRIPTION("Driver for Broadcom 7038 SoCs Watchdog");
 MODULE_AUTHOR("Justin Chen");
diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wd=
t.c
index eb850a8d19df..5b5a6a76c1aa 100644
--- a/drivers/watchdog/bcm_kona_wdt.c
+++ b/drivers/watchdog/bcm_kona_wdt.c
@@ -339,3 +339,4 @@ MODULE_ALIAS("platform:" BCM_KONA_WDT_NAME);
 MODULE_AUTHOR("Markus Mayer <mmayer@broadcom.com>");
 MODULE_DESCRIPTION("Broadcom Kona Watchdog Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/bd70528_wdt.c b/drivers/watchdog/bd70528_wdt.=
c
index b0152fef4fc7..790748a3a30a 100644
--- a/drivers/watchdog/bd70528_wdt.c
+++ b/drivers/watchdog/bd70528_wdt.c
@@ -288,3 +288,4 @@ module_platform_driver(bd70528_wdt);
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
 MODULE_DESCRIPTION("BD70528 watchdog driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.=
c
index f8d4e91d0383..a44f3140656e 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -438,3 +438,4 @@ module_platform_driver(cdns_wdt_driver);
 MODULE_AUTHOR("Xilinx, Inc.");
 MODULE_DESCRIPTION("Watchdog driver for Cadence WDT");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index d708c091bf1b..a5ceea0503bb 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -191,4 +191,5 @@ module_platform_driver(da9052_wdt_driver);
 MODULE_AUTHOR("Anthony Olech <Anthony.Olech@diasemi.com>");
 MODULE_DESCRIPTION("DA9052 SM Device Driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:da9052-watchdog");
diff --git a/drivers/watchdog/da9055_wdt.c b/drivers/watchdog/da9055_wdt.c
index 389a4bdd208c..05b075f2ea90 100644
--- a/drivers/watchdog/da9055_wdt.c
+++ b/drivers/watchdog/da9055_wdt.c
@@ -166,4 +166,5 @@ module_platform_driver(da9055_wdt_driver);
 MODULE_AUTHOR("David Dajun Chen <dchen@diasemi.com>");
 MODULE_DESCRIPTION("DA9055 watchdog");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:da9055-watchdog");
diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index e149e66a6ea9..dfc2025d36ba 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -232,4 +232,5 @@ module_platform_driver(da9062_wdt_driver);
 MODULE_AUTHOR("S Twiss <stwiss.opensource@diasemi.com>");
 MODULE_DESCRIPTION("WDT device driver for Dialog DA9062 and DA9061");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:da9062-watchdog");
diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
index 3d65e92a4e3f..ae0cb7011762 100644
--- a/drivers/watchdog/da9063_wdt.c
+++ b/drivers/watchdog/da9063_wdt.c
@@ -239,4 +239,5 @@ module_platform_driver(da9063_wdt_driver);
 MODULE_AUTHOR("Mariusz Wojtasik <mariusz.wojtasik@diasemi.com>");
 MODULE_DESCRIPTION("Watchdog driver for Dialog DA9063");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:" DA9063_DRVNAME_WATCHDOG);
diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.=
c
index 2b3f3cd382ef..4fa01dfa4edb 100644
--- a/drivers/watchdog/davinci_wdt.c
+++ b/drivers/watchdog/davinci_wdt.c
@@ -274,4 +274,5 @@ MODULE_PARM_DESC(heartbeat,
 		 __MODULE_STRING(DEFAULT_HEARTBEAT));
=20
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:davinci-wdt");
diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_=
wdt.c
index 073d37867f47..ed86cf879dae 100644
--- a/drivers/watchdog/digicolor_wdt.c
+++ b/drivers/watchdog/digicolor_wdt.c
@@ -161,3 +161,4 @@ module_platform_driver(dc_wdt_driver);
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Driver for Conexant Digicolor watchdog timer");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index fef7c61f5555..e98ccb38eb1d 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -340,3 +340,4 @@ module_platform_driver(dw_wdt_driver);
 MODULE_AUTHOR("Jamie Iles");
 MODULE_DESCRIPTION("Synopsys DesignWare Watchdog Driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc-c384_wd=
t.c
index 8ef4b0df3855..7e4349472745 100644
--- a/drivers/watchdog/ebc-c384_wdt.c
+++ b/drivers/watchdog/ebc-c384_wdt.c
@@ -139,4 +139,5 @@ module_exit(ebc_c384_wdt_exit);
 MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
 MODULE_DESCRIPTION("WinSystems EBC-C384 watchdog timer driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("isa:" MODULE_NAME);
diff --git a/drivers/watchdog/ep93xx_wdt.c b/drivers/watchdog/ep93xx_wdt.c
index 38e26f160b9a..edfa422896d7 100644
--- a/drivers/watchdog/ep93xx_wdt.c
+++ b/drivers/watchdog/ep93xx_wdt.c
@@ -144,3 +144,4 @@ MODULE_AUTHOR("Alessandro Zummo <a.zummo@towertech.it>"=
);
 MODULE_AUTHOR("H Hartley Sweeten <hsweeten@visionengravers.com>");
 MODULE_DESCRIPTION("EP93xx Watchdog");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wd=
t.c
index 21dcc7765688..c19186bc00b6 100644
--- a/drivers/watchdog/ftwdt010_wdt.c
+++ b/drivers/watchdog/ftwdt010_wdt.c
@@ -227,3 +227,4 @@ module_platform_driver(ftwdt010_wdt_driver);
 MODULE_AUTHOR("Linus Walleij");
 MODULE_DESCRIPTION("Watchdog driver for Faraday Technology FTWDT010");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index 0923201ce874..6a90a7ecadeb 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -194,3 +194,4 @@ module_platform_driver(gpio_wdt_driver);
 MODULE_AUTHOR("Alexander Shiyan <shc_work@mail.ru>");
 MODULE_DESCRIPTION("GPIO Watchdog");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index 7d34bcf1c45b..fb4d228a0d7e 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -386,6 +386,7 @@ static struct pci_driver hpwdt_driver =3D {
 MODULE_AUTHOR("Tom Mingarelli");
 MODULE_DESCRIPTION("hpe watchdog driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_VERSION(HPWDT_VERSION);
=20
 module_param(soft_margin, int, 0);
diff --git a/drivers/watchdog/i6300esb.c b/drivers/watchdog/i6300esb.c
index a30835f547b3..700a8c6cae00 100644
--- a/drivers/watchdog/i6300esb.c
+++ b/drivers/watchdog/i6300esb.c
@@ -351,3 +351,4 @@ module_pci_driver(esb_driver);
 MODULE_AUTHOR("Ross Biro and David H=C3=A4rdeman");
 MODULE_DESCRIPTION("Watchdog driver for Intel 6300ESB chipsets");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index c559f706ae7e..454d8ff3edc1 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -632,4 +632,5 @@ MODULE_AUTHOR("Wim Van Sebroeck <wim@iguana.be>");
 MODULE_DESCRIPTION("Intel TCO WatchDog Timer Driver");
 MODULE_VERSION(DRV_VERSION);
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/drivers/watchdog/ie6xx_wdt.c b/drivers/watchdog/ie6xx_wdt.c
index 8f28993fab8b..76bcff28eaf9 100644
--- a/drivers/watchdog/ie6xx_wdt.c
+++ b/drivers/watchdog/ie6xx_wdt.c
@@ -314,4 +314,5 @@ module_exit(ie6xx_wdt_exit);
 MODULE_AUTHOR("Alexander Stein <alexander.stein@systec-electronic.com>");
 MODULE_DESCRIPTION("Intel Atom E6xx Watchdog Device Driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:" DRIVER_NAME);
diff --git a/drivers/watchdog/imgpdc_wdt.c b/drivers/watchdog/imgpdc_wdt.c
index b57ff3787052..6fe0fd7c0719 100644
--- a/drivers/watchdog/imgpdc_wdt.c
+++ b/drivers/watchdog/imgpdc_wdt.c
@@ -314,3 +314,4 @@ MODULE_AUTHOR("Jude Abraham <Jude.Abraham@imgtec.com>")=
;
 MODULE_AUTHOR("Naidu Tellapati <Naidu.Tellapati@imgtec.com>");
 MODULE_DESCRIPTION("Imagination Technologies PDC Watchdog Timer Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 32af3974e6bb..dc6d4132ec1f 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -433,4 +433,5 @@ module_platform_driver_probe(imx2_wdt_driver, imx2_wdt_=
probe);
 MODULE_AUTHOR("Wolfram Sang");
 MODULE_DESCRIPTION("Watchdog driver for IMX2 and later");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:" DRIVER_NAME);
diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-mid_=
wdt.c
index 2cdbd37c700c..b859fd6d263b 100644
--- a/drivers/watchdog/intel-mid_wdt.c
+++ b/drivers/watchdog/intel-mid_wdt.c
@@ -181,3 +181,4 @@ module_platform_driver(mid_wdt_driver);
 MODULE_AUTHOR("David Cohen <david.a.cohen@linux.intel.com>");
 MODULE_DESCRIPTION("Watchdog Driver for Intel MID platform");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index a4b71ebc8cab..610f5cdebf72 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -354,3 +354,4 @@ module_exit(it87_wdt_exit);
 MODULE_AUTHOR("Oliver Schuster");
 MODULE_DESCRIPTION("Hardware Watchdog Device Driver for IT87xx EC-LPC I/O"=
);
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/kempld_wdt.c b/drivers/watchdog/kempld_wdt.c
index 40bd518ed873..20a40e221dbb 100644
--- a/drivers/watchdog/kempld_wdt.c
+++ b/drivers/watchdog/kempld_wdt.c
@@ -550,3 +550,4 @@ module_platform_driver(kempld_wdt_driver);
 MODULE_DESCRIPTION("KEM PLD Watchdog Driver");
 MODULE_AUTHOR("Michael Brunner <michael.brunner@kontron.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.=
c
index 78cf11c94941..4e34a4bd0b24 100644
--- a/drivers/watchdog/lpc18xx_wdt.c
+++ b/drivers/watchdog/lpc18xx_wdt.c
@@ -316,3 +316,4 @@ module_platform_driver(lpc18xx_wdt_driver);
 MODULE_AUTHOR("Ariel D'Alessandro <ariel@vanguardiasur.com.ar>");
 MODULE_DESCRIPTION("NXP LPC18xx Watchdog Timer Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/max63xx_wdt.c b/drivers/watchdog/max63xx_wdt.=
c
index 3a899628a834..053c9285adac 100644
--- a/drivers/watchdog/max63xx_wdt.c
+++ b/drivers/watchdog/max63xx_wdt.c
@@ -284,3 +284,4 @@ MODULE_PARM_DESC(nodelay,
 		 "(max6373/74 only, default=3D0)");
=20
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/max77620_wdt.c b/drivers/watchdog/max77620_wd=
t.c
index be6a53c30002..304817d379a7 100644
--- a/drivers/watchdog/max77620_wdt.c
+++ b/drivers/watchdog/max77620_wdt.c
@@ -209,3 +209,4 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped =
once started "
=20
 MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
index 5391bf3e6b11..5e03226cada1 100644
--- a/drivers/watchdog/mei_wdt.c
+++ b/drivers/watchdog/mei_wdt.c
@@ -662,4 +662,5 @@ module_mei_cl_driver(mei_wdt_driver);
=20
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_DESCRIPTION("Device driver for Intel MEI iAMT watchdog");
diff --git a/drivers/watchdog/mena21_wdt.c b/drivers/watchdog/mena21_wdt.c
index 99d2359d5a8a..b759c66f1446 100644
--- a/drivers/watchdog/mena21_wdt.c
+++ b/drivers/watchdog/mena21_wdt.c
@@ -225,4 +225,5 @@ module_platform_driver(a21_wdt_driver);
 MODULE_AUTHOR("MEN Mikro Elektronik");
 MODULE_DESCRIPTION("MEN A21 Watchdog");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:a21-watchdog");
diff --git a/drivers/watchdog/menf21bmc_wdt.c b/drivers/watchdog/menf21bmc_=
wdt.c
index 81ebdfc371f4..358881618e2f 100644
--- a/drivers/watchdog/menf21bmc_wdt.c
+++ b/drivers/watchdog/menf21bmc_wdt.c
@@ -181,4 +181,5 @@ module_platform_driver(menf21bmc_wdt);
 MODULE_DESCRIPTION("MEN 14F021P00 BMC Watchdog driver");
 MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:menf21bmc_wdt");
diff --git a/drivers/watchdog/menz69_wdt.c b/drivers/watchdog/menz69_wdt.c
index ed18238c5407..d13fcfc0f59c 100644
--- a/drivers/watchdog/menz69_wdt.c
+++ b/drivers/watchdog/menz69_wdt.c
@@ -167,4 +167,5 @@ module_mcb_driver(men_z069_driver);
=20
 MODULE_AUTHOR("Johannes Thumshirn <jth@kernel.org>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("mcb:16z069");
diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxb=
b_wdt.c
index d17c1a6ed723..f30f85380679 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -204,3 +204,4 @@ module_platform_driver(meson_gxbb_wdt_driver);
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
 MODULE_DESCRIPTION("Amlogic Meson GXBB Watchdog timer driver");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/meson_wdt.c b/drivers/watchdog/meson_wdt.c
index 459f3ae02c91..0d60bb5aa688 100644
--- a/drivers/watchdog/meson_wdt.c
+++ b/drivers/watchdog/meson_wdt.c
@@ -228,5 +228,6 @@ MODULE_PARM_DESC(nowayout,
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
=20
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_AUTHOR("Carlo Caione <carlo@caione.org>");
 MODULE_DESCRIPTION("Meson Watchdog Timer Driver");
diff --git a/drivers/watchdog/mlx_wdt.c b/drivers/watchdog/mlx_wdt.c
index 03b9ac4b99af..2df48a6ed04b 100644
--- a/drivers/watchdog/mlx_wdt.c
+++ b/drivers/watchdog/mlx_wdt.c
@@ -287,4 +287,5 @@ module_platform_driver(mlxreg_wdt_driver);
 MODULE_AUTHOR("Michael Shych <michaelsh@mellanox.com>");
 MODULE_DESCRIPTION("Mellanox watchdog driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:mlx-wdt");
diff --git a/drivers/watchdog/moxart_wdt.c b/drivers/watchdog/moxart_wdt.c
index 6340a1f5f471..02dbfe2accfa 100644
--- a/drivers/watchdog/moxart_wdt.c
+++ b/drivers/watchdog/moxart_wdt.c
@@ -164,4 +164,5 @@ MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seco=
nds");
=20
 MODULE_DESCRIPTION("MOXART watchdog driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_AUTHOR("Jonas Jensen <jonas.jensen@gmail.com>");
diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 9c3d0033260d..074c04324738 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -247,6 +247,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped =
once started (default=3D"
 			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
=20
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_AUTHOR("Matthias Brugger <matthias.bgg@gmail.com>");
 MODULE_DESCRIPTION("Mediatek WatchDog Timer Driver");
 MODULE_VERSION(DRV_VERSION);
diff --git a/drivers/watchdog/ni903x_wdt.c b/drivers/watchdog/ni903x_wdt.c
index 4cebad324b20..724d47f2f325 100644
--- a/drivers/watchdog/ni903x_wdt.c
+++ b/drivers/watchdog/ni903x_wdt.c
@@ -255,3 +255,4 @@ MODULE_DESCRIPTION("NI 903x Watchdog");
 MODULE_AUTHOR("Jeff Westfahl <jeff.westfahl@ni.com>");
 MODULE_AUTHOR("Kyle Roeschley <kyle.roeschley@ni.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/nic7018_wdt.c b/drivers/watchdog/nic7018_wdt.=
c
index 2a46cc662943..efe0f188c79a 100644
--- a/drivers/watchdog/nic7018_wdt.c
+++ b/drivers/watchdog/nic7018_wdt.c
@@ -250,3 +250,4 @@ module_platform_driver(watchdog_driver);
 MODULE_DESCRIPTION("National Instruments NIC7018 Watchdog driver");
 MODULE_AUTHOR("Hui Chun Ong <hui.chun.ong@ni.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 9c773c3d6d5d..aa2022a44985 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -248,3 +248,4 @@ module_platform_driver(npcm_wdt_driver);
 MODULE_AUTHOR("Joel Stanley");
 MODULE_DESCRIPTION("Watchdog driver for NPCM");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_=
wdt.c
index 7fe4f7c3f7ce..8d93e2089c6d 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -308,3 +308,4 @@ module_platform_driver(xwdt_driver);
 MODULE_AUTHOR("Alejandro Cabrera <aldaya@gmail.com>");
 MODULE_DESCRIPTION("Xilinx Watchdog driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index 9b91882fe3c4..49565608924a 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -375,4 +375,5 @@ module_platform_driver(omap_wdt_driver);
=20
 MODULE_AUTHOR("George G. Davis");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:omap_wdt");
diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index 2d3652004e39..f13c1c2bec07 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -210,3 +210,4 @@ module_platform_driver(pm8916_wdt_driver);
 MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro.org>");
 MODULE_DESCRIPTION("Qualcomm pm8916 watchdog driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 7be7f87be28f..1ae02d3b5cb2 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -272,3 +272,4 @@ module_platform_driver(qcom_watchdog_driver);
=20
 MODULE_DESCRIPTION("QCOM KPSS Watchdog Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/rave-sp-wdt.c b/drivers/watchdog/rave-sp-wdt.=
c
index 2c95615b6354..7fac3fabfcfb 100644
--- a/drivers/watchdog/rave-sp-wdt.c
+++ b/drivers/watchdog/rave-sp-wdt.c
@@ -329,6 +329,7 @@ module_platform_driver(rave_sp_wdt_driver);
=20
 MODULE_DEVICE_TABLE(of, rave_sp_wdt_of_match);
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_AUTHOR("Andrey Vostrikov <andrey.vostrikov@cogentembedded.com>");
 MODULE_AUTHOR("Nikita Yushchenko <nikita.yoush@cogentembedded.com>");
 MODULE_AUTHOR("Andrey Smirnov <andrew.smirnov@gmail.com>");
diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.=
c
index 00662a8e039c..ec5b1ec6c292 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -315,4 +315,5 @@ module_platform_driver(rwdt_driver);
=20
 MODULE_DESCRIPTION("Renesas WDT Watchdog Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_AUTHOR("Wolfram Sang <wsa@sang-engineering.com>");
diff --git a/drivers/watchdog/retu_wdt.c b/drivers/watchdog/retu_wdt.c
index 258dfcf9cbda..6a3e2b8e5226 100644
--- a/drivers/watchdog/retu_wdt.c
+++ b/drivers/watchdog/retu_wdt.c
@@ -168,3 +168,4 @@ MODULE_DESCRIPTION("Retu watchdog");
 MODULE_AUTHOR("Amit Kucheria");
 MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t618_wdt.=
c
index 234876047431..8f7bc6b1cb64 100644
--- a/drivers/watchdog/rn5t618_wdt.c
+++ b/drivers/watchdog/rn5t618_wdt.c
@@ -191,3 +191,4 @@ module_platform_driver(rn5t618_wdt_driver);
 MODULE_AUTHOR("Beniamino Galvani <b.galvani@gmail.com>");
 MODULE_DESCRIPTION("RN5T618 watchdog driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/rza_wdt.c b/drivers/watchdog/rza_wdt.c
index 7b6c365f7cd3..31ff9acc9af2 100644
--- a/drivers/watchdog/rza_wdt.c
+++ b/drivers/watchdog/rza_wdt.c
@@ -245,3 +245,4 @@ module_platform_driver(rza_wdt_driver);
 MODULE_DESCRIPTION("Renesas RZ/A WDT Driver");
 MODULE_AUTHOR("Chris Brandt <chris.brandt@renesas.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.=
c
index 2395f353e52d..5c1800d41411 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -739,3 +739,4 @@ module_platform_driver(s3c2410wdt_driver);
 MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>, Dimitry Andric <dimitry.andri=
c@tomtom.com>");
 MODULE_DESCRIPTION("S3C2410 Watchdog Device Driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.=
c
index d193a60430b2..725f68703f1e 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -321,3 +321,4 @@ module_platform_driver(sama5d4_wdt_driver);
 MODULE_AUTHOR("Atmel Corporation");
 MODULE_DESCRIPTION("Atmel SAMA5D4 Watchdog Timer driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/sirfsoc_wdt.c b/drivers/watchdog/sirfsoc_wdt.=
c
index 734cf2966ecb..bcb75d9978f0 100644
--- a/drivers/watchdog/sirfsoc_wdt.c
+++ b/drivers/watchdog/sirfsoc_wdt.c
@@ -213,4 +213,5 @@ module_platform_driver(sirfsoc_wdt_driver);
 MODULE_DESCRIPTION("SiRF SoC watchdog driver");
 MODULE_AUTHOR("Xianglong Du <Xianglong.Du@csr.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:sirfsoc-wdt");
diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 3e4885c1545e..8d50543f7340 100644
--- a/drivers/watchdog/softdog.c
+++ b/drivers/watchdog/softdog.c
@@ -165,3 +165,4 @@ module_exit(softdog_exit);
 MODULE_AUTHOR("Alan Cox");
 MODULE_DESCRIPTION("Software Watchdog Device Driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index 93bd302ae7c5..716b9c43baf1 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -486,3 +486,4 @@ module_exit(sp5100_tco_exit);
 MODULE_AUTHOR("Priyanka Gupta");
 MODULE_DESCRIPTION("TCO timer driver for SP5100/SB800 chipset");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index edba4e278685..55e883e8dcf4 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -384,3 +384,4 @@ module_platform_driver(sprd_watchdog_driver);
 MODULE_AUTHOR("Eric Long <eric.long@spreadtrum.com>");
 MODULE_DESCRIPTION("Spreadtrum Watchdog Timer Controller Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wdt.c
index 14ab6559c748..4a7e6b4694fa 100644
--- a/drivers/watchdog/st_lpc_wdt.c
+++ b/drivers/watchdog/st_lpc_wdt.c
@@ -305,3 +305,4 @@ module_platform_driver(st_wdog_driver);
 MODULE_AUTHOR("David Paris <david.paris@st.com>");
 MODULE_DESCRIPTION("ST LPC Watchdog Driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stmp3xx=
x_rtc_wdt.c
index 7caf3aa71c6a..f1dd033c2b4b 100644
--- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
+++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
@@ -150,4 +150,5 @@ module_platform_driver(stmp3xxx_wdt_driver);
=20
 MODULE_DESCRIPTION("STMP3XXX RTC Watchdog Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_AUTHOR("Wolfram Sang <kernel@pengutronix.de>");
diff --git a/drivers/watchdog/stpmic1_wdt.c b/drivers/watchdog/stpmic1_wdt.=
c
index 45d0c543466f..6cdbe4bf5aaa 100644
--- a/drivers/watchdog/stpmic1_wdt.c
+++ b/drivers/watchdog/stpmic1_wdt.c
@@ -138,3 +138,4 @@ module_platform_driver(stpmic1_wdt_driver);
 MODULE_DESCRIPTION("Watchdog driver for STPMIC1 device");
 MODULE_AUTHOR("Pascal Paillet <p.paillet@st.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index 5f05a45ac187..dea10c79b817 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -289,6 +289,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped =
once started "
 		"(default=3D" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
=20
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_AUTHOR("Carlo Caione <carlo.caione@gmail.com>");
 MODULE_AUTHOR("Henrik Nordstrom <henrik@henriknordstrom.net>");
 MODULE_DESCRIPTION("sunxi WatchDog Timer Driver");
diff --git a/drivers/watchdog/tangox_wdt.c b/drivers/watchdog/tangox_wdt.c
index 1afb0e9d808c..bc9025d31977 100644
--- a/drivers/watchdog/tangox_wdt.c
+++ b/drivers/watchdog/tangox_wdt.c
@@ -207,3 +207,4 @@ module_platform_driver(tangox_wdt_driver);
 MODULE_AUTHOR("Mans Rullgard <mans@mansr.com>");
 MODULE_DESCRIPTION("SMP86xx/SMP87xx Watchdog driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/tegra_wdt.c b/drivers/watchdog/tegra_wdt.c
index dfe06e506cad..06acd8251928 100644
--- a/drivers/watchdog/tegra_wdt.c
+++ b/drivers/watchdog/tegra_wdt.c
@@ -276,3 +276,4 @@ module_platform_driver(tegra_wdt_driver);
 MODULE_AUTHOR("NVIDIA Corporation");
 MODULE_DESCRIPTION("Tegra Watchdog Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/tqmx86_wdt.c b/drivers/watchdog/tqmx86_wdt.c
index 72d0b0adde38..35b8bfffa34d 100644
--- a/drivers/watchdog/tqmx86_wdt.c
+++ b/drivers/watchdog/tqmx86_wdt.c
@@ -124,3 +124,4 @@ MODULE_AUTHOR("Andrew Lunn <andrew@lunn.ch>");
 MODULE_DESCRIPTION("TQMx86 Watchdog");
 MODULE_ALIAS("platform:tqmx86-wdt");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/ts4800_wdt.c b/drivers/watchdog/ts4800_wdt.c
index c137ad2bd5c3..b07f75f9049b 100644
--- a/drivers/watchdog/ts4800_wdt.c
+++ b/drivers/watchdog/ts4800_wdt.c
@@ -200,4 +200,5 @@ module_platform_driver(ts4800_wdt_driver);
=20
 MODULE_AUTHOR("Damien Riegel <damien.riegel@savoirfairelinux.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:ts4800_wdt");
diff --git a/drivers/watchdog/ts72xx_wdt.c b/drivers/watchdog/ts72xx_wdt.c
index bf918f5fa131..efd74cfabbf8 100644
--- a/drivers/watchdog/ts72xx_wdt.c
+++ b/drivers/watchdog/ts72xx_wdt.c
@@ -174,4 +174,5 @@ module_platform_driver(ts72xx_wdt_driver);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@iki.fi>");
 MODULE_DESCRIPTION("TS-72xx SBC Watchdog");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:ts72xx-wdt");
diff --git a/drivers/watchdog/twl4030_wdt.c b/drivers/watchdog/twl4030_wdt.=
c
index 355e428c0b99..98bcebe3a0b7 100644
--- a/drivers/watchdog/twl4030_wdt.c
+++ b/drivers/watchdog/twl4030_wdt.c
@@ -123,5 +123,6 @@ module_platform_driver(twl4030_wdt_driver);
=20
 MODULE_AUTHOR("Nokia Corporation");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:twl4030_wdt");
=20
diff --git a/drivers/watchdog/uniphier_wdt.c b/drivers/watchdog/uniphier_wd=
t.c
index 8e9242c23022..3a6d2d3a8f3c 100644
--- a/drivers/watchdog/uniphier_wdt.c
+++ b/drivers/watchdog/uniphier_wdt.c
@@ -255,3 +255,4 @@ MODULE_PARM_DESC(nowayout,
 MODULE_AUTHOR("Keiji Hayashibara <hayashibara.keiji@socionext.com>");
 MODULE_DESCRIPTION("UniPhier Watchdog Device Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/via_wdt.c b/drivers/watchdog/via_wdt.c
index eeb39f96e72e..899a4fe1d7b6 100644
--- a/drivers/watchdog/via_wdt.c
+++ b/drivers/watchdog/via_wdt.c
@@ -259,3 +259,4 @@ module_pci_driver(wdt_driver);
 MODULE_AUTHOR("Marc Vertes");
 MODULE_DESCRIPTION("Driver for watchdog timer on VIA chipset");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/w83627hf_wdt.c b/drivers/watchdog/w83627hf_wd=
t.c
index 38b31e9947aa..b66aea20a96e 100644
--- a/drivers/watchdog/w83627hf_wdt.c
+++ b/drivers/watchdog/w83627hf_wdt.c
@@ -528,5 +528,6 @@ module_init(wdt_init);
 module_exit(wdt_exit);
=20
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_AUTHOR("P=C3=A1draig  Brady <P@draigBrady.com>");
 MODULE_DESCRIPTION("w83627hf/thf WDT driver");
diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_c=
ore.c
index 21e8085b848b..9deb22af5daa 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -145,7 +145,7 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
=20
 	return ret;
 }
-EXPORT_SYMBOL_GPL(watchdog_init_timeout);
+EXPORT_SYMBOL_NS_GPL(watchdog_init_timeout, WATCHDOG_CORE);
=20
 static int watchdog_restart_notifier(struct notifier_block *nb,
 				     unsigned long action, void *data)
@@ -180,7 +180,7 @@ void watchdog_set_restart_priority(struct watchdog_devi=
ce *wdd, int priority)
 {
 	wdd->restart_nb.priority =3D priority;
 }
-EXPORT_SYMBOL_GPL(watchdog_set_restart_priority);
+EXPORT_SYMBOL_NS_GPL(watchdog_set_restart_priority, WATCHDOG_CORE);
=20
 static int __watchdog_register_device(struct watchdog_device *wdd)
 {
@@ -279,7 +279,7 @@ int watchdog_register_device(struct watchdog_device *wd=
d)
=20
 	return ret;
 }
-EXPORT_SYMBOL_GPL(watchdog_register_device);
+EXPORT_SYMBOL_NS_GPL(watchdog_register_device, WATCHDOG_CORE);
=20
 static void __watchdog_unregister_device(struct watchdog_device *wdd)
 {
@@ -311,7 +311,7 @@ void watchdog_unregister_device(struct watchdog_device =
*wdd)
 	mutex_unlock(&wtd_deferred_reg_mutex);
 }
=20
-EXPORT_SYMBOL_GPL(watchdog_unregister_device);
+EXPORT_SYMBOL_NS_GPL(watchdog_unregister_device, WATCHDOG_CORE);
=20
 static void devm_watchdog_unregister_device(struct device *dev, void *res)
 {
@@ -348,7 +348,7 @@ int devm_watchdog_register_device(struct device *dev,
=20
 	return ret;
 }
-EXPORT_SYMBOL_GPL(devm_watchdog_register_device);
+EXPORT_SYMBOL_NS_GPL(devm_watchdog_register_device, WATCHDOG_CORE);
=20
 static int __init watchdog_deferred_registration(void)
 {
diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index e7cf41aa26c3..027339a557ce 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -523,4 +523,5 @@ module_platform_driver(wdat_wdt_driver);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("ACPI Hardware Watchdog (WDAT) driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:wdat_wdt");
diff --git a/drivers/watchdog/wm831x_wdt.c b/drivers/watchdog/wm831x_wdt.c
index 030ce240620d..a17e2ac251a1 100644
--- a/drivers/watchdog/wm831x_wdt.c
+++ b/drivers/watchdog/wm831x_wdt.c
@@ -282,4 +282,5 @@ module_platform_driver(wm831x_wdt_driver);
 MODULE_AUTHOR("Mark Brown");
 MODULE_DESCRIPTION("WM831x Watchdog");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:wm831x-watchdog");
diff --git a/drivers/watchdog/wm8350_wdt.c b/drivers/watchdog/wm8350_wdt.c
index 33c62d51f00a..f81e661662e6 100644
--- a/drivers/watchdog/wm8350_wdt.c
+++ b/drivers/watchdog/wm8350_wdt.c
@@ -175,4 +175,5 @@ module_platform_driver(wm8350_wdt_driver);
 MODULE_AUTHOR("Mark Brown");
 MODULE_DESCRIPTION("WM8350 Watchdog");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
 MODULE_ALIAS("platform:wm8350-wdt");
diff --git a/drivers/watchdog/xen_wdt.c b/drivers/watchdog/xen_wdt.c
index b343f421dc72..8b21a4b51047 100644
--- a/drivers/watchdog/xen_wdt.c
+++ b/drivers/watchdog/xen_wdt.c
@@ -206,3 +206,4 @@ module_exit(xen_wdt_cleanup_module);
 MODULE_AUTHOR("Jan Beulich <jbeulich@novell.com>");
 MODULE_DESCRIPTION("Xen WatchDog Timer Driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.=
c
index dec660c509b3..2d81c7b546f2 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -751,3 +751,4 @@ module_i2c_driver(ziirave_wdt_driver);
 MODULE_AUTHOR("Martyn Welch <martyn.welch@collabora.co.uk");
 MODULE_DESCRIPTION("Zodiac Aerospace RAVE Switch Watchdog Processor Driver=
");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(WATCHDOG_CORE);
--=20
2.23.0.rc1.153.gdeed80330f-goog

