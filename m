Return-Path: <openbmc+bounces-675-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F874B8BECA
	for <lists+openbmc@lfdr.de>; Sat, 20 Sep 2025 06:15:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTGHS4Vr4z30Vl;
	Sat, 20 Sep 2025 14:15:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758276325;
	cv=none; b=gKVsB+hIC7aVRp7EA3IvTAThVMqzCNAfH9GM4SArO8dnQynylFr4TfPDuqGv/EJcph6Dy3R04TXi7EhpMU/Y0DDDG0CUB768lYj/g6ALxtbr7zViDMHtdcM1qIuJf/ehu7YFGZqSW/vz4+yuxwrgcfoHNgr7wwnXAIozKDsqalxqPE3lkezSrf9pe7ZH1t6UoiX73IVnve44khJae1YQdDNvZ84YxRLLhxd9wwFNexZ7rHRQSDaw3uWRvi66U9UX0n6Pz+LPSYrX/cBIhU3l9ZkrHdAFHzzYOYkAI4hsv4EtaUr92U9GDvOZrQB3tk4kq15xFgx1N5jLw5gbymrmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758276325; c=relaxed/relaxed;
	bh=5h2csvsIynkHtI3mgoCR67siuBNIbWoxqCVSe2CJrts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTW88Fu4uxhnLzjgfFZ5nqKg5K6afThka+eWszWuxuMmwrVXngnebvA5zi44cJRE0rF1F1ciKNb2cBgOmlMiBFhIeT5TpqSyL5dA3LXgsHYp0rqowkCv2amlkj5NSrafe0js9AkAbGGOrLTT5X0zYxC7eKGegUr8v5kgZ11nMvwS79Y9ejD273vVx1+2ZdkkFkQi/DGx0o2amUtPcmVxyXDX2Qi/4fbpRnLHUrObKJkQangoJihk33gSMismqNncwRJeXzid1SUEqbPVbeCKg5nolvllGpmiixPNSqAJ8to6/4Vl1H7zgPqCgx1EGMUhuaJTGUYdLKAxDMHb4FLAAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PlUBeh2M; dkim-atps=neutral; spf=pass (client-ip=213.167.242.64; helo=perceval.ideasonboard.com; envelope-from=jai.luthra@ideasonboard.com; receiver=lists.ozlabs.org) smtp.mailfrom=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PlUBeh2M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ideasonboard.com (client-ip=213.167.242.64; helo=perceval.ideasonboard.com; envelope-from=jai.luthra@ideasonboard.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 494 seconds by postgrey-1.37 at boromir; Fri, 19 Sep 2025 20:05:21 AEST
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSp692F57z2xpn;
	Fri, 19 Sep 2025 20:05:21 +1000 (AEST)
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4816:952:3054:81b6:1a3a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29362842;
	Fri, 19 Sep 2025 11:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758275776;
	bh=PVcIVYgi1U5GQ0iqtJSIWmipD24USGtOXZChfIDQUag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PlUBeh2MEuzjx1/LZR1uL0+t043lpF3lfUOf5VA0LkUQG1A46f0qUjh3at+VSJVMb
	 4k2SmXx9wIVQshJf+fgnRnDXKFrqp6x0sEjjb73DFYV6uG9iBnm8ygtqwz8pGPApXo
	 TmsR2iVRZ/nR01JNkQia/OOc3wRBsw1u4jM+m88s=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 19 Sep 2025 15:25:58 +0530
Subject: [PATCH v2 06/10] media: Replace void * with video_device_state *
 in all driver ioctl implementations
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250919-vdev-state-v2-6-b2c42426965c@ideasonboard.com>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
In-Reply-To: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nick Dyer <nick@shmanahar.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Matt Ranostay <matt@ranostay.sg>, Andy Walls <awalls@md.metrocast.net>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Dan Scally <djrscally@gmail.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Corentin Labbe <clabbe@baylibre.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Keke Li <keke.li@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Joseph Liu <kwliu@nuvoton.com>, 
 Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
 Jacob Chen <jacob-chen@iotwrt.com>, Heiko Stuebner <heiko@sntech.de>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Yong Deng <yong.deng@magewell.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Jai Luthra <jai.luthra@linux.dev>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Eduardo Valentin <edubezval@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Michael Krufky <mkrufky@linuxtv.org>, Mike Isely <isely@pobox.com>, 
 Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Jack Zhu <jack.zhu@starfivetech.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Christian Gromm <christian.gromm@microchip.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Plamen Atanasov <tigerment@mail.bg>, Sean Young <sean@mess.org>, 
 Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Matthew Majewski <mattwmajewski@gmail.com>, Yunseong Kim <ysk@kzalloc.com>, 
 Chen Ni <nichen@iscas.ac.cn>, Ricardo Ribalda <ribalda@chromium.org>, 
 Fabio Luongo <f.langufo.l@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yang Yingliang <yangyingliang@huawei.com>, 
 Ludwig Disterhof <ludwig@disterhof.eu>, Ma Ke <make24@iscas.ac.cn>, 
 "Everest K.C." <everestkc@everestkc.com.np>, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>, 
 Akash Kumar <quic_akakum@quicinc.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mjpeg-users@lists.sourceforge.net, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-tegra@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 kernel@collabora.com, linux-staging@lists.linux.dev, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace the opaque (and unused) pointer with a pointer to the video
device state in all V4L2 driver ioctl implementations.

Most changes were automated using Coccinelle semantic patches for both
drivers and framework helpers:

@ops@
identifier ops;
identifier vidioc_op;
identifier fn;
@@
struct v4l2_ioctl_ops ops = {
	...,
	.vidioc_op = fn,
	...,
};

// Rule 1 (like vidioc_log_status)
@depends on ops@
identifier ops.fn;
identifier filep;
identifier priv;
@@
int fn(struct file *filep,
-      void *priv)
+      struct video_device_state *state)
{
	<...
-	priv
+	state
	...>
}

// Rule 2 (most ioctls)
@depends on ops@
identifier ops.fn;
identifier filep;
identifier priv;
identifier arg;
type T;
@@
int fn(struct file *filep,
-      void *priv,
+      struct video_device_state *state,
       T arg)
{
	<...
-	priv
+	state
	...>
}

// Rule 3 (like vidioc_g_pixelaspect)
@depends on ops@
identifier ops.fn;
identifier filep;
identifier priv;
identifier buf_type;
identifier arg;
type T1, T2;
@@
int fn(struct file *filep,
-      void *priv,
+      struct video_device_state *state,
       T1 buf_type, T2 *arg)
{
	<...
-	priv
+	state
	...>
}

// Rule 4 (like vidioc_default)
@depends on ops@
identifier ops.fn;
identifier filep;
identifier priv;
identifier valid_prio;
identifier cmd;
identifier arg;
@@
long fn(struct file *filep,
-        void *priv,
+        struct video_device_state *state,
         bool valid_prio, unsigned int cmd, void *arg)
{
	<...
-	priv
+	state
	...>
}

Function signature updates in headers and edge cases where drivers call
ioctl implementations internally were handled manually.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
--
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Nick Dyer <nick@shmanahar.org>
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Matt Ranostay <matt@ranostay.sg>
Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Yong Zhi <yong.zhi@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>
Cc: Dan Scally <djrscally@gmail.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>
Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
Cc: Andrey Utkin <andrey_utkin@fastmail.com>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Corentin Labbe <clabbe@baylibre.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Keke Li <keke.li@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Ming Qian <ming.qian@nxp.com>
Cc: Zhou Peng <eagle.zhou@nxp.com>
Cc: Eddie James <eajames@linux.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Eugen Hristev <eugen.hristev@linaro.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Nas Chung <nas.chung@chipsnmedia.com>
Cc: Jackson Lee <jackson.lee@chipsnmedia.com>
Cc: Devarsh Thakkar <devarsht@ti.com>
Cc: Bin Liu <bin.liu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Joseph Liu <kwliu@nuvoton.com>
Cc: Marvin Lin <kflin@nuvoton.com>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Martin Kepplinger <martink@posteo.de>
Cc: Purism Kernel Team <kernel@puri.sm>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Todor Tomov <todor.too@gmail.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Jacob Chen <jacob-chen@iotwrt.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Dafna Hirschfeld <dafna@fastmail.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: "Łukasz Stelmach" <l.stelmach@samsung.com>
Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Yong Deng <yong.deng@magewell.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>
Cc: Shreeya Patel <shreeya.patel@collabora.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: Jai Luthra <jai.luthra@linux.dev>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Michael Krufky <mkrufky@linuxtv.org>
Cc: Mike Isely <isely@pobox.com>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
Cc: Christian Gromm <christian.gromm@microchip.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Plamen Atanasov <tigerment@mail.bg>
Cc: Sean Young <sean@mess.org>
Cc: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Daniel Scally <dan.scally+renesas@ideasonboard.com>
Cc: Matthew Majewski <mattwmajewski@gmail.com>
Cc: Yunseong Kim <ysk@kzalloc.com>
Cc: Chen Ni <nichen@iscas.ac.cn>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Fabio Luongo <f.langufo.l@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Yang Yingliang <yangyingliang@huawei.com>
Cc: Ludwig Disterhof <ludwig@disterhof.eu>
Cc: Ma Ke <make24@iscas.ac.cn>
Cc: "Everest K.C." <everestkc@everestkc.com.np>
Cc: Stefan Wahren <wahrenst@gmx.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Akash Kumar <quic_akakum@quicinc.com>
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: mjpeg-users@lists.sourceforge.net
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: openbmc@lists.ozlabs.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-sunxi@lists.linux.dev
Cc: kernel@collabora.com
Cc: linux-staging@lists.linux.dev
Cc: linux-usb@vger.kernel.org
---
 drivers/input/rmi4/rmi_f54.c                       |  22 +-
 drivers/input/touchscreen/atmel_mxt_ts.c           |  23 +-
 drivers/input/touchscreen/sur40.c                  |  35 ++-
 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |  34 ++-
 drivers/media/common/saa7146/saa7146_video.c       |  37 +++-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |  30 ++-
 drivers/media/dvb-frontends/rtl2832_sdr.c          |  38 ++--
 drivers/media/i2c/video-i2c.c                      |  39 ++--
 drivers/media/pci/bt8xx/bttv-driver.c              |  84 +++++---
 drivers/media/pci/bt8xx/bttv-vbi.c                 |  11 +-
 drivers/media/pci/bt8xx/bttvp.h                    |   9 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c             |  98 +++++----
 drivers/media/pci/cx18/cx18-driver.c               |   9 +-
 drivers/media/pci/cx18/cx18-ioctl.c                | 114 ++++++----
 drivers/media/pci/cx18/cx18-ioctl.h                |   9 +-
 drivers/media/pci/cx23885/cx23885-417.c            |  53 +++--
 drivers/media/pci/cx23885/cx23885-ioctl.c          |   8 +-
 drivers/media/pci/cx23885/cx23885-ioctl.h          |   9 +-
 drivers/media/pci/cx23885/cx23885-vbi.c            |   5 +-
 drivers/media/pci/cx23885/cx23885-video.c          |  82 ++++---
 drivers/media/pci/cx23885/cx23885.h                |   4 +-
 drivers/media/pci/cx25821/cx25821-video.c          |  57 +++--
 drivers/media/pci/cx88/cx88-blackbird.c            |  47 ++--
 drivers/media/pci/cx88/cx88-vbi.c                  |   2 +-
 drivers/media/pci/cx88/cx88-video.c                |  56 +++--
 drivers/media/pci/cx88/cx88.h                      |   2 +-
 drivers/media/pci/dt3155/dt3155.c                  |  25 ++-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  29 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |  41 ++--
 drivers/media/pci/ivtv/ivtv-driver.c               |   8 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                | 225 +++++++++++++------
 drivers/media/pci/ivtv/ivtv-ioctl.h                |   6 +-
 drivers/media/pci/mgb4/mgb4_vin.c                  |  55 +++--
 drivers/media/pci/mgb4/mgb4_vout.c                 |  49 +++--
 drivers/media/pci/saa7134/saa7134-empress.c        |  12 +-
 drivers/media/pci/saa7134/saa7134-video.c          |  96 +++++----
 drivers/media/pci/saa7134/saa7134.h                |  38 ++--
 drivers/media/pci/saa7146/hexium_gemini.c          |  10 +-
 drivers/media/pci/saa7146/hexium_orion.c           |  10 +-
 drivers/media/pci/saa7146/mxb.c                    |  46 ++--
 drivers/media/pci/saa7164/saa7164-encoder.c        |  39 ++--
 drivers/media/pci/saa7164/saa7164-vbi.c            |  27 ++-
 drivers/media/pci/saa7164/saa7164.h                |   9 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     |  46 ++--
 drivers/media/pci/solo6x10/solo6x10-v4l2.c         |  32 ++-
 drivers/media/pci/ttpci/budget-av.c                |  10 +-
 drivers/media/pci/tw5864/tw5864-video.c            |  49 +++--
 drivers/media/pci/tw68/tw68-video.c                |  43 ++--
 drivers/media/pci/tw686x/tw686x-video.c            |  53 +++--
 drivers/media/pci/zoran/zoran_driver.c             |  44 ++--
 drivers/media/platform/allegro-dvt/allegro-core.c  |  49 +++--
 .../media/platform/amlogic/c3/isp/c3-isp-capture.c |  18 +-
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  |   9 +-
 .../media/platform/amlogic/c3/isp/c3-isp-stats.c   |   9 +-
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |  36 +++-
 drivers/media/platform/amphion/vdec.c              |  30 ++-
 drivers/media/platform/amphion/venc.c              |  49 +++--
 drivers/media/platform/aspeed/aspeed-video.c       |  50 +++--
 drivers/media/platform/atmel/atmel-isi.c           |  36 ++--
 drivers/media/platform/broadcom/bcm2835-unicam.c   |  33 ++-
 .../media/platform/chips-media/coda/coda-common.c  |  69 +++---
 .../platform/chips-media/wave5/wave5-helper.c      |   2 +-
 .../platform/chips-media/wave5/wave5-helper.h      |   3 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |  54 +++--
 .../platform/chips-media/wave5/wave5-vpu-enc.c     |  62 ++++--
 .../media/platform/imagination/e5010-jpeg-enc.c    |  34 ++-
 drivers/media/platform/intel/pxa_camera.c          |  34 ++-
 drivers/media/platform/m2m-deinterlace.c           |  34 +--
 drivers/media/platform/marvell/mcam-core.c         |  52 +++--
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |  44 ++--
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  |  34 +--
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  25 ++-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  52 +++--
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       |  50 +++--
 .../media/platform/microchip/microchip-isc-base.c  |  33 ++-
 drivers/media/platform/nuvoton/npcm-video.c        |  43 ++--
 drivers/media/platform/nvidia/tegra-vde/v4l2.c     |  38 ++--
 drivers/media/platform/nxp/dw100/dw100.c           |  35 +--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  52 +++--
 drivers/media/platform/nxp/imx-pxp.c               |  34 +--
 drivers/media/platform/nxp/imx7-media-csi.c        |  21 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  15 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |  18 +-
 drivers/media/platform/nxp/mx2_emmaprp.c           |  31 ++-
 drivers/media/platform/qcom/camss/camss-video.c    |  27 ++-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  48 +++--
 drivers/media/platform/qcom/venus/vdec.c           |  29 ++-
 drivers/media/platform/qcom/venus/venc.c           |  38 ++--
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   |  42 ++--
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   |  40 ++--
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |  21 +-
 drivers/media/platform/renesas/rcar_drif.c         |  30 ++-
 drivers/media/platform/renesas/rcar_fdp1.c         |  18 +-
 drivers/media/platform/renesas/rcar_jpu.c          |  21 +-
 drivers/media/platform/renesas/renesas-ceu.c       |  36 ++--
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  18 +-
 drivers/media/platform/renesas/sh_vou.c            |  41 ++--
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |   9 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |  18 +-
 drivers/media/platform/rockchip/rga/rga.c          |  24 ++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |  18 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |  15 +-
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |   9 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  34 +--
 .../media/platform/samsung/exynos-gsc/gsc-m2m.c    |  44 ++--
 .../platform/samsung/exynos4-is/fimc-capture.c     |  45 ++--
 .../platform/samsung/exynos4-is/fimc-isp-video.c   |  32 +--
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |  36 ++--
 .../media/platform/samsung/exynos4-is/fimc-m2m.c   |  21 +-
 .../platform/samsung/s3c-camif/camif-capture.c     |  54 +++--
 drivers/media/platform/samsung/s5p-g2d/g2d.c       |  26 ++-
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |  34 +--
 .../media/platform/samsung/s5p-mfc/s5p_mfc_dec.c   |  48 +++--
 .../media/platform/samsung/s5p-mfc/s5p_mfc_enc.c   |  51 +++--
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   |  26 ++-
 drivers/media/platform/st/sti/delta/delta-v4l2.c   |  44 ++--
 drivers/media/platform/st/sti/hva/hva-v4l2.c       |  46 ++--
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |  18 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |  42 ++--
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  20 +-
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |  25 ++-
 .../platform/sunxi/sun6i-csi/sun6i_csi_capture.c   |  24 ++-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |  31 ++-
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  34 +--
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |  47 ++--
 drivers/media/platform/ti/am437x/am437x-vpfe.c     |  52 +++--
 drivers/media/platform/ti/cal/cal-video.c          |  54 +++--
 drivers/media/platform/ti/davinci/vpif_capture.c   |  94 ++++----
 drivers/media/platform/ti/davinci/vpif_display.c   |  58 +++--
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |  20 +-
 drivers/media/platform/ti/omap/omap_vout.c         |  49 +++--
 drivers/media/platform/ti/omap3isp/ispvideo.c      |  53 +++--
 drivers/media/platform/ti/vpe/vpe.c                |  25 ++-
 drivers/media/platform/verisilicon/hantro_v4l2.c   |  47 ++--
 drivers/media/platform/via/via-camera.c            |  42 ++--
 drivers/media/platform/xilinx/xilinx-dma.c         |  15 +-
 drivers/media/radio/dsbr100.c                      |  15 +-
 drivers/media/radio/radio-cadet.c                  |  18 +-
 drivers/media/radio/radio-isa.c                    |  18 +-
 drivers/media/radio/radio-keene.c                  |  15 +-
 drivers/media/radio/radio-ma901.c                  |  15 +-
 drivers/media/radio/radio-miropcm20.c              |  15 +-
 drivers/media/radio/radio-mr800.c                  |  18 +-
 drivers/media/radio/radio-raremono.c               |  19 +-
 drivers/media/radio/radio-sf16fmi.c                |  15 +-
 drivers/media/radio/radio-si476x.c                 |  28 ++-
 drivers/media/radio/radio-tea5764.c                |  15 +-
 drivers/media/radio/radio-tea5777.c                |  21 +-
 drivers/media/radio/radio-timb.c                   |  26 ++-
 drivers/media/radio/si470x/radio-si470x-common.c   |  25 ++-
 drivers/media/radio/si4713/radio-platform-si4713.c |  18 +-
 drivers/media/radio/si4713/radio-usb-si4713.c      |  15 +-
 drivers/media/radio/tea575x.c                      |  21 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  54 +++--
 drivers/media/test-drivers/vim2m.c                 |  56 +++--
 drivers/media/test-drivers/vimc/vimc-capture.c     |  20 +-
 drivers/media/test-drivers/visl/visl-video.c       |  34 +--
 drivers/media/test-drivers/vivid/vivid-core.c      | 203 ++++++++++--------
 drivers/media/test-drivers/vivid/vivid-meta-cap.c  |   6 +-
 drivers/media/test-drivers/vivid/vivid-meta-cap.h  |   6 +-
 drivers/media/test-drivers/vivid/vivid-meta-out.c  |   6 +-
 drivers/media/test-drivers/vivid/vivid-meta-out.h  |   9 +-
 drivers/media/test-drivers/vivid/vivid-radio-rx.c  |  16 +-
 drivers/media/test-drivers/vivid/vivid-radio-rx.h  |  16 +-
 drivers/media/test-drivers/vivid/vivid-radio-tx.c  |   6 +-
 drivers/media/test-drivers/vivid/vivid-radio-tx.h  |   6 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   |  30 ++-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.h   |  30 ++-
 drivers/media/test-drivers/vivid/vivid-touch-cap.c |  22 +-
 drivers/media/test-drivers/vivid/vivid-touch-cap.h |  22 +-
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c   |  26 ++-
 drivers/media/test-drivers/vivid/vivid-vbi-cap.h   |  22 +-
 drivers/media/test-drivers/vivid/vivid-vbi-out.c   |  22 +-
 drivers/media/test-drivers/vivid/vivid-vbi-out.h   |  18 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   | 114 ++++++----
 drivers/media/test-drivers/vivid/vivid-vid-cap.h   | 117 +++++++---
 .../media/test-drivers/vivid/vivid-vid-common.c    |  24 ++-
 .../media/test-drivers/vivid/vivid-vid-common.h    |  34 +--
 drivers/media/test-drivers/vivid/vivid-vid-out.c   | 122 ++++++-----
 drivers/media/test-drivers/vivid/vivid-vid-out.h   |  95 +++++---
 drivers/media/usb/airspy/airspy.c                  |  37 ++--
 drivers/media/usb/au0828/au0828-video.c            |  74 ++++---
 drivers/media/usb/cx231xx/cx231xx-417.c            |  28 ++-
 drivers/media/usb/cx231xx/cx231xx-video.c          |  79 ++++---
 drivers/media/usb/cx231xx/cx231xx.h                |  39 ++--
 drivers/media/usb/dvb-usb/cxusb-analog.c           |  48 +++--
 drivers/media/usb/em28xx/em28xx-video.c            |  87 +++++---
 drivers/media/usb/go7007/go7007-v4l2.c             |  75 ++++---
 drivers/media/usb/gspca/gspca.c                    |  51 +++--
 drivers/media/usb/hackrf/hackrf.c                  |  39 ++--
 drivers/media/usb/hdpvr/hdpvr-video.c              |  60 ++++--
 drivers/media/usb/msi2500/msi2500.c                |  31 ++-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |  98 ++++++---
 drivers/media/usb/pwc/pwc-v4l.c                    |  44 ++--
 drivers/media/usb/s2255/s2255drv.c                 |  55 +++--
 drivers/media/usb/stk1160/stk1160-v4l.c            |  40 ++--
 drivers/media/usb/usbtv/usbtv-video.c              |  24 ++-
 drivers/media/usb/uvc/uvc_metadata.c               |  17 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |  59 +++--
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   2 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |   4 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |  56 +++--
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  72 ++++---
 drivers/staging/media/av7110/av7110_v4l.c          |  60 ++++--
 .../media/deprecated/atmel/atmel-isc-base.c        |  33 ++-
 drivers/staging/media/imx/imx-media-capture.c      |  53 +++--
 drivers/staging/media/imx/imx-media-csc-scaler.c   |  23 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |  29 ++-
 drivers/staging/media/ipu7/ipu7-isys-video.c       |  30 ++-
 drivers/staging/media/meson/vdec/vdec.c            |  26 ++-
 drivers/staging/media/starfive/camss/stf-video.c   |  18 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  29 ++-
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c      |  24 ++-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c       |   9 +-
 drivers/staging/media/tegra-video/vi.c             |  68 ++++--
 drivers/staging/most/video/video.c                 |  39 ++--
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  |  58 +++--
 drivers/usb/gadget/function/uvc_v4l2.c             |  50 +++--
 include/media/v4l2-ctrls.h                         |   5 +-
 include/media/v4l2-dev.h                           |   2 +-
 include/media/v4l2-ioctl.h                         | 238 +++++++++++----------
 include/media/v4l2-mem2mem.h                       |  48 +++--
 include/media/videobuf2-v4l2.h                     |  33 +--
 223 files changed, 5392 insertions(+), 2955 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index ac4041a69fcd3acf766ac8189ea0ecccb9b7ac93..b66b80d76833bfe56f04f70ce908307692632f48 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -383,7 +383,8 @@ static const struct vb2_queue rmi_f54_queue = {
 	.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC,
 };
 
-static int rmi_f54_vidioc_querycap(struct file *file, void *priv,
+static int rmi_f54_vidioc_querycap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_capability *cap)
 {
 	struct f54_data *f54 = video_drvdata(file);
@@ -396,7 +397,8 @@ static int rmi_f54_vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rmi_f54_vidioc_enum_input(struct file *file, void *priv,
+static int rmi_f54_vidioc_enum_input(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_input *i)
 {
 	struct f54_data *f54 = video_drvdata(file);
@@ -442,12 +444,15 @@ static int rmi_f54_set_input(struct f54_data *f54, unsigned int i)
 	return 0;
 }
 
-static int rmi_f54_vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int rmi_f54_vidioc_s_input(struct file *file,
+				  struct video_device_state *state,
+				  unsigned int i)
 {
 	return rmi_f54_set_input(video_drvdata(file), i);
 }
 
-static int rmi_f54_vidioc_g_input(struct file *file, void *priv,
+static int rmi_f54_vidioc_g_input(struct file *file,
+				  struct video_device_state *state,
 				  unsigned int *i)
 {
 	struct f54_data *f54 = video_drvdata(file);
@@ -457,7 +462,8 @@ static int rmi_f54_vidioc_g_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int rmi_f54_vidioc_fmt(struct file *file, void *priv,
+static int rmi_f54_vidioc_fmt(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct f54_data *f54 = video_drvdata(file);
@@ -467,7 +473,8 @@ static int rmi_f54_vidioc_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int rmi_f54_vidioc_enum_fmt(struct file *file, void *priv,
+static int rmi_f54_vidioc_enum_fmt(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *fmt)
 {
 	struct f54_data *f54 = video_drvdata(file);
@@ -483,7 +490,8 @@ static int rmi_f54_vidioc_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int rmi_f54_vidioc_g_parm(struct file *file, void *fh,
+static int rmi_f54_vidioc_g_parm(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_streamparm *a)
 {
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 322d5a3d40a0933f1e1c290e906258a874bcf4b2..255e2e7713e3371b56736ded22b66d7df9cf8f49 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2547,7 +2547,8 @@ static const struct vb2_queue mxt_queue = {
 	.min_queued_buffers = 1,
 };
 
-static int mxt_vidioc_querycap(struct file *file, void *priv,
+static int mxt_vidioc_querycap(struct file *file,
+			       struct video_device_state *state,
 				 struct v4l2_capability *cap)
 {
 	struct mxt_data *data = video_drvdata(file);
@@ -2559,7 +2560,8 @@ static int mxt_vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int mxt_vidioc_enum_input(struct file *file, void *priv,
+static int mxt_vidioc_enum_input(struct file *file,
+				 struct video_device_state *state,
 				   struct v4l2_input *i)
 {
 	if (i->index >= MXT_V4L_INPUT_MAX)
@@ -2604,12 +2606,16 @@ static int mxt_set_input(struct mxt_data *data, unsigned int i)
 	return 0;
 }
 
-static int mxt_vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int mxt_vidioc_s_input(struct file *file,
+			      struct video_device_state *state,
+			      unsigned int i)
 {
 	return mxt_set_input(video_drvdata(file), i);
 }
 
-static int mxt_vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int mxt_vidioc_g_input(struct file *file,
+			      struct video_device_state *state,
+			      unsigned int *i)
 {
 	struct mxt_data *data = video_drvdata(file);
 
@@ -2618,7 +2624,8 @@ static int mxt_vidioc_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int mxt_vidioc_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int mxt_vidioc_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct mxt_data *data = video_drvdata(file);
 
@@ -2628,7 +2635,8 @@ static int mxt_vidioc_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int mxt_vidioc_enum_fmt(struct file *file, void *priv,
+static int mxt_vidioc_enum_fmt(struct file *file,
+			       struct video_device_state *state,
 				 struct v4l2_fmtdesc *fmt)
 {
 	if (fmt->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -2650,7 +2658,8 @@ static int mxt_vidioc_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int mxt_vidioc_g_parm(struct file *file, void *fh,
+static int mxt_vidioc_g_parm(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_streamparm *a)
 {
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 7b3b10cbfcfc44eabd56a4a39551c44eed730de8..6bc51ad2cd0a47029aade52456003f3be90ec932 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -935,7 +935,8 @@ static void sur40_stop_streaming(struct vb2_queue *vq)
 }
 
 /* V4L ioctl */
-static int sur40_vidioc_querycap(struct file *file, void *priv,
+static int sur40_vidioc_querycap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_capability *cap)
 {
 	struct sur40_state *sur40 = video_drvdata(file);
@@ -946,7 +947,8 @@ static int sur40_vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int sur40_vidioc_enum_input(struct file *file, void *priv,
+static int sur40_vidioc_enum_input(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_input *i)
 {
 	if (i->index != 0)
@@ -958,18 +960,23 @@ static int sur40_vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int sur40_vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int sur40_vidioc_s_input(struct file *file,
+				struct video_device_state *state,
+				unsigned int i)
 {
 	return (i == 0) ? 0 : -EINVAL;
 }
 
-static int sur40_vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int sur40_vidioc_g_input(struct file *file,
+				struct video_device_state *state,
+				unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int sur40_vidioc_try_fmt(struct file *file, void *priv,
+static int sur40_vidioc_try_fmt(struct file *file,
+				struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	switch (f->fmt.pix.pixelformat) {
@@ -985,7 +992,8 @@ static int sur40_vidioc_try_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sur40_vidioc_s_fmt(struct file *file, void *priv,
+static int sur40_vidioc_s_fmt(struct file *file,
+			      struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct sur40_state *sur40 = video_drvdata(file);
@@ -1004,7 +1012,8 @@ static int sur40_vidioc_s_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sur40_vidioc_g_fmt(struct file *file, void *priv,
+static int sur40_vidioc_g_fmt(struct file *file,
+			      struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct sur40_state *sur40 = video_drvdata(file);
@@ -1038,7 +1047,8 @@ static int sur40_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
-static int sur40_ioctl_parm(struct file *file, void *priv,
+static int sur40_ioctl_parm(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_streamparm *p)
 {
 	if (p->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -1051,7 +1061,8 @@ static int sur40_ioctl_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int sur40_vidioc_enum_fmt(struct file *file, void *priv,
+static int sur40_vidioc_enum_fmt(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(sur40_pix_format))
@@ -1062,7 +1073,8 @@ static int sur40_vidioc_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sur40_vidioc_enum_framesizes(struct file *file, void *priv,
+static int sur40_vidioc_enum_framesizes(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_frmsizeenum *f)
 {
 	struct sur40_state *sur40 = video_drvdata(file);
@@ -1077,7 +1089,8 @@ static int sur40_vidioc_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int sur40_vidioc_enum_frameintervals(struct file *file, void *priv,
+static int sur40_vidioc_enum_frameintervals(struct file *file,
+					    struct video_device_state *state,
 					    struct v4l2_frmivalenum *f)
 {
 	struct sur40_state *sur40 = video_drvdata(file);
diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index e2eff17952ab237b799f9892159254146319f4c7..ebefd5e5c747aa9646d7a45414a661d076cf1e4a 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1195,7 +1195,8 @@ static const struct cec_adap_ops extron_cec_adap_ops = {
 	.received = extron_received,
 };
 
-static int extron_querycap(struct file *file, void *priv,
+static int extron_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct extron_port *port = video_drvdata(file);
@@ -1206,7 +1207,9 @@ static int extron_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int extron_enum_input(struct file *file, void *priv, struct v4l2_input *inp)
+static int extron_enum_input(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_input *inp)
 {
 	struct extron_port *port = video_drvdata(file);
 
@@ -1219,18 +1222,22 @@ static int extron_enum_input(struct file *file, void *priv, struct v4l2_input *i
 	return 0;
 }
 
-static int extron_g_input(struct file *file, void *priv, unsigned int *i)
+static int extron_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int extron_s_input(struct file *file, void *priv, unsigned int i)
+static int extron_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	return i ? -EINVAL : 0;
 }
 
-static int extron_enum_output(struct file *file, void *priv, struct v4l2_output *out)
+static int extron_enum_output(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_output *out)
 {
 	struct extron_port *port = video_drvdata(file);
 
@@ -1241,18 +1248,21 @@ static int extron_enum_output(struct file *file, void *priv, struct v4l2_output
 	return 0;
 }
 
-static int extron_g_output(struct file *file, void *priv, unsigned int *o)
+static int extron_g_output(struct file *file,
+			   struct video_device_state *state, unsigned int *o)
 {
 	*o = 0;
 	return 0;
 }
 
-static int extron_s_output(struct file *file, void *priv, unsigned int o)
+static int extron_s_output(struct file *file,
+			   struct video_device_state *state, unsigned int o)
 {
 	return o ? -EINVAL : 0;
 }
 
-static int extron_g_edid(struct file *file, void *priv,
+static int extron_g_edid(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_edid *edid)
 {
 	struct extron_port *port = video_drvdata(file);
@@ -1280,7 +1290,8 @@ static int extron_g_edid(struct file *file, void *priv,
 	return 0;
 }
 
-static int extron_s_edid(struct file *file, void *priv, struct v4l2_edid *edid)
+static int extron_s_edid(struct file *file, struct video_device_state *state,
+			 struct v4l2_edid *edid)
 {
 	struct extron_port *port = video_drvdata(file);
 
@@ -1305,12 +1316,13 @@ static int extron_s_edid(struct file *file, void *priv, struct v4l2_edid *edid)
 	return extron_write_edid(port, edid->edid, edid->blocks);
 }
 
-static int extron_log_status(struct file *file, void *priv)
+static int extron_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct extron_port *port = video_drvdata(file);
 
 	extron_adap_status(port->adap, NULL);
-	return v4l2_ctrl_log_status(file, priv);
+	return v4l2_ctrl_log_status(file, state);
 }
 
 static const struct v4l2_ioctl_ops extron_ioctl_ops = {
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 733e18001d0d418d32c517b80dee57130b379b07..768be0c6bfdeee70939fbe872a85e99fafe4cd25 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -251,7 +251,9 @@ static void video_end(struct saa7146_dev *dev)
 	saa7146_res_free(dev, resource);
 }
 
-static int vidioc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_capability *cap)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 
@@ -264,7 +266,9 @@ static int vidioc_querycap(struct file *file, void *fh, struct v4l2_capability *
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(formats))
 		return -EINVAL;
@@ -323,7 +327,8 @@ int saa7146_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
-static int vidioc_g_parm(struct file *file, void *fh,
+static int vidioc_g_parm(struct file *file,
+			 struct video_device_state *state,
 		struct v4l2_streamparm *parm)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
@@ -337,7 +342,9 @@ static int vidioc_g_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
@@ -346,7 +353,9 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format
 	return 0;
 }
 
-static int vidioc_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int vidioc_g_fmt_vbi_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
@@ -355,7 +364,9 @@ static int vidioc_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
@@ -364,7 +375,7 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_forma
 	int maxw, maxh;
 	int calc_bpl;
 
-	DEB_EE("V4L2_BUF_TYPE_VIDEO_CAPTURE: dev:%p, fh:%p\n", dev, fh);
+	DEB_EE("V4L2_BUF_TYPE_VIDEO_CAPTURE: dev:%p, fh:%p\n", dev, state);
 
 	fmt = saa7146_format_by_fourcc(dev, f->fmt.pix.pixelformat);
 	if (NULL == fmt)
@@ -417,7 +428,9 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_forma
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
@@ -428,7 +441,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format
 		DEB_EE("streaming capture is active\n");
 		return -EBUSY;
 	}
-	err = vidioc_try_fmt_vid_cap(file, fh, f);
+	err = vidioc_try_fmt_vid_cap(file, state, f);
 	if (0 != err)
 		return err;
 	switch (f->fmt.pix.field) {
@@ -445,7 +458,8 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *fh, v4l2_std_id *norm)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *norm)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
@@ -454,7 +468,8 @@ static int vidioc_g_std(struct file *file, void *fh, v4l2_std_id *norm)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index d911021c1bb0527777d2da18bef8f0562e32b460..01f0ee4f81d1c478e3ad80f30c97ceccb9e542d8 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -996,7 +996,8 @@ EXPORT_SYMBOL_GPL(vb2_poll);
 
 /* vb2 ioctl helpers */
 
-int vb2_ioctl_remove_bufs(struct file *file, void *priv,
+int vb2_ioctl_remove_bufs(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_remove_buffers *d)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -1014,7 +1015,8 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);
 
-int vb2_ioctl_reqbufs(struct file *file, void *priv,
+int vb2_ioctl_reqbufs(struct file *file,
+		      struct video_device_state *state,
 			  struct v4l2_requestbuffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -1037,7 +1039,8 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_reqbufs);
 
-int vb2_ioctl_create_bufs(struct file *file, void *priv,
+int vb2_ioctl_create_bufs(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_create_buffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -1064,7 +1067,8 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_create_bufs);
 
-int vb2_ioctl_prepare_buf(struct file *file, void *priv,
+int vb2_ioctl_prepare_buf(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -1075,7 +1079,8 @@ int vb2_ioctl_prepare_buf(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_prepare_buf);
 
-int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
+int vb2_ioctl_querybuf(struct file *file, struct video_device_state *state,
+		       struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
 
@@ -1084,7 +1089,8 @@ int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_querybuf);
 
-int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
+int vb2_ioctl_qbuf(struct file *file, struct video_device_state *state,
+		   struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
 
@@ -1094,7 +1100,8 @@ int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_qbuf);
 
-int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
+int vb2_ioctl_dqbuf(struct file *file, struct video_device_state *state,
+		    struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
 
@@ -1104,7 +1111,8 @@ int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_dqbuf);
 
-int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
+int vb2_ioctl_streamon(struct file *file, struct video_device_state *state,
+		       enum v4l2_buf_type i)
 {
 	struct video_device *vdev = video_devdata(file);
 
@@ -1114,7 +1122,8 @@ int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_streamon);
 
-int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
+int vb2_ioctl_streamoff(struct file *file, struct video_device_state *state,
+			enum v4l2_buf_type i)
 {
 	struct video_device *vdev = video_devdata(file);
 
@@ -1124,7 +1133,8 @@ int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_streamoff);
 
-int vb2_ioctl_expbuf(struct file *file, void *priv, struct v4l2_exportbuffer *p)
+int vb2_ioctl_expbuf(struct file *file, struct video_device_state *state,
+		     struct v4l2_exportbuffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
 
diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 0357624968f1b542772d8cc751211c0bf28e19ab..986637c4bec7da0dc8a13ded8829e11b0f8a4415 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -418,8 +418,8 @@ static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev)
 	spin_unlock_irqrestore(&dev->queued_bufs_lock, flags);
 }
 
-static int rtl2832_sdr_querycap(struct file *file, void *fh,
-		struct v4l2_capability *cap)
+static int rtl2832_sdr_querycap(struct file *file,
+				struct video_device_state *state, struct v4l2_capability *cap)
 {
 	struct rtl2832_sdr_dev *dev = video_drvdata(file);
 	struct platform_device *pdev = dev->pdev;
@@ -949,8 +949,8 @@ static const struct vb2_ops rtl2832_sdr_vb2_ops = {
 	.stop_streaming         = rtl2832_sdr_stop_streaming,
 };
 
-static int rtl2832_sdr_g_tuner(struct file *file, void *priv,
-		struct v4l2_tuner *v)
+static int rtl2832_sdr_g_tuner(struct file *file,
+			       struct video_device_state *state, struct v4l2_tuner *v)
 {
 	struct rtl2832_sdr_dev *dev = video_drvdata(file);
 	struct platform_device *pdev = dev->pdev;
@@ -981,8 +981,8 @@ static int rtl2832_sdr_g_tuner(struct file *file, void *priv,
 	return ret;
 }
 
-static int rtl2832_sdr_s_tuner(struct file *file, void *priv,
-		const struct v4l2_tuner *v)
+static int rtl2832_sdr_s_tuner(struct file *file,
+			       struct video_device_state *state, const struct v4l2_tuner *v)
 {
 	struct rtl2832_sdr_dev *dev = video_drvdata(file);
 	struct platform_device *pdev = dev->pdev;
@@ -1003,7 +1003,8 @@ static int rtl2832_sdr_s_tuner(struct file *file, void *priv,
 	return ret;
 }
 
-static int rtl2832_sdr_enum_freq_bands(struct file *file, void *priv,
+static int rtl2832_sdr_enum_freq_bands(struct file *file,
+				       struct video_device_state *state,
 		struct v4l2_frequency_band *band)
 {
 	struct rtl2832_sdr_dev *dev = video_drvdata(file);
@@ -1034,8 +1035,8 @@ static int rtl2832_sdr_enum_freq_bands(struct file *file, void *priv,
 	return ret;
 }
 
-static int rtl2832_sdr_g_frequency(struct file *file, void *priv,
-		struct v4l2_frequency *f)
+static int rtl2832_sdr_g_frequency(struct file *file,
+				   struct video_device_state *state, struct v4l2_frequency *f)
 {
 	struct rtl2832_sdr_dev *dev = video_drvdata(file);
 	struct platform_device *pdev = dev->pdev;
@@ -1061,7 +1062,8 @@ static int rtl2832_sdr_g_frequency(struct file *file, void *priv,
 	return ret;
 }
 
-static int rtl2832_sdr_s_frequency(struct file *file, void *priv,
+static int rtl2832_sdr_s_frequency(struct file *file,
+				   struct video_device_state *state,
 		const struct v4l2_frequency *f)
 {
 	struct rtl2832_sdr_dev *dev = video_drvdata(file);
@@ -1105,8 +1107,8 @@ static int rtl2832_sdr_s_frequency(struct file *file, void *priv,
 	return ret;
 }
 
-static int rtl2832_sdr_enum_fmt_sdr_cap(struct file *file, void *priv,
-		struct v4l2_fmtdesc *f)
+static int rtl2832_sdr_enum_fmt_sdr_cap(struct file *file,
+					struct video_device_state *state, struct v4l2_fmtdesc *f)
 {
 	struct rtl2832_sdr_dev *dev = video_drvdata(file);
 	struct platform_device *pdev = dev->pdev;
@@ -1121,8 +1123,8 @@ static int rtl2832_sdr_enum_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rtl2832_sdr_g_fmt_sdr_cap(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int rtl2832_sdr_g_fmt_sdr_cap(struct file *file,
+				     struct video_device_state *state, struct v4l2_format *f)
 {
 	struct rtl2832_sdr_dev *dev = video_drvdata(file);
 	struct platform_device *pdev = dev->pdev;
@@ -1135,8 +1137,8 @@ static int rtl2832_sdr_g_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rtl2832_sdr_s_fmt_sdr_cap(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int rtl2832_sdr_s_fmt_sdr_cap(struct file *file,
+				     struct video_device_state *state, struct v4l2_format *f)
 {
 	struct rtl2832_sdr_dev *dev = video_drvdata(file);
 	struct platform_device *pdev = dev->pdev;
@@ -1166,8 +1168,8 @@ static int rtl2832_sdr_s_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rtl2832_sdr_try_fmt_sdr_cap(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int rtl2832_sdr_try_fmt_sdr_cap(struct file *file,
+				       struct video_device_state *state, struct v4l2_format *f)
 {
 	struct rtl2832_sdr_dev *dev = video_drvdata(file);
 	struct platform_device *pdev = dev->pdev;
diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 0dd991d70d538050731c0106533d6f0618853b1f..96c1b9e7db719602cada653257d77ee6e103d319 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -558,7 +558,8 @@ static const struct vb2_ops video_i2c_video_qops = {
 	.stop_streaming		= stop_streaming,
 };
 
-static int video_i2c_querycap(struct file *file, void  *priv,
+static int video_i2c_querycap(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_capability *vcap)
 {
 	struct video_i2c_data *data = video_drvdata(file);
@@ -573,19 +574,24 @@ static int video_i2c_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int video_i2c_g_input(struct file *file, void *fh, unsigned int *inp)
+static int video_i2c_g_input(struct file *file,
+			     struct video_device_state *state,
+			     unsigned int *inp)
 {
 	*inp = 0;
 
 	return 0;
 }
 
-static int video_i2c_s_input(struct file *file, void *fh, unsigned int inp)
+static int video_i2c_s_input(struct file *file,
+			     struct video_device_state *state,
+			     unsigned int inp)
 {
 	return (inp > 0) ? -EINVAL : 0;
 }
 
-static int video_i2c_enum_input(struct file *file, void *fh,
+static int video_i2c_enum_input(struct file *file,
+				struct video_device_state *state,
 				  struct v4l2_input *vin)
 {
 	if (vin->index > 0)
@@ -598,7 +604,8 @@ static int video_i2c_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int video_i2c_enum_fmt_vid_cap(struct file *file, void *fh,
+static int video_i2c_enum_fmt_vid_cap(struct file *file,
+				      struct video_device_state *state,
 					struct v4l2_fmtdesc *fmt)
 {
 	struct video_i2c_data *data = video_drvdata(file);
@@ -613,7 +620,8 @@ static int video_i2c_enum_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int video_i2c_enum_framesizes(struct file *file, void *fh,
+static int video_i2c_enum_framesizes(struct file *file,
+				     struct video_device_state *state,
 				       struct v4l2_frmsizeenum *fsize)
 {
 	const struct video_i2c_data *data = video_drvdata(file);
@@ -633,7 +641,8 @@ static int video_i2c_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int video_i2c_enum_frameintervals(struct file *file, void *priv,
+static int video_i2c_enum_frameintervals(struct file *file,
+					 struct video_device_state *state,
 					   struct v4l2_frmivalenum *fe)
 {
 	const struct video_i2c_data *data = video_drvdata(file);
@@ -651,7 +660,8 @@ static int video_i2c_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-static int video_i2c_try_fmt_vid_cap(struct file *file, void *fh,
+static int video_i2c_try_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				       struct v4l2_format *fmt)
 {
 	const struct video_i2c_data *data = video_drvdata(file);
@@ -670,7 +680,8 @@ static int video_i2c_try_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int video_i2c_s_fmt_vid_cap(struct file *file, void *fh,
+static int video_i2c_s_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				     struct v4l2_format *fmt)
 {
 	struct video_i2c_data *data = video_drvdata(file);
@@ -678,10 +689,11 @@ static int video_i2c_s_fmt_vid_cap(struct file *file, void *fh,
 	if (vb2_is_busy(&data->vb_vidq))
 		return -EBUSY;
 
-	return video_i2c_try_fmt_vid_cap(file, fh, fmt);
+	return video_i2c_try_fmt_vid_cap(file, state, fmt);
 }
 
-static int video_i2c_g_parm(struct file *filp, void *priv,
+static int video_i2c_g_parm(struct file *filp,
+			    struct video_device_state *state,
 			      struct v4l2_streamparm *parm)
 {
 	struct video_i2c_data *data = video_drvdata(filp);
@@ -696,7 +708,8 @@ static int video_i2c_g_parm(struct file *filp, void *priv,
 	return 0;
 }
 
-static int video_i2c_s_parm(struct file *filp, void *priv,
+static int video_i2c_s_parm(struct file *filp,
+			    struct video_device_state *state,
 			      struct v4l2_streamparm *parm)
 {
 	struct video_i2c_data *data = video_drvdata(filp);
@@ -709,7 +722,7 @@ static int video_i2c_s_parm(struct file *filp, void *priv,
 	}
 	data->frame_interval = data->chip->frame_intervals[i];
 
-	return video_i2c_g_parm(filp, priv, parm);
+	return video_i2c_g_parm(filp, state, parm);
 }
 
 static const struct v4l2_ioctl_ops video_i2c_ioctl_ops = {
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 17e4529e537ab654bd6814dceda005ad652c8533..e9b8e7a53fdbf69262f574b52fdafe79bf9ec8f2 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -1597,7 +1597,8 @@ static void radio_enable(struct bttv *btv)
 	}
 }
 
-static int bttv_s_std(struct file *file, void *priv, v4l2_std_id id)
+static int bttv_s_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id id)
 {
 	struct bttv *btv = video_drvdata(file);
 	unsigned int i;
@@ -1612,7 +1613,8 @@ static int bttv_s_std(struct file *file, void *priv, v4l2_std_id id)
 	return 0;
 }
 
-static int bttv_g_std(struct file *file, void *priv, v4l2_std_id *id)
+static int bttv_g_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id *id)
 {
 	struct bttv *btv = video_drvdata(file);
 
@@ -1620,7 +1622,8 @@ static int bttv_g_std(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-static int bttv_querystd(struct file *file, void *priv, v4l2_std_id *id)
+static int bttv_querystd(struct file *file, struct video_device_state *state,
+			 v4l2_std_id *id)
 {
 	struct bttv *btv = video_drvdata(file);
 
@@ -1631,7 +1634,8 @@ static int bttv_querystd(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-static int bttv_enum_input(struct file *file, void *priv,
+static int bttv_enum_input(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_input *i)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -1664,7 +1668,8 @@ static int bttv_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_g_input(struct file *file, void *priv, unsigned int *i)
+static int bttv_g_input(struct file *file, struct video_device_state *state,
+			unsigned int *i)
 {
 	struct bttv *btv = video_drvdata(file);
 
@@ -1673,7 +1678,8 @@ static int bttv_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int bttv_s_input(struct file *file, void *priv, unsigned int i)
+static int bttv_s_input(struct file *file, struct video_device_state *state,
+			unsigned int i)
 {
 	struct bttv *btv = video_drvdata(file);
 
@@ -1684,7 +1690,8 @@ static int bttv_s_input(struct file *file, void *priv, unsigned int i)
 	return 0;
 }
 
-static int bttv_s_tuner(struct file *file, void *priv,
+static int bttv_s_tuner(struct file *file,
+			struct video_device_state *state,
 					const struct v4l2_tuner *t)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -1702,7 +1709,8 @@ static int bttv_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_g_frequency(struct file *file, void *priv,
+static int bttv_g_frequency(struct file *file,
+			    struct video_device_state *state,
 					struct v4l2_frequency *f)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -1738,7 +1746,8 @@ static void bttv_set_frequency(struct bttv *btv, const struct v4l2_frequency *f)
 	}
 }
 
-static int bttv_s_frequency(struct file *file, void *priv,
+static int bttv_s_frequency(struct file *file,
+			    struct video_device_state *state,
 					const struct v4l2_frequency *f)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -1750,7 +1759,8 @@ static int bttv_s_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_log_status(struct file *file, void *priv)
+static int bttv_log_status(struct file *file,
+			   struct video_device_state *state)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct bttv *btv = video_drvdata(file);
@@ -1761,7 +1771,8 @@ static int bttv_log_status(struct file *file, void *priv)
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int bttv_g_register(struct file *file, void *priv,
+static int bttv_g_register(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_dbg_register *reg)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -1774,7 +1785,8 @@ static int bttv_g_register(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_s_register(struct file *file, void *priv,
+static int bttv_s_register(struct file *file,
+			   struct video_device_state *state,
 					const struct v4l2_dbg_register *reg)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -1981,7 +1993,8 @@ pix_format_set_size     (struct v4l2_pix_format *       f,
 	}
 }
 
-static int bttv_g_fmt_vid_cap(struct file *file, void *priv,
+static int bttv_g_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -2007,7 +2020,8 @@ static void bttv_get_width_mask_vid_cap(const struct bttv_format *fmt,
 	}
 }
 
-static int bttv_try_fmt_vid_cap(struct file *file, void *priv,
+static int bttv_try_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 						struct v4l2_format *f)
 {
 	const struct bttv_format *fmt;
@@ -2062,7 +2076,8 @@ static int bttv_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
+static int bttv_s_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	int retval;
@@ -2076,7 +2091,7 @@ static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
 	if (0 != retval)
 		return retval;
 
-	retval = bttv_try_fmt_vid_cap(file, priv, f);
+	retval = bttv_try_fmt_vid_cap(file, state, f);
 	if (0 != retval)
 		return retval;
 
@@ -2109,7 +2124,8 @@ static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_querycap(struct file *file, void  *priv,
+static int bttv_querycap(struct file *file,
+			 struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -2140,7 +2156,8 @@ static int bttv_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int bttv_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int bttv_enum_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	int index = -1, i;
@@ -2159,7 +2176,8 @@ static int bttv_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int bttv_g_parm(struct file *file, void *priv,
+static int bttv_g_parm(struct file *file,
+		       struct video_device_state *state,
 				struct v4l2_streamparm *parm)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -2173,7 +2191,8 @@ static int bttv_g_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_g_tuner(struct file *file, void *priv,
+static int bttv_g_tuner(struct file *file,
+			struct video_device_state *state,
 				struct v4l2_tuner *t)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -2195,8 +2214,9 @@ static int bttv_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_g_pixelaspect(struct file *file, void *priv,
-			      int type, struct v4l2_fract *f)
+static int bttv_g_pixelaspect(struct file *file,
+			      struct video_device_state *state, int type,
+			      struct v4l2_fract *f)
 {
 	struct bttv *btv = video_drvdata(file);
 
@@ -2208,7 +2228,9 @@ static int bttv_g_pixelaspect(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_g_selection(struct file *file, void *priv, struct v4l2_selection *sel)
+static int bttv_g_selection(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_selection *sel)
 {
 	struct bttv *btv = video_drvdata(file);
 
@@ -2232,7 +2254,9 @@ static int bttv_g_selection(struct file *file, void *priv, struct v4l2_selection
 	return 0;
 }
 
-static int bttv_s_selection(struct file *file, void *priv, struct v4l2_selection *sel)
+static int bttv_s_selection(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_selection *sel)
 {
 	struct bttv *btv = video_drvdata(file);
 	const struct v4l2_rect *b;
@@ -2398,7 +2422,8 @@ static int radio_release(struct file *file)
 	return 0;
 }
 
-static int radio_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
+static int radio_g_tuner(struct file *file, struct video_device_state *state,
+			 struct v4l2_tuner *t)
 {
 	struct bttv *btv = video_drvdata(file);
 
@@ -2419,7 +2444,8 @@ static int radio_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 	return 0;
 }
 
-static int radio_s_tuner(struct file *file, void *priv,
+static int radio_s_tuner(struct file *file,
+			 struct video_device_state *state,
 					const struct v4l2_tuner *t)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -2432,7 +2458,8 @@ static int radio_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int radio_s_hw_freq_seek(struct file *file, void *priv,
+static int radio_s_hw_freq_seek(struct file *file,
+				struct video_device_state *state,
 					const struct v4l2_hw_freq_seek *a)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -2443,7 +2470,8 @@ static int radio_s_hw_freq_seek(struct file *file, void *priv,
 	return -ENOTTY;
 }
 
-static int radio_enum_freq_bands(struct file *file, void *priv,
+static int radio_enum_freq_bands(struct file *file,
+				 struct video_device_state *state,
 					 struct v4l2_frequency_band *band)
 {
 	struct bttv *btv = video_drvdata(file);
diff --git a/drivers/media/pci/bt8xx/bttv-vbi.c b/drivers/media/pci/bt8xx/bttv-vbi.c
index 0ca88a2400eefbbb6c61e292d5fe2cfef951c4d7..84bcf5b225a51d8a405f8a6fb08947e7a270d923 100644
--- a/drivers/media/pci/bt8xx/bttv-vbi.c
+++ b/drivers/media/pci/bt8xx/bttv-vbi.c
@@ -241,7 +241,8 @@ static int try_fmt(struct v4l2_vbi_format *f, const struct bttv_tvnorm *tvnorm,
 	return 0;
 }
 
-int bttv_try_fmt_vbi_cap(struct file *file, void *priv, struct v4l2_format *frt)
+int bttv_try_fmt_vbi_cap(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *frt)
 {
 	struct bttv *btv = video_drvdata(file);
 	const struct bttv_tvnorm *tvnorm;
@@ -257,8 +258,8 @@ int bttv_try_fmt_vbi_cap(struct file *file, void *priv, struct v4l2_format *frt)
 	return try_fmt(&frt->fmt.vbi, tvnorm, crop_start);
 }
 
-
-int bttv_s_fmt_vbi_cap(struct file *file, void *priv, struct v4l2_format *frt)
+int bttv_s_fmt_vbi_cap(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *frt)
 {
 	struct bttv *btv = video_drvdata(file);
 	const struct bttv_tvnorm *tvnorm;
@@ -300,8 +301,8 @@ int bttv_s_fmt_vbi_cap(struct file *file, void *priv, struct v4l2_format *frt)
 	return rc;
 }
 
-
-int bttv_g_fmt_vbi_cap(struct file *file, void *priv, struct v4l2_format *frt)
+int bttv_g_fmt_vbi_cap(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *frt)
 {
 	const struct bttv_tvnorm *tvnorm;
 	struct bttv *btv = video_drvdata(file);
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index a534e63b9a37bc5fdb27cc5b558ae885c7186715..0849f2f43720f4537174c431b4246cdc02cd21ff 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -227,9 +227,12 @@ int bttv_buffer_activate_vbi(struct bttv *btv,
 
 #define VBI_DEFLINES 16
 
-int bttv_try_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f);
-int bttv_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f);
-int bttv_s_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f);
+int bttv_try_fmt_vbi_cap(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f);
+int bttv_g_fmt_vbi_cap(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f);
+int bttv_s_fmt_vbi_cap(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f);
 
 /* ---------------------------------------------------------- */
 /* bttv-gpio.c */
diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index 51fd9576c6c2a775ab3146af05c7e051f1198902..e3ef6bff28175358a46d65cc4bae89b1bec97ac4 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -447,7 +447,8 @@ static int cobalt_cobaltc(struct cobalt *cobalt, unsigned int cmd, void *arg)
 	return 0;
 }
 
-static int cobalt_g_register(struct file *file, void *priv,
+static int cobalt_g_register(struct file *file,
+			     struct video_device_state *state,
 		struct v4l2_dbg_register *reg)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -456,7 +457,8 @@ static int cobalt_g_register(struct file *file, void *priv,
 	return cobalt_cobaltc(cobalt, VIDIOC_DBG_G_REGISTER, reg);
 }
 
-static int cobalt_s_register(struct file *file, void *priv,
+static int cobalt_s_register(struct file *file,
+			     struct video_device_state *state,
 		const struct v4l2_dbg_register *reg)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -467,7 +469,8 @@ static int cobalt_s_register(struct file *file, void *priv,
 }
 #endif
 
-static int cobalt_querycap(struct file *file, void *priv,
+static int cobalt_querycap(struct file *file,
+			   struct video_device_state *state,
 				struct v4l2_capability *vcap)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -562,7 +565,8 @@ static void cobalt_video_input_status_show(struct cobalt_stream *s)
 	cobalt_info("rx%d: Packer: %x\n", rx, ioread32(&packer->control));
 }
 
-static int cobalt_log_status(struct file *file, void *priv)
+static int cobalt_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct cobalt *cobalt = s->cobalt;
@@ -596,7 +600,8 @@ static int cobalt_log_status(struct file *file, void *priv)
 	return 0;
 }
 
-static int cobalt_enum_dv_timings(struct file *file, void *priv,
+static int cobalt_enum_dv_timings(struct file *file,
+				  struct video_device_state *state,
 				    struct v4l2_enum_dv_timings *timings)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -613,7 +618,8 @@ static int cobalt_enum_dv_timings(struct file *file, void *priv,
 			pad, enum_dv_timings, timings);
 }
 
-static int cobalt_s_dv_timings(struct file *file, void *priv,
+static int cobalt_s_dv_timings(struct file *file,
+			       struct video_device_state *state,
 				    struct v4l2_dv_timings *timings)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -641,7 +647,8 @@ static int cobalt_s_dv_timings(struct file *file, void *priv,
 	return err;
 }
 
-static int cobalt_g_dv_timings(struct file *file, void *priv,
+static int cobalt_g_dv_timings(struct file *file,
+			       struct video_device_state *state,
 				    struct v4l2_dv_timings *timings)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -654,7 +661,8 @@ static int cobalt_g_dv_timings(struct file *file, void *priv,
 			pad, g_dv_timings, 0, timings);
 }
 
-static int cobalt_query_dv_timings(struct file *file, void *priv,
+static int cobalt_query_dv_timings(struct file *file,
+				   struct video_device_state *state,
 				    struct v4l2_dv_timings *timings)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -667,7 +675,8 @@ static int cobalt_query_dv_timings(struct file *file, void *priv,
 			pad, query_dv_timings, 0, timings);
 }
 
-static int cobalt_dv_timings_cap(struct file *file, void *priv,
+static int cobalt_dv_timings_cap(struct file *file,
+				 struct video_device_state *state,
 				    struct v4l2_dv_timings_cap *cap)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -677,8 +686,8 @@ static int cobalt_dv_timings_cap(struct file *file, void *priv,
 			pad, dv_timings_cap, cap);
 }
 
-static int cobalt_enum_fmt_vid_cap(struct file *file, void *priv,
-		struct v4l2_fmtdesc *f)
+static int cobalt_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state, struct v4l2_fmtdesc *f)
 {
 	switch (f->index) {
 	case 0:
@@ -697,8 +706,8 @@ static int cobalt_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cobalt_g_fmt_vid_cap(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int cobalt_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state, struct v4l2_format *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
@@ -726,8 +735,8 @@ static int cobalt_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cobalt_try_fmt_vid_cap(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int cobalt_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state, struct v4l2_format *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
@@ -787,8 +796,8 @@ static int cobalt_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cobalt_s_fmt_vid_cap(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int cobalt_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state, struct v4l2_format *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
@@ -796,7 +805,7 @@ static int cobalt_s_fmt_vid_cap(struct file *file, void *priv,
 	if (vb2_is_busy(&s->q))
 		return -EBUSY;
 
-	if (cobalt_try_fmt_vid_cap(file, priv, f))
+	if (cobalt_try_fmt_vid_cap(file, state, f))
 		return -EINVAL;
 
 	s->width = pix->width;
@@ -821,8 +830,8 @@ static int cobalt_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cobalt_try_fmt_vid_out(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int cobalt_try_fmt_vid_out(struct file *file,
+				  struct video_device_state *state, struct v4l2_format *f)
 {
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 
@@ -862,8 +871,8 @@ static int cobalt_try_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int cobalt_g_fmt_vid_out(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int cobalt_g_fmt_vid_out(struct file *file,
+				struct video_device_state *state, struct v4l2_format *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
@@ -882,8 +891,8 @@ static int cobalt_g_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int cobalt_enum_fmt_vid_out(struct file *file, void *priv,
-		struct v4l2_fmtdesc *f)
+static int cobalt_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state, struct v4l2_fmtdesc *f)
 {
 	switch (f->index) {
 	case 0:
@@ -899,8 +908,8 @@ static int cobalt_enum_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int cobalt_s_fmt_vid_out(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int cobalt_s_fmt_vid_out(struct file *file,
+				struct video_device_state *state, struct v4l2_format *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
@@ -909,7 +918,7 @@ static int cobalt_s_fmt_vid_out(struct file *file, void *priv,
 	};
 	u32 code;
 
-	if (cobalt_try_fmt_vid_out(file, priv, f))
+	if (cobalt_try_fmt_vid_out(file, state, f))
 		return -EINVAL;
 
 	if (vb2_is_busy(&s->q) && (pix->pixelformat != s->pixfmt ||
@@ -942,7 +951,8 @@ static int cobalt_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int cobalt_enum_input(struct file *file, void *priv,
+static int cobalt_enum_input(struct file *file,
+			     struct video_device_state *state,
 				 struct v4l2_input *inp)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -963,7 +973,8 @@ static int cobalt_enum_input(struct file *file, void *priv,
 			video, g_input_status, &inp->status);
 }
 
-static int cobalt_g_input(struct file *file, void *priv, unsigned int *i)
+static int cobalt_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 
@@ -971,7 +982,8 @@ static int cobalt_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int cobalt_s_input(struct file *file, void *priv, unsigned int i)
+static int cobalt_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 
@@ -990,7 +1002,8 @@ static int cobalt_s_input(struct file *file, void *priv, unsigned int i)
 			ADV76XX_PAD_HDMI_PORT_A, 0, 0);
 }
 
-static int cobalt_enum_output(struct file *file, void *priv,
+static int cobalt_enum_output(struct file *file,
+			      struct video_device_state *state,
 				 struct v4l2_output *out)
 {
 	if (out->index)
@@ -1001,18 +1014,21 @@ static int cobalt_enum_output(struct file *file, void *priv,
 	return 0;
 }
 
-static int cobalt_g_output(struct file *file, void *priv, unsigned int *i)
+static int cobalt_g_output(struct file *file,
+			   struct video_device_state *state, unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int cobalt_s_output(struct file *file, void *priv, unsigned int i)
+static int cobalt_s_output(struct file *file,
+			   struct video_device_state *state, unsigned int i)
 {
 	return i ? -EINVAL : 0;
 }
 
-static int cobalt_g_edid(struct file *file, void *priv, struct v4l2_edid *edid)
+static int cobalt_g_edid(struct file *file, struct video_device_state *state,
+			 struct v4l2_edid *edid)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	u32 pad = edid->pad;
@@ -1026,7 +1042,8 @@ static int cobalt_g_edid(struct file *file, void *priv, struct v4l2_edid *edid)
 	return ret;
 }
 
-static int cobalt_s_edid(struct file *file, void *priv, struct v4l2_edid *edid)
+static int cobalt_s_edid(struct file *file, struct video_device_state *state,
+			 struct v4l2_edid *edid)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	u32 pad = edid->pad;
@@ -1050,7 +1067,8 @@ static int cobalt_subscribe_event(struct v4l2_fh *fh,
 	return v4l2_ctrl_subscribe_event(fh, sub);
 }
 
-static int cobalt_g_parm(struct file *file, void *priv, struct v4l2_streamparm *a)
+static int cobalt_g_parm(struct file *file, struct video_device_state *state,
+			 struct v4l2_streamparm *a)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct v4l2_fract fps;
@@ -1065,8 +1083,9 @@ static int cobalt_g_parm(struct file *file, void *priv, struct v4l2_streamparm *
 	return 0;
 }
 
-static int cobalt_g_pixelaspect(struct file *file, void *priv,
-				int type, struct v4l2_fract *f)
+static int cobalt_g_pixelaspect(struct file *file,
+				struct video_device_state *state, int type,
+				struct v4l2_fract *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct v4l2_dv_timings timings;
@@ -1084,7 +1103,8 @@ static int cobalt_g_pixelaspect(struct file *file, void *priv,
 	return err;
 }
 
-static int cobalt_g_selection(struct file *file, void *priv,
+static int cobalt_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *sel)
 {
 	struct cobalt_stream *s = video_drvdata(file);
diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
index b62fd12c93c1a37ea6c8d3d48871028d81b33485..475c5a5e2000987fc3d590eb57da1472d7ccbf4b 100644
--- a/drivers/media/pci/cx18/cx18-driver.c
+++ b/drivers/media/pci/cx18/cx18-driver.c
@@ -1136,11 +1136,8 @@ int cx18_init_on_first_open(struct cx18 *cx)
 	int video_input;
 	int fw_retry_count = 3;
 	struct v4l2_frequency vf;
-	struct cx18_open_id fh;
 	v4l2_std_id std;
 
-	fh.cx = cx;
-
 	if (test_bit(CX18_F_I_FAILED, &cx->i_flags))
 		return -ENXIO;
 
@@ -1220,14 +1217,14 @@ int cx18_init_on_first_open(struct cx18 *cx)
 
 	video_input = cx->active_input;
 	cx->active_input++;	/* Force update of input */
-	cx18_s_input(NULL, &fh, video_input);
+	cx18_s_input(NULL, NULL, video_input);
 
 	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
 	   in one place. */
 	cx->std++;		/* Force full standard initialization */
 	std = (cx->tuner_std == V4L2_STD_ALL) ? V4L2_STD_NTSC_M : cx->tuner_std;
-	cx18_s_std(NULL, &fh, std);
-	cx18_s_frequency(NULL, &fh, &vf);
+	cx18_s_std(NULL, NULL, std);
+	cx18_s_frequency(NULL, NULL, &vf);
 	return 0;
 }
 
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 0f3019739d03dab1ed8ba63f71134a5b64807c7d..fcf9477e158cecbfd438156fc41a98f51077f3f6 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -49,7 +49,8 @@ static const struct v4l2_fmtdesc cx18_formats_mpeg[] = {
 	},
 };
 
-static int cx18_g_fmt_vid_cap(struct file *file, void *fh,
+static int cx18_g_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *fmt)
 {
 	struct cx18_open_id *id = file2id(file);
@@ -73,7 +74,8 @@ static int cx18_g_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_try_fmt_vid_cap(struct file *file, void *fh,
+static int cx18_try_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct cx18_open_id *id = file2id(file);
@@ -118,7 +120,8 @@ static int cx18_try_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_s_fmt_vid_cap(struct file *file, void *fh,
+static int cx18_s_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *fmt)
 {
 	struct cx18_open_id *id = file2id(file);
@@ -130,7 +133,7 @@ static int cx18_s_fmt_vid_cap(struct file *file, void *fh,
 	int ret;
 	int w, h;
 
-	ret = cx18_try_fmt_vid_cap(file, fh, fmt);
+	ret = cx18_try_fmt_vid_cap(file, state, fmt);
 	if (ret)
 		return ret;
 	w = fmt->fmt.pix.width;
@@ -151,7 +154,7 @@ static int cx18_s_fmt_vid_cap(struct file *file, void *fh,
 	format.format.height = cx->cxhdl.height = h;
 	format.format.code = MEDIA_BUS_FMT_FIXED;
 	v4l2_subdev_call(cx->sd_av, pad, set_fmt, NULL, &format);
-	return cx18_g_fmt_vid_cap(file, fh, fmt);
+	return cx18_g_fmt_vid_cap(file, state, fmt);
 }
 
 u16 cx18_service2vbi(int type)
@@ -258,7 +261,8 @@ u16 cx18_get_service_set(struct v4l2_sliced_vbi_format *fmt)
 	return set;
 }
 
-static int cx18_g_fmt_vbi_cap(struct file *file, void *fh,
+static int cx18_g_fmt_vbi_cap(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -277,7 +281,8 @@ static int cx18_g_fmt_vbi_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_g_fmt_sliced_vbi_cap(struct file *file, void *fh,
+static int cx18_g_fmt_sliced_vbi_cap(struct file *file,
+				     struct video_device_state *state,
 					struct v4l2_format *fmt)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -302,13 +307,15 @@ static int cx18_g_fmt_sliced_vbi_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_try_fmt_vbi_cap(struct file *file, void *fh,
+static int cx18_try_fmt_vbi_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
-	return cx18_g_fmt_vbi_cap(file, fh, fmt);
+	return cx18_g_fmt_vbi_cap(file, state, fmt);
 }
 
-static int cx18_try_fmt_sliced_vbi_cap(struct file *file, void *fh,
+static int cx18_try_fmt_sliced_vbi_cap(struct file *file,
+				       struct video_device_state *state,
 					struct v4l2_format *fmt)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -327,7 +334,8 @@ static int cx18_try_fmt_sliced_vbi_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_s_fmt_vbi_cap(struct file *file, void *fh,
+static int cx18_s_fmt_vbi_cap(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct cx18_open_id *id = file2id(file);
@@ -354,10 +362,11 @@ static int cx18_s_fmt_vbi_cap(struct file *file, void *fh,
 	cx->vbi.sliced_in->service_set = 0;
 	cx->vbi.in.type = V4L2_BUF_TYPE_VBI_CAPTURE;
 
-	return cx18_g_fmt_vbi_cap(file, fh, fmt);
+	return cx18_g_fmt_vbi_cap(file, state, fmt);
 }
 
-static int cx18_s_fmt_sliced_vbi_cap(struct file *file, void *fh,
+static int cx18_s_fmt_sliced_vbi_cap(struct file *file,
+				     struct video_device_state *state,
 					struct v4l2_format *fmt)
 {
 	struct cx18_open_id *id = file2id(file);
@@ -365,7 +374,7 @@ static int cx18_s_fmt_sliced_vbi_cap(struct file *file, void *fh,
 	int ret;
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
 
-	cx18_try_fmt_sliced_vbi_cap(file, fh, fmt);
+	cx18_try_fmt_sliced_vbi_cap(file, state, fmt);
 
 	/*
 	 * Changing the Encoder's Raw VBI parameters won't have any effect
@@ -389,8 +398,8 @@ static int cx18_s_fmt_sliced_vbi_cap(struct file *file, void *fh,
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int cx18_g_register(struct file *file, void *fh,
-				struct v4l2_dbg_register *reg)
+static int cx18_g_register(struct file *file, struct video_device_state *state,
+			   struct v4l2_dbg_register *reg)
 {
 	struct cx18 *cx = file2id(file)->cx;
 
@@ -403,8 +412,8 @@ static int cx18_g_register(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_s_register(struct file *file, void *fh,
-				const struct v4l2_dbg_register *reg)
+static int cx18_s_register(struct file *file, struct video_device_state *state,
+			   const struct v4l2_dbg_register *reg)
 {
 	struct cx18 *cx = file2id(file)->cx;
 
@@ -417,7 +426,8 @@ static int cx18_s_register(struct file *file, void *fh,
 }
 #endif
 
-static int cx18_querycap(struct file *file, void *fh,
+static int cx18_querycap(struct file *file,
+			 struct video_device_state *state,
 				struct v4l2_capability *vcap)
 {
 	struct cx18_open_id *id = file2id(file);
@@ -429,14 +439,16 @@ static int cx18_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_enumaudio(struct file *file, void *fh, struct v4l2_audio *vin)
+static int cx18_enumaudio(struct file *file, struct video_device_state *state,
+			  struct v4l2_audio *vin)
 {
 	struct cx18 *cx = file2id(file)->cx;
 
 	return cx18_get_audio_input(cx, vin->index, vin);
 }
 
-static int cx18_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
+static int cx18_g_audio(struct file *file, struct video_device_state *state,
+			struct v4l2_audio *vin)
 {
 	struct cx18 *cx = file2id(file)->cx;
 
@@ -444,7 +456,8 @@ static int cx18_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 	return cx18_get_audio_input(cx, vin->index, vin);
 }
 
-static int cx18_s_audio(struct file *file, void *fh, const struct v4l2_audio *vout)
+static int cx18_s_audio(struct file *file, struct video_device_state *state,
+			const struct v4l2_audio *vout)
 {
 	struct cx18 *cx = file2id(file)->cx;
 
@@ -455,7 +468,9 @@ static int cx18_s_audio(struct file *file, void *fh, const struct v4l2_audio *vo
 	return 0;
 }
 
-static int cx18_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
+static int cx18_enum_input(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_input *vin)
 {
 	struct cx18 *cx = file2id(file)->cx;
 
@@ -463,8 +478,9 @@ static int cx18_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
 	return cx18_get_input(cx, vin->index, vin);
 }
 
-static int cx18_g_pixelaspect(struct file *file, void *fh,
-			      int type, struct v4l2_fract *f)
+static int cx18_g_pixelaspect(struct file *file,
+			      struct video_device_state *state, int type,
+			      struct v4l2_fract *f)
 {
 	struct cx18 *cx = file2id(file)->cx;
 
@@ -476,7 +492,8 @@ static int cx18_g_pixelaspect(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_g_selection(struct file *file, void *fh,
+static int cx18_g_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *sel)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -496,7 +513,8 @@ static int cx18_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_enum_fmt_vid_cap(struct file *file, void *fh,
+static int cx18_enum_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 					struct v4l2_fmtdesc *fmt)
 {
 	struct cx18_open_id *id = file2id(file);
@@ -513,7 +531,8 @@ static int cx18_enum_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
+static int cx18_g_input(struct file *file, struct video_device_state *state,
+			unsigned int *i)
 {
 	struct cx18 *cx = file2id(file)->cx;
 
@@ -521,7 +540,8 @@ static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-int cx18_s_input(struct file *file, void *fh, unsigned int inp)
+int cx18_s_input(struct file *file, struct video_device_state *state,
+		 unsigned int inp)
 {
 	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
@@ -558,7 +578,8 @@ int cx18_s_input(struct file *file, void *fh, unsigned int inp)
 	return 0;
 }
 
-static int cx18_g_frequency(struct file *file, void *fh,
+static int cx18_g_frequency(struct file *file,
+			    struct video_device_state *state,
 				struct v4l2_frequency *vf)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -570,7 +591,8 @@ static int cx18_g_frequency(struct file *file, void *fh,
 	return 0;
 }
 
-int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
+int cx18_s_frequency(struct file *file, struct video_device_state *state,
+		     const struct v4l2_frequency *vf)
 {
 	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
@@ -585,7 +607,8 @@ int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 	return 0;
 }
 
-static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
+static int cx18_g_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id *std)
 {
 	struct cx18 *cx = file2id(file)->cx;
 
@@ -593,7 +616,8 @@ static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 	return 0;
 }
 
-int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
+int cx18_s_std(struct file *file, struct video_device_state *state,
+	       v4l2_std_id std)
 {
 	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
@@ -642,7 +666,8 @@ int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
 	return 0;
 }
 
-static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
+static int cx18_s_tuner(struct file *file, struct video_device_state *state,
+			const struct v4l2_tuner *vt)
 {
 	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
@@ -654,7 +679,8 @@ static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt
 	return 0;
 }
 
-static int cx18_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
+static int cx18_g_tuner(struct file *file, struct video_device_state *state,
+			struct v4l2_tuner *vt)
 {
 	struct cx18 *cx = file2id(file)->cx;
 
@@ -670,7 +696,8 @@ static int cx18_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 	return 0;
 }
 
-static int cx18_g_sliced_vbi_cap(struct file *file, void *fh,
+static int cx18_g_sliced_vbi_cap(struct file *file,
+				 struct video_device_state *state,
 					struct v4l2_sliced_vbi_cap *cap)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -791,7 +818,8 @@ static int cx18_process_idx_data(struct cx18_stream *s, struct cx18_mdl *mdl,
 	return 0;
 }
 
-static int cx18_g_enc_index(struct file *file, void *fh,
+static int cx18_g_enc_index(struct file *file,
+			    struct video_device_state *state,
 				struct v4l2_enc_idx *idx)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -838,7 +866,8 @@ static int cx18_g_enc_index(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_encoder_cmd(struct file *file, void *fh,
+static int cx18_encoder_cmd(struct file *file,
+			    struct video_device_state *state,
 				struct v4l2_encoder_cmd *enc)
 {
 	struct cx18_open_id *id = file2id(file);
@@ -897,7 +926,8 @@ static int cx18_encoder_cmd(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_try_encoder_cmd(struct file *file, void *fh,
+static int cx18_try_encoder_cmd(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_encoder_cmd *enc)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -930,7 +960,8 @@ static int cx18_try_encoder_cmd(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_log_status(struct file *file, void *fh)
+static int cx18_log_status(struct file *file,
+			   struct video_device_state *state)
 {
 	struct cx18 *cx = file2id(file)->cx;
 	struct v4l2_input vidin;
@@ -973,7 +1004,8 @@ static int cx18_log_status(struct file *file, void *fh)
 	return 0;
 }
 
-static long cx18_default(struct file *file, void *fh, bool valid_prio,
+static long cx18_default(struct file *file, struct video_device_state *state,
+			 bool valid_prio,
 			 unsigned int cmd, void *arg)
 {
 	struct cx18 *cx = file2id(file)->cx;
diff --git a/drivers/media/pci/cx18/cx18-ioctl.h b/drivers/media/pci/cx18/cx18-ioctl.h
index 97cd9f99e22d9676d427a7e9e12fb572a91b2a82..62c1238021d42419a0d0ef7b520d3e020b3b1f6e 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.h
+++ b/drivers/media/pci/cx18/cx18-ioctl.h
@@ -12,6 +12,9 @@ u16 cx18_service2vbi(int type);
 void cx18_expand_service_set(struct v4l2_sliced_vbi_format *fmt, int is_pal);
 u16 cx18_get_service_set(struct v4l2_sliced_vbi_format *fmt);
 void cx18_set_funcs(struct video_device *vdev);
-int cx18_s_std(struct file *file, void *fh, v4l2_std_id std);
-int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
-int cx18_s_input(struct file *file, void *fh, unsigned int inp);
+int cx18_s_std(struct file *file, struct video_device_state *state,
+	       v4l2_std_id std);
+int cx18_s_frequency(struct file *file, struct video_device_state *state,
+		     const struct v4l2_frequency *vf);
+int cx18_s_input(struct file *file, struct video_device_state *state,
+		 unsigned int inp);
diff --git a/drivers/media/pci/cx23885/cx23885-417.c b/drivers/media/pci/cx23885/cx23885-417.c
index 219937a153b3aed206091579fffbd07840ca0c3a..7d080e97bf460c2c89c833936d6d6de5b6454417 100644
--- a/drivers/media/pci/cx23885/cx23885-417.c
+++ b/drivers/media/pci/cx23885/cx23885-417.c
@@ -1216,7 +1216,8 @@ static const struct vb2_ops cx23885_qops = {
 
 /* ------------------------------------------------------------------ */
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *id)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 
@@ -1224,7 +1225,8 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 	unsigned int i;
@@ -1242,25 +1244,28 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 	return ret;
 }
 
-static int vidioc_enum_input(struct file *file, void *priv,
-	struct v4l2_input *i)
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state, struct v4l2_input *i)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 	dprintk(1, "%s()\n", __func__);
 	return cx23885_enum_input(dev, i);
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
-	return cx23885_get_input(file, priv, i);
+	return cx23885_get_input(file, state, i);
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
-	return cx23885_set_input(file, priv, i);
+	return cx23885_set_input(file, state, i);
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_tuner *t)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -1277,7 +1282,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 				const struct v4l2_tuner *t)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -1291,7 +1297,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -1306,13 +1313,14 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
-	const struct v4l2_frequency *f)
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state, const struct v4l2_frequency *f)
 {
-	return cx23885_set_frequency(file, priv, f);
+	return cx23885_set_frequency(file, state, f);
 }
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -1331,7 +1339,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	if (f->index != 0)
@@ -1342,7 +1351,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -1360,7 +1370,8 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -1376,7 +1387,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -1392,7 +1404,8 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_log_status(struct file *file, void *priv)
+static int vidioc_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 	char name[32 + 2];
diff --git a/drivers/media/pci/cx23885/cx23885-ioctl.c b/drivers/media/pci/cx23885/cx23885-ioctl.c
index a8ccad07cf50303895a14e29751b39a8c365fa17..e154b6777fddeefbac041a4e04c164574d65079b 100644
--- a/drivers/media/pci/cx23885/cx23885-ioctl.c
+++ b/drivers/media/pci/cx23885/cx23885-ioctl.c
@@ -11,8 +11,8 @@
 #include "cx23885-ioctl.h"
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-int cx23885_g_chip_info(struct file *file, void *fh,
-			 struct v4l2_dbg_chip_info *chip)
+int cx23885_g_chip_info(struct file *file, struct video_device_state *state,
+			struct v4l2_dbg_chip_info *chip)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 
@@ -47,7 +47,7 @@ static int cx23417_g_register(struct cx23885_dev *dev,
 	return 0;
 }
 
-int cx23885_g_register(struct file *file, void *fh,
+int cx23885_g_register(struct file *file, struct video_device_state *state,
 		       struct v4l2_dbg_register *reg)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -79,7 +79,7 @@ static int cx23417_s_register(struct cx23885_dev *dev,
 	return 0;
 }
 
-int cx23885_s_register(struct file *file, void *fh,
+int cx23885_s_register(struct file *file, struct video_device_state *state,
 		       const struct v4l2_dbg_register *reg)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
diff --git a/drivers/media/pci/cx23885/cx23885-ioctl.h b/drivers/media/pci/cx23885/cx23885-ioctl.h
index 14bfe9e4ec264f38f19864ea34229c9c8a4e7ed0..89c7bfe0ec16d9fdb056f815add09c24cc41e846 100644
--- a/drivers/media/pci/cx23885/cx23885-ioctl.h
+++ b/drivers/media/pci/cx23885/cx23885-ioctl.h
@@ -10,15 +10,14 @@
 #ifndef _CX23885_IOCTL_H_
 #define _CX23885_IOCTL_H_
 
-int cx23885_g_chip_info(struct file *file, void *fh,
-			 struct v4l2_dbg_chip_info *chip);
+int cx23885_g_chip_info(struct file *file, struct video_device_state *state,
+			struct v4l2_dbg_chip_info *chip);
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-int cx23885_g_register(struct file *file, void *fh,
+int cx23885_g_register(struct file *file, struct video_device_state *state,
 		       struct v4l2_dbg_register *reg);
 
-
-int cx23885_s_register(struct file *file, void *fh,
+int cx23885_s_register(struct file *file, struct video_device_state *state,
 		       const struct v4l2_dbg_register *reg);
 
 #endif
diff --git a/drivers/media/pci/cx23885/cx23885-vbi.c b/drivers/media/pci/cx23885/cx23885-vbi.c
index 40817cc52fc1ee256be86319638d0d26116e51c0..049aa0d4359cf789ddf3955347d30a636da1c7e8 100644
--- a/drivers/media/pci/cx23885/cx23885-vbi.c
+++ b/drivers/media/pci/cx23885/cx23885-vbi.c
@@ -32,9 +32,8 @@ MODULE_PARM_DESC(vbi_debug, "enable debug messages [vbi]");
 #define VBI_NTSC_LINE_COUNT 12
 #define VBI_PAL_LINE_COUNT 18
 
-
-int cx23885_vbi_fmt(struct file *file, void *priv,
-	struct v4l2_format *f)
+int cx23885_vbi_fmt(struct file *file, struct video_device_state *state,
+		    struct v4l2_format *f)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index 14d219fd1d8a0a5f964b6c182c167b63f3f45a51..9d9e17509b26e3b9c0d2c6d91620c3667ed289c0 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -527,8 +527,8 @@ static const struct vb2_ops cx23885_video_qops = {
 /* ------------------------------------------------------------------ */
 /* VIDEO IOCTLS                                                       */
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
-	struct v4l2_format *f)
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state, struct v4l2_format *f)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 
@@ -545,8 +545,8 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
-	struct v4l2_format *f)
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state, struct v4l2_format *f)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 	struct cx23885_fmt *fmt;
@@ -593,8 +593,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
-	struct v4l2_format *f)
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state, struct v4l2_format *f)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 	struct v4l2_subdev_format format = {
@@ -603,7 +603,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	int err;
 
 	dprintk(2, "%s()\n", __func__);
-	err = vidioc_try_fmt_vid_cap(file, priv, f);
+	err = vidioc_try_fmt_vid_cap(file, state, f);
 
 	if (0 != err)
 		return err;
@@ -626,8 +626,8 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_querycap(struct file *file, void  *priv,
-	struct v4l2_capability *cap)
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state, struct v4l2_capability *cap)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 
@@ -654,8 +654,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
-	struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state, struct v4l2_fmtdesc *f)
 {
 	if (unlikely(f->index >= ARRAY_SIZE(formats)))
 		return -EINVAL;
@@ -665,8 +665,9 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_pixelaspect(struct file *file, void *priv,
-				int type, struct v4l2_fract *f)
+static int vidioc_g_pixelaspect(struct file *file,
+				struct video_device_state *state, int type,
+				struct v4l2_fract *f)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 	bool is_50hz = dev->tvnorm & V4L2_STD_625_50;
@@ -680,7 +681,8 @@ static int vidioc_g_pixelaspect(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_selection(struct file *file, void *fh,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *sel)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -702,7 +704,8 @@ static int vidioc_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *id)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 	dprintk(1, "%s()\n", __func__);
@@ -711,7 +714,8 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id tvnorms)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id tvnorms)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 	dprintk(1, "%s()\n", __func__);
@@ -768,7 +772,8 @@ int cx23885_enum_input(struct cx23885_dev *dev, struct v4l2_input *i)
 	return 0;
 }
 
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 				struct v4l2_input *i)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -785,9 +790,10 @@ int cx23885_get_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
-	return cx23885_get_input(file, priv, i);
+	return cx23885_get_input(file, state, i);
 }
 
 int cx23885_set_input(struct file *file, void *priv, unsigned int i)
@@ -812,12 +818,14 @@ int cx23885_set_input(struct file *file, void *priv, unsigned int i)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
-	return cx23885_set_input(file, priv, i);
+	return cx23885_set_input(file, state, i);
 }
 
-static int vidioc_log_status(struct file *file, void *priv)
+static int vidioc_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 
@@ -848,14 +856,15 @@ static int cx23885_query_audinput(struct file *file, void *priv,
 
 }
 
-static int vidioc_enum_audinput(struct file *file, void *priv,
+static int vidioc_enum_audinput(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_audio *i)
 {
-	return cx23885_query_audinput(file, priv, i);
+	return cx23885_query_audinput(file, state, i);
 }
 
-static int vidioc_g_audinput(struct file *file, void *priv,
-	struct v4l2_audio *i)
+static int vidioc_g_audinput(struct file *file,
+			     struct video_device_state *state, struct v4l2_audio *i)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 
@@ -866,11 +875,11 @@ static int vidioc_g_audinput(struct file *file, void *priv,
 		i->index = dev->audinput;
 	dprintk(1, "%s(input=%d)\n", __func__, i->index);
 
-	return cx23885_query_audinput(file, priv, i);
+	return cx23885_query_audinput(file, state, i);
 }
 
-static int vidioc_s_audinput(struct file *file, void *priv,
-	const struct v4l2_audio *i)
+static int vidioc_s_audinput(struct file *file,
+			     struct video_device_state *state, const struct v4l2_audio *i)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
 
@@ -891,7 +900,8 @@ static int vidioc_s_audinput(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_tuner *t)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -916,7 +926,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 				const struct v4l2_tuner *t)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -940,7 +951,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
@@ -1090,10 +1102,10 @@ int cx23885_set_frequency(struct file *file, void *priv,
 	return ret;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
-	const struct v4l2_frequency *f)
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state, const struct v4l2_frequency *f)
 {
-	return cx23885_set_frequency(file, priv, f);
+	return cx23885_set_frequency(file, state, f);
 }
 
 /* ----------------------------------------------------------- */
diff --git a/drivers/media/pci/cx23885/cx23885.h b/drivers/media/pci/cx23885/cx23885.h
index 8ba1f306238cb3c136c1fbae8d29b581aeb566e5..9a0d50ac836953b3460d39d0dba3326e0ba9dfab 100644
--- a/drivers/media/pci/cx23885/cx23885.h
+++ b/drivers/media/pci/cx23885/cx23885.h
@@ -585,8 +585,8 @@ int cx23885_set_tvnorm(struct cx23885_dev *dev, v4l2_std_id norm);
 
 /* ----------------------------------------------------------- */
 /* cx23885-vbi.c                                               */
-extern int cx23885_vbi_fmt(struct file *file, void *priv,
-	struct v4l2_format *f);
+int cx23885_vbi_fmt(struct file *file, struct video_device_state *state,
+		    struct v4l2_format *f);
 extern void cx23885_vbi_timeout(unsigned long data);
 extern const struct vb2_ops cx23885_vbi_qops;
 extern int cx23885_vbi_irq(struct cx23885_dev *dev, u32 status);
diff --git a/drivers/media/pci/cx25821/cx25821-video.c b/drivers/media/pci/cx25821/cx25821-video.c
index 84aa1209e7171ecc541a764fea064e031ce2bb6e..7836e44090122f2c675a3098dfed2c954d5c9c11 100644
--- a/drivers/media/pci/cx25821/cx25821-video.c
+++ b/drivers/media/pci/cx25821/cx25821-video.c
@@ -301,7 +301,8 @@ static const struct vb2_ops cx25821_video_qops = {
 
 /* VIDEO IOCTLS */
 
-static int cx25821_vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int cx25821_vidioc_enum_fmt_vid_cap(struct file *file,
+					   struct video_device_state *state,
 			    struct v4l2_fmtdesc *f)
 {
 	if (unlikely(f->index >= ARRAY_SIZE(formats)))
@@ -312,7 +313,8 @@ static int cx25821_vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cx25821_vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int cx25821_vidioc_g_fmt_vid_cap(struct file *file,
+					struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct cx25821_channel *chan = video_drvdata(file);
@@ -328,7 +330,8 @@ static int cx25821_vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cx25821_vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int cx25821_vidioc_try_fmt_vid_cap(struct file *file,
+					  struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct cx25821_channel *chan = video_drvdata(file);
@@ -366,7 +369,8 @@ static int cx25821_vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx25821_channel *chan = video_drvdata(file);
@@ -374,7 +378,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	int pix_format = PIXEL_FRMT_422;
 	int err;
 
-	err = cx25821_vidioc_try_fmt_vid_cap(file, priv, f);
+	err = cx25821_vidioc_try_fmt_vid_cap(file, state, f);
 
 	if (0 != err)
 		return err;
@@ -402,7 +406,8 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_log_status(struct file *file, void *priv)
+static int vidioc_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct cx25821_channel *chan = video_drvdata(file);
 	struct cx25821_dev *dev = chan->dev;
@@ -416,7 +421,8 @@ static int vidioc_log_status(struct file *file, void *priv)
 }
 
 
-static int cx25821_vidioc_querycap(struct file *file, void *priv,
+static int cx25821_vidioc_querycap(struct file *file,
+				   struct video_device_state *state,
 			    struct v4l2_capability *cap)
 {
 	struct cx25821_channel *chan = video_drvdata(file);
@@ -431,7 +437,9 @@ static int cx25821_vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cx25821_vidioc_g_std(struct file *file, void *priv, v4l2_std_id *tvnorms)
+static int cx25821_vidioc_g_std(struct file *file,
+				struct video_device_state *state,
+				v4l2_std_id *tvnorms)
 {
 	struct cx25821_channel *chan = video_drvdata(file);
 
@@ -439,7 +447,8 @@ static int cx25821_vidioc_g_std(struct file *file, void *priv, v4l2_std_id *tvno
 	return 0;
 }
 
-static int cx25821_vidioc_s_std(struct file *file, void *priv,
+static int cx25821_vidioc_s_std(struct file *file,
+				struct video_device_state *state,
 				v4l2_std_id tvnorms)
 {
 	struct cx25821_channel *chan = video_drvdata(file);
@@ -457,7 +466,8 @@ static int cx25821_vidioc_s_std(struct file *file, void *priv,
 	return 0;
 }
 
-static int cx25821_vidioc_enum_input(struct file *file, void *priv,
+static int cx25821_vidioc_enum_input(struct file *file,
+				     struct video_device_state *state,
 			      struct v4l2_input *i)
 {
 	if (i->index)
@@ -469,13 +479,17 @@ static int cx25821_vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int cx25821_vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int cx25821_vidioc_g_input(struct file *file,
+				  struct video_device_state *state,
+				  unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int cx25821_vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int cx25821_vidioc_s_input(struct file *file,
+				  struct video_device_state *state,
+				  unsigned int i)
 {
 	return i ? -EINVAL : 0;
 }
@@ -505,7 +519,8 @@ static int cx25821_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
-static int cx25821_vidioc_enum_output(struct file *file, void *priv,
+static int cx25821_vidioc_enum_output(struct file *file,
+				      struct video_device_state *state,
 			      struct v4l2_output *o)
 {
 	if (o->index)
@@ -517,18 +532,23 @@ static int cx25821_vidioc_enum_output(struct file *file, void *priv,
 	return 0;
 }
 
-static int cx25821_vidioc_g_output(struct file *file, void *priv, unsigned int *o)
+static int cx25821_vidioc_g_output(struct file *file,
+				   struct video_device_state *state,
+				   unsigned int *o)
 {
 	*o = 0;
 	return 0;
 }
 
-static int cx25821_vidioc_s_output(struct file *file, void *priv, unsigned int o)
+static int cx25821_vidioc_s_output(struct file *file,
+				   struct video_device_state *state,
+				   unsigned int o)
 {
 	return o ? -EINVAL : 0;
 }
 
-static int cx25821_vidioc_try_fmt_vid_out(struct file *file, void *priv,
+static int cx25821_vidioc_try_fmt_vid_out(struct file *file,
+					  struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct cx25821_channel *chan = video_drvdata(file);
@@ -547,13 +567,14 @@ static int cx25821_vidioc_try_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx25821_channel *chan = video_drvdata(file);
 	int err;
 
-	err = cx25821_vidioc_try_fmt_vid_out(file, priv, f);
+	err = cx25821_vidioc_try_fmt_vid_out(file, state, f);
 
 	if (0 != err)
 		return err;
diff --git a/drivers/media/pci/cx88/cx88-blackbird.c b/drivers/media/pci/cx88/cx88-blackbird.c
index 13b8cc46835b2cb5a84405cdb7fa21d35675f552..149f19f6cef27fe93483ca5ede85757e90b973ec 100644
--- a/drivers/media/pci/cx88/cx88-blackbird.c
+++ b/drivers/media/pci/cx88/cx88-blackbird.c
@@ -787,7 +787,8 @@ static const struct vb2_ops blackbird_qops = {
 
 /* ------------------------------------------------------------------ */
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
@@ -797,7 +798,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return cx88_querycap(file, core, cap);
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	if (f->index != 0)
@@ -807,7 +809,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
@@ -823,7 +826,8 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
@@ -863,7 +867,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
@@ -874,7 +879,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	if (core->v4ldev && (vb2_is_busy(&core->v4ldev->vb2_vidq) ||
 			     vb2_is_busy(&core->v4ldev->vb2_vbiq)))
 		return -EBUSY;
-	vidioc_try_fmt_vid_cap(file, priv, f);
+	vidioc_try_fmt_vid_cap(file, state, f);
 	core->width = f->fmt.pix.width;
 	core->height = f->fmt.pix.height;
 	core->field = f->fmt.pix.field;
@@ -885,7 +890,8 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 			      const struct v4l2_frequency *f)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
@@ -908,7 +914,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_log_status(struct file *file, void *priv)
+static int vidioc_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
 	struct cx88_core *core = dev->core;
@@ -920,7 +927,8 @@ static int vidioc_log_status(struct file *file, void *priv)
 	return 0;
 }
 
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_input *i)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
@@ -929,7 +937,8 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	return cx88_enum_input(core, i);
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_frequency *f)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
@@ -946,7 +955,8 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
 	struct cx88_core *core = dev->core;
@@ -955,7 +965,8 @@ static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
 	struct cx88_core *core = dev->core;
@@ -970,7 +981,8 @@ static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_tuner *t)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
@@ -993,7 +1005,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 			  const struct v4l2_tuner *t)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
@@ -1008,7 +1021,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *tvnorm)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *tvnorm)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
 	struct cx88_core *core = dev->core;
@@ -1017,7 +1031,8 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *tvnorm)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id)
 {
 	struct cx8802_dev *dev = video_drvdata(file);
 	struct cx88_core *core = dev->core;
diff --git a/drivers/media/pci/cx88/cx88-vbi.c b/drivers/media/pci/cx88/cx88-vbi.c
index e3e379e6f6207b6ebf08327263d7087f5122d236..4d702acdfa75a8a95554d0b7f97d11bd7a9d25c3 100644
--- a/drivers/media/pci/cx88/cx88-vbi.c
+++ b/drivers/media/pci/cx88/cx88-vbi.c
@@ -20,7 +20,7 @@ MODULE_PARM_DESC(vbi_debug, "enable debug messages [vbi]");
 
 /* ------------------------------------------------------------------ */
 
-int cx8800_vbi_fmt(struct file *file, void *priv,
+int cx8800_vbi_fmt(struct file *file, struct video_device_state *state,
 		   struct v4l2_format *f)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index 0c87327689d3f669241bfc11ca07f7210f603a36..8288e2aa8d61f5826849856fd62d0670f6e96509 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -701,7 +701,8 @@ static int cx8800_s_aud_ctrl(struct v4l2_ctrl *ctrl)
 /* ------------------------------------------------------------------ */
 /* VIDEO IOCTLS                                                       */
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -719,7 +720,8 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -765,12 +767,13 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
 	struct cx88_core *core = dev->core;
-	int err = vidioc_try_fmt_vid_cap(file, priv, f);
+	int err = vidioc_try_fmt_vid_cap(file, state, f);
 
 	if (err != 0)
 		return err;
@@ -800,7 +803,8 @@ int cx88_querycap(struct file *file, struct cx88_core *core,
 }
 EXPORT_SYMBOL(cx88_querycap);
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -810,7 +814,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return cx88_querycap(file, core, cap);
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	if (unlikely(f->index >= ARRAY_SIZE(formats)))
@@ -821,7 +826,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *tvnorm)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *tvnorm)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
 	struct cx88_core *core = dev->core;
@@ -830,7 +836,8 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *tvnorm)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id tvnorms)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id tvnorms)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
 	struct cx88_core *core = dev->core;
@@ -869,7 +876,8 @@ int cx88_enum_input(struct cx88_core  *core, struct v4l2_input *i)
 }
 EXPORT_SYMBOL(cx88_enum_input);
 
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_input *i)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -878,7 +886,8 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	return cx88_enum_input(core, i);
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
 	struct cx88_core *core = dev->core;
@@ -887,7 +896,8 @@ static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
 	struct cx88_core *core = dev->core;
@@ -902,7 +912,8 @@ static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_tuner *t)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -925,7 +936,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 			  const struct v4l2_tuner *t)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -940,7 +952,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_frequency *f)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -981,7 +994,8 @@ int cx88_set_freq(struct cx88_core  *core,
 }
 EXPORT_SYMBOL(cx88_set_freq);
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 			      const struct v4l2_frequency *f)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -991,7 +1005,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int vidioc_g_register(struct file *file, void *fh,
+static int vidioc_g_register(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_dbg_register *reg)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -1003,7 +1018,8 @@ static int vidioc_g_register(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_s_register(struct file *file, void *fh,
+static int vidioc_s_register(struct file *file,
+			     struct video_device_state *state,
 			     const struct v4l2_dbg_register *reg)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -1018,7 +1034,8 @@ static int vidioc_s_register(struct file *file, void *fh,
 /* RADIO ESPECIFIC IOCTLS                                      */
 /* ----------------------------------------------------------- */
 
-static int radio_g_tuner(struct file *file, void *priv,
+static int radio_g_tuner(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_tuner *t)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
@@ -1033,7 +1050,8 @@ static int radio_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int radio_s_tuner(struct file *file, void *priv,
+static int radio_s_tuner(struct file *file,
+			 struct video_device_state *state,
 			 const struct v4l2_tuner *t)
 {
 	struct cx8800_dev *dev = video_drvdata(file);
diff --git a/drivers/media/pci/cx88/cx88.h b/drivers/media/pci/cx88/cx88.h
index 2ff3226a52ec4de3b5f4b9f85cca9b8ac489a01f..80d0665063c95a0655d654a7f5dc05f2fa3f531f 100644
--- a/drivers/media/pci/cx88/cx88.h
+++ b/drivers/media/pci/cx88/cx88.h
@@ -656,7 +656,7 @@ int cx88_stop_audio_dma(struct cx88_core *core);
 /* cx88-vbi.c                                                  */
 
 /* Can be used as g_vbi_fmt, try_vbi_fmt and s_vbi_fmt */
-int cx8800_vbi_fmt(struct file *file, void *priv,
+int cx8800_vbi_fmt(struct file *file, struct video_device_state *state,
 		   struct v4l2_format *f);
 
 void cx8800_stop_vbi_dma(struct cx8800_dev *dev);
diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 7bddcbba4cf1ba2998afbfe1e961ad89a303f1c2..de7944006438cfc50b1489d6de7a834c84a5b7bf 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -285,7 +285,8 @@ static const struct v4l2_file_operations dt3155_fops = {
 	.poll = vb2_fop_poll
 };
 
-static int dt3155_querycap(struct file *filp, void *p,
+static int dt3155_querycap(struct file *filp,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DT3155_NAME, sizeof(cap->driver));
@@ -294,7 +295,8 @@ static int dt3155_querycap(struct file *filp, void *p,
 }
 
 static int dt3155_enum_fmt_vid_cap(struct file *filp,
-				   void *p, struct v4l2_fmtdesc *f)
+				   struct video_device_state *state,
+				   struct v4l2_fmtdesc *f)
 {
 	if (f->index)
 		return -EINVAL;
@@ -302,7 +304,9 @@ static int dt3155_enum_fmt_vid_cap(struct file *filp,
 	return 0;
 }
 
-static int dt3155_fmt_vid_cap(struct file *filp, void *p, struct v4l2_format *f)
+static int dt3155_fmt_vid_cap(struct file *filp,
+			      struct video_device_state *state,
+			      struct v4l2_format *f)
 {
 	struct dt3155_priv *pd = video_drvdata(filp);
 
@@ -316,7 +320,8 @@ static int dt3155_fmt_vid_cap(struct file *filp, void *p, struct v4l2_format *f)
 	return 0;
 }
 
-static int dt3155_g_std(struct file *filp, void *p, v4l2_std_id *norm)
+static int dt3155_g_std(struct file *filp, struct video_device_state *state,
+			v4l2_std_id *norm)
 {
 	struct dt3155_priv *pd = video_drvdata(filp);
 
@@ -324,7 +329,8 @@ static int dt3155_g_std(struct file *filp, void *p, v4l2_std_id *norm)
 	return 0;
 }
 
-static int dt3155_s_std(struct file *filp, void *p, v4l2_std_id norm)
+static int dt3155_s_std(struct file *filp, struct video_device_state *state,
+			v4l2_std_id norm)
 {
 	struct dt3155_priv *pd = video_drvdata(filp);
 
@@ -345,7 +351,8 @@ static int dt3155_s_std(struct file *filp, void *p, v4l2_std_id norm)
 	return 0;
 }
 
-static int dt3155_enum_input(struct file *filp, void *p,
+static int dt3155_enum_input(struct file *filp,
+			     struct video_device_state *state,
 			     struct v4l2_input *input)
 {
 	if (input->index > 3)
@@ -361,7 +368,8 @@ static int dt3155_enum_input(struct file *filp, void *p,
 	return 0;
 }
 
-static int dt3155_g_input(struct file *filp, void *p, unsigned int *i)
+static int dt3155_g_input(struct file *filp, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct dt3155_priv *pd = video_drvdata(filp);
 
@@ -369,7 +377,8 @@ static int dt3155_g_input(struct file *filp, void *p, unsigned int *i)
 	return 0;
 }
 
-static int dt3155_s_input(struct file *filp, void *p, unsigned int i)
+static int dt3155_s_input(struct file *filp, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct dt3155_priv *pd = video_drvdata(filp);
 
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index a87f105beb5e267fd450b8a36ef9b0e0ecafc598..0cf3f0ffc9375dd93305d1ecfeaea7c3c65407c6 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1062,7 +1062,8 @@ static const struct vb2_ops cio2_vb2_ops = {
 
 /**************** V4L2 interface ****************/
 
-static int cio2_v4l2_querycap(struct file *file, void *fh,
+static int cio2_v4l2_querycap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, CIO2_NAME, sizeof(cap->driver));
@@ -1071,7 +1072,8 @@ static int cio2_v4l2_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cio2_v4l2_enum_fmt(struct file *file, void *fh,
+static int cio2_v4l2_enum_fmt(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(formats))
@@ -1083,7 +1085,9 @@ static int cio2_v4l2_enum_fmt(struct file *file, void *fh,
 }
 
 /* The format is validated in cio2_video_link_validate() */
-static int cio2_v4l2_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int cio2_v4l2_g_fmt(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_format *f)
 {
 	struct cio2_queue *q = file_to_cio2_queue(file);
 
@@ -1092,7 +1096,9 @@ static int cio2_v4l2_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int cio2_v4l2_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int cio2_v4l2_try_fmt(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_format *f)
 {
 	const struct ipu3_cio2_fmt *fmt;
 	struct v4l2_pix_format_mplane *mpix = &f->fmt.pix_mp;
@@ -1123,18 +1129,21 @@ static int cio2_v4l2_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int cio2_v4l2_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int cio2_v4l2_s_fmt(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_format *f)
 {
 	struct cio2_queue *q = file_to_cio2_queue(file);
 
-	cio2_v4l2_try_fmt(file, fh, f);
+	cio2_v4l2_try_fmt(file, state, f);
 	q->format = f->fmt.pix_mp;
 
 	return 0;
 }
 
 static int
-cio2_video_enum_input(struct file *file, void *fh, struct v4l2_input *input)
+cio2_video_enum_input(struct file *file, struct video_device_state *state,
+		      struct v4l2_input *input)
 {
 	if (input->index > 0)
 		return -EINVAL;
@@ -1146,7 +1155,8 @@ cio2_video_enum_input(struct file *file, void *fh, struct v4l2_input *input)
 }
 
 static int
-cio2_video_g_input(struct file *file, void *fh, unsigned int *input)
+cio2_video_g_input(struct file *file, struct video_device_state *state,
+		   unsigned int *input)
 {
 	*input = 0;
 
@@ -1154,7 +1164,8 @@ cio2_video_g_input(struct file *file, void *fh, unsigned int *input)
 }
 
 static int
-cio2_video_s_input(struct file *file, void *fh, unsigned int input)
+cio2_video_s_input(struct file *file, struct video_device_state *state,
+		   unsigned int input)
 {
 	return input == 0 ? 0 : -EINVAL;
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index f3f3bc0615e5dc698be5c479dfed8ef2eb49cbfb..21a61bd79274d172c9289bc144f2a92b19d256f9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -139,7 +139,8 @@ ipu6_isys_get_isys_format(u32 pixelformat, u32 type)
 	return default_pfmt;
 }
 
-static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
+static int ipu6_isys_vidioc_querycap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_capability *cap)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
@@ -150,7 +151,8 @@ static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
+static int ipu6_isys_vidioc_enum_fmt(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_fmtdesc *f)
 {
 	unsigned int i, num_found;
@@ -179,7 +181,8 @@ static int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int ipu6_isys_vidioc_enum_framesizes(struct file *file, void *fh,
+static int ipu6_isys_vidioc_enum_framesizes(struct file *file,
+					    struct video_device_state *state,
 					    struct v4l2_frmsizeenum *fsize)
 {
 	unsigned int i;
@@ -205,7 +208,8 @@ static int ipu6_isys_vidioc_enum_framesizes(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int ipu6_isys_vidioc_g_fmt_vid_cap(struct file *file, void *fh,
+static int ipu6_isys_vidioc_g_fmt_vid_cap(struct file *file,
+					  struct video_device_state *state,
 				      struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
@@ -215,7 +219,8 @@ static int ipu6_isys_vidioc_g_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int ipu6_isys_vidioc_g_fmt_meta_cap(struct file *file, void *fh,
+static int ipu6_isys_vidioc_g_fmt_meta_cap(struct file *file,
+					   struct video_device_state *state,
 					   struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
@@ -271,7 +276,8 @@ static void __ipu6_isys_vidioc_try_fmt_vid_cap(struct ipu6_isys_video *av,
 	f->fmt.pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int ipu6_isys_vidioc_try_fmt_vid_cap(struct file *file, void *fh,
+static int ipu6_isys_vidioc_try_fmt_vid_cap(struct file *file,
+					    struct video_device_state *state,
 					    struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
@@ -295,7 +301,8 @@ static int __ipu6_isys_vidioc_try_fmt_meta_cap(struct ipu6_isys_video *av,
 	return 0;
 }
 
-static int ipu6_isys_vidioc_try_fmt_meta_cap(struct file *file, void *fh,
+static int ipu6_isys_vidioc_try_fmt_meta_cap(struct file *file,
+					     struct video_device_state *state,
 					     struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
@@ -305,18 +312,20 @@ static int ipu6_isys_vidioc_try_fmt_meta_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int ipu6_isys_vidioc_s_fmt_vid_cap(struct file *file, void *fh,
+static int ipu6_isys_vidioc_s_fmt_vid_cap(struct file *file,
+					  struct video_device_state *state,
 				      struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
 
-	ipu6_isys_vidioc_try_fmt_vid_cap(file, fh, f);
+	ipu6_isys_vidioc_try_fmt_vid_cap(file, state, f);
 	av->pix_fmt = f->fmt.pix;
 
 	return 0;
 }
 
-static int ipu6_isys_vidioc_s_fmt_meta_cap(struct file *file, void *fh,
+static int ipu6_isys_vidioc_s_fmt_meta_cap(struct file *file,
+					   struct video_device_state *state,
 					   struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
@@ -324,13 +333,14 @@ static int ipu6_isys_vidioc_s_fmt_meta_cap(struct file *file, void *fh,
 	if (vb2_is_busy(&av->aq.vbq))
 		return -EBUSY;
 
-	ipu6_isys_vidioc_try_fmt_meta_cap(file, fh, f);
+	ipu6_isys_vidioc_try_fmt_meta_cap(file, state, f);
 	av->meta_fmt = f->fmt.meta;
 
 	return 0;
 }
 
-static int ipu6_isys_vidioc_reqbufs(struct file *file, void *priv,
+static int ipu6_isys_vidioc_reqbufs(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_requestbuffers *p)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
@@ -343,10 +353,11 @@ static int ipu6_isys_vidioc_reqbufs(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return vb2_ioctl_reqbufs(file, priv, p);
+	return vb2_ioctl_reqbufs(file, state, p);
 }
 
-static int ipu6_isys_vidioc_create_bufs(struct file *file, void *priv,
+static int ipu6_isys_vidioc_create_bufs(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_create_buffers *p)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
@@ -359,7 +370,7 @@ static int ipu6_isys_vidioc_create_bufs(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return vb2_ioctl_create_bufs(file, priv, p);
+	return vb2_ioctl_create_bufs(file, state, p);
 }
 
 static int link_validate(struct media_link *link)
diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index 72a8f76a41f45091fdd4fe0335ecb828d555eb9c..a2016cbdb896df066158a2f85db8c8964cb95328 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -1249,13 +1249,9 @@ int ivtv_init_on_first_open(struct ivtv *itv)
 {
 	struct v4l2_frequency vf;
 	/* Needed to call ioctls later */
-	struct ivtv_open_id fh;
 	int fw_retry_count = 3;
 	int video_input;
 
-	fh.itv = itv;
-	fh.type = IVTV_ENC_STREAM_TYPE_MPG;
-
 	if (test_bit(IVTV_F_I_FAILED, &itv->i_flags))
 		return -ENXIO;
 
@@ -1297,13 +1293,13 @@ int ivtv_init_on_first_open(struct ivtv *itv)
 
 	video_input = itv->active_input;
 	itv->active_input++;	/* Force update of input */
-	ivtv_s_input(NULL, &fh, video_input);
+	ivtv_s_input(NULL, NULL, video_input);
 
 	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
 	   in one place. */
 	itv->std++;		/* Force full standard initialization */
 	itv->std_out = itv->std;
-	ivtv_s_frequency(NULL, &fh, &vf);
+	ivtv_s_frequency(NULL, NULL, &vf);
 
 	if (itv->card->v4l2_capabilities & V4L2_CAP_VIDEO_OUTPUT) {
 		/* Turn on the TV-out: ivtv_init_mpeg_decoder() initializes
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 84c73bd22f2daf405ba5ef98894b98d40e5c7cf2..f529f0c963686b733dfabf1e44b1359925cdb1ee 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -306,7 +306,9 @@ static int ivtv_video_command(struct ivtv *itv, struct ivtv_open_id *id,
 	return 0;
 }
 
-static int ivtv_g_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_g_fmt_sliced_vbi_out(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_format *fmt)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
@@ -328,7 +330,9 @@ static int ivtv_g_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_fo
 	return 0;
 }
 
-static int ivtv_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_g_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *fmt)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -351,7 +355,9 @@ static int ivtv_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f
 	return 0;
 }
 
-static int ivtv_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_g_fmt_vbi_cap(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *fmt)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	struct v4l2_vbi_format *vbifmt = &fmt->fmt.vbi;
@@ -369,7 +375,9 @@ static int ivtv_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f
 	return 0;
 }
 
-static int ivtv_g_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_g_fmt_sliced_vbi_cap(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_format *fmt)
 {
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
 	struct ivtv_open_id *id = file2id(file);
@@ -392,7 +400,9 @@ static int ivtv_g_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_fo
 	return 0;
 }
 
-static int ivtv_g_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_g_fmt_vid_out(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *fmt)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -432,7 +442,9 @@ static int ivtv_g_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *f
 	return 0;
 }
 
-static int ivtv_g_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_g_fmt_vid_out_overlay(struct file *file,
+				      struct video_device_state *state,
+				      struct v4l2_format *fmt)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
@@ -454,12 +466,16 @@ static int ivtv_g_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_f
 	return 0;
 }
 
-static int ivtv_try_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_try_fmt_sliced_vbi_out(struct file *file,
+				       struct video_device_state *state,
+				       struct v4l2_format *fmt)
 {
-	return ivtv_g_fmt_sliced_vbi_out(file, fh, fmt);
+	return ivtv_g_fmt_sliced_vbi_out(file, state, fmt);
 }
 
-static int ivtv_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_try_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *fmt)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -476,25 +492,29 @@ static int ivtv_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format
 	}
 	h = min(h, itv->is_50hz ? 576 : 480);
 	h = max(h, min_h);
-	ivtv_g_fmt_vid_cap(file, fh, fmt);
+	ivtv_g_fmt_vid_cap(file, state, fmt);
 	fmt->fmt.pix.width = w;
 	fmt->fmt.pix.height = h;
 	return 0;
 }
 
-static int ivtv_try_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_try_fmt_vbi_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *fmt)
 {
-	return ivtv_g_fmt_vbi_cap(file, fh, fmt);
+	return ivtv_g_fmt_vbi_cap(file, state, fmt);
 }
 
-static int ivtv_try_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_try_fmt_sliced_vbi_cap(struct file *file,
+				       struct video_device_state *state,
+				       struct v4l2_format *fmt)
 {
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	if (id->type == IVTV_DEC_STREAM_TYPE_VBI)
-		return ivtv_g_fmt_sliced_vbi_cap(file, fh, fmt);
+		return ivtv_g_fmt_sliced_vbi_cap(file, state, fmt);
 
 	/* set sliced VBI capture format */
 	vbifmt->io_size = sizeof(struct v4l2_sliced_vbi_data) * 36;
@@ -508,13 +528,15 @@ static int ivtv_try_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_
 	return 0;
 }
 
-static int ivtv_try_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_try_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *fmt)
 {
 	struct ivtv_open_id *id = file2id(file);
 	s32 w = fmt->fmt.pix.width;
 	s32 h = fmt->fmt.pix.height;
 	int field = fmt->fmt.pix.field;
-	int ret = ivtv_g_fmt_vid_out(file, fh, fmt);
+	int ret = ivtv_g_fmt_vid_out(file, state, fmt);
 
 	w = min(w, 720);
 	w = max(w, 2);
@@ -542,7 +564,9 @@ static int ivtv_try_fmt_vid_out(struct file *file, void *fh, struct v4l2_format
 	return ret;
 }
 
-static int ivtv_try_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_try_fmt_vid_out_overlay(struct file *file,
+					struct video_device_state *state,
+					struct v4l2_format *fmt)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
@@ -553,25 +577,29 @@ static int ivtv_try_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2
 		return -EINVAL;
 	if (!itv->osd_video_pbase)
 		return -EINVAL;
-	ivtv_g_fmt_vid_out_overlay(file, fh, fmt);
+	ivtv_g_fmt_vid_out_overlay(file, state, fmt);
 	fmt->fmt.win.chromakey = chromakey;
 	fmt->fmt.win.global_alpha = global_alpha;
 	return 0;
 }
 
-static int ivtv_s_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_s_fmt_sliced_vbi_out(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_format *fmt)
 {
-	return ivtv_g_fmt_sliced_vbi_out(file, fh, fmt);
+	return ivtv_g_fmt_sliced_vbi_out(file, state, fmt);
 }
 
-static int ivtv_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_s_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *fmt)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	int ret = ivtv_try_fmt_vid_cap(file, fh, fmt);
+	int ret = ivtv_try_fmt_vid_cap(file, state, fmt);
 	int w = fmt->fmt.pix.width;
 	int h = fmt->fmt.pix.height;
 
@@ -592,10 +620,12 @@ static int ivtv_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f
 	format.format.height = h;
 	format.format.code = MEDIA_BUS_FMT_FIXED;
 	v4l2_subdev_call(itv->sd_video, pad, set_fmt, NULL, &format);
-	return ivtv_g_fmt_vid_cap(file, fh, fmt);
+	return ivtv_g_fmt_vid_cap(file, state, fmt);
 }
 
-static int ivtv_s_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_s_fmt_vbi_cap(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *fmt)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -604,15 +634,17 @@ static int ivtv_s_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f
 	itv->vbi.sliced_in->service_set = 0;
 	itv->vbi.in.type = V4L2_BUF_TYPE_VBI_CAPTURE;
 	v4l2_subdev_call(itv->sd_video, vbi, s_raw_fmt, &fmt->fmt.vbi);
-	return ivtv_g_fmt_vbi_cap(file, fh, fmt);
+	return ivtv_g_fmt_vbi_cap(file, state, fmt);
 }
 
-static int ivtv_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_s_fmt_sliced_vbi_cap(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_format *fmt)
 {
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
-	int ret = ivtv_try_fmt_sliced_vbi_cap(file, fh, fmt);
+	int ret = ivtv_try_fmt_sliced_vbi_cap(file, state, fmt);
 
 	if (ret || id->type == IVTV_DEC_STREAM_TYPE_VBI)
 		return ret;
@@ -626,12 +658,14 @@ static int ivtv_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_fo
 	return 0;
 }
 
-static int ivtv_s_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_s_fmt_vid_out(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *fmt)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct yuv_playback_info *yi = &itv->yuv_info;
-	int ret = ivtv_try_fmt_vid_out(file, fh, fmt);
+	int ret = ivtv_try_fmt_vid_out(file, state, fmt);
 
 	if (ret)
 		return ret;
@@ -671,10 +705,12 @@ static int ivtv_s_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *f
 	return 0;
 }
 
-static int ivtv_s_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_format *fmt)
+static int ivtv_s_fmt_vid_out_overlay(struct file *file,
+				      struct video_device_state *state,
+				      struct v4l2_format *fmt)
 {
 	struct ivtv *itv = file2id(file)->itv;
-	int ret = ivtv_try_fmt_vid_out_overlay(file, fh, fmt);
+	int ret = ivtv_try_fmt_vid_out_overlay(file, state, fmt);
 
 	if (ret == 0) {
 		itv->osd_chroma_key = fmt->fmt.win.chromakey;
@@ -708,7 +744,9 @@ static int ivtv_itvc(struct ivtv *itv, bool get, u64 reg, u64 *val)
 	return 0;
 }
 
-static int ivtv_g_register(struct file *file, void *fh, struct v4l2_dbg_register *reg)
+static int ivtv_g_register(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_dbg_register *reg)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -716,7 +754,9 @@ static int ivtv_g_register(struct file *file, void *fh, struct v4l2_dbg_register
 	return ivtv_itvc(itv, true, reg->reg, &reg->val);
 }
 
-static int ivtv_s_register(struct file *file, void *fh, const struct v4l2_dbg_register *reg)
+static int ivtv_s_register(struct file *file,
+			   struct video_device_state *state,
+			   const struct v4l2_dbg_register *reg)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	u64 val = reg->val;
@@ -725,7 +765,8 @@ static int ivtv_s_register(struct file *file, void *fh, const struct v4l2_dbg_re
 }
 #endif
 
-static int ivtv_querycap(struct file *file, void *fh, struct v4l2_capability *vcap)
+static int ivtv_querycap(struct file *file, struct video_device_state *state,
+			 struct v4l2_capability *vcap)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -736,14 +777,16 @@ static int ivtv_querycap(struct file *file, void *fh, struct v4l2_capability *vc
 	return 0;
 }
 
-static int ivtv_enumaudio(struct file *file, void *fh, struct v4l2_audio *vin)
+static int ivtv_enumaudio(struct file *file, struct video_device_state *state,
+			  struct v4l2_audio *vin)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
 	return ivtv_get_audio_input(itv, vin->index, vin);
 }
 
-static int ivtv_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
+static int ivtv_g_audio(struct file *file, struct video_device_state *state,
+			struct v4l2_audio *vin)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -751,7 +794,8 @@ static int ivtv_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 	return ivtv_get_audio_input(itv, vin->index, vin);
 }
 
-static int ivtv_s_audio(struct file *file, void *fh, const struct v4l2_audio *vout)
+static int ivtv_s_audio(struct file *file, struct video_device_state *state,
+			const struct v4l2_audio *vout)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -764,7 +808,9 @@ static int ivtv_s_audio(struct file *file, void *fh, const struct v4l2_audio *vo
 	return 0;
 }
 
-static int ivtv_enumaudout(struct file *file, void *fh, struct v4l2_audioout *vin)
+static int ivtv_enumaudout(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_audioout *vin)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -772,7 +818,8 @@ static int ivtv_enumaudout(struct file *file, void *fh, struct v4l2_audioout *vi
 	return ivtv_get_audio_output(itv, vin->index, vin);
 }
 
-static int ivtv_g_audout(struct file *file, void *fh, struct v4l2_audioout *vin)
+static int ivtv_g_audout(struct file *file, struct video_device_state *state,
+			 struct v4l2_audioout *vin)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -780,7 +827,8 @@ static int ivtv_g_audout(struct file *file, void *fh, struct v4l2_audioout *vin)
 	return ivtv_get_audio_output(itv, vin->index, vin);
 }
 
-static int ivtv_s_audout(struct file *file, void *fh, const struct v4l2_audioout *vout)
+static int ivtv_s_audout(struct file *file, struct video_device_state *state,
+			 const struct v4l2_audioout *vout)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -789,7 +837,9 @@ static int ivtv_s_audout(struct file *file, void *fh, const struct v4l2_audioout
 	return 0;
 }
 
-static int ivtv_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
+static int ivtv_enum_input(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_input *vin)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -797,15 +847,18 @@ static int ivtv_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
 	return ivtv_get_input(itv, vin->index, vin);
 }
 
-static int ivtv_enum_output(struct file *file, void *fh, struct v4l2_output *vout)
+static int ivtv_enum_output(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_output *vout)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
 	return ivtv_get_output(itv, vout->index, vout);
 }
 
-static int ivtv_g_pixelaspect(struct file *file, void *fh,
-			      int type, struct v4l2_fract *f)
+static int ivtv_g_pixelaspect(struct file *file,
+			      struct video_device_state *state, int type,
+			      struct v4l2_fract *f)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -822,7 +875,8 @@ static int ivtv_g_pixelaspect(struct file *file, void *fh,
 	return 0;
 }
 
-static int ivtv_s_selection(struct file *file, void *fh,
+static int ivtv_s_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *sel)
 {
 	struct ivtv_open_id *id = file2id(file);
@@ -865,7 +919,8 @@ static int ivtv_s_selection(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int ivtv_g_selection(struct file *file, void *fh,
+static int ivtv_g_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *sel)
 {
 	struct ivtv_open_id *id = file2id(file);
@@ -911,7 +966,9 @@ static int ivtv_g_selection(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc *fmt)
+static int ivtv_enum_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_fmtdesc *fmt)
 {
 	static const struct v4l2_fmtdesc hm12 = {
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
@@ -938,7 +995,9 @@ static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdes
 	return 0;
 }
 
-static int ivtv_enum_fmt_vid_out(struct file *file, void *fh, struct v4l2_fmtdesc *fmt)
+static int ivtv_enum_fmt_vid_out(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_fmtdesc *fmt)
 {
 	static const struct v4l2_fmtdesc hm12 = {
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT,
@@ -965,7 +1024,8 @@ static int ivtv_enum_fmt_vid_out(struct file *file, void *fh, struct v4l2_fmtdes
 	return 0;
 }
 
-static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
+static int ivtv_g_input(struct file *file, struct video_device_state *state,
+			unsigned int *i)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -974,7 +1034,8 @@ static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
+int ivtv_s_input(struct file *file, struct video_device_state *state,
+		 unsigned int inp)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	v4l2_std_id std;
@@ -1017,7 +1078,8 @@ int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
 	return 0;
 }
 
-static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
+static int ivtv_g_output(struct file *file, struct video_device_state *state,
+			 unsigned int *i)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -1029,7 +1091,8 @@ static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-static int ivtv_s_output(struct file *file, void *fh, unsigned int outp)
+static int ivtv_s_output(struct file *file, struct video_device_state *state,
+			 unsigned int outp)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -1051,7 +1114,9 @@ static int ivtv_s_output(struct file *file, void *fh, unsigned int outp)
 	return 0;
 }
 
-static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *vf)
+static int ivtv_g_frequency(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_frequency *vf)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
@@ -1065,7 +1130,8 @@ static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *
 	return 0;
 }
 
-int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
+int ivtv_s_frequency(struct file *file, struct video_device_state *state,
+		     const struct v4l2_frequency *vf)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
@@ -1082,7 +1148,8 @@ int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 	return 0;
 }
 
-static int ivtv_g_std(struct file *file, void *fh, v4l2_std_id *std)
+static int ivtv_g_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id *std)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -1155,7 +1222,8 @@ void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std)
 	}
 }
 
-static int ivtv_s_std(struct file *file, void *fh, v4l2_std_id std)
+static int ivtv_s_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id std)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -1183,7 +1251,8 @@ static int ivtv_s_std(struct file *file, void *fh, v4l2_std_id std)
 	return 0;
 }
 
-static int ivtv_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
+static int ivtv_s_tuner(struct file *file, struct video_device_state *state,
+			const struct v4l2_tuner *vt)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -1196,7 +1265,8 @@ static int ivtv_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt
 	return 0;
 }
 
-static int ivtv_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
+static int ivtv_g_tuner(struct file *file, struct video_device_state *state,
+			struct v4l2_tuner *vt)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -1212,7 +1282,9 @@ static int ivtv_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 	return 0;
 }
 
-static int ivtv_g_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_sliced_vbi_cap *cap)
+static int ivtv_g_sliced_vbi_cap(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_sliced_vbi_cap *cap)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	int set = itv->is_50hz ? V4L2_SLICED_VBI_625 : V4L2_SLICED_VBI_525;
@@ -1247,7 +1319,9 @@ static int ivtv_g_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_sliced
 	return 0;
 }
 
-static int ivtv_g_enc_index(struct file *file, void *fh, struct v4l2_enc_idx *idx)
+static int ivtv_g_enc_index(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_enc_idx *idx)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	struct v4l2_enc_idx_entry *e = idx->entry;
@@ -1273,7 +1347,9 @@ static int ivtv_g_enc_index(struct file *file, void *fh, struct v4l2_enc_idx *id
 	return 0;
 }
 
-static int ivtv_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *enc)
+static int ivtv_encoder_cmd(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_encoder_cmd *enc)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -1325,7 +1401,9 @@ static int ivtv_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd
 	return 0;
 }
 
-static int ivtv_try_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *enc)
+static int ivtv_try_encoder_cmd(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_encoder_cmd *enc)
 {
 	struct ivtv *itv = file2id(file)->itv;
 
@@ -1355,7 +1433,8 @@ static int ivtv_try_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder
 	}
 }
 
-static int ivtv_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *fb)
+static int ivtv_g_fbuf(struct file *file, struct video_device_state *state,
+		       struct v4l2_framebuffer *fb)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
@@ -1442,7 +1521,8 @@ static int ivtv_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *fb)
 	return 0;
 }
 
-static int ivtv_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffer *fb)
+static int ivtv_s_fbuf(struct file *file, struct video_device_state *state,
+		       const struct v4l2_framebuffer *fb)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -1463,7 +1543,8 @@ static int ivtv_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffe
 	return 0;
 }
 
-static int ivtv_overlay(struct file *file, void *fh, unsigned int on)
+static int ivtv_overlay(struct file *file, struct video_device_state *state,
+			unsigned int on)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -1490,7 +1571,8 @@ static int ivtv_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
 	}
 }
 
-static int ivtv_log_status(struct file *file, void *fh)
+static int ivtv_log_status(struct file *file,
+			   struct video_device_state *state)
 {
 	struct ivtv *itv = file2id(file)->itv;
 	u32 data[CX2341X_MBOX_MAX_DATA];
@@ -1582,7 +1664,9 @@ static int ivtv_log_status(struct file *file, void *fh)
 	return 0;
 }
 
-static int ivtv_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dec)
+static int ivtv_decoder_cmd(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_decoder_cmd *dec)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -1591,7 +1675,9 @@ static int ivtv_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd
 	return ivtv_video_command(itv, id, dec, false);
 }
 
-static int ivtv_try_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dec)
+static int ivtv_try_decoder_cmd(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_decoder_cmd *dec)
 {
 	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
@@ -1642,7 +1728,8 @@ static int ivtv_decoder_ioctls(struct file *filp, unsigned int cmd, void *arg)
 	return 0;
 }
 
-static long ivtv_default(struct file *file, void *fh, bool valid_prio,
+static long ivtv_default(struct file *file, struct video_device_state *state,
+			 bool valid_prio,
 			 unsigned int cmd, void *arg)
 {
 	struct ivtv *itv = file2id(file)->itv;
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.h b/drivers/media/pci/ivtv/ivtv-ioctl.h
index 7f8c6f43d397f050a8116429db7a9a7accc0336b..59adcae0c2f39020b73f1100c0a6ae7051b528a8 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.h
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.h
@@ -17,7 +17,9 @@ int ivtv_set_speed(struct ivtv *itv, int speed);
 void ivtv_set_funcs(struct video_device *vdev);
 void ivtv_s_std_enc(struct ivtv *itv, v4l2_std_id std);
 void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std);
-int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
-int ivtv_s_input(struct file *file, void *fh, unsigned int inp);
+int ivtv_s_frequency(struct file *file, struct video_device_state *state,
+		     const struct v4l2_frequency *vf);
+int ivtv_s_input(struct file *file, struct video_device_state *state,
+		 unsigned int inp);
 
 #endif
diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 42c327bc50e10af249288d2dbd77efd311abfdbd..0dbc464e96dbbdd6aa9eaf3d4be1c31c396473ef 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -346,7 +346,8 @@ static const struct v4l2_file_operations video_fops = {
 	.poll = vb2_fop_poll,
 };
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
@@ -355,7 +356,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt(struct file *file, void *priv,
+static int vidioc_enum_fmt(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_fmtdesc *f)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
@@ -372,7 +374,8 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	}
 }
 
-static int vidioc_enum_frameintervals(struct file *file, void *priv,
+static int vidioc_enum_frameintervals(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_frmivalenum *ival)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
@@ -398,7 +401,8 @@ static int vidioc_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
 	struct mgb4_regs *video = &vindev->mgbdev->video;
@@ -429,7 +433,8 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
 	struct mgb4_regs *video = &vindev->mgbdev->video;
@@ -461,7 +466,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_s_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
 	struct mgb4_regs *video = &vindev->mgbdev->video;
@@ -470,7 +476,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (vb2_is_busy(&vindev->queue))
 		return -EBUSY;
 
-	vidioc_try_fmt(file, priv, f);
+	vidioc_try_fmt(file, state, f);
 
 	config = mgb4_read_reg(video, vindev->config->regs.config);
 	if (f->fmt.pix.pixelformat == V4L2_PIX_FMT_YUYV) {
@@ -499,7 +505,8 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_input *i)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
@@ -523,7 +530,8 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_framesizes(struct file *file, void *fh,
+static int vidioc_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
@@ -539,18 +547,21 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	return (i == 0) ? 0 : -EINVAL;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int vidioc_g_parm(struct file *file, void *priv,
+static int vidioc_g_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *parm)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
@@ -576,7 +587,8 @@ static int vidioc_g_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_parm(struct file *file, void *priv,
+static int vidioc_s_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *parm)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
@@ -597,10 +609,11 @@ static int vidioc_s_parm(struct file *file, void *priv,
 		mgb4_write_reg(video, vindev->config->regs.timer, timer);
 	}
 
-	return vidioc_g_parm(file, priv, parm);
+	return vidioc_g_parm(file, state, parm);
 }
 
-static int vidioc_s_dv_timings(struct file *file, void *fh,
+static int vidioc_s_dv_timings(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_dv_timings *timings)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
@@ -620,7 +633,8 @@ static int vidioc_s_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_g_dv_timings(struct file *file, void *fh,
+static int vidioc_g_dv_timings(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_dv_timings *timings)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
@@ -629,7 +643,8 @@ static int vidioc_g_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_query_dv_timings(struct file *file, void *fh,
+static int vidioc_query_dv_timings(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_dv_timings *timings)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
@@ -637,7 +652,8 @@ static int vidioc_query_dv_timings(struct file *file, void *fh,
 	return get_timings(vindev, timings);
 }
 
-static int vidioc_enum_dv_timings(struct file *file, void *fh,
+static int vidioc_enum_dv_timings(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_enum_dv_timings *timings)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
@@ -650,7 +666,8 @@ static int vidioc_enum_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_dv_timings_cap(struct file *file, void *fh,
+static int vidioc_dv_timings_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_dv_timings_cap *cap)
 {
 	*cap = video_timings_cap;
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index c179c425e167cb3a2bbb0919dba3749dedeeb070..3e71f2872421780ee05d5693077a912231f9f781 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -232,7 +232,8 @@ static const struct vb2_ops queue_ops = {
 	.stop_streaming = stop_streaming,
 };
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
@@ -241,7 +242,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt(struct file *file, void *priv,
+static int vidioc_enum_fmt(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_fmtdesc *f)
 {
 	struct mgb4_vin_dev *voutdev = video_drvdata(file);
@@ -258,7 +260,8 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	}
 }
 
-static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
 	struct mgb4_regs *video = &voutdev->mgbdev->video;
@@ -290,7 +293,8 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
 	struct mgb4_regs *video = &voutdev->mgbdev->video;
@@ -322,7 +326,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_s_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
 	struct mgb4_regs *video = &voutdev->mgbdev->video;
@@ -332,7 +337,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (vb2_is_busy(&voutdev->queue))
 		return -EBUSY;
 
-	ret = vidioc_try_fmt(file, priv, f);
+	ret = vidioc_try_fmt(file, state, f);
 	if (ret < 0)
 		return ret;
 
@@ -363,18 +368,21 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_g_output(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_output(struct file *file,
+			   struct video_device_state *state, unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int vidioc_s_output(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_output(struct file *file,
+			   struct video_device_state *state, unsigned int i)
 {
 	return i ? -EINVAL : 0;
 }
 
-static int vidioc_enum_output(struct file *file, void *priv,
+static int vidioc_enum_output(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_output *out)
 {
 	if (out->index != 0)
@@ -387,7 +395,8 @@ static int vidioc_enum_output(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_frameintervals(struct file *file, void *priv,
+static int vidioc_enum_frameintervals(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_frmivalenum *ival)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
@@ -415,7 +424,8 @@ static int vidioc_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_parm(struct file *file, void *priv,
+static int vidioc_g_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *parm)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
@@ -443,7 +453,8 @@ static int vidioc_g_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_parm(struct file *file, void *priv,
+static int vidioc_s_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *parm)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
@@ -466,10 +477,11 @@ static int vidioc_s_parm(struct file *file, void *priv,
 		mgb4_write_reg(video, voutdev->config->regs.timer, timer);
 	}
 
-	return vidioc_g_parm(file, priv, parm);
+	return vidioc_g_parm(file, state, parm);
 }
 
-static int vidioc_g_dv_timings(struct file *file, void *fh,
+static int vidioc_g_dv_timings(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_dv_timings *timings)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
@@ -479,7 +491,8 @@ static int vidioc_g_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_s_dv_timings(struct file *file, void *fh,
+static int vidioc_s_dv_timings(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_dv_timings *timings)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
@@ -489,7 +502,8 @@ static int vidioc_s_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_enum_dv_timings(struct file *file, void *fh,
+static int vidioc_enum_dv_timings(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_enum_dv_timings *timings)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
@@ -502,7 +516,8 @@ static int vidioc_enum_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_dv_timings_cap(struct file *file, void *fh,
+static int vidioc_dv_timings_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_dv_timings_cap *cap)
 {
 	*cap = video_timings_cap;
diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index 8c4f70e4177d1836ad685be851df63b234674c40..03fbced7af3e6d012c8444e4241bd93c8c02b4ce 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -84,7 +84,8 @@ static const struct vb2_ops saa7134_empress_qops = {
 
 /* ------------------------------------------------------------------ */
 
-static int empress_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int empress_enum_fmt_vid_cap(struct file *file,
+				    struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	if (f->index != 0)
@@ -94,7 +95,8 @@ static int empress_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int empress_g_fmt_vid_cap(struct file *file, void *priv,
+static int empress_g_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
@@ -113,7 +115,8 @@ static int empress_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int empress_s_fmt_vid_cap(struct file *file, void *priv,
+static int empress_s_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
@@ -132,7 +135,8 @@ static int empress_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int empress_try_fmt_vid_cap(struct file *file, void *priv,
+static int empress_try_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 4a51b873e47ad64b49f7c464f6e96d31ba3e313e..0486b7c18d2c676ee22972a083365e6266769089 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -1011,8 +1011,9 @@ static __poll_t radio_poll(struct file *file, poll_table *wait)
 
 /* ------------------------------------------------------------------ */
 
-static int saa7134_try_get_set_fmt_vbi_cap(struct file *file, void *priv,
-						struct v4l2_format *f)
+static int saa7134_try_get_set_fmt_vbi_cap(struct file *file,
+					   struct video_device_state *state,
+					   struct v4l2_format *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	struct saa7134_tvnorm *norm = dev->tvnorm;
@@ -1031,8 +1032,9 @@ static int saa7134_try_get_set_fmt_vbi_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int saa7134_g_fmt_vid_cap(struct file *file, void *priv,
-				struct v4l2_format *f)
+static int saa7134_g_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_format *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1051,8 +1053,9 @@ static int saa7134_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int saa7134_try_fmt_vid_cap(struct file *file, void *priv,
-						struct v4l2_format *f)
+static int saa7134_try_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_format *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	struct saa7134_format *fmt;
@@ -1104,13 +1107,14 @@ static int saa7134_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int saa7134_s_fmt_vid_cap(struct file *file, void *priv,
-					struct v4l2_format *f)
+static int saa7134_s_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_format *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	int err;
 
-	err = saa7134_try_fmt_vid_cap(file, priv, f);
+	err = saa7134_try_fmt_vid_cap(file, state, f);
 	if (0 != err)
 		return err;
 
@@ -1121,7 +1125,8 @@ static int saa7134_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-int saa7134_enum_input(struct file *file, void *priv, struct v4l2_input *i)
+int saa7134_enum_input(struct file *file, struct video_device_state *state,
+		       struct v4l2_input *i)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	unsigned int n;
@@ -1159,7 +1164,8 @@ int saa7134_enum_input(struct file *file, void *priv, struct v4l2_input *i)
 }
 EXPORT_SYMBOL_GPL(saa7134_enum_input);
 
-int saa7134_g_input(struct file *file, void *priv, unsigned int *i)
+int saa7134_g_input(struct file *file, struct video_device_state *state,
+		    unsigned int *i)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1168,7 +1174,8 @@ int saa7134_g_input(struct file *file, void *priv, unsigned int *i)
 }
 EXPORT_SYMBOL_GPL(saa7134_g_input);
 
-int saa7134_s_input(struct file *file, void *priv, unsigned int i)
+int saa7134_s_input(struct file *file, struct video_device_state *state,
+		    unsigned int i)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1181,7 +1188,8 @@ int saa7134_s_input(struct file *file, void *priv, unsigned int i)
 }
 EXPORT_SYMBOL_GPL(saa7134_s_input);
 
-int saa7134_querycap(struct file *file, void *priv,
+int saa7134_querycap(struct file *file,
+		     struct video_device_state *state,
 					struct v4l2_capability *cap)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
@@ -1201,7 +1209,8 @@ int saa7134_querycap(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(saa7134_querycap);
 
-int saa7134_s_std(struct file *file, void *priv, v4l2_std_id id)
+int saa7134_s_std(struct file *file, struct video_device_state *state,
+		  v4l2_std_id id)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	unsigned int i;
@@ -1245,7 +1254,8 @@ int saa7134_s_std(struct file *file, void *priv, v4l2_std_id id)
 }
 EXPORT_SYMBOL_GPL(saa7134_s_std);
 
-int saa7134_g_std(struct file *file, void *priv, v4l2_std_id *id)
+int saa7134_g_std(struct file *file, struct video_device_state *state,
+		  v4l2_std_id *id)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1275,7 +1285,8 @@ static v4l2_std_id saa7134_read_std(struct saa7134_dev *dev)
 	return result;
 }
 
-int saa7134_querystd(struct file *file, void *priv, v4l2_std_id *std)
+int saa7134_querystd(struct file *file, struct video_device_state *state,
+		     v4l2_std_id *std)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	*std &= saa7134_read_std(dev);
@@ -1283,8 +1294,9 @@ int saa7134_querystd(struct file *file, void *priv, v4l2_std_id *std)
 }
 EXPORT_SYMBOL_GPL(saa7134_querystd);
 
-static int saa7134_g_pixelaspect(struct file *file, void *priv,
-				 int type, struct v4l2_fract *f)
+static int saa7134_g_pixelaspect(struct file *file,
+				 struct video_device_state *state, int type,
+				 struct v4l2_fract *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1302,7 +1314,9 @@ static int saa7134_g_pixelaspect(struct file *file, void *priv,
 	return 0;
 }
 
-static int saa7134_g_selection(struct file *file, void *priv, struct v4l2_selection *sel)
+static int saa7134_g_selection(struct file *file,
+			       struct video_device_state *state,
+			       struct v4l2_selection *sel)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1325,7 +1339,9 @@ static int saa7134_g_selection(struct file *file, void *priv, struct v4l2_select
 	return 0;
 }
 
-static int saa7134_s_selection(struct file *file, void *priv, struct v4l2_selection *sel)
+static int saa7134_s_selection(struct file *file,
+			       struct video_device_state *state,
+			       struct v4l2_selection *sel)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	struct v4l2_rect *b = &dev->crop_bounds;
@@ -1358,8 +1374,8 @@ static int saa7134_s_selection(struct file *file, void *priv, struct v4l2_select
 	return 0;
 }
 
-int saa7134_g_tuner(struct file *file, void *priv,
-					struct v4l2_tuner *t)
+int saa7134_g_tuner(struct file *file, struct video_device_state *state,
+		    struct v4l2_tuner *t)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	int n;
@@ -1391,8 +1407,8 @@ int saa7134_g_tuner(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(saa7134_g_tuner);
 
-int saa7134_s_tuner(struct file *file, void *priv,
-					const struct v4l2_tuner *t)
+int saa7134_s_tuner(struct file *file, struct video_device_state *state,
+		    const struct v4l2_tuner *t)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	int rx, mode;
@@ -1412,8 +1428,8 @@ int saa7134_s_tuner(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(saa7134_s_tuner);
 
-int saa7134_g_frequency(struct file *file, void *priv,
-					struct v4l2_frequency *f)
+int saa7134_g_frequency(struct file *file, struct video_device_state *state,
+			struct v4l2_frequency *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1426,8 +1442,8 @@ int saa7134_g_frequency(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(saa7134_g_frequency);
 
-int saa7134_s_frequency(struct file *file, void *priv,
-					const struct v4l2_frequency *f)
+int saa7134_s_frequency(struct file *file, struct video_device_state *state,
+			const struct v4l2_frequency *f)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1441,8 +1457,9 @@ int saa7134_s_frequency(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(saa7134_s_frequency);
 
-static int saa7134_enum_fmt_vid_cap(struct file *file, void  *priv,
-					struct v4l2_fmtdesc *f)
+static int saa7134_enum_fmt_vid_cap(struct file *file,
+				    struct video_device_state *state,
+				    struct v4l2_fmtdesc *f)
 {
 	if (f->index >= FORMATS)
 		return -EINVAL;
@@ -1453,8 +1470,9 @@ static int saa7134_enum_fmt_vid_cap(struct file *file, void  *priv,
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int vidioc_g_register (struct file *file, void *priv,
-			      struct v4l2_dbg_register *reg)
+static int vidioc_g_register(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_dbg_register *reg)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1463,8 +1481,9 @@ static int vidioc_g_register (struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_register (struct file *file, void *priv,
-				const struct v4l2_dbg_register *reg)
+static int vidioc_s_register(struct file *file,
+			     struct video_device_state *state,
+			     const struct v4l2_dbg_register *reg)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1473,8 +1492,8 @@ static int vidioc_s_register (struct file *file, void *priv,
 }
 #endif
 
-static int radio_g_tuner(struct file *file, void *priv,
-					struct v4l2_tuner *t)
+static int radio_g_tuner(struct file *file, struct video_device_state *state,
+			 struct v4l2_tuner *t)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1492,8 +1511,9 @@ static int radio_g_tuner(struct file *file, void *priv,
 	}
 	return 0;
 }
-static int radio_s_tuner(struct file *file, void *priv,
-					const struct v4l2_tuner *t)
+
+static int radio_s_tuner(struct file *file, struct video_device_state *state,
+			 const struct v4l2_tuner *t)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
diff --git a/drivers/media/pci/saa7134/saa7134.h b/drivers/media/pci/saa7134/saa7134.h
index 9f27e3775c273e1b4738f022399d624b18f695cc..5775df2194d1d359b3496e29f23f42154420ab6e 100644
--- a/drivers/media/pci/saa7134/saa7134.h
+++ b/drivers/media/pci/saa7134/saa7134.h
@@ -795,22 +795,28 @@ void saa7134_vb2_buffer_queue(struct vb2_buffer *vb);
 int saa7134_vb2_start_streaming(struct vb2_queue *vq, unsigned int count);
 void saa7134_vb2_stop_streaming(struct vb2_queue *vq);
 
-int saa7134_s_std(struct file *file, void *priv, v4l2_std_id id);
-int saa7134_g_std(struct file *file, void *priv, v4l2_std_id *id);
-int saa7134_querystd(struct file *file, void *priv, v4l2_std_id *std);
-int saa7134_enum_input(struct file *file, void *priv, struct v4l2_input *i);
-int saa7134_g_input(struct file *file, void *priv, unsigned int *i);
-int saa7134_s_input(struct file *file, void *priv, unsigned int i);
-int saa7134_querycap(struct file *file, void  *priv,
-					struct v4l2_capability *cap);
-int saa7134_g_tuner(struct file *file, void *priv,
-					struct v4l2_tuner *t);
-int saa7134_s_tuner(struct file *file, void *priv,
-					const struct v4l2_tuner *t);
-int saa7134_g_frequency(struct file *file, void *priv,
-					struct v4l2_frequency *f);
-int saa7134_s_frequency(struct file *file, void *priv,
-					const struct v4l2_frequency *f);
+int saa7134_s_std(struct file *file, struct video_device_state *state,
+		  v4l2_std_id id);
+int saa7134_g_std(struct file *file, struct video_device_state *state,
+		  v4l2_std_id *id);
+int saa7134_querystd(struct file *file, struct video_device_state *state,
+		     v4l2_std_id *std);
+int saa7134_enum_input(struct file *file, struct video_device_state *state,
+		       struct v4l2_input *i);
+int saa7134_g_input(struct file *file, struct video_device_state *state,
+		    unsigned int *i);
+int saa7134_s_input(struct file *file, struct video_device_state *state,
+		    unsigned int i);
+int saa7134_querycap(struct file *file, struct video_device_state *state,
+		     struct v4l2_capability *cap);
+int saa7134_g_tuner(struct file *file, struct video_device_state *state,
+		    struct v4l2_tuner *t);
+int saa7134_s_tuner(struct file *file, struct video_device_state *state,
+		    const struct v4l2_tuner *t);
+int saa7134_g_frequency(struct file *file, struct video_device_state *state,
+			struct v4l2_frequency *f);
+int saa7134_s_frequency(struct file *file, struct video_device_state *state,
+			const struct v4l2_frequency *f);
 
 int saa7134_videoport_init(struct saa7134_dev *dev);
 void saa7134_set_tvnorm_hw(struct saa7134_dev *dev);
diff --git a/drivers/media/pci/saa7146/hexium_gemini.c b/drivers/media/pci/saa7146/hexium_gemini.c
index 40b35098f3ead1d63378d05beb2ccddf3977a2da..cdbdfdf627362b202528e40efbd38008e464f4f9 100644
--- a/drivers/media/pci/saa7146/hexium_gemini.c
+++ b/drivers/media/pci/saa7146/hexium_gemini.c
@@ -201,7 +201,9 @@ static int hexium_set_standard(struct hexium *hexium, struct hexium_data *vdec)
 	return 0;
 }
 
-static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_input *i)
 {
 	DEB_EE("VIDIOC_ENUMINPUT %d\n", i->index);
 
@@ -214,7 +216,8 @@ static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *input)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct hexium *hexium = (struct hexium *) dev->ext_priv;
@@ -225,7 +228,8 @@ static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int input)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct hexium *hexium = (struct hexium *) dev->ext_priv;
diff --git a/drivers/media/pci/saa7146/hexium_orion.c b/drivers/media/pci/saa7146/hexium_orion.c
index a2076728c6210e9d5442f51fbbc13a87371973e4..0075f0d2b962b46960f650256425ca7620c3a8a6 100644
--- a/drivers/media/pci/saa7146/hexium_orion.c
+++ b/drivers/media/pci/saa7146/hexium_orion.c
@@ -312,7 +312,9 @@ static int hexium_set_input(struct hexium *hexium, int input)
 	return 0;
 }
 
-static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_input *i)
 {
 	DEB_EE("VIDIOC_ENUMINPUT %d\n", i->index);
 
@@ -325,7 +327,8 @@ static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *input)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct hexium *hexium = (struct hexium *) dev->ext_priv;
@@ -336,7 +339,8 @@ static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int input)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct hexium *hexium = (struct hexium *) dev->ext_priv;
diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index a14b839098b8491b2a2ff3ce0d9d25682309607e..8ad048dfa0134f8cf9a9ba80345d28d743201ad4 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -446,7 +446,9 @@ void mxb_irq_bh(struct saa7146_dev* dev, u32* irq_mask)
 }
 */
 
-static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_input *i)
 {
 	DEB_EE("VIDIOC_ENUMINPUT %d\n", i->index);
 	if (i->index >= MXB_INPUTS)
@@ -455,7 +457,8 @@ static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *fh, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
@@ -465,7 +468,8 @@ static int vidioc_g_input(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int input)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
@@ -530,7 +534,8 @@ static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
+static int vidioc_g_tuner(struct file *file, struct video_device_state *state,
+			  struct v4l2_tuner *t)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
@@ -552,7 +557,8 @@ static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
 	return call_all(dev, tuner, g_tuner, t);
 }
 
-static int vidioc_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *t)
+static int vidioc_s_tuner(struct file *file, struct video_device_state *state,
+			  const struct v4l2_tuner *t)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
@@ -567,14 +573,18 @@ static int vidioc_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *
 	return call_all(dev, tuner, s_tuner, t);
 }
 
-static int vidioc_querystd(struct file *file, void *fh, v4l2_std_id *norm)
+static int vidioc_querystd(struct file *file,
+			   struct video_device_state *state,
+			   v4l2_std_id *norm)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 
 	return call_all(dev, video, querystd, norm);
 }
 
-static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency *f)
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_frequency *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
@@ -587,7 +597,9 @@ static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency
 	return 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *f)
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
+			      const struct v4l2_frequency *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
@@ -610,7 +622,9 @@ static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_fre
 	return 0;
 }
 
-static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
+static int vidioc_enumaudio(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_audio *a)
 {
 	if (a->index >= MXB_AUDIOS)
 		return -EINVAL;
@@ -618,7 +632,8 @@ static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
 	return 0;
 }
 
-static int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *a)
+static int vidioc_g_audio(struct file *file, struct video_device_state *state,
+			  struct v4l2_audio *a)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
@@ -628,7 +643,8 @@ static int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *a)
 	return 0;
 }
 
-static int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *a)
+static int vidioc_s_audio(struct file *file, struct video_device_state *state,
+			  const struct v4l2_audio *a)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
@@ -648,7 +664,9 @@ static int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int vidioc_g_register(struct file *file, void *fh, struct v4l2_dbg_register *reg)
+static int vidioc_g_register(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_dbg_register *reg)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 
@@ -659,7 +677,9 @@ static int vidioc_g_register(struct file *file, void *fh, struct v4l2_dbg_regist
 	return 0;
 }
 
-static int vidioc_s_register(struct file *file, void *fh, const struct v4l2_dbg_register *reg)
+static int vidioc_s_register(struct file *file,
+			     struct video_device_state *state,
+			     const struct v4l2_dbg_register *reg)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 
diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index 66d650b5f69af1eac9117b9c65ac7c39883f6f21..1a193a4c05a45f421f5666e47a46fde0b702f47b 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -217,7 +217,8 @@ int saa7164_s_std(struct saa7164_port *port, v4l2_std_id id)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id)
 {
 	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
@@ -230,14 +231,16 @@ int saa7164_g_std(struct saa7164_port *port, v4l2_std_id *id)
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *id)
 {
 	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_g_std(fh->port, id);
 }
 
-int saa7164_enum_input(struct file *file, void *priv, struct v4l2_input *i)
+int saa7164_enum_input(struct file *file, struct video_device_state *state,
+		       struct v4l2_input *i)
 {
 	static const char * const inputs[] = {
 		"tuner", "composite", "svideo", "aux",
@@ -275,7 +278,8 @@ int saa7164_g_input(struct saa7164_port *port, unsigned int *i)
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
@@ -299,14 +303,16 @@ int saa7164_s_input(struct saa7164_port *port, unsigned int i)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_s_input(fh->port, i);
 }
 
-int saa7164_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
+int saa7164_g_tuner(struct file *file, struct video_device_state *state,
+		    struct v4l2_tuner *t)
 {
 	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
@@ -325,7 +331,8 @@ int saa7164_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 	return 0;
 }
 
-int saa7164_s_tuner(struct file *file, void *priv,
+int saa7164_s_tuner(struct file *file,
+		    struct video_device_state *state,
 			   const struct v4l2_tuner *t)
 {
 	if (0 != t->index)
@@ -344,8 +351,8 @@ int saa7164_g_frequency(struct saa7164_port *port, struct v4l2_frequency *f)
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
-	struct v4l2_frequency *f)
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state, struct v4l2_frequency *f)
 {
 	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
@@ -397,7 +404,8 @@ int saa7164_s_frequency(struct saa7164_port *port,
 	return 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 			      const struct v4l2_frequency *f)
 {
 	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
@@ -480,8 +488,8 @@ static int saa7164_s_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
-static int vidioc_querycap(struct file *file, void  *priv,
-	struct v4l2_capability *cap)
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state, struct v4l2_capability *cap)
 {
 	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
@@ -496,8 +504,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
-	struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state, struct v4l2_fmtdesc *f)
 {
 	if (f->index != 0)
 		return -EINVAL;
@@ -507,7 +515,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
diff --git a/drivers/media/pci/saa7164/saa7164-vbi.c b/drivers/media/pci/saa7164/saa7164-vbi.c
index 57e4362c0d19d0d3a5f0be1ee58cd141fdf62462..74c71a61ab4db045db44a8283063337992bdf226 100644
--- a/drivers/media/pci/saa7164/saa7164-vbi.c
+++ b/drivers/media/pci/saa7164/saa7164-vbi.c
@@ -142,44 +142,48 @@ static int saa7164_vbi_initialize(struct saa7164_port *port)
 }
 
 /* -- V4L2 --------------------------------------------------------- */
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id)
 {
 	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_s_std(fh->port->enc_port, id);
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *id)
 {
 	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_g_std(fh->port->enc_port, id);
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_g_input(fh->port->enc_port, i);
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_s_input(fh->port->enc_port, i);
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
-	struct v4l2_frequency *f)
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state, struct v4l2_frequency *f)
 {
 	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_g_frequency(fh->port->enc_port, f);
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
-	const struct v4l2_frequency *f)
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state, const struct v4l2_frequency *f)
 {
 	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	int ret = saa7164_s_frequency(fh->port->enc_port, f);
@@ -189,8 +193,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	return ret;
 }
 
-static int vidioc_querycap(struct file *file, void  *priv,
-	struct v4l2_capability *cap)
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state, struct v4l2_capability *cap)
 {
 	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	struct saa7164_port *port = fh->port;
@@ -390,7 +394,8 @@ static int saa7164_vbi_start_streaming(struct saa7164_port *port)
 	return ret;
 }
 
-static int saa7164_vbi_fmt(struct file *file, void *priv,
+static int saa7164_vbi_fmt(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_format *f)
 {
 	/* ntsc */
diff --git a/drivers/media/pci/saa7164/saa7164.h b/drivers/media/pci/saa7164/saa7164.h
index 94e987e7b5e5d4af8f3cdc7c148eb2b33b1076b9..612890fa19c1680b5327f54a8e943fd15899f7cf 100644
--- a/drivers/media/pci/saa7164/saa7164.h
+++ b/drivers/media/pci/saa7164/saa7164.h
@@ -590,11 +590,14 @@ extern int saa7164_buffer_zero_offsets(struct saa7164_port *port, int i);
 /* saa7164-encoder.c                                            */
 int saa7164_s_std(struct saa7164_port *port, v4l2_std_id id);
 int saa7164_g_std(struct saa7164_port *port, v4l2_std_id *id);
-int saa7164_enum_input(struct file *file, void *priv, struct v4l2_input *i);
+int saa7164_enum_input(struct file *file, struct video_device_state *state,
+		       struct v4l2_input *i);
 int saa7164_g_input(struct saa7164_port *port, unsigned int *i);
 int saa7164_s_input(struct saa7164_port *port, unsigned int i);
-int saa7164_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t);
-int saa7164_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *t);
+int saa7164_g_tuner(struct file *file, struct video_device_state *state,
+		    struct v4l2_tuner *t);
+int saa7164_s_tuner(struct file *file, struct video_device_state *state,
+		    const struct v4l2_tuner *t);
 int saa7164_g_frequency(struct saa7164_port *port, struct v4l2_frequency *f);
 int saa7164_s_frequency(struct saa7164_port *port,
 			const struct v4l2_frequency *f);
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 5ee59b3844cc3dc4ae42c255a0ea3e624c605a1d..c8921f139885ec28ec6fcb967819f5e616868e2e 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -758,7 +758,8 @@ static const struct vb2_ops solo_enc_video_qops = {
 	.stop_streaming = solo_enc_stop_streaming,
 };
 
-static int solo_enc_querycap(struct file *file, void  *priv,
+static int solo_enc_querycap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_capability *cap)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
@@ -769,7 +770,8 @@ static int solo_enc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int solo_enc_enum_input(struct file *file, void *priv,
+static int solo_enc_enum_input(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_input *input)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
@@ -789,7 +791,8 @@ static int solo_enc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_enc_set_input(struct file *file, void *priv,
+static int solo_enc_set_input(struct file *file,
+			      struct video_device_state *state,
 			      unsigned int index)
 {
 	if (index)
@@ -798,7 +801,8 @@ static int solo_enc_set_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_enc_get_input(struct file *file, void *priv,
+static int solo_enc_get_input(struct file *file,
+			      struct video_device_state *state,
 			      unsigned int *index)
 {
 	*index = 0;
@@ -806,7 +810,8 @@ static int solo_enc_get_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_enc_enum_fmt_cap(struct file *file, void *priv,
+static int solo_enc_enum_fmt_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
@@ -839,7 +844,8 @@ static inline int solo_valid_pixfmt(u32 pixfmt, int dev_type)
 		|| pixfmt == V4L2_PIX_FMT_MJPEG ? 0 : -EINVAL;
 }
 
-static int solo_enc_try_fmt_cap(struct file *file, void *priv,
+static int solo_enc_try_fmt_cap(struct file *file,
+				struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
@@ -878,7 +884,8 @@ static int solo_enc_try_fmt_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_enc_set_fmt_cap(struct file *file, void *priv,
+static int solo_enc_set_fmt_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
@@ -889,7 +896,7 @@ static int solo_enc_set_fmt_cap(struct file *file, void *priv,
 	if (vb2_is_busy(&solo_enc->vidq))
 		return -EBUSY;
 
-	ret = solo_enc_try_fmt_cap(file, priv, f);
+	ret = solo_enc_try_fmt_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -915,7 +922,8 @@ static int solo_enc_set_fmt_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_enc_get_fmt_cap(struct file *file, void *priv,
+static int solo_enc_get_fmt_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
@@ -932,7 +940,8 @@ static int solo_enc_get_fmt_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_enc_g_std(struct file *file, void *priv, v4l2_std_id *i)
+static int solo_enc_g_std(struct file *file, struct video_device_state *state,
+			  v4l2_std_id *i)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
 	struct solo_dev *solo_dev = solo_enc->solo_dev;
@@ -944,14 +953,16 @@ static int solo_enc_g_std(struct file *file, void *priv, v4l2_std_id *i)
 	return 0;
 }
 
-static int solo_enc_s_std(struct file *file, void *priv, v4l2_std_id std)
+static int solo_enc_s_std(struct file *file, struct video_device_state *state,
+			  v4l2_std_id std)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
 
 	return solo_set_video_type(solo_enc->solo_dev, std & V4L2_STD_625_50);
 }
 
-static int solo_enum_framesizes(struct file *file, void *priv,
+static int solo_enum_framesizes(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_frmsizeenum *fsize)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
@@ -978,7 +989,8 @@ static int solo_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_enum_frameintervals(struct file *file, void *priv,
+static int solo_enum_frameintervals(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_frmivalenum *fintv)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
@@ -1008,7 +1020,8 @@ static int solo_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_g_parm(struct file *file, void *priv,
+static int solo_g_parm(struct file *file,
+		       struct video_device_state *state,
 		       struct v4l2_streamparm *sp)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
@@ -1034,7 +1047,8 @@ static inline int calc_interval(u8 fps, u32 n, u32 d)
 	return min(15U, n / d + (n % d >= (fps >> 1)));
 }
 
-static int solo_s_parm(struct file *file, void *priv,
+static int solo_s_parm(struct file *file,
+		       struct video_device_state *state,
 		       struct v4l2_streamparm *sp)
 {
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
@@ -1046,7 +1060,7 @@ static int solo_s_parm(struct file *file, void *priv,
 
 	solo_enc->interval = calc_interval(fps, t->numerator, t->denominator);
 	solo_update_mode(solo_enc);
-	return solo_g_parm(file, priv, sp);
+	return solo_g_parm(file, state, sp);
 }
 
 static int solo_s_ctrl(struct v4l2_ctrl *ctrl)
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
index 35715b21dbdffc80de68990b88836700816e7cb6..7c0489c7b0d9f0c97e3386ccc2dcd96dcd3cad71 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
@@ -367,7 +367,8 @@ static const struct vb2_ops solo_video_qops = {
 	.stop_streaming = solo_stop_streaming,
 };
 
-static int solo_querycap(struct file *file, void  *priv,
+static int solo_querycap(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, SOLO6X10_NAME, sizeof(cap->driver));
@@ -399,7 +400,8 @@ static int solo_enum_ext_input(struct solo_dev *solo_dev,
 	return 0;
 }
 
-static int solo_enum_input(struct file *file, void *priv,
+static int solo_enum_input(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_input *input)
 {
 	struct solo_dev *solo_dev = video_drvdata(file);
@@ -423,7 +425,8 @@ static int solo_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_set_input(struct file *file, void *priv, unsigned int index)
+static int solo_set_input(struct file *file, struct video_device_state *state,
+			  unsigned int index)
 {
 	struct solo_dev *solo_dev = video_drvdata(file);
 	int ret = solo_v4l2_set_ch(solo_dev, index);
@@ -436,7 +439,8 @@ static int solo_set_input(struct file *file, void *priv, unsigned int index)
 	return ret;
 }
 
-static int solo_get_input(struct file *file, void *priv, unsigned int *index)
+static int solo_get_input(struct file *file, struct video_device_state *state,
+			  unsigned int *index)
 {
 	struct solo_dev *solo_dev = video_drvdata(file);
 
@@ -445,7 +449,8 @@ static int solo_get_input(struct file *file, void *priv, unsigned int *index)
 	return 0;
 }
 
-static int solo_enum_fmt_cap(struct file *file, void *priv,
+static int solo_enum_fmt_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_fmtdesc *f)
 {
 	if (f->index)
@@ -455,7 +460,8 @@ static int solo_enum_fmt_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_try_fmt_cap(struct file *file, void *priv,
+static int solo_try_fmt_cap(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct solo_dev *solo_dev = video_drvdata(file);
@@ -474,7 +480,8 @@ static int solo_try_fmt_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_set_fmt_cap(struct file *file, void *priv,
+static int solo_set_fmt_cap(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct solo_dev *solo_dev = video_drvdata(file);
@@ -484,10 +491,11 @@ static int solo_set_fmt_cap(struct file *file, void *priv,
 
 	/* For right now, if it doesn't match our running config,
 	 * then fail */
-	return solo_try_fmt_cap(file, priv, f);
+	return solo_try_fmt_cap(file, state, f);
 }
 
-static int solo_get_fmt_cap(struct file *file, void *priv,
+static int solo_get_fmt_cap(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct solo_dev *solo_dev = video_drvdata(file);
@@ -504,7 +512,8 @@ static int solo_get_fmt_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_g_std(struct file *file, void *priv, v4l2_std_id *i)
+static int solo_g_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id *i)
 {
 	struct solo_dev *solo_dev = video_drvdata(file);
 
@@ -536,7 +545,8 @@ int solo_set_video_type(struct solo_dev *solo_dev, bool is_50hz)
 	return solo_v4l2_set_ch(solo_dev, solo_dev->cur_disp_ch);
 }
 
-static int solo_s_std(struct file *file, void *priv, v4l2_std_id std)
+static int solo_s_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id std)
 {
 	struct solo_dev *solo_dev = video_drvdata(file);
 
diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci/budget-av.c
index 69f5e810f9b54df5e3d69a5d06a5cefc12cef6a9..63505f445b67833015aa9aad8314e256d386ff30 100644
--- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -1398,7 +1398,9 @@ static struct v4l2_input knc1_inputs[KNC1_INPUTS] = {
 		V4L2_STD_PAL_BG | V4L2_STD_NTSC_M, 0, V4L2_IN_CAP_STD },
 };
 
-static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_input *i)
 {
 	dprintk(1, "VIDIOC_ENUMINPUT %d\n", i->index);
 	if (i->index >= KNC1_INPUTS)
@@ -1407,7 +1409,8 @@ static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *fh, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct budget_av *budget_av = dev->ext_priv;
@@ -1418,7 +1421,8 @@ static int vidioc_g_input(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int input)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct budget_av *budget_av = dev->ext_priv;
diff --git a/drivers/media/pci/tw5864/tw5864-video.c b/drivers/media/pci/tw5864/tw5864-video.c
index 0a08708e52b08283074db66611969312762182a8..46b5e773aa3343d1df4a4b7e9f9ed8ff3baa6372 100644
--- a/drivers/media/pci/tw5864/tw5864-video.c
+++ b/drivers/media/pci/tw5864/tw5864-video.c
@@ -526,7 +526,8 @@ static int tw5864_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
-static int tw5864_fmt_vid_cap(struct file *file, void *priv,
+static int tw5864_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct tw5864_input *input = video_drvdata(file);
@@ -551,7 +552,8 @@ static int tw5864_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw5864_enum_input(struct file *file, void *priv,
+static int tw5864_enum_input(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_input *i)
 {
 	struct tw5864_input *input = video_drvdata(file);
@@ -582,20 +584,23 @@ static int tw5864_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw5864_g_input(struct file *file, void *priv, unsigned int *i)
+static int tw5864_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int tw5864_s_input(struct file *file, void *priv, unsigned int i)
+static int tw5864_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	if (i)
 		return -EINVAL;
 	return 0;
 }
 
-static int tw5864_querycap(struct file *file, void *priv,
+static int tw5864_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct tw5864_input *input = video_drvdata(file);
@@ -606,7 +611,8 @@ static int tw5864_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw5864_querystd(struct file *file, void *priv, v4l2_std_id *std)
+static int tw5864_querystd(struct file *file,
+			   struct video_device_state *state, v4l2_std_id *std)
 {
 	struct tw5864_input *input = video_drvdata(file);
 	enum tw5864_vid_std tw_std;
@@ -620,7 +626,8 @@ static int tw5864_querystd(struct file *file, void *priv, v4l2_std_id *std)
 	return 0;
 }
 
-static int tw5864_g_std(struct file *file, void *priv, v4l2_std_id *std)
+static int tw5864_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *std)
 {
 	struct tw5864_input *input = video_drvdata(file);
 
@@ -628,7 +635,8 @@ static int tw5864_g_std(struct file *file, void *priv, v4l2_std_id *std)
 	return 0;
 }
 
-static int tw5864_s_std(struct file *file, void *priv, v4l2_std_id std)
+static int tw5864_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id std)
 {
 	struct tw5864_input *input = video_drvdata(file);
 	struct tw5864_dev *dev = input->root;
@@ -639,7 +647,8 @@ static int tw5864_s_std(struct file *file, void *priv, v4l2_std_id std)
 	return 0;
 }
 
-static int tw5864_enum_fmt_vid_cap(struct file *file, void *priv,
+static int tw5864_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	if (f->index)
@@ -727,7 +736,8 @@ static int tw5864_frameinterval_get(struct tw5864_input *input,
 	return 0;
 }
 
-static int tw5864_enum_framesizes(struct file *file, void *priv,
+static int tw5864_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct tw5864_input *input = video_drvdata(file);
@@ -744,7 +754,8 @@ static int tw5864_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw5864_enum_frameintervals(struct file *file, void *priv,
+static int tw5864_enum_frameintervals(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_frmivalenum *fintv)
 {
 	struct tw5864_input *input = video_drvdata(file);
@@ -754,7 +765,7 @@ static int tw5864_enum_frameintervals(struct file *file, void *priv,
 		.pixel_format = fintv->pixel_format };
 	int ret;
 
-	ret = tw5864_enum_framesizes(file, priv, &fsize);
+	ret = tw5864_enum_framesizes(file, state, &fsize);
 	if (ret)
 		return ret;
 
@@ -776,7 +787,8 @@ static int tw5864_enum_frameintervals(struct file *file, void *priv,
 	return ret;
 }
 
-static int tw5864_g_parm(struct file *file, void *priv,
+static int tw5864_g_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *sp)
 {
 	struct tw5864_input *input = video_drvdata(file);
@@ -796,7 +808,8 @@ static int tw5864_g_parm(struct file *file, void *priv,
 	return ret;
 }
 
-static int tw5864_s_parm(struct file *file, void *priv,
+static int tw5864_s_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *sp)
 {
 	struct tw5864_input *input = video_drvdata(file);
@@ -821,7 +834,7 @@ static int tw5864_s_parm(struct file *file, void *priv,
 	if (input->frame_interval < 1)
 		input->frame_interval = 1;
 	tw5864_frame_interval_set(input);
-	return tw5864_g_parm(file, priv, sp);
+	return tw5864_g_parm(file, state, sp);
 }
 
 static const struct v4l2_ctrl_ops tw5864_ctrl_ops = {
@@ -842,7 +855,8 @@ static const struct v4l2_file_operations video_fops = {
 
 #define INDIR_SPACE_MAP_SHIFT 0x100000
 
-static int tw5864_g_reg(struct file *file, void *fh,
+static int tw5864_g_reg(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_dbg_register *reg)
 {
 	struct tw5864_input *input = video_drvdata(file);
@@ -864,7 +878,8 @@ static int tw5864_g_reg(struct file *file, void *fh,
 	return 0;
 }
 
-static int tw5864_s_reg(struct file *file, void *fh,
+static int tw5864_s_reg(struct file *file,
+			struct video_device_state *state,
 			const struct v4l2_dbg_register *reg)
 {
 	struct tw5864_input *input = video_drvdata(file);
diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 6232bac170d00f4132111575bc600e41897e9c8c..4d0e62006c9347948bc09de87a489e706a249aeb 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -569,7 +569,8 @@ static int tw68_s_ctrl(struct v4l2_ctrl *ctrl)
  * Note that this routine returns what is stored in the fh structure, and
  * does not interrogate any of the device registers.
  */
-static int tw68_g_fmt_vid_cap(struct file *file, void *priv,
+static int tw68_g_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct tw68_dev *dev = video_drvdata(file);
@@ -586,7 +587,8 @@ static int tw68_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw68_try_fmt_vid_cap(struct file *file, void *priv,
+static int tw68_try_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 						struct v4l2_format *f)
 {
 	struct tw68_dev *dev = video_drvdata(file);
@@ -641,13 +643,14 @@ static int tw68_try_fmt_vid_cap(struct file *file, void *priv,
  * some number of buffers on the "active" chain which will be filled before
  * the change takes place.
  */
-static int tw68_s_fmt_vid_cap(struct file *file, void *priv,
+static int tw68_s_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct tw68_dev *dev = video_drvdata(file);
 	int err;
 
-	err = tw68_try_fmt_vid_cap(file, priv, f);
+	err = tw68_try_fmt_vid_cap(file, state, f);
 	if (0 != err)
 		return err;
 
@@ -658,7 +661,8 @@ static int tw68_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw68_enum_input(struct file *file, void *priv,
+static int tw68_enum_input(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_input *i)
 {
 	struct tw68_dev *dev = video_drvdata(file);
@@ -691,7 +695,8 @@ static int tw68_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw68_g_input(struct file *file, void *priv, unsigned int *i)
+static int tw68_g_input(struct file *file, struct video_device_state *state,
+			unsigned int *i)
 {
 	struct tw68_dev *dev = video_drvdata(file);
 
@@ -699,7 +704,8 @@ static int tw68_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int tw68_s_input(struct file *file, void *priv, unsigned int i)
+static int tw68_s_input(struct file *file, struct video_device_state *state,
+			unsigned int i)
 {
 	struct tw68_dev *dev = video_drvdata(file);
 
@@ -710,7 +716,8 @@ static int tw68_s_input(struct file *file, void *priv, unsigned int i)
 	return 0;
 }
 
-static int tw68_querycap(struct file *file, void  *priv,
+static int tw68_querycap(struct file *file,
+			 struct video_device_state *state,
 					struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "tw68", sizeof(cap->driver));
@@ -719,7 +726,8 @@ static int tw68_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int tw68_s_std(struct file *file, void *priv, v4l2_std_id id)
+static int tw68_s_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id id)
 {
 	struct tw68_dev *dev = video_drvdata(file);
 	unsigned int i;
@@ -747,7 +755,8 @@ static int tw68_s_std(struct file *file, void *priv, v4l2_std_id id)
 	return 0;
 }
 
-static int tw68_g_std(struct file *file, void *priv, v4l2_std_id *id)
+static int tw68_g_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id *id)
 {
 	struct tw68_dev *dev = video_drvdata(file);
 
@@ -755,7 +764,8 @@ static int tw68_g_std(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-static int tw68_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int tw68_enum_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	if (f->index >= FORMATS)
@@ -810,16 +820,18 @@ static void tw68_dump_regs(struct tw68_dev *dev)
 	}
 }
 
-static int vidioc_log_status(struct file *file, void *priv)
+static int vidioc_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct tw68_dev *dev = video_drvdata(file);
 
 	tw68_dump_regs(dev);
-	return v4l2_ctrl_log_status(file, priv);
+	return v4l2_ctrl_log_status(file, state);
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int vidioc_g_register(struct file *file, void *priv,
+static int vidioc_g_register(struct file *file,
+			     struct video_device_state *state,
 			      struct v4l2_dbg_register *reg)
 {
 	struct tw68_dev *dev = video_drvdata(file);
@@ -831,7 +843,8 @@ static int vidioc_g_register(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_register(struct file *file, void *priv,
+static int vidioc_s_register(struct file *file,
+			     struct video_device_state *state,
 				const struct v4l2_dbg_register *reg)
 {
 	struct tw68_dev *dev = video_drvdata(file);
diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 785dd797d921b515ead7b500edd01a4ac0618e6d..bee07ce0dfd207aeda5094e09394d2f3d92ae3c6 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -618,7 +618,8 @@ static const struct v4l2_ctrl_ops ctrl_ops = {
 	.s_ctrl = tw686x_s_ctrl,
 };
 
-static int tw686x_g_fmt_vid_cap(struct file *file, void *priv,
+static int tw686x_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
@@ -634,7 +635,8 @@ static int tw686x_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw686x_try_fmt_vid_cap(struct file *file, void *priv,
+static int tw686x_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
@@ -731,7 +733,8 @@ static int tw686x_set_format(struct tw686x_video_channel *vc,
 	return 0;
 }
 
-static int tw686x_s_fmt_vid_cap(struct file *file, void *priv,
+static int tw686x_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
@@ -743,7 +746,7 @@ static int tw686x_s_fmt_vid_cap(struct file *file, void *priv,
 		return -EBUSY;
 
 	area = vc->width * vc->height;
-	err = tw686x_try_fmt_vid_cap(file, priv, f);
+	err = tw686x_try_fmt_vid_cap(file, state, f);
 	if (err)
 		return err;
 
@@ -753,7 +756,8 @@ static int tw686x_s_fmt_vid_cap(struct file *file, void *priv,
 				 realloc);
 }
 
-static int tw686x_querycap(struct file *file, void *priv,
+static int tw686x_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
@@ -798,7 +802,8 @@ static int tw686x_set_standard(struct tw686x_video_channel *vc, v4l2_std_id id)
 	return 0;
 }
 
-static int tw686x_s_std(struct file *file, void *priv, v4l2_std_id id)
+static int tw686x_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
 	struct v4l2_format f;
@@ -818,8 +823,8 @@ static int tw686x_s_std(struct file *file, void *priv, v4l2_std_id id)
 	 * calling g_fmt and s_fmt will sanitize the height
 	 * according to the standard.
 	 */
-	tw686x_g_fmt_vid_cap(file, priv, &f);
-	tw686x_s_fmt_vid_cap(file, priv, &f);
+	tw686x_g_fmt_vid_cap(file, state, &f);
+	tw686x_s_fmt_vid_cap(file, state, &f);
 
 	/*
 	 * Frame decimation depends on the chosen standard,
@@ -829,7 +834,8 @@ static int tw686x_s_std(struct file *file, void *priv, v4l2_std_id id)
 	return 0;
 }
 
-static int tw686x_querystd(struct file *file, void *priv, v4l2_std_id *std)
+static int tw686x_querystd(struct file *file,
+			   struct video_device_state *state, v4l2_std_id *std)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
 	struct tw686x_dev *dev = vc->dev;
@@ -887,7 +893,8 @@ static int tw686x_querystd(struct file *file, void *priv, v4l2_std_id *std)
 	return 0;
 }
 
-static int tw686x_g_std(struct file *file, void *priv, v4l2_std_id *id)
+static int tw686x_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *id)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
 
@@ -895,7 +902,8 @@ static int tw686x_g_std(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-static int tw686x_enum_framesizes(struct file *file, void *priv,
+static int tw686x_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
@@ -912,7 +920,8 @@ static int tw686x_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw686x_enum_frameintervals(struct file *file, void *priv,
+static int tw686x_enum_frameintervals(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_frmivalenum *ival)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
@@ -931,7 +940,8 @@ static int tw686x_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw686x_g_parm(struct file *file, void *priv,
+static int tw686x_g_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *sp)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
@@ -947,7 +957,8 @@ static int tw686x_g_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int tw686x_s_parm(struct file *file, void *priv,
+static int tw686x_s_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *sp)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
@@ -962,10 +973,11 @@ static int tw686x_s_parm(struct file *file, void *priv,
 	fps = (!numerator || !denominator) ? 0 : denominator / numerator;
 	if (vc->fps != fps)
 		tw686x_set_framerate(vc, fps);
-	return tw686x_g_parm(file, priv, sp);
+	return tw686x_g_parm(file, state, sp);
 }
 
-static int tw686x_enum_fmt_vid_cap(struct file *file, void *priv,
+static int tw686x_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(formats))
@@ -986,7 +998,8 @@ static void tw686x_set_input(struct tw686x_video_channel *vc, unsigned int i)
 	reg_write(vc->dev, VDMA_CHANNEL_CONFIG[vc->ch], val);
 }
 
-static int tw686x_s_input(struct file *file, void *priv, unsigned int i)
+static int tw686x_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
 
@@ -1004,7 +1017,8 @@ static int tw686x_s_input(struct file *file, void *priv, unsigned int i)
 	return 0;
 }
 
-static int tw686x_g_input(struct file *file, void *priv, unsigned int *i)
+static int tw686x_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
 
@@ -1012,7 +1026,8 @@ static int tw686x_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int tw686x_enum_input(struct file *file, void *priv,
+static int tw686x_enum_input(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_input *i)
 {
 	struct tw686x_video_channel *vc = video_drvdata(file);
diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index 5b4d5dd06edbc07977bc779df6aead637eead898..488f4b4e92e90ccaf27da34ceeb7c2b0d0c93894 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -245,7 +245,8 @@ static int zoran_set_input(struct zoran *zr, int input)
  *   ioctl routine
  */
 
-static int zoran_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+static int zoran_querycap(struct file *file, struct video_device_state *state,
+			  struct v4l2_capability *cap)
 {
 	struct zoran *zr = video_drvdata(file);
 
@@ -278,7 +279,8 @@ static int zoran_enum_fmt(struct zoran *zr, struct v4l2_fmtdesc *fmt, int flag)
 	return -EINVAL;
 }
 
-static int zoran_enum_fmt_vid_cap(struct file *file, void *fh,
+static int zoran_enum_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_fmtdesc *f)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -308,13 +310,14 @@ static int zoran_g_fmt_vid_out(struct file *file, void *fh,
 	return 0;
 }
 
-static int zoran_g_fmt_vid_cap(struct file *file, void *fh,
+static int zoran_g_fmt_vid_cap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *fmt)
 {
 	struct zoran *zr = video_drvdata(file);
 
 	if (zr->map_mode != ZORAN_MAP_MODE_RAW)
-		return zoran_g_fmt_vid_out(file, fh, fmt);
+		return zoran_g_fmt_vid_out(file, state, fmt);
 	fmt->fmt.pix.width = zr->v4l_settings.width;
 	fmt->fmt.pix.height = zr->v4l_settings.height;
 	fmt->fmt.pix.sizeimage = zr->buffer_size;
@@ -391,7 +394,8 @@ static int zoran_try_fmt_vid_out(struct file *file, void *fh,
 	return res;
 }
 
-static int zoran_try_fmt_vid_cap(struct file *file, void *fh,
+static int zoran_try_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *fmt)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -399,7 +403,7 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *fh,
 	int i;
 
 	if (fmt->fmt.pix.pixelformat == V4L2_PIX_FMT_MJPEG)
-		return zoran_try_fmt_vid_out(file, fh, fmt);
+		return zoran_try_fmt_vid_out(file, state, fmt);
 
 	for (i = 0; i < NUM_FORMATS; i++)
 		if (zoran_formats[i].fourcc == fmt->fmt.pix.pixelformat)
@@ -507,7 +511,8 @@ static int zoran_s_fmt_vid_out(struct file *file, void *fh,
 	return res;
 }
 
-static int zoran_s_fmt_vid_cap(struct file *file, void *fh,
+static int zoran_s_fmt_vid_cap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *fmt)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -515,7 +520,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *fh,
 	int res = 0;
 
 	if (fmt->fmt.pix.pixelformat == V4L2_PIX_FMT_MJPEG)
-		return zoran_s_fmt_vid_out(file, fh, fmt);
+		return zoran_s_fmt_vid_out(file, state, fmt);
 
 	for (i = 0; i < NUM_FORMATS; i++)
 		if (fmt->fmt.pix.pixelformat == zoran_formats[i].fourcc)
@@ -555,7 +560,8 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *fh,
 	return res;
 }
 
-static int zoran_g_std(struct file *file, void *fh, v4l2_std_id *std)
+static int zoran_g_std(struct file *file, struct video_device_state *state,
+		       v4l2_std_id *std)
 {
 	struct zoran *zr = video_drvdata(file);
 
@@ -563,7 +569,8 @@ static int zoran_g_std(struct file *file, void *fh, v4l2_std_id *std)
 	return 0;
 }
 
-static int zoran_s_std(struct file *file, void *fh, v4l2_std_id std)
+static int zoran_s_std(struct file *file, struct video_device_state *state,
+		       v4l2_std_id std)
 {
 	struct zoran *zr = video_drvdata(file);
 	int res = 0;
@@ -578,7 +585,8 @@ static int zoran_s_std(struct file *file, void *fh, v4l2_std_id std)
 	return res;
 }
 
-static int zoran_enum_input(struct file *file, void *fh,
+static int zoran_enum_input(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_input *inp)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -595,7 +603,8 @@ static int zoran_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int zoran_g_input(struct file *file, void *fh, unsigned int *input)
+static int zoran_g_input(struct file *file, struct video_device_state *state,
+			 unsigned int *input)
 {
 	struct zoran *zr = video_drvdata(file);
 
@@ -604,7 +613,8 @@ static int zoran_g_input(struct file *file, void *fh, unsigned int *input)
 	return 0;
 }
 
-static int zoran_s_input(struct file *file, void *fh, unsigned int input)
+static int zoran_s_input(struct file *file, struct video_device_state *state,
+			 unsigned int input)
 {
 	struct zoran *zr = video_drvdata(file);
 	int res;
@@ -617,7 +627,9 @@ static int zoran_s_input(struct file *file, void *fh, unsigned int input)
 }
 
 /* cropping (sub-frame capture) */
-static int zoran_g_selection(struct file *file, void *fh, struct v4l2_selection *sel)
+static int zoran_g_selection(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_selection *sel)
 {
 	struct zoran *zr = video_drvdata(file);
 
@@ -652,7 +664,9 @@ static int zoran_g_selection(struct file *file, void *fh, struct v4l2_selection
 	return 0;
 }
 
-static int zoran_s_selection(struct file *file, void *fh, struct v4l2_selection *sel)
+static int zoran_s_selection(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_selection *sel)
 {
 	struct zoran *zr = video_drvdata(file);
 	struct zoran_jpg_settings settings;
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 510c3c9661d990c8ae97d4b4d174639b5aa0b13d..a15773c0bfd737c90111e1cee632f63cde551954 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3247,7 +3247,8 @@ static int allegro_release(struct file *file)
 	return 0;
 }
 
-static int allegro_querycap(struct file *file, void *fh,
+static int allegro_querycap(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
@@ -3256,7 +3257,8 @@ static int allegro_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int allegro_enum_fmt_vid(struct file *file, void *fh,
+static int allegro_enum_fmt_vid(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	switch (f->type) {
@@ -3279,7 +3281,8 @@ static int allegro_enum_fmt_vid(struct file *file, void *fh,
 	return 0;
 }
 
-static int allegro_g_fmt_vid_cap(struct file *file, void *fh,
+static int allegro_g_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct allegro_channel *channel = file_to_channel(file);
@@ -3300,7 +3303,8 @@ static int allegro_g_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
+static int allegro_try_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	f->fmt.pix.field = V4L2_FIELD_NONE;
@@ -3321,14 +3325,15 @@ static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
+static int allegro_s_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct allegro_channel *channel = file_to_channel(file);
 	struct vb2_queue *vq;
 	int err;
 
-	err = allegro_try_fmt_vid_cap(file, fh, f);
+	err = allegro_try_fmt_vid_cap(file, state, f);
 	if (err)
 		return err;
 
@@ -3345,7 +3350,8 @@ static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int allegro_g_fmt_vid_out(struct file *file, void *fh,
+static int allegro_g_fmt_vid_out(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct allegro_channel *channel = file_to_channel(file);
@@ -3367,7 +3373,8 @@ static int allegro_g_fmt_vid_out(struct file *file, void *fh,
 	return 0;
 }
 
-static int allegro_try_fmt_vid_out(struct file *file, void *fh,
+static int allegro_try_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	f->fmt.pix.field = V4L2_FIELD_NONE;
@@ -3392,13 +3399,14 @@ static int allegro_try_fmt_vid_out(struct file *file, void *fh,
 	return 0;
 }
 
-static int allegro_s_fmt_vid_out(struct file *file, void *fh,
+static int allegro_s_fmt_vid_out(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct allegro_channel *channel = file_to_channel(file);
 	int err;
 
-	err = allegro_try_fmt_vid_out(file, fh, f);
+	err = allegro_try_fmt_vid_out(file, state, f);
 	if (err)
 		return err;
 
@@ -3433,17 +3441,18 @@ static int allegro_channel_cmd_start(struct allegro_channel *channel)
 	return 0;
 }
 
-static int allegro_encoder_cmd(struct file *file, void *fh,
+static int allegro_encoder_cmd(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_encoder_cmd *cmd)
 {
 	struct allegro_channel *channel = file_to_channel(file);
 	int err;
 
-	err = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
+	err = v4l2_m2m_ioctl_try_encoder_cmd(file, state, cmd);
 	if (err)
 		return err;
 
-	err = v4l2_m2m_ioctl_encoder_cmd(file, fh, cmd);
+	err = v4l2_m2m_ioctl_encoder_cmd(file, state, cmd);
 	if (err)
 		return err;
 
@@ -3456,7 +3465,8 @@ static int allegro_encoder_cmd(struct file *file, void *fh,
 	return err;
 }
 
-static int allegro_enum_framesizes(struct file *file, void *fh,
+static int allegro_enum_framesizes(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_frmsizeenum *fsize)
 {
 	switch (fsize->pixel_format) {
@@ -3482,7 +3492,8 @@ static int allegro_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int allegro_ioctl_streamon(struct file *file, void *priv,
+static int allegro_ioctl_streamon(struct file *file,
+				  struct video_device_state *state,
 				  enum v4l2_buf_type type)
 {
 	struct allegro_channel *channel = file_to_channel(file);
@@ -3497,7 +3508,8 @@ static int allegro_ioctl_streamon(struct file *file, void *priv,
 	return v4l2_m2m_streamon(file, channel->fh.m2m_ctx, type);
 }
 
-static int allegro_g_parm(struct file *file, void *fh,
+static int allegro_g_parm(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_streamparm *a)
 {
 	struct allegro_channel *channel = file_to_channel(file);
@@ -3514,7 +3526,8 @@ static int allegro_g_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int allegro_s_parm(struct file *file, void *fh,
+static int allegro_s_parm(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_streamparm *a)
 {
 	struct allegro_channel *channel = file_to_channel(file);
@@ -3528,7 +3541,7 @@ static int allegro_s_parm(struct file *file, void *fh,
 	timeperframe = &a->parm.output.timeperframe;
 
 	if (timeperframe->numerator == 0 || timeperframe->denominator == 0)
-		return allegro_g_parm(file, fh, a);
+		return allegro_g_parm(file, state, a);
 
 	div = gcd(timeperframe->denominator, timeperframe->numerator);
 	channel->framerate.numerator = timeperframe->denominator / div;
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
index 11d85f5342f0f41f9f6f70c18344344e3f26dade..ca940876f11dd3e8c4160aacffda6c8fa3e81f98 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
@@ -383,7 +383,8 @@ static void c3_isp_cap_return_buffers(struct c3_isp_capture *cap,
 	}
 }
 
-static int c3_isp_cap_querycap(struct file *file, void *fh,
+static int c3_isp_cap_querycap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, C3_ISP_DRIVER_NAME, sizeof(cap->driver));
@@ -392,7 +393,8 @@ static int c3_isp_cap_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int c3_isp_cap_enum_fmt(struct file *file, void *fh,
+static int c3_isp_cap_enum_fmt(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_fmtdesc *f)
 {
 	const struct c3_isp_cap_format_info *fmt;
@@ -422,7 +424,8 @@ static int c3_isp_cap_enum_fmt(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int c3_isp_cap_g_fmt_mplane(struct file *file, void *fh,
+static int c3_isp_cap_g_fmt_mplane(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct c3_isp_capture *cap = video_drvdata(file);
@@ -432,7 +435,8 @@ static int c3_isp_cap_g_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int c3_isp_cap_s_fmt_mplane(struct file *file, void *fh,
+static int c3_isp_cap_s_fmt_mplane(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct c3_isp_capture *cap = video_drvdata(file);
@@ -445,7 +449,8 @@ static int c3_isp_cap_s_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int c3_isp_cap_try_fmt_mplane(struct file *file, void *fh,
+static int c3_isp_cap_try_fmt_mplane(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	c3_cap_try_fmt(&f->fmt.pix_mp);
@@ -453,7 +458,8 @@ static int c3_isp_cap_try_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int c3_isp_cap_enum_frmsize(struct file *file, void *fh,
+static int c3_isp_cap_enum_frmsize(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_frmsizeenum *fsize)
 {
 	const struct c3_isp_cap_format_info *fmt;
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index c80667dd766210d2b2e1ee60c8254a5814b9d81b..b67409f8a6f1d7dc2f500e361618725f8fb144be 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -678,7 +678,8 @@ void c3_isp_params_pre_cfg(struct c3_isp_device *isp)
 
 /* V4L2 video operations */
 
-static int c3_isp_params_querycap(struct file *file, void *fh,
+static int c3_isp_params_querycap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, C3_ISP_DRIVER_NAME, sizeof(cap->driver));
@@ -687,7 +688,8 @@ static int c3_isp_params_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int c3_isp_params_enum_fmt(struct file *file, void *fh,
+static int c3_isp_params_enum_fmt(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_fmtdesc *f)
 {
 	if (f->index)
@@ -698,7 +700,8 @@ static int c3_isp_params_enum_fmt(struct file *file, void *fh,
 	return 0;
 }
 
-static int c3_isp_params_g_fmt(struct file *file, void *fh,
+static int c3_isp_params_g_fmt(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct c3_isp_params *params = video_drvdata(file);
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
index 8a5d7e1a30c952add138ffb4eb5c7ad36d54d233..1e5e5ae48445c7a7f6f668dc346a91eaa0553383 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
@@ -85,7 +85,8 @@ void c3_isp_stats_pre_cfg(struct c3_isp_device *isp)
 	c3_isp_stats_cfg_buff(stats);
 }
 
-static int c3_isp_stats_querycap(struct file *file, void *fh,
+static int c3_isp_stats_querycap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, C3_ISP_DRIVER_NAME, sizeof(cap->driver));
@@ -94,7 +95,8 @@ static int c3_isp_stats_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int c3_isp_stats_enum_fmt(struct file *file, void *fh,
+static int c3_isp_stats_enum_fmt(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	struct c3_isp_stats *stats = video_drvdata(file);
@@ -107,7 +109,8 @@ static int c3_isp_stats_enum_fmt(struct file *file, void *fh,
 	return 0;
 }
 
-static int c3_isp_stats_g_fmt(struct file *file, void *fh,
+static int c3_isp_stats_g_fmt(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct c3_isp_stats *stats = video_drvdata(file);
diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index 5744853a40035e9973e605dd3ffec508641470f2..68d0cdd6bee0893c19087dc67aec972ccf88ddeb 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -432,7 +432,8 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 }
 
 static int
-vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+vidioc_querycap(struct file *file, struct video_device_state *state,
+		struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, GE2D_NAME, sizeof(cap->driver));
 	strscpy(cap->card, GE2D_NAME, sizeof(cap->card));
@@ -441,7 +442,9 @@ vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 	return 0;
 }
 
-static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_fmtdesc *f)
 {
 	const struct ge2d_fmt *fmt;
 
@@ -454,7 +457,8 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 	return 0;
 }
 
-static int vidioc_g_selection(struct file *file, void *priv,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
@@ -504,7 +508,8 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_selection(struct file *file, void *priv,
+static int vidioc_s_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
@@ -572,7 +577,9 @@ static void vidioc_setup_cap_fmt(struct ge2d_ctx *ctx, struct v4l2_pix_format *f
 	}
 }
 
-static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt_cap(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *f)
 {
 	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	const struct ge2d_fmt *fmt = find_fmt(f);
@@ -593,7 +600,9 @@ static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format
 	return 0;
 }
 
-static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_s_fmt_cap(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_format *f)
 {
 	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
@@ -604,7 +613,7 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
 	/* Adjust all values accordingly to the hardware capabilities
 	 * and chosen format.
 	 */
-	ret = vidioc_try_fmt_cap(file, priv, f);
+	ret = vidioc_try_fmt_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -629,7 +638,8 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
 	return 0;
 }
 
-static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct vb2_queue *vq;
@@ -647,7 +657,9 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt_out(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *f)
 {
 	const struct ge2d_fmt *fmt = find_fmt(f);
 
@@ -668,7 +680,9 @@ static int vidioc_try_fmt_out(struct file *file, void *priv, struct v4l2_format
 	return 0;
 }
 
-static int vidioc_s_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_s_fmt_out(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_format *f)
 {
 	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
@@ -679,7 +693,7 @@ static int vidioc_s_fmt_out(struct file *file, void *priv, struct v4l2_format *f
 	/* Adjust all values accordingly to the hardware capabilities
 	 * and chosen format.
 	 */
-	ret = vidioc_try_fmt_out(file, priv, f);
+	ret = vidioc_try_fmt_out(file, state, f);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 32eef2fd1f2a90243256709d2a6a1f7d62a6816a..3b41bbad02139cb376def8f8a650416ef98ffd79 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -417,7 +417,8 @@ static void vdec_set_last_buffer_dequeued(struct vpu_inst *inst)
 	}
 }
 
-static int vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+static int vdec_querycap(struct file *file, struct video_device_state *state,
+			 struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "amphion-vpu", sizeof(cap->driver));
 	strscpy(cap->card, "amphion vpu decoder", sizeof(cap->card));
@@ -426,7 +427,8 @@ static int vdec_querycap(struct file *file, void *fh, struct v4l2_capability *ca
 	return 0;
 }
 
-static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int vdec_enum_fmt(struct file *file, struct video_device_state *state,
+			 struct v4l2_fmtdesc *f)
 {
 	struct vpu_inst *inst = to_inst(file);
 	struct vdec_t *vdec = inst->priv;
@@ -455,7 +457,8 @@ static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	return ret;
 }
 
-static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int vdec_g_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct vpu_inst *inst = to_inst(file);
 	struct vdec_t *vdec = inst->priv;
@@ -486,7 +489,8 @@ static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int vdec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int vdec_try_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct vpu_inst *inst = to_inst(file);
 	struct vdec_t *vdec = inst->priv;
@@ -592,7 +596,8 @@ static int vdec_s_fmt_common(struct vpu_inst *inst, struct v4l2_format *f)
 	return 0;
 }
 
-static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int vdec_s_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct vpu_inst *inst = to_inst(file);
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
@@ -625,7 +630,9 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return ret;
 }
 
-static int vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int vdec_g_selection(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_selection *s)
 {
 	struct vpu_inst *inst = to_inst(file);
 
@@ -713,12 +720,14 @@ static int vdec_cmd_stop(struct vpu_inst *inst)
 	return 0;
 }
 
-static int vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
+static int vdec_decoder_cmd(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_decoder_cmd *cmd)
 {
 	struct vpu_inst *inst = to_inst(file);
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, state, cmd);
 	if (ret)
 		return ret;
 
@@ -1885,7 +1894,6 @@ static struct vpu_inst_ops vdec_inst_ops = {
 
 static void vdec_init(struct file *file)
 {
-	struct vpu_inst *inst = to_inst(file);
 	struct v4l2_format f;
 
 	memset(&f, 0, sizeof(f));
@@ -1894,7 +1902,7 @@ static void vdec_init(struct file *file)
 	f.fmt.pix_mp.width = 1280;
 	f.fmt.pix_mp.height = 720;
 	f.fmt.pix_mp.field = V4L2_FIELD_NONE;
-	vdec_s_fmt(file, &inst->fh, &f);
+	vdec_s_fmt(file, NULL, &f);
 
 	memset(&f, 0, sizeof(f));
 	f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
@@ -1902,7 +1910,7 @@ static void vdec_init(struct file *file)
 	f.fmt.pix_mp.width = 1280;
 	f.fmt.pix_mp.height = 720;
 	f.fmt.pix_mp.field = V4L2_FIELD_NONE;
-	vdec_s_fmt(file, &inst->fh, &f);
+	vdec_s_fmt(file, NULL, &f);
 }
 
 static int vdec_open(struct file *file)
diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index c5c1f1fbaa80366d5b18b8f24699eb9c3a18ef92..77befc256879d9a0190a4300cddb6f72a11cf7cb 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -92,7 +92,8 @@ static const struct vpu_format venc_formats[] = {
 	{0, 0, 0, 0},
 };
 
-static int venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+static int venc_querycap(struct file *file, struct video_device_state *state,
+			 struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "amphion-vpu", sizeof(cap->driver));
 	strscpy(cap->card, "amphion vpu encoder", sizeof(cap->card));
@@ -101,7 +102,8 @@ static int venc_querycap(struct file *file, void *fh, struct v4l2_capability *ca
 	return 0;
 }
 
-static int venc_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int venc_enum_fmt(struct file *file, struct video_device_state *state,
+			 struct v4l2_fmtdesc *f)
 {
 	struct vpu_inst *inst = to_inst(file);
 	const struct vpu_format *fmt;
@@ -117,7 +119,9 @@ static int venc_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static int venc_enum_framesizes(struct file *file, void *fh, struct v4l2_frmsizeenum *fsize)
+static int venc_enum_framesizes(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_frmsizeenum *fsize)
 {
 	struct vpu_inst *inst = to_inst(file);
 	const struct vpu_core_resources *res;
@@ -142,7 +146,9 @@ static int venc_enum_framesizes(struct file *file, void *fh, struct v4l2_frmsize
 	return 0;
 }
 
-static int venc_enum_frameintervals(struct file *file, void *fh, struct v4l2_frmivalenum *fival)
+static int venc_enum_frameintervals(struct file *file,
+				    struct video_device_state *state,
+				    struct v4l2_frmivalenum *fival)
 {
 	struct vpu_inst *inst = to_inst(file);
 	const struct vpu_core_resources *res;
@@ -174,7 +180,8 @@ static int venc_enum_frameintervals(struct file *file, void *fh, struct v4l2_frm
 	return 0;
 }
 
-static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int venc_g_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct vpu_inst *inst = to_inst(file);
 	struct venc_t *venc = inst->priv;
@@ -203,7 +210,8 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int venc_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int venc_try_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct vpu_inst *inst = to_inst(file);
 	struct vpu_format fmt;
@@ -213,7 +221,8 @@ static int venc_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int venc_s_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct vpu_inst *inst = to_inst(file);
 	struct vpu_format fmt;
@@ -265,7 +274,8 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int venc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *parm)
+static int venc_g_parm(struct file *file, struct video_device_state *state,
+		       struct v4l2_streamparm *parm)
 {
 	struct vpu_inst *inst = to_inst(file);
 	struct venc_t *venc = inst->priv;
@@ -289,7 +299,8 @@ static int venc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *parm
 	return 0;
 }
 
-static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *parm)
+static int venc_s_parm(struct file *file, struct video_device_state *state,
+		       struct v4l2_streamparm *parm)
 {
 	struct vpu_inst *inst = to_inst(file);
 	struct venc_t *venc = inst->priv;
@@ -328,7 +339,9 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *parm
 	return 0;
 }
 
-static int venc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int venc_g_selection(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_selection *s)
 {
 	struct vpu_inst *inst = to_inst(file);
 	struct venc_t *venc = inst->priv;
@@ -382,7 +395,9 @@ static int venc_valid_crop(struct venc_t *venc, const struct vpu_core_resources
 	return 0;
 }
 
-static int venc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int venc_s_selection(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_selection *s)
 {
 	struct vpu_inst *inst = to_inst(file);
 	const struct vpu_core_resources *res;
@@ -449,12 +464,14 @@ static int venc_request_eos(struct vpu_inst *inst)
 	return 0;
 }
 
-static int venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
+static int venc_encoder_cmd(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_encoder_cmd *cmd)
 {
 	struct vpu_inst *inst = to_inst(file);
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, state, cmd);
 	if (ret)
 		return ret;
 
@@ -1288,7 +1305,7 @@ static void venc_init(struct file *file)
 	f.fmt.pix_mp.width = 1280;
 	f.fmt.pix_mp.height = 720;
 	f.fmt.pix_mp.field = V4L2_FIELD_NONE;
-	venc_s_fmt(file, &inst->fh, &f);
+	venc_s_fmt(file, NULL, &f);
 
 	memset(&f, 0, sizeof(f));
 	f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
@@ -1296,13 +1313,13 @@ static void venc_init(struct file *file)
 	f.fmt.pix_mp.width = 1280;
 	f.fmt.pix_mp.height = 720;
 	f.fmt.pix_mp.field = V4L2_FIELD_NONE;
-	venc_s_fmt(file, &inst->fh, &f);
+	venc_s_fmt(file, NULL, &f);
 
 	memset(&parm, 0, sizeof(parm));
 	parm.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	parm.parm.capture.timeperframe.numerator = 1;
 	parm.parm.capture.timeperframe.denominator = 30;
-	venc_s_parm(file, &inst->fh, &parm);
+	venc_s_parm(file, NULL, &parm);
 }
 
 static int venc_open(struct file *file)
diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index b83e43245277b4730603280e4f00b2b75b25f06b..b79d8c4aaf15ba06d1f4d5d2b0aeeb0df45c308f 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1428,7 +1428,8 @@ static void aspeed_video_stop(struct aspeed_video *video)
 	video->flags = 0;
 }
 
-static int aspeed_video_querycap(struct file *file, void *fh,
+static int aspeed_video_querycap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DEVICE_NAME, sizeof(cap->driver));
@@ -1439,7 +1440,8 @@ static int aspeed_video_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_enum_format(struct file *file, void *fh,
+static int aspeed_video_enum_format(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_fmtdesc *f)
 {
 	struct aspeed_video *video = video_drvdata(file);
@@ -1452,7 +1454,8 @@ static int aspeed_video_enum_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_get_format(struct file *file, void *fh,
+static int aspeed_video_get_format(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct aspeed_video *video = video_drvdata(file);
@@ -1462,7 +1465,8 @@ static int aspeed_video_get_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_set_format(struct file *file, void *fh,
+static int aspeed_video_set_format(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct aspeed_video *video = video_drvdata(file);
@@ -1485,7 +1489,8 @@ static int aspeed_video_set_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_enum_input(struct file *file, void *fh,
+static int aspeed_video_enum_input(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_input *inp)
 {
 	struct aspeed_video *video = video_drvdata(file);
@@ -1501,7 +1506,9 @@ static int aspeed_video_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_get_input(struct file *file, void *fh, unsigned int *i)
+static int aspeed_video_get_input(struct file *file,
+				  struct video_device_state *state,
+				  unsigned int *i)
 {
 	struct aspeed_video *video = video_drvdata(file);
 
@@ -1510,7 +1517,9 @@ static int aspeed_video_get_input(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-static int aspeed_video_set_input(struct file *file, void *fh, unsigned int i)
+static int aspeed_video_set_input(struct file *file,
+				  struct video_device_state *state,
+				  unsigned int i)
 {
 	struct aspeed_video *video = video_drvdata(file);
 
@@ -1557,7 +1566,8 @@ static int aspeed_video_set_input(struct file *file, void *fh, unsigned int i)
 	return 0;
 }
 
-static int aspeed_video_get_parm(struct file *file, void *fh,
+static int aspeed_video_get_parm(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_streamparm *a)
 {
 	struct aspeed_video *video = video_drvdata(file);
@@ -1573,7 +1583,8 @@ static int aspeed_video_get_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_set_parm(struct file *file, void *fh,
+static int aspeed_video_set_parm(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_streamparm *a)
 {
 	unsigned int frame_rate = 0;
@@ -1601,7 +1612,8 @@ static int aspeed_video_set_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_enum_framesizes(struct file *file, void *fh,
+static int aspeed_video_enum_framesizes(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_frmsizeenum *fsize)
 {
 	struct aspeed_video *video = video_drvdata(file);
@@ -1619,7 +1631,8 @@ static int aspeed_video_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_enum_frameintervals(struct file *file, void *fh,
+static int aspeed_video_enum_frameintervals(struct file *file,
+					    struct video_device_state *state,
 					    struct v4l2_frmivalenum *fival)
 {
 	struct aspeed_video *video = video_drvdata(file);
@@ -1645,7 +1658,8 @@ static int aspeed_video_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_set_dv_timings(struct file *file, void *fh,
+static int aspeed_video_set_dv_timings(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_dv_timings *timings)
 {
 	struct aspeed_video *video = video_drvdata(file);
@@ -1667,7 +1681,8 @@ static int aspeed_video_set_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_get_dv_timings(struct file *file, void *fh,
+static int aspeed_video_get_dv_timings(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_dv_timings *timings)
 {
 	struct aspeed_video *video = video_drvdata(file);
@@ -1678,7 +1693,8 @@ static int aspeed_video_get_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int aspeed_video_query_dv_timings(struct file *file, void *fh,
+static int aspeed_video_query_dv_timings(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_dv_timings *timings)
 {
 	int rc;
@@ -1706,14 +1722,16 @@ static int aspeed_video_query_dv_timings(struct file *file, void *fh,
 	return video->v4l2_input_status ? -ENOLINK : 0;
 }
 
-static int aspeed_video_enum_dv_timings(struct file *file, void *fh,
+static int aspeed_video_enum_dv_timings(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_enum_dv_timings *timings)
 {
 	return v4l2_enum_dv_timings_cap(timings, &aspeed_video_timings_cap,
 					NULL, NULL);
 }
 
-static int aspeed_video_dv_timings_cap(struct file *file, void *fh,
+static int aspeed_video_dv_timings_cap(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_dv_timings_cap *cap)
 {
 	*cap = aspeed_video_timings_cap;
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index a05a744cbb7569abff60ccf1a0825a9c3c52ed8a..7154cef73da0c23fdf3931938645cbcd135dc631 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -528,7 +528,8 @@ static const struct vb2_ops isi_video_qops = {
 	.stop_streaming		= stop_streaming,
 };
 
-static int isi_g_fmt_vid_cap(struct file *file, void *priv,
+static int isi_g_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			      struct v4l2_format *fmt)
 {
 	struct atmel_isi *isi = video_drvdata(file);
@@ -651,7 +652,8 @@ static int isi_set_fmt(struct atmel_isi *isi, struct v4l2_format *f)
 	return 0;
 }
 
-static int isi_s_fmt_vid_cap(struct file *file, void *priv,
+static int isi_s_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct atmel_isi *isi = video_drvdata(file);
@@ -662,7 +664,8 @@ static int isi_s_fmt_vid_cap(struct file *file, void *priv,
 	return isi_set_fmt(isi, f);
 }
 
-static int isi_try_fmt_vid_cap(struct file *file, void *priv,
+static int isi_try_fmt_vid_cap(struct file *file,
+			       struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct atmel_isi *isi = video_drvdata(file);
@@ -670,7 +673,8 @@ static int isi_try_fmt_vid_cap(struct file *file, void *priv,
 	return isi_try_fmt(isi, f, NULL);
 }
 
-static int isi_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int isi_enum_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	struct atmel_isi *isi = video_drvdata(file);
@@ -682,7 +686,8 @@ static int isi_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int isi_querycap(struct file *file, void *priv,
+static int isi_querycap(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "atmel-isi", sizeof(cap->driver));
@@ -691,7 +696,8 @@ static int isi_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int isi_enum_input(struct file *file, void *priv,
+static int isi_enum_input(struct file *file,
+			  struct video_device_state *state,
 			   struct v4l2_input *i)
 {
 	if (i->index != 0)
@@ -702,34 +708,39 @@ static int isi_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int isi_g_input(struct file *file, void *priv, unsigned int *i)
+static int isi_g_input(struct file *file, struct video_device_state *state,
+		       unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int isi_s_input(struct file *file, void *priv, unsigned int i)
+static int isi_s_input(struct file *file, struct video_device_state *state,
+		       unsigned int i)
 {
 	if (i > 0)
 		return -EINVAL;
 	return 0;
 }
 
-static int isi_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int isi_g_parm(struct file *file, struct video_device_state *state,
+		      struct v4l2_streamparm *a)
 {
 	struct atmel_isi *isi = video_drvdata(file);
 
 	return v4l2_g_parm_cap(video_devdata(file), isi->entity.subdev, a);
 }
 
-static int isi_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int isi_s_parm(struct file *file, struct video_device_state *state,
+		      struct v4l2_streamparm *a)
 {
 	struct atmel_isi *isi = video_drvdata(file);
 
 	return v4l2_s_parm_cap(video_devdata(file), isi->entity.subdev, a);
 }
 
-static int isi_enum_framesizes(struct file *file, void *fh,
+static int isi_enum_framesizes(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_frmsizeenum *fsize)
 {
 	struct atmel_isi *isi = video_drvdata(file);
@@ -758,7 +769,8 @@ static int isi_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int isi_enum_frameintervals(struct file *file, void *fh,
+static int isi_enum_frameintervals(struct file *file,
+				   struct video_device_state *state,
 				    struct v4l2_frmivalenum *fival)
 {
 	struct atmel_isi *isi = video_drvdata(file);
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index f10064107d543caf867249d0566a0f42d6d8c4c6..e5cccad04b010bf9533035fb787824f4f606beed 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -1831,7 +1831,8 @@ static const struct vb2_ops unicam_video_qops = {
  *  V4L2 video device operations
  */
 
-static int unicam_querycap(struct file *file, void *priv,
+static int unicam_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
@@ -1842,7 +1843,8 @@ static int unicam_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int unicam_enum_fmt_vid(struct file *file, void  *priv,
+static int unicam_enum_fmt_vid(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_fmtdesc *f)
 {
 	unsigned int index;
@@ -1873,7 +1875,8 @@ static int unicam_enum_fmt_vid(struct file *file, void  *priv,
 	return -EINVAL;
 }
 
-static int unicam_g_fmt_vid(struct file *file, void *priv,
+static int unicam_g_fmt_vid(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct unicam_node *node = video_drvdata(file);
@@ -1905,7 +1908,8 @@ static void __unicam_try_fmt_vid(struct unicam_node *node,
 		pix->field = V4L2_FIELD_NONE;
 }
 
-static int unicam_try_fmt_vid(struct file *file, void *priv,
+static int unicam_try_fmt_vid(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct unicam_node *node = video_drvdata(file);
@@ -1914,7 +1918,8 @@ static int unicam_try_fmt_vid(struct file *file, void *priv,
 	return 0;
 }
 
-static int unicam_s_fmt_vid(struct file *file, void *priv,
+static int unicam_s_fmt_vid(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct unicam_node *node = video_drvdata(file);
@@ -1928,7 +1933,8 @@ static int unicam_s_fmt_vid(struct file *file, void *priv,
 	return 0;
 }
 
-static int unicam_enum_fmt_meta(struct file *file, void *priv,
+static int unicam_enum_fmt_meta(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	unsigned int i, index;
@@ -1950,7 +1956,8 @@ static int unicam_enum_fmt_meta(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int unicam_g_fmt_meta(struct file *file, void *priv,
+static int unicam_g_fmt_meta(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct unicam_node *node = video_drvdata(file);
@@ -1981,7 +1988,8 @@ __unicam_try_fmt_meta(struct unicam_node *node, struct v4l2_meta_format *meta)
 	return fmtinfo;
 }
 
-static int unicam_try_fmt_meta(struct file *file, void *priv,
+static int unicam_try_fmt_meta(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct unicam_node *node = video_drvdata(file);
@@ -1990,7 +1998,8 @@ static int unicam_try_fmt_meta(struct file *file, void *priv,
 	return 0;
 }
 
-static int unicam_s_fmt_meta(struct file *file, void *priv,
+static int unicam_s_fmt_meta(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct unicam_node *node = video_drvdata(file);
@@ -2004,7 +2013,8 @@ static int unicam_s_fmt_meta(struct file *file, void *priv,
 	return 0;
 }
 
-static int unicam_enum_framesizes(struct file *file, void *fh,
+static int unicam_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct unicam_node *node = video_drvdata(file);
@@ -2042,7 +2052,8 @@ static int unicam_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int unicam_log_status(struct file *file, void *fh)
+static int unicam_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct unicam_node *node = video_drvdata(file);
 	struct unicam_device *unicam = node->dev;
diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 9a57b042d9fd01abd066ca780f772796030ec473..3088efbf4fde60c4ef03e91e21ce856536fd2535 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -424,7 +424,8 @@ static struct vdoa_data *coda_get_vdoa_data(void)
 /*
  * V4L2 ioctl() operations.
  */
-static int coda_querycap(struct file *file, void *priv,
+static int coda_querycap(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_capability *cap)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -442,7 +443,8 @@ static const u32 coda_formats_420[CODA_MAX_FORMATS] = {
 		V4L2_PIX_FMT_YVU420,
 };
 
-static int coda_enum_fmt(struct file *file, void *priv,
+static int coda_enum_fmt(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_fmtdesc *f)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -493,8 +495,8 @@ static int coda_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int coda_g_fmt(struct file *file, void *priv,
-		      struct v4l2_format *f)
+static int coda_g_fmt(struct file *file,
+		      struct video_device_state *state, struct v4l2_format *f)
 {
 	struct coda_q_data *q_data;
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -655,7 +657,8 @@ static int coda_try_fmt(struct coda_ctx *ctx, const struct coda_codec *codec,
 	return 0;
 }
 
-static int coda_try_fmt_vid_cap(struct file *file, void *priv,
+static int coda_try_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -761,7 +764,8 @@ static void coda_set_default_colorspace(struct v4l2_pix_format *fmt)
 	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
 }
 
-static int coda_try_fmt_vid_out(struct file *file, void *priv,
+static int coda_try_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -855,7 +859,8 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 	return 0;
 }
 
-static int coda_s_fmt_vid_cap(struct file *file, void *priv,
+static int coda_s_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -874,7 +879,7 @@ static int coda_s_fmt_vid_cap(struct file *file, void *priv,
 		vscale = coda_jpeg_scale(q_data_src->height, f->fmt.pix.height);
 	}
 
-	ret = coda_try_fmt_vid_cap(file, priv, f);
+	ret = coda_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -907,7 +912,8 @@ static int coda_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int coda_s_fmt_vid_out(struct file *file, void *priv,
+static int coda_s_fmt_vid_out(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -916,7 +922,7 @@ static int coda_s_fmt_vid_out(struct file *file, void *priv,
 	struct vb2_queue *dst_vq;
 	int ret;
 
-	ret = coda_try_fmt_vid_out(file, priv, f);
+	ret = coda_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
@@ -956,14 +962,15 @@ static int coda_s_fmt_vid_out(struct file *file, void *priv,
 
 	memset(&f_cap, 0, sizeof(f_cap));
 	f_cap.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	coda_g_fmt(file, priv, &f_cap);
+	coda_g_fmt(file, state, &f_cap);
 	f_cap.fmt.pix.width = f->fmt.pix.width;
 	f_cap.fmt.pix.height = f->fmt.pix.height;
 
-	return coda_s_fmt_vid_cap(file, priv, &f_cap);
+	return coda_s_fmt_vid_cap(file, state, &f_cap);
 }
 
-static int coda_reqbufs(struct file *file, void *priv,
+static int coda_reqbufs(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_requestbuffers *rb)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -983,7 +990,8 @@ static int coda_reqbufs(struct file *file, void *priv,
 	return 0;
 }
 
-static int coda_qbuf(struct file *file, void *priv,
+static int coda_qbuf(struct file *file,
+		     struct video_device_state *state,
 		     struct v4l2_buffer *buf)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -995,7 +1003,8 @@ static int coda_qbuf(struct file *file, void *priv,
 	return v4l2_m2m_qbuf(file, ctx->fh.m2m_ctx, buf);
 }
 
-static int coda_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+static int coda_dqbuf(struct file *file, struct video_device_state *state,
+		      struct v4l2_buffer *buf)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
 	int ret;
@@ -1022,7 +1031,8 @@ void coda_m2m_buf_done(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 	v4l2_m2m_buf_done(buf, state);
 }
 
-static int coda_g_selection(struct file *file, void *fh,
+static int coda_g_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *s)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -1068,7 +1078,8 @@ static int coda_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int coda_s_selection(struct file *file, void *fh,
+static int coda_s_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *s)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -1105,7 +1116,7 @@ static int coda_s_selection(struct file *file, void *fh,
 		fallthrough;
 	case V4L2_SEL_TGT_NATIVE_SIZE:
 	case V4L2_SEL_TGT_COMPOSE:
-		return coda_g_selection(file, fh, s);
+		return coda_g_selection(file, state, s);
 	default:
 		/* v4l2-compliance expects this to fail for read-only targets */
 		return -EINVAL;
@@ -1123,14 +1134,15 @@ static void coda_wake_up_capture_queue(struct coda_ctx *ctx)
 	wake_up(&dst_vq->done_wq);
 }
 
-static int coda_encoder_cmd(struct file *file, void *fh,
+static int coda_encoder_cmd(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_encoder_cmd *ec)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, state, ec);
 	if (ret < 0)
 		return ret;
 
@@ -1204,7 +1216,8 @@ static bool coda_mark_last_dst_buf(struct coda_ctx *ctx)
 	return true;
 }
 
-static int coda_decoder_cmd(struct file *file, void *fh,
+static int coda_decoder_cmd(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_decoder_cmd *dc)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -1215,7 +1228,7 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 	bool wakeup;
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, state, dc);
 	if (ret < 0)
 		return ret;
 
@@ -1283,7 +1296,8 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 	return 0;
 }
 
-static int coda_enum_framesizes(struct file *file, void *fh,
+static int coda_enum_framesizes(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_frmsizeenum *fsize)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -1316,7 +1330,8 @@ static int coda_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int coda_enum_frameintervals(struct file *file, void *fh,
+static int coda_enum_frameintervals(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_frmivalenum *f)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
@@ -1356,7 +1371,8 @@ static int coda_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
-static int coda_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int coda_g_parm(struct file *file, struct video_device_state *state,
+		       struct v4l2_streamparm *a)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *tpf;
@@ -1439,7 +1455,8 @@ static uint32_t coda_timeperframe_to_frate(struct v4l2_fract *timeperframe)
 		timeperframe->denominator;
 }
 
-static int coda_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int coda_s_parm(struct file *file, struct video_device_state *state,
+		       struct v4l2_streamparm *a)
 {
 	struct coda_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *tpf;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index f03ad9c0de2215794b2456c39652785fff236966..9916b2277926a1a815d5dbf7d6459e98212904c2 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -140,7 +140,7 @@ int wave5_vpu_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscr
 	}
 }
 
-int wave5_vpu_g_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+int wave5_vpu_g_fmt_out(struct file *file, struct video_device_state *state, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 976a402e426ff329490717925a08a76d777cbe3e..0bb27137781adcc8987c54196d16883b812cdf5e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -21,7 +21,8 @@ int wave5_vpu_release_device(struct file *filp,
 int wave5_vpu_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq,
 			 const struct vb2_ops *ops);
 int wave5_vpu_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub);
-int wave5_vpu_g_fmt_out(struct file *file, void *fh, struct v4l2_format *f);
+int wave5_vpu_g_fmt_out(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f);
 const struct vpu_format *wave5_find_vpu_fmt(unsigned int v4l2_pix_fmt,
 					    const struct vpu_format fmt_list[MAX_FMTS]);
 const struct vpu_format *wave5_find_vpu_fmt_by_idx(unsigned int idx,
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 72af0faa3ef2e6fb83749044eb91a58f39a3a986..7f0a8c0e13701b89963b856e6d3e33442e0e7938 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -457,7 +457,9 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	}
 }
 
-static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+static int wave5_vpu_dec_querycap(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, VPU_DEC_DRV_NAME, sizeof(cap->driver));
 	strscpy(cap->card, VPU_DEC_DRV_NAME, sizeof(cap->card));
@@ -465,7 +467,9 @@ static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capab
 	return 0;
 }
 
-static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_frmsizeenum *fsize)
+static int wave5_vpu_dec_enum_framesizes(struct file *f,
+					 struct video_device_state *state,
+					 struct v4l2_frmsizeenum *fsize)
 {
 	const struct vpu_format *vpu_fmt;
 
@@ -490,7 +494,9 @@ static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 	return 0;
 }
 
-static int wave5_vpu_dec_enum_fmt_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int wave5_vpu_dec_enum_fmt_cap(struct file *file,
+				      struct video_device_state *state,
+				      struct v4l2_fmtdesc *f)
 {
 	const struct vpu_format *vpu_fmt;
 
@@ -504,7 +510,9 @@ static int wave5_vpu_dec_enum_fmt_cap(struct file *file, void *fh, struct v4l2_f
 	return 0;
 }
 
-static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int wave5_vpu_dec_try_fmt_cap(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
@@ -545,7 +553,9 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 	return 0;
 }
 
-static int wave5_vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int wave5_vpu_dec_s_fmt_cap(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i, ret;
@@ -555,7 +565,7 @@ static int wave5_vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l2_form
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
 		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.colorspace, f->fmt.pix_mp.field);
 
-	ret = wave5_vpu_dec_try_fmt_cap(file, fh, f);
+	ret = wave5_vpu_dec_try_fmt_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -604,7 +614,9 @@ static int wave5_vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l2_form
 	return 0;
 }
 
-static int wave5_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int wave5_vpu_dec_g_fmt_cap(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i;
@@ -628,7 +640,9 @@ static int wave5_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l2_form
 	return 0;
 }
 
-static int wave5_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int wave5_vpu_dec_enum_fmt_out(struct file *file,
+				      struct video_device_state *state,
+				      struct v4l2_fmtdesc *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
@@ -645,7 +659,9 @@ static int wave5_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 	return 0;
 }
 
-static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+static int wave5_vpu_dec_try_fmt_out(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct v4l2_frmsize_stepwise *frmsize;
@@ -676,7 +692,9 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 	return 0;
 }
 
-static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+static int wave5_vpu_dec_s_fmt_out(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
@@ -687,7 +705,7 @@ static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
 		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
 
-	ret = wave5_vpu_dec_try_fmt_out(file, fh, f);
+	ret = wave5_vpu_dec_try_fmt_out(file, state, f);
 	if (ret)
 		return ret;
 
@@ -725,7 +743,9 @@ static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	return 0;
 }
 
-static int wave5_vpu_dec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int wave5_vpu_dec_g_selection(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_selection *s)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 
@@ -759,7 +779,9 @@ static int wave5_vpu_dec_g_selection(struct file *file, void *fh, struct v4l2_se
 	return 0;
 }
 
-static int wave5_vpu_dec_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int wave5_vpu_dec_s_selection(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_selection *s)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 
@@ -870,7 +892,9 @@ static int wave5_vpu_dec_start(struct vpu_instance *inst)
 	return ret;
 }
 
-static int wave5_vpu_dec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dc)
+static int wave5_vpu_dec_decoder_cmd(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_decoder_cmd *dc)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -878,7 +902,7 @@ static int wave5_vpu_dec_decoder_cmd(struct file *file, void *fh, struct v4l2_de
 
 	dev_dbg(inst->dev->dev, "decoder command: %u\n", dc->cmd);
 
-	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, state, dc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 506d6c6166a6b0fd9151218cf2c308acef436304..3d7c0dd1b1c34c94ff2263ae0e4115d2eeb82b48 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -330,7 +330,9 @@ static void wave5_vpu_enc_finish_encode(struct vpu_instance *inst)
 	}
 }
 
-static int wave5_vpu_enc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+static int wave5_vpu_enc_querycap(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, VPU_ENC_DRV_NAME, sizeof(cap->driver));
 	strscpy(cap->card, VPU_ENC_DRV_NAME, sizeof(cap->card));
@@ -338,7 +340,9 @@ static int wave5_vpu_enc_querycap(struct file *file, void *fh, struct v4l2_capab
 	return 0;
 }
 
-static int wave5_vpu_enc_enum_framesizes(struct file *f, void *fh, struct v4l2_frmsizeenum *fsize)
+static int wave5_vpu_enc_enum_framesizes(struct file *f,
+					 struct video_device_state *state,
+					 struct v4l2_frmsizeenum *fsize)
 {
 	const struct vpu_format *vpu_fmt;
 
@@ -358,7 +362,9 @@ static int wave5_vpu_enc_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 	return 0;
 }
 
-static int wave5_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int wave5_vpu_enc_enum_fmt_cap(struct file *file,
+				      struct video_device_state *state,
+				      struct v4l2_fmtdesc *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
@@ -375,7 +381,9 @@ static int wave5_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_f
 	return 0;
 }
 
-static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int wave5_vpu_enc_try_fmt_cap(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct v4l2_frmsize_stepwise *frmsize;
@@ -409,7 +417,9 @@ static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 	return 0;
 }
 
-static int wave5_vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int wave5_vpu_enc_s_fmt_cap(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i, ret;
@@ -418,7 +428,7 @@ static int wave5_vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l2_form
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
 		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
 
-	ret = wave5_vpu_enc_try_fmt_cap(file, fh, f);
+	ret = wave5_vpu_enc_try_fmt_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -443,7 +453,9 @@ static int wave5_vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l2_form
 	return 0;
 }
 
-static int wave5_vpu_enc_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int wave5_vpu_enc_g_fmt_cap(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	int i;
@@ -467,7 +479,9 @@ static int wave5_vpu_enc_g_fmt_cap(struct file *file, void *fh, struct v4l2_form
 	return 0;
 }
 
-static int wave5_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int wave5_vpu_enc_enum_fmt_out(struct file *file,
+				      struct video_device_state *state,
+				      struct v4l2_fmtdesc *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
@@ -484,7 +498,9 @@ static int wave5_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 	return 0;
 }
 
-static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+static int wave5_vpu_enc_try_fmt_out(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct v4l2_frmsize_stepwise *frmsize;
@@ -513,7 +529,9 @@ static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 	return 0;
 }
 
-static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+static int wave5_vpu_enc_s_fmt_out(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_format *f)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	const struct vpu_format *vpu_fmt;
@@ -524,7 +542,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
 		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
 
-	ret = wave5_vpu_enc_try_fmt_out(file, fh, f);
+	ret = wave5_vpu_enc_try_fmt_out(file, state, f);
 	if (ret)
 		return ret;
 
@@ -574,7 +592,9 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	return 0;
 }
 
-static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int wave5_vpu_enc_g_selection(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_selection *s)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 
@@ -603,7 +623,9 @@ static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_se
 	return 0;
 }
 
-static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int wave5_vpu_enc_s_selection(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_selection *s)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 
@@ -626,13 +648,15 @@ static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_se
 	return 0;
 }
 
-static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *ec)
+static int wave5_vpu_enc_encoder_cmd(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_encoder_cmd *ec)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, state, ec);
 	if (ret)
 		return ret;
 
@@ -659,7 +683,9 @@ static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_en
 	return 0;
 }
 
-static int wave5_vpu_enc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int wave5_vpu_enc_g_parm(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_streamparm *a)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 
@@ -679,7 +705,9 @@ static int wave5_vpu_enc_g_parm(struct file *file, void *fh, struct v4l2_streamp
 	return 0;
 }
 
-static int wave5_vpu_enc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int wave5_vpu_enc_s_parm(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_streamparm *a)
 {
 	struct vpu_instance *inst = file_to_vpu_inst(file);
 
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index c4e0097cb8b7fa310c2c5519d7af4e6e3b378915..840debba40334e7946a171568f6f2bbfcf448b80 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -228,7 +228,8 @@ static int e5010_set_input_subsampling(void __iomem *core_base, int subsampling)
 	};
 }
 
-static int e5010_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+static int e5010_querycap(struct file *file, struct video_device_state *state,
+			  struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, E5010_MODULE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, E5010_MODULE_NAME, sizeof(cap->card));
@@ -249,7 +250,8 @@ static struct e5010_fmt *find_format(struct v4l2_format *f)
 	return NULL;
 }
 
-static int e5010_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+static int e5010_enum_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_fmtdesc *f)
 {
 	int i, index = 0;
 	struct e5010_fmt *fmt = NULL;
@@ -277,7 +279,8 @@ static int e5010_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static int e5010_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int e5010_g_fmt(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f)
 {
 	struct e5010_context *ctx = to_e5010_context(file);
 	struct e5010_q_data *queue;
@@ -378,14 +381,16 @@ static int e5010_jpeg_try_fmt(struct v4l2_format *f, struct e5010_context *ctx)
 	return 0;
 }
 
-static int e5010_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int e5010_try_fmt(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f)
 {
 	struct e5010_context *ctx = to_e5010_context(file);
 
 	return e5010_jpeg_try_fmt(f, ctx);
 }
 
-static int e5010_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int e5010_s_fmt(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f)
 {
 	struct e5010_context *ctx = to_e5010_context(file);
 	struct vb2_queue *vq;
@@ -434,7 +439,9 @@ static int e5010_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int e5010_enum_framesizes(struct file *file, void *priv, struct v4l2_frmsizeenum *fsize)
+static int e5010_enum_framesizes(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_frmsizeenum *fsize)
 {
 	struct v4l2_format f;
 	struct e5010_fmt *fmt;
@@ -460,7 +467,9 @@ static int e5010_enum_framesizes(struct file *file, void *priv, struct v4l2_frms
 	return 0;
 }
 
-static int e5010_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int e5010_g_selection(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_selection *s)
 {
 	struct e5010_context *ctx = to_e5010_context(file);
 	struct e5010_q_data *queue;
@@ -488,7 +497,9 @@ static int e5010_g_selection(struct file *file, void *fh, struct v4l2_selection
 	return 0;
 }
 
-static int e5010_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int e5010_s_selection(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_selection *s)
 {
 	struct e5010_context *ctx = to_e5010_context(file);
 	struct e5010_q_data *queue;
@@ -1258,7 +1269,8 @@ static void e5010_buf_queue(struct vb2_buffer *vb)
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
 }
 
-static int e5010_encoder_cmd(struct file *file, void *priv,
+static int e5010_encoder_cmd(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_encoder_cmd *cmd)
 {
 	struct e5010_context *ctx = to_e5010_context(file);
@@ -1267,7 +1279,7 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
 
 	cap_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 
-	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, &ctx->fh, cmd);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, state, cmd);
 	if (ret < 0)
 		return ret;
 
@@ -1275,7 +1287,7 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
 	    !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)))
 		return 0;
 
-	ret = v4l2_m2m_ioctl_encoder_cmd(file, &ctx->fh, cmd);
+	ret = v4l2_m2m_ioctl_encoder_cmd(file, state, cmd);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index bef1e7137f23f02ef0005058c59fb712ba467cea..aa397eccd31a732da54330bb761f1af219f75ed1 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -1724,7 +1724,8 @@ static int pxa_camera_check_frame(u32 width, u32 height)
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int pxac_vidioc_g_register(struct file *file, void *priv,
+static int pxac_vidioc_g_register(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_dbg_register *reg)
 {
 	struct pxa_camera_dev *pcdev = video_drvdata(file);
@@ -1737,7 +1738,8 @@ static int pxac_vidioc_g_register(struct file *file, void *priv,
 	return 0;
 }
 
-static int pxac_vidioc_s_register(struct file *file, void *priv,
+static int pxac_vidioc_s_register(struct file *file,
+				  struct video_device_state *state,
 				  const struct v4l2_dbg_register *reg)
 {
 	struct pxa_camera_dev *pcdev = video_drvdata(file);
@@ -1751,7 +1753,8 @@ static int pxac_vidioc_s_register(struct file *file, void *priv,
 }
 #endif
 
-static int pxac_vidioc_enum_fmt_vid_cap(struct file *filp, void  *priv,
+static int pxac_vidioc_enum_fmt_vid_cap(struct file *filp,
+					struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	struct pxa_camera_dev *pcdev = video_drvdata(filp);
@@ -1767,7 +1770,8 @@ static int pxac_vidioc_enum_fmt_vid_cap(struct file *filp, void  *priv,
 	return 0;
 }
 
-static int pxac_vidioc_g_fmt_vid_cap(struct file *filp, void *priv,
+static int pxac_vidioc_g_fmt_vid_cap(struct file *filp,
+				     struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct pxa_camera_dev *pcdev = video_drvdata(filp);
@@ -1785,7 +1789,8 @@ static int pxac_vidioc_g_fmt_vid_cap(struct file *filp, void *priv,
 	return 0;
 }
 
-static int pxac_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
+static int pxac_vidioc_try_fmt_vid_cap(struct file *filp,
+				       struct video_device_state *state,
 				      struct v4l2_format *f)
 {
 	struct pxa_camera_dev *pcdev = video_drvdata(filp);
@@ -1852,7 +1857,8 @@ static int pxac_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
 	return 0;
 }
 
-static int pxac_vidioc_s_fmt_vid_cap(struct file *filp, void *priv,
+static int pxac_vidioc_s_fmt_vid_cap(struct file *filp,
+				     struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct pxa_camera_dev *pcdev = video_drvdata(filp);
@@ -1875,7 +1881,7 @@ static int pxac_vidioc_s_fmt_vid_cap(struct file *filp, void *priv,
 	if (is_busy)
 		return -EBUSY;
 
-	ret = pxac_vidioc_try_fmt_vid_cap(filp, priv, f);
+	ret = pxac_vidioc_try_fmt_vid_cap(filp, state, f);
 	if (ret)
 		return ret;
 
@@ -1901,7 +1907,8 @@ static int pxac_vidioc_s_fmt_vid_cap(struct file *filp, void *priv,
 	return ret;
 }
 
-static int pxac_vidioc_querycap(struct file *file, void *priv,
+static int pxac_vidioc_querycap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	strscpy(cap->bus_info, "platform:pxa-camera", sizeof(cap->bus_info));
@@ -1910,7 +1917,8 @@ static int pxac_vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int pxac_vidioc_enum_input(struct file *file, void *priv,
+static int pxac_vidioc_enum_input(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_input *i)
 {
 	if (i->index > 0)
@@ -1922,14 +1930,18 @@ static int pxac_vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int pxac_vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int pxac_vidioc_g_input(struct file *file,
+			       struct video_device_state *state,
+			       unsigned int *i)
 {
 	*i = 0;
 
 	return 0;
 }
 
-static int pxac_vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int pxac_vidioc_s_input(struct file *file,
+			       struct video_device_state *state,
+			       unsigned int i)
 {
 	if (i > 0)
 		return -EINVAL;
diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index e07e57d4206baa5e7a467298cb240c3a2cd57cd8..b17d153e0440af996d490bd5468e68a019df9e30 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -433,7 +433,8 @@ static void deinterlace_device_run(void *priv)
 /*
  * video ioctls
  */
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
@@ -471,13 +472,15 @@ static int enum_fmt(struct v4l2_fmtdesc *f, u32 type)
 	return -EINVAL;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return enum_fmt(f, MEM2MEM_CAPTURE);
 }
 
-static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return enum_fmt(f, MEM2MEM_OUTPUT);
@@ -514,13 +517,15 @@ static int vidioc_g_fmt(struct deinterlace_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	return vidioc_g_fmt(file_to_ctx(file), f);
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	return vidioc_g_fmt(file_to_ctx(file), f);
@@ -541,7 +546,8 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct deinterlace_fmt *fmt)
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct deinterlace_ctx *ctx = file_to_ctx(file);
@@ -561,7 +567,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return vidioc_try_fmt(f, fmt);
 }
 
-static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_out(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct deinterlace_fmt *fmt;
@@ -630,24 +637,26 @@ static int vidioc_s_fmt(struct deinterlace_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	int ret;
 
-	ret = vidioc_try_fmt_vid_cap(file, priv, f);
+	ret = vidioc_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 	return vidioc_s_fmt(file_to_ctx(file), f);
 }
 
-static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct deinterlace_ctx *ctx = file_to_ctx(file);
 	int ret;
 
-	ret = vidioc_try_fmt_vid_out(file, priv, f);
+	ret = vidioc_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
@@ -658,7 +667,8 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 	return ret;
 }
 
-static int vidioc_streamon(struct file *file, void *priv,
+static int vidioc_streamon(struct file *file,
+			   struct video_device_state *state,
 			   enum v4l2_buf_type type)
 {
 	struct deinterlace_ctx *ctx = file_to_ctx(file);
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index b8360d37000a7d0714d28dc8c3cff0de67503fd3..927187c616364b34dc30455af1fcbe3f19f9965e 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -1323,8 +1323,8 @@ static int mcam_setup_vb2(struct mcam_camera *cam)
  * The long list of V4L2 ioctl() operations.
  */
 
-static int mcam_vidioc_querycap(struct file *file, void *priv,
-		struct v4l2_capability *cap)
+static int mcam_vidioc_querycap(struct file *file,
+				struct video_device_state *state, struct v4l2_capability *cap)
 {
 	struct mcam_camera *cam = video_drvdata(file);
 
@@ -1336,7 +1336,7 @@ static int mcam_vidioc_querycap(struct file *file, void *priv,
 
 
 static int mcam_vidioc_enum_fmt_vid_cap(struct file *filp,
-		void *priv, struct v4l2_fmtdesc *fmt)
+		struct video_device_state *state, struct v4l2_fmtdesc *fmt)
 {
 	if (fmt->index >= N_MCAM_FMTS)
 		return -EINVAL;
@@ -1344,8 +1344,8 @@ static int mcam_vidioc_enum_fmt_vid_cap(struct file *filp,
 	return 0;
 }
 
-static int mcam_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
-		struct v4l2_format *fmt)
+static int mcam_vidioc_try_fmt_vid_cap(struct file *filp,
+				       struct video_device_state *state, struct v4l2_format *fmt)
 {
 	struct mcam_camera *cam = video_drvdata(filp);
 	struct mcam_format_struct *f;
@@ -1378,8 +1378,8 @@ static int mcam_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
 	return ret;
 }
 
-static int mcam_vidioc_s_fmt_vid_cap(struct file *filp, void *priv,
-		struct v4l2_format *fmt)
+static int mcam_vidioc_s_fmt_vid_cap(struct file *filp,
+				     struct video_device_state *state, struct v4l2_format *fmt)
 {
 	struct mcam_camera *cam = video_drvdata(filp);
 	struct mcam_format_struct *f;
@@ -1397,7 +1397,7 @@ static int mcam_vidioc_s_fmt_vid_cap(struct file *filp, void *priv,
 	/*
 	 * See if the formatting works in principle.
 	 */
-	ret = mcam_vidioc_try_fmt_vid_cap(filp, priv, fmt);
+	ret = mcam_vidioc_try_fmt_vid_cap(filp, state, fmt);
 	if (ret)
 		return ret;
 	/*
@@ -1425,8 +1425,8 @@ static int mcam_vidioc_s_fmt_vid_cap(struct file *filp, void *priv,
  * The V4l2 spec wants us to be smarter, and actually get this from
  * the camera (and not mess with it at open time).  Someday.
  */
-static int mcam_vidioc_g_fmt_vid_cap(struct file *filp, void *priv,
-		struct v4l2_format *f)
+static int mcam_vidioc_g_fmt_vid_cap(struct file *filp,
+				     struct video_device_state *state, struct v4l2_format *f)
 {
 	struct mcam_camera *cam = video_drvdata(filp);
 
@@ -1437,8 +1437,8 @@ static int mcam_vidioc_g_fmt_vid_cap(struct file *filp, void *priv,
 /*
  * We only have one input - the sensor - so minimize the nonsense here.
  */
-static int mcam_vidioc_enum_input(struct file *filp, void *priv,
-		struct v4l2_input *input)
+static int mcam_vidioc_enum_input(struct file *filp,
+				  struct video_device_state *state, struct v4l2_input *input)
 {
 	if (input->index != 0)
 		return -EINVAL;
@@ -1448,13 +1448,17 @@ static int mcam_vidioc_enum_input(struct file *filp, void *priv,
 	return 0;
 }
 
-static int mcam_vidioc_g_input(struct file *filp, void *priv, unsigned int *i)
+static int mcam_vidioc_g_input(struct file *filp,
+			       struct video_device_state *state,
+			       unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int mcam_vidioc_s_input(struct file *filp, void *priv, unsigned int i)
+static int mcam_vidioc_s_input(struct file *filp,
+			       struct video_device_state *state,
+			       unsigned int i)
 {
 	if (i != 0)
 		return -EINVAL;
@@ -1465,8 +1469,8 @@ static int mcam_vidioc_s_input(struct file *filp, void *priv, unsigned int i)
  * G/S_PARM.  Most of this is done by the sensor, but we are
  * the level which controls the number of read buffers.
  */
-static int mcam_vidioc_g_parm(struct file *filp, void *priv,
-		struct v4l2_streamparm *a)
+static int mcam_vidioc_g_parm(struct file *filp,
+			      struct video_device_state *state, struct v4l2_streamparm *a)
 {
 	struct mcam_camera *cam = video_drvdata(filp);
 	int ret;
@@ -1476,8 +1480,8 @@ static int mcam_vidioc_g_parm(struct file *filp, void *priv,
 	return ret;
 }
 
-static int mcam_vidioc_s_parm(struct file *filp, void *priv,
-		struct v4l2_streamparm *a)
+static int mcam_vidioc_s_parm(struct file *filp,
+			      struct video_device_state *state, struct v4l2_streamparm *a)
 {
 	struct mcam_camera *cam = video_drvdata(filp);
 	int ret;
@@ -1487,7 +1491,8 @@ static int mcam_vidioc_s_parm(struct file *filp, void *priv,
 	return ret;
 }
 
-static int mcam_vidioc_enum_framesizes(struct file *filp, void *priv,
+static int mcam_vidioc_enum_framesizes(struct file *filp,
+				       struct video_device_state *state,
 		struct v4l2_frmsizeenum *sizes)
 {
 	struct mcam_camera *cam = video_drvdata(filp);
@@ -1522,7 +1527,8 @@ static int mcam_vidioc_enum_framesizes(struct file *filp, void *priv,
 	return 0;
 }
 
-static int mcam_vidioc_enum_frameintervals(struct file *filp, void *priv,
+static int mcam_vidioc_enum_frameintervals(struct file *filp,
+					   struct video_device_state *state,
 		struct v4l2_frmivalenum *interval)
 {
 	struct mcam_camera *cam = video_drvdata(filp);
@@ -1548,7 +1554,8 @@ static int mcam_vidioc_enum_frameintervals(struct file *filp, void *priv,
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int mcam_vidioc_g_register(struct file *file, void *priv,
+static int mcam_vidioc_g_register(struct file *file,
+				  struct video_device_state *state,
 		struct v4l2_dbg_register *reg)
 {
 	struct mcam_camera *cam = video_drvdata(file);
@@ -1560,7 +1567,8 @@ static int mcam_vidioc_g_register(struct file *file, void *priv,
 	return 0;
 }
 
-static int mcam_vidioc_s_register(struct file *file, void *priv,
+static int mcam_vidioc_s_register(struct file *file,
+				  struct video_device_state *state,
 		const struct v4l2_dbg_register *reg)
 {
 	struct mcam_camera *cam = video_drvdata(file);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 6268d651bdcfd212b58bf686c55660d64b659dfe..a1c10b334535ebb02f20e4709c96dd4a22fc2eaa 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -130,7 +130,8 @@ static inline struct mtk_jpeg_src_buf *mtk_jpeg_vb2_to_srcbuf(
 	return container_of(to_vb2_v4l2_buffer(vb), struct mtk_jpeg_src_buf, b);
 }
 
-static int mtk_jpeg_querycap(struct file *file, void *priv,
+static int mtk_jpeg_querycap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_capability *cap)
 {
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
@@ -209,7 +210,8 @@ static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
 	return 0;
 }
 
-static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
+static int mtk_jpeg_enum_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_fmtdesc *f)
 {
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
@@ -220,7 +222,8 @@ static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				 MTK_JPEG_FMT_FLAG_CAPTURE);
 }
 
-static int mtk_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
+static int mtk_jpeg_enum_fmt_vid_out(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_fmtdesc *f)
 {
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
@@ -299,7 +302,8 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 	return 0;
 }
 
-static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
+static int mtk_jpeg_g_fmt_vid_mplane(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct vb2_queue *vq;
@@ -348,7 +352,8 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 	return 0;
 }
 
-static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
+static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file,
+					   struct video_device_state *state,
 					   struct v4l2_format *f)
 {
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
@@ -370,14 +375,15 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 		 (fmt->fourcc >> 24 & 0xff));
 
 	if (ctx->state != MTK_JPEG_INIT) {
-		mtk_jpeg_g_fmt_vid_mplane(file, priv, f);
+		mtk_jpeg_g_fmt_vid_mplane(file, state, f);
 		return 0;
 	}
 
 	return mtk_jpeg_try_fmt_mplane(&f->fmt.pix_mp, fmt);
 }
 
-static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
+static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file,
+					   struct video_device_state *state,
 					   struct v4l2_format *f)
 {
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
@@ -399,7 +405,7 @@ static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		 (fmt->fourcc >> 24 & 0xff));
 
 	if (ctx->state != MTK_JPEG_INIT) {
-		mtk_jpeg_g_fmt_vid_mplane(file, priv, f);
+		mtk_jpeg_g_fmt_vid_mplane(file, state, f);
 		return 0;
 	}
 
@@ -461,12 +467,13 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 	return 0;
 }
 
-static int mtk_jpeg_s_fmt_vid_out_mplane(struct file *file, void *priv,
+static int mtk_jpeg_s_fmt_vid_out_mplane(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_format *f)
 {
 	int ret;
 
-	ret = mtk_jpeg_try_fmt_vid_out_mplane(file, priv, f);
+	ret = mtk_jpeg_try_fmt_vid_out_mplane(file, state, f);
 	if (ret)
 		return ret;
 
@@ -474,12 +481,13 @@ static int mtk_jpeg_s_fmt_vid_out_mplane(struct file *file, void *priv,
 				     MTK_JPEG_FMT_FLAG_OUTPUT);
 }
 
-static int mtk_jpeg_s_fmt_vid_cap_mplane(struct file *file, void *priv,
+static int mtk_jpeg_s_fmt_vid_cap_mplane(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_format *f)
 {
 	int ret;
 
-	ret = mtk_jpeg_try_fmt_vid_cap_mplane(file, priv, f);
+	ret = mtk_jpeg_try_fmt_vid_cap_mplane(file, state, f);
 	if (ret)
 		return ret;
 
@@ -509,7 +517,8 @@ static int mtk_jpeg_subscribe_event(struct v4l2_fh *fh,
 	return v4l2_ctrl_subscribe_event(fh, sub);
 }
 
-static int mtk_jpeg_enc_g_selection(struct file *file, void *priv,
+static int mtk_jpeg_enc_g_selection(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_selection *s)
 {
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
@@ -534,7 +543,8 @@ static int mtk_jpeg_enc_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
+static int mtk_jpeg_dec_g_selection(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_selection *s)
 {
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
@@ -563,7 +573,8 @@ static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
+static int mtk_jpeg_enc_s_selection(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_selection *s)
 {
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
@@ -586,7 +597,8 @@ static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+static int mtk_jpeg_qbuf(struct file *file, struct video_device_state *state,
+			 struct v4l2_buffer *buf)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index 03c07948dfdd07c6395c391ccad1788b08b1a867..3ca20364730e131fad4f4db54cea70a2ee2006c5 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -586,7 +586,8 @@ static const struct vb2_ops mtk_mdp_m2m_qops = {
 	.start_streaming = mtk_mdp_m2m_start_streaming,
 };
 
-static int mtk_mdp_m2m_querycap(struct file *file, void *fh,
+static int mtk_mdp_m2m_querycap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
@@ -612,19 +613,22 @@ static int mtk_mdp_enum_fmt(struct v4l2_fmtdesc *f, u32 type)
 	return 0;
 }
 
-static int mtk_mdp_m2m_enum_fmt_vid_cap(struct file *file, void *priv,
+static int mtk_mdp_m2m_enum_fmt_vid_cap(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	return mtk_mdp_enum_fmt(f, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 }
 
-static int mtk_mdp_m2m_enum_fmt_vid_out(struct file *file, void *priv,
+static int mtk_mdp_m2m_enum_fmt_vid_out(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	return mtk_mdp_enum_fmt(f, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 }
 
-static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
+static int mtk_mdp_m2m_g_fmt_mplane(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
@@ -663,7 +667,8 @@ static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int mtk_mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
+static int mtk_mdp_m2m_try_fmt_mplane(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_format *f)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
@@ -673,7 +678,8 @@ static int mtk_mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
+static int mtk_mdp_m2m_s_fmt_mplane(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
@@ -719,7 +725,8 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
+static int mtk_mdp_m2m_reqbufs(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_requestbuffers *reqbufs)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
@@ -727,7 +734,8 @@ static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
 }
 
-static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
+static int mtk_mdp_m2m_streamon(struct file *file,
+				struct video_device_state *state,
 				enum v4l2_buf_type type)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
@@ -765,7 +773,8 @@ static inline bool mtk_mdp_is_target_crop(u32 target)
 	return false;
 }
 
-static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
+static int mtk_mdp_m2m_g_selection(struct file *file,
+				   struct video_device_state *state,
 				       struct v4l2_selection *s)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
@@ -832,7 +841,8 @@ static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
 	return 0;
 }
 
-static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
+static int mtk_mdp_m2m_s_selection(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_selection *s)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
@@ -1111,9 +1121,9 @@ static int mtk_mdp_m2m_open(struct file *file)
 	default_format.fmt.pix_mp.width = 32;
 	default_format.fmt.pix_mp.height = 32;
 	default_format.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420M;
-	mtk_mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
+	mtk_mdp_m2m_s_fmt_mplane(file, ctx->fh.state, &default_format);
 	default_format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	mtk_mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
+	mtk_mdp_m2m_s_fmt_mplane(file, ctx->fh.state, &default_format);
 
 	mtk_mdp_dbg(0, "%s [%d]", dev_name(&mdp->pdev->dev), ctx->id);
 
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 9ef956b565a791429a477dc96567453cb189d817..ce3806b382e34ac370099a35b30ace72f435866b 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -273,7 +273,8 @@ static const struct vb2_ops mdp_m2m_qops = {
 	.buf_out_validate = mdp_m2m_buf_out_validate,
 };
 
-static int mdp_m2m_querycap(struct file *file, void *fh,
+static int mdp_m2m_querycap(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, MDP_MODULE_NAME, sizeof(cap->driver));
@@ -282,7 +283,8 @@ static int mdp_m2m_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int mdp_m2m_enum_fmt_mplane(struct file *file, void *fh,
+static int mdp_m2m_enum_fmt_mplane(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
@@ -290,7 +292,8 @@ static int mdp_m2m_enum_fmt_mplane(struct file *file, void *fh,
 	return mdp_enum_fmt_mplane(ctx->mdp_dev, f);
 }
 
-static int mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
+static int mdp_m2m_g_fmt_mplane(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
@@ -308,7 +311,8 @@ static int mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
+static int mdp_m2m_s_fmt_mplane(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
@@ -351,7 +355,8 @@ static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
+static int mdp_m2m_try_fmt_mplane(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
@@ -362,7 +367,8 @@ static int mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int mdp_m2m_g_selection(struct file *file, void *fh,
+static int mdp_m2m_g_selection(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_selection *s)
 {
 	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
@@ -414,7 +420,8 @@ static int mdp_m2m_g_selection(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int mdp_m2m_s_selection(struct file *file, void *fh,
+static int mdp_m2m_s_selection(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_selection *s)
 {
 	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
@@ -616,9 +623,9 @@ static int mdp_m2m_open(struct file *file)
 	default_format.fmt.pix_mp.width = limit->out_limit.wmin;
 	default_format.fmt.pix_mp.height = limit->out_limit.hmin;
 	default_format.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420M;
-	mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
+	mdp_m2m_s_fmt_mplane(file, NULL, &default_format);
 	default_format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
+	mdp_m2m_s_fmt_mplane(file, NULL, &default_format);
 
 	dev_dbg(dev, "%s:[%d]", __func__, ctx->id);
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d691bd533103b100e7d1817e834696cc5b3990ce..a69d4f4620f6d7b3a13eeaaeeda2bee1b9313498 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -156,24 +156,28 @@ static int stateless_decoder_cmd(struct file *file, void *priv, struct v4l2_deco
 	return 0;
 }
 
-static int vidioc_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
+static int vidioc_try_decoder_cmd(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_decoder_cmd *cmd)
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (ctx->dev->vdec_pdata->uses_stateless_api)
-		return stateless_try_decoder_cmd(file, priv, cmd);
+		return stateless_try_decoder_cmd(file, state, cmd);
 
-	return stateful_try_decoder_cmd(file, priv, cmd);
+	return stateful_try_decoder_cmd(file, state, cmd);
 }
 
-static int vidioc_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
+static int vidioc_decoder_cmd(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_decoder_cmd *cmd)
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (ctx->dev->vdec_pdata->uses_stateless_api)
-		return stateless_decoder_cmd(file, priv, cmd);
+		return stateless_decoder_cmd(file, state, cmd);
 
-	return stateful_decoder_cmd(file, priv, cmd);
+	return stateful_decoder_cmd(file, state, cmd);
 }
 
 void mtk_vdec_unlock(struct mtk_vcodec_dec_ctx *ctx)
@@ -230,7 +234,8 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_dec_ctx *ctx)
 	q_data->bytesperline[1] = q_data->coded_width;
 }
 
-static int vidioc_vdec_qbuf(struct file *file, void *priv,
+static int vidioc_vdec_qbuf(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_buffer *buf)
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
@@ -243,7 +248,8 @@ static int vidioc_vdec_qbuf(struct file *file, void *priv,
 	return v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
 }
 
-static int vidioc_vdec_dqbuf(struct file *file, void *priv,
+static int vidioc_vdec_dqbuf(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_buffer *buf)
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
@@ -256,7 +262,8 @@ static int vidioc_vdec_dqbuf(struct file *file, void *priv,
 	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
 }
 
-static int vidioc_vdec_querycap(struct file *file, void *priv,
+static int vidioc_vdec_querycap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
@@ -350,7 +357,8 @@ static int vidioc_try_fmt(struct mtk_vcodec_dec_ctx *ctx, struct v4l2_format *f,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap_mplane(struct file *file,
+					 struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	const struct mtk_video_fmt *fmt;
@@ -367,7 +375,8 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 	return vidioc_try_fmt(ctx, f, fmt);
 }
 
-static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_out_mplane(struct file *file,
+					 struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
@@ -390,7 +399,8 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 	return vidioc_try_fmt(ctx, f, fmt);
 }
 
-static int vidioc_vdec_g_selection(struct file *file, void *priv,
+static int vidioc_vdec_g_selection(struct file *file,
+				   struct video_device_state *state,
 			struct v4l2_selection *s)
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
@@ -439,7 +449,8 @@ static int vidioc_vdec_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_vdec_s_selection(struct file *file, void *priv,
+static int vidioc_vdec_s_selection(struct file *file,
+				   struct video_device_state *state,
 				struct v4l2_selection *s)
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
@@ -461,7 +472,8 @@ static int vidioc_vdec_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_vdec_s_fmt(struct file *file, void *priv,
+static int vidioc_vdec_s_fmt(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
@@ -590,7 +602,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_framesizes(struct file *file, void *priv,
+static int vidioc_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				struct v4l2_frmsizeenum *fsize)
 {
 	int i = 0;
@@ -657,19 +670,22 @@ static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	return 0;
 }
 
-static int vidioc_vdec_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_vdec_enum_fmt_vid_cap(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	return vidioc_enum_fmt(file, f, false);
 }
 
-static int vidioc_vdec_enum_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_vdec_enum_fmt_vid_out(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	return vidioc_enum_fmt(file, f, true);
 }
 
-static int vidioc_vdec_g_fmt(struct file *file, void *priv,
+static int vidioc_vdec_g_fmt(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index d815e962ab8981c53000851e8f2bc61faf28056d..ce4636f03e4b1963a49a03743dae3ac55a014412 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -155,7 +155,8 @@ mtk_venc_find_format(u32 fourcc, const struct mtk_vcodec_enc_pdata *pdata)
 	return NULL;
 }
 
-static int vidioc_enum_framesizes(struct file *file, void *fh,
+static int vidioc_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	const struct mtk_video_fmt *fmt;
@@ -179,7 +180,8 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	const struct mtk_vcodec_enc_pdata *pdata =
@@ -189,7 +191,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 			       pdata->num_capture_formats);
 }
 
-static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	const struct mtk_vcodec_enc_pdata *pdata =
@@ -217,7 +220,8 @@ static int mtk_vcodec_enc_get_chip_name(struct mtk_vcodec_enc_ctx *ctx)
 		return 8173;
 }
 
-static int vidioc_venc_querycap(struct file *file, void *priv,
+static int vidioc_venc_querycap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
@@ -230,7 +234,8 @@ static int vidioc_venc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_venc_s_parm(struct file *file, void *priv,
+static int vidioc_venc_s_parm(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_streamparm *a)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
@@ -253,7 +258,8 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_venc_g_parm(struct file *file, void *priv,
+static int vidioc_venc_g_parm(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_streamparm *a)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
@@ -410,7 +416,8 @@ static void mtk_venc_set_param(struct mtk_vcodec_enc_ctx *ctx,
 			  param->gop_size, param->intra_period);
 }
 
-static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
+static int vidioc_venc_s_fmt_cap(struct file *file,
+				 struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
@@ -465,7 +472,8 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
+static int vidioc_venc_s_fmt_out(struct file *file,
+				 struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
@@ -519,7 +527,8 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_venc_g_fmt(struct file *file, void *priv,
+static int vidioc_venc_g_fmt(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
@@ -552,7 +561,8 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap_mplane(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_format *f)
 {
 	const struct mtk_video_fmt *fmt;
@@ -574,7 +584,8 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_out_mplane(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_format *f)
 {
 	const struct mtk_video_fmt *fmt;
@@ -596,7 +607,8 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 	return vidioc_try_fmt_out(ctx, f, fmt);
 }
 
-static int vidioc_venc_g_selection(struct file *file, void *priv,
+static int vidioc_venc_g_selection(struct file *file,
+				   struct video_device_state *state,
 				     struct v4l2_selection *s)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
@@ -626,7 +638,8 @@ static int vidioc_venc_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_venc_s_selection(struct file *file, void *priv,
+static int vidioc_venc_s_selection(struct file *file,
+				   struct video_device_state *state,
 				     struct v4l2_selection *s)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
@@ -651,7 +664,8 @@ static int vidioc_venc_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_venc_qbuf(struct file *file, void *priv,
+static int vidioc_venc_qbuf(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_buffer *buf)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
@@ -665,7 +679,8 @@ static int vidioc_venc_qbuf(struct file *file, void *priv,
 	return v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
 }
 
-static int vidioc_venc_dqbuf(struct file *file, void *priv,
+static int vidioc_venc_dqbuf(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_buffer *buf)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
@@ -703,7 +718,8 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_encoder_cmd(struct file *file, void *priv,
+static int vidioc_encoder_cmd(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_encoder_cmd *cmd)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
@@ -716,7 +732,7 @@ static int vidioc_encoder_cmd(struct file *file, void *priv,
 		return -EIO;
 	}
 
-	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, cmd);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, state, cmd);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index a7cdc743fda71db0ffbf499cb4b9ca18c9e7abf2..9a1a01d231d561bd2f360f320b1b0438a46d36f9 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -473,7 +473,8 @@ static const struct vb2_ops isc_vb2_ops = {
 	.unprepare_streaming	= isc_unprepare_streaming,
 };
 
-static int isc_querycap(struct file *file, void *priv,
+static int isc_querycap(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "microchip-isc", sizeof(cap->driver));
@@ -482,7 +483,8 @@ static int isc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int isc_enum_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	struct isc_device *isc = video_drvdata(file);
@@ -546,7 +548,8 @@ static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int isc_g_fmt_vid_cap(struct file *file, void *priv,
+static int isc_g_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *fmt)
 {
 	struct isc_device *isc = video_drvdata(file);
@@ -985,7 +988,8 @@ static int isc_link_validate(struct media_link *link)
 	return 0;
 }
 
-static int isc_s_fmt_vid_cap(struct file *file, void *priv,
+static int isc_s_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct isc_device *isc = video_drvdata(file);
@@ -996,7 +1000,8 @@ static int isc_s_fmt_vid_cap(struct file *file, void *priv,
 	return isc_set_fmt(isc, f);
 }
 
-static int isc_try_fmt_vid_cap(struct file *file, void *priv,
+static int isc_try_fmt_vid_cap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct isc_device *isc = video_drvdata(file);
@@ -1004,7 +1009,8 @@ static int isc_try_fmt_vid_cap(struct file *file, void *priv,
 	return isc_try_fmt(isc, f);
 }
 
-static int isc_enum_input(struct file *file, void *priv,
+static int isc_enum_input(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_input *inp)
 {
 	if (inp->index != 0)
@@ -1017,14 +1023,16 @@ static int isc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int isc_g_input(struct file *file, void *priv, unsigned int *i)
+static int isc_g_input(struct file *file, struct video_device_state *state,
+		       unsigned int *i)
 {
 	*i = 0;
 
 	return 0;
 }
 
-static int isc_s_input(struct file *file, void *priv, unsigned int i)
+static int isc_s_input(struct file *file, struct video_device_state *state,
+		       unsigned int i)
 {
 	if (i > 0)
 		return -EINVAL;
@@ -1032,21 +1040,24 @@ static int isc_s_input(struct file *file, void *priv, unsigned int i)
 	return 0;
 }
 
-static int isc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int isc_g_parm(struct file *file, struct video_device_state *state,
+		      struct v4l2_streamparm *a)
 {
 	struct isc_device *isc = video_drvdata(file);
 
 	return v4l2_g_parm_cap(video_devdata(file), isc->current_subdev->sd, a);
 }
 
-static int isc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int isc_s_parm(struct file *file, struct video_device_state *state,
+		      struct v4l2_streamparm *a)
 {
 	struct isc_device *isc = video_drvdata(file);
 
 	return v4l2_s_parm_cap(video_devdata(file), isc->current_subdev->sd, a);
 }
 
-static int isc_enum_framesizes(struct file *file, void *fh,
+static int isc_enum_framesizes(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_frmsizeenum *fsize)
 {
 	struct isc_device *isc = video_drvdata(file);
diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 44e904e61801e8c3b0d3bb8ca83aef0a50fc5992..9d680a60b4e08a4a7ca6cba54511cbf7d3998c78 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1129,7 +1129,8 @@ static irqreturn_t npcm_video_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int npcm_video_querycap(struct file *file, void *fh,
+static int npcm_video_querycap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DEVICE_NAME, sizeof(cap->driver));
@@ -1138,7 +1139,8 @@ static int npcm_video_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int npcm_video_enum_format(struct file *file, void *fh,
+static int npcm_video_enum_format(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_fmtdesc *f)
 {
 	struct npcm_video *video = video_drvdata(file);
@@ -1155,7 +1157,8 @@ static int npcm_video_enum_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int npcm_video_try_format(struct file *file, void *fh,
+static int npcm_video_try_format(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct npcm_video *video = video_drvdata(file);
@@ -1178,7 +1181,8 @@ static int npcm_video_try_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int npcm_video_get_format(struct file *file, void *fh,
+static int npcm_video_get_format(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct npcm_video *video = video_drvdata(file);
@@ -1187,13 +1191,14 @@ static int npcm_video_get_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int npcm_video_set_format(struct file *file, void *fh,
+static int npcm_video_set_format(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct npcm_video *video = video_drvdata(file);
 	int ret;
 
-	ret = npcm_video_try_format(file, fh, f);
+	ret = npcm_video_try_format(file, state, f);
 	if (ret)
 		return ret;
 
@@ -1206,7 +1211,8 @@ static int npcm_video_set_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int npcm_video_enum_input(struct file *file, void *fh,
+static int npcm_video_enum_input(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_input *inp)
 {
 	struct npcm_video *video = video_drvdata(file);
@@ -1222,14 +1228,18 @@ static int npcm_video_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int npcm_video_get_input(struct file *file, void *fh, unsigned int *i)
+static int npcm_video_get_input(struct file *file,
+				struct video_device_state *state,
+				unsigned int *i)
 {
 	*i = 0;
 
 	return 0;
 }
 
-static int npcm_video_set_input(struct file *file, void *fh, unsigned int i)
+static int npcm_video_set_input(struct file *file,
+				struct video_device_state *state,
+				unsigned int i)
 {
 	if (i)
 		return -EINVAL;
@@ -1237,7 +1247,8 @@ static int npcm_video_set_input(struct file *file, void *fh, unsigned int i)
 	return 0;
 }
 
-static int npcm_video_set_dv_timings(struct file *file, void *fh,
+static int npcm_video_set_dv_timings(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_dv_timings *timings)
 {
 	struct npcm_video *video = video_drvdata(file);
@@ -1261,7 +1272,8 @@ static int npcm_video_set_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int npcm_video_get_dv_timings(struct file *file, void *fh,
+static int npcm_video_get_dv_timings(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_dv_timings *timings)
 {
 	struct npcm_video *video = video_drvdata(file);
@@ -1272,7 +1284,8 @@ static int npcm_video_get_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int npcm_video_query_dv_timings(struct file *file, void *fh,
+static int npcm_video_query_dv_timings(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_dv_timings *timings)
 {
 	struct npcm_video *video = video_drvdata(file);
@@ -1284,14 +1297,16 @@ static int npcm_video_query_dv_timings(struct file *file, void *fh,
 	return video->v4l2_input_status ? -ENOLINK : 0;
 }
 
-static int npcm_video_enum_dv_timings(struct file *file, void *fh,
+static int npcm_video_enum_dv_timings(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_enum_dv_timings *timings)
 {
 	return v4l2_enum_dv_timings_cap(timings, &npcm_video_timings_cap,
 					NULL, NULL);
 }
 
-static int npcm_video_dv_timings_cap(struct file *file, void *fh,
+static int npcm_video_dv_timings_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_dv_timings_cap *cap)
 {
 	*cap = npcm_video_timings_cap;
diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index d94978ae2baf3394206ad7c3eb7a400aeee47cf7..7e96043f0a8043872c72f77cce0955622e0b8e0f 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -493,7 +493,8 @@ static void tegra_decode_complete(struct work_struct *work)
 		tegra_job_finish(ctx, VB2_BUF_STATE_DONE);
 }
 
-static int tegra_querycap(struct file *file, void *priv,
+static int tegra_querycap(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_capability *cap)
 {
 	strscpy(cap->bus_info, "platform:tegra-vde", sizeof(cap->bus_info));
@@ -503,7 +504,8 @@ static int tegra_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int tegra_enum_decoded_fmt(struct file *file, void *priv,
+static int tegra_enum_decoded_fmt(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_fmtdesc *f)
 {
 	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
@@ -519,7 +521,8 @@ static int tegra_enum_decoded_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int tegra_g_decoded_fmt(struct file *file, void *priv,
+static int tegra_g_decoded_fmt(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
@@ -528,7 +531,8 @@ static int tegra_g_decoded_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int tegra_try_decoded_fmt(struct file *file, void *priv,
+static int tegra_try_decoded_fmt(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
@@ -568,7 +572,8 @@ static int tegra_try_decoded_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int tegra_s_decoded_fmt(struct file *file, void *priv,
+static int tegra_s_decoded_fmt(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
@@ -581,7 +586,7 @@ static int tegra_s_decoded_fmt(struct file *file, void *priv,
 	if (vb2_is_busy(vq))
 		return -EBUSY;
 
-	err = tegra_try_decoded_fmt(file, priv, f);
+	err = tegra_try_decoded_fmt(file, state, f);
 	if (err)
 		return err;
 
@@ -590,7 +595,8 @@ static int tegra_s_decoded_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int tegra_enum_coded_fmt(struct file *file, void *priv,
+static int tegra_enum_coded_fmt(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
@@ -604,7 +610,8 @@ static int tegra_enum_coded_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int tegra_g_coded_fmt(struct file *file, void *priv,
+static int tegra_g_coded_fmt(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
@@ -627,7 +634,8 @@ tegra_find_coded_fmt_desc(struct tegra_ctx *ctx, u32 fourcc)
 	return NULL;
 }
 
-static int tegra_try_coded_fmt(struct file *file, void *priv,
+static int tegra_try_coded_fmt(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -653,7 +661,8 @@ static int tegra_try_coded_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int tegra_s_coded_fmt(struct file *file, void *priv,
+static int tegra_s_coded_fmt(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
@@ -683,7 +692,7 @@ static int tegra_s_coded_fmt(struct file *file, void *priv,
 	if (vb2_is_busy(peer_vq))
 		return -EBUSY;
 
-	err = tegra_try_coded_fmt(file, priv, f);
+	err = tegra_try_coded_fmt(file, state, f);
 	if (err)
 		return err;
 
@@ -715,7 +724,8 @@ static int tegra_s_coded_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int tegra_enum_framesizes(struct file *file, void *priv,
+static int tegra_enum_framesizes(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_frmsizeenum *fsize)
 {
 	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
@@ -835,10 +845,10 @@ static int tegra_open(struct file *file)
 	v4l2_fh_add(&ctx->fh, file);
 
 	tegra_reset_coded_fmt(ctx);
-	tegra_try_coded_fmt(file, &ctx->fh, &ctx->coded_fmt);
+	tegra_try_coded_fmt(file, ctx->fh.state, &ctx->coded_fmt);
 
 	tegra_reset_decoded_fmt(ctx);
-	tegra_try_decoded_fmt(file, &ctx->fh, &ctx->decoded_fmt);
+	tegra_try_decoded_fmt(file, ctx->fh.state, &ctx->decoded_fmt);
 
 	return 0;
 
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 97744c7b7c034cadfdd3f6d76165b4da85fa3d16..7f127f0dbe16227994998d355a22125d58e139c8 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -686,7 +686,8 @@ static const struct v4l2_file_operations dw100_fops = {
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
-static int dw100_querycap(struct file *file, void *priv,
+static int dw100_querycap(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DRV_NAME, sizeof(cap->driver));
@@ -695,7 +696,8 @@ static int dw100_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dw100_enum_fmt_vid(struct file *file, void *priv,
+static int dw100_enum_fmt_vid(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_fmtdesc *f)
 {
 	int i, num = 0;
@@ -713,7 +715,8 @@ static int dw100_enum_fmt_vid(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int dw100_enum_framesizes(struct file *file, void *priv,
+static int dw100_enum_framesizes(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_frmsizeenum *fsize)
 {
 	const struct dw100_fmt *fmt;
@@ -732,7 +735,9 @@ static int dw100_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int dw100_g_fmt_vid(struct file *file, void *priv, struct v4l2_format *f)
+static int dw100_g_fmt_vid(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_format *f)
 {
 	struct dw100_ctx *ctx = dw100_file2ctx(file);
 	struct vb2_queue *vq;
@@ -861,7 +866,8 @@ static int dw100_s_fmt(struct dw100_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int dw100_try_fmt_vid_cap(struct file *file, void *priv,
+static int dw100_try_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
@@ -870,13 +876,14 @@ static int dw100_try_fmt_vid_cap(struct file *file, void *priv,
 	return dw100_try_fmt(file, f);
 }
 
-static int dw100_s_fmt_vid_cap(struct file *file, void *priv,
+static int dw100_s_fmt_vid_cap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct dw100_ctx *ctx = dw100_file2ctx(file);
 	int ret;
 
-	ret = dw100_try_fmt_vid_cap(file, priv, f);
+	ret = dw100_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -887,7 +894,8 @@ static int dw100_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dw100_try_fmt_vid_out(struct file *file, void *priv,
+static int dw100_try_fmt_vid_out(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -896,13 +904,14 @@ static int dw100_try_fmt_vid_out(struct file *file, void *priv,
 	return dw100_try_fmt(file, f);
 }
 
-static int dw100_s_fmt_vid_out(struct file *file, void *priv,
+static int dw100_s_fmt_vid_out(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct dw100_ctx *ctx = dw100_file2ctx(file);
 	int ret;
 
-	ret = dw100_try_fmt_vid_out(file, priv, f);
+	ret = dw100_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
@@ -913,7 +922,8 @@ static int dw100_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int dw100_g_selection(struct file *file, void *fh,
+static int dw100_g_selection(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_selection *sel)
 {
 	struct dw100_ctx *ctx = dw100_file2ctx(file);
@@ -945,7 +955,8 @@ static int dw100_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int dw100_s_selection(struct file *file, void *fh,
+static int dw100_s_selection(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_selection *sel)
 {
 	struct dw100_ctx *ctx = dw100_file2ctx(file);
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index df3ccdf767baf0bf6687808e2c017063181a7220..c4cca1f9dabd03ac34a935b1bc8b5bc9b7b1f490 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1601,7 +1601,8 @@ static void mxc_jpeg_device_run(void *priv)
 	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
 }
 
-static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
+static int mxc_jpeg_decoder_cmd(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_decoder_cmd *cmd)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
@@ -1609,7 +1610,7 @@ static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
 	unsigned long flags;
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, state, cmd);
 	if (ret < 0)
 		return ret;
 
@@ -1617,7 +1618,7 @@ static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
 		return 0;
 
 	spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
-	ret = v4l2_m2m_ioctl_decoder_cmd(file, priv, cmd);
+	ret = v4l2_m2m_ioctl_decoder_cmd(file, state, cmd);
 	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
 	if (ret < 0)
 		return ret;
@@ -1634,7 +1635,8 @@ static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
 	return 0;
 }
 
-static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
+static int mxc_jpeg_encoder_cmd(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_encoder_cmd *cmd)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
@@ -1642,7 +1644,7 @@ static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
 	unsigned long flags;
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, state, cmd);
 	if (ret < 0)
 		return ret;
 
@@ -1651,7 +1653,7 @@ static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
 		return 0;
 
 	spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
-	ret = v4l2_m2m_ioctl_encoder_cmd(file, fh, cmd);
+	ret = v4l2_m2m_ioctl_encoder_cmd(file, state, cmd);
 	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
 	if (ret < 0)
 		return 0;
@@ -2241,7 +2243,8 @@ static int mxc_jpeg_open(struct file *file)
 	return ret;
 }
 
-static int mxc_jpeg_querycap(struct file *file, void *priv,
+static int mxc_jpeg_querycap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, MXC_JPEG_NAME " codec", sizeof(cap->driver));
@@ -2252,7 +2255,8 @@ static int mxc_jpeg_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int mxc_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
+static int mxc_jpeg_enum_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_fmtdesc *f)
 {
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
@@ -2292,7 +2296,8 @@ static int mxc_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 	}
 }
 
-static int mxc_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
+static int mxc_jpeg_enum_fmt_vid_out(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_fmtdesc *f)
 {
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
@@ -2433,7 +2438,8 @@ static int mxc_jpeg_try_fmt(struct v4l2_format *f,
 	return 0;
 }
 
-static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
+static int mxc_jpeg_try_fmt_vid_cap(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
@@ -2452,7 +2458,8 @@ static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 	return mxc_jpeg_try_fmt(f, ctx, &tmp_q);
 }
 
-static int mxc_jpeg_try_fmt_vid_out(struct file *file, void *priv,
+static int mxc_jpeg_try_fmt_vid_out(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
@@ -2504,13 +2511,15 @@ static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
 	return mxc_jpeg_try_fmt(f, ctx, mxc_jpeg_get_q_data(ctx, f->type));
 }
 
-static int mxc_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
+static int mxc_jpeg_s_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	return mxc_jpeg_s_fmt(mxc_jpeg_file_to_ctx(file), f);
 }
 
-static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
+static int mxc_jpeg_s_fmt_vid_out(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	int ret;
@@ -2543,10 +2552,11 @@ static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 	fc.fmt.pix_mp.width = f->fmt.pix_mp.width;
 	fc.fmt.pix_mp.height = f->fmt.pix_mp.height;
 
-	return mxc_jpeg_s_fmt_vid_cap(file, priv, &fc);
+	return mxc_jpeg_s_fmt_vid_cap(file, state, &fc);
 }
 
-static int mxc_jpeg_g_fmt_vid(struct file *file, void *priv,
+static int mxc_jpeg_g_fmt_vid(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
@@ -2642,17 +2652,21 @@ static int mxc_jpeg_enc_g_selection(struct file *file, void *fh, struct v4l2_sel
 	return 0;
 }
 
-static int mxc_jpeg_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int mxc_jpeg_g_selection(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_selection *s)
 {
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 
 	if (ctx->mxc_jpeg->mode == MXC_JPEG_DECODE)
-		return mxc_jpeg_dec_g_selection(file, fh, s);
+		return mxc_jpeg_dec_g_selection(file, state, s);
 	else
-		return mxc_jpeg_enc_g_selection(file, fh, s);
+		return mxc_jpeg_enc_g_selection(file, state, s);
 }
 
-static int mxc_jpeg_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+static int mxc_jpeg_s_selection(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_selection *s)
 {
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_q_data *q_data_out;
diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 6cc9b07ea53a002c2eda0fd6062096f5527ad62c..ed480a63eae071addfa14f510b867cea9d058396 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1127,7 +1127,8 @@ static irqreturn_t pxp_irq_handler(int irq, void *dev_id)
 /*
  * video ioctls
  */
-static int pxp_querycap(struct file *file, void *priv,
+static int pxp_querycap(struct file *file,
+			struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
@@ -1166,13 +1167,15 @@ static int pxp_enum_fmt(struct v4l2_fmtdesc *f, u32 type)
 	return -EINVAL;
 }
 
-static int pxp_enum_fmt_vid_cap(struct file *file, void *priv,
+static int pxp_enum_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	return pxp_enum_fmt(f, MEM2MEM_CAPTURE);
 }
 
-static int pxp_enum_fmt_vid_out(struct file *file, void *priv,
+static int pxp_enum_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	return pxp_enum_fmt(f, MEM2MEM_OUTPUT);
@@ -1203,13 +1206,15 @@ static int pxp_g_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int pxp_g_fmt_vid_out(struct file *file, void *priv,
+static int pxp_g_fmt_vid_out(struct file *file,
+			     struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	return pxp_g_fmt(file2ctx(file), f);
 }
 
-static int pxp_g_fmt_vid_cap(struct file *file, void *priv,
+static int pxp_g_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	return pxp_g_fmt(file2ctx(file), f);
@@ -1271,7 +1276,8 @@ pxp_fixup_colorimetry_cap(struct pxp_ctx *ctx, u32 dst_fourcc,
 	}
 }
 
-static int pxp_try_fmt_vid_cap(struct file *file, void *priv,
+static int pxp_try_fmt_vid_cap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct pxp_fmt *fmt;
@@ -1299,7 +1305,8 @@ static int pxp_try_fmt_vid_cap(struct file *file, void *priv,
 	return pxp_try_fmt(f, fmt);
 }
 
-static int pxp_try_fmt_vid_out(struct file *file, void *priv,
+static int pxp_try_fmt_vid_out(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct pxp_fmt *fmt;
@@ -1354,13 +1361,14 @@ static int pxp_s_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int pxp_s_fmt_vid_cap(struct file *file, void *priv,
+static int pxp_s_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct pxp_ctx *ctx = file2ctx(file);
 	int ret;
 
-	ret = pxp_try_fmt_vid_cap(file, priv, f);
+	ret = pxp_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -1374,13 +1382,14 @@ static int pxp_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int pxp_s_fmt_vid_out(struct file *file, void *priv,
+static int pxp_s_fmt_vid_out(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct pxp_ctx *ctx = file2ctx(file);
 	int ret;
 
-	ret = pxp_try_fmt_vid_out(file, priv, f);
+	ret = pxp_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
@@ -1400,7 +1409,8 @@ static int pxp_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int pxp_enum_framesizes(struct file *file, void *fh,
+static int pxp_enum_framesizes(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_frmsizeenum *fsize)
 {
 	if (fsize->index > 0)
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 34a92642bbfe7b7ce9c85fbaf346c6f595425cc9..44664c48d770601a8bed4a76a547ac377e336067 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1035,7 +1035,8 @@ static int imx7_csi_enum_mbus_formats(u32 *code, u32 index)
  * Video Capture Device - IOCTLs
  */
 
-static int imx7_csi_video_querycap(struct file *file, void *fh,
+static int imx7_csi_video_querycap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_capability *cap)
 {
 	struct imx7_csi *csi = video_drvdata(file);
@@ -1048,7 +1049,8 @@ static int imx7_csi_video_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int imx7_csi_video_enum_fmt_vid_cap(struct file *file, void *fh,
+static int imx7_csi_video_enum_fmt_vid_cap(struct file *file,
+					   struct video_device_state *state,
 					   struct v4l2_fmtdesc *f)
 {
 	unsigned int index = f->index;
@@ -1087,7 +1089,8 @@ static int imx7_csi_video_enum_fmt_vid_cap(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int imx7_csi_video_enum_framesizes(struct file *file, void *fh,
+static int imx7_csi_video_enum_framesizes(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_frmsizeenum *fsize)
 {
 	const struct imx7_csi_pixfmt *cc;
@@ -1117,7 +1120,8 @@ static int imx7_csi_video_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int imx7_csi_video_g_fmt_vid_cap(struct file *file, void *fh,
+static int imx7_csi_video_g_fmt_vid_cap(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct imx7_csi *csi = video_drvdata(file);
@@ -1167,14 +1171,16 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	return cc;
 }
 
-static int imx7_csi_video_try_fmt_vid_cap(struct file *file, void *fh,
+static int imx7_csi_video_try_fmt_vid_cap(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_format *f)
 {
 	__imx7_csi_video_try_fmt(&f->fmt.pix, NULL);
 	return 0;
 }
 
-static int imx7_csi_video_s_fmt_vid_cap(struct file *file, void *fh,
+static int imx7_csi_video_s_fmt_vid_cap(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct imx7_csi *csi = video_drvdata(file);
@@ -1193,7 +1199,8 @@ static int imx7_csi_video_s_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int imx7_csi_video_g_selection(struct file *file, void *fh,
+static int imx7_csi_video_g_selection(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_selection *s)
 {
 	struct imx7_csi *csi = video_drvdata(file);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 00afcbfbdde4840145a2cec8acbafea604ce2f0e..d447b752d6f18d41602b22806a17c67366ae346b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -473,7 +473,8 @@ static void mxc_isi_m2m_ctx_ctrls_delete(struct mxc_isi_m2m_ctx *ctx)
  * V4L2 ioctls
  */
 
-static int mxc_isi_m2m_querycap(struct file *file, void *fh,
+static int mxc_isi_m2m_querycap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, MXC_ISI_DRIVER_NAME, sizeof(cap->driver));
@@ -484,7 +485,8 @@ static int mxc_isi_m2m_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
+static int mxc_isi_m2m_enum_fmt_vid(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_fmtdesc *f)
 {
 	const enum mxc_isi_video_type type =
@@ -517,7 +519,8 @@ __mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
 	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
 }
 
-static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
+static int mxc_isi_m2m_try_fmt_vid(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	const enum mxc_isi_video_type type =
@@ -530,7 +533,8 @@ static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
 	return 0;
 }
 
-static int mxc_isi_m2m_g_fmt_vid(struct file *file, void *fh,
+static int mxc_isi_m2m_g_fmt_vid(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
@@ -542,7 +546,8 @@ static int mxc_isi_m2m_g_fmt_vid(struct file *file, void *fh,
 	return 0;
 }
 
-static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
+static int mxc_isi_m2m_s_fmt_vid(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	const enum mxc_isi_video_type type =
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 13682bf6e9f8895bb9eb1f92d5f74b0d5968544e..e8fafd15930564c0d81d579674c87ff38bc8edbb 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -1114,7 +1114,8 @@ static void mxc_isi_video_ctrls_delete(struct mxc_isi_video *video)
  * V4L2 ioctls
  */
 
-static int mxc_isi_video_querycap(struct file *file, void *priv,
+static int mxc_isi_video_querycap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, MXC_ISI_DRIVER_NAME, sizeof(cap->driver));
@@ -1123,7 +1124,8 @@ static int mxc_isi_video_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
+static int mxc_isi_video_enum_fmt(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_fmtdesc *f)
 {
 	const struct mxc_isi_format_info *fmt;
@@ -1163,7 +1165,8 @@ static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int mxc_isi_video_g_fmt(struct file *file, void *fh,
+static int mxc_isi_video_g_fmt(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct mxc_isi_video *video = video_drvdata(file);
@@ -1173,7 +1176,8 @@ static int mxc_isi_video_g_fmt(struct file *file, void *fh,
 	return 0;
 }
 
-static int mxc_isi_video_try_fmt(struct file *file, void *fh,
+static int mxc_isi_video_try_fmt(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct mxc_isi_video *video = video_drvdata(file);
@@ -1182,7 +1186,8 @@ static int mxc_isi_video_try_fmt(struct file *file, void *fh,
 	return 0;
 }
 
-static int mxc_isi_video_s_fmt(struct file *file, void *priv,
+static int mxc_isi_video_s_fmt(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct mxc_isi_video *video = video_drvdata(file);
@@ -1197,7 +1202,8 @@ static int mxc_isi_video_s_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int mxc_isi_video_enum_framesizes(struct file *file, void *priv,
+static int mxc_isi_video_enum_framesizes(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_frmsizeenum *fsize)
 {
 	struct mxc_isi_video *video = video_drvdata(file);
diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index 3aae8c0b690c0b1b0dd4f05a1c9184b089719a20..9fec60210a088110147246865fe9d844c7cb5d44 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -380,7 +380,8 @@ static irqreturn_t emmaprp_irq(int irq_emma, void *data)
 /*
  * video ioctls
  */
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
@@ -417,13 +418,15 @@ static int enum_fmt(struct v4l2_fmtdesc *f, u32 type)
 	return -EINVAL;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return enum_fmt(f, MEM2MEM_CAPTURE);
 }
 
-static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return enum_fmt(f, MEM2MEM_OUTPUT);
@@ -453,13 +456,15 @@ static int vidioc_g_fmt(struct emmaprp_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	return vidioc_g_fmt(file_to_emmaprp_ctx(file), f);
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	return vidioc_g_fmt(file_to_emmaprp_ctx(file), f);
@@ -499,7 +504,8 @@ static int vidioc_try_fmt(struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct emmaprp_ctx *ctx = file_to_emmaprp_ctx(file);
@@ -516,7 +522,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return vidioc_try_fmt(f);
 }
 
-static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_out(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct emmaprp_ctx *ctx = file_to_emmaprp_ctx(file);
@@ -571,24 +578,26 @@ static int vidioc_s_fmt(struct emmaprp_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	int ret;
 
-	ret = vidioc_try_fmt_vid_cap(file, priv, f);
+	ret = vidioc_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
 	return vidioc_s_fmt(file_to_emmaprp_ctx(file), f);
 }
 
-static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	int ret;
 
-	ret = vidioc_try_fmt_vid_out(file, priv, f);
+	ret = vidioc_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 831486e14754ab3a24b077e21be14ea3169220a4..e5315df8929da41c9c952adbb8f1465691a763e3 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -346,7 +346,8 @@ static const struct vb2_ops msm_video_vb2_q_ops = {
  * V4L2 ioctls
  */
 
-static int video_querycap(struct file *file, void *fh,
+static int video_querycap(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "qcom-camss", sizeof(cap->driver));
@@ -355,7 +356,8 @@ static int video_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int video_enum_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_fmtdesc *f)
 {
 	struct camss_video *video = video_drvdata(file);
 	int i, j, k;
@@ -412,7 +414,8 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static int video_enum_framesizes(struct file *file, void *fh,
+static int video_enum_framesizes(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_frmsizeenum *fsize)
 {
 	struct camss_video *video = video_drvdata(file);
@@ -442,7 +445,8 @@ static int video_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int video_g_fmt(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f)
 {
 	struct camss_video *video = video_drvdata(file);
 
@@ -531,14 +535,16 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 	return 0;
 }
 
-static int video_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int video_try_fmt(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f)
 {
 	struct camss_video *video = video_drvdata(file);
 
 	return __video_try_fmt(video, f);
 }
 
-static int video_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int video_s_fmt(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f)
 {
 	struct camss_video *video = video_drvdata(file);
 	int ret;
@@ -555,7 +561,8 @@ static int video_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int video_enum_input(struct file *file, void *fh,
+static int video_enum_input(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_input *input)
 {
 	if (input->index > 0)
@@ -567,14 +574,16 @@ static int video_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int video_g_input(struct file *file, void *fh, unsigned int *input)
+static int video_g_input(struct file *file, struct video_device_state *state,
+			 unsigned int *input)
 {
 	*input = 0;
 
 	return 0;
 }
 
-static int video_s_input(struct file *file, void *fh, unsigned int input)
+static int video_s_input(struct file *file, struct video_device_state *state,
+			 unsigned int input)
 {
 	return input == 0 ? 0 : -EINVAL;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index d38d0f6961cd5cb9929e2aecbec7353dcc2d4a7d..9f541ad219700356846e693fd848714df6c6dac1 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -308,7 +308,8 @@ int iris_close(struct file *filp)
 	return 0;
 }
 
-static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
+static int iris_enum_fmt(struct file *filp, struct video_device_state *state,
+			 struct v4l2_fmtdesc *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 
@@ -320,7 +321,9 @@ static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
 		return -EINVAL;
 }
 
-static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
+static int iris_try_fmt_vid_mplane(struct file *filp,
+				   struct video_device_state *state,
+				   struct v4l2_format *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 	int ret = 0;
@@ -337,7 +340,9 @@ static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_form
 	return ret;
 }
 
-static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
+static int iris_s_fmt_vid_mplane(struct file *filp,
+				 struct video_device_state *state,
+				 struct v4l2_format *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 	int ret = 0;
@@ -354,7 +359,9 @@ static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 	return ret;
 }
 
-static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
+static int iris_g_fmt_vid_mplane(struct file *filp,
+				 struct video_device_state *state,
+				 struct v4l2_format *f)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 	int ret = 0;
@@ -372,7 +379,8 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 	return ret;
 }
 
-static int iris_enum_framesizes(struct file *filp, void *fh,
+static int iris_enum_framesizes(struct file *filp,
+				struct video_device_state *state,
 				struct v4l2_frmsizeenum *fsize)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
@@ -403,7 +411,8 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
 	return ret;
 }
 
-static int iris_enum_frameintervals(struct file *filp, void *fh,
+static int iris_enum_frameintervals(struct file *filp,
+				    struct video_device_state *state,
 				    struct v4l2_frmivalenum *fival)
 
 {
@@ -448,7 +457,8 @@ static int iris_enum_frameintervals(struct file *filp, void *fh,
 	return 0;
 }
 
-static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
+static int iris_querycap(struct file *filp, struct video_device_state *state,
+			 struct v4l2_capability *cap)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 
@@ -462,7 +472,9 @@ static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *ca
 	return 0;
 }
 
-static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
+static int iris_g_selection(struct file *filp,
+			    struct video_device_state *state,
+			    struct v4l2_selection *s)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 
@@ -512,7 +524,9 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 	return 0;
 }
 
-static int iris_s_selection(struct file *filp, void *fh, struct v4l2_selection *s)
+static int iris_s_selection(struct file *filp,
+			    struct video_device_state *state,
+			    struct v4l2_selection *s)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 
@@ -536,7 +550,8 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
 	return -EINVAL;
 }
 
-static int iris_s_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
+static int iris_s_parm(struct file *filp, struct video_device_state *state,
+		       struct v4l2_streamparm *a)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 
@@ -550,7 +565,8 @@ static int iris_s_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
 		return -EINVAL;
 }
 
-static int iris_g_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
+static int iris_g_parm(struct file *filp, struct video_device_state *state,
+		       struct v4l2_streamparm *a)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
 
@@ -564,7 +580,8 @@ static int iris_g_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
 		return -EINVAL;
 }
 
-static int iris_dec_cmd(struct file *filp, void *fh,
+static int iris_dec_cmd(struct file *filp,
+			struct video_device_state *state,
 			struct v4l2_decoder_cmd *dec)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
@@ -572,7 +589,7 @@ static int iris_dec_cmd(struct file *filp, void *fh,
 
 	mutex_lock(&inst->lock);
 
-	ret = v4l2_m2m_ioctl_decoder_cmd(filp, fh, dec);
+	ret = v4l2_m2m_ioctl_decoder_cmd(filp, state, dec);
 	if (ret)
 		goto unlock;
 
@@ -597,7 +614,8 @@ static int iris_dec_cmd(struct file *filp, void *fh,
 	return ret;
 }
 
-static int iris_enc_cmd(struct file *filp, void *fh,
+static int iris_enc_cmd(struct file *filp,
+			struct video_device_state *state,
 			struct v4l2_encoder_cmd *enc)
 {
 	struct iris_inst *inst = iris_get_inst(filp);
@@ -605,7 +623,7 @@ static int iris_enc_cmd(struct file *filp, void *fh,
 
 	mutex_lock(&inst->lock);
 
-	ret = v4l2_m2m_ioctl_encoder_cmd(filp, fh, enc);
+	ret = v4l2_m2m_ioctl_encoder_cmd(filp, state, enc);
 	if (ret)
 		goto unlock;
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 55c27345b7d89bf400e216ed9aa59a871e501a44..4c440bf2f52bdd61909ea3e364eccb0865072feb 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -238,7 +238,8 @@ vdec_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 	return fmt;
 }
 
-static int vdec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int vdec_try_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct venus_inst *inst = to_inst(file);
 
@@ -281,7 +282,8 @@ static int vdec_check_src_change(struct venus_inst *inst)
 	return 0;
 }
 
-static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int vdec_g_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct venus_inst *inst = to_inst(file);
 	const struct venus_format *fmt = NULL;
@@ -318,7 +320,8 @@ static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int vdec_s_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
@@ -392,7 +395,8 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 }
 
 static int
-vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+vdec_g_selection(struct file *file, struct video_device_state *state,
+		 struct v4l2_selection *s)
 {
 	struct venus_inst *inst = to_inst(file);
 
@@ -433,7 +437,8 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 }
 
 static int
-vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+vdec_querycap(struct file *file, struct video_device_state *state,
+	      struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
@@ -442,7 +447,8 @@ vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	return 0;
 }
 
-static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int vdec_enum_fmt(struct file *file, struct video_device_state *state,
+			 struct v4l2_fmtdesc *f)
 {
 	struct venus_inst *inst = to_inst(file);
 	const struct venus_format *fmt;
@@ -459,7 +465,8 @@ static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int vdec_s_parm(struct file *file, struct video_device_state *state,
+		       struct v4l2_streamparm *a)
 {
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_captureparm *cap = &a->parm.capture;
@@ -491,7 +498,8 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	return 0;
 }
 
-static int vdec_enum_framesizes(struct file *file, void *fh,
+static int vdec_enum_framesizes(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_frmsizeenum *fsize)
 {
 	struct venus_inst *inst = to_inst(file);
@@ -544,14 +552,15 @@ static int vdec_subscribe_event(struct v4l2_fh *fh,
 }
 
 static int
-vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
+vdec_decoder_cmd(struct file *file, struct video_device_state *state,
+		 struct v4l2_decoder_cmd *cmd)
 {
 	struct venus_inst *inst = to_inst(file);
 	struct vb2_queue *dst_vq;
 	struct hfi_frame_data fdata = {0};
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, state, cmd);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index fba07557a3996a55fcd6a4f65376c418ec0c92a7..8fe86139a5d6e0b1e896a4bcd619aa450ca2fd27 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -142,7 +142,8 @@ static int venc_v4l2_to_hfi(int id, int value)
 }
 
 static int
-venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+venc_querycap(struct file *file, struct video_device_state *state,
+	      struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Venus video encoder", sizeof(cap->card));
@@ -151,7 +152,8 @@ venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	return 0;
 }
 
-static int venc_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int venc_enum_fmt(struct file *file, struct video_device_state *state,
+			 struct v4l2_fmtdesc *f)
 {
 	struct venus_inst *inst = to_inst(file);
 	const struct venus_format *fmt;
@@ -221,7 +223,8 @@ venc_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 	return fmt;
 }
 
-static int venc_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int venc_try_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct venus_inst *inst = to_inst(file);
 
@@ -230,7 +233,8 @@ static int venc_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int venc_s_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
@@ -299,7 +303,8 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int venc_g_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	struct venus_inst *inst = to_inst(file);
@@ -332,7 +337,8 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 }
 
 static int
-venc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+venc_g_selection(struct file *file, struct video_device_state *state,
+		 struct v4l2_selection *s)
 {
 	struct venus_inst *inst = to_inst(file);
 
@@ -360,7 +366,8 @@ venc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 }
 
 static int
-venc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+venc_s_selection(struct file *file, struct video_device_state *state,
+		 struct v4l2_selection *s)
 {
 	struct venus_inst *inst = to_inst(file);
 
@@ -388,7 +395,8 @@ venc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 	return 0;
 }
 
-static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int venc_s_parm(struct file *file, struct video_device_state *state,
+		       struct v4l2_streamparm *a)
 {
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_outputparm *out = &a->parm.output;
@@ -421,7 +429,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	return 0;
 }
 
-static int venc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int venc_g_parm(struct file *file, struct video_device_state *state,
+		       struct v4l2_streamparm *a)
 {
 	struct venus_inst *inst = to_inst(file);
 
@@ -435,7 +444,8 @@ static int venc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	return 0;
 }
 
-static int venc_enum_framesizes(struct file *file, void *fh,
+static int venc_enum_framesizes(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_frmsizeenum *fsize)
 {
 	struct venus_inst *inst = to_inst(file);
@@ -465,7 +475,8 @@ static int venc_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int venc_enum_frameintervals(struct file *file, void *fh,
+static int venc_enum_frameintervals(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_frmivalenum *fival)
 {
 	struct venus_inst *inst = to_inst(file);
@@ -524,13 +535,14 @@ static int venc_subscribe_event(struct v4l2_fh *fh,
 }
 
 static int
-venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
+venc_encoder_cmd(struct file *file, struct video_device_state *state,
+		 struct v4l2_encoder_cmd *cmd)
 {
 	struct venus_inst *inst = to_inst(file);
 	struct hfi_frame_data fdata = {0};
 	int ret = 0;
 
-	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, state, cmd);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index b30891718d8df9c48ce1b83ad9fcafb201105625..8f0d82d070bbc7b490183f3a665c9646158e5503 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -974,7 +974,8 @@ static const struct v4l2_file_operations pispbe_fops = {
 	.mmap           = vb2_fop_mmap
 };
 
-static int pispbe_node_querycap(struct file *file, void *priv,
+static int pispbe_node_querycap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	struct pispbe_node *node = video_drvdata(file);
@@ -990,7 +991,8 @@ static int pispbe_node_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int pispbe_node_g_fmt_vid_cap(struct file *file, void *priv,
+static int pispbe_node_g_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
@@ -1010,7 +1012,8 @@ static int pispbe_node_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int pispbe_node_g_fmt_vid_out(struct file *file, void *priv,
+static int pispbe_node_g_fmt_vid_out(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
@@ -1030,7 +1033,8 @@ static int pispbe_node_g_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int pispbe_node_g_fmt_meta_out(struct file *file, void *priv,
+static int pispbe_node_g_fmt_meta_out(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_format *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
@@ -1153,7 +1157,8 @@ static void pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
 	}
 }
 
-static int pispbe_node_try_fmt_vid_cap(struct file *file, void *priv,
+static int pispbe_node_try_fmt_vid_cap(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
@@ -1171,7 +1176,8 @@ static int pispbe_node_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int pispbe_node_try_fmt_vid_out(struct file *file, void *priv,
+static int pispbe_node_try_fmt_vid_out(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
@@ -1189,7 +1195,8 @@ static int pispbe_node_try_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int pispbe_node_try_fmt_meta_out(struct file *file, void *priv,
+static int pispbe_node_try_fmt_meta_out(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
@@ -1208,14 +1215,15 @@ static int pispbe_node_try_fmt_meta_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int pispbe_node_s_fmt_vid_cap(struct file *file, void *priv,
+static int pispbe_node_s_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
 	struct pispbe_dev *pispbe = node->pispbe;
 	int ret;
 
-	ret = pispbe_node_try_fmt_vid_cap(file, priv, f);
+	ret = pispbe_node_try_fmt_vid_cap(file, state, f);
 	if (ret < 0)
 		return ret;
 
@@ -1231,14 +1239,15 @@ static int pispbe_node_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int pispbe_node_s_fmt_vid_out(struct file *file, void *priv,
+static int pispbe_node_s_fmt_vid_out(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
 	struct pispbe_dev *pispbe = node->pispbe;
 	int ret;
 
-	ret = pispbe_node_try_fmt_vid_out(file, priv, f);
+	ret = pispbe_node_try_fmt_vid_out(file, state, f);
 	if (ret < 0)
 		return ret;
 
@@ -1254,14 +1263,15 @@ static int pispbe_node_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int pispbe_node_s_fmt_meta_out(struct file *file, void *priv,
+static int pispbe_node_s_fmt_meta_out(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_format *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
 	struct pispbe_dev *pispbe = node->pispbe;
 	int ret;
 
-	ret = pispbe_node_try_fmt_meta_out(file, priv, f);
+	ret = pispbe_node_try_fmt_meta_out(file, state, f);
 	if (ret < 0)
 		return ret;
 
@@ -1277,7 +1287,8 @@ static int pispbe_node_s_fmt_meta_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int pispbe_node_enum_fmt(struct file *file, void  *priv,
+static int pispbe_node_enum_fmt(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
@@ -1303,7 +1314,8 @@ static int pispbe_node_enum_fmt(struct file *file, void  *priv,
 	return 0;
 }
 
-static int pispbe_enum_framesizes(struct file *file, void *priv,
+static int pispbe_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct pispbe_node *node = video_drvdata(file);
diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 62dca76b468d1be4efa6fd4e68a89b9be0cc454b..9f4dd658ec2f1c55f61c686b84b9870666d8512f 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1324,7 +1324,8 @@ static const struct vb2_ops cfe_video_qops = {
  * v4l2 ioctl ops
  */
 
-static int cfe_querycap(struct file *file, void *priv,
+static int cfe_querycap(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, CFE_MODULE_NAME, sizeof(cap->driver));
@@ -1336,7 +1337,8 @@ static int cfe_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cfe_enum_fmt_vid_cap(struct file *file, void *priv,
+static int cfe_enum_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	struct cfe_node *node = video_drvdata(file);
@@ -1371,7 +1373,8 @@ static int cfe_enum_fmt_vid_cap(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int cfe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int cfe_g_fmt(struct file *file, struct video_device_state *state,
+		     struct v4l2_format *f)
 {
 	struct cfe_node *node = video_drvdata(file);
 
@@ -1417,7 +1420,8 @@ static int cfe_validate_fmt_vid_cap(struct cfe_node *node,
 	return 0;
 }
 
-static int cfe_s_fmt_vid_cap(struct file *file, void *priv,
+static int cfe_s_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct cfe_node *node = video_drvdata(file);
@@ -1441,7 +1445,8 @@ static int cfe_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cfe_try_fmt_vid_cap(struct file *file, void *priv,
+static int cfe_try_fmt_vid_cap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct cfe_node *node = video_drvdata(file);
@@ -1452,7 +1457,8 @@ static int cfe_try_fmt_vid_cap(struct file *file, void *priv,
 	return cfe_validate_fmt_vid_cap(node, f);
 }
 
-static int cfe_enum_fmt_meta(struct file *file, void *priv,
+static int cfe_enum_fmt_meta(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_fmtdesc *f)
 {
 	struct cfe_node *node = video_drvdata(file);
@@ -1547,7 +1553,8 @@ static int cfe_validate_fmt_meta(struct cfe_node *node, struct v4l2_format *f)
 	}
 }
 
-static int cfe_g_fmt_meta(struct file *file, void *priv, struct v4l2_format *f)
+static int cfe_g_fmt_meta(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct cfe_node *node = video_drvdata(file);
 	struct cfe_device *cfe = node->cfe;
@@ -1562,7 +1569,8 @@ static int cfe_g_fmt_meta(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int cfe_s_fmt_meta(struct file *file, void *priv, struct v4l2_format *f)
+static int cfe_s_fmt_meta(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct cfe_node *node = video_drvdata(file);
 	struct cfe_device *cfe = node->cfe;
@@ -1589,7 +1597,8 @@ static int cfe_s_fmt_meta(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int cfe_try_fmt_meta(struct file *file, void *priv,
+static int cfe_try_fmt_meta(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct cfe_node *node = video_drvdata(file);
@@ -1599,7 +1608,8 @@ static int cfe_try_fmt_meta(struct file *file, void *priv,
 	return cfe_validate_fmt_meta(node, f);
 }
 
-static int cfe_enum_framesizes(struct file *file, void *priv,
+static int cfe_enum_framesizes(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_frmsizeenum *fsize)
 {
 	struct cfe_node *node = video_drvdata(file);
@@ -1631,7 +1641,8 @@ static int cfe_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int cfe_vb2_ioctl_reqbufs(struct file *file, void *priv,
+static int cfe_vb2_ioctl_reqbufs(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_requestbuffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -1651,10 +1662,11 @@ static int cfe_vb2_ioctl_reqbufs(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return vb2_ioctl_reqbufs(file, priv, p);
+	return vb2_ioctl_reqbufs(file, state, p);
 }
 
-static int cfe_vb2_ioctl_create_bufs(struct file *file, void *priv,
+static int cfe_vb2_ioctl_create_bufs(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_create_buffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -1674,7 +1686,7 @@ static int cfe_vb2_ioctl_create_bufs(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return vb2_ioctl_create_bufs(file, priv, p);
+	return vb2_ioctl_create_bufs(file, state, p);
 }
 
 static int cfe_subscribe_event(struct v4l2_fh *fh,
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 079dbaf016c25139e2ac82be63d8fce0d11fd208..5f5dc1c9904e65a23dadb181cafda7db178486e0 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -229,7 +229,8 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
  * V4L2
  */
 
-static int rvin_querycap(struct file *file, void *priv,
+static int rvin_querycap(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
@@ -237,7 +238,8 @@ static int rvin_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rvin_g_fmt_vid_cap(struct file *file, void *priv,
+static int rvin_g_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct rvin_dev *vin = video_drvdata(file);
@@ -247,7 +249,8 @@ static int rvin_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
+static int rvin_enum_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	struct rvin_dev *vin = video_drvdata(file);
@@ -369,7 +372,8 @@ static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
 	return 0;
 }
 
-static int rvin_g_selection(struct file *file, void *fh,
+static int rvin_g_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *s)
 {
 	struct rvin_dev *vin = video_drvdata(file);
@@ -408,7 +412,8 @@ static int rvin_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int rvin_s_selection(struct file *file, void *fh,
+static int rvin_s_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *s)
 {
 	struct rvin_dev *vin = video_drvdata(file);
@@ -515,7 +520,8 @@ static void rvin_mc_try_format(struct rvin_dev *vin,
 	rvin_format_align(vin, pix);
 }
 
-static int rvin_mc_try_fmt_vid_cap(struct file *file, void *priv,
+static int rvin_mc_try_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct rvin_dev *vin = video_drvdata(file);
@@ -525,7 +531,8 @@ static int rvin_mc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rvin_mc_s_fmt_vid_cap(struct file *file, void *priv,
+static int rvin_mc_s_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct rvin_dev *vin = video_drvdata(file);
diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 11bf47fb8266dc45df40cac003f039582251b945..79d3af9c7b0da9e9b59c4f3e8e5535c4e3f73b48 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -863,7 +863,8 @@ static const struct vb2_ops rcar_drif_vb2_ops = {
 	.stop_streaming         = rcar_drif_stop_streaming,
 };
 
-static int rcar_drif_querycap(struct file *file, void *fh,
+static int rcar_drif_querycap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_capability *cap)
 {
 	struct rcar_drif_sdr *sdr = video_drvdata(file);
@@ -893,7 +894,8 @@ static int rcar_drif_set_default_format(struct rcar_drif_sdr *sdr)
 	return -EINVAL;
 }
 
-static int rcar_drif_enum_fmt_sdr_cap(struct file *file, void *priv,
+static int rcar_drif_enum_fmt_sdr_cap(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(formats))
@@ -904,7 +906,8 @@ static int rcar_drif_enum_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rcar_drif_g_fmt_sdr_cap(struct file *file, void *priv,
+static int rcar_drif_g_fmt_sdr_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct rcar_drif_sdr *sdr = video_drvdata(file);
@@ -915,7 +918,8 @@ static int rcar_drif_g_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rcar_drif_s_fmt_sdr_cap(struct file *file, void *priv,
+static int rcar_drif_s_fmt_sdr_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct rcar_drif_sdr *sdr = video_drvdata(file);
@@ -956,7 +960,8 @@ static int rcar_drif_s_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rcar_drif_try_fmt_sdr_cap(struct file *file, void *priv,
+static int rcar_drif_try_fmt_sdr_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	unsigned int i;
@@ -976,7 +981,8 @@ static int rcar_drif_try_fmt_sdr_cap(struct file *file, void *priv,
 }
 
 /* Tuner subdev ioctls */
-static int rcar_drif_enum_freq_bands(struct file *file, void *priv,
+static int rcar_drif_enum_freq_bands(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_frequency_band *band)
 {
 	struct rcar_drif_sdr *sdr = video_drvdata(file);
@@ -984,7 +990,8 @@ static int rcar_drif_enum_freq_bands(struct file *file, void *priv,
 	return v4l2_subdev_call(sdr->ep.subdev, tuner, enum_freq_bands, band);
 }
 
-static int rcar_drif_g_frequency(struct file *file, void *priv,
+static int rcar_drif_g_frequency(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_frequency *f)
 {
 	struct rcar_drif_sdr *sdr = video_drvdata(file);
@@ -992,7 +999,8 @@ static int rcar_drif_g_frequency(struct file *file, void *priv,
 	return v4l2_subdev_call(sdr->ep.subdev, tuner, g_frequency, f);
 }
 
-static int rcar_drif_s_frequency(struct file *file, void *priv,
+static int rcar_drif_s_frequency(struct file *file,
+				 struct video_device_state *state,
 				 const struct v4l2_frequency *f)
 {
 	struct rcar_drif_sdr *sdr = video_drvdata(file);
@@ -1000,7 +1008,8 @@ static int rcar_drif_s_frequency(struct file *file, void *priv,
 	return v4l2_subdev_call(sdr->ep.subdev, tuner, s_frequency, f);
 }
 
-static int rcar_drif_g_tuner(struct file *file, void *priv,
+static int rcar_drif_g_tuner(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_tuner *vt)
 {
 	struct rcar_drif_sdr *sdr = video_drvdata(file);
@@ -1008,7 +1017,8 @@ static int rcar_drif_g_tuner(struct file *file, void *priv,
 	return v4l2_subdev_call(sdr->ep.subdev, tuner, g_tuner, vt);
 }
 
-static int rcar_drif_s_tuner(struct file *file, void *priv,
+static int rcar_drif_s_tuner(struct file *file,
+			     struct video_device_state *state,
 			     const struct v4l2_tuner *vt)
 {
 	struct rcar_drif_sdr *sdr = video_drvdata(file);
diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index e615c56083f13b183be5b44764f24894f7539838..ef8054dbd40c79f583f1d7795f954d816dc3696b 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -1358,7 +1358,8 @@ static void device_frame_end(struct fdp1_dev *fdp1,
 /*
  * video ioctls
  */
-static int fdp1_vidioc_querycap(struct file *file, void *priv,
+static int fdp1_vidioc_querycap(struct file *file,
+				struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DRIVER_NAME, sizeof(cap->driver));
@@ -1392,19 +1393,22 @@ static int fdp1_enum_fmt(struct v4l2_fmtdesc *f, u32 type)
 	return 0;
 }
 
-static int fdp1_enum_fmt_vid_cap(struct file *file, void *priv,
+static int fdp1_enum_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	return fdp1_enum_fmt(f, FDP1_CAPTURE);
 }
 
-static int fdp1_enum_fmt_vid_out(struct file *file, void *priv,
+static int fdp1_enum_fmt_vid_out(struct file *file,
+				 struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return fdp1_enum_fmt(f, FDP1_OUTPUT);
 }
 
-static int fdp1_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int fdp1_g_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct fdp1_ctx *ctx = file_to_ctx(file);
 	struct fdp1_q_data *q_data;
@@ -1582,7 +1586,8 @@ static void fdp1_try_fmt_capture(struct fdp1_ctx *ctx,
 	fdp1_compute_stride(pix, fmt);
 }
 
-static int fdp1_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int fdp1_try_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct fdp1_ctx *ctx = file_to_ctx(file);
 
@@ -1653,7 +1658,8 @@ static void fdp1_set_format(struct fdp1_ctx *ctx,
 	}
 }
 
-static int fdp1_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int fdp1_s_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct fdp1_ctx *ctx = file_to_ctx(file);
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 46ea259a2bb9d3088a977f1140f48959fcde4518..244533a48878976fd850835c47add97b58827978 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -653,7 +653,8 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
 	return 0;
 }
 
-static int jpu_querycap(struct file *file, void *priv,
+static int jpu_querycap(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_capability *cap)
 {
 	struct jpu_ctx *ctx = file_to_ctx(file);
@@ -711,7 +712,8 @@ static int jpu_enum_fmt(struct v4l2_fmtdesc *f, u32 type)
 	return 0;
 }
 
-static int jpu_enum_fmt_cap(struct file *file, void *priv,
+static int jpu_enum_fmt_cap(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_fmtdesc *f)
 {
 	struct jpu_ctx *ctx = file_to_ctx(file);
@@ -720,7 +722,8 @@ static int jpu_enum_fmt_cap(struct file *file, void *priv,
 			    JPU_DEC_CAPTURE);
 }
 
-static int jpu_enum_fmt_out(struct file *file, void *priv,
+static int jpu_enum_fmt_out(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_fmtdesc *f)
 {
 	struct jpu_ctx *ctx = file_to_ctx(file);
@@ -821,7 +824,8 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct jpu_fmt **fmtinfo,
 	return 0;
 }
 
-static int jpu_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int jpu_try_fmt(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f)
 {
 	struct jpu_ctx *ctx = file_to_ctx(file);
 
@@ -831,7 +835,8 @@ static int jpu_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return __jpu_try_fmt(ctx, NULL, &f->fmt.pix_mp, f->type);
 }
 
-static int jpu_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int jpu_s_fmt(struct file *file, struct video_device_state *state,
+		     struct v4l2_format *f)
 {
 	struct vb2_queue *vq;
 	struct jpu_ctx *ctx = file_to_ctx(file);
@@ -861,7 +866,8 @@ static int jpu_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int jpu_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int jpu_g_fmt(struct file *file, struct video_device_state *state,
+		     struct v4l2_format *f)
 {
 	struct jpu_ctx *ctx = file_to_ctx(file);
 	struct jpu_q_data *q_data;
@@ -895,7 +901,8 @@ static const struct v4l2_ctrl_ops jpu_ctrl_ops = {
 	.s_ctrl		= jpu_s_ctrl,
 };
 
-static int jpu_streamon(struct file *file, void *priv, enum v4l2_buf_type type)
+static int jpu_streamon(struct file *file, struct video_device_state *state,
+			enum v4l2_buf_type type)
 {
 	struct jpu_q_data *src_q_data, *dst_q_data, *orig, adj, *ref;
 	struct jpu_ctx *ctx = file_to_ctx(file);
diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index deed49d0fb10e0d7834a30293f6c1ede7055409a..b21cdc118dc70654cf8f87a1ad00228697aefe69 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1121,7 +1121,8 @@ static const struct v4l2_file_operations ceu_fops = {
 
 /* --- Video Device IOCTLs --- */
 
-static int ceu_querycap(struct file *file, void *priv,
+static int ceu_querycap(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_capability *cap)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
@@ -1134,7 +1135,8 @@ static int ceu_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ceu_enum_fmt_vid_cap(struct file *file, void *priv,
+static int ceu_enum_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	const struct ceu_fmt *fmt;
@@ -1148,7 +1150,8 @@ static int ceu_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ceu_try_fmt_vid_cap(struct file *file, void *priv,
+static int ceu_try_fmt_vid_cap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
@@ -1156,7 +1159,8 @@ static int ceu_try_fmt_vid_cap(struct file *file, void *priv,
 	return ceu_try_fmt(ceudev, f);
 }
 
-static int ceu_s_fmt_vid_cap(struct file *file, void *priv,
+static int ceu_s_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
@@ -1167,7 +1171,8 @@ static int ceu_s_fmt_vid_cap(struct file *file, void *priv,
 	return ceu_set_fmt(ceudev, f);
 }
 
-static int ceu_g_fmt_vid_cap(struct file *file, void *priv,
+static int ceu_g_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
@@ -1177,7 +1182,8 @@ static int ceu_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ceu_enum_input(struct file *file, void *priv,
+static int ceu_enum_input(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_input *inp)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
@@ -1192,7 +1198,8 @@ static int ceu_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int ceu_g_input(struct file *file, void *priv, unsigned int *i)
+static int ceu_g_input(struct file *file, struct video_device_state *state,
+		       unsigned int *i)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
 
@@ -1201,7 +1208,8 @@ static int ceu_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int ceu_s_input(struct file *file, void *priv, unsigned int i)
+static int ceu_s_input(struct file *file, struct video_device_state *state,
+		       unsigned int i)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
 	struct ceu_subdev *ceu_sd_old;
@@ -1244,21 +1252,24 @@ static int ceu_s_input(struct file *file, void *priv, unsigned int i)
 	return 0;
 }
 
-static int ceu_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int ceu_g_parm(struct file *file, struct video_device_state *state,
+		      struct v4l2_streamparm *a)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
 
 	return v4l2_g_parm_cap(video_devdata(file), ceudev->sd->v4l2_sd, a);
 }
 
-static int ceu_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int ceu_s_parm(struct file *file, struct video_device_state *state,
+		      struct v4l2_streamparm *a)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
 
 	return v4l2_s_parm_cap(video_devdata(file), ceudev->sd->v4l2_sd, a);
 }
 
-static int ceu_enum_framesizes(struct file *file, void *fh,
+static int ceu_enum_framesizes(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_frmsizeenum *fsize)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
@@ -1290,7 +1301,8 @@ static int ceu_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int ceu_enum_frameintervals(struct file *file, void *fh,
+static int ceu_enum_frameintervals(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_frmivalenum *fival)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931840ee052e1565587d021fc87307f..4f2e5a99c5cd142b21a2cf29a79dbf73463061b6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -951,7 +951,8 @@ static void rzg2l_cru_try_format(struct rzg2l_cru_dev *cru,
 	rzg2l_cru_format_align(cru, pix);
 }
 
-static int rzg2l_cru_querycap(struct file *file, void *priv,
+static int rzg2l_cru_querycap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
@@ -960,7 +961,8 @@ static int rzg2l_cru_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rzg2l_cru_try_fmt_vid_cap(struct file *file, void *priv,
+static int rzg2l_cru_try_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct rzg2l_cru_dev *cru = video_drvdata(file);
@@ -970,7 +972,8 @@ static int rzg2l_cru_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rzg2l_cru_s_fmt_vid_cap(struct file *file, void *priv,
+static int rzg2l_cru_s_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct rzg2l_cru_dev *cru = video_drvdata(file);
@@ -985,7 +988,8 @@ static int rzg2l_cru_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rzg2l_cru_g_fmt_vid_cap(struct file *file, void *priv,
+static int rzg2l_cru_g_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct rzg2l_cru_dev *cru = video_drvdata(file);
@@ -995,7 +999,8 @@ static int rzg2l_cru_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
+static int rzg2l_cru_enum_fmt_vid_cap(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_fmtdesc *f)
 {
 	const struct rzg2l_cru_ip_format *fmt;
@@ -1009,7 +1014,8 @@ static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rzg2l_cru_enum_framesizes(struct file *file, void *fh,
+static int rzg2l_cru_enum_framesizes(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_frmsizeenum *fsize)
 {
 	struct rzg2l_cru_dev *cru = video_drvdata(file);
diff --git a/drivers/media/platform/renesas/sh_vou.c b/drivers/media/platform/renesas/sh_vou.c
index 4ad7ae188d5b25ab383d664898f855a4819c1a85..5f4efa852269a4054d8f0c91a4194509e1966a81 100644
--- a/drivers/media/platform/renesas/sh_vou.c
+++ b/drivers/media/platform/renesas/sh_vou.c
@@ -363,7 +363,8 @@ static const struct vb2_ops sh_vou_qops = {
 };
 
 /* Video IOCTLs */
-static int sh_vou_querycap(struct file *file, void  *priv,
+static int sh_vou_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct sh_vou_device *vou_dev = video_drvdata(file);
@@ -377,7 +378,8 @@ static int sh_vou_querycap(struct file *file, void  *priv,
 }
 
 /* Enumerate formats, that the device can accept from the user */
-static int sh_vou_enum_fmt_vid_out(struct file *file, void  *priv,
+static int sh_vou_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *fmt)
 {
 	struct sh_vou_device *vou_dev = video_drvdata(file);
@@ -392,7 +394,8 @@ static int sh_vou_enum_fmt_vid_out(struct file *file, void  *priv,
 	return 0;
 }
 
-static int sh_vou_g_fmt_vid_out(struct file *file, void *priv,
+static int sh_vou_g_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct sh_vou_device *vou_dev = video_drvdata(file);
@@ -646,7 +649,8 @@ static void vou_adjust_output(struct sh_vou_geometry *geo, v4l2_std_id std)
 		 vou_scale_v_num[idx_v], vou_scale_v_den[idx_v], best);
 }
 
-static int sh_vou_try_fmt_vid_out(struct file *file, void *priv,
+static int sh_vou_try_fmt_vid_out(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *fmt)
 {
 	struct sh_vou_device *vou_dev = video_drvdata(file);
@@ -759,18 +763,20 @@ static int sh_vou_set_fmt_vid_out(struct sh_vou_device *vou_dev,
 	return 0;
 }
 
-static int sh_vou_s_fmt_vid_out(struct file *file, void *priv,
+static int sh_vou_s_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct sh_vou_device *vou_dev = video_drvdata(file);
-	int ret = sh_vou_try_fmt_vid_out(file, priv, fmt);
+	int ret = sh_vou_try_fmt_vid_out(file, state, fmt);
 
 	if (ret)
 		return ret;
 	return sh_vou_set_fmt_vid_out(vou_dev, &fmt->fmt.pix);
 }
 
-static int sh_vou_enum_output(struct file *file, void *fh,
+static int sh_vou_enum_output(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_output *a)
 {
 	struct sh_vou_device *vou_dev = video_drvdata(file);
@@ -783,13 +789,15 @@ static int sh_vou_enum_output(struct file *file, void *fh,
 	return 0;
 }
 
-static int sh_vou_g_output(struct file *file, void *fh, unsigned int *i)
+static int sh_vou_g_output(struct file *file,
+			   struct video_device_state *state, unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int sh_vou_s_output(struct file *file, void *fh, unsigned int i)
+static int sh_vou_s_output(struct file *file,
+			   struct video_device_state *state, unsigned int i)
 {
 	return i ? -EINVAL : 0;
 }
@@ -810,7 +818,8 @@ static u32 sh_vou_ntsc_mode(enum sh_vou_bus_fmt bus_fmt)
 	}
 }
 
-static int sh_vou_s_std(struct file *file, void *priv, v4l2_std_id std_id)
+static int sh_vou_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id std_id)
 {
 	struct sh_vou_device *vou_dev = video_drvdata(file);
 	int ret;
@@ -852,7 +861,8 @@ static int sh_vou_s_std(struct file *file, void *priv, v4l2_std_id std_id)
 	return 0;
 }
 
-static int sh_vou_g_std(struct file *file, void *priv, v4l2_std_id *std)
+static int sh_vou_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *std)
 {
 	struct sh_vou_device *vou_dev = video_drvdata(file);
 
@@ -863,7 +873,8 @@ static int sh_vou_g_std(struct file *file, void *priv, v4l2_std_id *std)
 	return 0;
 }
 
-static int sh_vou_log_status(struct file *file, void *priv)
+static int sh_vou_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct sh_vou_device *vou_dev = video_drvdata(file);
 
@@ -890,7 +901,8 @@ static int sh_vou_log_status(struct file *file, void *priv)
 	return 0;
 }
 
-static int sh_vou_g_selection(struct file *file, void *fh,
+static int sh_vou_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *sel)
 {
 	struct sh_vou_device *vou_dev = video_drvdata(file);
@@ -918,7 +930,8 @@ static int sh_vou_g_selection(struct file *file, void *fh,
 }
 
 /* Assume a dull encoder, do all the work ourselves. */
-static int sh_vou_s_selection(struct file *file, void *fh,
+static int sh_vou_s_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *sel)
 {
 	struct v4l2_rect *rect = &sel->r;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index 390ea50f1595ad7702bec46e9b9f3e237c73a622..69091fa5a7cd46f23ccb4f50a55901b12b6e13cb 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -389,7 +389,8 @@ static const struct v4l2_subdev_ops histo_ops = {
  * V4L2 ioctls
  */
 
-static int histo_v4l2_querycap(struct file *file, void *fh,
+static int histo_v4l2_querycap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_capability *cap)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -406,7 +407,8 @@ static int histo_v4l2_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int histo_v4l2_enum_format(struct file *file, void *fh,
+static int histo_v4l2_enum_format(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_fmtdesc *f)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -420,7 +422,8 @@ static int histo_v4l2_enum_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int histo_v4l2_get_format(struct file *file, void *fh,
+static int histo_v4l2_get_format(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 75f9a1a85d558ff0afa2fdaf8c43a22ddbd694a8..9130f46e433a79c1ac2848fc347067f6c3f41c28 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -894,7 +894,8 @@ static const struct vb2_ops vsp1_video_queue_qops = {
  */
 
 static int
-vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+vsp1_video_querycap(struct file *file, struct video_device_state *state,
+		    struct v4l2_capability *cap)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
@@ -909,7 +910,8 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	return 0;
 }
 
-static int vsp1_video_enum_format(struct file *file, void *fh,
+static int vsp1_video_enum_format(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_fmtdesc *f)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -931,7 +933,8 @@ static int vsp1_video_enum_format(struct file *file, void *fh,
 }
 
 static int
-vsp1_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
+vsp1_video_get_format(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
@@ -947,7 +950,8 @@ vsp1_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 }
 
 static int
-vsp1_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
+vsp1_video_try_format(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
@@ -959,7 +963,8 @@ vsp1_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
 }
 
 static int
-vsp1_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
+vsp1_video_set_format(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
@@ -989,7 +994,8 @@ vsp1_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
 }
 
 static int
-vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
+vsp1_video_streamon(struct file *file, struct video_device_state *state,
+		    enum v4l2_buf_type type)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 776046de979aa0ded6734216bf179c32ae8fe5a9..87d01ed5c3ddcf3d12b09021bd43c2cfc68f8eef 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -437,7 +437,8 @@ static const struct v4l2_file_operations rga_fops = {
 };
 
 static int
-vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+vidioc_querycap(struct file *file, struct video_device_state *state,
+		struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, RGA_NAME, sizeof(cap->driver));
 	strscpy(cap->card, "rockchip-rga", sizeof(cap->card));
@@ -446,7 +447,9 @@ vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 	return 0;
 }
 
-static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_fmtdesc *f)
 {
 	struct rga_fmt *fmt;
 
@@ -459,7 +462,8 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 	return 0;
 }
 
-static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
@@ -481,7 +485,8 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_fmt *fmt;
@@ -501,7 +506,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_s_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
@@ -514,7 +520,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	/* Adjust all values accordingly to the hardware capabilities
 	 * and chosen format.
 	 */
-	ret = vidioc_try_fmt(file, priv, f);
+	ret = vidioc_try_fmt(file, state, f);
 	if (ret)
 		return ret;
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
@@ -558,7 +564,8 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_g_selection(struct file *file, void *priv,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
@@ -606,7 +613,8 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_selection(struct file *file, void *priv,
+static int vidioc_s_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 6dcefd144d5abe358323e37ac6133c6134ac636e..38541f482b2d0dcf23546a0b9f893fb8544bcc40 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1326,7 +1326,8 @@ static void rkisp1_set_fmt(struct rkisp1_capture *cap,
 	cap->stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
 }
 
-static int rkisp1_try_fmt_vid_cap_mplane(struct file *file, void *fh,
+static int rkisp1_try_fmt_vid_cap_mplane(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_format *f)
 {
 	struct rkisp1_capture *cap = video_drvdata(file);
@@ -1336,7 +1337,8 @@ static int rkisp1_try_fmt_vid_cap_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int rkisp1_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
+static int rkisp1_enum_fmt_vid_cap_mplane(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_fmtdesc *f)
 {
 	struct rkisp1_capture *cap = video_drvdata(file);
@@ -1370,7 +1372,8 @@ static int rkisp1_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int rkisp1_enum_framesizes(struct file *file, void *fh,
+static int rkisp1_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	static const unsigned int max_widths[] = {
@@ -1400,7 +1403,8 @@ static int rkisp1_enum_framesizes(struct file *file, void *fh,
 }
 
 static int rkisp1_s_fmt_vid_cap_mplane(struct file *file,
-				       void *priv, struct v4l2_format *f)
+				       struct video_device_state *state,
+				       struct v4l2_format *f)
 {
 	struct rkisp1_capture *cap = video_drvdata(file);
 	struct rkisp1_vdev_node *node =
@@ -1414,7 +1418,8 @@ static int rkisp1_s_fmt_vid_cap_mplane(struct file *file,
 	return 0;
 }
 
-static int rkisp1_g_fmt_vid_cap_mplane(struct file *file, void *fh,
+static int rkisp1_g_fmt_vid_cap_mplane(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	struct rkisp1_capture *cap = video_drvdata(file);
@@ -1425,7 +1430,8 @@ static int rkisp1_g_fmt_vid_cap_mplane(struct file *file, void *fh,
 }
 
 static int
-rkisp1_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+rkisp1_querycap(struct file *file, struct video_device_state *state,
+		struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, RKISP1_DRIVER_NAME, sizeof(cap->driver));
 	strscpy(cap->card, RKISP1_DRIVER_NAME, sizeof(cap->card));
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index f1585f8fa0f478304f74317fd9dd09199c94ec82..83dae25e3c10a0df437b5052ccae64221f460899 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2493,7 +2493,8 @@ static const struct rkisp1_params_ops rkisp1_v12_params_ops = {
 	.afm_config = rkisp1_afm_config_v12,
 };
 
-static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
+static int rkisp1_params_enum_fmt_meta_out(struct file *file,
+					   struct video_device_state *state,
 					   struct v4l2_fmtdesc *f)
 {
 	struct video_device *video = video_devdata(file);
@@ -2507,7 +2508,8 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
+static int rkisp1_params_g_fmt_meta_out(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct video_device *video = video_devdata(file);
@@ -2522,7 +2524,8 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
 	return 0;
 }
 
-static int rkisp1_params_try_fmt_meta_out(struct file *file, void *fh,
+static int rkisp1_params_try_fmt_meta_out(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_format *f)
 {
 	struct video_device *video = video_devdata(file);
@@ -2536,7 +2539,8 @@ static int rkisp1_params_try_fmt_meta_out(struct file *file, void *fh,
 	return 0;
 }
 
-static int rkisp1_params_s_fmt_meta_out(struct file *file, void *fh,
+static int rkisp1_params_s_fmt_meta_out(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct video_device *video = video_devdata(file);
@@ -2556,7 +2560,8 @@ static int rkisp1_params_s_fmt_meta_out(struct file *file, void *fh,
 }
 
 static int rkisp1_params_querycap(struct file *file,
-				  void *priv, struct v4l2_capability *cap)
+				  struct video_device_state *state,
+				  struct v4l2_capability *cap)
 {
 	struct video_device *vdev = video_devdata(file);
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index d5fdb8f82dc78b0143f71d76f36817db389921b7..043f23ed9cbd12816f3355e54de830a1e7429aa9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -18,7 +18,8 @@
 #define RKISP1_ISP_STATS_REQ_BUFS_MIN 2
 #define RKISP1_ISP_STATS_REQ_BUFS_MAX 8
 
-static int rkisp1_stats_enum_fmt_meta_cap(struct file *file, void *priv,
+static int rkisp1_stats_enum_fmt_meta_cap(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_fmtdesc *f)
 {
 	struct video_device *video = video_devdata(file);
@@ -31,7 +32,8 @@ static int rkisp1_stats_enum_fmt_meta_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkisp1_stats_g_fmt_meta_cap(struct file *file, void *priv,
+static int rkisp1_stats_g_fmt_meta_cap(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	struct video_device *video = video_devdata(file);
@@ -49,7 +51,8 @@ static int rkisp1_stats_g_fmt_meta_cap(struct file *file, void *priv,
 }
 
 static int rkisp1_stats_querycap(struct file *file,
-				 void *priv, struct v4l2_capability *cap)
+				 struct video_device_state *state,
+				 struct v4l2_capability *cap)
 {
 	struct video_device *vdev = video_devdata(file);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 9fa80ab3c62b7753e6c992aefd106ee99ed375e4..c87e206a65f0b33c10bf71b3d64c46bdb62ebd40 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -313,7 +313,8 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 		ctx->coded_fmt_desc->ops->adjust_fmt(ctx, f);
 }
 
-static int rkvdec_enum_framesizes(struct file *file, void *priv,
+static int rkvdec_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	const struct rkvdec_coded_fmt_desc *fmt;
@@ -336,7 +337,8 @@ static int rkvdec_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkvdec_querycap(struct file *file, void *priv,
+static int rkvdec_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct rkvdec_dev *rkvdec = video_drvdata(file);
@@ -350,7 +352,8 @@ static int rkvdec_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkvdec_try_capture_fmt(struct file *file, void *priv,
+static int rkvdec_try_capture_fmt(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -383,7 +386,8 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkvdec_try_output_fmt(struct file *file, void *priv,
+static int rkvdec_try_output_fmt(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -415,7 +419,8 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkvdec_s_capture_fmt(struct file *file, void *priv,
+static int rkvdec_s_capture_fmt(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
@@ -428,7 +433,7 @@ static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 	if (vb2_is_busy(vq))
 		return -EBUSY;
 
-	ret = rkvdec_try_capture_fmt(file, priv, f);
+	ret = rkvdec_try_capture_fmt(file, state, f);
 	if (ret)
 		return ret;
 
@@ -436,7 +441,8 @@ static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkvdec_s_output_fmt(struct file *file, void *priv,
+static int rkvdec_s_output_fmt(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
@@ -466,7 +472,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 	if (vb2_is_busy(peer_vq))
 		return -EBUSY;
 
-	ret = rkvdec_try_output_fmt(file, priv, f);
+	ret = rkvdec_try_output_fmt(file, state, f);
 	if (ret)
 		return ret;
 
@@ -501,7 +507,8 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkvdec_g_output_fmt(struct file *file, void *priv,
+static int rkvdec_g_output_fmt(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
@@ -510,7 +517,8 @@ static int rkvdec_g_output_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkvdec_g_capture_fmt(struct file *file, void *priv,
+static int rkvdec_g_capture_fmt(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
@@ -519,7 +527,8 @@ static int rkvdec_g_capture_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkvdec_enum_output_fmt(struct file *file, void *priv,
+static int rkvdec_enum_output_fmt(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(rkvdec_coded_fmts))
@@ -529,7 +538,8 @@ static int rkvdec_enum_output_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
+static int rkvdec_enum_capture_fmt(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
index 722e2531e23f1bc01f5e9a9c08dfe4745cc2aa4f..964c0121aee162b2fc2b6b6b2fbe8e21ccc9da4e 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
@@ -280,7 +280,8 @@ static const struct vb2_ops gsc_m2m_qops = {
 	.start_streaming = gsc_m2m_start_streaming,
 };
 
-static int gsc_m2m_querycap(struct file *file, void *fh,
+static int gsc_m2m_querycap(struct file *file,
+			    struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, GSC_MODULE_NAME, sizeof(cap->driver));
@@ -288,13 +289,15 @@ static int gsc_m2m_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int gsc_m2m_enum_fmt(struct file *file, void *priv,
+static int gsc_m2m_enum_fmt(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_fmtdesc *f)
 {
 	return gsc_enum_fmt(f);
 }
 
-static int gsc_m2m_g_fmt_mplane(struct file *file, void *fh,
+static int gsc_m2m_g_fmt_mplane(struct file *file,
+				struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
@@ -302,7 +305,8 @@ static int gsc_m2m_g_fmt_mplane(struct file *file, void *fh,
 	return gsc_g_fmt_mplane(ctx, f);
 }
 
-static int gsc_m2m_try_fmt_mplane(struct file *file, void *fh,
+static int gsc_m2m_try_fmt_mplane(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
@@ -310,7 +314,8 @@ static int gsc_m2m_try_fmt_mplane(struct file *file, void *fh,
 	return gsc_try_fmt_mplane(ctx, f);
 }
 
-static int gsc_m2m_s_fmt_mplane(struct file *file, void *fh,
+static int gsc_m2m_s_fmt_mplane(struct file *file,
+				struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
@@ -319,7 +324,7 @@ static int gsc_m2m_s_fmt_mplane(struct file *file, void *fh,
 	struct v4l2_pix_format_mplane *pix;
 	int i, ret = 0;
 
-	ret = gsc_m2m_try_fmt_mplane(file, fh, f);
+	ret = gsc_m2m_try_fmt_mplane(file, state, f);
 	if (ret)
 		return ret;
 
@@ -356,7 +361,8 @@ static int gsc_m2m_s_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int gsc_m2m_reqbufs(struct file *file, void *fh,
+static int gsc_m2m_reqbufs(struct file *file,
+			   struct video_device_state *state,
 			  struct v4l2_requestbuffers *reqbufs)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
@@ -371,35 +377,40 @@ static int gsc_m2m_reqbufs(struct file *file, void *fh,
 	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
 }
 
-static int gsc_m2m_expbuf(struct file *file, void *fh,
+static int gsc_m2m_expbuf(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_exportbuffer *eb)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_expbuf(file, ctx->m2m_ctx, eb);
 }
 
-static int gsc_m2m_querybuf(struct file *file, void *fh,
+static int gsc_m2m_querybuf(struct file *file,
+			    struct video_device_state *state,
 					struct v4l2_buffer *buf)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_querybuf(file, ctx->m2m_ctx, buf);
 }
 
-static int gsc_m2m_qbuf(struct file *file, void *fh,
+static int gsc_m2m_qbuf(struct file *file,
+			struct video_device_state *state,
 			  struct v4l2_buffer *buf)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
 }
 
-static int gsc_m2m_dqbuf(struct file *file, void *fh,
+static int gsc_m2m_dqbuf(struct file *file,
+			 struct video_device_state *state,
 			   struct v4l2_buffer *buf)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
 }
 
-static int gsc_m2m_streamon(struct file *file, void *fh,
+static int gsc_m2m_streamon(struct file *file,
+			    struct video_device_state *state,
 			   enum v4l2_buf_type type)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
@@ -415,7 +426,8 @@ static int gsc_m2m_streamon(struct file *file, void *fh,
 	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
 }
 
-static int gsc_m2m_streamoff(struct file *file, void *fh,
+static int gsc_m2m_streamoff(struct file *file,
+			     struct video_device_state *state,
 			    enum v4l2_buf_type type)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
@@ -437,7 +449,8 @@ static int is_rectangle_enclosed(struct v4l2_rect *a, struct v4l2_rect *b)
 	return 1;
 }
 
-static int gsc_m2m_g_selection(struct file *file, void *fh,
+static int gsc_m2m_g_selection(struct file *file,
+			       struct video_device_state *state,
 			struct v4l2_selection *s)
 {
 	struct gsc_ctx *ctx = file_to_ctx(file);
@@ -474,7 +487,8 @@ static int gsc_m2m_g_selection(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int gsc_m2m_s_selection(struct file *file, void *fh,
+static int gsc_m2m_s_selection(struct file *file,
+			       struct video_device_state *state,
 				struct v4l2_selection *s)
 {
 	struct gsc_frame *frame;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index 5b412afd7d6052f7491ccf596121025a4fc49f41..1e08ce33856d38ad51e540d654beeb06419cb49d 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -708,7 +708,8 @@ static void fimc_capture_try_selection(struct fimc_ctx *ctx,
 /*
  * The video node ioctl operations
  */
-static int fimc_cap_querycap(struct file *file, void *priv,
+static int fimc_cap_querycap(struct file *file,
+			     struct video_device_state *state,
 					struct v4l2_capability *cap)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
@@ -717,7 +718,8 @@ static int fimc_cap_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int fimc_cap_enum_fmt(struct file *file, void *priv,
+static int fimc_cap_enum_fmt(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_fmtdesc *f)
 {
 	const struct fimc_fmt *fmt;
@@ -885,7 +887,8 @@ static int fimc_get_sensor_frame_desc(struct v4l2_subdev *sensor,
 	return 0;
 }
 
-static int fimc_cap_g_fmt_mplane(struct file *file, void *fh,
+static int fimc_cap_g_fmt_mplane(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
@@ -980,7 +983,8 @@ static int __video_try_or_set_format(struct fimc_dev *fimc,
 	return ret;
 }
 
-static int fimc_cap_try_fmt_mplane(struct file *file, void *fh,
+static int fimc_cap_try_fmt_mplane(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
@@ -1045,7 +1049,8 @@ static int __fimc_capture_set_format(struct fimc_dev *fimc,
 	return ret;
 }
 
-static int fimc_cap_s_fmt_mplane(struct file *file, void *priv,
+static int fimc_cap_s_fmt_mplane(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
@@ -1053,7 +1058,8 @@ static int fimc_cap_s_fmt_mplane(struct file *file, void *priv,
 	return __fimc_capture_set_format(fimc, f);
 }
 
-static int fimc_cap_enum_input(struct file *file, void *priv,
+static int fimc_cap_enum_input(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_input *i)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
@@ -1074,12 +1080,14 @@ static int fimc_cap_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int fimc_cap_s_input(struct file *file, void *priv, unsigned int i)
+static int fimc_cap_s_input(struct file *file,
+			    struct video_device_state *state, unsigned int i)
 {
 	return i == 0 ? i : -EINVAL;
 }
 
-static int fimc_cap_g_input(struct file *file, void *priv, unsigned int *i)
+static int fimc_cap_g_input(struct file *file,
+			    struct video_device_state *state, unsigned int *i)
 {
 	*i = 0;
 	return 0;
@@ -1173,7 +1181,8 @@ static int fimc_pipeline_validate(struct fimc_dev *fimc)
 	return 0;
 }
 
-static int fimc_cap_streamon(struct file *file, void *priv,
+static int fimc_cap_streamon(struct file *file,
+			     struct video_device_state *state,
 			     enum v4l2_buf_type type)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
@@ -1212,7 +1221,7 @@ static int fimc_cap_streamon(struct file *file, void *priv,
 			goto err_p_stop;
 	}
 
-	ret = vb2_ioctl_streamon(file, priv, type);
+	ret = vb2_ioctl_streamon(file, state, type);
 	if (!ret) {
 		vc->streaming = true;
 		return ret;
@@ -1223,14 +1232,15 @@ static int fimc_cap_streamon(struct file *file, void *priv,
 	return ret;
 }
 
-static int fimc_cap_streamoff(struct file *file, void *priv,
+static int fimc_cap_streamoff(struct file *file,
+			      struct video_device_state *state,
 			    enum v4l2_buf_type type)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
 	struct fimc_vid_cap *vc = &fimc->vid_cap;
 	int ret;
 
-	ret = vb2_ioctl_streamoff(file, priv, type);
+	ret = vb2_ioctl_streamoff(file, state, type);
 	if (ret < 0)
 		return ret;
 
@@ -1242,13 +1252,14 @@ static int fimc_cap_streamoff(struct file *file, void *priv,
 	return 0;
 }
 
-static int fimc_cap_reqbufs(struct file *file, void *priv,
+static int fimc_cap_reqbufs(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_requestbuffers *reqbufs)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
 	int ret;
 
-	ret = vb2_ioctl_reqbufs(file, priv, reqbufs);
+	ret = vb2_ioctl_reqbufs(file, state, reqbufs);
 
 	if (!ret)
 		fimc->vid_cap.reqbufs_count = reqbufs->count;
@@ -1256,7 +1267,8 @@ static int fimc_cap_reqbufs(struct file *file, void *priv,
 	return ret;
 }
 
-static int fimc_cap_g_selection(struct file *file, void *fh,
+static int fimc_cap_g_selection(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_selection *s)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
@@ -1293,7 +1305,8 @@ static int fimc_cap_g_selection(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int fimc_cap_s_selection(struct file *file, void *fh,
+static int fimc_cap_s_selection(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_selection *s)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
index ad219ac1b95137a703ea709d12139cca6b2e2332..1a985a9b6c56e4f03977df277328961c62854703 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
@@ -342,7 +342,8 @@ static const struct v4l2_file_operations isp_video_fops = {
 /*
  * Video node ioctl operations
  */
-static int isp_video_querycap(struct file *file, void *priv,
+static int isp_video_querycap(struct file *file,
+			      struct video_device_state *state,
 					struct v4l2_capability *cap)
 {
 	struct fimc_isp *isp = video_drvdata(file);
@@ -351,7 +352,8 @@ static int isp_video_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int isp_video_enum_fmt(struct file *file, void *priv,
+static int isp_video_enum_fmt(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_fmtdesc *f)
 {
 	const struct fimc_fmt *fmt;
@@ -368,7 +370,8 @@ static int isp_video_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int isp_video_g_fmt_mplane(struct file *file, void *fh,
+static int isp_video_g_fmt_mplane(struct file *file,
+				  struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct fimc_isp *isp = video_drvdata(file);
@@ -402,7 +405,8 @@ static void __isp_video_try_fmt(struct fimc_isp *isp,
 			      FIMC_ISP_SOURCE_HEIGHT_MAX, 0, 0);
 }
 
-static int isp_video_try_fmt_mplane(struct file *file, void *fh,
+static int isp_video_try_fmt_mplane(struct file *file,
+				    struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct fimc_isp *isp = video_drvdata(file);
@@ -411,7 +415,8 @@ static int isp_video_try_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int isp_video_s_fmt_mplane(struct file *file, void *priv,
+static int isp_video_s_fmt_mplane(struct file *file,
+				  struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct fimc_isp *isp = video_drvdata(file);
@@ -487,7 +492,8 @@ static int isp_video_pipeline_validate(struct fimc_isp *isp)
 	return 0;
 }
 
-static int isp_video_streamon(struct file *file, void *priv,
+static int isp_video_streamon(struct file *file,
+			      struct video_device_state *state,
 				      enum v4l2_buf_type type)
 {
 	struct fimc_isp *isp = video_drvdata(file);
@@ -502,7 +508,7 @@ static int isp_video_streamon(struct file *file, void *priv,
 	if (ret < 0)
 		goto p_stop;
 
-	ret = vb2_ioctl_streamon(file, priv, type);
+	ret = vb2_ioctl_streamon(file, state, type);
 	if (ret < 0)
 		goto p_stop;
 
@@ -513,14 +519,15 @@ static int isp_video_streamon(struct file *file, void *priv,
 	return ret;
 }
 
-static int isp_video_streamoff(struct file *file, void *priv,
+static int isp_video_streamoff(struct file *file,
+			       struct video_device_state *state,
 					enum v4l2_buf_type type)
 {
 	struct fimc_isp *isp = video_drvdata(file);
 	struct fimc_is_video *video = &isp->video_capture;
 	int ret;
 
-	ret = vb2_ioctl_streamoff(file, priv, type);
+	ret = vb2_ioctl_streamoff(file, state, type);
 	if (ret < 0)
 		return ret;
 
@@ -529,19 +536,20 @@ static int isp_video_streamoff(struct file *file, void *priv,
 	return 0;
 }
 
-static int isp_video_reqbufs(struct file *file, void *priv,
+static int isp_video_reqbufs(struct file *file,
+			     struct video_device_state *state,
 				struct v4l2_requestbuffers *rb)
 {
 	struct fimc_isp *isp = video_drvdata(file);
 	int ret;
 
-	ret = vb2_ioctl_reqbufs(file, priv, rb);
+	ret = vb2_ioctl_reqbufs(file, state, rb);
 	if (ret < 0)
 		return ret;
 
 	if (rb->count && rb->count < FIMC_ISP_REQ_BUFS_MIN) {
 		rb->count = 0;
-		vb2_ioctl_reqbufs(file, priv, rb);
+		vb2_ioctl_reqbufs(file, state, rb);
 		ret = -ENOMEM;
 	}
 
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index 0ce293b0718b6a496b06275ebe778f118951d7bf..8b22b68b00b05f336c7881276363a594105b73cd 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -639,7 +639,8 @@ static void fimc_lite_try_compose(struct fimc_lite *fimc, struct v4l2_rect *r)
 /*
  * Video node ioctl operations
  */
-static int fimc_lite_querycap(struct file *file, void *priv,
+static int fimc_lite_querycap(struct file *file,
+			      struct video_device_state *state,
 					struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, FIMC_LITE_DRV_NAME, sizeof(cap->driver));
@@ -647,7 +648,8 @@ static int fimc_lite_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int fimc_lite_enum_fmt(struct file *file, void *priv,
+static int fimc_lite_enum_fmt(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_fmtdesc *f)
 {
 	const struct fimc_fmt *fmt;
@@ -661,7 +663,8 @@ static int fimc_lite_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int fimc_lite_g_fmt_mplane(struct file *file, void *fh,
+static int fimc_lite_g_fmt_mplane(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct fimc_lite *fimc = video_drvdata(file);
@@ -726,14 +729,16 @@ static int fimc_lite_try_fmt(struct fimc_lite *fimc,
 	return 0;
 }
 
-static int fimc_lite_try_fmt_mplane(struct file *file, void *fh,
+static int fimc_lite_try_fmt_mplane(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct fimc_lite *fimc = video_drvdata(file);
 	return fimc_lite_try_fmt(fimc, &f->fmt.pix_mp, NULL);
 }
 
-static int fimc_lite_s_fmt_mplane(struct file *file, void *priv,
+static int fimc_lite_s_fmt_mplane(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	const struct v4l2_pix_format_mplane *pixm = &f->fmt.pix_mp;
@@ -807,7 +812,8 @@ static int fimc_pipeline_validate(struct fimc_lite *fimc)
 	return 0;
 }
 
-static int fimc_lite_streamon(struct file *file, void *priv,
+static int fimc_lite_streamon(struct file *file,
+			      struct video_device_state *state,
 			      enum v4l2_buf_type type)
 {
 	struct fimc_lite *fimc = video_drvdata(file);
@@ -826,7 +832,7 @@ static int fimc_lite_streamon(struct file *file, void *priv,
 
 	fimc->sensor = fimc_find_remote_sensor(&fimc->subdev.entity);
 
-	ret = vb2_ioctl_streamon(file, priv, type);
+	ret = vb2_ioctl_streamon(file, state, type);
 	if (!ret) {
 		fimc->streaming = true;
 		return ret;
@@ -837,13 +843,14 @@ static int fimc_lite_streamon(struct file *file, void *priv,
 	return 0;
 }
 
-static int fimc_lite_streamoff(struct file *file, void *priv,
+static int fimc_lite_streamoff(struct file *file,
+			       struct video_device_state *state,
 			       enum v4l2_buf_type type)
 {
 	struct fimc_lite *fimc = video_drvdata(file);
 	int ret;
 
-	ret = vb2_ioctl_streamoff(file, priv, type);
+	ret = vb2_ioctl_streamoff(file, state, type);
 	if (ret < 0)
 		return ret;
 
@@ -852,21 +859,23 @@ static int fimc_lite_streamoff(struct file *file, void *priv,
 	return 0;
 }
 
-static int fimc_lite_reqbufs(struct file *file, void *priv,
+static int fimc_lite_reqbufs(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_requestbuffers *reqbufs)
 {
 	struct fimc_lite *fimc = video_drvdata(file);
 	int ret;
 
 	reqbufs->count = max_t(u32, FLITE_REQ_BUFS_MIN, reqbufs->count);
-	ret = vb2_ioctl_reqbufs(file, priv, reqbufs);
+	ret = vb2_ioctl_reqbufs(file, state, reqbufs);
 	if (!ret)
 		fimc->reqbufs_count = reqbufs->count;
 
 	return ret;
 }
 
-static int fimc_lite_g_selection(struct file *file, void *fh,
+static int fimc_lite_g_selection(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_selection *sel)
 {
 	struct fimc_lite *fimc = video_drvdata(file);
@@ -892,7 +901,8 @@ static int fimc_lite_g_selection(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int fimc_lite_s_selection(struct file *file, void *fh,
+static int fimc_lite_s_selection(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_selection *sel)
 {
 	struct fimc_lite *fimc = video_drvdata(file);
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
index 562c57f186c61546175b4f902f1da18fbb2f25fe..4efa54f1e7a671741b5c16c9a954af572150dfd8 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
@@ -223,7 +223,8 @@ static const struct vb2_ops fimc_qops = {
 /*
  * V4L2 ioctl handlers
  */
-static int fimc_m2m_querycap(struct file *file, void *fh,
+static int fimc_m2m_querycap(struct file *file,
+			     struct video_device_state *state,
 				     struct v4l2_capability *cap)
 {
 	struct fimc_dev *fimc = video_drvdata(file);
@@ -232,7 +233,8 @@ static int fimc_m2m_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int fimc_m2m_enum_fmt(struct file *file, void *priv,
+static int fimc_m2m_enum_fmt(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_fmtdesc *f)
 {
 	const struct fimc_fmt *fmt;
@@ -246,7 +248,8 @@ static int fimc_m2m_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int fimc_m2m_g_fmt_mplane(struct file *file, void *fh,
+static int fimc_m2m_g_fmt_mplane(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct fimc_ctx *ctx = file_to_ctx(file);
@@ -305,7 +308,8 @@ static int fimc_try_fmt_mplane(struct fimc_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int fimc_m2m_try_fmt_mplane(struct file *file, void *fh,
+static int fimc_m2m_try_fmt_mplane(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct fimc_ctx *ctx = file_to_ctx(file);
@@ -334,7 +338,8 @@ static void __set_frame_format(struct fimc_frame *frame,
 	frame->fmt = fmt;
 }
 
-static int fimc_m2m_s_fmt_mplane(struct file *file, void *fh,
+static int fimc_m2m_s_fmt_mplane(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct fimc_ctx *ctx = file_to_ctx(file);
@@ -373,7 +378,8 @@ static int fimc_m2m_s_fmt_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int fimc_m2m_g_selection(struct file *file, void *fh,
+static int fimc_m2m_g_selection(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_selection *s)
 {
 	struct fimc_ctx *ctx = file_to_ctx(file);
@@ -481,7 +487,8 @@ static int fimc_m2m_try_selection(struct fimc_ctx *ctx,
 	return 0;
 }
 
-static int fimc_m2m_s_selection(struct file *file, void *fh,
+static int fimc_m2m_s_selection(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_selection *s)
 {
 	struct fimc_ctx *ctx = file_to_ctx(file);
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index ed1a1d693293b33d8da3190ac8ee6dd212a64b88..735e9b643b474dc20da03fe82d673c59f41492f2 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -630,7 +630,8 @@ static const struct v4l2_file_operations s3c_camif_fops = {
  * Video node IOCTLs
  */
 
-static int s3c_camif_vidioc_querycap(struct file *file, void *priv,
+static int s3c_camif_vidioc_querycap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_capability *cap)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -642,7 +643,8 @@ static int s3c_camif_vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int s3c_camif_vidioc_enum_input(struct file *file, void *priv,
+static int s3c_camif_vidioc_enum_input(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_input *input)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -656,20 +658,23 @@ static int s3c_camif_vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int s3c_camif_vidioc_s_input(struct file *file, void *priv,
+static int s3c_camif_vidioc_s_input(struct file *file,
+				    struct video_device_state *state,
 				    unsigned int i)
 {
 	return i == 0 ? 0 : -EINVAL;
 }
 
-static int s3c_camif_vidioc_g_input(struct file *file, void *priv,
+static int s3c_camif_vidioc_g_input(struct file *file,
+				    struct video_device_state *state,
 				    unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int s3c_camif_vidioc_enum_fmt(struct file *file, void *priv,
+static int s3c_camif_vidioc_enum_fmt(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_fmtdesc *f)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -683,7 +688,8 @@ static int s3c_camif_vidioc_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int s3c_camif_vidioc_g_fmt(struct file *file, void *priv,
+static int s3c_camif_vidioc_g_fmt(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -754,14 +760,16 @@ static int __camif_video_try_format(struct camif_vp *vp,
 	return 0;
 }
 
-static int s3c_camif_vidioc_try_fmt(struct file *file, void *priv,
+static int s3c_camif_vidioc_try_fmt(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct camif_vp *vp = video_drvdata(file);
 	return __camif_video_try_format(vp, &f->fmt.pix, NULL);
 }
 
-static int s3c_camif_vidioc_s_fmt(struct file *file, void *priv,
+static int s3c_camif_vidioc_s_fmt(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct v4l2_pix_format *pix = &f->fmt.pix;
@@ -828,7 +836,8 @@ static int camif_pipeline_validate(struct camif_dev *camif)
 	return 0;
 }
 
-static int s3c_camif_streamon(struct file *file, void *priv,
+static int s3c_camif_streamon(struct file *file,
+			      struct video_device_state *state,
 			      enum v4l2_buf_type type)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -860,7 +869,8 @@ static int s3c_camif_streamon(struct file *file, void *priv,
 	return vb2_streamon(&vp->vb_queue, type);
 }
 
-static int s3c_camif_streamoff(struct file *file, void *priv,
+static int s3c_camif_streamoff(struct file *file,
+			       struct video_device_state *state,
 			       enum v4l2_buf_type type)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -881,7 +891,8 @@ static int s3c_camif_streamoff(struct file *file, void *priv,
 	return ret;
 }
 
-static int s3c_camif_reqbufs(struct file *file, void *priv,
+static int s3c_camif_reqbufs(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_requestbuffers *rb)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -915,14 +926,16 @@ static int s3c_camif_reqbufs(struct file *file, void *priv,
 	return ret;
 }
 
-static int s3c_camif_querybuf(struct file *file, void *priv,
+static int s3c_camif_querybuf(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_buffer *buf)
 {
 	struct camif_vp *vp = video_drvdata(file);
 	return vb2_querybuf(&vp->vb_queue, buf);
 }
 
-static int s3c_camif_qbuf(struct file *file, void *priv,
+static int s3c_camif_qbuf(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_buffer *buf)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -935,7 +948,8 @@ static int s3c_camif_qbuf(struct file *file, void *priv,
 	return vb2_qbuf(&vp->vb_queue, vp->vdev.v4l2_dev->mdev, buf);
 }
 
-static int s3c_camif_dqbuf(struct file *file, void *priv,
+static int s3c_camif_dqbuf(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_buffer *buf)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -948,7 +962,8 @@ static int s3c_camif_dqbuf(struct file *file, void *priv,
 	return vb2_dqbuf(&vp->vb_queue, buf, file->f_flags & O_NONBLOCK);
 }
 
-static int s3c_camif_create_bufs(struct file *file, void *priv,
+static int s3c_camif_create_bufs(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_create_buffers *create)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -966,14 +981,16 @@ static int s3c_camif_create_bufs(struct file *file, void *priv,
 	return ret;
 }
 
-static int s3c_camif_prepare_buf(struct file *file, void *priv,
+static int s3c_camif_prepare_buf(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_buffer *b)
 {
 	struct camif_vp *vp = video_drvdata(file);
 	return vb2_prepare_buf(&vp->vb_queue, vp->vdev.v4l2_dev->mdev, b);
 }
 
-static int s3c_camif_g_selection(struct file *file, void *priv,
+static int s3c_camif_g_selection(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_selection *sel)
 {
 	struct camif_vp *vp = video_drvdata(file);
@@ -1010,7 +1027,8 @@ static void __camif_try_compose(struct camif_dev *camif, struct camif_vp *vp,
 	/* TODO: s3c64xx */
 }
 
-static int s3c_camif_s_selection(struct file *file, void *priv,
+static int s3c_camif_s_selection(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_selection *sel)
 {
 	struct camif_vp *vp = video_drvdata(file);
diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index ffb9bee6cb9d4759647925d791a13e1f0ce3f299..e7bf9bc50c3435ca190a194aef9bef0d1f5374c0 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -288,7 +288,8 @@ static int g2d_release(struct file *file)
 }
 
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, G2D_NAME, sizeof(cap->driver));
@@ -297,7 +298,9 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_fmtdesc *f)
 {
 	if (f->index >= NUM_FORMATS)
 		return -EINVAL;
@@ -305,7 +308,8 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 	return 0;
 }
 
-static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct g2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
@@ -327,7 +331,8 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct g2d_fmt *fmt;
 	enum v4l2_field *field;
@@ -357,7 +362,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_s_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_dev *dev = ctx->dev;
@@ -368,7 +374,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 
 	/* Adjust all values accordingly to the hardware capabilities
 	 * and chosen format. */
-	ret = vidioc_try_fmt(file, priv, f);
+	ret = vidioc_try_fmt(file, state, f);
 	if (ret)
 		return ret;
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
@@ -397,7 +403,8 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_g_selection(struct file *file, void *priv,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct g2d_ctx *ctx = file2ctx(file);
@@ -475,14 +482,15 @@ static int vidioc_try_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_selection(struct file *file, void *priv,
+static int vidioc_s_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_frame *f;
 	int ret;
 
-	ret = vidioc_try_selection(file, priv, s);
+	ret = vidioc_try_selection(file, state, s);
 	if (ret)
 		return ret;
 	f = get_frame(ctx, s->type);
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index 81792f7f8b1671dba2023f99b2779784d9a14b8c..5a5b24fd312c8f96b684e533b21cc4724f8f2a0b 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -1245,7 +1245,8 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
 	return true;
 }
 
-static int s5p_jpeg_querycap(struct file *file, void *priv,
+static int s5p_jpeg_querycap(struct file *file,
+			     struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
@@ -1293,7 +1294,8 @@ static int enum_fmt(struct s5p_jpeg_ctx *ctx,
 	return 0;
 }
 
-static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
+static int s5p_jpeg_enum_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
@@ -1306,7 +1308,8 @@ static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 			SJPEG_FMT_FLAG_DEC_CAPTURE);
 }
 
-static int s5p_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
+static int s5p_jpeg_enum_fmt_vid_out(struct file *file,
+				     struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
@@ -1330,7 +1333,8 @@ static struct s5p_jpeg_q_data *get_q_data(struct s5p_jpeg_ctx *ctx,
 	return NULL;
 }
 
-static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int s5p_jpeg_g_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct vb2_queue *vq;
 	struct s5p_jpeg_q_data *q_data = NULL;
@@ -1472,7 +1476,8 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct s5p_jpeg_fmt *fmt,
 	return 0;
 }
 
-static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
+static int s5p_jpeg_try_fmt_vid_cap(struct file *file,
+				    struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
@@ -1531,7 +1536,8 @@ static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 	return vidioc_try_fmt(f, fmt, ctx, FMT_TYPE_CAPTURE);
 }
 
-static int s5p_jpeg_try_fmt_vid_out(struct file *file, void *priv,
+static int s5p_jpeg_try_fmt_vid_out(struct file *file,
+				    struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
@@ -1672,24 +1678,26 @@ static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, struct v4l2_format *f)
 	return 0;
 }
 
-static int s5p_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
+static int s5p_jpeg_s_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	int ret;
 
-	ret = s5p_jpeg_try_fmt_vid_cap(file, priv, f);
+	ret = s5p_jpeg_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
 	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
 }
 
-static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
+static int s5p_jpeg_s_fmt_vid_out(struct file *file,
+				  struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	int ret;
 
-	ret = s5p_jpeg_try_fmt_vid_out(file, priv, f);
+	ret = s5p_jpeg_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
@@ -1787,7 +1795,8 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
  * V4L2 controls
  */
 
-static int s5p_jpeg_g_selection(struct file *file, void *priv,
+static int s5p_jpeg_g_selection(struct file *file,
+				struct video_device_state *state,
 			 struct v4l2_selection *s)
 {
 	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
@@ -1824,7 +1833,8 @@ static int s5p_jpeg_g_selection(struct file *file, void *priv,
 /*
  * V4L2 controls
  */
-static int s5p_jpeg_s_selection(struct file *file, void *fh,
+static int s5p_jpeg_s_selection(struct file *file,
+				struct video_device_state *state,
 				  struct v4l2_selection *s)
 {
 	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
index afd28beabfdee3a52ffceb467d6d875f4dc428ac..b38d43497e7c274c8bd5311372bfa15aafa10a51 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
@@ -295,7 +295,8 @@ static const struct s5p_mfc_codec_ops decoder_codec_ops = {
 };
 
 /* Query capabilities of the device */
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
@@ -330,20 +331,23 @@ static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return vidioc_enum_fmt(file, f, false);
 }
 
-static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return vidioc_enum_fmt(file, f, true);
 }
 
 /* Get format */
-static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp;
@@ -403,7 +407,8 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 }
 
 /* Try format */
-static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
 	const struct s5p_mfc_fmt *fmt;
@@ -439,7 +444,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 }
 
 /* Set format */
-static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_s_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -448,7 +454,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	const struct s5p_mfc_buf_size *buf_size = dev->variant->buf_size;
 
 	mfc_debug_enter();
-	ret = vidioc_try_fmt(file, priv, f);
+	ret = vidioc_try_fmt(file, state, f);
 	pix_mp = &f->fmt.pix_mp;
 	if (ret)
 		return ret;
@@ -594,7 +600,8 @@ static int reqbufs_capture(struct s5p_mfc_dev *dev, struct s5p_mfc_ctx *ctx,
 }
 
 /* Request buffers */
-static int vidioc_reqbufs(struct file *file, void *priv,
+static int vidioc_reqbufs(struct file *file,
+			  struct video_device_state *state,
 					  struct v4l2_requestbuffers *reqbufs)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
@@ -616,7 +623,8 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 }
 
 /* Query buffer */
-static int vidioc_querybuf(struct file *file, void *priv,
+static int vidioc_querybuf(struct file *file,
+			   struct video_device_state *state,
 						   struct v4l2_buffer *buf)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -645,7 +653,8 @@ static int vidioc_querybuf(struct file *file, void *priv,
 }
 
 /* Queue a buffer */
-static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+static int vidioc_qbuf(struct file *file, struct video_device_state *state,
+		       struct v4l2_buffer *buf)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
@@ -661,7 +670,8 @@ static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 }
 
 /* Dequeue a buffer */
-static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+static int vidioc_dqbuf(struct file *file, struct video_device_state *state,
+			struct v4l2_buffer *buf)
 {
 	const struct v4l2_event ev = {
 		.type = V4L2_EVENT_EOS
@@ -692,8 +702,8 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 }
 
 /* Export DMA buffer */
-static int vidioc_expbuf(struct file *file, void *priv,
-	struct v4l2_exportbuffer *eb)
+static int vidioc_expbuf(struct file *file,
+			 struct video_device_state *state, struct v4l2_exportbuffer *eb)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
@@ -705,7 +715,8 @@ static int vidioc_expbuf(struct file *file, void *priv,
 }
 
 /* Stream on */
-static int vidioc_streamon(struct file *file, void *priv,
+static int vidioc_streamon(struct file *file,
+			   struct video_device_state *state,
 			   enum v4l2_buf_type type)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -721,7 +732,8 @@ static int vidioc_streamon(struct file *file, void *priv,
 }
 
 /* Stream off, which equals to a pause */
-static int vidioc_streamoff(struct file *file, void *priv,
+static int vidioc_streamoff(struct file *file,
+			    struct video_device_state *state,
 			    enum v4l2_buf_type type)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -798,7 +810,8 @@ static const struct v4l2_ctrl_ops s5p_mfc_dec_ctrl_ops = {
 };
 
 /* Get compose information */
-static int vidioc_g_selection(struct file *file, void *priv,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -853,7 +866,8 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_decoder_cmd(struct file *file, void *priv,
+static int vidioc_decoder_cmd(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_decoder_cmd *cmd)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
index 3f8701e5614f21a8289df02ba8d8b1b876acf81d..6d689bdf1a15c1eea44bac282185d29b2e576a3b 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
@@ -1342,7 +1342,8 @@ static const struct s5p_mfc_codec_ops encoder_codec_ops = {
 };
 
 /* Query capabilities of the device */
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
@@ -1375,19 +1376,22 @@ static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	return -EINVAL;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return vidioc_enum_fmt(file, f, false);
 }
 
-static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return vidioc_enum_fmt(file, f, true);
 }
 
-static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -1428,7 +1432,8 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
 	const struct s5p_mfc_fmt *fmt;
@@ -1470,14 +1475,15 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_s_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = video_drvdata(file);
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	int ret = 0;
 
-	ret = vidioc_try_fmt(file, priv, f);
+	ret = vidioc_try_fmt(file, state, f);
 	if (ret)
 		return ret;
 	if (ctx->vq_src.streaming || ctx->vq_dst.streaming) {
@@ -1527,7 +1533,8 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return ret;
 }
 
-static int vidioc_reqbufs(struct file *file, void *priv,
+static int vidioc_reqbufs(struct file *file,
+			  struct video_device_state *state,
 					  struct v4l2_requestbuffers *reqbufs)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
@@ -1598,7 +1605,8 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 	return ret;
 }
 
-static int vidioc_querybuf(struct file *file, void *priv,
+static int vidioc_querybuf(struct file *file,
+			   struct video_device_state *state,
 						   struct v4l2_buffer *buf)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -1634,7 +1642,8 @@ static int vidioc_querybuf(struct file *file, void *priv,
 }
 
 /* Queue a buffer */
-static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+static int vidioc_qbuf(struct file *file, struct video_device_state *state,
+		       struct v4l2_buffer *buf)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
@@ -1655,7 +1664,8 @@ static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 }
 
 /* Dequeue a buffer */
-static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+static int vidioc_dqbuf(struct file *file, struct video_device_state *state,
+			struct v4l2_buffer *buf)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	const struct v4l2_event ev = {
@@ -1682,8 +1692,8 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 }
 
 /* Export DMA buffer */
-static int vidioc_expbuf(struct file *file, void *priv,
-	struct v4l2_exportbuffer *eb)
+static int vidioc_expbuf(struct file *file,
+			 struct video_device_state *state, struct v4l2_exportbuffer *eb)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
@@ -1695,7 +1705,8 @@ static int vidioc_expbuf(struct file *file, void *priv,
 }
 
 /* Stream on */
-static int vidioc_streamon(struct file *file, void *priv,
+static int vidioc_streamon(struct file *file,
+			   struct video_device_state *state,
 			   enum v4l2_buf_type type)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -1708,7 +1719,8 @@ static int vidioc_streamon(struct file *file, void *priv,
 }
 
 /* Stream off, which equals to a pause */
-static int vidioc_streamoff(struct file *file, void *priv,
+static int vidioc_streamoff(struct file *file,
+			    struct video_device_state *state,
 			    enum v4l2_buf_type type)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -2281,7 +2293,8 @@ static const struct v4l2_ctrl_ops s5p_mfc_enc_ctrl_ops = {
 	.g_volatile_ctrl = s5p_mfc_enc_g_v_ctrl,
 };
 
-static int vidioc_s_parm(struct file *file, void *priv,
+static int vidioc_s_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *a)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -2298,7 +2311,8 @@ static int vidioc_s_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_parm(struct file *file, void *priv,
+static int vidioc_g_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *a)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
@@ -2315,7 +2329,8 @@ static int vidioc_g_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_encoder_cmd(struct file *file, void *priv,
+static int vidioc_encoder_cmd(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_encoder_cmd *cmd)
 {
 	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index 56169b70652d3aaf7c3c395a630a29023cbd9722..dc8305d5d445633dbd01d0a2d214bbd30e804334 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -681,7 +681,8 @@ static const struct v4l2_file_operations bdisp_fops = {
 	.mmap           = v4l2_m2m_fop_mmap,
 };
 
-static int bdisp_querycap(struct file *file, void *fh,
+static int bdisp_querycap(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_capability *cap)
 {
 	struct bdisp_ctx *ctx = file_to_ctx(file);
@@ -694,7 +695,8 @@ static int bdisp_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int bdisp_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int bdisp_enum_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_fmtdesc *f)
 {
 	struct bdisp_ctx *ctx = file_to_ctx(file);
 	const struct bdisp_fmt *fmt;
@@ -714,7 +716,8 @@ static int bdisp_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static int bdisp_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int bdisp_g_fmt(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f)
 {
 	struct bdisp_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format *pix;
@@ -738,7 +741,8 @@ static int bdisp_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int bdisp_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int bdisp_try_fmt(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f)
 {
 	struct bdisp_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
@@ -788,7 +792,8 @@ static int bdisp_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int bdisp_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int bdisp_s_fmt(struct file *file, struct video_device_state *vstate,
+		       struct v4l2_format *f)
 {
 	struct bdisp_ctx *ctx = file_to_ctx(file);
 	struct vb2_queue *vq;
@@ -797,7 +802,7 @@ static int bdisp_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	int ret;
 	u32 state;
 
-	ret = bdisp_try_fmt(file, fh, f);
+	ret = bdisp_try_fmt(file, vstate, f);
 	if (ret) {
 		dev_err(ctx->bdisp_dev->dev, "Cannot set format\n");
 		return ret;
@@ -840,7 +845,8 @@ static int bdisp_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int bdisp_g_selection(struct file *file, void *fh,
+static int bdisp_g_selection(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_selection *s)
 {
 	struct bdisp_ctx *ctx = file_to_ctx(file);
@@ -918,7 +924,8 @@ static int is_rect_enclosed(struct v4l2_rect *a, struct v4l2_rect *b)
 	return 1;
 }
 
-static int bdisp_s_selection(struct file *file, void *fh,
+static int bdisp_s_selection(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_selection *s)
 {
 	struct bdisp_ctx *ctx = file_to_ctx(file);
@@ -997,7 +1004,8 @@ static int bdisp_s_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int bdisp_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
+static int bdisp_streamon(struct file *file, struct video_device_state *state,
+			  enum v4l2_buf_type type)
 {
 	struct bdisp_ctx *ctx = file_to_ctx(file);
 
diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index 6c1a53c771f746813a6062cb3ffc139250ff7146..cb259f77404828cec24889513956e7c21d967cc8 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -383,7 +383,8 @@ static int delta_open_decoder(struct delta_ctx *ctx, u32 streamformat,
  * V4L2 ioctl operations
  */
 
-static int delta_querycap(struct file *file, void *priv,
+static int delta_querycap(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_capability *cap)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
@@ -397,7 +398,8 @@ static int delta_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int delta_enum_fmt_stream(struct file *file, void *priv,
+static int delta_enum_fmt_stream(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
@@ -411,7 +413,8 @@ static int delta_enum_fmt_stream(struct file *file, void *priv,
 	return 0;
 }
 
-static int delta_enum_fmt_frame(struct file *file, void *priv,
+static int delta_enum_fmt_frame(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
@@ -425,7 +428,8 @@ static int delta_enum_fmt_frame(struct file *file, void *priv,
 	return 0;
 }
 
-static int delta_g_fmt_stream(struct file *file, void *fh,
+static int delta_g_fmt_stream(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
@@ -454,7 +458,9 @@ static int delta_g_fmt_stream(struct file *file, void *fh,
 	return 0;
 }
 
-static int delta_g_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
+static int delta_g_fmt_frame(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_format *f)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
@@ -492,7 +498,8 @@ static int delta_g_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int delta_try_fmt_stream(struct file *file, void *priv,
+static int delta_try_fmt_stream(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
@@ -546,7 +553,8 @@ static int delta_try_fmt_stream(struct file *file, void *priv,
 	return 0;
 }
 
-static int delta_try_fmt_frame(struct file *file, void *priv,
+static int delta_try_fmt_frame(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
@@ -606,7 +614,8 @@ static int delta_try_fmt_frame(struct file *file, void *priv,
 	return 0;
 }
 
-static int delta_s_fmt_stream(struct file *file, void *fh,
+static int delta_s_fmt_stream(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
@@ -615,7 +624,7 @@ static int delta_s_fmt_stream(struct file *file, void *fh,
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	int ret;
 
-	ret = delta_try_fmt_stream(file, fh, f);
+	ret = delta_try_fmt_stream(file, state, f);
 	if (ret) {
 		dev_dbg(delta->dev,
 			"%s V4L2 S_FMT (OUTPUT): unsupported format %4.4s\n",
@@ -643,7 +652,9 @@ static int delta_s_fmt_stream(struct file *file, void *fh,
 	return 0;
 }
 
-static int delta_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
+static int delta_s_fmt_frame(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_format *f)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
@@ -668,7 +679,7 @@ static int delta_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 		 * pixel format & negotiate resolution boundaries
 		 * and alignment...
 		 */
-		ret = delta_try_fmt_frame(file, fh, f);
+		ret = delta_try_fmt_frame(file, state, f);
 		if (ret) {
 			dev_dbg(delta->dev,
 				"%s V4L2 S_FMT (CAPTURE): unsupported format %4.4s\n",
@@ -722,7 +733,8 @@ static int delta_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int delta_g_selection(struct file *file, void *fh,
+static int delta_g_selection(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_selection *s)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
@@ -791,7 +803,8 @@ static void delta_complete_eos(struct delta_ctx *ctx,
 	dev_dbg(delta->dev, "%s EOS completed\n", ctx->name);
 }
 
-static int delta_try_decoder_cmd(struct file *file, void *fh,
+static int delta_try_decoder_cmd(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_decoder_cmd *cmd)
 {
 	if (cmd->cmd != V4L2_DEC_CMD_STOP)
@@ -867,13 +880,14 @@ static int delta_decoder_stop_cmd(struct delta_ctx *ctx)
 	return 0;
 }
 
-static int delta_decoder_cmd(struct file *file, void *fh,
+static int delta_decoder_cmd(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_decoder_cmd *cmd)
 {
 	struct delta_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 
-	ret = delta_try_decoder_cmd(file, fh, cmd);
+	ret = delta_try_decoder_cmd(file, state, cmd);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 3581b73a99b8ba5702e5d4d8d02cd5c832fa1555..28e5b22b77329ca1a277802bd2932b97f4fe149f 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -254,7 +254,8 @@ static void hva_dbg_summary(struct hva_ctx *ctx)
  * V4L2 ioctl operations
  */
 
-static int hva_querycap(struct file *file, void *priv,
+static int hva_querycap(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_capability *cap)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
@@ -268,7 +269,8 @@ static int hva_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int hva_enum_fmt_stream(struct file *file, void *priv,
+static int hva_enum_fmt_stream(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_fmtdesc *f)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
@@ -282,7 +284,8 @@ static int hva_enum_fmt_stream(struct file *file, void *priv,
 	return 0;
 }
 
-static int hva_enum_fmt_frame(struct file *file, void *priv,
+static int hva_enum_fmt_frame(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_fmtdesc *f)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
@@ -296,7 +299,9 @@ static int hva_enum_fmt_frame(struct file *file, void *priv,
 	return 0;
 }
 
-static int hva_g_fmt_stream(struct file *file, void *fh, struct v4l2_format *f)
+static int hva_g_fmt_stream(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_format *f)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
 	struct hva_streaminfo *streaminfo = &ctx->streaminfo;
@@ -315,7 +320,9 @@ static int hva_g_fmt_stream(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int hva_g_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
+static int hva_g_fmt_frame(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_format *f)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
 	struct hva_frameinfo *frameinfo = &ctx->frameinfo;
@@ -335,7 +342,8 @@ static int hva_g_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int hva_try_fmt_stream(struct file *file, void *priv,
+static int hva_try_fmt_stream(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
@@ -399,7 +407,8 @@ static int hva_try_fmt_stream(struct file *file, void *priv,
 	return 0;
 }
 
-static int hva_try_fmt_frame(struct file *file, void *priv,
+static int hva_try_fmt_frame(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
@@ -450,14 +459,16 @@ static int hva_try_fmt_frame(struct file *file, void *priv,
 	return 0;
 }
 
-static int hva_s_fmt_stream(struct file *file, void *fh, struct v4l2_format *f)
+static int hva_s_fmt_stream(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_format *f)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
 	struct device *dev = ctx_to_dev(ctx);
 	struct vb2_queue *vq;
 	int ret;
 
-	ret = hva_try_fmt_stream(file, fh, f);
+	ret = hva_try_fmt_stream(file, state, f);
 	if (ret) {
 		dev_dbg(dev, "%s V4L2 S_FMT (CAPTURE): unsupported format %.4s\n",
 			ctx->name, (char *)&f->fmt.pix.pixelformat);
@@ -480,7 +491,9 @@ static int hva_s_fmt_stream(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int hva_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
+static int hva_s_fmt_frame(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_format *f)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
 	struct device *dev = ctx_to_dev(ctx);
@@ -488,7 +501,7 @@ static int hva_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 	struct vb2_queue *vq;
 	int ret;
 
-	ret = hva_try_fmt_frame(file, fh, f);
+	ret = hva_try_fmt_frame(file, state, f);
 	if (ret) {
 		dev_dbg(dev, "%s V4L2 S_FMT (OUTPUT): unsupported format %.4s\n",
 			ctx->name, (char *)&pix->pixelformat);
@@ -518,7 +531,8 @@ static int hva_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int hva_g_parm(struct file *file, void *fh, struct v4l2_streamparm *sp)
+static int hva_g_parm(struct file *file, struct video_device_state *state,
+		      struct v4l2_streamparm *sp)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *time_per_frame = &ctx->ctrls.time_per_frame;
@@ -534,7 +548,8 @@ static int hva_g_parm(struct file *file, void *fh, struct v4l2_streamparm *sp)
 	return 0;
 }
 
-static int hva_s_parm(struct file *file, void *fh, struct v4l2_streamparm *sp)
+static int hva_s_parm(struct file *file, struct video_device_state *state,
+		      struct v4l2_streamparm *sp)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *time_per_frame = &ctx->ctrls.time_per_frame;
@@ -544,7 +559,7 @@ static int hva_s_parm(struct file *file, void *fh, struct v4l2_streamparm *sp)
 
 	if (!sp->parm.output.timeperframe.numerator ||
 	    !sp->parm.output.timeperframe.denominator)
-		return hva_g_parm(file, fh, sp);
+		return hva_g_parm(file, state, sp);
 
 	sp->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
 	time_per_frame->numerator = sp->parm.output.timeperframe.numerator;
@@ -554,7 +569,8 @@ static int hva_s_parm(struct file *file, void *fh, struct v4l2_streamparm *sp)
 	return 0;
 }
 
-static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+static int hva_qbuf(struct file *file, struct video_device_state *state,
+		    struct v4l2_buffer *buf)
 {
 	struct hva_ctx *ctx = file_to_ctx(file);
 	struct device *dev = ctx_to_dev(ctx);
diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index 468c247ba3282c6f4d092985465cd3d0907b1c07..8bfe415eec7e06bb9ce680d6cd0732ba7046fd2b 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -333,7 +333,8 @@ static int dma2d_release(struct file *file)
 	return 0;
 }
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DMA2D_NAME, sizeof(cap->driver));
@@ -343,7 +344,9 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_fmtdesc *f)
 {
 	if (f->index >= NUM_FORMATS)
 		return -EINVAL;
@@ -352,7 +355,8 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 	return 0;
 }
 
-static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct dma2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
@@ -377,7 +381,8 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct dma2d_ctx *ctx = file2ctx(file);
 	struct dma2d_fmt *fmt;
@@ -420,7 +425,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_s_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct dma2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
@@ -431,7 +437,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	/* Adjust all values accordingly to the hardware capabilities
 	 * and chosen format.
 	 */
-	ret = vidioc_try_fmt(file, priv, f);
+	ret = vidioc_try_fmt(file, state, f);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 13762861b76942530ed5f821c30f77c921047f9b..a167f96bf5d0bc6fb16d2a5ccf17f85b3f005696 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -900,7 +900,8 @@ static const struct vb2_ops dcmi_video_qops = {
 	.stop_streaming		= dcmi_stop_streaming,
 };
 
-static int dcmi_g_fmt_vid_cap(struct file *file, void *priv,
+static int dcmi_g_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *fmt)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
@@ -1086,7 +1087,8 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
 	return 0;
 }
 
-static int dcmi_s_fmt_vid_cap(struct file *file, void *priv,
+static int dcmi_s_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
@@ -1097,7 +1099,8 @@ static int dcmi_s_fmt_vid_cap(struct file *file, void *priv,
 	return dcmi_set_fmt(dcmi, f);
 }
 
-static int dcmi_try_fmt_vid_cap(struct file *file, void *priv,
+static int dcmi_try_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
@@ -1105,7 +1108,8 @@ static int dcmi_try_fmt_vid_cap(struct file *file, void *priv,
 	return dcmi_try_fmt(dcmi, f, NULL, NULL);
 }
 
-static int dcmi_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int dcmi_enum_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
@@ -1224,7 +1228,8 @@ static int dcmi_get_sensor_bounds(struct stm32_dcmi *dcmi,
 	return 0;
 }
 
-static int dcmi_g_selection(struct file *file, void *fh,
+static int dcmi_g_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *s)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
@@ -1254,7 +1259,8 @@ static int dcmi_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int dcmi_s_selection(struct file *file, void *priv,
+static int dcmi_s_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *s)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
@@ -1305,7 +1311,8 @@ static int dcmi_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmi_querycap(struct file *file, void *priv,
+static int dcmi_querycap(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DRV_NAME, sizeof(cap->driver));
@@ -1315,7 +1322,8 @@ static int dcmi_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmi_enum_input(struct file *file, void *priv,
+static int dcmi_enum_input(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_input *i)
 {
 	if (i->index != 0)
@@ -1326,20 +1334,23 @@ static int dcmi_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmi_g_input(struct file *file, void *priv, unsigned int *i)
+static int dcmi_g_input(struct file *file, struct video_device_state *state,
+			unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int dcmi_s_input(struct file *file, void *priv, unsigned int i)
+static int dcmi_s_input(struct file *file, struct video_device_state *state,
+			unsigned int i)
 {
 	if (i > 0)
 		return -EINVAL;
 	return 0;
 }
 
-static int dcmi_enum_framesizes(struct file *file, void *fh,
+static int dcmi_enum_framesizes(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_frmsizeenum *fsize)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
@@ -1368,7 +1379,8 @@ static int dcmi_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int dcmi_g_parm(struct file *file, void *priv,
+static int dcmi_g_parm(struct file *file,
+		       struct video_device_state *state,
 		       struct v4l2_streamparm *p)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
@@ -1376,7 +1388,8 @@ static int dcmi_g_parm(struct file *file, void *priv,
 	return v4l2_g_parm_cap(video_devdata(file), dcmi->source, p);
 }
 
-static int dcmi_s_parm(struct file *file, void *priv,
+static int dcmi_s_parm(struct file *file,
+		       struct video_device_state *state,
 		       struct v4l2_streamparm *p)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
@@ -1384,7 +1397,8 @@ static int dcmi_s_parm(struct file *file, void *priv,
 	return v4l2_s_parm_cap(video_devdata(file), dcmi->source, p);
 }
 
-static int dcmi_enum_frameintervals(struct file *file, void *fh,
+static int dcmi_enum_frameintervals(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_frmivalenum *fival)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 1c1b6b48918ee26f245d4cf99086473c44e74123..1d6478e9123a21f530b90c3ba31a630717020ebb 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -172,7 +172,8 @@ static const struct v4l2_pix_format fmt_default = {
 	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
 };
 
-static int dcmipp_bytecap_querycap(struct file *file, void *priv,
+static int dcmipp_bytecap_querycap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DCMIPP_PDEV_NAME, sizeof(cap->driver));
@@ -181,7 +182,8 @@ static int dcmipp_bytecap_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_g_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_bytecap_g_fmt_vid_cap(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
@@ -191,7 +193,8 @@ static int dcmipp_bytecap_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_format *f)
 {
 	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
@@ -231,7 +234,8 @@ static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
@@ -241,7 +245,7 @@ static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
 	if (vb2_is_busy(&vcap->queue))
 		return -EBUSY;
 
-	ret = dcmipp_bytecap_try_fmt_vid_cap(file, priv, f);
+	ret = dcmipp_bytecap_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -263,7 +267,8 @@ static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file,
+					   struct video_device_state *state,
 					   struct v4l2_fmtdesc *f)
 {
 	const struct dcmipp_bytecap_pix_map *vpix;
@@ -301,7 +306,8 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_enum_framesizes(struct file *file, void *fh,
+static int dcmipp_bytecap_enum_framesizes(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_frmsizeenum *fsize)
 {
 	const struct dcmipp_bytecap_pix_map *vpix;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 744197b0fccb03d7e1ad634f00ff1566d57e735c..881345ddb4cb6d1c865698f4fc33b2968d86c297 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -50,7 +50,8 @@ const struct sun4i_csi_format *sun4i_csi_find_format(const u32 *fourcc,
 	return NULL;
 }
 
-static int sun4i_csi_querycap(struct file *file, void *priv,
+static int sun4i_csi_querycap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
@@ -59,7 +60,8 @@ static int sun4i_csi_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun4i_csi_enum_input(struct file *file, void *priv,
+static int sun4i_csi_enum_input(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_input *inp)
 {
 	if (inp->index != 0)
@@ -71,7 +73,8 @@ static int sun4i_csi_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun4i_csi_g_input(struct file *file, void *fh,
+static int sun4i_csi_g_input(struct file *file,
+			     struct video_device_state *state,
 			     unsigned int *i)
 {
 	*i = 0;
@@ -79,8 +82,8 @@ static int sun4i_csi_g_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int sun4i_csi_s_input(struct file *file, void *fh,
-			     unsigned int i)
+static int sun4i_csi_s_input(struct file *file,
+			     struct video_device_state *state, unsigned int i)
 {
 	if (i != 0)
 		return -EINVAL;
@@ -128,7 +131,8 @@ static void _sun4i_csi_try_fmt(struct sun4i_csi *csi,
 	}
 }
 
-static int sun4i_csi_try_fmt_vid_cap(struct file *file, void *priv,
+static int sun4i_csi_try_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct sun4i_csi *csi = video_drvdata(file);
@@ -138,7 +142,8 @@ static int sun4i_csi_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun4i_csi_s_fmt_vid_cap(struct file *file, void *priv,
+static int sun4i_csi_s_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct sun4i_csi *csi = video_drvdata(file);
@@ -149,7 +154,8 @@ static int sun4i_csi_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun4i_csi_g_fmt_vid_cap(struct file *file, void *priv,
+static int sun4i_csi_g_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct sun4i_csi *csi = video_drvdata(file);
@@ -159,7 +165,8 @@ static int sun4i_csi_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun4i_csi_enum_fmt_vid_cap(struct file *file, void *priv,
+static int sun4i_csi_enum_fmt_vid_cap(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(sun4i_csi_formats))
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 65879f4802c00cd1b65f02b6bf00f27a72d674ce..4bd9f9aa4349f98f1e56561a066cf3fd7dff129c 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -711,7 +711,8 @@ static void sun6i_csi_capture_format_prepare(struct v4l2_format *format)
 	pix_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int sun6i_csi_capture_querycap(struct file *file, void *priv,
+static int sun6i_csi_capture_querycap(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_capability *capability)
 {
 	struct sun6i_csi_device *csi_dev = video_drvdata(file);
@@ -725,7 +726,8 @@ static int sun6i_csi_capture_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
+static int sun6i_csi_capture_enum_fmt(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
@@ -738,7 +740,8 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
+static int sun6i_csi_capture_g_fmt(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *format)
 {
 	struct sun6i_csi_device *csi_dev = video_drvdata(file);
@@ -748,7 +751,8 @@ static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_csi_capture_s_fmt(struct file *file, void *priv,
+static int sun6i_csi_capture_s_fmt(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *format)
 {
 	struct sun6i_csi_device *csi_dev = video_drvdata(file);
@@ -764,7 +768,8 @@ static int sun6i_csi_capture_s_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_csi_capture_try_fmt(struct file *file, void *priv,
+static int sun6i_csi_capture_try_fmt(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *format)
 {
 	sun6i_csi_capture_format_prepare(format);
@@ -772,7 +777,8 @@ static int sun6i_csi_capture_try_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_csi_capture_enum_input(struct file *file, void *priv,
+static int sun6i_csi_capture_enum_input(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_input *input)
 {
 	if (input->index != 0)
@@ -784,7 +790,8 @@ static int sun6i_csi_capture_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_csi_capture_g_input(struct file *file, void *priv,
+static int sun6i_csi_capture_g_input(struct file *file,
+				     struct video_device_state *state,
 				     unsigned int *index)
 {
 	*index = 0;
@@ -792,7 +799,8 @@ static int sun6i_csi_capture_g_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_csi_capture_s_input(struct file *file, void *priv,
+static int sun6i_csi_capture_s_input(struct file *file,
+				     struct video_device_state *state,
 				     unsigned int index)
 {
 	if (index != 0)
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index eb519afb30ca10c6f4370626d0dce9e7183b28e5..ff1cf37395b9de6ef0973bd0372eb818eaf11692 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -347,7 +347,8 @@ static void deinterlace_prepare_format(struct v4l2_pix_format *pix_fmt)
 	pix_fmt->sizeimage = sizeimage;
 }
 
-static int deinterlace_querycap(struct file *file, void *priv,
+static int deinterlace_querycap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DEINTERLACE_NAME, sizeof(cap->driver));
@@ -358,7 +359,8 @@ static int deinterlace_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int deinterlace_enum_fmt(struct file *file, void *priv,
+static int deinterlace_enum_fmt(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	if (f->index < ARRAY_SIZE(deinterlace_formats)) {
@@ -370,7 +372,8 @@ static int deinterlace_enum_fmt(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int deinterlace_enum_framesizes(struct file *file, void *priv,
+static int deinterlace_enum_framesizes(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_frmsizeenum *fsize)
 {
 	if (fsize->index != 0)
@@ -390,7 +393,8 @@ static int deinterlace_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int deinterlace_g_fmt_vid_cap(struct file *file, void *priv,
+static int deinterlace_g_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct deinterlace_ctx *ctx = deinterlace_file2ctx(file);
@@ -400,7 +404,8 @@ static int deinterlace_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int deinterlace_g_fmt_vid_out(struct file *file, void *priv,
+static int deinterlace_g_fmt_vid_out(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct deinterlace_ctx *ctx = deinterlace_file2ctx(file);
@@ -410,7 +415,8 @@ static int deinterlace_g_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int deinterlace_try_fmt_vid_cap(struct file *file, void *priv,
+static int deinterlace_try_fmt_vid_cap(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	if (!deinterlace_check_format(f->fmt.pix.pixelformat))
@@ -424,7 +430,8 @@ static int deinterlace_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int deinterlace_try_fmt_vid_out(struct file *file, void *priv,
+static int deinterlace_try_fmt_vid_out(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	if (!deinterlace_check_format(f->fmt.pix.pixelformat))
@@ -440,14 +447,15 @@ static int deinterlace_try_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int deinterlace_s_fmt_vid_cap(struct file *file, void *priv,
+static int deinterlace_s_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct deinterlace_ctx *ctx = deinterlace_file2ctx(file);
 	struct vb2_queue *vq;
 	int ret;
 
-	ret = deinterlace_try_fmt_vid_cap(file, priv, f);
+	ret = deinterlace_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -460,14 +468,15 @@ static int deinterlace_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int deinterlace_s_fmt_vid_out(struct file *file, void *priv,
+static int deinterlace_s_fmt_vid_out(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	struct deinterlace_ctx *ctx = deinterlace_file2ctx(file);
 	struct vb2_queue *vq;
 	int ret;
 
-	ret = deinterlace_try_fmt_vid_out(file, priv, f);
+	ret = deinterlace_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index 89992feaab6082b438eec189c0de93568d09f911..41cf132993b9da9ca24061f99d5ed8b38c548b8f 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -209,7 +209,8 @@ static void rotate_prepare_format(struct v4l2_pix_format *pix_fmt)
 	pix_fmt->sizeimage = sizeimage;
 }
 
-static int rotate_querycap(struct file *file, void *priv,
+static int rotate_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, ROTATE_NAME, sizeof(cap->driver));
@@ -220,19 +221,22 @@ static int rotate_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rotate_enum_fmt_vid_cap(struct file *file, void *priv,
+static int rotate_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return rotate_enum_fmt(f, true);
 }
 
-static int rotate_enum_fmt_vid_out(struct file *file, void *priv,
+static int rotate_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return rotate_enum_fmt(f, false);
 }
 
-static int rotate_enum_framesizes(struct file *file, void *priv,
+static int rotate_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	const struct rotate_format *fmt;
@@ -285,7 +289,8 @@ static int rotate_set_cap_format(struct rotate_ctx *ctx,
 	return 0;
 }
 
-static int rotate_g_fmt_vid_cap(struct file *file, void *priv,
+static int rotate_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct rotate_ctx *ctx = rotate_file2ctx(file);
@@ -295,7 +300,8 @@ static int rotate_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rotate_g_fmt_vid_out(struct file *file, void *priv,
+static int rotate_g_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct rotate_ctx *ctx = rotate_file2ctx(file);
@@ -305,7 +311,8 @@ static int rotate_g_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int rotate_try_fmt_vid_cap(struct file *file, void *priv,
+static int rotate_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct rotate_ctx *ctx = rotate_file2ctx(file);
@@ -313,7 +320,8 @@ static int rotate_try_fmt_vid_cap(struct file *file, void *priv,
 	return rotate_set_cap_format(ctx, &f->fmt.pix, ctx->rotate);
 }
 
-static int rotate_try_fmt_vid_out(struct file *file, void *priv,
+static int rotate_try_fmt_vid_out(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	if (!rotate_find_format(f->fmt.pix.pixelformat))
@@ -336,14 +344,15 @@ static int rotate_try_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int rotate_s_fmt_vid_cap(struct file *file, void *priv,
+static int rotate_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct rotate_ctx *ctx = rotate_file2ctx(file);
 	struct vb2_queue *vq;
 	int ret;
 
-	ret = rotate_try_fmt_vid_cap(file, priv, f);
+	ret = rotate_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -356,14 +365,15 @@ static int rotate_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rotate_s_fmt_vid_out(struct file *file, void *priv,
+static int rotate_s_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct rotate_ctx *ctx = rotate_file2ctx(file);
 	struct vb2_queue *vq;
 	int ret;
 
-	ret = rotate_try_fmt_vid_out(file, priv, f);
+	ret = rotate_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index b7d278b3889f28177b6efc67b01f37cc69aae679..24c47930b5518b657679485d4c94fc750a7c592c 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -459,7 +459,8 @@ static bool port_no_link(struct snps_hdmirx_dev *hdmirx_dev)
 	return !tx_5v_power_present(hdmirx_dev);
 }
 
-static int hdmirx_query_dv_timings(struct file *file, void *priv,
+static int hdmirx_query_dv_timings(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_dv_timings *timings)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
@@ -646,7 +647,9 @@ static void hdmirx_plugout(struct snps_hdmirx_dev *hdmirx_dev)
 	hdmirx_dev->plugged = false;
 }
 
-static int hdmirx_set_edid(struct file *file, void *fh, struct v4l2_edid *edid)
+static int hdmirx_set_edid(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_edid *edid)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
 	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
@@ -695,7 +698,9 @@ static int hdmirx_set_edid(struct file *file, void *fh, struct v4l2_edid *edid)
 	return 0;
 }
 
-static int hdmirx_get_edid(struct file *file, void *fh, struct v4l2_edid *edid)
+static int hdmirx_get_edid(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_edid *edid)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
 	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
@@ -730,7 +735,8 @@ static int hdmirx_get_edid(struct file *file, void *fh, struct v4l2_edid *edid)
 	return 0;
 }
 
-static int hdmirx_g_parm(struct file *file, void *priv,
+static int hdmirx_g_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *parm)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
@@ -744,14 +750,16 @@ static int hdmirx_g_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int hdmirx_dv_timings_cap(struct file *file, void *fh,
+static int hdmirx_dv_timings_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_dv_timings_cap *cap)
 {
 	*cap = hdmirx_timings_cap;
 	return 0;
 }
 
-static int hdmirx_enum_dv_timings(struct file *file, void *priv,
+static int hdmirx_enum_dv_timings(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_enum_dv_timings *timings)
 {
 	return v4l2_enum_dv_timings_cap(timings, &hdmirx_timings_cap, NULL, NULL);
@@ -1154,7 +1162,8 @@ static void hdmirx_submodule_init(struct snps_hdmirx_dev *hdmirx_dev)
 	hdmirx_controller_init(hdmirx_dev);
 }
 
-static int hdmirx_enum_input(struct file *file, void *priv,
+static int hdmirx_enum_input(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_input *input)
 {
 	if (input->index > 0)
@@ -1168,13 +1177,15 @@ static int hdmirx_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int hdmirx_get_input(struct file *file, void *priv, unsigned int *i)
+static int hdmirx_get_input(struct file *file,
+			    struct video_device_state *state, unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int hdmirx_set_input(struct file *file, void *priv, unsigned int i)
+static int hdmirx_set_input(struct file *file,
+			    struct video_device_state *state, unsigned int i)
 {
 	if (i)
 		return -EINVAL;
@@ -1278,7 +1289,8 @@ static void hdmirx_set_fmt(struct hdmirx_stream *stream,
 	}
 }
 
-static int hdmirx_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
+static int hdmirx_enum_fmt_vid_cap_mplane(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_fmtdesc *f)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
@@ -1293,7 +1305,8 @@ static int hdmirx_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
 }
 
 static int hdmirx_s_fmt_vid_cap_mplane(struct file *file,
-				       void *priv, struct v4l2_format *f)
+				       struct video_device_state *state,
+				       struct v4l2_format *f)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
 	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
@@ -1309,7 +1322,8 @@ static int hdmirx_s_fmt_vid_cap_mplane(struct file *file,
 	return 0;
 }
 
-static int hdmirx_g_fmt_vid_cap_mplane(struct file *file, void *fh,
+static int hdmirx_g_fmt_vid_cap_mplane(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
@@ -1323,7 +1337,8 @@ static int hdmirx_g_fmt_vid_cap_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int hdmirx_g_dv_timings(struct file *file, void *priv,
+static int hdmirx_g_dv_timings(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_dv_timings *timings)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
@@ -1339,7 +1354,8 @@ static int hdmirx_g_dv_timings(struct file *file, void *priv,
 	return 0;
 }
 
-static int hdmirx_s_dv_timings(struct file *file, void *priv,
+static int hdmirx_s_dv_timings(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_dv_timings *timings)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
@@ -1381,7 +1397,8 @@ static int hdmirx_s_dv_timings(struct file *file, void *priv,
 	return 0;
 }
 
-static int hdmirx_querycap(struct file *file, void *priv,
+static int hdmirx_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 1ca559df7e590063ca10752ae9be524edbbb14a6..c56ed2435731a4498be8f87a1982f4891f71a679 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -1268,7 +1268,8 @@ static inline void vpfe_attach_irq(struct vpfe_device *vpfe)
 	vpfe_reg_write(&vpfe->ccdc, intr, VPFE_IRQ_EN_SET);
 }
 
-static int vpfe_querycap(struct file *file, void  *priv,
+static int vpfe_querycap(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, VPFE_MODULE_NAME, sizeof(cap->driver));
@@ -1350,7 +1351,8 @@ static int vpfe_calc_format_size(struct vpfe_device *vpfe,
 	return 0;
 }
 
-static int vpfe_g_fmt(struct file *file, void *priv,
+static int vpfe_g_fmt(struct file *file,
+		      struct video_device_state *state,
 		      struct v4l2_format *fmt)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
@@ -1360,7 +1362,8 @@ static int vpfe_g_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int vpfe_enum_fmt(struct file *file, void  *priv,
+static int vpfe_enum_fmt(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_fmtdesc *f)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
@@ -1384,7 +1387,8 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vpfe_try_fmt(struct file *file, void *priv,
+static int vpfe_try_fmt(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
@@ -1444,7 +1448,8 @@ static int vpfe_try_fmt(struct file *file, void *priv,
 	return vpfe_calc_format_size(vpfe, fmt, f);
 }
 
-static int vpfe_s_fmt(struct file *file, void *priv,
+static int vpfe_s_fmt(struct file *file,
+		      struct video_device_state *state,
 		      struct v4l2_format *fmt)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
@@ -1458,7 +1463,7 @@ static int vpfe_s_fmt(struct file *file, void *priv,
 		return -EBUSY;
 	}
 
-	ret = vpfe_try_fmt(file, priv, fmt);
+	ret = vpfe_try_fmt(file, state, fmt);
 	if (ret < 0)
 		return ret;
 
@@ -1493,7 +1498,8 @@ static int vpfe_s_fmt(struct file *file, void *priv,
 	return vpfe_config_ccdc_image_format(vpfe);
 }
 
-static int vpfe_enum_size(struct file *file, void  *priv,
+static int vpfe_enum_size(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_frmsizeenum *fsize)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
@@ -1589,7 +1595,8 @@ static int vpfe_get_app_input_index(struct vpfe_device *vpfe,
 	return -EINVAL;
 }
 
-static int vpfe_enum_input(struct file *file, void *priv,
+static int vpfe_enum_input(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_input *inp)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
@@ -1608,7 +1615,8 @@ static int vpfe_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int vpfe_g_input(struct file *file, void *priv, unsigned int *index)
+static int vpfe_g_input(struct file *file, struct video_device_state *state,
+			unsigned int *index)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
@@ -1675,14 +1683,16 @@ static int vpfe_set_input(struct vpfe_device *vpfe, unsigned int index)
 	return ret;
 }
 
-static int vpfe_s_input(struct file *file, void *priv, unsigned int index)
+static int vpfe_s_input(struct file *file, struct video_device_state *state,
+			unsigned int index)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
 	return vpfe_set_input(vpfe, index);
 }
 
-static int vpfe_querystd(struct file *file, void *priv, v4l2_std_id *std_id)
+static int vpfe_querystd(struct file *file, struct video_device_state *state,
+			 v4l2_std_id *std_id)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct vpfe_subdev_info *sdinfo;
@@ -1696,7 +1706,8 @@ static int vpfe_querystd(struct file *file, void *priv, v4l2_std_id *std_id)
 					 video, querystd, std_id);
 }
 
-static int vpfe_s_std(struct file *file, void *priv, v4l2_std_id std_id)
+static int vpfe_s_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id std_id)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct vpfe_subdev_info *sdinfo;
@@ -1728,7 +1739,8 @@ static int vpfe_s_std(struct file *file, void *priv, v4l2_std_id std_id)
 	return ret;
 }
 
-static int vpfe_g_std(struct file *file, void *priv, v4l2_std_id *std_id)
+static int vpfe_g_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id *std_id)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct vpfe_subdev_info *sdinfo;
@@ -1946,8 +1958,9 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
 	vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_ERROR);
 }
 
-static int vpfe_g_pixelaspect(struct file *file, void *priv,
-			      int type, struct v4l2_fract *f)
+static int vpfe_g_pixelaspect(struct file *file,
+			      struct video_device_state *state, int type,
+			      struct v4l2_fract *f)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
@@ -1961,7 +1974,8 @@ static int vpfe_g_pixelaspect(struct file *file, void *priv,
 }
 
 static int
-vpfe_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+vpfe_g_selection(struct file *file, struct video_device_state *state,
+		 struct v4l2_selection *s)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
@@ -1990,7 +2004,8 @@ vpfe_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 }
 
 static int
-vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+vpfe_s_selection(struct file *file, struct video_device_state *state,
+		 struct v4l2_selection *s)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct v4l2_rect cr = vpfe->crop;
@@ -2036,7 +2051,8 @@ vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 	return 0;
 }
 
-static long vpfe_ioctl_default(struct file *file, void *priv,
+static long vpfe_ioctl_default(struct file *file,
+			       struct video_device_state *state,
 			       bool valid_prio, unsigned int cmd, void *param)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index d40e24ab112783f861cf07bdc1cfcca8dcf84fdd..b1ba089bbe08ee2f676237618196ca1e072c2502 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -30,7 +30,8 @@
  * ------------------------------------------------------------------
  */
 
-static int cal_querycap(struct file *file, void *priv,
+static int cal_querycap(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, CAL_MODULE_NAME, sizeof(cap->driver));
@@ -39,7 +40,8 @@ static int cal_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_g_fmt_vid_cap(struct file *file, void *priv,
+static int cal_g_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
@@ -84,7 +86,8 @@ static const struct cal_format_info *find_format_by_code(struct cal_ctx *ctx,
 	return NULL;
 }
 
-static int cal_legacy_enum_fmt_vid_cap(struct file *file, void *priv,
+static int cal_legacy_enum_fmt_vid_cap(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_fmtdesc *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
@@ -174,7 +177,8 @@ static void cal_calc_format_size(struct cal_ctx *ctx,
 		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
 }
 
-static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
+static int cal_legacy_try_fmt_vid_cap(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
@@ -237,7 +241,8 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
+static int cal_legacy_s_fmt_vid_cap(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
@@ -255,7 +260,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
 		return -EBUSY;
 	}
 
-	ret = cal_legacy_try_fmt_vid_cap(file, priv, f);
+	ret = cal_legacy_try_fmt_vid_cap(file, state, f);
 	if (ret < 0)
 		return ret;
 
@@ -289,7 +294,8 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_legacy_enum_framesizes(struct file *file, void *fh,
+static int cal_legacy_enum_framesizes(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_frmsizeenum *fsize)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
@@ -327,7 +333,8 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int cal_legacy_enum_input(struct file *file, void *priv,
+static int cal_legacy_enum_input(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_input *inp)
 {
 	if (inp->index > 0)
@@ -338,19 +345,24 @@ static int cal_legacy_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_legacy_g_input(struct file *file, void *priv, unsigned int *i)
+static int cal_legacy_g_input(struct file *file,
+			      struct video_device_state *state,
+			      unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int cal_legacy_s_input(struct file *file, void *priv, unsigned int i)
+static int cal_legacy_s_input(struct file *file,
+			      struct video_device_state *state,
+			      unsigned int i)
 {
 	return i > 0 ? -EINVAL : 0;
 }
 
 /* timeperframe is arbitrary and continuous */
-static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
+static int cal_legacy_enum_frameintervals(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_frmivalenum *fival)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
@@ -379,14 +391,18 @@ static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_legacy_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int cal_legacy_g_parm(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_streamparm *a)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 
 	return v4l2_g_parm_cap(video_devdata(file), ctx->phy->source, a);
 }
 
-static int cal_legacy_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int cal_legacy_s_parm(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_streamparm *a)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 
@@ -425,7 +441,8 @@ static const struct v4l2_ioctl_ops cal_ioctl_legacy_ops = {
  * ------------------------------------------------------------------
  */
 
-static int cal_mc_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int cal_mc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	unsigned int i;
@@ -509,7 +526,8 @@ static void cal_mc_try_fmt(struct cal_ctx *ctx, struct v4l2_format *f,
 		format->bytesperline, format->sizeimage);
 }
 
-static int cal_mc_try_fmt_vid_cap(struct file *file, void *priv,
+static int cal_mc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
@@ -518,7 +536,8 @@ static int cal_mc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_mc_s_fmt_vid_cap(struct file *file, void *priv,
+static int cal_mc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
@@ -537,7 +556,8 @@ static int cal_mc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_mc_enum_framesizes(struct file *file, void *fh,
+static int cal_mc_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index d053972888d1b43161e99a04c4ca5e11664bf5b8..660532e3f8ac4527c3563d20a81258bda351ae4a 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -741,12 +741,13 @@ static int vpif_set_input(
 /**
  * vpif_querystd() - querystd handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @std_id: ptr to std id
  *
  * This function is called to detect standard at the selected input
  */
-static int vpif_querystd(struct file *file, void *priv, v4l2_std_id *std_id)
+static int vpif_querystd(struct file *file, struct video_device_state *state,
+			 v4l2_std_id *std_id)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct channel_obj *ch = video_get_drvdata(vdev);
@@ -770,10 +771,11 @@ static int vpif_querystd(struct file *file, void *priv, v4l2_std_id *std_id)
 /**
  * vpif_g_std() - get STD handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @std: ptr to std id
  */
-static int vpif_g_std(struct file *file, void *priv, v4l2_std_id *std)
+static int vpif_g_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id *std)
 {
 	struct vpif_capture_config *config = vpif_dev->platform_data;
 	struct video_device *vdev = video_devdata(file);
@@ -798,10 +800,11 @@ static int vpif_g_std(struct file *file, void *priv, v4l2_std_id *std)
 /**
  * vpif_s_std() - set STD handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @std_id: ptr to std id
  */
-static int vpif_s_std(struct file *file, void *priv, v4l2_std_id std_id)
+static int vpif_s_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id std_id)
 {
 	struct vpif_capture_config *config = vpif_dev->platform_data;
 	struct video_device *vdev = video_devdata(file);
@@ -846,11 +849,11 @@ static int vpif_s_std(struct file *file, void *priv, v4l2_std_id std_id)
 /**
  * vpif_enum_input() - ENUMINPUT handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @input: ptr to input structure
  */
-static int vpif_enum_input(struct file *file, void *priv,
-				struct v4l2_input *input)
+static int vpif_enum_input(struct file *file, struct video_device_state *state,
+			   struct v4l2_input *input)
 {
 
 	struct vpif_capture_config *config = vpif_dev->platform_data;
@@ -871,10 +874,11 @@ static int vpif_enum_input(struct file *file, void *priv,
 /**
  * vpif_g_input() - Get INPUT handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @index: ptr to input index
  */
-static int vpif_g_input(struct file *file, void *priv, unsigned int *index)
+static int vpif_g_input(struct file *file, struct video_device_state *state,
+			unsigned int *index)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct channel_obj *ch = video_get_drvdata(vdev);
@@ -886,10 +890,11 @@ static int vpif_g_input(struct file *file, void *priv, unsigned int *index)
 /**
  * vpif_s_input() - Set INPUT handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @index: input index
  */
-static int vpif_s_input(struct file *file, void *priv, unsigned int index)
+static int vpif_s_input(struct file *file, struct video_device_state *state,
+			unsigned int index)
 {
 	struct vpif_capture_config *config = vpif_dev->platform_data;
 	struct video_device *vdev = video_devdata(file);
@@ -911,11 +916,12 @@ static int vpif_s_input(struct file *file, void *priv, unsigned int index)
 /**
  * vpif_enum_fmt_vid_cap() - ENUM_FMT handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @fmt: ptr to V4L2 format descriptor
  */
-static int vpif_enum_fmt_vid_cap(struct file *file, void  *priv,
-					struct v4l2_fmtdesc *fmt)
+static int vpif_enum_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_fmtdesc *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct channel_obj *ch = video_get_drvdata(vdev);
@@ -936,10 +942,11 @@ static int vpif_enum_fmt_vid_cap(struct file *file, void  *priv,
 /**
  * vpif_try_fmt_vid_cap() - TRY_FMT handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @fmt: ptr to v4l2 format structure
  */
-static int vpif_try_fmt_vid_cap(struct file *file, void *priv,
+static int vpif_try_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -973,11 +980,12 @@ static int vpif_try_fmt_vid_cap(struct file *file, void *priv,
 /**
  * vpif_g_fmt_vid_cap() - Set INPUT handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @fmt: ptr to v4l2 format structure
  */
-static int vpif_g_fmt_vid_cap(struct file *file, void *priv,
-				struct v4l2_format *fmt)
+static int vpif_g_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct channel_obj *ch = video_get_drvdata(vdev);
@@ -1029,11 +1037,12 @@ static int vpif_g_fmt_vid_cap(struct file *file, void *priv,
 /**
  * vpif_s_fmt_vid_cap() - Set FMT handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @fmt: ptr to v4l2 format structure
  */
-static int vpif_s_fmt_vid_cap(struct file *file, void *priv,
-				struct v4l2_format *fmt)
+static int vpif_s_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct channel_obj *ch = video_get_drvdata(vdev);
@@ -1045,7 +1054,7 @@ static int vpif_s_fmt_vid_cap(struct file *file, void *priv,
 	if (vb2_is_busy(&common->buffer_queue))
 		return -EBUSY;
 
-	ret = vpif_try_fmt_vid_cap(file, priv, fmt);
+	ret = vpif_try_fmt_vid_cap(file, state, fmt);
 	if (ret)
 		return ret;
 
@@ -1057,11 +1066,11 @@ static int vpif_s_fmt_vid_cap(struct file *file, void *priv,
 /**
  * vpif_querycap() - QUERYCAP handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @cap: ptr to v4l2_capability structure
  */
-static int vpif_querycap(struct file *file, void  *priv,
-				struct v4l2_capability *cap)
+static int vpif_querycap(struct file *file, struct video_device_state *state,
+			 struct v4l2_capability *cap)
 {
 	struct vpif_capture_config *config = vpif_dev->platform_data;
 
@@ -1074,11 +1083,12 @@ static int vpif_querycap(struct file *file, void  *priv,
 /**
  * vpif_enum_dv_timings() - ENUM_DV_TIMINGS handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @timings: input timings
  */
 static int
-vpif_enum_dv_timings(struct file *file, void *priv,
+vpif_enum_dv_timings(struct file *file,
+		     struct video_device_state *state,
 		     struct v4l2_enum_dv_timings *timings)
 {
 	struct vpif_capture_config *config = vpif_dev->platform_data;
@@ -1108,11 +1118,12 @@ vpif_enum_dv_timings(struct file *file, void *priv,
 /**
  * vpif_query_dv_timings() - QUERY_DV_TIMINGS handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @timings: input timings
  */
 static int
-vpif_query_dv_timings(struct file *file, void *priv,
+vpif_query_dv_timings(struct file *file,
+		      struct video_device_state *state,
 		      struct v4l2_dv_timings *timings)
 {
 	struct vpif_capture_config *config = vpif_dev->platform_data;
@@ -1140,11 +1151,12 @@ vpif_query_dv_timings(struct file *file, void *priv,
 /**
  * vpif_s_dv_timings() - S_DV_TIMINGS handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @timings: digital video timings
  */
-static int vpif_s_dv_timings(struct file *file, void *priv,
-		struct v4l2_dv_timings *timings)
+static int vpif_s_dv_timings(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_dv_timings *timings)
 {
 	struct vpif_capture_config *config = vpif_dev->platform_data;
 	struct video_device *vdev = video_devdata(file);
@@ -1239,11 +1251,12 @@ static int vpif_s_dv_timings(struct file *file, void *priv,
 /**
  * vpif_g_dv_timings() - G_DV_TIMINGS handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @timings: digital video timings
  */
-static int vpif_g_dv_timings(struct file *file, void *priv,
-		struct v4l2_dv_timings *timings)
+static int vpif_g_dv_timings(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_dv_timings *timings)
 {
 	struct vpif_capture_config *config = vpif_dev->platform_data;
 	struct video_device *vdev = video_devdata(file);
@@ -1268,11 +1281,12 @@ static int vpif_g_dv_timings(struct file *file, void *priv,
 /*
  * vpif_log_status() - Status information
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  *
  * Returns zero.
  */
-static int vpif_log_status(struct file *filep, void *priv)
+static int vpif_log_status(struct file *filep,
+			   struct video_device_state *state)
 {
 	/* status for sub devices */
 	v4l2_device_call_all(&vpif_obj.v4l2_dev, 0, core, log_status);
diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
index 70c89549f4b61d79bb72157e722e1984a4fca68e..ee33a8d6029ed4fa1331aca8c3f9888e3f603af2 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -575,10 +575,11 @@ static void vpif_config_addr(struct channel_obj *ch, int muxmode)
 /**
  * vpif_querycap() - QUERYCAP handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @cap: ptr to v4l2_capability structure
  */
-static int vpif_querycap(struct file *file, void  *priv,
+static int vpif_querycap(struct file *file,
+			 struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	struct vpif_display_config *config = vpif_dev->platform_data;
@@ -589,7 +590,8 @@ static int vpif_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vpif_enum_fmt_vid_out(struct file *file, void  *priv,
+static int vpif_enum_fmt_vid_out(struct file *file,
+				 struct video_device_state *state,
 					struct v4l2_fmtdesc *fmt)
 {
 	if (fmt->index != 0)
@@ -600,7 +602,8 @@ static int vpif_enum_fmt_vid_out(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vpif_g_fmt_vid_out(struct file *file, void *priv,
+static int vpif_g_fmt_vid_out(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -617,7 +620,8 @@ static int vpif_g_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int vpif_try_fmt_vid_out(struct file *file, void *priv,
+static int vpif_try_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -645,7 +649,8 @@ static int vpif_try_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int vpif_s_fmt_vid_out(struct file *file, void *priv,
+static int vpif_s_fmt_vid_out(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -657,7 +662,7 @@ static int vpif_s_fmt_vid_out(struct file *file, void *priv,
 	if (vb2_is_busy(&common->buffer_queue))
 		return -EBUSY;
 
-	ret = vpif_try_fmt_vid_out(file, priv, fmt);
+	ret = vpif_try_fmt_vid_out(file, state, fmt);
 	if (ret)
 		return ret;
 
@@ -669,7 +674,8 @@ static int vpif_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int vpif_s_std(struct file *file, void *priv, v4l2_std_id std_id)
+static int vpif_s_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id std_id)
 {
 	struct vpif_display_config *config = vpif_dev->platform_data;
 	struct video_device *vdev = video_devdata(file);
@@ -717,7 +723,8 @@ static int vpif_s_std(struct file *file, void *priv, v4l2_std_id std_id)
 	return ret;
 }
 
-static int vpif_g_std(struct file *file, void *priv, v4l2_std_id *std)
+static int vpif_g_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id *std)
 {
 	struct vpif_display_config *config = vpif_dev->platform_data;
 	struct video_device *vdev = video_devdata(file);
@@ -737,7 +744,8 @@ static int vpif_g_std(struct file *file, void *priv, v4l2_std_id *std)
 	return 0;
 }
 
-static int vpif_enum_output(struct file *file, void *fh,
+static int vpif_enum_output(struct file *file,
+			    struct video_device_state *state,
 				struct v4l2_output *output)
 {
 
@@ -832,7 +840,8 @@ static int vpif_set_output(struct vpif_display_config *vpif_cfg,
 	return 0;
 }
 
-static int vpif_s_output(struct file *file, void *priv, unsigned int i)
+static int vpif_s_output(struct file *file, struct video_device_state *state,
+			 unsigned int i)
 {
 	struct vpif_display_config *config = vpif_dev->platform_data;
 	struct video_device *vdev = video_devdata(file);
@@ -851,7 +860,8 @@ static int vpif_s_output(struct file *file, void *priv, unsigned int i)
 	return vpif_set_output(config, ch, i);
 }
 
-static int vpif_g_output(struct file *file, void *priv, unsigned int *i)
+static int vpif_g_output(struct file *file, struct video_device_state *state,
+			 unsigned int *i)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct channel_obj *ch = video_get_drvdata(vdev);
@@ -864,11 +874,12 @@ static int vpif_g_output(struct file *file, void *priv, unsigned int *i)
 /**
  * vpif_enum_dv_timings() - ENUM_DV_TIMINGS handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @timings: input timings
  */
 static int
-vpif_enum_dv_timings(struct file *file, void *priv,
+vpif_enum_dv_timings(struct file *file,
+		     struct video_device_state *state,
 		     struct v4l2_enum_dv_timings *timings)
 {
 	struct vpif_display_config *config = vpif_dev->platform_data;
@@ -897,11 +908,12 @@ vpif_enum_dv_timings(struct file *file, void *priv,
 /**
  * vpif_s_dv_timings() - S_DV_TIMINGS handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @timings: digital video timings
  */
-static int vpif_s_dv_timings(struct file *file, void *priv,
-		struct v4l2_dv_timings *timings)
+static int vpif_s_dv_timings(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_dv_timings *timings)
 {
 	struct vpif_display_config *config = vpif_dev->platform_data;
 	struct video_device *vdev = video_devdata(file);
@@ -996,11 +1008,12 @@ static int vpif_s_dv_timings(struct file *file, void *priv,
 /**
  * vpif_g_dv_timings() - G_DV_TIMINGS handler
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  * @timings: digital video timings
  */
-static int vpif_g_dv_timings(struct file *file, void *priv,
-		struct v4l2_dv_timings *timings)
+static int vpif_g_dv_timings(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_dv_timings *timings)
 {
 	struct vpif_display_config *config = vpif_dev->platform_data;
 	struct video_device *vdev = video_devdata(file);
@@ -1028,11 +1041,12 @@ static int vpif_g_dv_timings(struct file *file, void *priv,
 /*
  * vpif_log_status() - Status information
  * @file: file ptr
- * @priv: file handle
+ * @state: video device state
  *
  * Returns zero.
  */
-static int vpif_log_status(struct file *filep, void *priv)
+static int vpif_log_status(struct file *filep,
+			   struct video_device_state *state)
 {
 	/* status for sub devices */
 	v4l2_device_call_all(&vpif_obj.v4l2_dev, 0, core, log_status);
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b75aa363d1bf25f8c31b403c3aede0b31333c56b..ac9a87ee06b1090456508c87893ac0a265c93ae9 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -269,7 +269,8 @@ static void ti_csi2rx_fill_fmt(const struct ti_csi2rx_fmt *csi_fmt,
 	pix->sizeimage = pix->bytesperline * pix->height;
 }
 
-static int ti_csi2rx_querycap(struct file *file, void *priv,
+static int ti_csi2rx_querycap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, TI_CSI2RX_MODULE_NAME, sizeof(cap->driver));
@@ -278,7 +279,8 @@ static int ti_csi2rx_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ti_csi2rx_enum_fmt_vid_cap(struct file *file, void *priv,
+static int ti_csi2rx_enum_fmt_vid_cap(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_fmtdesc *f)
 {
 	const struct ti_csi2rx_fmt *fmt = NULL;
@@ -306,7 +308,8 @@ static int ti_csi2rx_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *priv,
+static int ti_csi2rx_g_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct ti_csi2rx_dev *csi = video_drvdata(file);
@@ -316,7 +319,8 @@ static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ti_csi2rx_try_fmt_vid_cap(struct file *file, void *priv,
+static int ti_csi2rx_try_fmt_vid_cap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	const struct ti_csi2rx_fmt *fmt;
@@ -337,7 +341,8 @@ static int ti_csi2rx_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ti_csi2rx_s_fmt_vid_cap(struct file *file, void *priv,
+static int ti_csi2rx_s_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct ti_csi2rx_dev *csi = video_drvdata(file);
@@ -347,7 +352,7 @@ static int ti_csi2rx_s_fmt_vid_cap(struct file *file, void *priv,
 	if (vb2_is_busy(q))
 		return -EBUSY;
 
-	ret = ti_csi2rx_try_fmt_vid_cap(file, priv, f);
+	ret = ti_csi2rx_try_fmt_vid_cap(file, state, f);
 	if (ret < 0)
 		return ret;
 
@@ -356,7 +361,8 @@ static int ti_csi2rx_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
+static int ti_csi2rx_enum_framesizes(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_frmsizeenum *fsize)
 {
 	const struct ti_csi2rx_fmt *fmt;
diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index 22782e9f1f4e69dd10e0172ec25f1c203caef93d..ffea499efac8fd3e271a219a6ec987f934f8ef9f 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -568,8 +568,8 @@ static void omap_vout_isr(void *arg, unsigned int irqstatus)
 /*
  * V4L2 ioctls
  */
-static int vidioc_querycap(struct file *file, void *fh,
-		struct v4l2_capability *cap)
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state, struct v4l2_capability *cap)
 {
 	struct omap_vout_device *vout = video_drvdata(file);
 
@@ -580,7 +580,8 @@ static int vidioc_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_out(struct file *file, void *fh,
+static int vidioc_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 			struct v4l2_fmtdesc *fmt)
 {
 	int index = fmt->index;
@@ -594,7 +595,8 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_out(struct file *file, void *fh,
+static int vidioc_g_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	struct omap_vout_device *vout = video_drvdata(file);
@@ -604,7 +606,8 @@ static int vidioc_g_fmt_vid_out(struct file *file, void *fh,
 
 }
 
-static int vidioc_try_fmt_vid_out(struct file *file, void *fh,
+static int vidioc_try_fmt_vid_out(struct file *file,
+				  struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	struct omap_overlay *ovl;
@@ -630,7 +633,8 @@ static int vidioc_try_fmt_vid_out(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_out(struct file *file, void *fh,
+static int vidioc_s_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	int ret, bpp;
@@ -696,7 +700,8 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *fh,
 	return ret;
 }
 
-static int vidioc_try_fmt_vid_overlay(struct file *file, void *fh,
+static int vidioc_try_fmt_vid_overlay(struct file *file,
+				      struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	int ret = 0;
@@ -716,7 +721,8 @@ static int vidioc_try_fmt_vid_overlay(struct file *file, void *fh,
 	return ret;
 }
 
-static int vidioc_s_fmt_vid_overlay(struct file *file, void *fh,
+static int vidioc_s_fmt_vid_overlay(struct file *file,
+				    struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	int ret = 0;
@@ -763,7 +769,8 @@ static int vidioc_s_fmt_vid_overlay(struct file *file, void *fh,
 	return ret;
 }
 
-static int vidioc_g_fmt_vid_overlay(struct file *file, void *fh,
+static int vidioc_g_fmt_vid_overlay(struct file *file,
+				    struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	struct omap_overlay *ovl;
@@ -787,7 +794,9 @@ static int vidioc_g_fmt_vid_overlay(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_g_selection(struct file *file, void *fh, struct v4l2_selection *sel)
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_selection *sel)
 {
 	struct omap_vout_device *vout = video_drvdata(file);
 	struct v4l2_pix_format *pix = &vout->pix;
@@ -813,7 +822,9 @@ static int vidioc_g_selection(struct file *file, void *fh, struct v4l2_selection
 	return 0;
 }
 
-static int vidioc_s_selection(struct file *file, void *fh, struct v4l2_selection *sel)
+static int vidioc_s_selection(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_selection *sel)
 {
 	int ret = -EINVAL;
 	struct omap_vout_device *vout = video_drvdata(file);
@@ -1115,7 +1126,8 @@ static void omap_vout_vb2_stop_streaming(struct vb2_queue *vq)
 	}
 }
 
-static int vidioc_s_fbuf(struct file *file, void *fh,
+static int vidioc_s_fbuf(struct file *file,
+			 struct video_device_state *state,
 				const struct v4l2_framebuffer *a)
 {
 	int enable = 0;
@@ -1187,8 +1199,8 @@ static int vidioc_s_fbuf(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_g_fbuf(struct file *file, void *fh,
-		struct v4l2_framebuffer *a)
+static int vidioc_g_fbuf(struct file *file,
+			 struct video_device_state *state, struct v4l2_framebuffer *a)
 {
 	struct omap_overlay *ovl;
 	struct omapvideo_info *ovid;
@@ -1236,7 +1248,8 @@ static int vidioc_g_fbuf(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_enum_output(struct file *file, void *priv,
+static int vidioc_enum_output(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_output *out)
 {
 	if (out->index)
@@ -1246,13 +1259,15 @@ static int vidioc_enum_output(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_output(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_output(struct file *file,
+			   struct video_device_state *state, unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int vidioc_s_output(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_output(struct file *file,
+			   struct video_device_state *state, unsigned int i)
 {
 	return i ? -EINVAL : 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 0e7f0bf2b3463b7ef6678f7bd836a952e0b707a7..5a8c64399738cb29a1939cb9974d58b75b64bf1b 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -639,7 +639,8 @@ void omap3isp_video_resume(struct isp_video *video, int continuous)
  */
 
 static int
-isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+isp_video_querycap(struct file *file, struct video_device_state *state,
+		   struct v4l2_capability *cap)
 {
 	struct isp_video *video = video_drvdata(file);
 
@@ -655,7 +656,8 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 }
 
 static int
-isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
+isp_video_get_format(struct file *file, struct video_device_state *state,
+		     struct v4l2_format *format)
 {
 	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
@@ -671,7 +673,8 @@ isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 }
 
 static int
-isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
+isp_video_set_format(struct file *file, struct video_device_state *state,
+		     struct v4l2_format *format)
 {
 	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
@@ -729,7 +732,8 @@ isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
 }
 
 static int
-isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
+isp_video_try_format(struct file *file, struct video_device_state *state,
+		     struct v4l2_format *format)
 {
 	struct isp_video *video = video_drvdata(file);
 	struct v4l2_subdev_format fmt = {
@@ -758,7 +762,8 @@ isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
 }
 
 static int
-isp_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
+isp_video_get_selection(struct file *file, struct video_device_state *state,
+			struct v4l2_selection *sel)
 {
 	struct isp_video *video = video_drvdata(file);
 	struct v4l2_subdev_format format = {
@@ -816,7 +821,8 @@ isp_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 }
 
 static int
-isp_video_set_selection(struct file *file, void *fh, struct v4l2_selection *sel)
+isp_video_set_selection(struct file *file, struct video_device_state *state,
+			struct v4l2_selection *sel)
 {
 	struct isp_video *video = video_drvdata(file);
 	struct v4l2_subdev *subdev;
@@ -856,7 +862,8 @@ isp_video_set_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 }
 
 static int
-isp_video_get_param(struct file *file, void *fh, struct v4l2_streamparm *a)
+isp_video_get_param(struct file *file, struct video_device_state *state,
+		    struct v4l2_streamparm *a)
 {
 	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
@@ -874,7 +881,8 @@ isp_video_get_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 }
 
 static int
-isp_video_set_param(struct file *file, void *fh, struct v4l2_streamparm *a)
+isp_video_set_param(struct file *file, struct video_device_state *state,
+		    struct v4l2_streamparm *a)
 {
 	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
@@ -892,7 +900,8 @@ isp_video_set_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 }
 
 static int
-isp_video_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *rb)
+isp_video_reqbufs(struct file *file, struct video_device_state *state,
+		  struct v4l2_requestbuffers *rb)
 {
 	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
@@ -906,7 +915,8 @@ isp_video_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *rb)
 }
 
 static int
-isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
+isp_video_querybuf(struct file *file, struct video_device_state *state,
+		   struct v4l2_buffer *b)
 {
 	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
@@ -920,7 +930,8 @@ isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
 }
 
 static int
-isp_video_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
+isp_video_qbuf(struct file *file, struct video_device_state *state,
+	       struct v4l2_buffer *b)
 {
 	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
@@ -934,7 +945,8 @@ isp_video_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 }
 
 static int
-isp_video_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
+isp_video_dqbuf(struct file *file, struct video_device_state *state,
+		struct v4l2_buffer *b)
 {
 	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
@@ -1072,7 +1084,8 @@ static int isp_video_check_external_subdevs(struct isp_video *video,
  * not sleep.
  */
 static int
-isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
+isp_video_streamon(struct file *file, struct video_device_state *vstate,
+		   enum v4l2_buf_type type)
 {
 	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
@@ -1178,7 +1191,8 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 }
 
 static int
-isp_video_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
+isp_video_streamoff(struct file *file, struct video_device_state *vstate,
+		    enum v4l2_buf_type type)
 {
 	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
@@ -1233,7 +1247,8 @@ isp_video_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 }
 
 static int
-isp_video_enum_input(struct file *file, void *fh, struct v4l2_input *input)
+isp_video_enum_input(struct file *file, struct video_device_state *state,
+		     struct v4l2_input *input)
 {
 	if (input->index > 0)
 		return -EINVAL;
@@ -1245,7 +1260,8 @@ isp_video_enum_input(struct file *file, void *fh, struct v4l2_input *input)
 }
 
 static int
-isp_video_g_input(struct file *file, void *fh, unsigned int *input)
+isp_video_g_input(struct file *file, struct video_device_state *state,
+		  unsigned int *input)
 {
 	*input = 0;
 
@@ -1253,7 +1269,8 @@ isp_video_g_input(struct file *file, void *fh, unsigned int *input)
 }
 
 static int
-isp_video_s_input(struct file *file, void *fh, unsigned int input)
+isp_video_s_input(struct file *file, struct video_device_state *state,
+		  unsigned int input)
 {
 	return input == 0 ? 0 : -EINVAL;
 }
@@ -1351,7 +1368,7 @@ static int isp_video_release(struct file *file)
 	struct isp_video_fh *handle = file_to_isp_video_fh(file);
 
 	/* Disable streaming and free the buffers queue resources. */
-	isp_video_streamoff(file, vfh, video->type);
+	isp_video_streamoff(file, vfh->state, video->type);
 
 	mutex_lock(&video->queue_lock);
 	vb2_queue_release(&handle->queue);
diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index 6029d4e8e0bd34d60f1addb91a51bf5fd0709341..5f1865ecbb266e4beb4f0f7ba1a5b425c2703012 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -1521,7 +1521,8 @@ static irqreturn_t vpe_irq(int irq_vpe, void *data)
 /*
  * video ioctls
  */
-static int vpe_querycap(struct file *file, void *priv,
+static int vpe_querycap(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, VPE_MODULE_NAME, sizeof(cap->driver));
@@ -1554,7 +1555,8 @@ static int __enum_fmt(struct v4l2_fmtdesc *f, u32 type)
 	return 0;
 }
 
-static int vpe_enum_fmt(struct file *file, void *priv,
+static int vpe_enum_fmt(struct file *file,
+			struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	if (V4L2_TYPE_IS_OUTPUT(f->type))
@@ -1563,7 +1565,8 @@ static int vpe_enum_fmt(struct file *file, void *priv,
 	return __enum_fmt(f, VPE_FMT_TYPE_CAPTURE);
 }
 
-static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vpe_g_fmt(struct file *file, struct video_device_state *state,
+		     struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	struct vpe_ctx *ctx = to_vpe_ctx(file);
@@ -1721,7 +1724,8 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 	return 0;
 }
 
-static int vpe_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vpe_try_fmt(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f)
 {
 	struct vpe_ctx *ctx = to_vpe_ctx(file);
 	struct vpe_fmt *fmt = find_format(f);
@@ -1784,12 +1788,13 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int vpe_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+static int vpe_s_fmt(struct file *file, struct video_device_state *state,
+		     struct v4l2_format *f)
 {
 	int ret;
 	struct vpe_ctx *ctx = to_vpe_ctx(file);
 
-	ret = vpe_try_fmt(file, priv, f);
+	ret = vpe_try_fmt(file, state, f);
 	if (ret)
 		return ret;
 
@@ -1872,8 +1877,8 @@ static int __vpe_try_selection(struct vpe_ctx *ctx, struct v4l2_selection *s)
 	return 0;
 }
 
-static int vpe_g_selection(struct file *file, void *fh,
-		struct v4l2_selection *s)
+static int vpe_g_selection(struct file *file,
+			   struct video_device_state *state, struct v4l2_selection *s)
 {
 	struct vpe_ctx *ctx = to_vpe_ctx(file);
 	struct vpe_q_data *q_data;
@@ -1936,8 +1941,8 @@ static int vpe_g_selection(struct file *file, void *fh,
 }
 
 
-static int vpe_s_selection(struct file *file, void *fh,
-		struct v4l2_selection *s)
+static int vpe_s_selection(struct file *file,
+			   struct video_device_state *state, struct v4l2_selection *s)
 {
 	struct vpe_ctx *ctx = to_vpe_ctx(file);
 	struct vpe_q_data *q_data;
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index fcf3bd9bcda2d02481fa7e1f20e6b7ca54d6d786..acaafd628bd235c0bc2238b828d589ca9b9b2731 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -171,7 +171,8 @@ hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream,
 	return NULL;
 }
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct hantro_dev *vpu = video_drvdata(file);
@@ -182,7 +183,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_framesizes(struct file *file, void *priv,
+static int vidioc_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct hantro_ctx *ctx = file_to_ctx(file);
@@ -281,19 +283,22 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
-	return vidioc_enum_fmt(file, priv, f, true);
+	return vidioc_enum_fmt(file, state, f, true);
 }
 
-static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
-	return vidioc_enum_fmt(file, priv, f, false);
+	return vidioc_enum_fmt(file, state, f, false);
 }
 
-static int vidioc_g_fmt_out_mplane(struct file *file, void *priv,
+static int vidioc_g_fmt_out_mplane(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -306,7 +311,8 @@ static int vidioc_g_fmt_out_mplane(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_cap_mplane(struct file *file, void *priv,
+static int vidioc_g_fmt_cap_mplane(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -395,13 +401,15 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 	return 0;
 }
 
-static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
+static int vidioc_try_fmt_cap_mplane(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
 }
 
-static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
+static int vidioc_try_fmt_out_mplane(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *f)
 {
 	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
@@ -646,18 +654,21 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 }
 
 static int
-vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
+vidioc_s_fmt_out_mplane(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	return hantro_set_fmt_out(file_to_ctx(file), &f->fmt.pix_mp, HANTRO_AUTO_POSTPROC);
 }
 
 static int
-vidioc_s_fmt_cap_mplane(struct file *file, void *priv, struct v4l2_format *f)
+vidioc_s_fmt_cap_mplane(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	return hantro_set_fmt_cap(file_to_ctx(file), &f->fmt.pix_mp);
 }
 
-static int vidioc_g_selection(struct file *file, void *priv,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *sel)
 {
 	struct hantro_ctx *ctx = file_to_ctx(file);
@@ -687,7 +698,8 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_selection(struct file *file, void *priv,
+static int vidioc_s_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *sel)
 {
 	struct hantro_ctx *ctx = file_to_ctx(file);
@@ -733,13 +745,14 @@ static const struct v4l2_event hantro_eos_event = {
 	.type = V4L2_EVENT_EOS
 };
 
-static int vidioc_encoder_cmd(struct file *file, void *priv,
+static int vidioc_encoder_cmd(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_encoder_cmd *ec)
 {
 	struct hantro_ctx *ctx = file_to_ctx(file);
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, ec);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, state, ec);
 	if (ret < 0)
 		return ret;
 
@@ -747,7 +760,7 @@ static int vidioc_encoder_cmd(struct file *file, void *priv,
 	    !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)))
 		return 0;
 
-	ret = v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
+	ret = v4l2_m2m_ioctl_encoder_cmd(file, state, ec);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/platform/via/via-camera.c b/drivers/media/platform/via/via-camera.c
index 5702eff664d4ef652b22aaeaaacbbd0e16a2e137..ccaa17269e6956d405ea2db2359e4ac8adf9bd76 100644
--- a/drivers/media/platform/via/via-camera.c
+++ b/drivers/media/platform/via/via-camera.c
@@ -736,8 +736,8 @@ static const struct v4l2_file_operations viacam_fops = {
 /*
  * Only one input.
  */
-static int viacam_enum_input(struct file *filp, void *priv,
-		struct v4l2_input *input)
+static int viacam_enum_input(struct file *filp,
+			     struct video_device_state *state, struct v4l2_input *input)
 {
 	if (input->index != 0)
 		return -EINVAL;
@@ -747,13 +747,15 @@ static int viacam_enum_input(struct file *filp, void *priv,
 	return 0;
 }
 
-static int viacam_g_input(struct file *filp, void *priv, unsigned int *i)
+static int viacam_g_input(struct file *filp, struct video_device_state *state,
+			  unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int viacam_s_input(struct file *filp, void *priv, unsigned int i)
+static int viacam_s_input(struct file *filp, struct video_device_state *state,
+			  unsigned int i)
 {
 	if (i != 0)
 		return -EINVAL;
@@ -776,8 +778,8 @@ static const struct v4l2_pix_format viacam_def_pix_format = {
 
 static const u32 via_def_mbus_code = MEDIA_BUS_FMT_YUYV8_2X8;
 
-static int viacam_enum_fmt_vid_cap(struct file *filp, void *priv,
-		struct v4l2_fmtdesc *fmt)
+static int viacam_enum_fmt_vid_cap(struct file *filp,
+				   struct video_device_state *state, struct v4l2_fmtdesc *fmt)
 {
 	if (fmt->index >= N_VIA_FMTS)
 		return -EINVAL;
@@ -850,8 +852,8 @@ static int viacam_do_try_fmt(struct via_camera *cam,
 
 
 
-static int viacam_try_fmt_vid_cap(struct file *filp, void *priv,
-		struct v4l2_format *fmt)
+static int viacam_try_fmt_vid_cap(struct file *filp,
+				  struct video_device_state *state, struct v4l2_format *fmt)
 {
 	struct via_camera *cam = video_drvdata(filp);
 	struct v4l2_format sfmt;
@@ -860,8 +862,8 @@ static int viacam_try_fmt_vid_cap(struct file *filp, void *priv,
 }
 
 
-static int viacam_g_fmt_vid_cap(struct file *filp, void *priv,
-		struct v4l2_format *fmt)
+static int viacam_g_fmt_vid_cap(struct file *filp,
+				struct video_device_state *state, struct v4l2_format *fmt)
 {
 	struct via_camera *cam = video_drvdata(filp);
 
@@ -869,8 +871,8 @@ static int viacam_g_fmt_vid_cap(struct file *filp, void *priv,
 	return 0;
 }
 
-static int viacam_s_fmt_vid_cap(struct file *filp, void *priv,
-		struct v4l2_format *fmt)
+static int viacam_s_fmt_vid_cap(struct file *filp,
+				struct video_device_state *state, struct v4l2_format *fmt)
 {
 	struct via_camera *cam = video_drvdata(filp);
 	int ret;
@@ -902,8 +904,8 @@ static int viacam_s_fmt_vid_cap(struct file *filp, void *priv,
 	return ret;
 }
 
-static int viacam_querycap(struct file *filp, void *priv,
-		struct v4l2_capability *cap)
+static int viacam_querycap(struct file *filp,
+			   struct video_device_state *state, struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "via-camera", sizeof(cap->driver));
 	strscpy(cap->card, "via-camera", sizeof(cap->card));
@@ -913,7 +915,8 @@ static int viacam_querycap(struct file *filp, void *priv,
 
 /* G/S_PARM */
 
-static int viacam_g_parm(struct file *filp, void *priv,
+static int viacam_g_parm(struct file *filp,
+			 struct video_device_state *state,
 		struct v4l2_streamparm *parm)
 {
 	struct via_camera *cam = video_drvdata(filp);
@@ -921,7 +924,8 @@ static int viacam_g_parm(struct file *filp, void *priv,
 	return v4l2_g_parm_cap(video_devdata(filp), cam->sensor, parm);
 }
 
-static int viacam_s_parm(struct file *filp, void *priv,
+static int viacam_s_parm(struct file *filp,
+			 struct video_device_state *state,
 		struct v4l2_streamparm *parm)
 {
 	struct via_camera *cam = video_drvdata(filp);
@@ -929,7 +933,8 @@ static int viacam_s_parm(struct file *filp, void *priv,
 	return v4l2_s_parm_cap(video_devdata(filp), cam->sensor, parm);
 }
 
-static int viacam_enum_framesizes(struct file *filp, void *priv,
+static int viacam_enum_framesizes(struct file *filp,
+				  struct video_device_state *state,
 		struct v4l2_frmsizeenum *sizes)
 {
 	unsigned int i;
@@ -950,7 +955,8 @@ static int viacam_enum_framesizes(struct file *filp, void *priv,
 	return 0;
 }
 
-static int viacam_enum_frameintervals(struct file *filp, void *priv,
+static int viacam_enum_frameintervals(struct file *filp,
+				      struct video_device_state *state,
 		struct v4l2_frmivalenum *interval)
 {
 	struct via_camera *cam = video_drvdata(filp);
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index fcfe0883aba5fb8bcf954ce4be956edb39e610cb..8102e09993e4a9ce5428a0a49ef01c8e5de223f6 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -467,7 +467,8 @@ static const struct vb2_ops xvip_dma_queue_qops = {
  */
 
 static int
-xvip_dma_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+xvip_dma_querycap(struct file *file, struct video_device_state *state,
+		  struct v4l2_capability *cap)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
@@ -489,7 +490,8 @@ xvip_dma_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
  * clarified through the mailing list.
  */
 static int
-xvip_dma_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+xvip_dma_enum_format(struct file *file, struct video_device_state *state,
+		     struct v4l2_fmtdesc *f)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
@@ -503,7 +505,8 @@ xvip_dma_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 }
 
 static int
-xvip_dma_get_format(struct file *file, void *fh, struct v4l2_format *format)
+xvip_dma_get_format(struct file *file, struct video_device_state *state,
+		    struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
@@ -563,7 +566,8 @@ __xvip_dma_try_format(struct xvip_dma *dma, struct v4l2_pix_format *pix,
 }
 
 static int
-xvip_dma_try_format(struct file *file, void *fh, struct v4l2_format *format)
+xvip_dma_try_format(struct file *file, struct video_device_state *state,
+		    struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
@@ -573,7 +577,8 @@ xvip_dma_try_format(struct file *file, void *fh, struct v4l2_format *format)
 }
 
 static int
-xvip_dma_set_format(struct file *file, void *fh, struct v4l2_format *format)
+xvip_dma_set_format(struct file *file, struct video_device_state *state,
+		    struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
diff --git a/drivers/media/radio/dsbr100.c b/drivers/media/radio/dsbr100.c
index 9a45cda0577993206c7e287ce03467713f16ee41..9978454af6a33e863e320a6c16497998a44a1dca 100644
--- a/drivers/media/radio/dsbr100.c
+++ b/drivers/media/radio/dsbr100.c
@@ -160,7 +160,8 @@ static void dsbr100_getstat(struct dsbr100_device *radio)
 	}
 }
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	struct dsbr100_device *radio = video_drvdata(file);
@@ -171,7 +172,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_tuner *v)
 {
 	struct dsbr100_device *radio = video_drvdata(file);
@@ -192,13 +194,15 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 				const struct v4l2_tuner *v)
 {
 	return v->index ? -EINVAL : 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *f)
 {
 	struct dsbr100_device *radio = video_drvdata(file);
@@ -210,7 +214,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 			FREQ_MIN * FREQ_MUL, FREQ_MAX * FREQ_MUL));
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct dsbr100_device *radio = video_drvdata(file);
diff --git a/drivers/media/radio/radio-cadet.c b/drivers/media/radio/radio-cadet.c
index 5110754e1a31782b74d4c9dcbfa79642a532543a..842002098e8eeb960e7128310f41e86efe5ce943 100644
--- a/drivers/media/radio/radio-cadet.c
+++ b/drivers/media/radio/radio-cadet.c
@@ -351,7 +351,8 @@ static ssize_t cadet_read(struct file *file, char __user *data, size_t count, lo
 }
 
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 				struct v4l2_capability *v)
 {
 	strscpy(v->driver, "ADS Cadet", sizeof(v->driver));
@@ -360,7 +361,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_tuner *v)
 {
 	struct cadet *dev = video_drvdata(file);
@@ -390,13 +392,15 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 				const struct v4l2_tuner *v)
 {
 	return v->index ? -EINVAL : 0;
 }
 
-static int vidioc_enum_freq_bands(struct file *file, void *priv,
+static int vidioc_enum_freq_bands(struct file *file,
+				  struct video_device_state *state,
 				struct v4l2_frequency_band *band)
 {
 	if (band->tuner)
@@ -407,7 +411,8 @@ static int vidioc_enum_freq_bands(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct cadet *dev = video_drvdata(file);
@@ -420,7 +425,8 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 }
 
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *f)
 {
 	struct cadet *dev = video_drvdata(file);
diff --git a/drivers/media/radio/radio-isa.c b/drivers/media/radio/radio-isa.c
index 1a144536ffa7580c8e8d96c149a68eb788c29346..32f483f12ce052ec8ccf870eb42fae661b5fff67 100644
--- a/drivers/media/radio/radio-isa.c
+++ b/drivers/media/radio/radio-isa.c
@@ -29,7 +29,8 @@ MODULE_LICENSE("GPL");
 #define FREQ_LOW  (87U * 16000U)
 #define FREQ_HIGH (108U * 16000U)
 
-static int radio_isa_querycap(struct file *file, void  *priv,
+static int radio_isa_querycap(struct file *file,
+			      struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	struct radio_isa_card *isa = video_drvdata(file);
@@ -40,7 +41,8 @@ static int radio_isa_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int radio_isa_g_tuner(struct file *file, void *priv,
+static int radio_isa_g_tuner(struct file *file,
+			     struct video_device_state *state,
 				struct v4l2_tuner *v)
 {
 	struct radio_isa_card *isa = video_drvdata(file);
@@ -70,7 +72,8 @@ static int radio_isa_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int radio_isa_s_tuner(struct file *file, void *priv,
+static int radio_isa_s_tuner(struct file *file,
+			     struct video_device_state *state,
 				const struct v4l2_tuner *v)
 {
 	struct radio_isa_card *isa = video_drvdata(file);
@@ -85,7 +88,8 @@ static int radio_isa_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int radio_isa_s_frequency(struct file *file, void *priv,
+static int radio_isa_s_frequency(struct file *file,
+				 struct video_device_state *state,
 				const struct v4l2_frequency *f)
 {
 	struct radio_isa_card *isa = video_drvdata(file);
@@ -101,7 +105,8 @@ static int radio_isa_s_frequency(struct file *file, void *priv,
 	return res;
 }
 
-static int radio_isa_g_frequency(struct file *file, void *priv,
+static int radio_isa_g_frequency(struct file *file,
+				 struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct radio_isa_card *isa = video_drvdata(file);
@@ -126,7 +131,8 @@ static int radio_isa_s_ctrl(struct v4l2_ctrl *ctrl)
 	return -EINVAL;
 }
 
-static int radio_isa_log_status(struct file *file, void *priv)
+static int radio_isa_log_status(struct file *file,
+				struct video_device_state *state)
 {
 	struct radio_isa_card *isa = video_drvdata(file);
 
diff --git a/drivers/media/radio/radio-keene.c b/drivers/media/radio/radio-keene.c
index f3b57f0cb1ec4064aa7e81b1c6425f937ca819de..168e1ff2a0ae64a5af57ceefd7e57491f1b347e1 100644
--- a/drivers/media/radio/radio-keene.c
+++ b/drivers/media/radio/radio-keene.c
@@ -160,7 +160,8 @@ static int usb_keene_resume(struct usb_interface *intf)
 	return 0;
 }
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	struct keene_device *radio = video_drvdata(file);
@@ -171,7 +172,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_modulator(struct file *file, void *priv,
+static int vidioc_g_modulator(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_modulator *v)
 {
 	struct keene_device *radio = video_drvdata(file);
@@ -187,7 +189,8 @@ static int vidioc_g_modulator(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_modulator(struct file *file, void *priv,
+static int vidioc_s_modulator(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_modulator *v)
 {
 	struct keene_device *radio = video_drvdata(file);
@@ -199,7 +202,8 @@ static int vidioc_s_modulator(struct file *file, void *priv,
 	return keene_cmd_set(radio);
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *f)
 {
 	struct keene_device *radio = video_drvdata(file);
@@ -211,7 +215,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	return keene_cmd_main(radio, freq, true);
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct keene_device *radio = video_drvdata(file);
diff --git a/drivers/media/radio/radio-ma901.c b/drivers/media/radio/radio-ma901.c
index 657c3dda6648a8ff3bf67630c7cc30d857367fe0..61b745a13fc29e03579a29bb7f2894513cf5e872 100644
--- a/drivers/media/radio/radio-ma901.c
+++ b/drivers/media/radio/radio-ma901.c
@@ -183,7 +183,8 @@ static void usb_ma901radio_disconnect(struct usb_interface *intf)
 }
 
 /* vidioc_querycap - query device capabilities */
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	struct ma901radio_device *radio = video_drvdata(file);
@@ -195,7 +196,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 }
 
 /* vidioc_g_tuner - get tuner attributes */
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_tuner *v)
 {
 	struct ma901radio_device *radio = video_drvdata(file);
@@ -223,7 +225,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 }
 
 /* vidioc_s_tuner - set tuner attributes */
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 				const struct v4l2_tuner *v)
 {
 	struct ma901radio_device *radio = video_drvdata(file);
@@ -241,7 +244,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 }
 
 /* vidioc_s_frequency - set tuner radio frequency */
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *f)
 {
 	struct ma901radio_device *radio = video_drvdata(file);
@@ -254,7 +258,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 }
 
 /* vidioc_g_frequency - get tuner radio frequency */
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct ma901radio_device *radio = video_drvdata(file);
diff --git a/drivers/media/radio/radio-miropcm20.c b/drivers/media/radio/radio-miropcm20.c
index 67712ab3d564435c9e7c2c46d103ea7f8166c2ea..f9d5d35a775378a118fd4cc86838273baf8911ba 100644
--- a/drivers/media/radio/radio-miropcm20.c
+++ b/drivers/media/radio/radio-miropcm20.c
@@ -196,7 +196,8 @@ static int pcm20_setfreq(struct pcm20 *dev, unsigned long freq)
 	return snd_aci_cmd(aci, ACI_WRITE_TUNE, freql, freqh);
 }
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 				struct v4l2_capability *v)
 {
 	strscpy(v->driver, "Miro PCM20", sizeof(v->driver));
@@ -219,7 +220,8 @@ static bool sanitize(char *p, int size)
 	return ret;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_tuner *v)
 {
 	struct pcm20 *dev = video_drvdata(file);
@@ -248,7 +250,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 				const struct v4l2_tuner *v)
 {
 	struct pcm20 *dev = video_drvdata(file);
@@ -264,7 +267,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct pcm20 *dev = video_drvdata(file);
@@ -278,7 +282,8 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 }
 
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *f)
 {
 	struct pcm20 *dev = video_drvdata(file);
diff --git a/drivers/media/radio/radio-mr800.c b/drivers/media/radio/radio-mr800.c
index cb0437b4c331250863c9e08c58bf0f32fdad4362..368995ce53ae950cd14d5616ede7a3429cdfb9bd 100644
--- a/drivers/media/radio/radio-mr800.c
+++ b/drivers/media/radio/radio-mr800.c
@@ -252,7 +252,8 @@ static void usb_amradio_disconnect(struct usb_interface *intf)
 }
 
 /* vidioc_querycap - query device capabilities */
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	struct amradio_device *radio = video_drvdata(file);
@@ -264,7 +265,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 }
 
 /* vidioc_g_tuner - get tuner attributes */
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_tuner *v)
 {
 	struct amradio_device *radio = video_drvdata(file);
@@ -292,7 +294,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 }
 
 /* vidioc_s_tuner - set tuner attributes */
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 				const struct v4l2_tuner *v)
 {
 	struct amradio_device *radio = video_drvdata(file);
@@ -310,7 +313,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 }
 
 /* vidioc_s_frequency - set tuner radio frequency */
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *f)
 {
 	struct amradio_device *radio = video_drvdata(file);
@@ -321,7 +325,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 }
 
 /* vidioc_g_frequency - get tuner radio frequency */
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct amradio_device *radio = video_drvdata(file);
@@ -334,7 +339,8 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_hw_freq_seek(struct file *file, void *priv,
+static int vidioc_s_hw_freq_seek(struct file *file,
+				 struct video_device_state *state,
 		const struct v4l2_hw_freq_seek *seek)
 {
 	static u8 buf[8] = {
diff --git a/drivers/media/radio/radio-raremono.c b/drivers/media/radio/radio-raremono.c
index f60775b005e1d1dcc63b9d095cfb5320c20888e1..54460ea13ed9e72ef4c0109be9e38fc8f1bed665 100644
--- a/drivers/media/radio/radio-raremono.c
+++ b/drivers/media/radio/radio-raremono.c
@@ -176,7 +176,8 @@ static void usb_raremono_disconnect(struct usb_interface *intf)
 /*
  * Linux Video interface
  */
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	struct raremono_device *radio = video_drvdata(file);
@@ -187,7 +188,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_freq_bands(struct file *file, void *priv,
+static int vidioc_enum_freq_bands(struct file *file,
+				  struct video_device_state *state,
 		struct v4l2_frequency_band *band)
 {
 	if (band->tuner != 0)
@@ -201,8 +203,8 @@ static int vidioc_enum_freq_bands(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
-		struct v4l2_tuner *v)
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state, struct v4l2_tuner *v)
 {
 	struct raremono_device *radio = video_drvdata(file);
 	int ret;
@@ -230,13 +232,15 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 					const struct v4l2_tuner *v)
 {
 	return v->index ? -EINVAL : 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *f)
 {
 	struct raremono_device *radio = video_drvdata(file);
@@ -257,7 +261,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	return raremono_cmd_main(radio, band, freq / 16);
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct raremono_device *radio = video_drvdata(file);
diff --git a/drivers/media/radio/radio-sf16fmi.c b/drivers/media/radio/radio-sf16fmi.c
index 1fb88c2b916c4510e915b2cb478085134a9f09c3..048f7990a5d4c318b3f7416ec091f6045b8c7a10 100644
--- a/drivers/media/radio/radio-sf16fmi.c
+++ b/drivers/media/radio/radio-sf16fmi.c
@@ -127,7 +127,8 @@ static void fmi_set_freq(struct fmi *fmi)
 	lm7000_set_freq((fmi->curfreq / 800) * 800, fmi, fmi_set_pins);
 }
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	strscpy(v->driver, "radio-sf16fmi", sizeof(v->driver));
@@ -136,7 +137,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 					struct v4l2_tuner *v)
 {
 	struct fmi *fmi = video_drvdata(file);
@@ -155,13 +157,15 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 					const struct v4l2_tuner *v)
 {
 	return v->index ? -EINVAL : 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 					const struct v4l2_frequency *f)
 {
 	struct fmi *fmi = video_drvdata(file);
@@ -175,7 +179,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 					struct v4l2_frequency *f)
 {
 	struct fmi *fmi = video_drvdata(file);
diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
index 9980346cb5ea3897e515a0042cdb6c7b24334b01..9a5bb0259f28101cf3d0838ba6513968d7065762 100644
--- a/drivers/media/radio/radio-si476x.c
+++ b/drivers/media/radio/radio-si476x.c
@@ -321,7 +321,8 @@ v4l2_ctrl_handler_to_radio(struct v4l2_ctrl_handler *d)
 /*
  * si476x_vidioc_querycap - query device capabilities
  */
-static int si476x_radio_querycap(struct file *file, void *priv,
+static int si476x_radio_querycap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_capability *capability)
 {
 	struct si476x_radio *radio = video_drvdata(file);
@@ -332,7 +333,8 @@ static int si476x_radio_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int si476x_radio_enum_freq_bands(struct file *file, void *priv,
+static int si476x_radio_enum_freq_bands(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_frequency_band *band)
 {
 	int err;
@@ -369,7 +371,8 @@ static int si476x_radio_enum_freq_bands(struct file *file, void *priv,
 	return err;
 }
 
-static int si476x_radio_g_tuner(struct file *file, void *priv,
+static int si476x_radio_g_tuner(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_tuner *tuner)
 {
 	int err;
@@ -446,7 +449,8 @@ static int si476x_radio_g_tuner(struct file *file, void *priv,
 	return err;
 }
 
-static int si476x_radio_s_tuner(struct file *file, void *priv,
+static int si476x_radio_s_tuner(struct file *file,
+				struct video_device_state *state,
 				const struct v4l2_tuner *tuner)
 {
 	struct si476x_radio *radio = video_drvdata(file);
@@ -638,7 +642,8 @@ static int si476x_radio_change_func(struct si476x_radio *radio,
 	return si476x_radio_do_post_powerup_init(radio, func);
 }
 
-static int si476x_radio_g_frequency(struct file *file, void *priv,
+static int si476x_radio_g_frequency(struct file *file,
+				    struct video_device_state *state,
 			      struct v4l2_frequency *f)
 {
 	int err;
@@ -673,7 +678,8 @@ static int si476x_radio_g_frequency(struct file *file, void *priv,
 	return err;
 }
 
-static int si476x_radio_s_frequency(struct file *file, void *priv,
+static int si476x_radio_s_frequency(struct file *file,
+				    struct video_device_state *state,
 				    const struct v4l2_frequency *f)
 {
 	int err;
@@ -725,7 +731,8 @@ static int si476x_radio_s_frequency(struct file *file, void *priv,
 	return err;
 }
 
-static int si476x_radio_s_hw_freq_seek(struct file *file, void *priv,
+static int si476x_radio_s_hw_freq_seek(struct file *file,
+				       struct video_device_state *state,
 				       const struct v4l2_hw_freq_seek *seek)
 {
 	int err;
@@ -992,7 +999,8 @@ static int si476x_radio_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int si476x_radio_g_register(struct file *file, void *fh,
+static int si476x_radio_g_register(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_dbg_register *reg)
 {
 	int err;
@@ -1008,7 +1016,9 @@ static int si476x_radio_g_register(struct file *file, void *fh,
 
 	return err;
 }
-static int si476x_radio_s_register(struct file *file, void *fh,
+
+static int si476x_radio_s_register(struct file *file,
+				   struct video_device_state *state,
 				   const struct v4l2_dbg_register *reg)
 {
 
diff --git a/drivers/media/radio/radio-tea5764.c b/drivers/media/radio/radio-tea5764.c
index dd85b0b1bcd962d59acdbefb8c74e469914daf3f..a4f4837e896f50b7aa9c82aaa8a880620f5d3988 100644
--- a/drivers/media/radio/radio-tea5764.c
+++ b/drivers/media/radio/radio-tea5764.c
@@ -272,7 +272,8 @@ static void tea5764_mute(struct tea5764_device *radio, int on)
 }
 
 /* V4L2 vidioc */
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	struct tea5764_device *radio = video_drvdata(file);
@@ -285,7 +286,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_tuner *v)
 {
 	struct tea5764_device *radio = video_drvdata(file);
@@ -311,7 +313,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 				const struct v4l2_tuner *v)
 {
 	struct tea5764_device *radio = video_drvdata(file);
@@ -323,7 +326,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *f)
 {
 	struct tea5764_device *radio = video_drvdata(file);
@@ -347,7 +351,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct tea5764_device *radio = video_drvdata(file);
diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/radio-tea5777.c
index fb9de7bbcd195e193d1c91661b0e8900bbefc9aa..5d2f0b182fc4891233168d92db3ea803d450e19a 100644
--- a/drivers/media/radio/radio-tea5777.c
+++ b/drivers/media/radio/radio-tea5777.c
@@ -251,7 +251,8 @@ static int radio_tea5777_update_read_reg(struct radio_tea5777 *tea, int wait)
  * Linux Video interface
  */
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	struct radio_tea5777 *tea = video_drvdata(file);
@@ -263,7 +264,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_enum_freq_bands(struct file *file, void *priv,
+static int vidioc_enum_freq_bands(struct file *file,
+				  struct video_device_state *state,
 					 struct v4l2_frequency_band *band)
 {
 	struct radio_tea5777 *tea = video_drvdata(file);
@@ -276,7 +278,8 @@ static int vidioc_enum_freq_bands(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 					struct v4l2_tuner *v)
 {
 	struct radio_tea5777 *tea = video_drvdata(file);
@@ -318,7 +321,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 					const struct v4l2_tuner *v)
 {
 	struct radio_tea5777 *tea = video_drvdata(file);
@@ -337,7 +341,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 					struct v4l2_frequency *f)
 {
 	struct radio_tea5777 *tea = video_drvdata(file);
@@ -349,7 +354,8 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 					const struct v4l2_frequency *f)
 {
 	struct radio_tea5777 *tea = video_drvdata(file);
@@ -366,7 +372,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	return radio_tea5777_set_freq(tea);
 }
 
-static int vidioc_s_hw_freq_seek(struct file *file, void *fh,
+static int vidioc_s_hw_freq_seek(struct file *file,
+				 struct video_device_state *state,
 					const struct v4l2_hw_freq_seek *a)
 {
 	struct radio_tea5777 *tea = video_drvdata(file);
diff --git a/drivers/media/radio/radio-timb.c b/drivers/media/radio/radio-timb.c
index a6069b106fd3048b2c730e9c45fd82f0b7302bfb..8d5e4eb0b964b56e2bac71bd626779d224638d9f 100644
--- a/drivers/media/radio/radio-timb.c
+++ b/drivers/media/radio/radio-timb.c
@@ -27,9 +27,9 @@ struct timbradio {
 	struct mutex		lock;
 };
 
-
-static int timbradio_vidioc_querycap(struct file *file, void  *priv,
-	struct v4l2_capability *v)
+static int timbradio_vidioc_querycap(struct file *file,
+				     struct video_device_state *state,
+				     struct v4l2_capability *v)
 {
 	strscpy(v->driver, DRIVER_NAME, sizeof(v->driver));
 	strscpy(v->card, "Timberdale Radio", sizeof(v->card));
@@ -37,29 +37,33 @@ static int timbradio_vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int timbradio_vidioc_g_tuner(struct file *file, void *priv,
-	struct v4l2_tuner *v)
+static int timbradio_vidioc_g_tuner(struct file *file,
+				    struct video_device_state *state,
+				    struct v4l2_tuner *v)
 {
 	struct timbradio *tr = video_drvdata(file);
 	return v4l2_subdev_call(tr->sd_tuner, tuner, g_tuner, v);
 }
 
-static int timbradio_vidioc_s_tuner(struct file *file, void *priv,
-	const struct v4l2_tuner *v)
+static int timbradio_vidioc_s_tuner(struct file *file,
+				    struct video_device_state *state,
+				    const struct v4l2_tuner *v)
 {
 	struct timbradio *tr = video_drvdata(file);
 	return v4l2_subdev_call(tr->sd_tuner, tuner, s_tuner, v);
 }
 
-static int timbradio_vidioc_s_frequency(struct file *file, void *priv,
-	const struct v4l2_frequency *f)
+static int timbradio_vidioc_s_frequency(struct file *file,
+					struct video_device_state *state,
+					const struct v4l2_frequency *f)
 {
 	struct timbradio *tr = video_drvdata(file);
 	return v4l2_subdev_call(tr->sd_tuner, tuner, s_frequency, f);
 }
 
-static int timbradio_vidioc_g_frequency(struct file *file, void *priv,
-	struct v4l2_frequency *f)
+static int timbradio_vidioc_g_frequency(struct file *file,
+					struct video_device_state *state,
+					struct v4l2_frequency *f)
 {
 	struct timbradio *tr = video_drvdata(file);
 	return v4l2_subdev_call(tr->sd_tuner, tuner, g_frequency, f);
diff --git a/drivers/media/radio/si470x/radio-si470x-common.c b/drivers/media/radio/si470x/radio-si470x-common.c
index af0a709100994c1c39a83ac6fcabefebf2783459..26d515903ea583a17476059567824b60a9bb2b69 100644
--- a/drivers/media/radio/si470x/radio-si470x-common.c
+++ b/drivers/media/radio/si470x/radio-si470x-common.c
@@ -597,8 +597,8 @@ static int si470x_s_ctrl(struct v4l2_ctrl *ctrl)
 /*
  * si470x_vidioc_g_tuner - get tuner attributes
  */
-static int si470x_vidioc_g_tuner(struct file *file, void *priv,
-		struct v4l2_tuner *tuner)
+static int si470x_vidioc_g_tuner(struct file *file,
+				 struct video_device_state *state, struct v4l2_tuner *tuner)
 {
 	struct si470x_device *radio = video_drvdata(file);
 	int retval = 0;
@@ -657,7 +657,8 @@ static int si470x_vidioc_g_tuner(struct file *file, void *priv,
 /*
  * si470x_vidioc_s_tuner - set tuner attributes
  */
-static int si470x_vidioc_s_tuner(struct file *file, void *priv,
+static int si470x_vidioc_s_tuner(struct file *file,
+				 struct video_device_state *state,
 		const struct v4l2_tuner *tuner)
 {
 	struct si470x_device *radio = video_drvdata(file);
@@ -683,8 +684,8 @@ static int si470x_vidioc_s_tuner(struct file *file, void *priv,
 /*
  * si470x_vidioc_g_frequency - get tuner or modulator radio frequency
  */
-static int si470x_vidioc_g_frequency(struct file *file, void *priv,
-		struct v4l2_frequency *freq)
+static int si470x_vidioc_g_frequency(struct file *file,
+				     struct video_device_state *state, struct v4l2_frequency *freq)
 {
 	struct si470x_device *radio = video_drvdata(file);
 
@@ -699,7 +700,8 @@ static int si470x_vidioc_g_frequency(struct file *file, void *priv,
 /*
  * si470x_vidioc_s_frequency - set tuner or modulator radio frequency
  */
-static int si470x_vidioc_s_frequency(struct file *file, void *priv,
+static int si470x_vidioc_s_frequency(struct file *file,
+				     struct video_device_state *state,
 		const struct v4l2_frequency *freq)
 {
 	struct si470x_device *radio = video_drvdata(file);
@@ -722,7 +724,8 @@ static int si470x_vidioc_s_frequency(struct file *file, void *priv,
 /*
  * si470x_vidioc_s_hw_freq_seek - set hardware frequency seek
  */
-static int si470x_vidioc_s_hw_freq_seek(struct file *file, void *priv,
+static int si470x_vidioc_s_hw_freq_seek(struct file *file,
+					struct video_device_state *state,
 		const struct v4l2_hw_freq_seek *seek)
 {
 	struct si470x_device *radio = video_drvdata(file);
@@ -739,7 +742,8 @@ static int si470x_vidioc_s_hw_freq_seek(struct file *file, void *priv,
 /*
  * si470x_vidioc_enum_freq_bands - enumerate supported bands
  */
-static int si470x_vidioc_enum_freq_bands(struct file *file, void *priv,
+static int si470x_vidioc_enum_freq_bands(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_frequency_band *band)
 {
 	if (band->tuner != 0)
@@ -755,12 +759,13 @@ const struct v4l2_ctrl_ops si470x_ctrl_ops = {
 };
 EXPORT_SYMBOL_GPL(si470x_ctrl_ops);
 
-static int si470x_vidioc_querycap(struct file *file, void *priv,
+static int si470x_vidioc_querycap(struct file *file,
+				  struct video_device_state *state,
 		struct v4l2_capability *capability)
 {
 	struct si470x_device *radio = video_drvdata(file);
 
-	return radio->vidioc_querycap(file, priv, capability);
+	return radio->vidioc_querycap(file, state, capability);
 };
 
 /*
diff --git a/drivers/media/radio/si4713/radio-platform-si4713.c b/drivers/media/radio/si4713/radio-platform-si4713.c
index 4132968110e3c54e86642bef480793ee06adb883..903e89336af47c03da9258d8ab82a7a8647f5494 100644
--- a/drivers/media/radio/si4713/radio-platform-si4713.c
+++ b/drivers/media/radio/si4713/radio-platform-si4713.c
@@ -55,7 +55,8 @@ static const struct v4l2_file_operations radio_si4713_fops = {
 /* Video4Linux Interface */
 
 /* radio_si4713_querycap - query device capabilities */
-static int radio_si4713_querycap(struct file *file, void *priv,
+static int radio_si4713_querycap(struct file *file,
+				 struct video_device_state *state,
 					struct v4l2_capability *capability)
 {
 	strscpy(capability->driver, "radio-si4713", sizeof(capability->driver));
@@ -75,35 +76,40 @@ static inline struct v4l2_device *get_v4l2_dev(struct file *file)
 	return &((struct radio_si4713_device *)video_drvdata(file))->v4l2_dev;
 }
 
-static int radio_si4713_g_modulator(struct file *file, void *priv,
+static int radio_si4713_g_modulator(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_modulator *vm)
 {
 	return v4l2_device_call_until_err(get_v4l2_dev(file), 0, tuner,
 					  g_modulator, vm);
 }
 
-static int radio_si4713_s_modulator(struct file *file, void *priv,
+static int radio_si4713_s_modulator(struct file *file,
+				    struct video_device_state *state,
 				    const struct v4l2_modulator *vm)
 {
 	return v4l2_device_call_until_err(get_v4l2_dev(file), 0, tuner,
 					  s_modulator, vm);
 }
 
-static int radio_si4713_g_frequency(struct file *file, void *priv,
+static int radio_si4713_g_frequency(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_frequency *vf)
 {
 	return v4l2_device_call_until_err(get_v4l2_dev(file), 0, tuner,
 					  g_frequency, vf);
 }
 
-static int radio_si4713_s_frequency(struct file *file, void *priv,
+static int radio_si4713_s_frequency(struct file *file,
+				    struct video_device_state *state,
 				    const struct v4l2_frequency *vf)
 {
 	return v4l2_device_call_until_err(get_v4l2_dev(file), 0, tuner,
 					  s_frequency, vf);
 }
 
-static long radio_si4713_default(struct file *file, void *priv,
+static long radio_si4713_default(struct file *file,
+				 struct video_device_state *state,
 				 bool valid_prio, unsigned int cmd, void *arg)
 {
 	return v4l2_device_call_until_err(get_v4l2_dev(file), 0, core,
diff --git a/drivers/media/radio/si4713/radio-usb-si4713.c b/drivers/media/radio/si4713/radio-usb-si4713.c
index 2cf36c8abddeacdb70f35feab8994245cc43d32f..d566d8b848db97d8a0e897dd276e6734ae3dbd54 100644
--- a/drivers/media/radio/si4713/radio-usb-si4713.c
+++ b/drivers/media/radio/si4713/radio-usb-si4713.c
@@ -62,7 +62,8 @@ static inline struct si4713_usb_device *to_si4713_dev(struct v4l2_device *v4l2_d
 	return container_of(v4l2_dev, struct si4713_usb_device, v4l2_dev);
 }
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	struct si4713_usb_device *radio = video_drvdata(file);
@@ -73,7 +74,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_modulator(struct file *file, void *priv,
+static int vidioc_g_modulator(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_modulator *vm)
 {
 	struct si4713_usb_device *radio = video_drvdata(file);
@@ -81,7 +83,8 @@ static int vidioc_g_modulator(struct file *file, void *priv,
 	return v4l2_subdev_call(radio->v4l2_subdev, tuner, g_modulator, vm);
 }
 
-static int vidioc_s_modulator(struct file *file, void *priv,
+static int vidioc_s_modulator(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_modulator *vm)
 {
 	struct si4713_usb_device *radio = video_drvdata(file);
@@ -89,7 +92,8 @@ static int vidioc_s_modulator(struct file *file, void *priv,
 	return v4l2_subdev_call(radio->v4l2_subdev, tuner, s_modulator, vm);
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *vf)
 {
 	struct si4713_usb_device *radio = video_drvdata(file);
@@ -97,7 +101,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	return v4l2_subdev_call(radio->v4l2_subdev, tuner, s_frequency, vf);
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *vf)
 {
 	struct si4713_usb_device *radio = video_drvdata(file);
diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea575x.c
index c37315226c427ac3e382055e0d3f8057d8ef6870..659f43bb1e8d9ae8e096c93e4165fa9e6b900ffb 100644
--- a/drivers/media/radio/tea575x.c
+++ b/drivers/media/radio/tea575x.c
@@ -217,7 +217,8 @@ EXPORT_SYMBOL(snd_tea575x_set_freq);
  * Linux Video interface
  */
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *v)
 {
 	struct snd_tea575x *tea = video_drvdata(file);
@@ -262,7 +263,8 @@ int snd_tea575x_enum_freq_bands(struct snd_tea575x *tea,
 }
 EXPORT_SYMBOL(snd_tea575x_enum_freq_bands);
 
-static int vidioc_enum_freq_bands(struct file *file, void *priv,
+static int vidioc_enum_freq_bands(struct file *file,
+				  struct video_device_state *state,
 					 struct v4l2_frequency_band *band)
 {
 	struct snd_tea575x *tea = video_drvdata(file);
@@ -294,7 +296,8 @@ int snd_tea575x_g_tuner(struct snd_tea575x *tea, struct v4l2_tuner *v)
 }
 EXPORT_SYMBOL(snd_tea575x_g_tuner);
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 					struct v4l2_tuner *v)
 {
 	struct snd_tea575x *tea = video_drvdata(file);
@@ -302,7 +305,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return snd_tea575x_g_tuner(tea, v);
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 					const struct v4l2_tuner *v)
 {
 	struct snd_tea575x *tea = video_drvdata(file);
@@ -320,7 +324,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 					struct v4l2_frequency *f)
 {
 	struct snd_tea575x *tea = video_drvdata(file);
@@ -332,7 +337,8 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 					const struct v4l2_frequency *f)
 {
 	struct snd_tea575x *tea = video_drvdata(file);
@@ -440,7 +446,8 @@ int snd_tea575x_s_hw_freq_seek(struct file *file, struct snd_tea575x *tea,
 }
 EXPORT_SYMBOL(snd_tea575x_s_hw_freq_seek);
 
-static int vidioc_s_hw_freq_seek(struct file *file, void *fh,
+static int vidioc_s_hw_freq_seek(struct file *file,
+				 struct video_device_state *state,
 					const struct v4l2_hw_freq_seek *a)
 {
 	struct snd_tea575x *tea = video_drvdata(file);
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index a3df3a33237e2f2b22b74d5b65065f952b9a78d8..df5d6969ea02e44c9b0e489a0b19e69751f421f3 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -694,7 +694,8 @@ static const struct v4l2_fwht_pixfmt_info *find_fmt(u32 fmt)
 	return info;
 }
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, VICODEC_NAME, sizeof(cap->driver));
@@ -742,7 +743,8 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
@@ -750,7 +752,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	return enum_fmt(f, ctx, false);
 }
 
-static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
@@ -816,13 +819,15 @@ static int vidioc_g_fmt(struct vicodec_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	return vidioc_g_fmt(file2ctx(file), f);
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	return vidioc_g_fmt(file2ctx(file), f);
@@ -889,7 +894,8 @@ static int vidioc_try_fmt(struct vicodec_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
@@ -926,7 +932,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return vidioc_try_fmt(ctx, f);
 }
 
-static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_out(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
@@ -1042,19 +1049,21 @@ static int vidioc_s_fmt(struct vicodec_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	int ret;
 
-	ret = vidioc_try_fmt_vid_cap(file, priv, f);
+	ret = vidioc_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
 	return vidioc_s_fmt(file2ctx(file), f);
 }
 
-static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
@@ -1069,7 +1078,7 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 	q_data = get_q_data(ctx, f->type);
 	q_data_cap = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	ret = vidioc_try_fmt_vid_out(file, priv, f);
+	ret = vidioc_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
@@ -1131,7 +1140,8 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 	return ret;
 }
 
-static int vidioc_g_selection(struct file *file, void *priv,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
@@ -1180,7 +1190,8 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int vidioc_s_selection(struct file *file, void *priv,
+static int vidioc_s_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
@@ -1207,20 +1218,21 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vicodec_encoder_cmd(struct file *file, void *priv,
+static int vicodec_encoder_cmd(struct file *file,
+			       struct video_device_state *state,
 			    struct v4l2_encoder_cmd *ec)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, ec);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, state, ec);
 	if (ret < 0)
 		return ret;
 
 	if (!vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
 		return 0;
 
-	ret = v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
+	ret = v4l2_m2m_ioctl_encoder_cmd(file, state, ec);
 	if (ret < 0)
 		return ret;
 
@@ -1235,7 +1247,8 @@ static int vicodec_encoder_cmd(struct file *file, void *priv,
 	return 0;
 }
 
-static int vicodec_decoder_cmd(struct file *file, void *priv,
+static int vicodec_decoder_cmd(struct file *file,
+			       struct video_device_state *state,
 			    struct v4l2_decoder_cmd *dc)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
@@ -1247,14 +1260,14 @@ static int vicodec_decoder_cmd(struct file *file, void *priv,
 	 */
 	WARN_ON(ctx->is_stateless);
 
-	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, priv, dc);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, state, dc);
 	if (ret < 0)
 		return ret;
 
 	if (!vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
 		return 0;
 
-	ret = v4l2_m2m_ioctl_decoder_cmd(file, priv, dc);
+	ret = v4l2_m2m_ioctl_decoder_cmd(file, state, dc);
 	if (ret < 0)
 		return ret;
 
@@ -1269,7 +1282,8 @@ static int vicodec_decoder_cmd(struct file *file, void *priv,
 	return 0;
 }
 
-static int vicodec_enum_framesizes(struct file *file, void *priv,
+static int vicodec_enum_framesizes(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_frmsizeenum *fsize)
 {
 	switch (fsize->pixel_format) {
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 86c32699111adc838d4304ec0c0f0026db128d70..c89890bfede5fe1818fd2d4b0b4749aaa815f33a 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -648,7 +648,8 @@ static void device_work(struct work_struct *w)
 /*
  * video ioctls
  */
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
@@ -689,19 +690,22 @@ static int enum_fmt(struct v4l2_fmtdesc *f, u32 type)
 	return -EINVAL;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return enum_fmt(f, MEM2MEM_CAPTURE);
 }
 
-static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return enum_fmt(f, MEM2MEM_OUTPUT);
 }
 
-static int vidioc_enum_framesizes(struct file *file, void *priv,
+static int vidioc_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	if (fsize->index != 0)
@@ -778,7 +782,8 @@ static int vidioc_g_fmt_mplane(struct vim2m_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct vim2m_dev *dev = video_drvdata(file);
@@ -789,7 +794,8 @@ static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
 	return vidioc_g_fmt(file2ctx(file), f);
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct vim2m_dev *dev = video_drvdata(file);
@@ -800,7 +806,8 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return vidioc_g_fmt(file2ctx(file), f);
 }
 
-static int vidioc_g_fmt_vid_out_mplane(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_out_mplane(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	struct vim2m_dev *dev = video_drvdata(file);
@@ -811,7 +818,8 @@ static int vidioc_g_fmt_vid_out_mplane(struct file *file, void *priv,
 	return vidioc_g_fmt_mplane(file2ctx(file), f);
 }
 
-static int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap_mplane(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	struct vim2m_dev *dev = video_drvdata(file);
@@ -848,7 +856,8 @@ static int vidioc_try_fmt(struct v4l2_format *f, bool is_mplane)
 	return ret;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct vim2m_fmt *fmt;
@@ -877,7 +886,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return vidioc_try_fmt(f, false);
 }
 
-static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap_mplane(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_format *f)
 {
 	struct vim2m_fmt *fmt;
@@ -906,7 +916,8 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 	return vidioc_try_fmt(f, true);
 }
 
-static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_out(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct vim2m_fmt *fmt;
@@ -933,7 +944,8 @@ static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
 	return vidioc_try_fmt(f, false);
 }
 
-static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_out_mplane(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_format *f)
 {
 	struct vim2m_fmt *fmt;
@@ -1007,7 +1019,8 @@ static int vidioc_s_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	int ret;
@@ -1016,14 +1029,15 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	if (dev->multiplanar)
 		return -ENOTTY;
 
-	ret = vidioc_try_fmt_vid_cap(file, priv, f);
+	ret = vidioc_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
 	return vidioc_s_fmt(file2ctx(file), f);
 }
 
-static int vidioc_s_fmt_vid_cap_mplane(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap_mplane(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	int ret;
@@ -1032,14 +1046,15 @@ static int vidioc_s_fmt_vid_cap_mplane(struct file *file, void *priv,
 	if (!dev->multiplanar)
 		return -ENOTTY;
 
-	ret = vidioc_try_fmt_vid_cap_mplane(file, priv, f);
+	ret = vidioc_try_fmt_vid_cap_mplane(file, state, f);
 	if (ret)
 		return ret;
 
 	return vidioc_s_fmt(file2ctx(file), f);
 }
 
-static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct vim2m_ctx *ctx = file2ctx(file);
@@ -1049,7 +1064,7 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 	if (dev->multiplanar)
 		return -ENOTTY;
 
-	ret = vidioc_try_fmt_vid_out(file, priv, f);
+	ret = vidioc_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
@@ -1063,7 +1078,8 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 	return ret;
 }
 
-static int vidioc_s_fmt_vid_out_mplane(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_out_mplane(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	struct vim2m_ctx *ctx = file2ctx(file);
@@ -1073,7 +1089,7 @@ static int vidioc_s_fmt_vid_out_mplane(struct file *file, void *priv,
 	if (!dev->multiplanar)
 		return -ENOTTY;
 
-	ret = vidioc_try_fmt_vid_out_mplane(file, priv, f);
+	ret = vidioc_try_fmt_vid_out_mplane(file, state, f);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 7f6124025fc9dc9716251565c504bc33ad81b345..447a76a55e68e0cf79a3087164d602e493dce4cd 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -52,7 +52,8 @@ struct vimc_capture_buffer {
 	struct list_head list;
 };
 
-static int vimc_capture_querycap(struct file *file, void *priv,
+static int vimc_capture_querycap(struct file *file,
+				 struct video_device_state *state,
 			     struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, VIMC_PDEV_NAME, sizeof(cap->driver));
@@ -70,7 +71,8 @@ static void vimc_capture_get_format(struct vimc_ent_device *ved,
 	*fmt = vcapture->format;
 }
 
-static int vimc_capture_g_fmt_vid_cap(struct file *file, void *priv,
+static int vimc_capture_g_fmt_vid_cap(struct file *file,
+				      struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct vimc_capture_device *vcapture = video_drvdata(file);
@@ -80,7 +82,8 @@ static int vimc_capture_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vimc_capture_try_fmt_vid_cap(struct file *file, void *priv,
+static int vimc_capture_try_fmt_vid_cap(struct file *file,
+					struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct v4l2_pix_format *format = &f->fmt.pix;
@@ -112,7 +115,8 @@ static int vimc_capture_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vimc_capture_s_fmt_vid_cap(struct file *file, void *priv,
+static int vimc_capture_s_fmt_vid_cap(struct file *file,
+				      struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct vimc_capture_device *vcapture = video_drvdata(file);
@@ -122,7 +126,7 @@ static int vimc_capture_s_fmt_vid_cap(struct file *file, void *priv,
 	if (vb2_is_busy(&vcapture->queue))
 		return -EBUSY;
 
-	ret = vimc_capture_try_fmt_vid_cap(file, priv, f);
+	ret = vimc_capture_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -145,7 +149,8 @@ static int vimc_capture_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vimc_capture_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vimc_capture_enum_fmt_vid_cap(struct file *file,
+					 struct video_device_state *state,
 				     struct v4l2_fmtdesc *f)
 {
 	const struct vimc_pix_map *vpix;
@@ -167,7 +172,8 @@ static int vimc_capture_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vimc_capture_enum_framesizes(struct file *file, void *priv,
+static int vimc_capture_enum_framesizes(struct file *file,
+					struct video_device_state *state,
 				    struct v4l2_frmsizeenum *fsize)
 {
 	const struct vimc_pix_map *vpix;
diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
index 8be505d8908c98bb50118dfa2f491d5ac68772ec..bcba5959432df24d4011c3be20c3acd226540991 100644
--- a/drivers/media/test-drivers/visl/visl-video.c
+++ b/drivers/media/test-drivers/visl/visl-video.c
@@ -332,7 +332,8 @@ static struct visl_q_data *get_q_data(struct visl_ctx *ctx,
 	return NULL;
 }
 
-static int visl_querycap(struct file *file, void *priv,
+static int visl_querycap(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, VISL_NAME, sizeof(cap->driver));
@@ -343,7 +344,8 @@ static int visl_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int visl_enum_fmt_vid_cap(struct file *file, void *priv,
+static int visl_enum_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	struct visl_ctx *ctx = visl_file_to_ctx(file);
@@ -365,7 +367,8 @@ static int visl_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int visl_enum_fmt_vid_out(struct file *file, void *priv,
+static int visl_enum_fmt_vid_out(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(visl_coded_fmts))
@@ -375,7 +378,8 @@ static int visl_enum_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int visl_g_fmt_vid_cap(struct file *file, void *priv,
+static int visl_g_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct visl_ctx *ctx = visl_file_to_ctx(file);
@@ -384,7 +388,8 @@ static int visl_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int visl_g_fmt_vid_out(struct file *file, void *priv,
+static int visl_g_fmt_vid_out(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct visl_ctx *ctx = visl_file_to_ctx(file);
@@ -393,7 +398,8 @@ static int visl_g_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int visl_try_fmt_vid_cap(struct file *file, void *priv,
+static int visl_try_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -423,7 +429,8 @@ static int visl_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int visl_try_fmt_vid_out(struct file *file, void *priv,
+static int visl_try_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -449,7 +456,8 @@ static int visl_try_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int visl_s_fmt_vid_out(struct file *file, void *priv,
+static int visl_s_fmt_vid_out(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct visl_ctx *ctx = visl_file_to_ctx(file);
@@ -465,7 +473,7 @@ static int visl_s_fmt_vid_out(struct file *file, void *priv,
 	dprintk(ctx->dev, "Trying to set the OUTPUT format to:\n");
 	visl_print_fmt(ctx, f);
 
-	ret = visl_try_fmt_vid_out(file, priv, f);
+	ret = visl_try_fmt_vid_out(file, state, f);
 	if (ret)
 		return ret;
 
@@ -489,7 +497,8 @@ static int visl_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-static int visl_s_fmt_vid_cap(struct file *file, void *priv,
+static int visl_s_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct visl_ctx *ctx = visl_file_to_ctx(file);
@@ -498,7 +507,7 @@ static int visl_s_fmt_vid_cap(struct file *file, void *priv,
 	dprintk(ctx->dev, "Trying to set the CAPTURE format to:\n");
 	visl_print_fmt(ctx, f);
 
-	ret = visl_try_fmt_vid_cap(file, priv, f);
+	ret = visl_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -511,7 +520,8 @@ static int visl_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int visl_enum_framesizes(struct file *file, void *priv,
+static int visl_enum_framesizes(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_frmsizeenum *fsize)
 {
 	const struct visl_coded_format_desc *fmt;
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 86506be36acb0cfacede5f000b95c0bc491ab5a8..d24c06dbae5ec38e9254a309c3d0869c48f45f34 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -258,7 +258,8 @@ static const u8 vivid_hdmi_edid[256] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x92,
 };
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *cap)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -277,49 +278,57 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_s_hw_freq_seek(struct file *file, void *priv, const struct v4l2_hw_freq_seek *a)
+static int vidioc_s_hw_freq_seek(struct file *file,
+				 struct video_device_state *state,
+				 const struct v4l2_hw_freq_seek *a)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_RADIO)
-		return vivid_radio_rx_s_hw_freq_seek(file, priv, a);
+		return vivid_radio_rx_s_hw_freq_seek(file, state, a);
 	return -ENOTTY;
 }
 
-static int vidioc_enum_freq_bands(struct file *file, void *priv, struct v4l2_frequency_band *band)
+static int vidioc_enum_freq_bands(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_frequency_band *band)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_RADIO)
-		return vivid_radio_rx_enum_freq_bands(file, priv, band);
+		return vivid_radio_rx_enum_freq_bands(file, state, band);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
-		return vivid_sdr_enum_freq_bands(file, priv, band);
+		return vivid_sdr_enum_freq_bands(file, state, band);
 	return -ENOTTY;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
+static int vidioc_g_tuner(struct file *file, struct video_device_state *state,
+			  struct v4l2_tuner *vt)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_RADIO)
-		return vivid_radio_rx_g_tuner(file, priv, vt);
+		return vivid_radio_rx_g_tuner(file, state, vt);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
-		return vivid_sdr_g_tuner(file, priv, vt);
-	return vivid_video_g_tuner(file, priv, vt);
+		return vivid_sdr_g_tuner(file, state, vt);
+	return vivid_video_g_tuner(file, state, vt);
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
+static int vidioc_s_tuner(struct file *file, struct video_device_state *state,
+			  const struct v4l2_tuner *vt)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_RADIO)
-		return vivid_radio_rx_s_tuner(file, priv, vt);
+		return vivid_radio_rx_s_tuner(file, state, vt);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
-		return vivid_sdr_s_tuner(file, priv, vt);
-	return vivid_video_s_tuner(file, priv, vt);
+		return vivid_sdr_s_tuner(file, state, vt);
+	return vivid_video_s_tuner(file, state, vt);
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf)
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
@@ -329,11 +338,13 @@ static int vidioc_g_frequency(struct file *file, void *priv, struct v4l2_frequen
 			vdev->vfl_dir == VFL_DIR_RX ?
 			&dev->radio_rx_freq : &dev->radio_tx_freq, vf);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
-		return vivid_sdr_g_frequency(file, priv, vf);
-	return vivid_video_g_frequency(file, priv, vf);
+		return vivid_sdr_g_frequency(file, state, vf);
+	return vivid_video_g_frequency(file, state, vf);
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf)
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
+			      const struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
@@ -343,113 +354,125 @@ static int vidioc_s_frequency(struct file *file, void *priv, const struct v4l2_f
 			vdev->vfl_dir == VFL_DIR_RX ?
 			&dev->radio_rx_freq : &dev->radio_tx_freq, vf);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
-		return vivid_sdr_s_frequency(file, priv, vf);
-	return vivid_video_s_frequency(file, priv, vf);
+		return vivid_sdr_s_frequency(file, state, vf);
+	return vivid_video_s_frequency(file, state, vf);
 }
 
-static int vidioc_overlay(struct file *file, void *priv, unsigned i)
+static int vidioc_overlay(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
 		return -ENOTTY;
-	return vivid_vid_out_overlay(file, priv, i);
+	return vivid_vid_out_overlay(file, state, i);
 }
 
-static int vidioc_g_fbuf(struct file *file, void *priv, struct v4l2_framebuffer *a)
+static int vidioc_g_fbuf(struct file *file, struct video_device_state *state,
+			 struct v4l2_framebuffer *a)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
 		return -ENOTTY;
-	return vivid_vid_out_g_fbuf(file, priv, a);
+	return vivid_vid_out_g_fbuf(file, state, a);
 }
 
-static int vidioc_s_fbuf(struct file *file, void *priv, const struct v4l2_framebuffer *a)
+static int vidioc_s_fbuf(struct file *file, struct video_device_state *state,
+			 const struct v4l2_framebuffer *a)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
 		return -ENOTTY;
-	return vivid_vid_out_s_fbuf(file, priv, a);
+	return vivid_vid_out_s_fbuf(file, state, a);
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_s_std(file, priv, id);
-	return vivid_vid_out_s_std(file, priv, id);
+		return vivid_vid_cap_s_std(file, state, id);
+	return vivid_vid_out_s_std(file, state, id);
 }
 
-static int vidioc_s_dv_timings(struct file *file, void *priv, struct v4l2_dv_timings *timings)
+static int vidioc_s_dv_timings(struct file *file,
+			       struct video_device_state *state,
+			       struct v4l2_dv_timings *timings)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_s_dv_timings(file, priv, timings);
-	return vivid_vid_out_s_dv_timings(file, priv, timings);
+		return vivid_vid_cap_s_dv_timings(file, state, timings);
+	return vivid_vid_out_s_dv_timings(file, state, timings);
 }
 
-static int vidioc_g_pixelaspect(struct file *file, void *priv,
-				int type, struct v4l2_fract *f)
+static int vidioc_g_pixelaspect(struct file *file,
+				struct video_device_state *state, int type,
+				struct v4l2_fract *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_g_pixelaspect(file, priv, type, f);
-	return vivid_vid_out_g_pixelaspect(file, priv, type, f);
+		return vivid_vid_cap_g_pixelaspect(file, state, type, f);
+	return vivid_vid_out_g_pixelaspect(file, state, type, f);
 }
 
-static int vidioc_g_selection(struct file *file, void *priv,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *sel)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_g_selection(file, priv, sel);
-	return vivid_vid_out_g_selection(file, priv, sel);
+		return vivid_vid_cap_g_selection(file, state, sel);
+	return vivid_vid_out_g_selection(file, state, sel);
 }
 
-static int vidioc_s_selection(struct file *file, void *priv,
+static int vidioc_s_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *sel)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_s_selection(file, priv, sel);
-	return vivid_vid_out_s_selection(file, priv, sel);
+		return vivid_vid_cap_s_selection(file, state, sel);
+	return vivid_vid_out_s_selection(file, state, sel);
 }
 
-static int vidioc_g_parm(struct file *file, void *priv,
+static int vidioc_g_parm(struct file *file,
+			 struct video_device_state *state,
 			  struct v4l2_streamparm *parm)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_parm_tch(file, priv, parm);
+		return vivid_g_parm_tch(file, state, parm);
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_g_parm(file, priv, parm);
-	return vivid_vid_out_g_parm(file, priv, parm);
+		return vivid_vid_cap_g_parm(file, state, parm);
+	return vivid_vid_out_g_parm(file, state, parm);
 }
 
-static int vidioc_s_parm(struct file *file, void *priv,
+static int vidioc_s_parm(struct file *file,
+			 struct video_device_state *state,
 			  struct v4l2_streamparm *parm)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_s_parm(file, priv, parm);
+		return vivid_vid_cap_s_parm(file, state, parm);
 	return -ENOTTY;
 }
 
-static int vidioc_log_status(struct file *file, void *priv)
+static int vidioc_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
 
-	v4l2_ctrl_log_status(file, priv);
+	v4l2_ctrl_log_status(file, state);
 	if (vdev->vfl_dir == VFL_DIR_RX && vdev->vfl_type == VFL_TYPE_VIDEO)
 		tpg_log_status(&dev->tpg);
 	return 0;
@@ -484,102 +507,112 @@ static __poll_t vivid_radio_poll(struct file *file, struct poll_table_struct *wa
 	return vivid_radio_tx_poll(file, wait);
 }
 
-static int vivid_enum_input(struct file *file, void *priv,
+static int vivid_enum_input(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_input *inp)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_enum_input_tch(file, priv, inp);
-	return vidioc_enum_input(file, priv, inp);
+		return vivid_enum_input_tch(file, state, inp);
+	return vidioc_enum_input(file, state, inp);
 }
 
-static int vivid_g_input(struct file *file, void *priv, unsigned int *i)
+static int vivid_g_input(struct file *file, struct video_device_state *state,
+			 unsigned int *i)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_input_tch(file, priv, i);
-	return vidioc_g_input(file, priv, i);
+		return vivid_g_input_tch(file, state, i);
+	return vidioc_g_input(file, state, i);
 }
 
-static int vivid_s_input(struct file *file, void *priv, unsigned int i)
+static int vivid_s_input(struct file *file, struct video_device_state *state,
+			 unsigned int i)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_s_input_tch(file, priv, i);
-	return vidioc_s_input(file, priv, i);
+		return vivid_s_input_tch(file, state, i);
+	return vidioc_s_input(file, state, i);
 }
 
-static int vivid_enum_fmt_cap(struct file *file, void  *priv,
+static int vivid_enum_fmt_cap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_fmtdesc *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_enum_fmt_tch(file, priv, f);
-	return vivid_enum_fmt_vid(file, priv, f);
+		return vivid_enum_fmt_tch(file, state, f);
+	return vivid_enum_fmt_vid(file, state, f);
 }
 
-static int vivid_g_fmt_cap(struct file *file, void *priv,
+static int vivid_g_fmt_cap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_fmt_tch(file, priv, f);
-	return vidioc_g_fmt_vid_cap(file, priv, f);
+		return vivid_g_fmt_tch(file, state, f);
+	return vidioc_g_fmt_vid_cap(file, state, f);
 }
 
-static int vivid_try_fmt_cap(struct file *file, void *priv,
+static int vivid_try_fmt_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_fmt_tch(file, priv, f);
-	return vidioc_try_fmt_vid_cap(file, priv, f);
+		return vivid_g_fmt_tch(file, state, f);
+	return vidioc_try_fmt_vid_cap(file, state, f);
 }
 
-static int vivid_s_fmt_cap(struct file *file, void *priv,
+static int vivid_s_fmt_cap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_fmt_tch(file, priv, f);
-	return vidioc_s_fmt_vid_cap(file, priv, f);
+		return vivid_g_fmt_tch(file, state, f);
+	return vidioc_s_fmt_vid_cap(file, state, f);
 }
 
-static int vivid_g_fmt_cap_mplane(struct file *file, void *priv,
+static int vivid_g_fmt_cap_mplane(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_fmt_tch_mplane(file, priv, f);
-	return vidioc_g_fmt_vid_cap_mplane(file, priv, f);
+		return vivid_g_fmt_tch_mplane(file, state, f);
+	return vidioc_g_fmt_vid_cap_mplane(file, state, f);
 }
 
-static int vivid_try_fmt_cap_mplane(struct file *file, void *priv,
+static int vivid_try_fmt_cap_mplane(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_fmt_tch_mplane(file, priv, f);
-	return vidioc_try_fmt_vid_cap_mplane(file, priv, f);
+		return vivid_g_fmt_tch_mplane(file, state, f);
+	return vidioc_try_fmt_vid_cap_mplane(file, state, f);
 }
 
-static int vivid_s_fmt_cap_mplane(struct file *file, void *priv,
+static int vivid_s_fmt_cap_mplane(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_fmt_tch_mplane(file, priv, f);
-	return vidioc_s_fmt_vid_cap_mplane(file, priv, f);
+		return vivid_g_fmt_tch_mplane(file, state, f);
+	return vidioc_s_fmt_vid_cap_mplane(file, state, f);
 }
 
 static bool vivid_is_in_use(bool valid, struct video_device *vdev)
@@ -689,7 +722,8 @@ static const struct v4l2_file_operations vivid_radio_fops = {
 	.unlocked_ioctl = video_ioctl2,
 };
 
-static int vidioc_reqbufs(struct file *file, void *priv,
+static int vidioc_reqbufs(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_requestbuffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -706,10 +740,11 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 			return r;
 	}
 
-	return vb2_ioctl_reqbufs(file, priv, p);
+	return vb2_ioctl_reqbufs(file, state, p);
 }
 
-static int vidioc_create_bufs(struct file *file, void *priv,
+static int vidioc_create_bufs(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_create_buffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -726,7 +761,7 @@ static int vidioc_create_bufs(struct file *file, void *priv,
 			return r;
 	}
 
-	return vb2_ioctl_create_bufs(file, priv, p);
+	return vb2_ioctl_create_bufs(file, state, p);
 }
 
 static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-cap.c b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
index c7aaecc0b5a24726639a253accfc50383a84e846..3206ccdeb377f54b76d8fde199aa6e4049ff8aae 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
@@ -124,7 +124,8 @@ const struct vb2_ops vivid_meta_cap_qops = {
 	.buf_request_complete	= meta_cap_buf_request_complete,
 };
 
-int vidioc_enum_fmt_meta_cap(struct file *file, void  *priv,
+int vidioc_enum_fmt_meta_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_fmtdesc *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -140,7 +141,8 @@ int vidioc_enum_fmt_meta_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-int vidioc_g_fmt_meta_cap(struct file *file, void *priv,
+int vidioc_g_fmt_meta_cap(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-cap.h b/drivers/media/test-drivers/vivid/vivid-meta-cap.h
index 4670d00d1576df0e41a961ad5d5040d92787dfa1..c11758df76c3f86d0972b653ebbeefe4d8601d22 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-meta-cap.h
@@ -18,10 +18,12 @@ struct vivid_uvc_meta_buf {
 void vivid_meta_cap_fillbuff(struct vivid_dev *dev,
 			     struct vivid_buffer *buf, u64 soe);
 
-int vidioc_enum_fmt_meta_cap(struct file *file, void  *priv,
+int vidioc_enum_fmt_meta_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_fmtdesc *f);
 
-int vidioc_g_fmt_meta_cap(struct file *file, void *priv,
+int vidioc_g_fmt_meta_cap(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_format *f);
 
 extern const struct vb2_ops vivid_meta_cap_qops;
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
index 55e5e5dec2f2ab1bdc01a2d1d479a6f1eb758299..9b6b556c475f713e23098d9b62dce71945295dac 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
@@ -124,7 +124,8 @@ const struct vb2_ops vivid_meta_out_qops = {
 	.buf_request_complete   = meta_out_buf_request_complete,
 };
 
-int vidioc_enum_fmt_meta_out(struct file *file, void  *priv,
+int vidioc_enum_fmt_meta_out(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_fmtdesc *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -140,7 +141,8 @@ int vidioc_enum_fmt_meta_out(struct file *file, void  *priv,
 	return 0;
 }
 
-int vidioc_g_fmt_meta_out(struct file *file, void *priv,
+int vidioc_g_fmt_meta_out(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.h b/drivers/media/test-drivers/vivid/vivid-meta-out.h
index 0c639b7c284276f4c5e5180b765dbc17d884927f..dc3594de999a052708fb35944565e939357ac36a 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-out.h
+++ b/drivers/media/test-drivers/vivid/vivid-meta-out.h
@@ -13,11 +13,14 @@ struct vivid_meta_out_buf {
 };
 
 void vivid_meta_out_process(struct vivid_dev *dev, struct vivid_buffer *buf);
-int vidioc_enum_fmt_meta_out(struct file *file, void  *priv,
+int vidioc_enum_fmt_meta_out(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_fmtdesc *f);
-int vidioc_g_fmt_meta_out(struct file *file, void *priv,
+int vidioc_g_fmt_meta_out(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_format *f);
-int vidioc_s_fmt_meta_out(struct file *file, void *priv,
+int vidioc_s_fmt_meta_out(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_format *f);
 
 extern const struct vb2_ops vivid_meta_out_qops;
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-rx.c b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
index b5e3026f883ee69d48db552623d7961677eb91fd..7ff89e6488fcde1d8ff2a1a996a3ac8d2d0dca83 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-rx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
@@ -133,7 +133,9 @@ __poll_t vivid_radio_rx_poll(struct file *file, struct poll_table_struct *wait)
 	return EPOLLIN | EPOLLRDNORM | v4l2_ctrl_poll(file, wait);
 }
 
-int vivid_radio_rx_enum_freq_bands(struct file *file, void *priv, struct v4l2_frequency_band *band)
+int vivid_radio_rx_enum_freq_bands(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_frequency_band *band)
 {
 	if (band->tuner != 0)
 		return -EINVAL;
@@ -145,7 +147,9 @@ int vivid_radio_rx_enum_freq_bands(struct file *file, void *priv, struct v4l2_fr
 	return 0;
 }
 
-int vivid_radio_rx_s_hw_freq_seek(struct file *file, void *priv, const struct v4l2_hw_freq_seek *a)
+int vivid_radio_rx_s_hw_freq_seek(struct file *file,
+				  struct video_device_state *state,
+				  const struct v4l2_hw_freq_seek *a)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	unsigned low, high;
@@ -214,7 +218,9 @@ int vivid_radio_rx_s_hw_freq_seek(struct file *file, void *priv, const struct v4
 	return 0;
 }
 
-int vivid_radio_rx_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
+int vivid_radio_rx_g_tuner(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_tuner *vt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	int delta = 800;
@@ -267,7 +273,9 @@ int vivid_radio_rx_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 	return 0;
 }
 
-int vivid_radio_rx_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
+int vivid_radio_rx_s_tuner(struct file *file,
+			   struct video_device_state *state,
+			   const struct v4l2_tuner *vt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-rx.h b/drivers/media/test-drivers/vivid/vivid-radio-rx.h
index a2ae17c78ecee08d42cd3a8e8d30b01caec1bb99..30dcb534862b80d2447e089c31041406ae07e284 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-rx.h
+++ b/drivers/media/test-drivers/vivid/vivid-radio-rx.h
@@ -11,9 +11,17 @@
 ssize_t vivid_radio_rx_read(struct file *, char __user *, size_t, loff_t *);
 __poll_t vivid_radio_rx_poll(struct file *file, struct poll_table_struct *wait);
 
-int vivid_radio_rx_enum_freq_bands(struct file *file, void *priv, struct v4l2_frequency_band *band);
-int vivid_radio_rx_s_hw_freq_seek(struct file *file, void *priv, const struct v4l2_hw_freq_seek *a);
-int vivid_radio_rx_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt);
-int vivid_radio_rx_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt);
+int vivid_radio_rx_enum_freq_bands(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_frequency_band *band);
+int vivid_radio_rx_s_hw_freq_seek(struct file *file,
+				  struct video_device_state *state,
+				  const struct v4l2_hw_freq_seek *a);
+int vivid_radio_rx_g_tuner(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_tuner *vt);
+int vivid_radio_rx_s_tuner(struct file *file,
+			   struct video_device_state *state,
+			   const struct v4l2_tuner *vt);
 
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-tx.c b/drivers/media/test-drivers/vivid/vivid-radio-tx.c
index ada60722066eaceef1371d711e5bc408ff0fa6b3..a81b74b45a6441a43c0773326d2a39d4fc5544f7 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-tx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-tx.c
@@ -96,7 +96,8 @@ __poll_t vivid_radio_tx_poll(struct file *file, struct poll_table_struct *wait)
 	return EPOLLOUT | EPOLLWRNORM | v4l2_ctrl_poll(file, wait);
 }
 
-int vidioc_g_modulator(struct file *file, void *priv, struct v4l2_modulator *a)
+int vidioc_g_modulator(struct file *file, struct video_device_state *state,
+		       struct v4l2_modulator *a)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -115,7 +116,8 @@ int vidioc_g_modulator(struct file *file, void *priv, struct v4l2_modulator *a)
 	return 0;
 }
 
-int vidioc_s_modulator(struct file *file, void *priv, const struct v4l2_modulator *a)
+int vidioc_s_modulator(struct file *file, struct video_device_state *state,
+		       const struct v4l2_modulator *a)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-tx.h b/drivers/media/test-drivers/vivid/vivid-radio-tx.h
index 20cb6f1363ffd07805d1c7c86f6d4111ac5948a5..d2e636e20dac373058d04e72f41c7d3a0f0d6f9b 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-tx.h
+++ b/drivers/media/test-drivers/vivid/vivid-radio-tx.h
@@ -11,7 +11,9 @@
 ssize_t vivid_radio_tx_write(struct file *, const char __user *, size_t, loff_t *);
 __poll_t vivid_radio_tx_poll(struct file *file, struct poll_table_struct *wait);
 
-int vidioc_g_modulator(struct file *file, void *priv, struct v4l2_modulator *a);
-int vidioc_s_modulator(struct file *file, void *priv, const struct v4l2_modulator *a);
+int vidioc_g_modulator(struct file *file, struct video_device_state *state,
+		       struct v4l2_modulator *a);
+int vidioc_s_modulator(struct file *file, struct video_device_state *state,
+		       const struct v4l2_modulator *a);
 
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index 2664a593e8e1b5b03b0aec03169359c238cca205..0a8b78f423ba56425b917491bb1cfa256a558137 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -344,7 +344,8 @@ const struct vb2_ops vivid_sdr_cap_qops = {
 	.buf_request_complete	= sdr_cap_buf_request_complete,
 };
 
-int vivid_sdr_enum_freq_bands(struct file *file, void *priv,
+int vivid_sdr_enum_freq_bands(struct file *file,
+			      struct video_device_state *state,
 		struct v4l2_frequency_band *band)
 {
 	switch (band->tuner) {
@@ -363,8 +364,8 @@ int vivid_sdr_enum_freq_bands(struct file *file, void *priv,
 	}
 }
 
-int vivid_sdr_g_frequency(struct file *file, void *priv,
-		struct v4l2_frequency *vf)
+int vivid_sdr_g_frequency(struct file *file,
+			  struct video_device_state *state, struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -382,7 +383,8 @@ int vivid_sdr_g_frequency(struct file *file, void *priv,
 	}
 }
 
-int vivid_sdr_s_frequency(struct file *file, void *priv,
+int vivid_sdr_s_frequency(struct file *file,
+			  struct video_device_state *state,
 		const struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -423,7 +425,8 @@ int vivid_sdr_s_frequency(struct file *file, void *priv,
 	}
 }
 
-int vivid_sdr_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
+int vivid_sdr_g_tuner(struct file *file, struct video_device_state *state,
+		      struct v4l2_tuner *vt)
 {
 	switch (vt->index) {
 	case 0:
@@ -447,14 +450,17 @@ int vivid_sdr_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 	}
 }
 
-int vivid_sdr_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
+int vivid_sdr_s_tuner(struct file *file, struct video_device_state *state,
+		      const struct v4l2_tuner *vt)
 {
 	if (vt->index > 1)
 		return -EINVAL;
 	return 0;
 }
 
-int vidioc_enum_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+int vidioc_enum_fmt_sdr_cap(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(formats))
 		return -EINVAL;
@@ -462,7 +468,8 @@ int vidioc_enum_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_fmtdesc *
 	return 0;
 }
 
-int vidioc_g_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f)
+int vidioc_g_fmt_sdr_cap(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -471,7 +478,8 @@ int vidioc_g_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-int vidioc_s_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f)
+int vidioc_s_fmt_sdr_cap(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct vb2_queue *q = &dev->vb_sdr_cap_q;
@@ -495,7 +503,9 @@ int vidioc_s_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-int vidioc_try_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f)
+int vidioc_try_fmt_sdr_cap(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_format *f)
 {
 	int i;
 
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.h b/drivers/media/test-drivers/vivid/vivid-sdr-cap.h
index 3d8eeabbfc1073e6aab1ce493442a4ae10b36369..55417622cf6c8bf2166abcb7c65e0a346e0ec5bb 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.h
@@ -8,15 +8,27 @@
 #ifndef _VIVID_SDR_CAP_H_
 #define _VIVID_SDR_CAP_H_
 
-int vivid_sdr_enum_freq_bands(struct file *file, void *priv, struct v4l2_frequency_band *band);
-int vivid_sdr_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf);
-int vivid_sdr_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf);
-int vivid_sdr_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt);
-int vivid_sdr_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt);
-int vidioc_enum_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_fmtdesc *f);
-int vidioc_g_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f);
+int vivid_sdr_enum_freq_bands(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_frequency_band *band);
+int vivid_sdr_g_frequency(struct file *file, struct video_device_state *state,
+			  struct v4l2_frequency *vf);
+int vivid_sdr_s_frequency(struct file *file, struct video_device_state *state,
+			  const struct v4l2_frequency *vf);
+int vivid_sdr_g_tuner(struct file *file, struct video_device_state *state,
+		      struct v4l2_tuner *vt);
+int vivid_sdr_s_tuner(struct file *file, struct video_device_state *state,
+		      const struct v4l2_tuner *vt);
+int vidioc_enum_fmt_sdr_cap(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_fmtdesc *f);
+int vidioc_g_fmt_sdr_cap(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f);
+int vidioc_s_fmt_sdr_cap(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f);
+int vidioc_try_fmt_sdr_cap(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_format *f);
 void vivid_sdr_cap_process(struct vivid_dev *dev, struct vivid_buffer *buf);
 
 extern const struct vb2_ops vivid_sdr_cap_qops;
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
index 36a781fa17bc3daaf1d949a7f1c94ebb9aecb7c0..e246d7006913e959089d7bff84fbeb9f3eb3cb13 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
@@ -112,7 +112,8 @@ const struct vb2_ops vivid_touch_cap_qops = {
 	.buf_request_complete	= touch_cap_buf_request_complete,
 };
 
-int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f)
+int vivid_enum_fmt_tch(struct file *file, struct video_device_state *state,
+		       struct v4l2_fmtdesc *f)
 {
 	if (f->index)
 		return -EINVAL;
@@ -121,7 +122,8 @@ int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f)
+int vivid_g_fmt_tch(struct file *file, struct video_device_state *state,
+		    struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -131,7 +133,9 @@ int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-int vivid_g_fmt_tch_mplane(struct file *file, void *priv, struct v4l2_format *f)
+int vivid_g_fmt_tch_mplane(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_format sp_fmt;
@@ -144,7 +148,8 @@ int vivid_g_fmt_tch_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-int vivid_g_parm_tch(struct file *file, void *priv,
+int vivid_g_parm_tch(struct file *file,
+		     struct video_device_state *state,
 		     struct v4l2_streamparm *parm)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -160,7 +165,8 @@ int vivid_g_parm_tch(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp)
+int vivid_enum_input_tch(struct file *file, struct video_device_state *state,
+			 struct v4l2_input *inp)
 {
 	if (inp->index)
 		return -EINVAL;
@@ -171,7 +177,8 @@ int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp)
 	return 0;
 }
 
-int vivid_g_input_tch(struct file *file, void *priv, unsigned int *i)
+int vivid_g_input_tch(struct file *file, struct video_device_state *state,
+		      unsigned int *i)
 {
 	*i = 0;
 	return 0;
@@ -194,7 +201,8 @@ int vivid_set_touch(struct vivid_dev *dev, unsigned int i)
 	return 0;
 }
 
-int vivid_s_input_tch(struct file *file, void *priv, unsigned int i)
+int vivid_s_input_tch(struct file *file, struct video_device_state *state,
+		      unsigned int i)
 {
 	return vivid_set_touch(video_drvdata(file), i);
 }
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.h b/drivers/media/test-drivers/vivid/vivid-touch-cap.h
index 07e514046ae80f1347aec00f1da1cdaa7acc4721..19dd5cb343fc67815d3c3b84d30ed99c634167a3 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.h
@@ -26,14 +26,22 @@ enum vivid_tch_test {
 
 extern const struct vb2_ops vivid_touch_cap_qops;
 
-int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
-int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_g_fmt_tch_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp);
-int vivid_g_input_tch(struct file *file, void *priv, unsigned int *i);
-int vivid_s_input_tch(struct file *file, void *priv, unsigned int i);
+int vivid_enum_fmt_tch(struct file *file, struct video_device_state *state,
+		       struct v4l2_fmtdesc *f);
+int vivid_g_fmt_tch(struct file *file, struct video_device_state *state,
+		    struct v4l2_format *f);
+int vivid_g_fmt_tch_mplane(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_format *f);
+int vivid_enum_input_tch(struct file *file, struct video_device_state *state,
+			 struct v4l2_input *inp);
+int vivid_g_input_tch(struct file *file, struct video_device_state *state,
+		      unsigned int *i);
+int vivid_s_input_tch(struct file *file, struct video_device_state *state,
+		      unsigned int i);
 void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf);
 int vivid_set_touch(struct vivid_dev *dev, unsigned int i);
-int vivid_g_parm_tch(struct file *file, void *priv,
+int vivid_g_parm_tch(struct file *file,
+		     struct video_device_state *state,
 		     struct v4l2_streamparm *parm);
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
index 791382a54b4f0a111cf32a4dca82e57a8c1c2da9..fa2fc5613fd8df12886a985da70dda65183b012e 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
@@ -232,7 +232,8 @@ const struct vb2_ops vivid_vbi_cap_qops = {
 	.buf_request_complete	= vbi_cap_buf_request_complete,
 };
 
-int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
+int vidioc_g_fmt_vbi_cap(struct file *file,
+			 struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -245,11 +246,12 @@ int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_s_fmt_vbi_cap(struct file *file, void *priv,
+int vidioc_s_fmt_vbi_cap(struct file *file,
+			 struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
-	int ret = vidioc_g_fmt_vbi_cap(file, priv, f);
+	int ret = vidioc_g_fmt_vbi_cap(file, state, f);
 
 	if (ret)
 		return ret;
@@ -282,7 +284,9 @@ void vivid_fill_service_lines(struct v4l2_sliced_vbi_format *vbi, u32 service_se
 	}
 }
 
-int vidioc_g_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt)
+int vidioc_g_fmt_sliced_vbi_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
@@ -294,7 +298,9 @@ int vidioc_g_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_forma
 	return 0;
 }
 
-int vidioc_try_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt)
+int vidioc_try_fmt_sliced_vbi_cap(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
@@ -310,11 +316,13 @@ int vidioc_try_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_for
 	return 0;
 }
 
-int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt)
+int vidioc_s_fmt_sliced_vbi_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
-	int ret = vidioc_try_fmt_sliced_vbi_cap(file, priv, fmt);
+	int ret = vidioc_try_fmt_sliced_vbi_cap(file, state, fmt);
 
 	if (ret)
 		return ret;
@@ -324,7 +332,9 @@ int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_forma
 	return 0;
 }
 
-int vidioc_g_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_sliced_vbi_cap *cap)
+int vidioc_g_sliced_vbi_cap(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_sliced_vbi_cap *cap)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.h b/drivers/media/test-drivers/vivid/vivid-vbi-cap.h
index ec2d200c9e0d3506abf12e198ff4c308fdf68f90..054a939863aad7d30be10ed13256583a4fe0227e 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.h
@@ -12,14 +12,24 @@ void vivid_fill_time_of_day_packet(u8 *packet);
 void vivid_raw_vbi_cap_process(struct vivid_dev *dev, struct vivid_buffer *buf);
 void vivid_sliced_vbi_cap_process(struct vivid_dev *dev, struct vivid_buffer *buf);
 void vivid_sliced_vbi_out_process(struct vivid_dev *dev, struct vivid_buffer *buf);
-int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
+int vidioc_g_fmt_vbi_cap(struct file *file,
+			 struct video_device_state *state,
 					struct v4l2_format *f);
-int vidioc_s_fmt_vbi_cap(struct file *file, void *priv,
+int vidioc_s_fmt_vbi_cap(struct file *file,
+			 struct video_device_state *state,
 					struct v4l2_format *f);
-int vidioc_g_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt);
-int vidioc_try_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt);
-int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt);
-int vidioc_g_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_sliced_vbi_cap *cap);
+int vidioc_g_fmt_sliced_vbi_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *fmt);
+int vidioc_try_fmt_sliced_vbi_cap(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_format *fmt);
+int vidioc_s_fmt_sliced_vbi_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *fmt);
+int vidioc_g_sliced_vbi_cap(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_sliced_vbi_cap *cap);
 
 void vivid_fill_service_lines(struct v4l2_sliced_vbi_format *vbi, u32 service_set);
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.c b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
index 7b3ea96744bb04e37644bc288c5879ac2812fbb3..c7396b7c199bded792fc20a575db30f4a0b8a234 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
@@ -130,7 +130,8 @@ const struct vb2_ops vivid_vbi_out_qops = {
 	.buf_request_complete	= vbi_out_buf_request_complete,
 };
 
-int vidioc_g_fmt_vbi_out(struct file *file, void *priv,
+int vidioc_g_fmt_vbi_out(struct file *file,
+			 struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -153,11 +154,12 @@ int vidioc_g_fmt_vbi_out(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_s_fmt_vbi_out(struct file *file, void *priv,
+int vidioc_s_fmt_vbi_out(struct file *file,
+			 struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
-	int ret = vidioc_g_fmt_vbi_out(file, priv, f);
+	int ret = vidioc_g_fmt_vbi_out(file, state, f);
 
 	if (ret)
 		return ret;
@@ -168,7 +170,9 @@ int vidioc_s_fmt_vbi_out(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_format *fmt)
+int vidioc_g_fmt_sliced_vbi_out(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
@@ -180,7 +184,9 @@ int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_forma
 	return 0;
 }
 
-int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_format *fmt)
+int vidioc_try_fmt_sliced_vbi_out(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
@@ -196,12 +202,12 @@ int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_for
 	return 0;
 }
 
-int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *priv,
-		struct v4l2_format *fmt)
+int vidioc_s_fmt_sliced_vbi_out(struct file *file,
+				struct video_device_state *state, struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
-	int ret = vidioc_try_fmt_sliced_vbi_out(file, priv, fmt);
+	int ret = vidioc_try_fmt_sliced_vbi_out(file, state, fmt);
 
 	if (ret)
 		return ret;
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.h b/drivers/media/test-drivers/vivid/vivid-vbi-out.h
index a28e55519ade286066d38732ca6815786e18ff90..9759860f9bb1600c71b02314c12f6d54faf2425d 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-out.h
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.h
@@ -9,13 +9,21 @@
 #define _VIVID_VBI_OUT_H_
 
 void vivid_sliced_vbi_out_process(struct vivid_dev *dev, struct vivid_buffer *buf);
-int vidioc_g_fmt_vbi_out(struct file *file, void *priv,
+int vidioc_g_fmt_vbi_out(struct file *file,
+			 struct video_device_state *state,
 					struct v4l2_format *f);
-int vidioc_s_fmt_vbi_out(struct file *file, void *priv,
+int vidioc_s_fmt_vbi_out(struct file *file,
+			 struct video_device_state *state,
 					struct v4l2_format *f);
-int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_format *fmt);
-int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_format *fmt);
-int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_format *fmt);
+int vidioc_g_fmt_sliced_vbi_out(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *fmt);
+int vidioc_try_fmt_sliced_vbi_out(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_format *fmt);
+int vidioc_s_fmt_sliced_vbi_out(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *fmt);
 
 extern const struct vb2_ops vivid_vbi_out_qops;
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 8b3162e8203271e7708b4b8a7389da9873aff40c..094cbd5792448cc89d455fcae8efd05a769c09fc 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -518,7 +518,8 @@ static unsigned vivid_quantization_cap(struct vivid_dev *dev)
 	return dev->quantization_out;
 }
 
-int vivid_g_fmt_vid_cap(struct file *file, void *priv,
+int vivid_g_fmt_vid_cap(struct file *file,
+			struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -547,7 +548,8 @@ int vivid_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_try_fmt_vid_cap(struct file *file, void *priv,
+int vivid_try_fmt_vid_cap(struct file *file,
+			  struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
@@ -660,7 +662,8 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_s_fmt_vid_cap(struct file *file, void *priv,
+int vivid_s_fmt_vid_cap(struct file *file,
+			struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
@@ -668,7 +671,7 @@ int vivid_s_fmt_vid_cap(struct file *file, void *priv,
 	struct v4l2_rect *crop = &dev->crop_cap;
 	struct v4l2_rect *compose = &dev->compose_cap;
 	struct vb2_queue *q = &dev->vb_vid_cap_q;
-	int ret = vivid_try_fmt_vid_cap(file, priv, f);
+	int ret = vivid_try_fmt_vid_cap(file, state, f);
 	unsigned factor = 1;
 	unsigned p;
 	unsigned i;
@@ -793,67 +796,74 @@ int vivid_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *priv,
+int vidioc_g_fmt_vid_cap_mplane(struct file *file,
+				struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (!dev->multiplanar)
 		return -ENOTTY;
-	return vivid_g_fmt_vid_cap(file, priv, f);
+	return vivid_g_fmt_vid_cap(file, state, f);
 }
 
-int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
+int vidioc_try_fmt_vid_cap_mplane(struct file *file,
+				  struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (!dev->multiplanar)
 		return -ENOTTY;
-	return vivid_try_fmt_vid_cap(file, priv, f);
+	return vivid_try_fmt_vid_cap(file, state, f);
 }
 
-int vidioc_s_fmt_vid_cap_mplane(struct file *file, void *priv,
+int vidioc_s_fmt_vid_cap_mplane(struct file *file,
+				struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (!dev->multiplanar)
 		return -ENOTTY;
-	return vivid_s_fmt_vid_cap(file, priv, f);
+	return vivid_s_fmt_vid_cap(file, state, f);
 }
 
-int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+int vidioc_g_fmt_vid_cap(struct file *file,
+			 struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (dev->multiplanar)
 		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_g_fmt_vid_cap);
+	return fmt_sp2mp_func(file, state, f, vivid_g_fmt_vid_cap);
 }
 
-int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+int vidioc_try_fmt_vid_cap(struct file *file,
+			   struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (dev->multiplanar)
 		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_try_fmt_vid_cap);
+	return fmt_sp2mp_func(file, state, f, vivid_try_fmt_vid_cap);
 }
 
-int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+int vidioc_s_fmt_vid_cap(struct file *file,
+			 struct video_device_state *state,
 			struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (dev->multiplanar)
 		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_s_fmt_vid_cap);
+	return fmt_sp2mp_func(file, state, f, vivid_s_fmt_vid_cap);
 }
 
-int vivid_vid_cap_g_selection(struct file *file, void *priv,
+int vivid_vid_cap_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *sel)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -899,7 +909,9 @@ int vivid_vid_cap_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_vid_cap_s_selection(struct file *file, void *priv, struct v4l2_selection *s)
+int vivid_vid_cap_s_selection(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_selection *s)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_rect *crop = &dev->crop_cap;
@@ -1031,8 +1043,9 @@ int vivid_vid_cap_s_selection(struct file *file, void *priv, struct v4l2_selecti
 	return 0;
 }
 
-int vivid_vid_cap_g_pixelaspect(struct file *file, void *priv,
-				int type, struct v4l2_fract *f)
+int vivid_vid_cap_g_pixelaspect(struct file *file,
+				struct video_device_state *state, int type,
+				struct v4l2_fract *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1059,7 +1072,8 @@ static const struct v4l2_audio vivid_audio_inputs[] = {
 	{ 1, "Line-In", V4L2_AUDCAP_STEREO },
 };
 
-int vidioc_enum_input(struct file *file, void *priv,
+int vidioc_enum_input(struct file *file,
+		      struct video_device_state *state,
 				struct v4l2_input *inp)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1128,7 +1142,8 @@ int vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_g_input(struct file *file, void *priv, unsigned *i)
+int vidioc_g_input(struct file *file, struct video_device_state *state,
+		   unsigned int *i)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1136,7 +1151,8 @@ int vidioc_g_input(struct file *file, void *priv, unsigned *i)
 	return 0;
 }
 
-int vidioc_s_input(struct file *file, void *priv, unsigned i)
+int vidioc_s_input(struct file *file, struct video_device_state *state,
+		   unsigned int i)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_bt_timings *bt = &dev->dv_timings_cap[dev->input].bt;
@@ -1222,7 +1238,8 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
 	return 0;
 }
 
-int vidioc_enumaudio(struct file *file, void *priv, struct v4l2_audio *vin)
+int vidioc_enumaudio(struct file *file, struct video_device_state *state,
+		     struct v4l2_audio *vin)
 {
 	if (vin->index >= ARRAY_SIZE(vivid_audio_inputs))
 		return -EINVAL;
@@ -1230,7 +1247,8 @@ int vidioc_enumaudio(struct file *file, void *priv, struct v4l2_audio *vin)
 	return 0;
 }
 
-int vidioc_g_audio(struct file *file, void *priv, struct v4l2_audio *vin)
+int vidioc_g_audio(struct file *file, struct video_device_state *state,
+		   struct v4l2_audio *vin)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1240,7 +1258,8 @@ int vidioc_g_audio(struct file *file, void *priv, struct v4l2_audio *vin)
 	return 0;
 }
 
-int vidioc_s_audio(struct file *file, void *priv, const struct v4l2_audio *vin)
+int vidioc_s_audio(struct file *file, struct video_device_state *state,
+		   const struct v4l2_audio *vin)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1252,7 +1271,9 @@ int vidioc_s_audio(struct file *file, void *priv, const struct v4l2_audio *vin)
 	return 0;
 }
 
-int vivid_video_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf)
+int vivid_video_g_frequency(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1262,7 +1283,9 @@ int vivid_video_g_frequency(struct file *file, void *priv, struct v4l2_frequency
 	return 0;
 }
 
-int vivid_video_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf)
+int vivid_video_s_frequency(struct file *file,
+			    struct video_device_state *state,
+			    const struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1274,7 +1297,8 @@ int vivid_video_s_frequency(struct file *file, void *priv, const struct v4l2_fre
 	return 0;
 }
 
-int vivid_video_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
+int vivid_video_s_tuner(struct file *file, struct video_device_state *state,
+			const struct v4l2_tuner *vt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1286,7 +1310,8 @@ int vivid_video_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *
 	return 0;
 }
 
-int vivid_video_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
+int vivid_video_g_tuner(struct file *file, struct video_device_state *state,
+			struct v4l2_tuner *vt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	enum tpg_quality qual;
@@ -1377,7 +1402,8 @@ const char * const vivid_ctrl_standard_strings[] = {
 	NULL,
 };
 
-int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *id)
+int vidioc_querystd(struct file *file, struct video_device_state *state,
+		    v4l2_std_id *id)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	unsigned int last = dev->query_std_last[dev->input];
@@ -1404,7 +1430,8 @@ int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-int vivid_vid_cap_s_std(struct file *file, void *priv, v4l2_std_id id)
+int vivid_vid_cap_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1490,7 +1517,8 @@ static bool valid_cvt_gtf_timings(struct v4l2_dv_timings *timings)
 	return false;
 }
 
-int vivid_vid_cap_s_dv_timings(struct file *file, void *priv,
+int vivid_vid_cap_s_dv_timings(struct file *file,
+			       struct video_device_state *state,
 				    struct v4l2_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1513,7 +1541,8 @@ int vivid_vid_cap_s_dv_timings(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_query_dv_timings(struct file *file, void *priv,
+int vidioc_query_dv_timings(struct file *file,
+			    struct video_device_state *state,
 				    struct v4l2_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1600,7 +1629,8 @@ void vivid_update_connected_outputs(struct vivid_dev *dev)
 	}
 }
 
-int vidioc_s_edid(struct file *file, void *priv,
+int vidioc_s_edid(struct file *file,
+		  struct video_device_state *state,
 			 struct v4l2_edid *edid)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1638,7 +1668,8 @@ int vidioc_s_edid(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_enum_framesizes(struct file *file, void *priv,
+int vidioc_enum_framesizes(struct file *file,
+			   struct video_device_state *state,
 					 struct v4l2_frmsizeenum *fsize)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1667,7 +1698,8 @@ int vidioc_enum_framesizes(struct file *file, void *priv,
 }
 
 /* timeperframe is arbitrary and continuous */
-int vidioc_enum_frameintervals(struct file *file, void *priv,
+int vidioc_enum_frameintervals(struct file *file,
+			       struct video_device_state *state,
 					     struct v4l2_frmivalenum *fival)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1703,7 +1735,8 @@ int vidioc_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_vid_cap_g_parm(struct file *file, void *priv,
+int vivid_vid_cap_g_parm(struct file *file,
+			 struct video_device_state *state,
 			  struct v4l2_streamparm *parm)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1719,7 +1752,8 @@ int vivid_vid_cap_g_parm(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_vid_cap_s_parm(struct file *file, void *priv,
+int vivid_vid_cap_s_parm(struct file *file,
+			 struct video_device_state *state,
 			  struct v4l2_streamparm *parm)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1732,7 +1766,7 @@ int vivid_vid_cap_s_parm(struct file *file, void *priv,
 			   V4L2_BUF_TYPE_VIDEO_CAPTURE))
 		return -EINVAL;
 	if (!vivid_is_webcam(dev))
-		return vivid_vid_cap_g_parm(file, priv, parm);
+		return vivid_vid_cap_g_parm(file, state, parm);
 
 	tpf = parm->parm.capture.timeperframe;
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.h b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
index 38a99f7e038eaa13477d5ce8ff7d4497b557f905..175cf0d388dc6821414593c9112fe171953fc8d0 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
@@ -19,40 +19,87 @@ extern const char * const vivid_ctrl_standard_strings[];
 
 extern const struct vb2_ops vivid_vid_cap_qops;
 
-int vivid_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_cap_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_vid_cap_g_selection(struct file *file, void *priv, struct v4l2_selection *sel);
-int vivid_vid_cap_s_selection(struct file *file, void *priv, struct v4l2_selection *s);
-int vivid_vid_cap_g_pixelaspect(struct file *file, void *priv, int type, struct v4l2_fract *f);
-int vidioc_enum_fmt_vid_overlay(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
-int vidioc_g_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *inp);
-int vidioc_g_input(struct file *file, void *priv, unsigned *i);
-int vidioc_s_input(struct file *file, void *priv, unsigned i);
-int vidioc_enumaudio(struct file *file, void *priv, struct v4l2_audio *vin);
-int vidioc_g_audio(struct file *file, void *priv, struct v4l2_audio *vin);
-int vidioc_s_audio(struct file *file, void *priv, const struct v4l2_audio *vin);
-int vivid_video_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf);
-int vivid_video_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf);
-int vivid_video_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt);
-int vivid_video_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt);
-int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *id);
-int vivid_vid_cap_s_std(struct file *file, void *priv, v4l2_std_id id);
-int vivid_vid_cap_s_dv_timings(struct file *file, void *priv, struct v4l2_dv_timings *timings);
-int vidioc_query_dv_timings(struct file *file, void *priv, struct v4l2_dv_timings *timings);
-int vidioc_s_edid(struct file *file, void *priv, struct v4l2_edid *edid);
-int vidioc_enum_framesizes(struct file *file, void *priv, struct v4l2_frmsizeenum *fsize);
-int vidioc_enum_frameintervals(struct file *file, void *priv, struct v4l2_frmivalenum *fival);
-int vivid_vid_cap_g_parm(struct file *file, void *priv, struct v4l2_streamparm *parm);
-int vivid_vid_cap_s_parm(struct file *file, void *priv, struct v4l2_streamparm *parm);
+int vivid_g_fmt_vid_cap(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f);
+int vivid_try_fmt_vid_cap(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f);
+int vivid_s_fmt_vid_cap(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f);
+int vidioc_g_fmt_vid_cap_mplane(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *f);
+int vidioc_try_fmt_vid_cap_mplane(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_format *f);
+int vidioc_s_fmt_vid_cap_mplane(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *f);
+int vidioc_g_fmt_vid_cap(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f);
+int vidioc_try_fmt_vid_cap(struct file *file, struct video_device_state *state,
+			   struct v4l2_format *f);
+int vidioc_s_fmt_vid_cap(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f);
+int vivid_vid_cap_g_selection(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_selection *sel);
+int vivid_vid_cap_s_selection(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_selection *s);
+int vivid_vid_cap_g_pixelaspect(struct file *file,
+				struct video_device_state *state, int type,
+				struct v4l2_fract *f);
+int vidioc_enum_fmt_vid_overlay(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_fmtdesc *f);
+int vidioc_g_fmt_vid_overlay(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_format *f);
+int vidioc_try_fmt_vid_overlay(struct file *file,
+			       struct video_device_state *state,
+			       struct v4l2_format *f);
+int vidioc_s_fmt_vid_overlay(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_format *f);
+int vidioc_enum_input(struct file *file, struct video_device_state *state,
+		      struct v4l2_input *inp);
+int vidioc_g_input(struct file *file, struct video_device_state *state,
+		   unsigned int *i);
+int vidioc_s_input(struct file *file, struct video_device_state *state,
+		   unsigned int i);
+int vidioc_enumaudio(struct file *file, struct video_device_state *state,
+		     struct v4l2_audio *vin);
+int vidioc_g_audio(struct file *file, struct video_device_state *state,
+		   struct v4l2_audio *vin);
+int vidioc_s_audio(struct file *file, struct video_device_state *state,
+		   const struct v4l2_audio *vin);
+int vivid_video_g_frequency(struct file *file, struct video_device_state *state,
+			    struct v4l2_frequency *vf);
+int vivid_video_s_frequency(struct file *file, struct video_device_state *state,
+			    const struct v4l2_frequency *vf);
+int vivid_video_s_tuner(struct file *file, struct video_device_state *state,
+			const struct v4l2_tuner *vt);
+int vivid_video_g_tuner(struct file *file, struct video_device_state *state,
+			struct v4l2_tuner *vt);
+int vidioc_querystd(struct file *file, struct video_device_state *state,
+		    v4l2_std_id *id);
+int vivid_vid_cap_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id);
+int vivid_vid_cap_s_dv_timings(struct file *file,
+			       struct video_device_state *state,
+			       struct v4l2_dv_timings *timings);
+int vidioc_query_dv_timings(struct file *file, struct video_device_state *state,
+			    struct v4l2_dv_timings *timings);
+int vidioc_s_edid(struct file *file, struct video_device_state *state,
+		  struct v4l2_edid *edid);
+int vidioc_enum_framesizes(struct file *file, struct video_device_state *state,
+			   struct v4l2_frmsizeenum *fsize);
+int vidioc_enum_frameintervals(struct file *file,
+			       struct video_device_state *state,
+			       struct v4l2_frmivalenum *fival);
+int vivid_vid_cap_g_parm(struct file *file, struct video_device_state *state,
+			 struct v4l2_streamparm *parm);
+int vivid_vid_cap_s_parm(struct file *file, struct video_device_state *state,
+			 struct v4l2_streamparm *parm);
 
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
index 786a1aa3b26b7058a025895ba1b1f4cf03940376..30b7c9d4ff7d7b33d09b5d99276c0cca4159e054 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
@@ -886,8 +886,8 @@ void fmt_sp2mp(const struct v4l2_format *sp_fmt, struct v4l2_format *mp_fmt)
 	memset(ppix->reserved, 0, sizeof(ppix->reserved));
 }
 
-int fmt_sp2mp_func(struct file *file, void *priv,
-		struct v4l2_format *f, fmtfunc func)
+int fmt_sp2mp_func(struct file *file, struct video_device_state *state, struct v4l2_format *f,
+		   fmtfunc func)
 {
 	struct v4l2_format fmt;
 	struct v4l2_pix_format_mplane *mp = &fmt.fmt.pix_mp;
@@ -898,7 +898,7 @@ int fmt_sp2mp_func(struct file *file, void *priv,
 	/* Converts to a mplane format */
 	fmt_sp2mp(f, &fmt);
 	/* Passes it to the generic mplane format function */
-	ret = func(file, priv, &fmt);
+	ret = func(file, state, &fmt);
 	/* Copies back the mplane data to the single plane format */
 	pix->width = mp->width;
 	pix->height = mp->height;
@@ -963,7 +963,8 @@ int vivid_vid_adjust_sel(unsigned flags, struct v4l2_rect *r)
 	return 0;
 }
 
-int vivid_enum_fmt_vid(struct file *file, void  *priv,
+int vivid_enum_fmt_vid(struct file *file,
+		       struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1004,7 +1005,8 @@ int vivid_enum_fmt_vid(struct file *file, void  *priv,
 	return 0;
 }
 
-int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
+int vidioc_g_std(struct file *file, struct video_device_state *state,
+		 v4l2_std_id *id)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
@@ -1021,7 +1023,8 @@ int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-int vidioc_g_dv_timings(struct file *file, void *priv,
+int vidioc_g_dv_timings(struct file *file,
+			struct video_device_state *state,
 				    struct v4l2_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1039,7 +1042,8 @@ int vidioc_g_dv_timings(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_enum_dv_timings(struct file *file, void *priv,
+int vidioc_enum_dv_timings(struct file *file,
+			   struct video_device_state *state,
 				    struct v4l2_enum_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1056,7 +1060,8 @@ int vidioc_enum_dv_timings(struct file *file, void *priv,
 			NULL, NULL);
 }
 
-int vidioc_dv_timings_cap(struct file *file, void *priv,
+int vidioc_dv_timings_cap(struct file *file,
+			  struct video_device_state *state,
 				    struct v4l2_dv_timings_cap *cap)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1073,7 +1078,8 @@ int vidioc_dv_timings_cap(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_g_edid(struct file *file, void *priv,
+int vidioc_g_edid(struct file *file,
+		  struct video_device_state *state,
 			 struct v4l2_edid *edid)
 {
 	struct vivid_dev *dev = video_drvdata(file);
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.h b/drivers/media/test-drivers/vivid/vivid-vid-common.h
index fb5878174dba4cc1ed65846f85bca4020cae09cc..00a2ab66eae0b97c4d1a0dc6565d49682e577c32 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-common.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-common.h
@@ -8,34 +8,44 @@
 #ifndef _VIVID_VID_COMMON_H_
 #define _VIVID_VID_COMMON_H_
 
-typedef int (*fmtfunc)(struct file *file, void *priv, struct v4l2_format *f);
+typedef int (*fmtfunc)(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f);
 
 /*
  * Conversion function that converts a single-planar format to a
  * single-plane multiplanar format.
  */
 void fmt_sp2mp(const struct v4l2_format *sp_fmt, struct v4l2_format *mp_fmt);
-int fmt_sp2mp_func(struct file *file, void *priv,
-		struct v4l2_format *f, fmtfunc func);
+int fmt_sp2mp_func(struct file *file, struct video_device_state *state,
+		   struct v4l2_format *f, fmtfunc func);
 
 extern const struct v4l2_dv_timings_cap vivid_dv_timings_cap;
 
-const struct vivid_fmt *vivid_get_format(struct vivid_dev *dev, u32 pixelformat);
+const struct vivid_fmt *vivid_get_format(struct vivid_dev *dev,
+					 u32 pixelformat);
 
 struct vivid_dev *vivid_input_is_connected_to(struct vivid_dev *dev);
 struct vivid_dev *vivid_output_is_connected_to(struct vivid_dev *dev);
 bool vivid_vid_can_loop(struct vivid_dev *dev);
 void vivid_send_source_change(struct vivid_dev *dev, unsigned int type);
-void vivid_send_input_source_change(struct vivid_dev *dev, unsigned int input_index);
+void vivid_send_input_source_change(struct vivid_dev *dev,
+				    unsigned int input_index);
 
 int vivid_vid_adjust_sel(unsigned flags, struct v4l2_rect *r);
 
-int vivid_enum_fmt_vid(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
-int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id);
-int vidioc_g_dv_timings(struct file *file, void *priv, struct v4l2_dv_timings *timings);
-int vidioc_enum_dv_timings(struct file *file, void *priv, struct v4l2_enum_dv_timings *timings);
-int vidioc_dv_timings_cap(struct file *file, void *priv, struct v4l2_dv_timings_cap *cap);
-int vidioc_g_edid(struct file *file, void *priv, struct v4l2_edid *edid);
-int vidioc_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub);
+int vivid_enum_fmt_vid(struct file *file, struct video_device_state *state,
+		       struct v4l2_fmtdesc *f);
+int vidioc_g_std(struct file *file, struct video_device_state *state,
+		 v4l2_std_id *id);
+int vidioc_g_dv_timings(struct file *file, struct video_device_state *state,
+			struct v4l2_dv_timings *timings);
+int vidioc_enum_dv_timings(struct file *file, struct video_device_state *state,
+			   struct v4l2_enum_dv_timings *timings);
+int vidioc_dv_timings_cap(struct file *file, struct video_device_state *state,
+			  struct v4l2_dv_timings_cap *cap);
+int vidioc_g_edid(struct file *file, struct video_device_state *state,
+		  struct v4l2_edid *edid);
+int vidioc_subscribe_event(struct v4l2_fh *fh,
+			   const struct v4l2_event_subscription *sub);
 
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index 8c037b90833e74563654a60f8c8ecc292e21151c..bb56490ea4c8a14eabf677a8e16d9b223503d497 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -308,8 +308,8 @@ static enum tpg_pixel_aspect vivid_get_pixel_aspect(const struct vivid_dev *dev)
 	return TPG_PIXEL_ASPECT_SQUARE;
 }
 
-int vivid_g_fmt_vid_out(struct file *file, void *priv,
-					struct v4l2_format *f)
+int vivid_g_fmt_vid_out(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
@@ -340,8 +340,8 @@ int vivid_g_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_try_fmt_vid_out(struct file *file, void *priv,
-			struct v4l2_format *f)
+int vivid_try_fmt_vid_out(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_bt_timings *bt = &dev->dv_timings_out.bt;
@@ -438,15 +438,15 @@ int vivid_try_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_s_fmt_vid_out(struct file *file, void *priv,
-					struct v4l2_format *f)
+int vivid_s_fmt_vid_out(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_rect *crop = &dev->crop_out;
 	struct v4l2_rect *compose = &dev->compose_out;
 	struct vb2_queue *q = &dev->vb_vid_out_q;
-	int ret = vivid_try_fmt_vid_out(file, priv, f);
+	int ret = vivid_try_fmt_vid_out(file, state, f);
 	unsigned factor = 1;
 	unsigned p;
 
@@ -568,67 +568,70 @@ int vivid_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_g_fmt_vid_out_mplane(struct file *file, void *priv,
-					struct v4l2_format *f)
+int vidioc_g_fmt_vid_out_mplane(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (!dev->multiplanar)
 		return -ENOTTY;
-	return vivid_g_fmt_vid_out(file, priv, f);
+	return vivid_g_fmt_vid_out(file, state, f);
 }
 
-int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
-			struct v4l2_format *f)
+int vidioc_try_fmt_vid_out_mplane(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (!dev->multiplanar)
 		return -ENOTTY;
-	return vivid_try_fmt_vid_out(file, priv, f);
+	return vivid_try_fmt_vid_out(file, state, f);
 }
 
-int vidioc_s_fmt_vid_out_mplane(struct file *file, void *priv,
-			struct v4l2_format *f)
+int vidioc_s_fmt_vid_out_mplane(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (!dev->multiplanar)
 		return -ENOTTY;
-	return vivid_s_fmt_vid_out(file, priv, f);
+	return vivid_s_fmt_vid_out(file, state, f);
 }
 
-int vidioc_g_fmt_vid_out(struct file *file, void *priv,
-					struct v4l2_format *f)
+int vidioc_g_fmt_vid_out(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (dev->multiplanar)
 		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_g_fmt_vid_out);
+	return fmt_sp2mp_func(file, state, f, vivid_g_fmt_vid_out);
 }
 
-int vidioc_try_fmt_vid_out(struct file *file, void *priv,
-			struct v4l2_format *f)
+int vidioc_try_fmt_vid_out(struct file *file, struct video_device_state *state,
+			   struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (dev->multiplanar)
 		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_try_fmt_vid_out);
+	return fmt_sp2mp_func(file, state, f, vivid_try_fmt_vid_out);
 }
 
-int vidioc_s_fmt_vid_out(struct file *file, void *priv,
-			struct v4l2_format *f)
+int vidioc_s_fmt_vid_out(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (dev->multiplanar)
 		return -ENOTTY;
-	return fmt_sp2mp_func(file, priv, f, vivid_s_fmt_vid_out);
+	return fmt_sp2mp_func(file, state, f, vivid_s_fmt_vid_out);
 }
 
-int vivid_vid_out_g_selection(struct file *file, void *priv,
+int vivid_vid_out_g_selection(struct file *file, struct video_device_state *state,
 			      struct v4l2_selection *sel)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -672,7 +675,9 @@ int vivid_vid_out_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_vid_out_s_selection(struct file *file, void *priv, struct v4l2_selection *s)
+int vivid_vid_out_s_selection(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_selection *s)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_rect *crop = &dev->crop_out;
@@ -798,7 +803,7 @@ int vivid_vid_out_s_selection(struct file *file, void *priv, struct v4l2_selecti
 	return 0;
 }
 
-int vivid_vid_out_g_pixelaspect(struct file *file, void *priv,
+int vivid_vid_out_g_pixelaspect(struct file *file, struct video_device_state *state,
 				int type, struct v4l2_fract *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -821,8 +826,9 @@ int vivid_vid_out_g_pixelaspect(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_g_fmt_vid_out_overlay(struct file *file, void *priv,
-					struct v4l2_format *f)
+int vidioc_g_fmt_vid_out_overlay(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	const struct v4l2_rect *compose = &dev->compose_out;
@@ -840,8 +846,9 @@ int vidioc_g_fmt_vid_out_overlay(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_try_fmt_vid_out_overlay(struct file *file, void *priv,
-					struct v4l2_format *f)
+int vidioc_try_fmt_vid_out_overlay(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	const struct v4l2_rect *compose = &dev->compose_out;
@@ -863,12 +870,13 @@ int vidioc_try_fmt_vid_out_overlay(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_s_fmt_vid_out_overlay(struct file *file, void *priv,
-					struct v4l2_format *f)
+int vidioc_s_fmt_vid_out_overlay(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_window *win = &f->fmt.win;
-	int ret = vidioc_try_fmt_vid_out_overlay(file, priv, f);
+	int ret = vidioc_try_fmt_vid_out_overlay(file, state, f);
 
 	if (ret)
 		return ret;
@@ -880,7 +888,8 @@ int vidioc_s_fmt_vid_out_overlay(struct file *file, void *priv,
 	return ret;
 }
 
-int vivid_vid_out_overlay(struct file *file, void *priv, unsigned i)
+int vivid_vid_out_overlay(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -893,8 +902,8 @@ int vivid_vid_out_overlay(struct file *file, void *priv, unsigned i)
 	return 0;
 }
 
-int vivid_vid_out_g_fbuf(struct file *file, void *priv,
-				struct v4l2_framebuffer *a)
+int vivid_vid_out_g_fbuf(struct file *file, struct video_device_state *state,
+			 struct v4l2_framebuffer *a)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -920,8 +929,8 @@ int vivid_vid_out_g_fbuf(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_vid_out_s_fbuf(struct file *file, void *priv,
-				const struct v4l2_framebuffer *a)
+int vivid_vid_out_s_fbuf(struct file *file, struct video_device_state *state,
+			 const struct v4l2_framebuffer *a)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	const unsigned chroma_flags = V4L2_FBUF_FLAG_CHROMAKEY |
@@ -952,8 +961,8 @@ static const struct v4l2_audioout vivid_audio_outputs[] = {
 	{ 1, "Line-Out 2" },
 };
 
-int vidioc_enum_output(struct file *file, void *priv,
-				struct v4l2_output *out)
+int vidioc_enum_output(struct file *file, struct video_device_state *state,
+		       struct v4l2_output *out)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -979,7 +988,8 @@ int vidioc_enum_output(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_g_output(struct file *file, void *priv, unsigned *o)
+int vidioc_g_output(struct file *file, struct video_device_state *state,
+		    unsigned int *o)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -987,7 +997,8 @@ int vidioc_g_output(struct file *file, void *priv, unsigned *o)
 	return 0;
 }
 
-int vidioc_s_output(struct file *file, void *priv, unsigned o)
+int vidioc_s_output(struct file *file, struct video_device_state *state,
+		    unsigned int o)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1016,7 +1027,8 @@ int vidioc_s_output(struct file *file, void *priv, unsigned o)
 	return 0;
 }
 
-int vidioc_enumaudout(struct file *file, void *priv, struct v4l2_audioout *vout)
+int vidioc_enumaudout(struct file *file, struct video_device_state *state,
+		      struct v4l2_audioout *vout)
 {
 	if (vout->index >= ARRAY_SIZE(vivid_audio_outputs))
 		return -EINVAL;
@@ -1024,7 +1036,8 @@ int vidioc_enumaudout(struct file *file, void *priv, struct v4l2_audioout *vout)
 	return 0;
 }
 
-int vidioc_g_audout(struct file *file, void *priv, struct v4l2_audioout *vout)
+int vidioc_g_audout(struct file *file, struct video_device_state *state,
+		    struct v4l2_audioout *vout)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1034,7 +1047,8 @@ int vidioc_g_audout(struct file *file, void *priv, struct v4l2_audioout *vout)
 	return 0;
 }
 
-int vidioc_s_audout(struct file *file, void *priv, const struct v4l2_audioout *vout)
+int vidioc_s_audout(struct file *file, struct video_device_state *state,
+		    const struct v4l2_audioout *vout)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1046,7 +1060,8 @@ int vidioc_s_audout(struct file *file, void *priv, const struct v4l2_audioout *v
 	return 0;
 }
 
-int vivid_vid_out_s_std(struct file *file, void *priv, v4l2_std_id id)
+int vivid_vid_out_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1072,8 +1087,9 @@ static bool valid_cvt_gtf_timings(struct v4l2_dv_timings *timings)
 	return false;
 }
 
-int vivid_vid_out_s_dv_timings(struct file *file, void *priv,
-				    struct v4l2_dv_timings *timings)
+int vivid_vid_out_s_dv_timings(struct file *file,
+			       struct video_device_state *state,
+			       struct v4l2_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	if (!vivid_is_hdmi_out(dev))
@@ -1091,8 +1107,8 @@ int vivid_vid_out_s_dv_timings(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_vid_out_g_parm(struct file *file, void *priv,
-			  struct v4l2_streamparm *parm)
+int vivid_vid_out_g_parm(struct file *file, struct video_device_state *state,
+			 struct v4l2_streamparm *parm)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1109,7 +1125,7 @@ int vivid_vid_out_g_parm(struct file *file, void *priv,
 }
 
 int vidioc_subscribe_event(struct v4l2_fh *fh,
-			const struct v4l2_event_subscription *sub)
+			   const struct v4l2_event_subscription *sub)
 {
 	switch (sub->type) {
 	case V4L2_EVENT_SOURCE_CHANGE:
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.h b/drivers/media/test-drivers/vivid/vivid-vid-out.h
index 1d03891a5de576a59441c0b2d77e0c3815e3c05c..58a9e7736987a2a4d05f7acd4e18c5f3729287f9 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.h
@@ -12,33 +12,72 @@ extern const struct vb2_ops vivid_vid_out_qops;
 
 void vivid_update_format_out(struct vivid_dev *dev);
 
-int vivid_g_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_try_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_g_fmt_vid_out_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_out_mplane(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_g_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_vid_out_g_selection(struct file *file, void *priv, struct v4l2_selection *sel);
-int vivid_vid_out_s_selection(struct file *file, void *priv, struct v4l2_selection *s);
-int vivid_vid_out_g_pixelaspect(struct file *file, void *priv, int type, struct v4l2_fract *f);
-int vidioc_enum_fmt_vid_out_overlay(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
-int vidioc_g_fmt_vid_out_overlay(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_try_fmt_vid_out_overlay(struct file *file, void *priv, struct v4l2_format *f);
-int vidioc_s_fmt_vid_out_overlay(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_vid_out_overlay(struct file *file, void *priv, unsigned i);
-int vivid_vid_out_g_fbuf(struct file *file, void *priv, struct v4l2_framebuffer *a);
-int vivid_vid_out_s_fbuf(struct file *file, void *priv, const struct v4l2_framebuffer *a);
-int vidioc_enum_output(struct file *file, void *priv, struct v4l2_output *out);
-int vidioc_g_output(struct file *file, void *priv, unsigned *i);
-int vidioc_s_output(struct file *file, void *priv, unsigned i);
-int vidioc_enumaudout(struct file *file, void *priv, struct v4l2_audioout *vout);
-int vidioc_g_audout(struct file *file, void *priv, struct v4l2_audioout *vout);
-int vidioc_s_audout(struct file *file, void *priv, const struct v4l2_audioout *vout);
-int vivid_vid_out_s_std(struct file *file, void *priv, v4l2_std_id id);
-int vivid_vid_out_s_dv_timings(struct file *file, void *priv, struct v4l2_dv_timings *timings);
-int vivid_vid_out_g_parm(struct file *file, void *priv, struct v4l2_streamparm *parm);
+int vivid_g_fmt_vid_out(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f);
+int vivid_try_fmt_vid_out(struct file *file, struct video_device_state *state,
+			  struct v4l2_format *f);
+int vivid_s_fmt_vid_out(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f);
+int vidioc_g_fmt_vid_out_mplane(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *f);
+int vidioc_try_fmt_vid_out_mplane(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_format *f);
+int vidioc_s_fmt_vid_out_mplane(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *f);
+int vidioc_g_fmt_vid_out(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f);
+int vidioc_try_fmt_vid_out(struct file *file, struct video_device_state *state,
+			   struct v4l2_format *f);
+int vidioc_s_fmt_vid_out(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f);
+int vivid_vid_out_g_selection(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_selection *sel);
+int vivid_vid_out_s_selection(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_selection *s);
+int vivid_vid_out_g_pixelaspect(struct file *file,
+				struct video_device_state *state, int type,
+				struct v4l2_fract *f);
+int vidioc_enum_fmt_vid_out_overlay(struct file *file,
+				    struct video_device_state *state,
+				    struct v4l2_fmtdesc *f);
+int vidioc_g_fmt_vid_out_overlay(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_format *f);
+int vidioc_try_fmt_vid_out_overlay(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_format *f);
+int vidioc_s_fmt_vid_out_overlay(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_format *f);
+int vivid_vid_out_overlay(struct file *file, struct video_device_state *state,
+			  unsigned int i);
+int vivid_vid_out_g_fbuf(struct file *file, struct video_device_state *state,
+			 struct v4l2_framebuffer *a);
+int vivid_vid_out_s_fbuf(struct file *file, struct video_device_state *state,
+			 const struct v4l2_framebuffer *a);
+int vidioc_enum_output(struct file *file, struct video_device_state *state,
+		       struct v4l2_output *out);
+int vidioc_g_output(struct file *file, struct video_device_state *state,
+		    unsigned int *i);
+int vidioc_s_output(struct file *file, struct video_device_state *state,
+		    unsigned int i);
+int vidioc_enumaudout(struct file *file, struct video_device_state *state,
+		      struct v4l2_audioout *vout);
+int vidioc_g_audout(struct file *file, struct video_device_state *state,
+		    struct v4l2_audioout *vout);
+int vidioc_s_audout(struct file *file, struct video_device_state *state,
+		    const struct v4l2_audioout *vout);
+int vivid_vid_out_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id);
+int vivid_vid_out_s_dv_timings(struct file *file,
+			       struct video_device_state *state,
+			       struct v4l2_dv_timings *timings);
+int vivid_vid_out_g_parm(struct file *file, struct video_device_state *state,
+			 struct v4l2_streamparm *parm);
 
 #endif
diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 08f0920cf6ca2f2f0fcc8e9a7b1632488d9af5f5..c91db6296c2327fdd6e16874c99c56470578511c 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -605,8 +605,8 @@ static const struct vb2_ops airspy_vb2_ops = {
 	.stop_streaming         = airspy_stop_streaming,
 };
 
-static int airspy_querycap(struct file *file, void *fh,
-		struct v4l2_capability *cap)
+static int airspy_querycap(struct file *file,
+			   struct video_device_state *state, struct v4l2_capability *cap)
 {
 	struct airspy *s = video_drvdata(file);
 
@@ -616,8 +616,8 @@ static int airspy_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int airspy_enum_fmt_sdr_cap(struct file *file, void *priv,
-		struct v4l2_fmtdesc *f)
+static int airspy_enum_fmt_sdr_cap(struct file *file,
+				   struct video_device_state *state, struct v4l2_fmtdesc *f)
 {
 	if (f->index >= NUM_FORMATS)
 		return -EINVAL;
@@ -627,8 +627,8 @@ static int airspy_enum_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int airspy_g_fmt_sdr_cap(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int airspy_g_fmt_sdr_cap(struct file *file,
+				struct video_device_state *state, struct v4l2_format *f)
 {
 	struct airspy *s = video_drvdata(file);
 
@@ -638,8 +638,8 @@ static int airspy_g_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int airspy_s_fmt_sdr_cap(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int airspy_s_fmt_sdr_cap(struct file *file,
+				struct video_device_state *state, struct v4l2_format *f)
 {
 	struct airspy *s = video_drvdata(file);
 	struct vb2_queue *q = &s->vb_queue;
@@ -665,8 +665,8 @@ static int airspy_s_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int airspy_try_fmt_sdr_cap(struct file *file, void *priv,
-		struct v4l2_format *f)
+static int airspy_try_fmt_sdr_cap(struct file *file,
+				  struct video_device_state *state, struct v4l2_format *f)
 {
 	int i;
 
@@ -683,8 +683,8 @@ static int airspy_try_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int airspy_s_tuner(struct file *file, void *priv,
-		const struct v4l2_tuner *v)
+static int airspy_s_tuner(struct file *file,
+			  struct video_device_state *state, const struct v4l2_tuner *v)
 {
 	int ret;
 
@@ -698,7 +698,8 @@ static int airspy_s_tuner(struct file *file, void *priv,
 	return ret;
 }
 
-static int airspy_g_tuner(struct file *file, void *priv, struct v4l2_tuner *v)
+static int airspy_g_tuner(struct file *file, struct video_device_state *state,
+			  struct v4l2_tuner *v)
 {
 	int ret;
 
@@ -723,8 +724,8 @@ static int airspy_g_tuner(struct file *file, void *priv, struct v4l2_tuner *v)
 	return ret;
 }
 
-static int airspy_g_frequency(struct file *file, void *priv,
-		struct v4l2_frequency *f)
+static int airspy_g_frequency(struct file *file,
+			      struct video_device_state *state, struct v4l2_frequency *f)
 {
 	struct airspy *s = video_drvdata(file);
 	int ret;
@@ -746,7 +747,8 @@ static int airspy_g_frequency(struct file *file, void *priv,
 	return ret;
 }
 
-static int airspy_s_frequency(struct file *file, void *priv,
+static int airspy_s_frequency(struct file *file,
+			      struct video_device_state *state,
 		const struct v4l2_frequency *f)
 {
 	struct airspy *s = video_drvdata(file);
@@ -776,7 +778,8 @@ static int airspy_s_frequency(struct file *file, void *priv,
 	return ret;
 }
 
-static int airspy_enum_freq_bands(struct file *file, void *priv,
+static int airspy_enum_freq_bands(struct file *file,
+				  struct video_device_state *state,
 		struct v4l2_frequency_band *band)
 {
 	int ret;
diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fbaa542c8259ac007ed441280d06a2770e4134f4..ec2a9c2b5390b632b0ba11a1be76fba145fd9a88 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -1173,7 +1173,8 @@ static int au0828_set_format(struct au0828_dev *dev, unsigned int cmd,
 	return 0;
 }
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1193,7 +1194,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	if (f->index)
@@ -1206,7 +1208,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1224,7 +1227,8 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1235,7 +1239,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return au0828_set_format(dev, VIDIOC_TRY_FMT, f);
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1259,7 +1264,8 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return rc;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id norm)
 {
 	struct au0828_dev *dev = video_drvdata(file);
 
@@ -1291,7 +1297,8 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *norm)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *norm)
 {
 	struct au0828_dev *dev = video_drvdata(file);
 
@@ -1302,7 +1309,8 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *norm)
 	return 0;
 }
 
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 				struct v4l2_input *input)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1343,7 +1351,8 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct au0828_dev *dev = video_drvdata(file);
 
@@ -1410,7 +1419,8 @@ static void au0828_s_input(struct au0828_dev *dev, int index)
 			AUVI_INPUT(index).amux, 0, 0);
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int index)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int index)
 {
 	struct au0828_dev *dev = video_drvdata(file);
 	struct video_device *vfd = video_devdata(file);
@@ -1436,7 +1446,9 @@ static int vidioc_s_input(struct file *file, void *priv, unsigned int index)
 	return v4l_enable_media_source(vfd);
 }
 
-static int vidioc_enumaudio(struct file *file, void *priv, struct v4l2_audio *a)
+static int vidioc_enumaudio(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_audio *a)
 {
 	if (a->index > 1)
 		return -EINVAL;
@@ -1452,7 +1464,8 @@ static int vidioc_enumaudio(struct file *file, void *priv, struct v4l2_audio *a)
 	return 0;
 }
 
-static int vidioc_g_audio(struct file *file, void *priv, struct v4l2_audio *a)
+static int vidioc_g_audio(struct file *file, struct video_device_state *state,
+			  struct v4l2_audio *a)
 {
 	struct au0828_dev *dev = video_drvdata(file);
 
@@ -1469,7 +1482,8 @@ static int vidioc_g_audio(struct file *file, void *priv, struct v4l2_audio *a)
 	return 0;
 }
 
-static int vidioc_s_audio(struct file *file, void *priv, const struct v4l2_audio *a)
+static int vidioc_s_audio(struct file *file, struct video_device_state *state,
+			  const struct v4l2_audio *a)
 {
 	struct au0828_dev *dev = video_drvdata(file);
 
@@ -1481,7 +1495,8 @@ static int vidioc_s_audio(struct file *file, void *priv, const struct v4l2_audio
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
+static int vidioc_g_tuner(struct file *file, struct video_device_state *state,
+			  struct v4l2_tuner *t)
 {
 	struct au0828_dev *dev = video_drvdata(file);
 	struct video_device *vfd = video_devdata(file);
@@ -1506,7 +1521,8 @@ static int vidioc_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 				const struct v4l2_tuner *t)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1529,7 +1545,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *freq)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1542,7 +1559,8 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *freq)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1572,7 +1590,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 
 /* RAW VBI ioctls */
 
-static int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vbi_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *format)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1595,8 +1614,9 @@ static int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_pixelaspect(struct file *file, void *priv,
-				int type, struct v4l2_fract *f)
+static int vidioc_g_pixelaspect(struct file *file,
+				struct video_device_state *state, int type,
+				struct v4l2_fract *f)
 {
 	struct au0828_dev *dev = video_drvdata(file);
 
@@ -1612,7 +1632,8 @@ static int vidioc_g_pixelaspect(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_selection(struct file *file, void *priv,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1635,7 +1656,8 @@ static int vidioc_g_selection(struct file *file, void *priv,
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int vidioc_g_register(struct file *file, void *priv,
+static int vidioc_g_register(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_dbg_register *reg)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1648,7 +1670,8 @@ static int vidioc_g_register(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_register(struct file *file, void *priv,
+static int vidioc_s_register(struct file *file,
+			     struct video_device_state *state,
 			     const struct v4l2_dbg_register *reg)
 {
 	struct au0828_dev *dev = video_drvdata(file);
@@ -1660,13 +1683,14 @@ static int vidioc_s_register(struct file *file, void *priv,
 }
 #endif
 
-static int vidioc_log_status(struct file *file, void *fh)
+static int vidioc_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	dprintk(1, "%s called\n", __func__);
 
-	v4l2_ctrl_log_status(file, fh);
+	v4l2_ctrl_log_status(file, state);
 	v4l2_device_call_all(vdev->v4l2_dev, 0, core, log_status);
 	return 0;
 }
diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index c695a97e202b7134f66d9b1438ebabfcf5628def..183a46a46ba491956807024d3d611c8b15d4f7de 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1462,8 +1462,9 @@ static const struct vb2_ops cx231xx_video_qops = {
 
 /* ------------------------------------------------------------------ */
 
-static int vidioc_g_pixelaspect(struct file *file, void *priv,
-				int type, struct v4l2_fract *f)
+static int vidioc_g_pixelaspect(struct file *file,
+				struct video_device_state *state, int type,
+				struct v4l2_fract *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
 	bool is_50hz = dev->encodernorm.id & V4L2_STD_625_50;
@@ -1477,7 +1478,8 @@ static int vidioc_g_pixelaspect(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_selection(struct file *file, void *priv,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1499,7 +1501,8 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *norm)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *norm)
 {
 	struct cx231xx *dev = video_drvdata(file);
 
@@ -1507,7 +1510,8 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *norm)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id id)
 {
 	struct cx231xx *dev = video_drvdata(file);
 	unsigned int i;
@@ -1538,7 +1542,8 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	if (f->index != 0)
@@ -1549,7 +1554,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1568,7 +1574,8 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1585,12 +1592,13 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_log_status(struct file *file, void *priv)
+static int vidioc_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct cx231xx *dev = video_drvdata(file);
 
 	call_all(dev, core, log_status);
-	return v4l2_ctrl_log_status(file, priv);
+	return v4l2_ctrl_log_status(file, state);
 }
 
 static const struct v4l2_file_operations mpeg_fops = {
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 2cd4e333bc4b012f97df98f8771f2508d81c3b3c..a751b55fc60e3df69e03a89fc48154b63bc9138c 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -825,7 +825,8 @@ void video_mux(struct cx231xx *dev, int index)
 	IOCTL vidioc handling
    ------------------------------------------------------------------*/
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -853,7 +854,8 @@ static struct cx231xx_fmt *format_by_fourcc(unsigned int fourcc)
 	return NULL;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -885,7 +887,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -894,7 +897,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	};
 	int rc;
 
-	rc = vidioc_try_fmt_vid_cap(file, priv, f);
+	rc = vidioc_try_fmt_vid_cap(file, state, f);
 	if (rc)
 		return rc;
 
@@ -915,7 +918,8 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return rc;
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *id)
 {
 	struct cx231xx *dev = video_drvdata(file);
 
@@ -923,7 +927,8 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id norm)
 {
 	struct cx231xx *dev = video_drvdata(file);
 	struct v4l2_subdev_format format = {
@@ -1012,7 +1017,8 @@ void cx231xx_v4l2_create_entities(struct cx231xx *dev)
 #endif
 }
 
-int cx231xx_enum_input(struct file *file, void *priv,
+int cx231xx_enum_input(struct file *file,
+		       struct video_device_state *state,
 			     struct v4l2_input *i)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1052,7 +1058,8 @@ int cx231xx_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-int cx231xx_g_input(struct file *file, void *priv, unsigned int *i)
+int cx231xx_g_input(struct file *file, struct video_device_state *state,
+		    unsigned int *i)
 {
 	struct cx231xx *dev = video_drvdata(file);
 
@@ -1061,7 +1068,8 @@ int cx231xx_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-int cx231xx_s_input(struct file *file, void *priv, unsigned int i)
+int cx231xx_s_input(struct file *file, struct video_device_state *state,
+		    unsigned int i)
 {
 	struct cx231xx *dev = video_drvdata(file);
 
@@ -1085,7 +1093,8 @@ int cx231xx_s_input(struct file *file, void *priv, unsigned int i)
 	return 0;
 }
 
-int cx231xx_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
+int cx231xx_g_tuner(struct file *file, struct video_device_state *state,
+		    struct v4l2_tuner *t)
 {
 	struct cx231xx *dev = video_drvdata(file);
 
@@ -1103,14 +1112,16 @@ int cx231xx_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 	return 0;
 }
 
-int cx231xx_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *t)
+int cx231xx_s_tuner(struct file *file, struct video_device_state *state,
+		    const struct v4l2_tuner *t)
 {
 	if (0 != t->index)
 		return -EINVAL;
 	return 0;
 }
 
-int cx231xx_g_frequency(struct file *file, void *priv,
+int cx231xx_g_frequency(struct file *file,
+			struct video_device_state *state,
 			      struct v4l2_frequency *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1123,7 +1134,8 @@ int cx231xx_g_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-int cx231xx_s_frequency(struct file *file, void *priv,
+int cx231xx_s_frequency(struct file *file,
+			struct video_device_state *state,
 			      const struct v4l2_frequency *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1194,7 +1206,8 @@ int cx231xx_s_frequency(struct file *file, void *priv,
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 
-int cx231xx_g_chip_info(struct file *file, void *fh,
+int cx231xx_g_chip_info(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_dbg_chip_info *chip)
 {
 	switch (chip->match.addr) {
@@ -1222,7 +1235,8 @@ int cx231xx_g_chip_info(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-int cx231xx_g_register(struct file *file, void *priv,
+int cx231xx_g_register(struct file *file,
+		       struct video_device_state *state,
 			     struct v4l2_dbg_register *reg)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1280,7 +1294,8 @@ int cx231xx_g_register(struct file *file, void *priv,
 	return ret < 0 ? ret : 0;
 }
 
-int cx231xx_s_register(struct file *file, void *priv,
+int cx231xx_s_register(struct file *file,
+		       struct video_device_state *state,
 			     const struct v4l2_dbg_register *reg)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1327,8 +1342,9 @@ int cx231xx_s_register(struct file *file, void *priv,
 }
 #endif
 
-static int vidioc_g_pixelaspect(struct file *file, void *priv,
-				int type, struct v4l2_fract *f)
+static int vidioc_g_pixelaspect(struct file *file,
+				struct video_device_state *state, int type,
+				struct v4l2_fract *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
 	bool is_50hz = dev->norm & V4L2_STD_625_50;
@@ -1342,7 +1358,8 @@ static int vidioc_g_pixelaspect(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_selection(struct file *file, void *priv,
+static int vidioc_g_selection(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_selection *s)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1364,7 +1381,8 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-int cx231xx_querycap(struct file *file, void *priv,
+int cx231xx_querycap(struct file *file,
+		     struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1394,7 +1412,8 @@ int cx231xx_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	if (unlikely(f->index >= ARRAY_SIZE(format)))
@@ -1407,7 +1426,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 
 /* RAW VBI ioctls */
 
-static int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vbi_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1429,7 +1449,8 @@ static int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
 
 }
 
-static int vidioc_try_fmt_vbi_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vbi_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct cx231xx *dev = video_drvdata(file);
@@ -1452,17 +1473,19 @@ static int vidioc_try_fmt_vbi_cap(struct file *file, void *priv,
 
 }
 
-static int vidioc_s_fmt_vbi_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vbi_cap(struct file *file,
+				struct video_device_state *state,
 				  struct v4l2_format *f)
 {
-	return vidioc_try_fmt_vbi_cap(file, priv, f);
+	return vidioc_try_fmt_vbi_cap(file, state, f);
 }
 
 /* ----------------------------------------------------------- */
 /* RADIO ESPECIFIC IOCTLS                                      */
 /* ----------------------------------------------------------- */
 
-static int radio_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
+static int radio_g_tuner(struct file *file, struct video_device_state *state,
+			 struct v4l2_tuner *t)
 {
 	struct cx231xx *dev = video_drvdata(file);
 
@@ -1475,7 +1498,9 @@ static int radio_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 
 	return 0;
 }
-static int radio_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *t)
+
+static int radio_s_tuner(struct file *file, struct video_device_state *state,
+			 const struct v4l2_tuner *t)
 {
 	struct cx231xx *dev = video_drvdata(file);
 
diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 19f5036a78d7f42aebdfe164025477a68eadf1b7..0e92db0b0455333d831095946d0d791b2a017bae 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -924,23 +924,28 @@ void cx231xx_unregister_extension(struct cx231xx_ops *dev);
 void cx231xx_init_extension(struct cx231xx *dev);
 void cx231xx_close_extension(struct cx231xx *dev);
 void cx231xx_v4l2_create_entities(struct cx231xx *dev);
-int cx231xx_querycap(struct file *file, void *priv,
-			   struct v4l2_capability *cap);
-int cx231xx_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t);
-int cx231xx_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *t);
-int cx231xx_g_frequency(struct file *file, void *priv,
-			      struct v4l2_frequency *f);
-int cx231xx_s_frequency(struct file *file, void *priv,
-			      const struct v4l2_frequency *f);
-int cx231xx_enum_input(struct file *file, void *priv,
-			     struct v4l2_input *i);
-int cx231xx_g_input(struct file *file, void *priv, unsigned int *i);
-int cx231xx_s_input(struct file *file, void *priv, unsigned int i);
-int cx231xx_g_chip_info(struct file *file, void *fh, struct v4l2_dbg_chip_info *chip);
-int cx231xx_g_register(struct file *file, void *priv,
-			     struct v4l2_dbg_register *reg);
-int cx231xx_s_register(struct file *file, void *priv,
-			     const struct v4l2_dbg_register *reg);
+int cx231xx_querycap(struct file *file, struct video_device_state *state,
+		     struct v4l2_capability *cap);
+int cx231xx_g_tuner(struct file *file, struct video_device_state *state,
+		    struct v4l2_tuner *t);
+int cx231xx_s_tuner(struct file *file, struct video_device_state *state,
+		    const struct v4l2_tuner *t);
+int cx231xx_g_frequency(struct file *file, struct video_device_state *state,
+			struct v4l2_frequency *f);
+int cx231xx_s_frequency(struct file *file, struct video_device_state *state,
+			const struct v4l2_frequency *f);
+int cx231xx_enum_input(struct file *file, struct video_device_state *state,
+		       struct v4l2_input *i);
+int cx231xx_g_input(struct file *file, struct video_device_state *state,
+		    unsigned int *i);
+int cx231xx_s_input(struct file *file, struct video_device_state *state,
+		    unsigned int i);
+int cx231xx_g_chip_info(struct file *file, struct video_device_state *state,
+			struct v4l2_dbg_chip_info *chip);
+int cx231xx_g_register(struct file *file, struct video_device_state *state,
+		       struct v4l2_dbg_register *reg);
+int cx231xx_s_register(struct file *file, struct video_device_state *state,
+		       const struct v4l2_dbg_register *reg);
 
 /* Provided by cx231xx-cards.c */
 extern void cx231xx_pre_card_setup(struct cx231xx *dev);
diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index 3bbee1fcbc8dc3d7ef7b408333d4af1f16bb1d6d..a7e209e8173bb2d2795202f856887e0a6ad46b7d 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -962,7 +962,8 @@ static const __u32 videocaps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TUNER |
 	V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
 static const __u32 radiocaps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
 
-static int cxusb_medion_v_querycap(struct file *file, void *fh,
+static int cxusb_medion_v_querycap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_capability *cap)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -977,7 +978,8 @@ static int cxusb_medion_v_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cxusb_medion_v_enum_fmt_vid_cap(struct file *file, void *fh,
+static int cxusb_medion_v_enum_fmt_vid_cap(struct file *file,
+					   struct video_device_state *state,
 					   struct v4l2_fmtdesc *f)
 {
 	if (f->index != 0)
@@ -988,7 +990,8 @@ static int cxusb_medion_v_enum_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cxusb_medion_g_fmt_vid_cap(struct file *file, void *fh,
+static int cxusb_medion_g_fmt_vid_cap(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_format *f)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1051,13 +1054,15 @@ static int cxusb_medion_try_s_fmt_vid_cap(struct file *file,
 	return 0;
 }
 
-static int cxusb_medion_try_fmt_vid_cap(struct file *file, void *fh,
+static int cxusb_medion_try_fmt_vid_cap(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	return cxusb_medion_try_s_fmt_vid_cap(file, f, false);
 }
 
-static int cxusb_medion_s_fmt_vid_cap(struct file *file, void *fh,
+static int cxusb_medion_s_fmt_vid_cap(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_format *f)
 {
 	return cxusb_medion_try_s_fmt_vid_cap(file, f, true);
@@ -1082,7 +1087,8 @@ static const struct {
 
 #define CXUSB_INPUT_CNT ARRAY_SIZE(cxusb_medion_inputs)
 
-static int cxusb_medion_enum_input(struct file *file, void *fh,
+static int cxusb_medion_enum_input(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_input *inp)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1113,7 +1119,8 @@ static int cxusb_medion_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int cxusb_medion_g_input(struct file *file, void *fh,
+static int cxusb_medion_g_input(struct file *file,
+				struct video_device_state *state,
 				unsigned int *i)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1182,7 +1189,8 @@ static int cxusb_medion_set_norm(struct cxusb_medion_dev *cxdev,
 	return 0;
 }
 
-static int cxusb_medion_s_input(struct file *file, void *fh,
+static int cxusb_medion_s_input(struct file *file,
+				struct video_device_state *state,
 				unsigned int i)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1210,7 +1218,8 @@ static int cxusb_medion_s_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int cxusb_medion_g_tuner(struct file *file, void *fh,
+static int cxusb_medion_g_tuner(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_tuner *tuner)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1267,7 +1276,8 @@ static int cxusb_medion_g_tuner(struct file *file, void *fh,
 	return 0;
 }
 
-static int cxusb_medion_s_tuner(struct file *file, void *fh,
+static int cxusb_medion_s_tuner(struct file *file,
+				struct video_device_state *state,
 				const struct v4l2_tuner *tuner)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1298,7 +1308,8 @@ static int cxusb_medion_s_tuner(struct file *file, void *fh,
 	return v4l2_subdev_call(cxdev->cx25840, tuner, s_tuner, tuner);
 }
 
-static int cxusb_medion_g_frequency(struct file *file, void *fh,
+static int cxusb_medion_g_frequency(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_frequency *freq)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1310,7 +1321,8 @@ static int cxusb_medion_g_frequency(struct file *file, void *fh,
 	return v4l2_subdev_call(cxdev->tuner, tuner, g_frequency, freq);
 }
 
-static int cxusb_medion_s_frequency(struct file *file, void *fh,
+static int cxusb_medion_s_frequency(struct file *file,
+				    struct video_device_state *state,
 				    const struct v4l2_frequency *freq)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1341,7 +1353,8 @@ static int cxusb_medion_s_frequency(struct file *file, void *fh,
 	return v4l2_subdev_call(cxdev->cx25840, tuner, s_frequency, freq);
 }
 
-static int cxusb_medion_g_std(struct file *file, void *fh,
+static int cxusb_medion_g_std(struct file *file,
+			      struct video_device_state *state,
 			      v4l2_std_id *norm)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1355,7 +1368,8 @@ static int cxusb_medion_g_std(struct file *file, void *fh,
 	return 0;
 }
 
-static int cxusb_medion_s_std(struct file *file, void *fh,
+static int cxusb_medion_s_std(struct file *file,
+			      struct video_device_state *state,
 			      v4l2_std_id norm)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1364,7 +1378,8 @@ static int cxusb_medion_s_std(struct file *file, void *fh,
 	return cxusb_medion_set_norm(cxdev, norm);
 }
 
-static int cxusb_medion_querystd(struct file *file, void *fh,
+static int cxusb_medion_querystd(struct file *file,
+				 struct video_device_state *state,
 				 v4l2_std_id *norm)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
@@ -1396,7 +1411,8 @@ static int cxusb_medion_querystd(struct file *file, void *fh,
 	return 0;
 }
 
-static int cxusb_medion_log_status(struct file *file, void *fh)
+static int cxusb_medion_log_status(struct file *file,
+				   struct video_device_state *state)
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
 	struct cxusb_medion_dev *cxdev = dvbdev->priv;
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 2dfa3242a7ab52b7dcaf279efe54bbcf00658fdf..796198e3aa4f8e64fcc45e1668ebc4d743508983 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1407,7 +1407,8 @@ static void scale_to_size(struct em28xx *dev,
  * IOCTL vidioc handling
  */
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct em28xx         *dev = video_drvdata(file);
@@ -1440,7 +1441,8 @@ static struct em28xx_fmt *format_by_fourcc(unsigned int fourcc)
 	return NULL;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct em28xx         *dev   = video_drvdata(file);
@@ -1525,7 +1527,8 @@ static int em28xx_set_video_format(struct em28xx *dev, unsigned int fourcc,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct em28xx *dev = video_drvdata(file);
@@ -1534,13 +1537,14 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	if (vb2_is_busy(&v4l2->vb_vidq))
 		return -EBUSY;
 
-	vidioc_try_fmt_vid_cap(file, priv, f);
+	vidioc_try_fmt_vid_cap(file, state, f);
 
 	return em28xx_set_video_format(dev, f->fmt.pix.pixelformat,
 				f->fmt.pix.width, f->fmt.pix.height);
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *norm)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *norm)
 {
 	struct em28xx *dev = video_drvdata(file);
 
@@ -1549,7 +1553,9 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *norm)
 	return 0;
 }
 
-static int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *norm)
+static int vidioc_querystd(struct file *file,
+			   struct video_device_state *state,
+			   v4l2_std_id *norm)
 {
 	struct em28xx *dev = video_drvdata(file);
 
@@ -1558,7 +1564,8 @@ static int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *norm)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id norm)
 {
 	struct em28xx      *dev  = video_drvdata(file);
 	struct em28xx_v4l2 *v4l2 = dev->v4l2;
@@ -1575,7 +1582,7 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
 	/* Adjusts width/height, if needed */
 	f.fmt.pix.width = 720;
 	f.fmt.pix.height = (norm & V4L2_STD_525_60) ? 480 : 576;
-	vidioc_try_fmt_vid_cap(file, priv, &f);
+	vidioc_try_fmt_vid_cap(file, state, &f);
 
 	/* set new image size */
 	v4l2->width = f.fmt.pix.width;
@@ -1589,7 +1596,8 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
 	return 0;
 }
 
-static int vidioc_g_parm(struct file *file, void *priv,
+static int vidioc_g_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *p)
 {
 	struct v4l2_subdev_frame_interval ival = { 0 };
@@ -1617,7 +1625,8 @@ static int vidioc_g_parm(struct file *file, void *priv,
 	return rc;
 }
 
-static int vidioc_s_parm(struct file *file, void *priv,
+static int vidioc_s_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *p)
 {
 	struct em28xx *dev = video_drvdata(file);
@@ -1645,7 +1654,8 @@ static int vidioc_s_parm(struct file *file, void *priv,
 	return rc;
 }
 
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_input *i)
 {
 	struct em28xx *dev = video_drvdata(file);
@@ -1679,7 +1689,8 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct em28xx *dev = video_drvdata(file);
 
@@ -1688,7 +1699,8 @@ static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct em28xx *dev = video_drvdata(file);
 
@@ -1756,7 +1768,9 @@ static int em28xx_fill_audio_input(struct em28xx *dev,
 	return 0;
 }
 
-static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
+static int vidioc_enumaudio(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_audio *a)
 {
 	struct em28xx *dev = video_drvdata(file);
 
@@ -1766,7 +1780,8 @@ static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
 	return em28xx_fill_audio_input(dev, __func__, a, a->index);
 }
 
-static int vidioc_g_audio(struct file *file, void *priv, struct v4l2_audio *a)
+static int vidioc_g_audio(struct file *file, struct video_device_state *state,
+			  struct v4l2_audio *a)
 {
 	struct em28xx *dev = video_drvdata(file);
 	int i;
@@ -1779,7 +1794,8 @@ static int vidioc_g_audio(struct file *file, void *priv, struct v4l2_audio *a)
 	return -EINVAL;
 }
 
-static int vidioc_s_audio(struct file *file, void *priv,
+static int vidioc_s_audio(struct file *file,
+			  struct video_device_state *state,
 			  const struct v4l2_audio *a)
 {
 	struct em28xx *dev = video_drvdata(file);
@@ -1819,7 +1835,8 @@ static int vidioc_s_audio(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_tuner *t)
 {
 	struct em28xx *dev = video_drvdata(file);
@@ -1833,7 +1850,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 			  const struct v4l2_tuner *t)
 {
 	struct em28xx *dev = video_drvdata(file);
@@ -1845,7 +1863,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_frequency *f)
 {
 	struct em28xx         *dev = video_drvdata(file);
@@ -1858,7 +1877,8 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 			      const struct v4l2_frequency *f)
 {
 	struct v4l2_frequency  new_freq = *f;
@@ -1876,7 +1896,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int vidioc_g_chip_info(struct file *file, void *priv,
+static int vidioc_g_chip_info(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_dbg_chip_info *chip)
 {
 	struct em28xx *dev = video_drvdata(file);
@@ -1903,7 +1924,8 @@ static int em28xx_reg_len(int reg)
 	}
 }
 
-static int vidioc_g_register(struct file *file, void *priv,
+static int vidioc_g_register(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_dbg_register *reg)
 {
 	struct em28xx *dev = video_drvdata(file);
@@ -1944,7 +1966,8 @@ static int vidioc_g_register(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_register(struct file *file, void *priv,
+static int vidioc_s_register(struct file *file,
+			     struct video_device_state *state,
 			     const struct v4l2_dbg_register *reg)
 {
 	struct em28xx *dev = video_drvdata(file);
@@ -1963,7 +1986,8 @@ static int vidioc_s_register(struct file *file, void *priv,
 }
 #endif
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct em28xx         *dev  = video_drvdata(file);
@@ -1987,7 +2011,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	if (unlikely(f->index >= ARRAY_SIZE(format)))
@@ -1998,7 +2023,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_enum_framesizes(struct file *file, void *priv,
+static int vidioc_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct em28xx         *dev = video_drvdata(file);
@@ -2042,7 +2068,8 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 
 /* RAW VBI ioctls */
 
-static int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vbi_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *format)
 {
 	struct em28xx         *dev  = video_drvdata(file);
@@ -2075,7 +2102,8 @@ static int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
  * RADIO ESPECIFIC IOCTLS
  */
 
-static int radio_g_tuner(struct file *file, void *priv,
+static int radio_g_tuner(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_tuner *t)
 {
 	struct em28xx *dev = video_drvdata(file);
@@ -2090,7 +2118,8 @@ static int radio_g_tuner(struct file *file, void *priv,
 	return 0;
 }
 
-static int radio_s_tuner(struct file *file, void *priv,
+static int radio_s_tuner(struct file *file,
+			 struct video_device_state *state,
 			 const struct v4l2_tuner *t)
 {
 	struct em28xx *dev = video_drvdata(file);
diff --git a/drivers/media/usb/go7007/go7007-v4l2.c b/drivers/media/usb/go7007/go7007-v4l2.c
index 2087ffcb85a5a6d1f89b66a81d65f01772758c9f..22b09429beedc259c94b4d18ba8fbb68cf054b0a 100644
--- a/drivers/media/usb/go7007/go7007-v4l2.c
+++ b/drivers/media/usb/go7007/go7007-v4l2.c
@@ -271,7 +271,8 @@ static int set_capture_size(struct go7007 *go, struct v4l2_format *fmt, int try)
 	return 0;
 }
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 					struct v4l2_capability *cap)
 {
 	struct go7007 *go = video_drvdata(file);
@@ -282,7 +283,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 					struct v4l2_fmtdesc *fmt)
 {
 	switch (fmt->index) {
@@ -304,7 +306,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 					struct v4l2_format *fmt)
 {
 	struct go7007 *go = video_drvdata(file);
@@ -321,7 +324,8 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 			struct v4l2_format *fmt)
 {
 	struct go7007 *go = video_drvdata(file);
@@ -329,7 +333,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return set_capture_size(go, fmt, 1);
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 			struct v4l2_format *fmt)
 {
 	struct go7007 *go = video_drvdata(file);
@@ -454,7 +459,8 @@ static const struct vb2_ops go7007_video_qops = {
 	.stop_streaming = go7007_stop_streaming,
 };
 
-static int vidioc_g_parm(struct file *filp, void *priv,
+static int vidioc_g_parm(struct file *filp,
+			 struct video_device_state *state,
 		struct v4l2_streamparm *parm)
 {
 	struct go7007 *go = video_drvdata(filp);
@@ -473,7 +479,8 @@ static int vidioc_g_parm(struct file *filp, void *priv,
 	return 0;
 }
 
-static int vidioc_s_parm(struct file *filp, void *priv,
+static int vidioc_s_parm(struct file *filp,
+			 struct video_device_state *state,
 		struct v4l2_streamparm *parm)
 {
 	struct go7007 *go = video_drvdata(filp);
@@ -490,7 +497,7 @@ static int vidioc_s_parm(struct file *filp, void *priv,
 	else
 		go->fps_scale = 1;
 
-	return vidioc_g_parm(filp, priv, parm);
+	return vidioc_g_parm(filp, state, parm);
 }
 
 /* VIDIOC_ENUMSTD on go7007 were used for enumerating the supported fps and
@@ -503,7 +510,8 @@ static int vidioc_s_parm(struct file *filp, void *priv,
 
    The two functions below implement the newer ioctls
 */
-static int vidioc_enum_framesizes(struct file *filp, void *priv,
+static int vidioc_enum_framesizes(struct file *filp,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct go7007 *go = video_drvdata(filp);
@@ -522,7 +530,8 @@ static int vidioc_enum_framesizes(struct file *filp, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_frameintervals(struct file *filp, void *priv,
+static int vidioc_enum_frameintervals(struct file *filp,
+				      struct video_device_state *state,
 				      struct v4l2_frmivalenum *fival)
 {
 	struct go7007 *go = video_drvdata(filp);
@@ -550,7 +559,8 @@ static int vidioc_enum_frameintervals(struct file *filp, void *priv,
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *std)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *std)
 {
 	struct go7007 *go = video_drvdata(file);
 
@@ -573,7 +583,8 @@ static int go7007_s_std(struct go7007 *go)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id std)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id std)
 {
 	struct go7007 *go = video_drvdata(file);
 
@@ -585,14 +596,16 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id std)
 	return go7007_s_std(go);
 }
 
-static int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *std)
+static int vidioc_querystd(struct file *file,
+			   struct video_device_state *state, v4l2_std_id *std)
 {
 	struct go7007 *go = video_drvdata(file);
 
 	return call_all(&go->v4l2_dev, video, querystd, std);
 }
 
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 				struct v4l2_input *inp)
 {
 	struct go7007 *go = video_drvdata(file);
@@ -624,7 +637,8 @@ static int vidioc_enum_input(struct file *file, void *priv,
 }
 
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *input)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *input)
 {
 	struct go7007 *go = video_drvdata(file);
 
@@ -633,7 +647,9 @@ static int vidioc_g_input(struct file *file, void *priv, unsigned int *input)
 	return 0;
 }
 
-static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
+static int vidioc_enumaudio(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_audio *a)
 {
 	struct go7007 *go = video_drvdata(file);
 
@@ -645,7 +661,8 @@ static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
 	return 0;
 }
 
-static int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *a)
+static int vidioc_g_audio(struct file *file, struct video_device_state *state,
+			  struct v4l2_audio *a)
 {
 	struct go7007 *go = video_drvdata(file);
 
@@ -656,8 +673,8 @@ static int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *a)
 	return 0;
 }
 
-static int vidioc_s_audio(struct file *file, void *fh,
-	const struct v4l2_audio *a)
+static int vidioc_s_audio(struct file *file,
+			  struct video_device_state *state, const struct v4l2_audio *a)
 {
 	struct go7007 *go = video_drvdata(file);
 
@@ -685,7 +702,8 @@ static void go7007_s_input(struct go7007 *go)
 	}
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int input)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int input)
 {
 	struct go7007 *go = video_drvdata(file);
 
@@ -700,7 +718,8 @@ static int vidioc_s_input(struct file *file, void *priv, unsigned int input)
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *priv,
+static int vidioc_g_tuner(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_tuner *t)
 {
 	struct go7007 *go = video_drvdata(file);
@@ -712,7 +731,8 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 	return call_all(&go->v4l2_dev, tuner, g_tuner, t);
 }
 
-static int vidioc_s_tuner(struct file *file, void *priv,
+static int vidioc_s_tuner(struct file *file,
+			  struct video_device_state *state,
 				const struct v4l2_tuner *t)
 {
 	struct go7007 *go = video_drvdata(file);
@@ -723,7 +743,8 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	return call_all(&go->v4l2_dev, tuner, s_tuner, t);
 }
 
-static int vidioc_g_frequency(struct file *file, void *priv,
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_frequency *f)
 {
 	struct go7007 *go = video_drvdata(file);
@@ -734,7 +755,8 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 	return call_all(&go->v4l2_dev, tuner, g_frequency, f);
 }
 
-static int vidioc_s_frequency(struct file *file, void *priv,
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
 				const struct v4l2_frequency *f)
 {
 	struct go7007 *go = video_drvdata(file);
@@ -745,11 +767,12 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	return call_all(&go->v4l2_dev, tuner, s_frequency, f);
 }
 
-static int vidioc_log_status(struct file *file, void *priv)
+static int vidioc_log_status(struct file *file,
+			     struct video_device_state *state)
 {
 	struct go7007 *go = video_drvdata(file);
 
-	v4l2_ctrl_log_status(file, priv);
+	v4l2_ctrl_log_status(file, state);
 	return call_all(&go->v4l2_dev, core, log_status);
 }
 
diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 3fc15d16df8e10d4762c1f0a6c7dd2f7c57c2675..4d0cb2b93c0fdea6a9f9221b0e9ec2460f5019ee 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -967,7 +967,8 @@ static int gspca_get_mode(struct gspca_dev *gspca_dev,
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int vidioc_g_chip_info(struct file *file, void *priv,
+static int vidioc_g_chip_info(struct file *file,
+			      struct video_device_state *state,
 				struct v4l2_dbg_chip_info *chip)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -978,7 +979,8 @@ static int vidioc_g_chip_info(struct file *file, void *priv,
 	return chip->match.addr ? -EINVAL : 0;
 }
 
-static int vidioc_g_register(struct file *file, void *priv,
+static int vidioc_g_register(struct file *file,
+			     struct video_device_state *state,
 		struct v4l2_dbg_register *reg)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -987,7 +989,8 @@ static int vidioc_g_register(struct file *file, void *priv,
 	return gspca_dev->sd_desc->get_register(gspca_dev, reg);
 }
 
-static int vidioc_s_register(struct file *file, void *priv,
+static int vidioc_s_register(struct file *file,
+			     struct video_device_state *state,
 		const struct v4l2_dbg_register *reg)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -997,7 +1000,8 @@ static int vidioc_s_register(struct file *file, void *priv,
 }
 #endif
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				struct v4l2_fmtdesc *fmtdesc)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -1029,7 +1033,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -1075,7 +1080,8 @@ static int try_fmt_vid_cap(struct gspca_dev *gspca_dev,
 	return mode;			/* used when s_fmt */
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *fmt)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -1088,7 +1094,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *fmt)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -1113,7 +1120,8 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_framesizes(struct file *file, void *priv,
+static int vidioc_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -1142,7 +1150,8 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int vidioc_enum_frameintervals(struct file *filp, void *priv,
+static int vidioc_enum_frameintervals(struct file *filp,
+				      struct video_device_state *state,
 				      struct v4l2_frmivalenum *fival)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(filp);
@@ -1186,7 +1195,8 @@ static void gspca_release(struct v4l2_device *v4l2_device)
 	kfree(gspca_dev);
 }
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -1207,7 +1217,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 				struct v4l2_input *input)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -1221,20 +1232,23 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	if (i > 0)
 		return -EINVAL;
 	return 0;
 }
 
-static int vidioc_g_jpegcomp(struct file *file, void *priv,
+static int vidioc_g_jpegcomp(struct file *file,
+			     struct video_device_state *state,
 			struct v4l2_jpegcompression *jpegcomp)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -1243,7 +1257,8 @@ static int vidioc_g_jpegcomp(struct file *file, void *priv,
 	return gspca_dev->sd_desc->get_jcomp(gspca_dev, jpegcomp);
 }
 
-static int vidioc_s_jpegcomp(struct file *file, void *priv,
+static int vidioc_s_jpegcomp(struct file *file,
+			     struct video_device_state *state,
 			const struct v4l2_jpegcompression *jpegcomp)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
@@ -1252,7 +1267,8 @@ static int vidioc_s_jpegcomp(struct file *file, void *priv,
 	return gspca_dev->sd_desc->set_jcomp(gspca_dev, jpegcomp);
 }
 
-static int vidioc_g_parm(struct file *filp, void *priv,
+static int vidioc_g_parm(struct file *filp,
+			 struct video_device_state *state,
 			struct v4l2_streamparm *parm)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(filp);
@@ -1268,7 +1284,8 @@ static int vidioc_g_parm(struct file *filp, void *priv,
 	return gspca_dev->usb_err;
 }
 
-static int vidioc_s_parm(struct file *filp, void *priv,
+static int vidioc_s_parm(struct file *filp,
+			 struct video_device_state *state,
 			struct v4l2_streamparm *parm)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(filp);
diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 0b50de8775a38deb11c50da799c98b1a1ef14d0a..4b5a2f5f311c107ab6c67d946fd0c89b43ead5fa 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -890,8 +890,8 @@ static const struct vb2_ops hackrf_vb2_ops = {
 	.stop_streaming         = hackrf_stop_streaming,
 };
 
-static int hackrf_querycap(struct file *file, void *fh,
-		struct v4l2_capability *cap)
+static int hackrf_querycap(struct file *file,
+			   struct video_device_state *state, struct v4l2_capability *cap)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
 	struct usb_interface *intf = dev->intf;
@@ -909,7 +909,8 @@ static int hackrf_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int hackrf_s_fmt_sdr(struct file *file, void *priv,
+static int hackrf_s_fmt_sdr(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
@@ -945,7 +946,8 @@ static int hackrf_s_fmt_sdr(struct file *file, void *priv,
 	return 0;
 }
 
-static int hackrf_g_fmt_sdr(struct file *file, void *priv,
+static int hackrf_g_fmt_sdr(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
@@ -959,7 +961,8 @@ static int hackrf_g_fmt_sdr(struct file *file, void *priv,
 	return 0;
 }
 
-static int hackrf_try_fmt_sdr(struct file *file, void *priv,
+static int hackrf_try_fmt_sdr(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
@@ -981,7 +984,8 @@ static int hackrf_try_fmt_sdr(struct file *file, void *priv,
 	return 0;
 }
 
-static int hackrf_enum_fmt_sdr(struct file *file, void *priv,
+static int hackrf_enum_fmt_sdr(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_fmtdesc *f)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
@@ -996,8 +1000,8 @@ static int hackrf_enum_fmt_sdr(struct file *file, void *priv,
 	return 0;
 }
 
-static int hackrf_s_tuner(struct file *file, void *priv,
-		const struct v4l2_tuner *v)
+static int hackrf_s_tuner(struct file *file,
+			  struct video_device_state *state, const struct v4l2_tuner *v)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
 	int ret;
@@ -1014,7 +1018,8 @@ static int hackrf_s_tuner(struct file *file, void *priv,
 	return ret;
 }
 
-static int hackrf_g_tuner(struct file *file, void *priv, struct v4l2_tuner *v)
+static int hackrf_g_tuner(struct file *file, struct video_device_state *state,
+			  struct v4l2_tuner *v)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
 	int ret;
@@ -1042,7 +1047,8 @@ static int hackrf_g_tuner(struct file *file, void *priv, struct v4l2_tuner *v)
 	return ret;
 }
 
-static int hackrf_s_modulator(struct file *file, void *fh,
+static int hackrf_s_modulator(struct file *file,
+			      struct video_device_state *state,
 			      const struct v4l2_modulator *a)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
@@ -1052,7 +1058,8 @@ static int hackrf_s_modulator(struct file *file, void *fh,
 	return a->index > 1 ? -EINVAL : 0;
 }
 
-static int hackrf_g_modulator(struct file *file, void *fh,
+static int hackrf_g_modulator(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_modulator *a)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
@@ -1081,7 +1088,8 @@ static int hackrf_g_modulator(struct file *file, void *fh,
 	return ret;
 }
 
-static int hackrf_s_frequency(struct file *file, void *priv,
+static int hackrf_s_frequency(struct file *file,
+			      struct video_device_state *state,
 		const struct v4l2_frequency *f)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
@@ -1128,8 +1136,8 @@ static int hackrf_s_frequency(struct file *file, void *priv,
 	return ret;
 }
 
-static int hackrf_g_frequency(struct file *file, void *priv,
-		struct v4l2_frequency *f)
+static int hackrf_g_frequency(struct file *file,
+			      struct video_device_state *state, struct v4l2_frequency *f)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
 	struct usb_interface *intf = dev->intf;
@@ -1161,7 +1169,8 @@ static int hackrf_g_frequency(struct file *file, void *priv,
 	return ret;
 }
 
-static int hackrf_enum_freq_bands(struct file *file, void *priv,
+static int hackrf_enum_freq_bands(struct file *file,
+				  struct video_device_state *state,
 		struct v4l2_frequency_band *band)
 {
 	struct hackrf_dev *dev = video_drvdata(file);
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 8c7ae362d992ab603827424e9159d98c79886fb8..16770b18259b11fce04f85c999b9759dbe06c9c6 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -579,7 +579,8 @@ static const struct v4l2_file_operations hdpvr_fops = {
  * V4L2 ioctl handling
  */
 
-static int vidioc_querycap(struct file *file, void  *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -590,8 +591,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv,
-			v4l2_std_id std)
+static int vidioc_s_std(struct file *file,
+			struct video_device_state *state, v4l2_std_id std)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
 	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
@@ -610,8 +611,8 @@ static int vidioc_s_std(struct file *file, void *priv,
 	return hdpvr_config_call(dev, CTRL_VIDEO_STD_TYPE, std_type);
 }
 
-static int vidioc_g_std(struct file *file, void *priv,
-			v4l2_std_id *std)
+static int vidioc_g_std(struct file *file,
+			struct video_device_state *state, v4l2_std_id *std)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
 	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
@@ -623,7 +624,8 @@ static int vidioc_g_std(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *a)
+static int vidioc_querystd(struct file *file,
+			   struct video_device_state *state, v4l2_std_id *a)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
 	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
@@ -642,7 +644,8 @@ static int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *a)
 	return ret;
 }
 
-static int vidioc_s_dv_timings(struct file *file, void *priv,
+static int vidioc_s_dv_timings(struct file *file,
+			       struct video_device_state *state,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -665,7 +668,8 @@ static int vidioc_s_dv_timings(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_dv_timings(struct file *file, void *priv,
+static int vidioc_g_dv_timings(struct file *file,
+			       struct video_device_state *state,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -678,7 +682,8 @@ static int vidioc_g_dv_timings(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_query_dv_timings(struct file *file, void *priv,
+static int vidioc_query_dv_timings(struct file *file,
+				   struct video_device_state *state,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -720,7 +725,8 @@ static int vidioc_query_dv_timings(struct file *file, void *priv,
 	return ret;
 }
 
-static int vidioc_enum_dv_timings(struct file *file, void *priv,
+static int vidioc_enum_dv_timings(struct file *file,
+				  struct video_device_state *state,
 				    struct v4l2_enum_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -736,7 +742,8 @@ static int vidioc_enum_dv_timings(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_dv_timings_cap(struct file *file, void *priv,
+static int vidioc_dv_timings_cap(struct file *file,
+				 struct video_device_state *state,
 				    struct v4l2_dv_timings_cap *cap)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -763,7 +770,9 @@ static const char *iname[] = {
 	[HDPVR_COMPOSITE] = "Composite",
 };
 
-static int vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *i)
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_input *i)
 {
 	unsigned int n;
 
@@ -783,7 +792,8 @@ static int vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *i
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv,
+static int vidioc_s_input(struct file *file,
+			  struct video_device_state *state,
 			  unsigned int index)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -817,7 +827,8 @@ static int vidioc_s_input(struct file *file, void *priv,
 	return retval;
 }
 
-static int vidioc_g_input(struct file *file, void *priv,
+static int vidioc_g_input(struct file *file,
+			  struct video_device_state *state,
 			  unsigned int *index)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -833,7 +844,8 @@ static const char *audio_iname[] = {
 	[HDPVR_SPDIF]     = "SPDIF",
 };
 
-static int vidioc_enumaudio(struct file *file, void *priv,
+static int vidioc_enumaudio(struct file *file,
+			    struct video_device_state *state,
 				struct v4l2_audio *audio)
 {
 	unsigned int n;
@@ -849,7 +861,8 @@ static int vidioc_enumaudio(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_audio(struct file *file, void *priv,
+static int vidioc_s_audio(struct file *file,
+			  struct video_device_state *state,
 			  const struct v4l2_audio *audio)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -868,7 +881,8 @@ static int vidioc_s_audio(struct file *file, void *priv,
 	return retval;
 }
 
-static int vidioc_g_audio(struct file *file, void *priv,
+static int vidioc_g_audio(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_audio *audio)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -985,7 +999,8 @@ static int hdpvr_s_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				    struct v4l2_fmtdesc *f)
 {
 	if (f->index != 0)
@@ -996,7 +1011,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -1042,7 +1058,8 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_encoder_cmd(struct file *filp, void *priv,
+static int vidioc_encoder_cmd(struct file *filp,
+			      struct video_device_state *state,
 			       struct v4l2_encoder_cmd *a)
 {
 	struct hdpvr_device *dev = video_drvdata(filp);
@@ -1087,7 +1104,8 @@ static int vidioc_encoder_cmd(struct file *filp, void *priv,
 	return res;
 }
 
-static int vidioc_try_encoder_cmd(struct file *filp, void *priv,
+static int vidioc_try_encoder_cmd(struct file *filp,
+				  struct video_device_state *state,
 					struct v4l2_encoder_cmd *a)
 {
 	a->flags = 0;
diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 33099f39146afd6f59e0bd6b316d8f9e1eaa6a64..6cae78276da10be75145f3772784f5bbcc22be36 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -581,7 +581,8 @@ static void msi2500_disconnect(struct usb_interface *intf)
 	v4l2_device_put(&dev->v4l2_dev);
 }
 
-static int msi2500_querycap(struct file *file, void *fh,
+static int msi2500_querycap(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_capability *cap)
 {
 	struct msi2500_dev *dev = video_drvdata(file);
@@ -885,7 +886,8 @@ static const struct vb2_ops msi2500_vb2_ops = {
 	.stop_streaming         = msi2500_stop_streaming,
 };
 
-static int msi2500_enum_fmt_sdr_cap(struct file *file, void *priv,
+static int msi2500_enum_fmt_sdr_cap(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_fmtdesc *f)
 {
 	struct msi2500_dev *dev = video_drvdata(file);
@@ -900,7 +902,8 @@ static int msi2500_enum_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int msi2500_g_fmt_sdr_cap(struct file *file, void *priv,
+static int msi2500_g_fmt_sdr_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct msi2500_dev *dev = video_drvdata(file);
@@ -914,7 +917,8 @@ static int msi2500_g_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int msi2500_s_fmt_sdr_cap(struct file *file, void *priv,
+static int msi2500_s_fmt_sdr_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct msi2500_dev *dev = video_drvdata(file);
@@ -944,7 +948,8 @@ static int msi2500_s_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int msi2500_try_fmt_sdr_cap(struct file *file, void *priv,
+static int msi2500_try_fmt_sdr_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	struct msi2500_dev *dev = video_drvdata(file);
@@ -966,7 +971,8 @@ static int msi2500_try_fmt_sdr_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int msi2500_s_tuner(struct file *file, void *priv,
+static int msi2500_s_tuner(struct file *file,
+			   struct video_device_state *state,
 			   const struct v4l2_tuner *v)
 {
 	struct msi2500_dev *dev = video_drvdata(file);
@@ -984,7 +990,9 @@ static int msi2500_s_tuner(struct file *file, void *priv,
 	return ret;
 }
 
-static int msi2500_g_tuner(struct file *file, void *priv, struct v4l2_tuner *v)
+static int msi2500_g_tuner(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_tuner *v)
 {
 	struct msi2500_dev *dev = video_drvdata(file);
 	int ret;
@@ -1007,7 +1015,8 @@ static int msi2500_g_tuner(struct file *file, void *priv, struct v4l2_tuner *v)
 	return ret;
 }
 
-static int msi2500_g_frequency(struct file *file, void *priv,
+static int msi2500_g_frequency(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_frequency *f)
 {
 	struct msi2500_dev *dev = video_drvdata(file);
@@ -1028,7 +1037,8 @@ static int msi2500_g_frequency(struct file *file, void *priv,
 	return ret;
 }
 
-static int msi2500_s_frequency(struct file *file, void *priv,
+static int msi2500_s_frequency(struct file *file,
+			       struct video_device_state *state,
 			       const struct v4l2_frequency *f)
 {
 	struct msi2500_dev *dev = video_drvdata(file);
@@ -1052,7 +1062,8 @@ static int msi2500_s_frequency(struct file *file, void *priv,
 	return ret;
 }
 
-static int msi2500_enum_freq_bands(struct file *file, void *priv,
+static int msi2500_enum_freq_bands(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_frequency_band *band)
 {
 	struct msi2500_dev *dev = video_drvdata(file);
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index f9535a484738a9ef25795daa11a74ccb0b914be9..87933dec13cb10f35cfc0185c5523224ba020791 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -109,7 +109,8 @@ static struct v4l2_format pvr_format [] = {
 /*
  * This is part of Video 4 Linux API. These procedures handle ioctl() calls.
  */
-static int pvr2_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+static int pvr2_querycap(struct file *file, struct video_device_state *state,
+			 struct v4l2_capability *cap)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -124,7 +125,8 @@ static int pvr2_querycap(struct file *file, void *priv, struct v4l2_capability *
 	return 0;
 }
 
-static int pvr2_g_std(struct file *file, void *priv, v4l2_std_id *std)
+static int pvr2_g_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id *std)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -137,7 +139,8 @@ static int pvr2_g_std(struct file *file, void *priv, v4l2_std_id *std)
 	return ret;
 }
 
-static int pvr2_s_std(struct file *file, void *priv, v4l2_std_id std)
+static int pvr2_s_std(struct file *file, struct video_device_state *state,
+		      v4l2_std_id std)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -149,7 +152,8 @@ static int pvr2_s_std(struct file *file, void *priv, v4l2_std_id std)
 	return ret;
 }
 
-static int pvr2_querystd(struct file *file, void *priv, v4l2_std_id *std)
+static int pvr2_querystd(struct file *file, struct video_device_state *state,
+			 v4l2_std_id *std)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -162,7 +166,9 @@ static int pvr2_querystd(struct file *file, void *priv, v4l2_std_id *std)
 	return ret;
 }
 
-static int pvr2_enum_input(struct file *file, void *priv, struct v4l2_input *vi)
+static int pvr2_enum_input(struct file *file,
+			   struct video_device_state *state,
+			   struct v4l2_input *vi)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -210,7 +216,8 @@ static int pvr2_enum_input(struct file *file, void *priv, struct v4l2_input *vi)
 	return 0;
 }
 
-static int pvr2_g_input(struct file *file, void *priv, unsigned int *i)
+static int pvr2_g_input(struct file *file, struct video_device_state *state,
+			unsigned int *i)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -232,7 +239,8 @@ static int pvr2_g_input(struct file *file, void *priv, unsigned int *i)
 	return ret;
 }
 
-static int pvr2_s_input(struct file *file, void *priv, unsigned int inp)
+static int pvr2_s_input(struct file *file, struct video_device_state *state,
+			unsigned int inp)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -247,7 +255,8 @@ static int pvr2_s_input(struct file *file, void *priv, unsigned int inp)
 	return ret;
 }
 
-static int pvr2_enumaudio(struct file *file, void *priv, struct v4l2_audio *vin)
+static int pvr2_enumaudio(struct file *file, struct video_device_state *state,
+			  struct v4l2_audio *vin)
 {
 	/* pkt: FIXME: We are returning one "fake" input here
 	   which could very well be called "whatever_we_like".
@@ -271,7 +280,8 @@ static int pvr2_enumaudio(struct file *file, void *priv, struct v4l2_audio *vin)
 	return 0;
 }
 
-static int pvr2_g_audio(struct file *file, void *priv, struct v4l2_audio *vin)
+static int pvr2_g_audio(struct file *file, struct video_device_state *state,
+			struct v4l2_audio *vin)
 {
 	/* pkt: FIXME: see above comment (VIDIOC_ENUMAUDIO) */
 	vin->index = 0;
@@ -280,14 +290,16 @@ static int pvr2_g_audio(struct file *file, void *priv, struct v4l2_audio *vin)
 	return 0;
 }
 
-static int pvr2_s_audio(struct file *file, void *priv, const struct v4l2_audio *vout)
+static int pvr2_s_audio(struct file *file, struct video_device_state *state,
+			const struct v4l2_audio *vout)
 {
 	if (vout->index)
 		return -EINVAL;
 	return 0;
 }
 
-static int pvr2_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
+static int pvr2_g_tuner(struct file *file, struct video_device_state *state,
+			struct v4l2_tuner *vt)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -299,7 +311,8 @@ static int pvr2_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 	return pvr2_hdw_get_tuner_status(hdw, vt);
 }
 
-static int pvr2_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
+static int pvr2_s_tuner(struct file *file, struct video_device_state *state,
+			const struct v4l2_tuner *vt)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -315,7 +328,9 @@ static int pvr2_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *
 	return ret;
 }
 
-static int pvr2_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf)
+static int pvr2_s_frequency(struct file *file,
+			    struct video_device_state *state,
+			    const struct v4l2_frequency *vf)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -350,7 +365,9 @@ static int pvr2_s_frequency(struct file *file, void *priv, const struct v4l2_fre
 	return ret;
 }
 
-static int pvr2_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf)
+static int pvr2_g_frequency(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_frequency *vf)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -382,7 +399,9 @@ static int pvr2_g_frequency(struct file *file, void *priv, struct v4l2_frequency
 	return 0;
 }
 
-static int pvr2_enum_fmt_vid_cap(struct file *file, void *priv, struct v4l2_fmtdesc *fd)
+static int pvr2_enum_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_fmtdesc *fd)
 {
 	/* Only one format is supported: MPEG. */
 	if (fd->index)
@@ -392,7 +411,9 @@ static int pvr2_enum_fmt_vid_cap(struct file *file, void *priv, struct v4l2_fmtd
 	return 0;
 }
 
-static int pvr2_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *vf)
+static int pvr2_g_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *vf)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -412,7 +433,9 @@ static int pvr2_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format
 	return 0;
 }
 
-static int pvr2_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *vf)
+static int pvr2_try_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *vf)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -450,12 +473,14 @@ static int pvr2_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_forma
 	return 0;
 }
 
-static int pvr2_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *vf)
+static int pvr2_s_fmt_vid_cap(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_format *vf)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct pvr2_ctrl *hcp, *vcp;
-	int ret = pvr2_try_fmt_vid_cap(file, fh, vf);
+	int ret = pvr2_try_fmt_vid_cap(file, state, vf);
 
 	if (ret)
 		return ret;
@@ -467,7 +492,8 @@ static int pvr2_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format
 	return 0;
 }
 
-static int pvr2_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
+static int pvr2_streamon(struct file *file, struct video_device_state *state,
+			 enum v4l2_buf_type i)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -486,7 +512,8 @@ static int pvr2_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
 	return pvr2_hdw_set_streaming(hdw, !0);
 }
 
-static int pvr2_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
+static int pvr2_streamoff(struct file *file, struct video_device_state *state,
+			  enum v4l2_buf_type i)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -500,7 +527,8 @@ static int pvr2_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 	return pvr2_hdw_set_streaming(hdw, 0);
 }
 
-static int pvr2_query_ext_ctrl(struct file *file, void *priv,
+static int pvr2_query_ext_ctrl(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_query_ext_ctrl *vc)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
@@ -562,7 +590,8 @@ static int pvr2_query_ext_ctrl(struct file *file, void *priv,
 	return 0;
 }
 
-static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *vm)
+static int pvr2_querymenu(struct file *file, struct video_device_state *state,
+			  struct v4l2_querymenu *vm)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -577,7 +606,8 @@ static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *
 	return ret;
 }
 
-static int pvr2_g_ext_ctrls(struct file *file, void *priv,
+static int pvr2_g_ext_ctrls(struct file *file,
+			    struct video_device_state *state,
 					struct v4l2_ext_controls *ctls)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
@@ -612,7 +642,8 @@ static int pvr2_g_ext_ctrls(struct file *file, void *priv,
 	return 0;
 }
 
-static int pvr2_s_ext_ctrls(struct file *file, void *priv,
+static int pvr2_s_ext_ctrls(struct file *file,
+			    struct video_device_state *state,
 		struct v4l2_ext_controls *ctls)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
@@ -637,7 +668,8 @@ static int pvr2_s_ext_ctrls(struct file *file, void *priv,
 	return ret;
 }
 
-static int pvr2_try_ext_ctrls(struct file *file, void *priv,
+static int pvr2_try_ext_ctrls(struct file *file,
+			      struct video_device_state *state,
 		struct v4l2_ext_controls *ctls)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
@@ -659,8 +691,9 @@ static int pvr2_try_ext_ctrls(struct file *file, void *priv,
 	return 0;
 }
 
-static int pvr2_g_pixelaspect(struct file *file, void *priv,
-			      int type, struct v4l2_fract *f)
+static int pvr2_g_pixelaspect(struct file *file,
+			      struct video_device_state *state, int type,
+			      struct v4l2_fract *f)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -675,7 +708,8 @@ static int pvr2_g_pixelaspect(struct file *file, void *priv,
 	return ret;
 }
 
-static int pvr2_g_selection(struct file *file, void *priv,
+static int pvr2_g_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *sel)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
@@ -726,7 +760,8 @@ static int pvr2_g_selection(struct file *file, void *priv,
 	return ret;
 }
 
-static int pvr2_s_selection(struct file *file, void *priv,
+static int pvr2_s_selection(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_selection *sel)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
@@ -759,7 +794,8 @@ static int pvr2_s_selection(struct file *file, void *priv,
 	return ret;
 }
 
-static int pvr2_log_status(struct file *file, void *priv)
+static int pvr2_log_status(struct file *file,
+			   struct video_device_state *state)
 {
 	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
diff --git a/drivers/media/usb/pwc/pwc-v4l.c b/drivers/media/usb/pwc/pwc-v4l.c
index 71b719d363a5df71a65b34b103b968a5b3b8cb68..986552e8a11fe4e9fe0b6b316c7b34840be300b6 100644
--- a/drivers/media/usb/pwc/pwc-v4l.c
+++ b/drivers/media/usb/pwc/pwc-v4l.c
@@ -446,7 +446,9 @@ static int pwc_vidioc_try_fmt(struct pwc_device *pdev, struct v4l2_format *f)
 
 /* ioctl(VIDIOC_SET_FMT) */
 
-static int pwc_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int pwc_s_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_format *f)
 {
 	struct pwc_device *pdev = video_drvdata(file);
 	int ret, pixelformat, compression = 0;
@@ -476,7 +478,8 @@ static int pwc_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
 	return ret;
 }
 
-static int pwc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+static int pwc_querycap(struct file *file, struct video_device_state *state,
+			struct v4l2_capability *cap)
 {
 	struct pwc_device *pdev = video_drvdata(file);
 
@@ -486,7 +489,8 @@ static int pwc_querycap(struct file *file, void *fh, struct v4l2_capability *cap
 	return 0;
 }
 
-static int pwc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
+static int pwc_enum_input(struct file *file, struct video_device_state *state,
+			  struct v4l2_input *i)
 {
 	if (i->index)	/* Only one INPUT is supported */
 		return -EINVAL;
@@ -496,13 +500,15 @@ static int pwc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 	return 0;
 }
 
-static int pwc_g_input(struct file *file, void *fh, unsigned int *i)
+static int pwc_g_input(struct file *file, struct video_device_state *state,
+		       unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int pwc_s_input(struct file *file, void *fh, unsigned int i)
+static int pwc_s_input(struct file *file, struct video_device_state *state,
+		       unsigned int i)
 {
 	return i ? -EINVAL : 0;
 }
@@ -864,7 +870,9 @@ static int pwc_s_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
-static int pwc_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int pwc_enum_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_fmtdesc *f)
 {
 	struct pwc_device *pdev = video_drvdata(file);
 
@@ -883,7 +891,9 @@ static int pwc_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc
 	return 0;
 }
 
-static int pwc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int pwc_g_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_format *f)
 {
 	struct pwc_device *pdev = video_drvdata(file);
 
@@ -896,14 +906,17 @@ static int pwc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int pwc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
+static int pwc_try_fmt_vid_cap(struct file *file,
+			       struct video_device_state *state,
+			       struct v4l2_format *f)
 {
 	struct pwc_device *pdev = video_drvdata(file);
 
 	return pwc_vidioc_try_fmt(pdev, f);
 }
 
-static int pwc_enum_framesizes(struct file *file, void *fh,
+static int pwc_enum_framesizes(struct file *file,
+			       struct video_device_state *state,
 					 struct v4l2_frmsizeenum *fsize)
 {
 	struct pwc_device *pdev = video_drvdata(file);
@@ -928,8 +941,9 @@ static int pwc_enum_framesizes(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int pwc_enum_frameintervals(struct file *file, void *fh,
-					   struct v4l2_frmivalenum *fival)
+static int pwc_enum_frameintervals(struct file *file,
+				   struct video_device_state *state,
+				   struct v4l2_frmivalenum *fival)
 {
 	struct pwc_device *pdev = video_drvdata(file);
 	int size = -1;
@@ -958,7 +972,8 @@ static int pwc_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
-static int pwc_g_parm(struct file *file, void *fh,
+static int pwc_g_parm(struct file *file,
+		      struct video_device_state *state,
 		      struct v4l2_streamparm *parm)
 {
 	struct pwc_device *pdev = video_drvdata(file);
@@ -977,7 +992,8 @@ static int pwc_g_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int pwc_s_parm(struct file *file, void *fh,
+static int pwc_s_parm(struct file *file,
+		      struct video_device_state *state,
 		      struct v4l2_streamparm *parm)
 {
 	struct pwc_device *pdev = video_drvdata(file);
@@ -1003,7 +1019,7 @@ static int pwc_s_parm(struct file *file, void *fh,
 	ret = pwc_set_video_mode(pdev, pdev->width, pdev->height, pdev->pixfmt,
 				 fps, &compression, 0);
 
-	pwc_g_parm(file, fh, parm);
+	pwc_g_parm(file, state, parm);
 
 	return ret;
 }
diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 8332f2c5aed7067035ef6475e0b3d528e7fc804f..efc9526135a5212c6c3d104a4cae940922357acd 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -706,7 +706,8 @@ static const struct vb2_ops s2255_video_qops = {
 	.stop_streaming = stop_streaming,
 };
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct s2255_vc *vc = video_drvdata(file);
@@ -718,7 +719,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 			       struct v4l2_fmtdesc *f)
 {
 	int index = f->index;
@@ -732,7 +734,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 			    struct v4l2_format *f)
 {
 	struct s2255_vc *vc = video_drvdata(file);
@@ -752,8 +755,9 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
-			      struct v4l2_format *f)
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
+				  struct v4l2_format *f)
 {
 	const struct s2255_fmt *fmt;
 	enum v4l2_field field;
@@ -803,8 +807,9 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
-			    struct v4l2_format *f)
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_format *f)
 {
 	struct s2255_vc *vc = video_drvdata(file);
 	const struct s2255_fmt *fmt;
@@ -812,7 +817,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	struct s2255_mode mode;
 	int ret;
 
-	ret = vidioc_try_fmt_vid_cap(file, vc, f);
+	ret = vidioc_try_fmt_vid_cap(file, state, f);
 
 	if (ret < 0)
 		return ret;
@@ -1089,7 +1094,8 @@ static void stop_streaming(struct vb2_queue *vq)
 	spin_unlock_irqrestore(&vc->qlock, flags);
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id i)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id i)
 {
 	struct s2255_vc *vc = video_drvdata(file);
 	struct s2255_mode mode;
@@ -1130,7 +1136,8 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id i)
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *i)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *i)
 {
 	struct s2255_vc *vc = video_drvdata(file);
 
@@ -1145,7 +1152,8 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *i)
    For instance, you cannot do full FPS on more than 2 channels(2 videodevs)
    at once in color(you can do full fps on 4 channels with greyscale.
 */
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_input *inp)
 {
 	struct s2255_vc *vc = video_drvdata(file);
@@ -1179,12 +1187,15 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	if (i > 0)
 		return -EINVAL;
@@ -1230,7 +1241,8 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
-static int vidioc_g_jpegcomp(struct file *file, void *priv,
+static int vidioc_g_jpegcomp(struct file *file,
+			     struct video_device_state *state,
 			 struct v4l2_jpegcompression *jc)
 {
 	struct s2255_vc *vc = video_drvdata(file);
@@ -1241,7 +1253,8 @@ static int vidioc_g_jpegcomp(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_jpegcomp(struct file *file, void *priv,
+static int vidioc_s_jpegcomp(struct file *file,
+			     struct video_device_state *state,
 			 const struct v4l2_jpegcompression *jc)
 {
 	struct s2255_vc *vc = video_drvdata(file);
@@ -1253,7 +1266,8 @@ static int vidioc_s_jpegcomp(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_parm(struct file *file, void *priv,
+static int vidioc_g_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *sp)
 {
 	__u32 def_num, def_dem;
@@ -1290,7 +1304,8 @@ static int vidioc_g_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_parm(struct file *file, void *priv,
+static int vidioc_s_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *sp)
 {
 	struct s2255_vc *vc = video_drvdata(file);
@@ -1344,7 +1359,8 @@ static const struct v4l2_frmsize_discrete pal_sizes[] = {
 	{ 352, 288 },
 };
 
-static int vidioc_enum_framesizes(struct file *file, void *priv,
+static int vidioc_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 			    struct v4l2_frmsizeenum *fe)
 {
 	struct s2255_vc *vc = video_drvdata(file);
@@ -1362,7 +1378,8 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_frameintervals(struct file *file, void *priv,
+static int vidioc_enum_frameintervals(struct file *file,
+				      struct video_device_state *state,
 			    struct v4l2_frmivalenum *fe)
 {
 	struct s2255_vc *vc = video_drvdata(file);
diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index 715ce1dcb304129d76d73ba327858da4e89396a4..4a9efc72b47e11a7c99ba7b16ad6fafec0efd3e8 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -329,7 +329,7 @@ static const struct v4l2_file_operations stk1160_fops = {
  * vidioc ioctls
  */
 static int vidioc_querycap(struct file *file,
-		void *priv, struct v4l2_capability *cap)
+		struct video_device_state *state, struct v4l2_capability *cap)
 {
 	struct stk1160 *dev = video_drvdata(file);
 
@@ -339,8 +339,8 @@ static int vidioc_querycap(struct file *file,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
-		struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state, struct v4l2_fmtdesc *f)
 {
 	if (f->index != 0)
 		return -EINVAL;
@@ -349,7 +349,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct stk1160 *dev = video_drvdata(file);
@@ -468,7 +469,8 @@ static int stk1160_try_fmt(struct stk1160 *dev, struct v4l2_format *f,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct stk1160 *dev = video_drvdata(file);
@@ -476,7 +478,8 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return stk1160_try_fmt(dev, f, NULL);
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct stk1160 *dev = video_drvdata(file);
@@ -497,14 +500,17 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *norm)
+static int vidioc_querystd(struct file *file,
+			   struct video_device_state *state,
+			   v4l2_std_id *norm)
 {
 	struct stk1160 *dev = video_drvdata(file);
 	v4l2_device_call_all(&dev->v4l2_dev, 0, video, querystd, norm);
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *norm)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *norm)
 {
 	struct stk1160 *dev = video_drvdata(file);
 
@@ -512,7 +518,8 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *norm)
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
+static int vidioc_s_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id norm)
 {
 	struct stk1160 *dev = video_drvdata(file);
 	struct vb2_queue *q = &dev->vb_vidq;
@@ -544,7 +551,8 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
 }
 
 
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 				struct v4l2_input *i)
 {
 	struct stk1160 *dev = video_drvdata(file);
@@ -563,14 +571,16 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	struct stk1160 *dev = video_drvdata(file);
 	*i = dev->ctl_input;
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	struct stk1160 *dev = video_drvdata(file);
 
@@ -585,7 +595,8 @@ static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int vidioc_g_register(struct file *file, void *priv,
+static int vidioc_g_register(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_dbg_register *reg)
 {
 	struct stk1160 *dev = video_drvdata(file);
@@ -600,7 +611,8 @@ static int vidioc_g_register(struct file *file, void *priv,
 	return rc;
 }
 
-static int vidioc_s_register(struct file *file, void *priv,
+static int vidioc_s_register(struct file *file,
+			     struct video_device_state *state,
 			     const struct v4l2_dbg_register *reg)
 {
 	struct stk1160 *dev = video_drvdata(file);
diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index de0328100a60dd7b4335e208fee4cd2864d5b99d..da256a4cf2481662c9df5f105f8649ed658558d1 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -602,7 +602,8 @@ static int usbtv_start(struct usbtv *usbtv)
 	return ret;
 }
 
-static int usbtv_querycap(struct file *file, void *priv,
+static int usbtv_querycap(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	struct usbtv *dev = video_drvdata(file);
@@ -613,7 +614,8 @@ static int usbtv_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int usbtv_enum_input(struct file *file, void *priv,
+static int usbtv_enum_input(struct file *file,
+			    struct video_device_state *state,
 					struct v4l2_input *i)
 {
 	struct usbtv *dev = video_drvdata(file);
@@ -634,7 +636,8 @@ static int usbtv_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int usbtv_enum_fmt_vid_cap(struct file *file, void  *priv,
+static int usbtv_enum_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 					struct v4l2_fmtdesc *f)
 {
 	if (f->index > 0)
@@ -644,7 +647,8 @@ static int usbtv_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int usbtv_fmt_vid_cap(struct file *file, void *priv,
+static int usbtv_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct usbtv *usbtv = video_drvdata(file);
@@ -660,14 +664,16 @@ static int usbtv_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int usbtv_g_std(struct file *file, void *priv, v4l2_std_id *norm)
+static int usbtv_g_std(struct file *file, struct video_device_state *state,
+		       v4l2_std_id *norm)
 {
 	struct usbtv *usbtv = video_drvdata(file);
 	*norm = usbtv->norm;
 	return 0;
 }
 
-static int usbtv_s_std(struct file *file, void *priv, v4l2_std_id norm)
+static int usbtv_s_std(struct file *file, struct video_device_state *state,
+		       v4l2_std_id norm)
 {
 	int ret = -EINVAL;
 	struct usbtv *usbtv = video_drvdata(file);
@@ -678,14 +684,16 @@ static int usbtv_s_std(struct file *file, void *priv, v4l2_std_id norm)
 	return ret;
 }
 
-static int usbtv_g_input(struct file *file, void *priv, unsigned int *i)
+static int usbtv_g_input(struct file *file, struct video_device_state *state,
+			 unsigned int *i)
 {
 	struct usbtv *usbtv = video_drvdata(file);
 	*i = usbtv->input;
 	return 0;
 }
 
-static int usbtv_s_input(struct file *file, void *priv, unsigned int i)
+static int usbtv_s_input(struct file *file, struct video_device_state *state,
+			 unsigned int i)
 {
 	struct usbtv *usbtv = video_drvdata(file);
 
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index c23b174965c379a1abbc51d42acacade80ff7e10..5c4f61054e8013a13c9062cfa9fe84319b051980 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -23,7 +23,8 @@
  * V4L2 ioctls
  */
 
-static int uvc_meta_v4l2_querycap(struct file *file, void *priv,
+static int uvc_meta_v4l2_querycap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_capability *cap)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -39,7 +40,8 @@ static int uvc_meta_v4l2_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_meta_v4l2_get_format(struct file *file, void *priv,
+static int uvc_meta_v4l2_get_format(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -55,7 +57,8 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
+static int uvc_meta_v4l2_try_format(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -82,7 +85,8 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_meta_v4l2_set_format(struct file *file, void *priv,
+static int uvc_meta_v4l2_set_format(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *format)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
@@ -90,7 +94,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *priv,
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
 	int ret;
 
-	ret = uvc_meta_v4l2_try_format(file, priv, format);
+	ret = uvc_meta_v4l2_try_format(file, state, format);
 	if (ret < 0)
 		return ret;
 
@@ -107,7 +111,8 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_meta_v4l2_enum_formats(struct file *file, void *priv,
+static int uvc_meta_v4l2_enum_formats(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_fmtdesc *fdesc)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 9e4a251eca88085a1b4e0e854370015855be92ee..ce6b9403638e71676b15cb3e18c41b8aa4e9c15d 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -386,7 +386,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	return ret;
 }
 
-static int uvc_ioctl_g_fmt(struct file *file, void *priv,
+static int uvc_ioctl_g_fmt(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_format *fmt)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -416,7 +417,8 @@ static int uvc_ioctl_g_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_ioctl_s_fmt(struct file *file, void *priv,
+static int uvc_ioctl_s_fmt(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_format *fmt)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -443,7 +445,8 @@ static int uvc_ioctl_s_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_ioctl_g_parm(struct file *file, void *priv,
+static int uvc_ioctl_g_parm(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_streamparm *parm)
 {
 	u32 numerator, denominator;
@@ -477,7 +480,8 @@ static int uvc_ioctl_g_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_ioctl_s_parm(struct file *file, void *priv,
+static int uvc_ioctl_s_parm(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_streamparm *parm)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -599,7 +603,8 @@ static int uvc_v4l2_release(struct file *file)
 	return 0;
 }
 
-static int uvc_ioctl_querycap(struct file *file, void *priv,
+static int uvc_ioctl_querycap(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_capability *cap)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -615,7 +620,8 @@ static int uvc_ioctl_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_ioctl_enum_fmt(struct file *file, void *priv,
+static int uvc_ioctl_enum_fmt(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_fmtdesc *fmt)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -639,7 +645,8 @@ static int uvc_ioctl_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_ioctl_try_fmt(struct file *file, void *priv,
+static int uvc_ioctl_try_fmt(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *fmt)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -649,7 +656,8 @@ static int uvc_ioctl_try_fmt(struct file *file, void *priv,
 	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
 }
 
-static int uvc_ioctl_enum_input(struct file *file, void *priv,
+static int uvc_ioctl_enum_input(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_input *input)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -692,7 +700,9 @@ static int uvc_ioctl_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_ioctl_g_input(struct file *file, void *priv, unsigned int *input)
+static int uvc_ioctl_g_input(struct file *file,
+			     struct video_device_state *state,
+			     unsigned int *input)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
@@ -720,7 +730,9 @@ static int uvc_ioctl_g_input(struct file *file, void *priv, unsigned int *input)
 	return ret;
 }
 
-static int uvc_ioctl_s_input(struct file *file, void *priv, unsigned int input)
+static int uvc_ioctl_s_input(struct file *file,
+			     struct video_device_state *state,
+			     unsigned int input)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
@@ -754,7 +766,8 @@ static int uvc_ioctl_s_input(struct file *file, void *priv, unsigned int input)
 	return ret;
 }
 
-static int uvc_ioctl_query_ext_ctrl(struct file *file, void *priv,
+static int uvc_ioctl_query_ext_ctrl(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_query_ext_ctrl *qec)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -782,7 +795,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 	return ret;
 }
 
-static int uvc_ioctl_g_ext_ctrls(struct file *file, void *priv,
+static int uvc_ioctl_g_ext_ctrls(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_ext_controls *ctrls)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -866,7 +880,8 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 		return uvc_ctrl_rollback(handle);
 }
 
-static int uvc_ioctl_s_ext_ctrls(struct file *file, void *priv,
+static int uvc_ioctl_s_ext_ctrls(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_ext_controls *ctrls)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -874,7 +889,8 @@ static int uvc_ioctl_s_ext_ctrls(struct file *file, void *priv,
 	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_S_EXT_CTRLS);
 }
 
-static int uvc_ioctl_try_ext_ctrls(struct file *file, void *priv,
+static int uvc_ioctl_try_ext_ctrls(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_ext_controls *ctrls)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -882,7 +898,8 @@ static int uvc_ioctl_try_ext_ctrls(struct file *file, void *priv,
 	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_TRY_EXT_CTRLS);
 }
 
-static int uvc_ioctl_querymenu(struct file *file, void *priv,
+static int uvc_ioctl_querymenu(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_querymenu *qm)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -891,7 +908,8 @@ static int uvc_ioctl_querymenu(struct file *file, void *priv,
 	return uvc_query_v4l2_menu(chain, qm);
 }
 
-static int uvc_ioctl_g_selection(struct file *file, void *priv,
+static int uvc_ioctl_g_selection(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_selection *sel)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -923,7 +941,8 @@ static int uvc_ioctl_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_ioctl_enum_framesizes(struct file *file, void *priv,
+static int uvc_ioctl_enum_framesizes(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_frmsizeenum *fsize)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -963,7 +982,8 @@ static int uvc_ioctl_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int uvc_ioctl_enum_frameintervals(struct file *file, void *priv,
+static int uvc_ioctl_enum_frameintervals(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_frmivalenum *fival)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
@@ -1035,7 +1055,8 @@ static int uvc_ioctl_subscribe_event(struct v4l2_fh *fh,
 	}
 }
 
-static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
+static long uvc_ioctl_default(struct file *file,
+			      struct video_device_state *state, bool valid_prio,
 			      unsigned int cmd, void *arg)
 {
 	struct uvc_fh *handle = to_uvc_fh(file);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 0078a04c544590cc02988c7d041e66519432a8cf..9fe86526e38ffd131f2c5fb48bb61843a2543f8a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1250,7 +1250,7 @@ EXPORT_SYMBOL(v4l2_querymenu);
  * VIDIOC_LOG_STATUS helpers
  */
 
-int v4l2_ctrl_log_status(struct file *file, void *priv)
+int v4l2_ctrl_log_status(struct file *file, struct video_device_state *state)
 {
 	struct video_device *vfd = video_devdata(file);
 
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 2606077538be0e83032c6ae8956c1d67da0d0c5d..93bf8067eaf79b5b33363922434bd82591f19f83 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -208,9 +208,9 @@ struct v4l2_format *video_device_state_get_fmt(struct video_device_state *state)
 }
 EXPORT_SYMBOL_GPL(video_device_state_get_fmt);
 
-int video_device_g_fmt(struct file *file, void *priv, struct v4l2_format *fmt)
+int video_device_g_fmt(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *fmt)
 {
-	struct video_device_state *state = priv;
 	struct v4l2_format *vfmt = video_device_state_get_fmt(state);
 
 	if (!vfmt)
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 21acd9bc860718ccbe59925865d3a6dd9ec9484b..f6b310e70082a4d5d98fba1920a67b15152c5a1c 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1364,8 +1364,8 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_request_queue);
 
 /* Videobuf2 ioctl helpers */
 
-int v4l2_m2m_ioctl_reqbufs(struct file *file, void *priv,
-				struct v4l2_requestbuffers *rb)
+int v4l2_m2m_ioctl_reqbufs(struct file *file, struct video_device_state *state,
+			   struct v4l2_requestbuffers *rb)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
@@ -1373,8 +1373,9 @@ int v4l2_m2m_ioctl_reqbufs(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_reqbufs);
 
-int v4l2_m2m_ioctl_create_bufs(struct file *file, void *priv,
-				struct v4l2_create_buffers *create)
+int v4l2_m2m_ioctl_create_bufs(struct file *file,
+			       struct video_device_state *state,
+			       struct v4l2_create_buffers *create)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
@@ -1382,7 +1383,8 @@ int v4l2_m2m_ioctl_create_bufs(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_create_bufs);
 
-int v4l2_m2m_ioctl_remove_bufs(struct file *file, void *priv,
+int v4l2_m2m_ioctl_remove_bufs(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_remove_buffers *remove)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
@@ -1397,8 +1399,8 @@ int v4l2_m2m_ioctl_remove_bufs(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_remove_bufs);
 
-int v4l2_m2m_ioctl_querybuf(struct file *file, void *priv,
-				struct v4l2_buffer *buf)
+int v4l2_m2m_ioctl_querybuf(struct file *file, struct video_device_state *state,
+			    struct v4l2_buffer *buf)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
@@ -1406,8 +1408,8 @@ int v4l2_m2m_ioctl_querybuf(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_querybuf);
 
-int v4l2_m2m_ioctl_qbuf(struct file *file, void *priv,
-				struct v4l2_buffer *buf)
+int v4l2_m2m_ioctl_qbuf(struct file *file, struct video_device_state *state,
+			struct v4l2_buffer *buf)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
@@ -1415,8 +1417,8 @@ int v4l2_m2m_ioctl_qbuf(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_qbuf);
 
-int v4l2_m2m_ioctl_dqbuf(struct file *file, void *priv,
-				struct v4l2_buffer *buf)
+int v4l2_m2m_ioctl_dqbuf(struct file *file, struct video_device_state *state,
+			 struct v4l2_buffer *buf)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
@@ -1424,7 +1426,8 @@ int v4l2_m2m_ioctl_dqbuf(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_dqbuf);
 
-int v4l2_m2m_ioctl_prepare_buf(struct file *file, void *priv,
+int v4l2_m2m_ioctl_prepare_buf(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_buffer *buf)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
@@ -1433,7 +1436,8 @@ int v4l2_m2m_ioctl_prepare_buf(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_prepare_buf);
 
-int v4l2_m2m_ioctl_expbuf(struct file *file, void *priv,
+int v4l2_m2m_ioctl_expbuf(struct file *file,
+			  struct video_device_state *state,
 				struct v4l2_exportbuffer *eb)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
@@ -1442,7 +1446,8 @@ int v4l2_m2m_ioctl_expbuf(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_expbuf);
 
-int v4l2_m2m_ioctl_streamon(struct file *file, void *priv,
+int v4l2_m2m_ioctl_streamon(struct file *file,
+			    struct video_device_state *state,
 				enum v4l2_buf_type type)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
@@ -1451,7 +1456,8 @@ int v4l2_m2m_ioctl_streamon(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_streamon);
 
-int v4l2_m2m_ioctl_streamoff(struct file *file, void *priv,
+int v4l2_m2m_ioctl_streamoff(struct file *file,
+			     struct video_device_state *state,
 				enum v4l2_buf_type type)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
@@ -1460,7 +1466,8 @@ int v4l2_m2m_ioctl_streamoff(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_streamoff);
 
-int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_encoder_cmd *ec)
 {
 	if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
@@ -1471,7 +1478,8 @@ int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_encoder_cmd);
 
-int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_decoder_cmd *dc)
 {
 	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
@@ -1535,7 +1543,8 @@ int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_decoder_cmd);
 
-int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_encoder_cmd(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_encoder_cmd *ec)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
@@ -1544,7 +1553,8 @@ int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_encoder_cmd);
 
-int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_decoder_cmd *dc)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
@@ -1553,7 +1563,8 @@ int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_decoder_cmd);
 
-int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file,
+					     struct video_device_state *state,
 					     struct v4l2_decoder_cmd *dc)
 {
 	if (dc->cmd != V4L2_DEC_CMD_FLUSH)
@@ -1565,7 +1576,8 @@ int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_try_decoder_cmd);
 
-int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_decoder_cmd *dc)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
@@ -1574,7 +1586,7 @@ int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
 	unsigned long flags;
 	int ret;
 
-	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, dc);
+	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, state, dc);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f2213b08f0329326e70d704e609bbffb321..d46589788fe20f3e17bbdaca3f28649346e34bce 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -360,7 +360,8 @@ int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool settings_change)
  * v4l2 ioctls
  * return ISP capabilities
  */
-static int atomisp_querycap(struct file *file, void *fh,
+static int atomisp_querycap(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_capability *cap)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -376,7 +377,8 @@ static int atomisp_querycap(struct file *file, void *fh,
 /*
  * enum input are used to check primary/secondary camera
  */
-static int atomisp_enum_input(struct file *file, void *fh,
+static int atomisp_enum_input(struct file *file,
+			      struct video_device_state *state,
 			      struct v4l2_input *input)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -403,7 +405,9 @@ static int atomisp_enum_input(struct file *file, void *fh,
 /*
  * get input are used to get current primary/secondary camera
  */
-static int atomisp_g_input(struct file *file, void *fh, unsigned int *input)
+static int atomisp_g_input(struct file *file,
+			   struct video_device_state *state,
+			   unsigned int *input)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
@@ -412,7 +416,8 @@ static int atomisp_g_input(struct file *file, void *fh, unsigned int *input)
 	return 0;
 }
 
-static int atomisp_s_fmt_cap(struct file *file, void *fh,
+static int atomisp_s_fmt_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -423,7 +428,9 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 /*
  * set input are used to set current primary/secondary camera
  */
-static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
+static int atomisp_s_input(struct file *file,
+			   struct video_device_state *state,
+			   unsigned int input)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
@@ -524,7 +531,8 @@ static int atomisp_enum_framesizes_crop(struct atomisp_device *isp,
 	return atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &native, &valid_sizes);
 }
 
-static int atomisp_enum_framesizes(struct file *file, void *priv,
+static int atomisp_enum_framesizes(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_frmsizeenum *fsize)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -560,7 +568,8 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int atomisp_enum_frameintervals(struct file *file, void *priv,
+static int atomisp_enum_frameintervals(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_frmivalenum *fival)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -594,7 +603,8 @@ static int atomisp_enum_frameintervals(struct file *file, void *priv,
 	return ret;
 }
 
-static int atomisp_enum_fmt_cap(struct file *file, void *fh,
+static int atomisp_enum_fmt_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_fmtdesc *f)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -648,7 +658,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 }
 
 /* This function looks up the closest available resolution. */
-static int atomisp_try_fmt_cap(struct file *file, void *fh,
+static int atomisp_try_fmt_cap(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -657,7 +668,8 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 	return atomisp_try_fmt(isp, &f->fmt.pix, NULL, NULL);
 }
 
-static int atomisp_g_fmt_cap(struct file *file, void *fh,
+static int atomisp_g_fmt_cap(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -675,7 +687,7 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	f->fmt.pix.width = 10000;
 	f->fmt.pix.height = 10000;
 
-	return atomisp_try_fmt_cap(file, fh, f);
+	return atomisp_try_fmt_cap(file, state, f);
 }
 
 int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
@@ -787,7 +799,9 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
  * Once this is fixed these wrappers can be removed, replacing them with direct
  * calls to vb2_ioctl_[d]qbuf().
  */
-static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer *buf)
+static int atomisp_qbuf_wrapper(struct file *file,
+				struct video_device_state *state,
+				struct v4l2_buffer *buf)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
@@ -807,10 +821,12 @@ static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 		pipe->frame_request_config_id[buf->index] = 0;
 	}
 
-	return vb2_ioctl_qbuf(file, fh, buf);
+	return vb2_ioctl_qbuf(file, state, buf);
 }
 
-static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer *buf)
+static int atomisp_dqbuf_wrapper(struct file *file,
+				 struct video_device_state *state,
+				 struct v4l2_buffer *buf)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
@@ -819,7 +835,7 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	struct vb2_buffer *vb;
 	int ret;
 
-	ret = vb2_ioctl_dqbuf(file, fh, buf);
+	ret = vb2_ioctl_dqbuf(file, state, buf);
 	if (ret)
 		return ret;
 
@@ -1135,7 +1151,8 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
  * this ioctl with a pointer to this structure. The driver fills
  * the rest of the structure.
  */
-static int atomisp_query_ext_ctrl(struct file *file, void *fh,
+static int atomisp_query_ext_ctrl(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_query_ext_ctrl *qc)
 {
 	int i;
@@ -1191,7 +1208,8 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 }
 
 /* This ioctl allows the application to get multiple controls by class */
-static int atomisp_g_ext_ctrls(struct file *file, void *fh,
+static int atomisp_g_ext_ctrls(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_ext_controls *c)
 {
 	struct v4l2_control ctrl;
@@ -1201,14 +1219,14 @@ static int atomisp_g_ext_ctrls(struct file *file, void *fh,
 	 * input_lock is not need for the Camera related IOCTLs
 	 * The input_lock downgrade the FPS of 3A
 	 */
-	ret = atomisp_camera_g_ext_ctrls(file, fh, c);
+	ret = atomisp_camera_g_ext_ctrls(file, state, c);
 	if (ret != -EINVAL)
 		return ret;
 
 	for (i = 0; i < c->count; i++) {
 		ctrl.id = c->controls[i].id;
 		ctrl.value = c->controls[i].value;
-		ret = atomisp_g_ctrl(file, fh, &ctrl);
+		ret = atomisp_g_ctrl(file, state, &ctrl);
 		c->controls[i].value = ctrl.value;
 		if (ret) {
 			c->error_idx = i;
@@ -1254,7 +1272,8 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 }
 
 /* This ioctl allows the application to set multiple controls by class */
-static int atomisp_s_ext_ctrls(struct file *file, void *fh,
+static int atomisp_s_ext_ctrls(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_ext_controls *c)
 {
 	struct v4l2_control ctrl;
@@ -1264,14 +1283,14 @@ static int atomisp_s_ext_ctrls(struct file *file, void *fh,
 	 * input_lock is not need for the Camera related IOCTLs
 	 * The input_lock downgrade the FPS of 3A
 	 */
-	ret = atomisp_camera_s_ext_ctrls(file, fh, c);
+	ret = atomisp_camera_s_ext_ctrls(file, state, c);
 	if (ret != -EINVAL)
 		return ret;
 
 	for (i = 0; i < c->count; i++) {
 		ctrl.id = c->controls[i].id;
 		ctrl.value = c->controls[i].value;
-		ret = atomisp_s_ctrl(file, fh, &ctrl);
+		ret = atomisp_s_ctrl(file, state, &ctrl);
 		c->controls[i].value = ctrl.value;
 		if (ret) {
 			c->error_idx = i;
@@ -1284,7 +1303,8 @@ static int atomisp_s_ext_ctrls(struct file *file, void *fh,
 /*
  * vidioc_g/s_param are used to switch isp running mode
  */
-static int atomisp_g_parm(struct file *file, void *fh,
+static int atomisp_g_parm(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_streamparm *parm)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -1301,7 +1321,8 @@ static int atomisp_g_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int atomisp_s_parm(struct file *file, void *fh,
+static int atomisp_s_parm(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_streamparm *parm)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -1354,7 +1375,8 @@ static int atomisp_s_parm(struct file *file, void *fh,
 	return rval == -ENOIOCTLCMD ? 0 : rval;
 }
 
-static long atomisp_vidioc_default(struct file *file, void *fh,
+static long atomisp_vidioc_default(struct file *file,
+				   struct video_device_state *state,
 				   bool valid_prio, unsigned int cmd, void *arg)
 {
 	struct video_device *vdev = video_devdata(file);
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
index 04e659243f02bc588b8140d55a3de44e664ff286..1738925d13594c68ad14f70cb95853fd5b91e07a 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -290,7 +290,8 @@ static int av7110_dvb_c_switch(struct saa7146_dev *dev)
 	return 0;
 }
 
-static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
+static int vidioc_g_tuner(struct file *file, struct video_device_state *state,
+			  struct v4l2_tuner *t)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
@@ -336,7 +337,8 @@ static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
 	return 0;
 }
 
-static int vidioc_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *t)
+static int vidioc_s_tuner(struct file *file, struct video_device_state *state,
+			  const struct v4l2_tuner *t)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
@@ -381,7 +383,9 @@ static int vidioc_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *
 	return 0;
 }
 
-static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency *f)
+static int vidioc_g_frequency(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_frequency *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
@@ -397,7 +401,9 @@ static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency
 	return 0;
 }
 
-static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *f)
+static int vidioc_s_frequency(struct file *file,
+			      struct video_device_state *state,
+			      const struct v4l2_frequency *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
@@ -427,7 +433,9 @@ static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_fre
 	return 0;
 }
 
-static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_input *i)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
@@ -447,7 +455,8 @@ static int vidioc_enum_input(struct file *file, void *fh, struct v4l2_input *i)
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *input)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
@@ -457,7 +466,8 @@ static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int input)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
@@ -474,7 +484,9 @@ static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 	return av7110_dvb_c_switch(dev);
 }
 
-static int vidioc_enum_output(struct file *file, void *fh, struct v4l2_output *o)
+static int vidioc_enum_output(struct file *file,
+			      struct video_device_state *state,
+			      struct v4l2_output *o)
 {
 	if (o->index)
 		return -EINVAL;
@@ -485,18 +497,24 @@ static int vidioc_enum_output(struct file *file, void *fh, struct v4l2_output *o
 	return 0;
 }
 
-static int vidioc_g_output(struct file *file, void *fh, unsigned int *output)
+static int vidioc_g_output(struct file *file,
+			   struct video_device_state *state,
+			   unsigned int *output)
 {
 	*output = 0;
 	return 0;
 }
 
-static int vidioc_s_output(struct file *file, void *fh, unsigned int output)
+static int vidioc_s_output(struct file *file,
+			   struct video_device_state *state,
+			   unsigned int output)
 {
 	return output ? -EINVAL : 0;
 }
 
-static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
+static int vidioc_enumaudio(struct file *file,
+			    struct video_device_state *state,
+			    struct v4l2_audio *a)
 {
 	dprintk(2, "VIDIOC_G_AUDIO: %d\n", a->index);
 	if (a->index != 0)
@@ -505,7 +523,8 @@ static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
 	return 0;
 }
 
-static int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *a)
+static int vidioc_g_audio(struct file *file, struct video_device_state *state,
+			  struct v4l2_audio *a)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
@@ -519,7 +538,8 @@ static int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *a)
 	return 0;
 }
 
-static int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *a)
+static int vidioc_s_audio(struct file *file, struct video_device_state *state,
+			  const struct v4l2_audio *a)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
@@ -530,7 +550,8 @@ static int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *
 	return a->index ? -EINVAL : 0;
 }
 
-static int vidioc_g_sliced_vbi_cap(struct file *file, void *fh,
+static int vidioc_g_sliced_vbi_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_sliced_vbi_cap *cap)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
@@ -546,7 +567,8 @@ static int vidioc_g_sliced_vbi_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh,
+static int vidioc_g_fmt_sliced_vbi_out(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
@@ -564,7 +586,8 @@ static int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *fh,
+static int vidioc_try_fmt_sliced_vbi_out(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
@@ -585,14 +608,15 @@ static int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
+static int vidioc_s_fmt_sliced_vbi_out(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
 	dprintk(2, "VIDIOC_S_FMT\n");
-	if (vidioc_try_fmt_sliced_vbi_out(file, fh, f))
+	if (vidioc_try_fmt_sliced_vbi_out(file, state, f))
 		return -EINVAL;
 	if (f->fmt.sliced.service_set & V4L2_SLICED_WSS_625) {
 		/* WSS controlled by userspace */
diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
index fb9ee8547392b4ee768b39ce08f52488323bb6f9..5f7572cb8e0e2585c95df6f7eaf88f35da32153e 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
@@ -483,7 +483,8 @@ static const struct vb2_ops isc_vb2_ops = {
 	.buf_queue		= isc_buffer_queue,
 };
 
-static int isc_querycap(struct file *file, void *priv,
+static int isc_querycap(struct file *file,
+			struct video_device_state *state,
 			 struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "microchip-isc", sizeof(cap->driver));
@@ -492,7 +493,8 @@ static int isc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int isc_enum_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				 struct v4l2_fmtdesc *f)
 {
 	struct isc_device *isc = video_drvdata(file);
@@ -522,7 +524,8 @@ static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int isc_g_fmt_vid_cap(struct file *file, void *priv,
+static int isc_g_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			      struct v4l2_format *fmt)
 {
 	struct isc_device *isc = video_drvdata(file);
@@ -1030,7 +1033,8 @@ static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
 	return 0;
 }
 
-static int isc_s_fmt_vid_cap(struct file *file, void *priv,
+static int isc_s_fmt_vid_cap(struct file *file,
+			     struct video_device_state *state,
 			      struct v4l2_format *f)
 {
 	struct isc_device *isc = video_drvdata(file);
@@ -1041,7 +1045,8 @@ static int isc_s_fmt_vid_cap(struct file *file, void *priv,
 	return isc_set_fmt(isc, f);
 }
 
-static int isc_try_fmt_vid_cap(struct file *file, void *priv,
+static int isc_try_fmt_vid_cap(struct file *file,
+			       struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct isc_device *isc = video_drvdata(file);
@@ -1049,7 +1054,8 @@ static int isc_try_fmt_vid_cap(struct file *file, void *priv,
 	return isc_try_fmt(isc, f, NULL);
 }
 
-static int isc_enum_input(struct file *file, void *priv,
+static int isc_enum_input(struct file *file,
+			  struct video_device_state *state,
 			   struct v4l2_input *inp)
 {
 	if (inp->index != 0)
@@ -1062,14 +1068,16 @@ static int isc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int isc_g_input(struct file *file, void *priv, unsigned int *i)
+static int isc_g_input(struct file *file, struct video_device_state *state,
+		       unsigned int *i)
 {
 	*i = 0;
 
 	return 0;
 }
 
-static int isc_s_input(struct file *file, void *priv, unsigned int i)
+static int isc_s_input(struct file *file, struct video_device_state *state,
+		       unsigned int i)
 {
 	if (i > 0)
 		return -EINVAL;
@@ -1077,21 +1085,24 @@ static int isc_s_input(struct file *file, void *priv, unsigned int i)
 	return 0;
 }
 
-static int isc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int isc_g_parm(struct file *file, struct video_device_state *state,
+		      struct v4l2_streamparm *a)
 {
 	struct isc_device *isc = video_drvdata(file);
 
 	return v4l2_g_parm_cap(video_devdata(file), isc->current_subdev->sd, a);
 }
 
-static int isc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int isc_s_parm(struct file *file, struct video_device_state *state,
+		      struct v4l2_streamparm *a)
 {
 	struct isc_device *isc = video_drvdata(file);
 
 	return v4l2_s_parm_cap(video_devdata(file), isc->current_subdev->sd, a);
 }
 
-static int isc_enum_framesizes(struct file *file, void *fh,
+static int isc_enum_framesizes(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_frmsizeenum *fsize)
 {
 	struct isc_device *isc = video_drvdata(file);
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index e9cef7af000a91674aa2cfe750a399cae40ff9d6..fce78147e5415c125e8fa3cb71773e32683a3ca8 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -78,7 +78,8 @@ static const struct imx_media_pixfmt *capture_find_format(u32 code, u32 fourcc)
 	return imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
 }
 
-static int capture_querycap(struct file *file, void *fh,
+static int capture_querycap(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_capability *cap)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -91,14 +92,16 @@ static int capture_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
+static int capture_enum_fmt_vid_cap(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_fmtdesc *f)
 {
 	return imx_media_enum_pixel_formats(&f->pixelformat, f->index,
 					    PIXFMT_SEL_ANY, f->mbus_code);
 }
 
-static int capture_enum_framesizes(struct file *file, void *fh,
+static int capture_enum_framesizes(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_frmsizeenum *fsize)
 {
 	const struct imx_media_pixfmt *cc;
@@ -126,7 +129,8 @@ static int capture_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_g_fmt_vid_cap(struct file *file, void *fh,
+static int capture_g_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -179,14 +183,16 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compose)
 	return cc;
 }
 
-static int capture_try_fmt_vid_cap(struct file *file, void *fh,
+static int capture_try_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *f)
 {
 	__capture_try_fmt(&f->fmt.pix, NULL);
 	return 0;
 }
 
-static int capture_s_fmt_vid_cap(struct file *file, void *fh,
+static int capture_s_fmt_vid_cap(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_format *f)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -205,7 +211,8 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_g_selection(struct file *file, void *fh,
+static int capture_g_selection(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_selection *s)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -276,7 +283,8 @@ static const struct v4l2_ioctl_ops capture_ioctl_ops = {
  * Legacy Video IOCTLs
  */
 
-static int capture_legacy_enum_framesizes(struct file *file, void *fh,
+static int capture_legacy_enum_framesizes(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_frmsizeenum *fsize)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -316,7 +324,8 @@ static int capture_legacy_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_legacy_enum_frameintervals(struct file *file, void *fh,
+static int capture_legacy_enum_frameintervals(struct file *file,
+					      struct video_device_state *state,
 					      struct v4l2_frmivalenum *fival)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -347,7 +356,8 @@ static int capture_legacy_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_legacy_enum_fmt_vid_cap(struct file *file, void *fh,
+static int capture_legacy_enum_fmt_vid_cap(struct file *file,
+					   struct video_device_state *state,
 					   struct v4l2_fmtdesc *f)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -422,7 +432,8 @@ __capture_legacy_try_fmt(struct capture_priv *priv,
 	return cc;
 }
 
-static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
+static int capture_legacy_try_fmt_vid_cap(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_format *f)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -442,7 +453,8 @@ static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
+static int capture_legacy_s_fmt_vid_cap(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_format *f)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -474,7 +486,8 @@ static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_legacy_querystd(struct file *file, void *fh,
+static int capture_legacy_querystd(struct file *file,
+				   struct video_device_state *state,
 				   v4l2_std_id *std)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -482,14 +495,18 @@ static int capture_legacy_querystd(struct file *file, void *fh,
 	return v4l2_subdev_call(priv->src_sd, video, querystd, std);
 }
 
-static int capture_legacy_g_std(struct file *file, void *fh, v4l2_std_id *std)
+static int capture_legacy_g_std(struct file *file,
+				struct video_device_state *state,
+				v4l2_std_id *std)
 {
 	struct capture_priv *priv = video_drvdata(file);
 
 	return v4l2_subdev_call(priv->src_sd, video, g_std, std);
 }
 
-static int capture_legacy_s_std(struct file *file, void *fh, v4l2_std_id std)
+static int capture_legacy_s_std(struct file *file,
+				struct video_device_state *state,
+				v4l2_std_id std)
 {
 	struct capture_priv *priv = video_drvdata(file);
 
@@ -499,7 +516,8 @@ static int capture_legacy_s_std(struct file *file, void *fh, v4l2_std_id std)
 	return v4l2_subdev_call(priv->src_sd, video, s_std, std);
 }
 
-static int capture_legacy_g_parm(struct file *file, void *fh,
+static int capture_legacy_g_parm(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_streamparm *a)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -522,7 +540,8 @@ static int capture_legacy_g_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_legacy_s_parm(struct file *file, void *fh,
+static int capture_legacy_s_parm(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_streamparm *a)
 {
 	struct capture_priv *priv = video_drvdata(file);
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 1869c5792ecb46682491ecbf33674c6044915261..38b7bae1ab23c6ab1e899ded8ff3f304a84421a1 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -152,7 +152,8 @@ static void device_run(void *_ctx)
 /*
  * Video ioctls
  */
-static int ipu_csc_scaler_querycap(struct file *file, void *priv,
+static int ipu_csc_scaler_querycap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, IMX_CSC_SCALER_NAME, sizeof(cap->driver));
@@ -163,7 +164,8 @@ static int ipu_csc_scaler_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
+static int ipu_csc_scaler_enum_fmt(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	u32 fourcc;
@@ -179,7 +181,8 @@ static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
 	return 0;
 }
 
-static int ipu_csc_scaler_g_fmt(struct file *file, void *priv,
+static int ipu_csc_scaler_g_fmt(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
@@ -192,7 +195,8 @@ static int ipu_csc_scaler_g_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int ipu_csc_scaler_try_fmt(struct file *file, void *priv,
+static int ipu_csc_scaler_try_fmt(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
@@ -240,7 +244,8 @@ static int ipu_csc_scaler_try_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int ipu_csc_scaler_s_fmt(struct file *file, void *priv,
+static int ipu_csc_scaler_s_fmt(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
@@ -257,7 +262,7 @@ static int ipu_csc_scaler_s_fmt(struct file *file, void *priv,
 
 	q_data = get_q_data(ctx, f->type);
 
-	ret = ipu_csc_scaler_try_fmt(file, priv, f);
+	ret = ipu_csc_scaler_try_fmt(file, state, f);
 	if (ret < 0)
 		return ret;
 
@@ -296,7 +301,8 @@ static int ipu_csc_scaler_s_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int ipu_csc_scaler_g_selection(struct file *file, void *priv,
+static int ipu_csc_scaler_g_selection(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_selection *s)
 {
 	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
@@ -334,7 +340,8 @@ static int ipu_csc_scaler_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int ipu_csc_scaler_s_selection(struct file *file, void *priv,
+static int ipu_csc_scaler_s_selection(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_selection *s)
 {
 	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 2f6041d342f4296446db294ae054c6085d3e8500..e10bf683320c19e8e6a2ab30ab88536348c116bc 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -621,7 +621,8 @@ static const struct imgu_fmt *find_format(struct v4l2_format *f, u32 type)
 				     &formats[DEF_VID_OUTPUT];
 }
 
-static int imgu_vidioc_querycap(struct file *file, void *fh,
+static int imgu_vidioc_querycap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_capability *cap)
 {
 	struct imgu_device *imgu = video_drvdata(file);
@@ -657,7 +658,8 @@ static int enum_fmts(struct v4l2_fmtdesc *f, u32 type)
 	return -EINVAL;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
@@ -666,7 +668,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	return enum_fmts(f, VID_CAPTURE);
 }
 
-static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -676,7 +679,8 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 }
 
 /* Propagate forward always the format from the CIO2 subdev */
-static int imgu_vidioc_g_fmt(struct file *file, void *fh,
+static int imgu_vidioc_g_fmt(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_format *f)
 {
 	struct imgu_video_device *node = file_to_intel_imgu_node(file);
@@ -815,7 +819,8 @@ static int imgu_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int imgu_vidioc_try_fmt(struct file *file, void *fh,
+static int imgu_vidioc_try_fmt(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_format *f)
 {
 	struct imgu_device *imgu = video_drvdata(file);
@@ -827,14 +832,16 @@ static int imgu_vidioc_try_fmt(struct file *file, void *fh,
 	dev_dbg(dev, "%s [%ux%u] for node %u\n", __func__,
 		pix_mp->width, pix_mp->height, node->id);
 
-	r = imgu_try_fmt(file, fh, f);
+	r = imgu_try_fmt(file, state, f);
 	if (r)
 		return r;
 
 	return imgu_fmt(imgu, node->pipe, node->id, f, true);
 }
 
-static int imgu_vidioc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int imgu_vidioc_s_fmt(struct file *file,
+			     struct video_device_state *state,
+			     struct v4l2_format *f)
 {
 	struct imgu_device *imgu = video_drvdata(file);
 	struct device *dev = &imgu->pci_dev->dev;
@@ -845,7 +852,7 @@ static int imgu_vidioc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	dev_dbg(dev, "%s [%ux%u] for node %u\n", __func__,
 		pix_mp->width, pix_mp->height, node->id);
 
-	r = imgu_try_fmt(file, fh, f);
+	r = imgu_try_fmt(file, state, f);
 	if (r)
 		return r;
 
@@ -863,7 +870,8 @@ static const struct imgu_meta_fmt meta_fmts[] = {
 	{ V4L2_META_FMT_IPU3_STAT_3A, "IPU3 3A statistics" },
 };
 
-static int imgu_meta_enum_format(struct file *file, void *fh,
+static int imgu_meta_enum_format(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_fmtdesc *fmt)
 {
 	struct imgu_video_device *node = file_to_intel_imgu_node(file);
@@ -882,7 +890,8 @@ static int imgu_meta_enum_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int imgu_vidioc_g_meta_fmt(struct file *file, void *fh,
+static int imgu_vidioc_g_meta_fmt(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct imgu_video_device *node = file_to_intel_imgu_node(file);
diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 1a7c8a91fffb38d1a9b20f896a332a88d8060095..6e46df7a07b0143826c41d21dd3920088e70b3c6 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -107,7 +107,8 @@ const struct ipu7_isys_pixelformat *ipu7_isys_get_isys_format(u32 pixelformat)
 	return &ipu7_isys_pfmts[0];
 }
 
-static int ipu7_isys_vidioc_querycap(struct file *file, void *fh,
+static int ipu7_isys_vidioc_querycap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_capability *cap)
 {
 	struct ipu7_isys_video *av = video_drvdata(file);
@@ -118,7 +119,8 @@ static int ipu7_isys_vidioc_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int ipu7_isys_vidioc_enum_fmt(struct file *file, void *fh,
+static int ipu7_isys_vidioc_enum_fmt(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_fmtdesc *f)
 {
 	unsigned int i, num_found;
@@ -144,7 +146,8 @@ static int ipu7_isys_vidioc_enum_fmt(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int ipu7_isys_vidioc_enum_framesizes(struct file *file, void *fh,
+static int ipu7_isys_vidioc_enum_framesizes(struct file *file,
+					    struct video_device_state *state,
 					    struct v4l2_frmsizeenum *fsize)
 {
 	unsigned int i;
@@ -170,7 +173,8 @@ static int ipu7_isys_vidioc_enum_framesizes(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int ipu7_isys_vidioc_g_fmt_vid_cap(struct file *file, void *fh,
+static int ipu7_isys_vidioc_g_fmt_vid_cap(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_format *f)
 {
 	struct ipu7_isys_video *av = video_drvdata(file);
@@ -226,7 +230,8 @@ static void __ipu_isys_vidioc_try_fmt_vid_cap(struct ipu7_isys_video *av,
 	f->fmt.pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int ipu7_isys_vidioc_try_fmt_vid_cap(struct file *file, void *fh,
+static int ipu7_isys_vidioc_try_fmt_vid_cap(struct file *file,
+					    struct video_device_state *state,
 					    struct v4l2_format *f)
 {
 	struct ipu7_isys_video *av = video_drvdata(file);
@@ -239,18 +244,20 @@ static int ipu7_isys_vidioc_try_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int ipu7_isys_vidioc_s_fmt_vid_cap(struct file *file, void *fh,
+static int ipu7_isys_vidioc_s_fmt_vid_cap(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_format *f)
 {
 	struct ipu7_isys_video *av = video_drvdata(file);
 
-	ipu7_isys_vidioc_try_fmt_vid_cap(file, fh, f);
+	ipu7_isys_vidioc_try_fmt_vid_cap(file, state, f);
 	av->pix_fmt = f->fmt.pix;
 
 	return 0;
 }
 
-static int ipu7_isys_vidioc_reqbufs(struct file *file, void *priv,
+static int ipu7_isys_vidioc_reqbufs(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_requestbuffers *p)
 {
 	struct ipu7_isys_video *av = video_drvdata(file);
@@ -263,10 +270,11 @@ static int ipu7_isys_vidioc_reqbufs(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return vb2_ioctl_reqbufs(file, priv, p);
+	return vb2_ioctl_reqbufs(file, state, p);
 }
 
-static int ipu7_isys_vidioc_create_bufs(struct file *file, void *priv,
+static int ipu7_isys_vidioc_create_bufs(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_create_buffers *p)
 {
 	struct ipu7_isys_video *av = video_drvdata(file);
@@ -279,7 +287,7 @@ static int ipu7_isys_vidioc_create_bufs(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return vb2_ioctl_create_bufs(file, priv, p);
+	return vb2_ioctl_create_bufs(file, state, p);
 }
 
 static int link_validate(struct media_link *link)
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 49e497a32973b8df18c5143e0db68d0f7f42c36c..876e6fdb1fb308746fc58a7cf319bf70d39cfd1c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -453,7 +453,8 @@ static const struct vb2_ops vdec_vb2_ops = {
 };
 
 static int
-vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+vdec_querycap(struct file *file, struct video_device_state *state,
+	      struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "meson-vdec", sizeof(cap->driver));
 	strscpy(cap->card, "Amlogic Video Decoder", sizeof(cap->card));
@@ -556,7 +557,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 	return fmt_out;
 }
 
-static int vdec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int vdec_try_fmt(struct file *file, struct video_device_state *state,
+			struct v4l2_format *f)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
@@ -565,7 +567,8 @@ static int vdec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int vdec_g_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
@@ -592,7 +595,8 @@ static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int vdec_s_fmt(struct file *file, struct video_device_state *state,
+		      struct v4l2_format *f)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
@@ -653,7 +657,8 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int vdec_enum_fmt(struct file *file, struct video_device_state *state,
+			 struct v4l2_fmtdesc *f)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	const struct vdec_platform *platform = sess->core->platform;
@@ -681,7 +686,8 @@ static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static int vdec_enum_framesizes(struct file *file, void *fh,
+static int vdec_enum_framesizes(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_frmsizeenum *fsize)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
@@ -706,14 +712,15 @@ static int vdec_enum_framesizes(struct file *file, void *fh,
 }
 
 static int
-vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
+vdec_decoder_cmd(struct file *file, struct video_device_state *state,
+		 struct v4l2_decoder_cmd *cmd)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct device *dev = sess->core->dev;
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, state, cmd);
 	if (ret)
 		return ret;
 
@@ -764,7 +771,8 @@ static int vdec_subscribe_event(struct v4l2_fh *fh,
 	}
 }
 
-static int vdec_g_pixelaspect(struct file *file, void *fh, int type,
+static int vdec_g_pixelaspect(struct file *file,
+			      struct video_device_state *state, int type,
 			      struct v4l2_fract *f)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
index a0420eb6a0aa034fb0b1468951d84c8fe7bb1b56..b967a44039e05fb22cce3c87364965137ce7422c 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -332,7 +332,8 @@ static const struct vb2_ops stf_video_vb2_q_ops = {
  * V4L2 ioctls
  */
 
-static int video_querycap(struct file *file, void *fh,
+static int video_querycap(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, "starfive-camss", sizeof(cap->driver));
@@ -341,7 +342,8 @@ static int video_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+static int video_enum_fmt(struct file *file, struct video_device_state *state,
+			  struct v4l2_fmtdesc *f)
 {
 	struct stfcamss_video *video = video_drvdata(file);
 	const struct stfcamss_format_info *fi;
@@ -367,7 +369,8 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static int video_enum_framesizes(struct file *file, void *fh,
+static int video_enum_framesizes(struct file *file,
+				 struct video_device_state *state,
 				 struct v4l2_frmsizeenum *fsize)
 {
 	struct stfcamss_video *video = video_drvdata(file);
@@ -395,7 +398,8 @@ static int video_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int video_g_fmt(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f)
 {
 	struct stfcamss_video *video = video_drvdata(file);
 
@@ -404,7 +408,8 @@ static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int video_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int video_s_fmt(struct file *file, struct video_device_state *state,
+		       struct v4l2_format *f)
 {
 	struct stfcamss_video *video = video_drvdata(file);
 	int ret;
@@ -421,7 +426,8 @@ static int video_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-static int video_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+static int video_try_fmt(struct file *file, struct video_device_state *state,
+			 struct v4l2_format *f)
 {
 	struct stfcamss_video *video = video_drvdata(file);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index ad4ec349077547ea3428c7341f152d729d775bb2..a96473a966cbc1a2f669ad705fcf72220a92c37a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -175,7 +175,8 @@ void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
 	pix_fmt->sizeimage = sizeimage;
 }
 
-static int cedrus_querycap(struct file *file, void *priv,
+static int cedrus_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, CEDRUS_NAME, sizeof(cap->driver));
@@ -218,19 +219,22 @@ static int cedrus_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	return -EINVAL;
 }
 
-static int cedrus_enum_fmt_vid_cap(struct file *file, void *priv,
+static int cedrus_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return cedrus_enum_fmt(file, f, CEDRUS_DECODE_DST);
 }
 
-static int cedrus_enum_fmt_vid_out(struct file *file, void *priv,
+static int cedrus_enum_fmt_vid_out(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	return cedrus_enum_fmt(file, f, CEDRUS_DECODE_SRC);
 }
 
-static int cedrus_g_fmt_vid_cap(struct file *file, void *priv,
+static int cedrus_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
@@ -239,7 +243,8 @@ static int cedrus_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cedrus_g_fmt_vid_out(struct file *file, void *priv,
+static int cedrus_g_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
@@ -270,7 +275,8 @@ static int cedrus_try_fmt_vid_cap_p(struct cedrus_ctx *ctx,
 	return 0;
 }
 
-static int cedrus_try_fmt_vid_cap(struct file *file, void *priv,
+static int cedrus_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	return cedrus_try_fmt_vid_cap_p(cedrus_file2ctx(file), &f->fmt.pix);
@@ -292,13 +298,15 @@ static int cedrus_try_fmt_vid_out_p(struct cedrus_ctx *ctx,
 	return 0;
 }
 
-static int cedrus_try_fmt_vid_out(struct file *file, void *priv,
+static int cedrus_try_fmt_vid_out(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	return cedrus_try_fmt_vid_out_p(cedrus_file2ctx(file), &f->fmt.pix);
 }
 
-static int cedrus_s_fmt_vid_cap(struct file *file, void *priv,
+static int cedrus_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
@@ -309,7 +317,7 @@ static int cedrus_s_fmt_vid_cap(struct file *file, void *priv,
 	if (vb2_is_busy(vq))
 		return -EBUSY;
 
-	ret = cedrus_try_fmt_vid_cap(file, priv, f);
+	ret = cedrus_try_fmt_vid_cap(file, state, f);
 	if (ret)
 		return ret;
 
@@ -381,7 +389,8 @@ void cedrus_reset_out_format(struct cedrus_ctx *ctx)
 	cedrus_s_fmt_vid_out_p(ctx, &ctx->src_fmt);
 }
 
-static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
+static int cedrus_s_fmt_vid_out(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index e7b99cee63d68bcb6d6e69cde9dd5c2de0d553f4..d64d0f77f632d65ff92bc0a4a587efacf2a4a5e9 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -419,7 +419,8 @@ static void sun6i_isp_capture_format_prepare(struct v4l2_format *format)
 	pix_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int sun6i_isp_capture_querycap(struct file *file, void *priv,
+static int sun6i_isp_capture_querycap(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_capability *capability)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -433,7 +434,8 @@ static int sun6i_isp_capture_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
+static int sun6i_isp_capture_enum_fmt(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
@@ -446,7 +448,8 @@ static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
+static int sun6i_isp_capture_g_fmt(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -456,7 +459,8 @@ static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_isp_capture_s_fmt(struct file *file, void *priv,
+static int sun6i_isp_capture_s_fmt(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -471,7 +475,8 @@ static int sun6i_isp_capture_s_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_isp_capture_try_fmt(struct file *file, void *priv,
+static int sun6i_isp_capture_try_fmt(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_format *format)
 {
 	sun6i_isp_capture_format_prepare(format);
@@ -479,7 +484,8 @@ static int sun6i_isp_capture_try_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_isp_capture_enum_input(struct file *file, void *priv,
+static int sun6i_isp_capture_enum_input(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_input *input)
 {
 	if (input->index != 0)
@@ -491,7 +497,8 @@ static int sun6i_isp_capture_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_isp_capture_g_input(struct file *file, void *priv,
+static int sun6i_isp_capture_g_input(struct file *file,
+				     struct video_device_state *state,
 				     unsigned int *index)
 {
 	*index = 0;
@@ -499,7 +506,8 @@ static int sun6i_isp_capture_g_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_isp_capture_s_input(struct file *file, void *priv,
+static int sun6i_isp_capture_s_input(struct file *file,
+				     struct video_device_state *state,
 				     unsigned int index)
 {
 	if (index != 0)
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 77c2d06c04362157c9cc3de801e8c576313e7da7..ed697fc56dd94fb7f79c0d07b55c8ea09b1eb8bc 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -383,7 +383,8 @@ static const struct vb2_ops sun6i_isp_params_queue_ops = {
 
 /* Video Device */
 
-static int sun6i_isp_params_querycap(struct file *file, void *priv,
+static int sun6i_isp_params_querycap(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_capability *capability)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -397,7 +398,8 @@ static int sun6i_isp_params_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_isp_params_enum_fmt(struct file *file, void *priv,
+static int sun6i_isp_params_enum_fmt(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_fmtdesc *fmtdesc)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
@@ -412,7 +414,8 @@ static int sun6i_isp_params_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int sun6i_isp_params_g_fmt(struct file *file, void *priv,
+static int sun6i_isp_params_g_fmt(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *format)
 {
 	struct sun6i_isp_device *isp_dev = video_drvdata(file);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157fa2d17e05df271c6ebea4b4455ed..1f9100b28ac0c9e5c31e839e0d0378e00a5a872d 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -294,7 +294,8 @@ static const struct vb2_ops tegra_channel_queue_qops = {
 /*
  * V4L2 ioctl operations
  */
-static int tegra_channel_querycap(struct file *file, void *fh,
+static int tegra_channel_querycap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_capability *cap)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -307,7 +308,8 @@ static int tegra_channel_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int tegra_channel_g_parm(struct file *file, void *fh,
+static int tegra_channel_g_parm(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_streamparm *a)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -317,7 +319,8 @@ static int tegra_channel_g_parm(struct file *file, void *fh,
 	return v4l2_g_parm_cap(&chan->video, subdev, a);
 }
 
-static int tegra_channel_s_parm(struct file *file, void *fh,
+static int tegra_channel_s_parm(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_streamparm *a)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -327,7 +330,8 @@ static int tegra_channel_s_parm(struct file *file, void *fh,
 	return v4l2_s_parm_cap(&chan->video, subdev, a);
 }
 
-static int tegra_channel_enum_framesizes(struct file *file, void *fh,
+static int tegra_channel_enum_framesizes(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_frmsizeenum *sizes)
 {
 	int ret;
@@ -357,7 +361,8 @@ static int tegra_channel_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int tegra_channel_enum_frameintervals(struct file *file, void *fh,
+static int tegra_channel_enum_frameintervals(struct file *file,
+					     struct video_device_state *state,
 					     struct v4l2_frmivalenum *ivals)
 {
 	int ret;
@@ -389,7 +394,8 @@ static int tegra_channel_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
-static int tegra_channel_enum_format(struct file *file, void *fh,
+static int tegra_channel_enum_format(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_fmtdesc *f)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -410,7 +416,8 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int tegra_channel_get_format(struct file *file, void *fh,
+static int tegra_channel_get_format(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *format)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -505,7 +512,8 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	return 0;
 }
 
-static int tegra_channel_try_format(struct file *file, void *fh,
+static int tegra_channel_try_format(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *format)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -521,7 +529,8 @@ static void tegra_channel_update_gangports(struct tegra_vi_channel *chan)
 		chan->numgangports = chan->totalports;
 }
 
-static int tegra_channel_set_format(struct file *file, void *fh,
+static int tegra_channel_set_format(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *format)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -605,7 +614,8 @@ tegra_channel_subscribe_event(struct v4l2_fh *fh,
 	return v4l2_ctrl_subscribe_event(fh, sub);
 }
 
-static int tegra_channel_g_selection(struct file *file, void *priv,
+static int tegra_channel_g_selection(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_selection *sel)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -647,7 +657,8 @@ static int tegra_channel_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int tegra_channel_s_selection(struct file *file, void *fh,
+static int tegra_channel_s_selection(struct file *file,
+				     struct video_device_state *state,
 				     struct v4l2_selection *sel)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -684,7 +695,8 @@ static int tegra_channel_s_selection(struct file *file, void *fh,
 	return ret;
 }
 
-static int tegra_channel_g_edid(struct file *file, void *fh,
+static int tegra_channel_g_edid(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_edid *edid)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -697,7 +709,8 @@ static int tegra_channel_g_edid(struct file *file, void *fh,
 	return v4l2_subdev_call(subdev, pad, get_edid, edid);
 }
 
-static int tegra_channel_s_edid(struct file *file, void *fh,
+static int tegra_channel_s_edid(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_edid *edid)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -710,7 +723,8 @@ static int tegra_channel_s_edid(struct file *file, void *fh,
 	return v4l2_subdev_call(subdev, pad, set_edid, edid);
 }
 
-static int tegra_channel_g_dv_timings(struct file *file, void *fh,
+static int tegra_channel_g_dv_timings(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_dv_timings *timings)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -724,7 +738,8 @@ static int tegra_channel_g_dv_timings(struct file *file, void *fh,
 					  pad, g_dv_timings, 0, timings);
 }
 
-static int tegra_channel_s_dv_timings(struct file *file, void *fh,
+static int tegra_channel_s_dv_timings(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_dv_timings *timings)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -737,7 +752,7 @@ static int tegra_channel_s_dv_timings(struct file *file, void *fh,
 	if (!v4l2_subdev_has_op(subdev, pad, s_dv_timings))
 		return -ENOTTY;
 
-	ret = tegra_channel_g_dv_timings(file, fh, &curr_timings);
+	ret = tegra_channel_g_dv_timings(file, state, &curr_timings);
 	if (ret)
 		return ret;
 
@@ -762,7 +777,8 @@ static int tegra_channel_s_dv_timings(struct file *file, void *fh,
 	return 0;
 }
 
-static int tegra_channel_query_dv_timings(struct file *file, void *fh,
+static int tegra_channel_query_dv_timings(struct file *file,
+					  struct video_device_state *state,
 					  struct v4l2_dv_timings *timings)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -776,7 +792,8 @@ static int tegra_channel_query_dv_timings(struct file *file, void *fh,
 					  pad, query_dv_timings, 0, timings);
 }
 
-static int tegra_channel_enum_dv_timings(struct file *file, void *fh,
+static int tegra_channel_enum_dv_timings(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_enum_dv_timings *timings)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -789,7 +806,8 @@ static int tegra_channel_enum_dv_timings(struct file *file, void *fh,
 	return v4l2_subdev_call(subdev, pad, enum_dv_timings, timings);
 }
 
-static int tegra_channel_dv_timings_cap(struct file *file, void *fh,
+static int tegra_channel_dv_timings_cap(struct file *file,
+					struct video_device_state *state,
 					struct v4l2_dv_timings_cap *cap)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -802,7 +820,8 @@ static int tegra_channel_dv_timings_cap(struct file *file, void *fh,
 	return v4l2_subdev_call(subdev, pad, dv_timings_cap, cap);
 }
 
-static int tegra_channel_log_status(struct file *file, void *fh)
+static int tegra_channel_log_status(struct file *file,
+				    struct video_device_state *state)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
 
@@ -811,7 +830,8 @@ static int tegra_channel_log_status(struct file *file, void *fh)
 	return 0;
 }
 
-static int tegra_channel_enum_input(struct file *file, void *fh,
+static int tegra_channel_enum_input(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_input *inp)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -829,7 +849,8 @@ static int tegra_channel_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int tegra_channel_g_input(struct file *file, void *priv,
+static int tegra_channel_g_input(struct file *file,
+				 struct video_device_state *state,
 				 unsigned int *i)
 {
 	*i = 0;
@@ -837,7 +858,8 @@ static int tegra_channel_g_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int tegra_channel_s_input(struct file *file, void *priv,
+static int tegra_channel_s_input(struct file *file,
+				 struct video_device_state *state,
 				 unsigned int input)
 {
 	if (input > 0)
diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 32f71d9a9cf78ad74aa8b9a53f40c1d52123df52..5bce5e4c566803c86c8b656427a75e91ca635405 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -242,10 +242,11 @@ static int comp_set_format(struct most_video_dev *mdev, unsigned int cmd,
 	return 0;
 }
 
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
-	struct comp_fh *fh = priv;
+	struct comp_fh *fh = state;
 	struct most_video_dev *mdev = fh->mdev;
 
 	strscpy(cap->driver, "v4l2_component", sizeof(cap->driver));
@@ -255,7 +256,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	if (f->index)
@@ -269,41 +271,46 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	comp_set_format_struct(f);
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
-	struct comp_fh *fh = priv;
+	struct comp_fh *fh = state;
 	struct most_video_dev *mdev = fh->mdev;
 
 	return comp_set_format(mdev, VIDIOC_TRY_FMT, f);
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
-	struct comp_fh *fh = priv;
+	struct comp_fh *fh = state;
 	struct most_video_dev *mdev = fh->mdev;
 
 	return comp_set_format(mdev, VIDIOC_S_FMT, f);
 }
 
-static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *norm)
+static int vidioc_g_std(struct file *file, struct video_device_state *state,
+			v4l2_std_id *norm)
 {
 	*norm = V4L2_STD_UNKNOWN;
 	return 0;
 }
 
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_input *input)
 {
-	struct comp_fh *fh = priv;
+	struct comp_fh *fh = state;
 	struct most_video_dev *mdev = fh->mdev;
 
 	if (input->index >= V4L2_CMP_MAX_INPUT)
@@ -318,17 +325,19 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
-	struct comp_fh *fh = priv;
+	struct comp_fh *fh = state;
 	struct most_video_dev *mdev = fh->mdev;
 	*i = mdev->ctrl_input;
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int index)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int index)
 {
-	struct comp_fh *fh = priv;
+	struct comp_fh *fh = state;
 	struct most_video_dev *mdev = fh->mdev;
 
 	if (index >= V4L2_CMP_MAX_INPUT)
diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index fa7ea4ca4c36f4ec7f76f6ffbea9f45205116bb8..ac0e5e711200712df1542ad3c0f1da3f90139d20 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -689,7 +689,8 @@ static int set_overlay_params(struct bcm2835_mmal_dev *dev,
 }
 
 /* overlay ioctl */
-static int vidioc_enum_fmt_vid_overlay(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_overlay(struct file *file,
+				       struct video_device_state *state,
 				       struct v4l2_fmtdesc *f)
 {
 	struct mmal_fmt *fmt;
@@ -704,7 +705,8 @@ static int vidioc_enum_fmt_vid_overlay(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_overlay(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_overlay(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
@@ -714,7 +716,8 @@ static int vidioc_g_fmt_vid_overlay(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_overlay(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_overlay(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_format *f)
 {
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
@@ -745,12 +748,13 @@ static int vidioc_try_fmt_vid_overlay(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_overlay(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_overlay(struct file *file,
+				    struct video_device_state *state,
 				    struct v4l2_format *f)
 {
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
 
-	vidioc_try_fmt_vid_overlay(file, priv, f);
+	vidioc_try_fmt_vid_overlay(file, state, f);
 
 	dev->overlay = f->fmt.win;
 	if (dev->component[COMP_PREVIEW]->enabled) {
@@ -761,7 +765,8 @@ static int vidioc_s_fmt_vid_overlay(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_overlay(struct file *file, void *f, unsigned int on)
+static int vidioc_overlay(struct file *file, struct video_device_state *state,
+			  unsigned int on)
 {
 	int ret;
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
@@ -816,7 +821,8 @@ static int vidioc_overlay(struct file *file, void *f, unsigned int on)
 	return vchiq_mmal_port_enable(dev->instance, src, NULL);
 }
 
-static int vidioc_g_fbuf(struct file *file, void *fh,
+static int vidioc_g_fbuf(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_framebuffer *a)
 {
 	/* The video overlay must stay within the framebuffer and can't be
@@ -841,7 +847,8 @@ static int vidioc_g_fbuf(struct file *file, void *fh,
 }
 
 /* input ioctls */
-static int vidioc_enum_input(struct file *file, void *priv,
+static int vidioc_enum_input(struct file *file,
+			     struct video_device_state *state,
 			     struct v4l2_input *inp)
 {
 	/* only a single camera input */
@@ -853,13 +860,15 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+static int vidioc_g_input(struct file *file, struct video_device_state *state,
+			  unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+static int vidioc_s_input(struct file *file, struct video_device_state *state,
+			  unsigned int i)
 {
 	if (i)
 		return -EINVAL;
@@ -868,7 +877,8 @@ static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 }
 
 /* capture ioctls */
-static int vidioc_querycap(struct file *file, void *priv,
+static int vidioc_querycap(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_capability *cap)
 {
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
@@ -884,7 +894,8 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_enum_fmt_vid_cap(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_fmtdesc *f)
 {
 	struct mmal_fmt *fmt;
@@ -899,7 +910,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_g_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
@@ -924,7 +936,8 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_try_fmt_vid_cap(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_format *f)
 {
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
@@ -1276,7 +1289,8 @@ static int mmal_setup_components(struct bcm2835_mmal_dev *dev,
 	return ret;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
+static int vidioc_s_fmt_vid_cap(struct file *file,
+				struct video_device_state *state,
 				struct v4l2_format *f)
 {
 	int ret;
@@ -1284,7 +1298,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	struct mmal_fmt *mfmt;
 
 	/* try the format to set valid parameters */
-	ret = vidioc_try_fmt_vid_cap(file, priv, f);
+	ret = vidioc_try_fmt_vid_cap(file, state, f);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev,
 			 "vid_cap - vidioc_try_fmt_vid_cap failed\n");
@@ -1320,7 +1334,8 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return ret;
 }
 
-static int vidioc_enum_framesizes(struct file *file, void *fh,
+static int vidioc_enum_framesizes(struct file *file,
+				  struct video_device_state *state,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
@@ -1345,7 +1360,8 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
 }
 
 /* timeperframe is arbitrary and continuous */
-static int vidioc_enum_frameintervals(struct file *file, void *priv,
+static int vidioc_enum_frameintervals(struct file *file,
+				      struct video_device_state *state,
 				      struct v4l2_frmivalenum *fival)
 {
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
@@ -1375,7 +1391,8 @@ static int vidioc_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_parm(struct file *file, void *priv,
+static int vidioc_g_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *parm)
 {
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
@@ -1389,7 +1406,8 @@ static int vidioc_g_parm(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_parm(struct file *file, void *priv,
+static int vidioc_s_parm(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_streamparm *parm)
 {
 	struct bcm2835_mmal_dev *dev = video_drvdata(file);
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index fd4b998ccd16058eb796dd317971c0869f6bdeb8..759f773eed9372f2d83ec7cbf1ba5e9dc1d278f6 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -212,7 +212,8 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
  */
 
 static int
-uvc_v4l2_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+uvc_v4l2_querycap(struct file *file, struct video_device_state *state,
+		  struct v4l2_capability *cap)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
@@ -226,7 +227,8 @@ uvc_v4l2_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 }
 
 static int
-uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
+uvc_v4l2_get_format(struct file *file, struct video_device_state *state,
+		    struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
@@ -245,7 +247,8 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
 }
 
 static int
-uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
+uvc_v4l2_try_format(struct file *file, struct video_device_state *state,
+		    struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
@@ -303,14 +306,15 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
 }
 
 static int
-uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
+uvc_v4l2_set_format(struct file *file, struct video_device_state *state,
+		    struct v4l2_format *fmt)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
 	int ret;
 
-	ret = uvc_v4l2_try_format(file, fh, fmt);
+	ret = uvc_v4l2_try_format(file, state, fmt);
 	if (ret)
 		return ret;
 
@@ -323,7 +327,8 @@ uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	return ret;
 }
 
-static int uvc_v4l2_g_parm(struct file *file, void *fh,
+static int uvc_v4l2_g_parm(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_streamparm *parm)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -350,7 +355,8 @@ static int uvc_v4l2_g_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int uvc_v4l2_s_parm(struct file *file, void *fh,
+static int uvc_v4l2_s_parm(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_streamparm *parm)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -374,7 +380,8 @@ static int uvc_v4l2_s_parm(struct file *file, void *fh,
 }
 
 static int
-uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
+uvc_v4l2_enum_frameintervals(struct file *file,
+			     struct video_device_state *state,
 		struct v4l2_frmivalenum *fival)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -413,7 +420,8 @@ uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
 }
 
 static int
-uvc_v4l2_enum_framesizes(struct file *file, void *fh,
+uvc_v4l2_enum_framesizes(struct file *file,
+			 struct video_device_state *state,
 		struct v4l2_frmsizeenum *fsize)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -440,7 +448,8 @@ uvc_v4l2_enum_framesizes(struct file *file, void *fh,
 }
 
 static int
-uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+uvc_v4l2_enum_format(struct file *file, struct video_device_state *state,
+		     struct v4l2_fmtdesc *f)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
@@ -464,7 +473,8 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 }
 
 static int
-uvc_v4l2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *b)
+uvc_v4l2_reqbufs(struct file *file, struct video_device_state *state,
+		 struct v4l2_requestbuffers *b)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
@@ -477,7 +487,8 @@ uvc_v4l2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *b)
 }
 
 static int
-uvc_v4l2_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
+uvc_v4l2_querybuf(struct file *file, struct video_device_state *state,
+		  struct v4l2_buffer *b)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
@@ -487,7 +498,8 @@ uvc_v4l2_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
 }
 
 static int
-uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
+uvc_v4l2_qbuf(struct file *file, struct video_device_state *state,
+	      struct v4l2_buffer *b)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
@@ -505,7 +517,8 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 }
 
 static int
-uvc_v4l2_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
+uvc_v4l2_dqbuf(struct file *file, struct video_device_state *state,
+	       struct v4l2_buffer *b)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
@@ -515,7 +528,8 @@ uvc_v4l2_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 }
 
 static int
-uvc_v4l2_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
+uvc_v4l2_streamon(struct file *file, struct video_device_state *state,
+		  enum v4l2_buf_type type)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
@@ -541,7 +555,8 @@ uvc_v4l2_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 }
 
 static int
-uvc_v4l2_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
+uvc_v4l2_streamoff(struct file *file, struct video_device_state *state,
+		   enum v4l2_buf_type type)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
@@ -620,7 +635,8 @@ uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
 }
 
 static long
-uvc_v4l2_ioctl_default(struct file *file, void *fh, bool valid_prio,
+uvc_v4l2_ioctl_default(struct file *file, struct video_device_state *state,
+		       bool valid_prio,
 		       unsigned int cmd, void *arg)
 {
 	struct video_device *vdev = video_devdata(file);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 31fc1bee3797bfe532931889188c8f7a9dedad39..a5a781d04db9aa57fabbccf938fe8d38eb550a80 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -12,6 +12,7 @@
 #include <linux/mutex.h>
 #include <linux/videodev2.h>
 #include <media/media-request.h>
+#include <media/v4l2-dev.h>
 
 /* forward references */
 struct file;
@@ -1313,13 +1314,13 @@ void v4l2_ctrl_merge(const struct v4l2_event *old, struct v4l2_event *new);
  * v4l2_ctrl_log_status - helper function to implement %VIDIOC_LOG_STATUS ioctl
  *
  * @file: pointer to struct file
- * @priv: unused. Kept just to be compatible to the arguments expected by
+ * @state: unused. Kept just to be compatible to the arguments expected by
  *	&struct v4l2_ioctl_ops.vidioc_log_status.
  *
  * Can be used as a vidioc_log_status function that just dumps all controls
  * associated with the filehandle.
  */
-int v4l2_ctrl_log_status(struct file *file, void *priv);
+int v4l2_ctrl_log_status(struct file *file, struct video_device_state *state);
 
 /**
  * v4l2_ctrl_subscribe_event - Subscribes to an event
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index b5312823fbff9c236d4394d48fa9a14412b17c68..e8696d1a5931c54ee07ef9e268cf635cf87e34f2 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -627,7 +627,7 @@ video_device_state_get_fmt(struct video_device_state *state);
  * @state: pointer to struct video_device_state
  * @format: pointer to struct v4l2_format
  */
-int video_device_g_fmt(struct file *file, void *priv,
+int video_device_g_fmt(struct file *file, struct video_device_state *state,
 		       struct v4l2_format *format);
 
 /**
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 6f7a58350441bedf4072d3f13ce05932c4ae8729..9e0acd57918c6d91f24f2184108e75e77d505592 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -16,6 +16,7 @@
 #include <linux/sched/signal.h>
 #include <linux/compiler.h> /* need __user */
 #include <linux/videodev2.h>
+#include <media/v4l2-dev.h>
 
 struct v4l2_fh;
 
@@ -293,144 +294,144 @@ struct v4l2_ioctl_ops {
 	/* ioctl callbacks */
 
 	/* VIDIOC_QUERYCAP handler */
-	int (*vidioc_querycap)(struct file *file, void *priv,
+	int (*vidioc_querycap)(struct file *file, struct video_device_state *state,
 			       struct v4l2_capability *cap);
 
 	/* VIDIOC_ENUM_FMT handlers */
-	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *priv,
+	int (*vidioc_enum_fmt_vid_cap)(struct file *file, struct video_device_state *state,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *priv,
+	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, struct video_device_state *state,
 					   struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *priv,
+	int (*vidioc_enum_fmt_vid_out)(struct file *file, struct video_device_state *state,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *priv,
+	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, struct video_device_state *state,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *priv,
+	int (*vidioc_enum_fmt_sdr_out)(struct file *file, struct video_device_state *state,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *priv,
+	int (*vidioc_enum_fmt_meta_cap)(struct file *file, struct video_device_state *state,
 					struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *priv,
+	int (*vidioc_enum_fmt_meta_out)(struct file *file, struct video_device_state *state,
 					struct v4l2_fmtdesc *f);
 
 	/* VIDIOC_G_FMT handlers */
-	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_vid_cap)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_vid_overlay)(struct file *file, struct video_device_state *state,
 					struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_vid_out)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, struct video_device_state *state,
 					    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_vbi_cap)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_vbi_out)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, struct video_device_state *state,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, struct video_device_state *state,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, struct video_device_state *state,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, struct video_device_state *state,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_sdr_cap)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_sdr_out)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_meta_cap)(struct file *file, struct video_device_state *state,
 				     struct v4l2_format *f);
-	int (*vidioc_g_fmt_meta_out)(struct file *file, void *priv,
+	int (*vidioc_g_fmt_meta_out)(struct file *file, struct video_device_state *state,
 				     struct v4l2_format *f);
 
 	/* VIDIOC_S_FMT handlers */
-	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_vid_cap)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_vid_overlay)(struct file *file, struct video_device_state *state,
 					struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_vid_out)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, struct video_device_state *state,
 					    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_vbi_cap)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_vbi_out)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, struct video_device_state *state,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, struct video_device_state *state,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, struct video_device_state *state,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, struct video_device_state *state,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_sdr_cap)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_sdr_out)(struct file *file, struct video_device_state *state,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_meta_cap)(struct file *file, struct video_device_state *state,
 				     struct v4l2_format *f);
-	int (*vidioc_s_fmt_meta_out)(struct file *file, void *priv,
+	int (*vidioc_s_fmt_meta_out)(struct file *file, struct video_device_state *state,
 				     struct v4l2_format *f);
 
 	/* VIDIOC_TRY_FMT handlers */
-	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_vid_cap)(struct file *file, struct video_device_state *state,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_vid_overlay)(struct file *file, struct video_device_state *state,
 					  struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_vid_out)(struct file *file, struct video_device_state *state,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, struct video_device_state *state,
 					      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_vbi_cap)(struct file *file, struct video_device_state *state,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_vbi_out)(struct file *file, struct video_device_state *state,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, struct video_device_state *state,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, struct video_device_state *state,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, struct video_device_state *state,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, struct video_device_state *state,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_sdr_cap)(struct file *file, struct video_device_state *state,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_sdr_out)(struct file *file, struct video_device_state *state,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_meta_cap)(struct file *file, struct video_device_state *state,
 				       struct v4l2_format *f);
-	int (*vidioc_try_fmt_meta_out)(struct file *file, void *priv,
+	int (*vidioc_try_fmt_meta_out)(struct file *file, struct video_device_state *state,
 				       struct v4l2_format *f);
 
 	/* Buffer handlers */
-	int (*vidioc_reqbufs)(struct file *file, void *priv,
+	int (*vidioc_reqbufs)(struct file *file, struct video_device_state *state,
 			      struct v4l2_requestbuffers *b);
-	int (*vidioc_querybuf)(struct file *file, void *priv,
+	int (*vidioc_querybuf)(struct file *file, struct video_device_state *state,
 			       struct v4l2_buffer *b);
-	int (*vidioc_qbuf)(struct file *file, void *priv,
+	int (*vidioc_qbuf)(struct file *file, struct video_device_state *state,
 			   struct v4l2_buffer *b);
-	int (*vidioc_expbuf)(struct file *file, void *priv,
+	int (*vidioc_expbuf)(struct file *file, struct video_device_state *state,
 			     struct v4l2_exportbuffer *e);
-	int (*vidioc_dqbuf)(struct file *file, void *priv,
+	int (*vidioc_dqbuf)(struct file *file, struct video_device_state *state,
 			    struct v4l2_buffer *b);
 
-	int (*vidioc_create_bufs)(struct file *file, void *priv,
+	int (*vidioc_create_bufs)(struct file *file, struct video_device_state *state,
 				  struct v4l2_create_buffers *b);
-	int (*vidioc_prepare_buf)(struct file *file, void *priv,
+	int (*vidioc_prepare_buf)(struct file *file, struct video_device_state *state,
 				  struct v4l2_buffer *b);
-	int (*vidioc_remove_bufs)(struct file *file, void *priv,
+	int (*vidioc_remove_bufs)(struct file *file, struct video_device_state *state,
 				  struct v4l2_remove_buffers *d);
 
-	int (*vidioc_overlay)(struct file *file, void *priv, unsigned int i);
-	int (*vidioc_g_fbuf)(struct file *file, void *priv,
+	int (*vidioc_overlay)(struct file *file, struct video_device_state *state, unsigned int i);
+	int (*vidioc_g_fbuf)(struct file *file, struct video_device_state *state,
 			     struct v4l2_framebuffer *a);
-	int (*vidioc_s_fbuf)(struct file *file, void *priv,
+	int (*vidioc_s_fbuf)(struct file *file, struct video_device_state *state,
 			     const struct v4l2_framebuffer *a);
 
 		/* Stream on/off */
-	int (*vidioc_streamon)(struct file *file, void *priv,
+	int (*vidioc_streamon)(struct file *file, struct video_device_state *state,
 			       enum v4l2_buf_type i);
-	int (*vidioc_streamoff)(struct file *file, void *priv,
+	int (*vidioc_streamoff)(struct file *file, struct video_device_state *state,
 				enum v4l2_buf_type i);
 
 		/*
@@ -438,135 +439,136 @@ struct v4l2_ioctl_ops {
 		 *
 		 * Note: ENUMSTD is handled by videodev.c
 		 */
-	int (*vidioc_g_std)(struct file *file, void *priv, v4l2_std_id *norm);
-	int (*vidioc_s_std)(struct file *file, void *priv, v4l2_std_id norm);
-	int (*vidioc_querystd)(struct file *file, void *priv, v4l2_std_id *a);
+	int (*vidioc_g_std)(struct file *file, struct video_device_state *state, v4l2_std_id *norm);
+	int (*vidioc_s_std)(struct file *file, struct video_device_state *state, v4l2_std_id norm);
+	int (*vidioc_querystd)(struct file *file, struct video_device_state *state, v4l2_std_id *a);
 
 		/* Input handling */
-	int (*vidioc_enum_input)(struct file *file, void *priv,
+	int (*vidioc_enum_input)(struct file *file, struct video_device_state *state,
 				 struct v4l2_input *inp);
-	int (*vidioc_g_input)(struct file *file, void *priv, unsigned int *i);
-	int (*vidioc_s_input)(struct file *file, void *priv, unsigned int i);
+	int (*vidioc_g_input)(struct file *file, struct video_device_state *state, unsigned int *i);
+	int (*vidioc_s_input)(struct file *file, struct video_device_state *state, unsigned int i);
 
 		/* Output handling */
-	int (*vidioc_enum_output)(struct file *file, void *priv,
+	int (*vidioc_enum_output)(struct file *file, struct video_device_state *state,
 				  struct v4l2_output *a);
-	int (*vidioc_g_output)(struct file *file, void *priv, unsigned int *i);
-	int (*vidioc_s_output)(struct file *file, void *priv, unsigned int i);
+	int (*vidioc_g_output)(struct file *file, struct video_device_state *state,
+			       unsigned int *i);
+	int (*vidioc_s_output)(struct file *file, struct video_device_state *state, unsigned int i);
 
 		/* Control handling */
-	int (*vidioc_query_ext_ctrl)(struct file *file, void *priv,
+	int (*vidioc_query_ext_ctrl)(struct file *file, struct video_device_state *state,
 				     struct v4l2_query_ext_ctrl *a);
-	int (*vidioc_g_ext_ctrls)(struct file *file, void *priv,
+	int (*vidioc_g_ext_ctrls)(struct file *file, struct video_device_state *state,
 				  struct v4l2_ext_controls *a);
-	int (*vidioc_s_ext_ctrls)(struct file *file, void *priv,
+	int (*vidioc_s_ext_ctrls)(struct file *file, struct video_device_state *state,
 				  struct v4l2_ext_controls *a);
-	int (*vidioc_try_ext_ctrls)(struct file *file, void *priv,
+	int (*vidioc_try_ext_ctrls)(struct file *file, struct video_device_state *state,
 				    struct v4l2_ext_controls *a);
-	int (*vidioc_querymenu)(struct file *file, void *priv,
+	int (*vidioc_querymenu)(struct file *file, struct video_device_state *state,
 				struct v4l2_querymenu *a);
 
 	/* Audio ioctls */
-	int (*vidioc_enumaudio)(struct file *file, void *priv,
+	int (*vidioc_enumaudio)(struct file *file, struct video_device_state *state,
 				struct v4l2_audio *a);
-	int (*vidioc_g_audio)(struct file *file, void *priv,
+	int (*vidioc_g_audio)(struct file *file, struct video_device_state *state,
 			      struct v4l2_audio *a);
-	int (*vidioc_s_audio)(struct file *file, void *priv,
+	int (*vidioc_s_audio)(struct file *file, struct video_device_state *state,
 			      const struct v4l2_audio *a);
 
 	/* Audio out ioctls */
-	int (*vidioc_enumaudout)(struct file *file, void *priv,
+	int (*vidioc_enumaudout)(struct file *file, struct video_device_state *state,
 				 struct v4l2_audioout *a);
-	int (*vidioc_g_audout)(struct file *file, void *priv,
+	int (*vidioc_g_audout)(struct file *file, struct video_device_state *state,
 			       struct v4l2_audioout *a);
-	int (*vidioc_s_audout)(struct file *file, void *priv,
+	int (*vidioc_s_audout)(struct file *file, struct video_device_state *state,
 			       const struct v4l2_audioout *a);
-	int (*vidioc_g_modulator)(struct file *file, void *priv,
+	int (*vidioc_g_modulator)(struct file *file, struct video_device_state *state,
 				  struct v4l2_modulator *a);
-	int (*vidioc_s_modulator)(struct file *file, void *priv,
+	int (*vidioc_s_modulator)(struct file *file, struct video_device_state *state,
 				  const struct v4l2_modulator *a);
 	/* Crop ioctls */
-	int (*vidioc_g_pixelaspect)(struct file *file, void *priv,
+	int (*vidioc_g_pixelaspect)(struct file *file, struct video_device_state *state,
 				    int buf_type, struct v4l2_fract *aspect);
-	int (*vidioc_g_selection)(struct file *file, void *priv,
+	int (*vidioc_g_selection)(struct file *file, struct video_device_state *state,
 				  struct v4l2_selection *s);
-	int (*vidioc_s_selection)(struct file *file, void *priv,
+	int (*vidioc_s_selection)(struct file *file, struct video_device_state *state,
 				  struct v4l2_selection *s);
 	/* Compression ioctls */
-	int (*vidioc_g_jpegcomp)(struct file *file, void *priv,
+	int (*vidioc_g_jpegcomp)(struct file *file, struct video_device_state *state,
 				 struct v4l2_jpegcompression *a);
-	int (*vidioc_s_jpegcomp)(struct file *file, void *priv,
+	int (*vidioc_s_jpegcomp)(struct file *file, struct video_device_state *state,
 				 const struct v4l2_jpegcompression *a);
-	int (*vidioc_g_enc_index)(struct file *file, void *priv,
+	int (*vidioc_g_enc_index)(struct file *file, struct video_device_state *state,
 				  struct v4l2_enc_idx *a);
-	int (*vidioc_encoder_cmd)(struct file *file, void *priv,
+	int (*vidioc_encoder_cmd)(struct file *file, struct video_device_state *state,
 				  struct v4l2_encoder_cmd *a);
-	int (*vidioc_try_encoder_cmd)(struct file *file, void *priv,
+	int (*vidioc_try_encoder_cmd)(struct file *file, struct video_device_state *state,
 				      struct v4l2_encoder_cmd *a);
-	int (*vidioc_decoder_cmd)(struct file *file, void *priv,
+	int (*vidioc_decoder_cmd)(struct file *file, struct video_device_state *state,
 				  struct v4l2_decoder_cmd *a);
-	int (*vidioc_try_decoder_cmd)(struct file *file, void *priv,
+	int (*vidioc_try_decoder_cmd)(struct file *file, struct video_device_state *state,
 				      struct v4l2_decoder_cmd *a);
 
 	/* Stream type-dependent parameter ioctls */
-	int (*vidioc_g_parm)(struct file *file, void *priv,
+	int (*vidioc_g_parm)(struct file *file, struct video_device_state *state,
 			     struct v4l2_streamparm *a);
-	int (*vidioc_s_parm)(struct file *file, void *priv,
+	int (*vidioc_s_parm)(struct file *file, struct video_device_state *state,
 			     struct v4l2_streamparm *a);
 
 	/* Tuner ioctls */
-	int (*vidioc_g_tuner)(struct file *file, void *priv,
+	int (*vidioc_g_tuner)(struct file *file, struct video_device_state *state,
 			      struct v4l2_tuner *a);
-	int (*vidioc_s_tuner)(struct file *file, void *priv,
+	int (*vidioc_s_tuner)(struct file *file, struct video_device_state *state,
 			      const struct v4l2_tuner *a);
-	int (*vidioc_g_frequency)(struct file *file, void *priv,
+	int (*vidioc_g_frequency)(struct file *file, struct video_device_state *state,
 				  struct v4l2_frequency *a);
-	int (*vidioc_s_frequency)(struct file *file, void *priv,
+	int (*vidioc_s_frequency)(struct file *file, struct video_device_state *state,
 				  const struct v4l2_frequency *a);
-	int (*vidioc_enum_freq_bands)(struct file *file, void *priv,
+	int (*vidioc_enum_freq_bands)(struct file *file, struct video_device_state *state,
 				      struct v4l2_frequency_band *band);
 
 	/* Sliced VBI cap */
-	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *priv,
+	int (*vidioc_g_sliced_vbi_cap)(struct file *file, struct video_device_state *state,
 				       struct v4l2_sliced_vbi_cap *a);
 
 	/* Log status ioctl */
-	int (*vidioc_log_status)(struct file *file, void *priv);
+	int (*vidioc_log_status)(struct file *file, struct video_device_state *state);
 
-	int (*vidioc_s_hw_freq_seek)(struct file *file, void *priv,
+	int (*vidioc_s_hw_freq_seek)(struct file *file, struct video_device_state *state,
 				     const struct v4l2_hw_freq_seek *a);
 
 	/* Debugging ioctls */
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-	int (*vidioc_g_register)(struct file *file, void *priv,
+	int (*vidioc_g_register)(struct file *file, struct video_device_state *state,
 				 struct v4l2_dbg_register *reg);
-	int (*vidioc_s_register)(struct file *file, void *priv,
+	int (*vidioc_s_register)(struct file *file, struct video_device_state *state,
 				 const struct v4l2_dbg_register *reg);
 
-	int (*vidioc_g_chip_info)(struct file *file, void *priv,
+	int (*vidioc_g_chip_info)(struct file *file, struct video_device_state *state,
 				  struct v4l2_dbg_chip_info *chip);
 #endif
 
-	int (*vidioc_enum_framesizes)(struct file *file, void *priv,
+	int (*vidioc_enum_framesizes)(struct file *file, struct video_device_state *state,
 				      struct v4l2_frmsizeenum *fsize);
 
-	int (*vidioc_enum_frameintervals)(struct file *file, void *priv,
+	int (*vidioc_enum_frameintervals)(struct file *file, struct video_device_state *state,
 					  struct v4l2_frmivalenum *fival);
 
 	/* DV Timings IOCTLs */
-	int (*vidioc_s_dv_timings)(struct file *file, void *priv,
+	int (*vidioc_s_dv_timings)(struct file *file, struct video_device_state *state,
 				   struct v4l2_dv_timings *timings);
-	int (*vidioc_g_dv_timings)(struct file *file, void *priv,
+	int (*vidioc_g_dv_timings)(struct file *file, struct video_device_state *state,
 				   struct v4l2_dv_timings *timings);
-	int (*vidioc_query_dv_timings)(struct file *file, void *priv,
+	int (*vidioc_query_dv_timings)(struct file *file, struct video_device_state *state,
 				       struct v4l2_dv_timings *timings);
-	int (*vidioc_enum_dv_timings)(struct file *file, void *priv,
+	int (*vidioc_enum_dv_timings)(struct file *file, struct video_device_state *state,
 				      struct v4l2_enum_dv_timings *timings);
-	int (*vidioc_dv_timings_cap)(struct file *file, void *priv,
+	int (*vidioc_dv_timings_cap)(struct file *file, struct video_device_state *state,
 				     struct v4l2_dv_timings_cap *cap);
-	int (*vidioc_g_edid)(struct file *file, void *priv,
+	int (*vidioc_g_edid)(struct file *file, struct video_device_state *state,
 			     struct v4l2_edid *edid);
-	int (*vidioc_s_edid)(struct file *file, void *priv,
+	int (*vidioc_s_edid)(struct file *file, struct video_device_state *state,
 			     struct v4l2_edid *edid);
 
 	int (*vidioc_subscribe_event)(struct v4l2_fh *fh,
@@ -575,7 +577,7 @@ struct v4l2_ioctl_ops {
 					const struct v4l2_event_subscription *sub);
 
 	/* For other private ioctls */
-	long (*vidioc_default)(struct file *file, void *priv,
+	long (*vidioc_default)(struct file *file, struct video_device_state *state,
 			       bool valid_prio, unsigned int cmd, void *arg);
 };
 
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 09c6164577ccf4ef49dee24e9ee6be38fbc521ce..accd05fba0dff3c7ebd596ae726ba96572b90a8c 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -863,37 +863,53 @@ void v4l2_m2m_request_queue(struct media_request *req);
 
 /* v4l2 ioctl helpers */
 
-int v4l2_m2m_ioctl_reqbufs(struct file *file, void *priv,
+int v4l2_m2m_ioctl_reqbufs(struct file *file,
+			   struct video_device_state *state,
 			   struct v4l2_requestbuffers *rb);
-int v4l2_m2m_ioctl_create_bufs(struct file *file, void *priv,
+int v4l2_m2m_ioctl_create_bufs(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_create_buffers *create);
-int v4l2_m2m_ioctl_remove_bufs(struct file *file, void *priv,
+int v4l2_m2m_ioctl_remove_bufs(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_remove_buffers *d);
-int v4l2_m2m_ioctl_querybuf(struct file *file, void *priv,
+int v4l2_m2m_ioctl_querybuf(struct file *file,
+			    struct video_device_state *state,
 			    struct v4l2_buffer *buf);
-int v4l2_m2m_ioctl_expbuf(struct file *file, void *priv,
+int v4l2_m2m_ioctl_expbuf(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_exportbuffer *eb);
-int v4l2_m2m_ioctl_qbuf(struct file *file, void *priv,
+int v4l2_m2m_ioctl_qbuf(struct file *file,
+			struct video_device_state *state,
 			struct v4l2_buffer *buf);
-int v4l2_m2m_ioctl_dqbuf(struct file *file, void *priv,
+int v4l2_m2m_ioctl_dqbuf(struct file *file,
+			 struct video_device_state *state,
 			 struct v4l2_buffer *buf);
-int v4l2_m2m_ioctl_prepare_buf(struct file *file, void *priv,
+int v4l2_m2m_ioctl_prepare_buf(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_buffer *buf);
-int v4l2_m2m_ioctl_streamon(struct file *file, void *priv,
+int v4l2_m2m_ioctl_streamon(struct file *file,
+			    struct video_device_state *state,
 			    enum v4l2_buf_type type);
-int v4l2_m2m_ioctl_streamoff(struct file *file, void *priv,
+int v4l2_m2m_ioctl_streamoff(struct file *file,
+			     struct video_device_state *state,
 			     enum v4l2_buf_type type);
-int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_encoder_cmd(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_encoder_cmd *ec);
-int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file,
+			       struct video_device_state *state,
 			       struct v4l2_decoder_cmd *dc);
-int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_encoder_cmd *ec);
-int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file,
+				   struct video_device_state *state,
 				   struct v4l2_decoder_cmd *dc);
-int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file,
+					     struct video_device_state *state,
 					     struct v4l2_decoder_cmd *dc);
-int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
+int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file,
+					 struct video_device_state *state,
 					 struct v4l2_decoder_cmd *dc);
 int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma);
 __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait);
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 77ce8238ab303a6f90dfb89852e7e48555f55a92..0164f0f3e404a425533d7657944c26c2f6eae1da 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -14,6 +14,7 @@
 
 #include <linux/videodev2.h>
 #include <media/videobuf2-core.h>
+#include <media/v4l2-dev.h>
 
 #if VB2_MAX_FRAME != VIDEO_MAX_FRAME
 #error VB2_MAX_FRAME != VIDEO_MAX_FRAME
@@ -321,20 +322,28 @@ static inline bool vb2_queue_is_busy(struct vb2_queue *q, struct file *file)
 
 /* struct v4l2_ioctl_ops helpers */
 
-int vb2_ioctl_reqbufs(struct file *file, void *priv,
-			  struct v4l2_requestbuffers *p);
-int vb2_ioctl_create_bufs(struct file *file, void *priv,
+int vb2_ioctl_reqbufs(struct file *file, struct video_device_state *state,
+		      struct v4l2_requestbuffers *p);
+int vb2_ioctl_create_bufs(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_create_buffers *p);
-int vb2_ioctl_prepare_buf(struct file *file, void *priv,
+int vb2_ioctl_prepare_buf(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_buffer *p);
-int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p);
-int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p);
-int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p);
-int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i);
-int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i);
-int vb2_ioctl_expbuf(struct file *file, void *priv,
-	struct v4l2_exportbuffer *p);
-int vb2_ioctl_remove_bufs(struct file *file, void *priv,
+int vb2_ioctl_querybuf(struct file *file, struct video_device_state *state,
+		       struct v4l2_buffer *p);
+int vb2_ioctl_qbuf(struct file *file, struct video_device_state *state,
+		   struct v4l2_buffer *p);
+int vb2_ioctl_dqbuf(struct file *file, struct video_device_state *state,
+		    struct v4l2_buffer *p);
+int vb2_ioctl_streamon(struct file *file, struct video_device_state *state,
+		       enum v4l2_buf_type i);
+int vb2_ioctl_streamoff(struct file *file, struct video_device_state *state,
+			enum v4l2_buf_type i);
+int vb2_ioctl_expbuf(struct file *file,
+		     struct video_device_state *state, struct v4l2_exportbuffer *p);
+int vb2_ioctl_remove_bufs(struct file *file,
+			  struct video_device_state *state,
 			  struct v4l2_remove_buffers *p);
 
 /* struct v4l2_file_operations helpers */

-- 
2.51.0


