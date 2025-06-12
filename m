Return-Path: <openbmc+bounces-186-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E49AD7EAF
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 01:01:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJJ176FXWz306l;
	Fri, 13 Jun 2025 09:01:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749716661;
	cv=none; b=nT2/Dt5SCi/U2N+SEbyGoR3l0d+/yCqP/2fr1+iCKD85vHjfT/MxhIrQjtOZ/4thVBNU8K2iEvwU4Pk3bOXlVjjxG2D9ECVIg+2P3hq+vfqNSA674MB4LENkSOUOvwepDWveBvHyBAB2PWKzMYqTaXQK5ggH+vzv6bzqJuUcl43wN8tciGOjlW0SeeGB5kH8HRVTYh6t6hbB2e07A5398YYG5ifovW/vxQzRBkKC2OPtKaA2ZotYFthpUQYEv+BgFcUIiukQw3qw8R+JeIo0ZyHXDpjEEhAJKUT+Bhw84BNgD5KvleghtnKBCob5fNnXHxxFyRhgI5ONPXXRMi8fCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749716661; c=relaxed/relaxed;
	bh=7kGoXelVVEEZrd/76cIf97/OgYb0jIvLH7pVXFi9WFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7FfwnzixxiW1932en5xIE2ea1dXe2GYsp/kOwU+n6lYZM/eTy6NY0Y83OK0YRMt/jkuVQfT1Bi8dv+ocE/10/pLHybz96TV1Focq6JrVufkmZBZch4Fid6yv/kIvFN8CXA/h/+QVKGEg4qVP0SW1jZ+QnOoJJ4FVPSaxIUeHJIpwMATV+BNldsfNUcFtxNr52rlgJ7b9CCr+0ykuOyeK4IkbT2obtsh6E21Drlb0s6NAHmeleIZlVs58EcinqRLLZcfqfJD63eJqE4jaRa1rumyAQVQb5Jt8ABUSjmhXVhADb/jfvFzZWP723bDZoc0GoCEU6Bl53yaouNdSALxTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IXl3ISkr; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IXl3ISkr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 386 seconds by postgrey-1.37 at boromir; Thu, 12 Jun 2025 18:24:15 AEST
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHwYC5Bjxz2xPL
	for <openbmc@lists.ozlabs.org>; Thu, 12 Jun 2025 18:24:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=7kGoXelVVEEZrd
	/76cIf97/OgYb0jIvLH7pVXFi9WFY=; b=IXl3ISkrJHUPvxBRnQ7r8jom4gi2XI
	1E6pSa2l4HZ57EzODC3SDv+5GHFzfM1IU58OKPQ9PvanGdS/Oy61TpZIFPC/WG54
	NmYIa+l1YKCgqo5iEh/LsYzhq1oN96UPT3z5HnecD23v/oM0viIU/JdVluP/lFa0
	xFjlpIAEccjQPmqEj5XU22WUpz6CxTdfX+rUpAelKB5bbBmuvOlI5N0eBKbA+XCo
	9rDEQqcsrwiY9h/kKBCVmLKLSDyc7RlINGb4Bk5oEmTal7hI94vd1QKogMr6LIPx
	ti7w67FOr7OhRipVMaZBm2SqCiT9XhHtgQV5iHPKAzcSLwmRm4xRNMkw==
Received: (qmail 3547230 invoked from network); 12 Jun 2025 10:17:31 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2025 10:17:31 +0200
X-UD-Smtp-Session: l3s3148p1@et2hj1s36OUgAwDPXy2/ACpZfVCNKldR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Michal Simek <michal.simek@amd.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Vignesh R <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	George Cherian <gcherian@marvell.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Peter Rosin <peda@axentia.se>,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: [PATCH] i2c: use inclusive callbacks in struct i2c_algorithm
Date: Thu, 12 Jun 2025 10:12:23 +0200
Message-ID: <20250612081729.84329-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert the I2C subsystem to drop using the 'master_'-prefixed callbacks
in favor of the simplified ones. Fix alignment of '=' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

So, after rc1, this is the right timing for such a patch. I originally
wanted to convert to more inclusive language per-driver. It turned out
this approach is too cumbersome and slow. I now changed strategy to
per-feature, at least for the I2C subsystem. This will cause some
inconsitencies on the way, but less dependencies makes it easier to go
forward in the end. When drivers within I2C are good, then we can
convert outside of I2C per-driver to keep the churn there low.

@Andi: I would like to merge this via my tree once buildbot tells me it
is happy. Is this okay with you?

 drivers/i2c/algos/i2c-algo-bit.c           |  4 ++--
 drivers/i2c/algos/i2c-algo-pca.c           |  4 ++--
 drivers/i2c/algos/i2c-algo-pcf.c           |  4 ++--
 drivers/i2c/busses/i2c-amd-mp2-plat.c      |  2 +-
 drivers/i2c/busses/i2c-aspeed.c            |  8 ++++----
 drivers/i2c/busses/i2c-at91-master.c       |  4 ++--
 drivers/i2c/busses/i2c-axxia.c             |  2 +-
 drivers/i2c/busses/i2c-bcm-iproc.c         |  2 +-
 drivers/i2c/busses/i2c-cadence.c           | 10 +++++-----
 drivers/i2c/busses/i2c-cgbc.c              |  4 ++--
 drivers/i2c/busses/i2c-eg20t.c             |  2 +-
 drivers/i2c/busses/i2c-emev2.c             |  6 +++---
 drivers/i2c/busses/i2c-exynos5.c           |  6 +++---
 drivers/i2c/busses/i2c-gxp.c               |  6 +++---
 drivers/i2c/busses/i2c-img-scb.c           |  2 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c         |  8 ++++----
 drivers/i2c/busses/i2c-imx.c               |  8 ++++----
 drivers/i2c/busses/i2c-keba.c              |  2 +-
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c     |  2 +-
 drivers/i2c/busses/i2c-meson.c             |  4 ++--
 drivers/i2c/busses/i2c-microchip-corei2c.c |  2 +-
 drivers/i2c/busses/i2c-mt65xx.c            |  2 +-
 drivers/i2c/busses/i2c-mxs.c               |  2 +-
 drivers/i2c/busses/i2c-nomadik.c           |  4 ++--
 drivers/i2c/busses/i2c-npcm7xx.c           |  6 +++---
 drivers/i2c/busses/i2c-omap.c              |  6 +++---
 drivers/i2c/busses/i2c-pnx.c               |  2 +-
 drivers/i2c/busses/i2c-pxa.c               | 16 ++++++++--------
 drivers/i2c/busses/i2c-qcom-cci.c          |  4 ++--
 drivers/i2c/busses/i2c-qcom-geni.c         |  4 ++--
 drivers/i2c/busses/i2c-qup.c               |  8 ++++----
 drivers/i2c/busses/i2c-rcar.c              | 10 +++++-----
 drivers/i2c/busses/i2c-s3c2410.c           |  6 +++---
 drivers/i2c/busses/i2c-sh7760.c            |  4 ++--
 drivers/i2c/busses/i2c-sh_mobile.c         |  4 ++--
 drivers/i2c/busses/i2c-stm32f7.c           |  4 ++--
 drivers/i2c/busses/i2c-synquacer.c         |  4 ++--
 drivers/i2c/busses/i2c-tegra.c             |  6 +++---
 drivers/i2c/busses/i2c-xiic.c              |  4 ++--
 drivers/i2c/busses/i2c-xlp9xx.c            |  2 +-
 drivers/i2c/i2c-atr.c                      |  2 +-
 drivers/i2c/i2c-mux.c                      |  6 +++---
 drivers/i2c/muxes/i2c-demux-pinctrl.c      |  4 ++--
 43 files changed, 101 insertions(+), 101 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index eddf25b90ca8..6544d27e4419 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -619,8 +619,8 @@ static u32 bit_func(struct i2c_adapter *adap)
 /* -----exported algorithm data: -------------------------------------	*/
 
 const struct i2c_algorithm i2c_bit_algo = {
-	.master_xfer = bit_xfer,
-	.master_xfer_atomic = bit_xfer_atomic,
+	.xfer = bit_xfer,
+	.xfer_atomic = bit_xfer_atomic,
 	.functionality = bit_func,
 };
 EXPORT_SYMBOL(i2c_bit_algo);
diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-algo-pca.c
index 384af88e58ad..74b66aec33d4 100644
--- a/drivers/i2c/algos/i2c-algo-pca.c
+++ b/drivers/i2c/algos/i2c-algo-pca.c
@@ -361,8 +361,8 @@ static u32 pca_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm pca_algo = {
-	.master_xfer	= pca_xfer,
-	.functionality	= pca_func,
+	.xfer = pca_xfer,
+	.functionality = pca_func,
 };
 
 static unsigned int pca_probe_chip(struct i2c_adapter *adap)
diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 740066ceaea3..fd563e845d4b 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -389,8 +389,8 @@ static u32 pcf_func(struct i2c_adapter *adap)
 
 /* exported algorithm data: */
 static const struct i2c_algorithm pcf_algo = {
-	.master_xfer	= pcf_xfer,
-	.functionality	= pcf_func,
+	.xfer = pcf_xfer,
+	.functionality = pcf_func,
 };
 
 /*
diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index d9dd0e475d1a..188e24cc4d35 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -179,7 +179,7 @@ static u32 i2c_amd_func(struct i2c_adapter *a)
 }
 
 static const struct i2c_algorithm i2c_amd_algorithm = {
-	.master_xfer = i2c_amd_xfer,
+	.xfer = i2c_amd_xfer,
 	.functionality = i2c_amd_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 1550d3d552ae..a26b74c71206 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -814,11 +814,11 @@ static int aspeed_i2c_unreg_slave(struct i2c_client *client)
 #endif /* CONFIG_I2C_SLAVE */
 
 static const struct i2c_algorithm aspeed_i2c_algo = {
-	.master_xfer	= aspeed_i2c_master_xfer,
-	.functionality	= aspeed_i2c_functionality,
+	.xfer = aspeed_i2c_master_xfer,
+	.functionality = aspeed_i2c_functionality,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	.reg_slave	= aspeed_i2c_reg_slave,
-	.unreg_slave	= aspeed_i2c_unreg_slave,
+	.reg_slave = aspeed_i2c_reg_slave,
+	.unreg_slave = aspeed_i2c_unreg_slave,
 #endif /* CONFIG_I2C_SLAVE */
 };
 
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 374fc50bb205..59795c1c24ff 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -739,8 +739,8 @@ static u32 at91_twi_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm at91_twi_algorithm = {
-	.master_xfer	= at91_twi_xfer,
-	.functionality	= at91_twi_func,
+	.xfer = at91_twi_xfer,
+	.functionality = at91_twi_func,
 };
 
 static int at91_twi_configure_dma(struct at91_twi_dev *dev, u32 phy_addr)
diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 50030256cd85..0555eeb6903a 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -706,7 +706,7 @@ static int axxia_i2c_unreg_slave(struct i2c_client *slave)
 }
 
 static const struct i2c_algorithm axxia_i2c_algo = {
-	.master_xfer = axxia_i2c_xfer,
+	.xfer = axxia_i2c_xfer,
 	.functionality = axxia_i2c_func,
 	.reg_slave = axxia_i2c_reg_slave,
 	.unreg_slave = axxia_i2c_unreg_slave,
diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 63bc3c8f49d3..e418a4f23f15 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1041,7 +1041,7 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
 }
 
 static struct i2c_algorithm bcm_iproc_algo = {
-	.master_xfer = bcm_iproc_i2c_xfer,
+	.xfer = bcm_iproc_i2c_xfer,
 	.functionality = bcm_iproc_i2c_functionality,
 	.reg_slave = bcm_iproc_i2c_reg_slave,
 	.unreg_slave = bcm_iproc_i2c_unreg_slave,
diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 8df63aaf2a80..697d095afbe4 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1231,12 +1231,12 @@ static int cdns_unreg_slave(struct i2c_client *slave)
 #endif
 
 static const struct i2c_algorithm cdns_i2c_algo = {
-	.master_xfer	= cdns_i2c_master_xfer,
-	.master_xfer_atomic = cdns_i2c_master_xfer_atomic,
-	.functionality	= cdns_i2c_func,
+	.xfer = cdns_i2c_master_xfer,
+	.xfer_atomic = cdns_i2c_master_xfer_atomic,
+	.functionality = cdns_i2c_func,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	.reg_slave	= cdns_reg_slave,
-	.unreg_slave	= cdns_unreg_slave,
+	.reg_slave = cdns_reg_slave,
+	.unreg_slave = cdns_unreg_slave,
 #endif
 };
 
diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
index f054d167ac47..25a74fa51aa0 100644
--- a/drivers/i2c/busses/i2c-cgbc.c
+++ b/drivers/i2c/busses/i2c-cgbc.c
@@ -331,8 +331,8 @@ static u32 cgbc_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm cgbc_i2c_algorithm = {
-	.master_xfer	= cgbc_i2c_xfer,
-	.functionality	= cgbc_i2c_func,
+	.xfer = cgbc_i2c_xfer,
+	.functionality = cgbc_i2c_func,
 };
 
 static struct i2c_algo_cgbc_data cgbc_i2c_algo_data[] = {
diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index efdaddf99f9e..27ea3c130a16 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -690,7 +690,7 @@ static u32 pch_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm pch_algorithm = {
-	.master_xfer = pch_i2c_xfer,
+	.xfer = pch_i2c_xfer,
 	.functionality = pch_i2c_func
 };
 
diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 2512cef8e2a2..ece019b3d066 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -351,10 +351,10 @@ static int em_i2c_unreg_slave(struct i2c_client *slave)
 }
 
 static const struct i2c_algorithm em_i2c_algo = {
-	.master_xfer = em_i2c_xfer,
+	.xfer = em_i2c_xfer,
 	.functionality = em_i2c_func,
-	.reg_slave      = em_i2c_reg_slave,
-	.unreg_slave    = em_i2c_unreg_slave,
+	.reg_slave = em_i2c_reg_slave,
+	.unreg_slave = em_i2c_unreg_slave,
 };
 
 static int em_i2c_probe(struct platform_device *pdev)
diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 02f24479aa07..9c1c5f3c09f6 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -879,9 +879,9 @@ static u32 exynos5_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm exynos5_i2c_algorithm = {
-	.master_xfer		= exynos5_i2c_xfer,
-	.master_xfer_atomic	= exynos5_i2c_xfer_atomic,
-	.functionality		= exynos5_i2c_func,
+	.xfer = exynos5_i2c_xfer,
+	.xfer_atomic = exynos5_i2c_xfer_atomic,
+	.functionality = exynos5_i2c_func,
 };
 
 static int exynos5_i2c_probe(struct platform_device *pdev)
diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
index 0fc39caa6c87..2d117e7e3cb6 100644
--- a/drivers/i2c/busses/i2c-gxp.c
+++ b/drivers/i2c/busses/i2c-gxp.c
@@ -184,11 +184,11 @@ static int gxp_i2c_unreg_slave(struct i2c_client *slave)
 #endif
 
 static const struct i2c_algorithm gxp_i2c_algo = {
-	.master_xfer   = gxp_i2c_master_xfer,
+	.xfer = gxp_i2c_master_xfer,
 	.functionality = gxp_i2c_func,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	.reg_slave     = gxp_i2c_reg_slave,
-	.unreg_slave   = gxp_i2c_unreg_slave,
+	.reg_slave = gxp_i2c_reg_slave,
+	.unreg_slave = gxp_i2c_unreg_slave,
 #endif
 };
 
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 3278707bb885..a454f9f25146 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1143,7 +1143,7 @@ static u32 img_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm img_i2c_algo = {
-	.master_xfer = img_i2c_xfer,
+	.xfer = img_i2c_xfer,
 	.functionality = img_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 342d47e67586..064bc83840a6 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1268,10 +1268,10 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm lpi2c_imx_algo = {
-	.master_xfer	= lpi2c_imx_xfer,
-	.functionality	= lpi2c_imx_func,
-	.reg_target	= lpi2c_imx_register_target,
-	.unreg_target	= lpi2c_imx_unregister_target,
+	.xfer = lpi2c_imx_xfer,
+	.functionality = lpi2c_imx_func,
+	.reg_target = lpi2c_imx_register_target,
+	.unreg_target = lpi2c_imx_unregister_target,
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index de01dfecb16e..e5732b0557fb 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1692,11 +1692,11 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
-	.reg_slave	= i2c_imx_reg_slave,
-	.unreg_slave	= i2c_imx_unreg_slave,
+	.reg_slave = i2c_imx_reg_slave,
+	.unreg_slave = i2c_imx_unreg_slave,
 };
 
 static int i2c_imx_probe(struct platform_device *pdev)
diff --git a/drivers/i2c/busses/i2c-keba.c b/drivers/i2c/busses/i2c-keba.c
index 7b9ed2592f5b..9420c8b342b5 100644
--- a/drivers/i2c/busses/i2c-keba.c
+++ b/drivers/i2c/busses/i2c-keba.c
@@ -500,7 +500,7 @@ static u32 ki2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm ki2c_algo = {
-	.master_xfer   = ki2c_xfer,
+	.xfer = ki2c_xfer,
 	.functionality = ki2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index 5ef136c3ecb1..bc0f1a0c8ee1 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -1048,7 +1048,7 @@ static u32 pci1xxxx_i2c_get_funcs(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm pci1xxxx_i2c_algo = {
-	.master_xfer = pci1xxxx_i2c_xfer,
+	.xfer = pci1xxxx_i2c_xfer,
 	.functionality = pci1xxxx_i2c_get_funcs,
 };
 
diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index e1d69537353b..0d9032953e48 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -448,8 +448,8 @@ static u32 meson_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm meson_i2c_algorithm = {
-	.master_xfer = meson_i2c_xfer,
-	.master_xfer_atomic = meson_i2c_xfer_atomic,
+	.xfer = meson_i2c_xfer,
+	.xfer_atomic = meson_i2c_xfer_atomic,
 	.functionality = meson_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 492bf4c34722..f173bda1c98c 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -526,7 +526,7 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned
 }
 
 static const struct i2c_algorithm mchp_corei2c_algo = {
-	.master_xfer = mchp_corei2c_xfer,
+	.xfer = mchp_corei2c_xfer,
 	.functionality = mchp_corei2c_func,
 	.smbus_xfer = mchp_corei2c_smbus_xfer,
 };
diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5bd342047d59..ab456c3717db 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1342,7 +1342,7 @@ static u32 mtk_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm mtk_i2c_algorithm = {
-	.master_xfer = mtk_i2c_transfer,
+	.xfer = mtk_i2c_transfer,
 	.functionality = mtk_i2c_functionality,
 };
 
diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index ad62d56b2186..08c9091a1e35 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -687,7 +687,7 @@ static irqreturn_t mxs_i2c_isr(int this_irq, void *dev_id)
 }
 
 static const struct i2c_algorithm mxs_i2c_algo = {
-	.master_xfer = mxs_i2c_xfer,
+	.xfer = mxs_i2c_xfer,
 	.functionality = mxs_i2c_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index d2877e4cc28d..19b648fc094d 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -996,8 +996,8 @@ static unsigned int nmk_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm nmk_i2c_algo = {
-	.master_xfer	= nmk_i2c_xfer,
-	.functionality	= nmk_i2c_functionality
+	.xfer = nmk_i2c_xfer,
+	.functionality = nmk_i2c_functionality
 };
 
 static void nmk_i2c_of_probe(struct device_node *np,
diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 892e2d2988a7..8b7e15240fb0 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2470,11 +2470,11 @@ static const struct i2c_adapter_quirks npcm_i2c_quirks = {
 };
 
 static const struct i2c_algorithm npcm_i2c_algo = {
-	.master_xfer = npcm_i2c_master_xfer,
+	.xfer = npcm_i2c_master_xfer,
 	.functionality = npcm_i2c_functionality,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	.reg_slave	= npcm_i2c_reg_slave,
-	.unreg_slave	= npcm_i2c_unreg_slave,
+	.reg_slave = npcm_i2c_reg_slave,
+	.unreg_slave = npcm_i2c_unreg_slave,
 #endif
 };
 
diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 876791d20ed5..f1cc26ac5b80 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1201,9 +1201,9 @@ omap_i2c_isr_thread(int this_irq, void *dev_id)
 }
 
 static const struct i2c_algorithm omap_i2c_algo = {
-	.master_xfer	= omap_i2c_xfer_irq,
-	.master_xfer_atomic	= omap_i2c_xfer_polling,
-	.functionality	= omap_i2c_func,
+	.xfer = omap_i2c_xfer_irq,
+	.xfer_atomic = omap_i2c_xfer_polling,
+	.functionality = omap_i2c_func,
 };
 
 static const struct i2c_adapter_quirks omap_i2c_quirks = {
diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 9a1af5bbd604..8daa0008bd05 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -580,7 +580,7 @@ static u32 i2c_pnx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm pnx_algorithm = {
-	.master_xfer = i2c_pnx_xfer,
+	.xfer = i2c_pnx_xfer,
 	.functionality = i2c_pnx_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4415a29f749b..968a8b8794da 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1154,11 +1154,11 @@ static u32 i2c_pxa_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm i2c_pxa_algorithm = {
-	.master_xfer	= i2c_pxa_xfer,
-	.functionality	= i2c_pxa_functionality,
+	.xfer = i2c_pxa_xfer,
+	.functionality = i2c_pxa_functionality,
 #ifdef CONFIG_I2C_PXA_SLAVE
-	.reg_slave	= i2c_pxa_slave_reg,
-	.unreg_slave	= i2c_pxa_slave_unreg,
+	.reg_slave = i2c_pxa_slave_reg,
+	.unreg_slave = i2c_pxa_slave_unreg,
 #endif
 };
 
@@ -1244,11 +1244,11 @@ static int i2c_pxa_pio_xfer(struct i2c_adapter *adap,
 }
 
 static const struct i2c_algorithm i2c_pxa_pio_algorithm = {
-	.master_xfer	= i2c_pxa_pio_xfer,
-	.functionality	= i2c_pxa_functionality,
+	.xfer = i2c_pxa_pio_xfer,
+	.functionality = i2c_pxa_functionality,
 #ifdef CONFIG_I2C_PXA_SLAVE
-	.reg_slave	= i2c_pxa_slave_reg,
-	.unreg_slave	= i2c_pxa_slave_unreg,
+	.reg_slave = i2c_pxa_slave_reg,
+	.unreg_slave = i2c_pxa_slave_unreg,
 #endif
 };
 
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 05b73326afd4..a3afa11a71a1 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -462,8 +462,8 @@ static u32 cci_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm cci_algo = {
-	.master_xfer	= cci_xfer,
-	.functionality	= cci_func,
+	.xfer = cci_xfer,
+	.functionality = cci_func,
 };
 
 static int cci_enable_clocks(struct cci *cci)
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ccea575fb783..13889f52b6f7 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -727,8 +727,8 @@ static u32 geni_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm geni_i2c_algo = {
-	.master_xfer	= geni_i2c_xfer,
-	.functionality	= geni_i2c_func,
+	.xfer = geni_i2c_xfer,
+	.functionality = geni_i2c_func,
 };
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 3a36d682ed57..6059f585843e 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1634,13 +1634,13 @@ static u32 qup_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm qup_i2c_algo = {
-	.master_xfer	= qup_i2c_xfer,
-	.functionality	= qup_i2c_func,
+	.xfer = qup_i2c_xfer,
+	.functionality = qup_i2c_func,
 };
 
 static const struct i2c_algorithm qup_i2c_algo_v2 = {
-	.master_xfer	= qup_i2c_xfer_v2,
-	.functionality	= qup_i2c_func,
+	.xfer = qup_i2c_xfer_v2,
+	.functionality = qup_i2c_func,
 };
 
 /*
diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5693a38da7b5..d51884ab99f4 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1084,11 +1084,11 @@ static u32 rcar_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm rcar_i2c_algo = {
-	.master_xfer	= rcar_i2c_master_xfer,
-	.master_xfer_atomic = rcar_i2c_master_xfer_atomic,
-	.functionality	= rcar_i2c_func,
-	.reg_slave	= rcar_reg_slave,
-	.unreg_slave	= rcar_unreg_slave,
+	.xfer = rcar_i2c_master_xfer,
+	.xfer_atomic = rcar_i2c_master_xfer_atomic,
+	.functionality = rcar_i2c_func,
+	.reg_slave = rcar_reg_slave,
+	.unreg_slave = rcar_unreg_slave,
 };
 
 static const struct i2c_adapter_quirks rcar_i2c_quirks = {
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 0f3cf500df68..f4fa4703acbd 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -800,9 +800,9 @@ static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
 
 /* i2c bus registration info */
 static const struct i2c_algorithm s3c24xx_i2c_algorithm = {
-	.master_xfer		= s3c24xx_i2c_xfer,
-	.master_xfer_atomic     = s3c24xx_i2c_xfer_atomic,
-	.functionality		= s3c24xx_i2c_func,
+	.xfer = s3c24xx_i2c_xfer,
+	.xfer_atomic = s3c24xx_i2c_xfer_atomic,
+	.functionality = s3c24xx_i2c_func,
 };
 
 /*
diff --git a/drivers/i2c/busses/i2c-sh7760.c b/drivers/i2c/busses/i2c-sh7760.c
index 620f12596763..43f33988b98f 100644
--- a/drivers/i2c/busses/i2c-sh7760.c
+++ b/drivers/i2c/busses/i2c-sh7760.c
@@ -379,8 +379,8 @@ static u32 sh7760_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm sh7760_i2c_algo = {
-	.master_xfer	= sh7760_i2c_master_xfer,
-	.functionality	= sh7760_i2c_func,
+	.xfer = sh7760_i2c_master_xfer,
+	.functionality = sh7760_i2c_func,
 };
 
 /* calculate CCR register setting for a desired scl clock.  SCL clock is
diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index adfcee6c9fdc..dae8967f8749 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -740,8 +740,8 @@ static u32 sh_mobile_i2c_func(struct i2c_adapter *adapter)
 
 static const struct i2c_algorithm sh_mobile_i2c_algorithm = {
 	.functionality = sh_mobile_i2c_func,
-	.master_xfer = sh_mobile_i2c_xfer,
-	.master_xfer_atomic = sh_mobile_i2c_xfer_atomic,
+	.xfer = sh_mobile_i2c_xfer,
+	.xfer_atomic = sh_mobile_i2c_xfer_atomic,
 };
 
 static const struct i2c_adapter_quirks sh_mobile_i2c_quirks = {
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 973a3a8c6d4a..e4aaeb2262d0 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2151,8 +2151,8 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm stm32f7_i2c_algo = {
-	.master_xfer = stm32f7_i2c_xfer,
-	.master_xfer_atomic = stm32f7_i2c_xfer_atomic,
+	.xfer = stm32f7_i2c_xfer,
+	.xfer_atomic = stm32f7_i2c_xfer_atomic,
 	.smbus_xfer = stm32f7_i2c_smbus_xfer,
 	.functionality = stm32f7_i2c_func,
 	.reg_slave = stm32f7_i2c_reg_slave,
diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index 31f8d08e32a4..1230f51e1624 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -520,8 +520,8 @@ static u32 synquacer_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm synquacer_i2c_algo = {
-	.master_xfer	= synquacer_i2c_xfer,
-	.functionality	= synquacer_i2c_functionality,
+	.xfer = synquacer_i2c_xfer,
+	.functionality = synquacer_i2c_functionality,
 };
 
 static const struct i2c_adapter synquacer_i2c_ops = {
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 049b4d154c23..0862b98007f5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1440,9 +1440,9 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
-	.master_xfer		= tegra_i2c_xfer,
-	.master_xfer_atomic	= tegra_i2c_xfer_atomic,
-	.functionality		= tegra_i2c_func,
+	.xfer = tegra_i2c_xfer,
+	.xfer_atomic = tegra_i2c_xfer_atomic,
+	.functionality = tegra_i2c_func,
 };
 
 /* payload size is only 12 bit */
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 6bc1575cea6c..607026c921d6 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1398,8 +1398,8 @@ static u32 xiic_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm xiic_algorithm = {
-	.master_xfer = xiic_xfer,
-	.master_xfer_atomic = xiic_xfer_atomic,
+	.xfer = xiic_xfer,
+	.xfer_atomic = xiic_xfer_atomic,
 	.functionality = xiic_func,
 };
 
diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
index 4d5e49b6321b..ddb1c3e8bc9d 100644
--- a/drivers/i2c/busses/i2c-xlp9xx.c
+++ b/drivers/i2c/busses/i2c-xlp9xx.c
@@ -452,7 +452,7 @@ static u32 xlp9xx_i2c_functionality(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm xlp9xx_i2c_algo = {
-	.master_xfer = xlp9xx_i2c_xfer,
+	.xfer = xlp9xx_i2c_xfer,
 	.functionality = xlp9xx_i2c_functionality,
 };
 
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index be7d6d41e0b2..dd194476b118 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -738,7 +738,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	atr->flags = flags;
 
 	if (parent->algo->master_xfer)
-		atr->algo.master_xfer = i2c_atr_master_xfer;
+		atr->algo.xfer = i2c_atr_master_xfer;
 	if (parent->algo->smbus_xfer)
 		atr->algo.smbus_xfer = i2c_atr_smbus_xfer;
 	atr->algo.functionality = i2c_atr_functionality;
diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index fda72e8be885..4d8690981a55 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -293,12 +293,12 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	 */
 	if (parent->algo->master_xfer) {
 		if (muxc->mux_locked)
-			priv->algo.master_xfer = i2c_mux_master_xfer;
+			priv->algo.xfer = i2c_mux_master_xfer;
 		else
-			priv->algo.master_xfer = __i2c_mux_master_xfer;
+			priv->algo.xfer = __i2c_mux_master_xfer;
 	}
 	if (parent->algo->master_xfer_atomic)
-		priv->algo.master_xfer_atomic = priv->algo.master_xfer;
+		priv->algo.xfer_atomic = priv->algo.master_xfer;
 
 	if (parent->algo->smbus_xfer) {
 		if (muxc->mux_locked)
diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index 77a740561fd7..f2a1f4744978 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -95,9 +95,9 @@ static int i2c_demux_activate_master(struct i2c_demux_pinctrl_priv *priv, u32 ne
 	priv->cur_chan = new_chan;
 
 	/* Now fill out current adapter structure. cur_chan must be up to date */
-	priv->algo.master_xfer = i2c_demux_master_xfer;
+	priv->algo.xfer = i2c_demux_master_xfer;
 	if (adap->algo->master_xfer_atomic)
-		priv->algo.master_xfer_atomic = i2c_demux_master_xfer;
+		priv->algo.xfer_atomic = i2c_demux_master_xfer;
 	priv->algo.functionality = i2c_demux_functionality;
 
 	snprintf(priv->cur_adap.name, sizeof(priv->cur_adap.name),
-- 
2.47.2


