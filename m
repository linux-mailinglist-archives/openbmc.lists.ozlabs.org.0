Return-Path: <openbmc+bounces-674-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47029B8BEC7
	for <lists+openbmc@lfdr.de>; Sat, 20 Sep 2025 06:15:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTGHS3DgPz30T8;
	Sat, 20 Sep 2025 14:15:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758276323;
	cv=none; b=YeEFwqc/l8hRjgJDB3z6jffiiqoTLgvH8N5mVUS23b7Yo4+6+jNBbvBLpCLgKDOyF6gH0uVk8TJnp4Qar1bqgCmo/3fXm+6Ujt+uvkqBrZ4cIdzz5iCFgeIv4RHVhR+TdTKFwwlkvqjYUaoVU5yTxuZ+i7A7Ru/ZHeWvJpm6vw5uvpyXVo+xLRP1EhqMwj53ztAZg4fjQJhSCmoyULx/s50BjFHUEvEH85UWRExm8GwXyqFhkwESvJxdm93PiPOaWLbbdvAJ8U6WTKinbLlBQ9Z2m4/Mhl3uY0XMCtWIBb9bIXJ/rQrSSUf5zPbkv8gjtDdfv041KffCIzoYxtrM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758276323; c=relaxed/relaxed;
	bh=jxSpB2UYc8/KnCoaFi4t214NFPmlgsSplbe8JSFMC18=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MZaVYybFedo1KKqB3nik8CRkF+tyOrG1sR8P1wsr8aAN+BqBluJevi32QejWQMz5ZviaB+hZP2BdEg14F54J2TEzc6OsZY+FAKGSzJsfWBZAO7DI6+78Qxr345xM1SSLkHDW61cAzeQy/JgfPbmCCX7QR0m8teMfRwbrSXxgCxIymZbksppnCxb1YaSG2NcXl11rbRj3ef+Up5tw8hS9kpMLylPk7tlJUpeisi3cxMJWDj6dZXE+GDsh2oiEKGxk2ZmKokash4Gprcz40a4hH1jyBlVAKRVg1ro0AWwcc8PKh+7OENXWo5egrAOiuRoBQkUhAV64WuZ5uTlZKTN0iQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=pF6Y3avd; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=jai.luthra@ideasonboard.com; receiver=lists.ozlabs.org) smtp.mailfrom=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=pF6Y3avd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ideasonboard.com (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=jai.luthra@ideasonboard.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 488 seconds by postgrey-1.37 at boromir; Fri, 19 Sep 2025 20:05:20 AEST
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSp686bz0z2xnt;
	Fri, 19 Sep 2025 20:05:20 +1000 (AEST)
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4816:952:3054:81b6:1a3a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 182617E4;
	Fri, 19 Sep 2025 11:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758275737;
	bh=7s9FtRCqwgeCi33uDxa8WpyxAovzBQYLkFU2ZttiCbE=;
	h=From:Subject:Date:To:Cc:From;
	b=pF6Y3avdyA5z/Vb+FXAIPi8A464hzKtzcEv1B2FBsOklLSEV9gF3WUuKld3zK3DK2
	 AapdrH5hBJgPKQ+eYOnlte83w4FlJOTDFas/vNAy0z55UruQUdOJ2yuWh074KX/48e
	 vSVEzOLQZFfOFQMLYJd27uXq1B3MYjHdlQatU9LU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 00/10] media: Introduce video device state management
Date: Fri, 19 Sep 2025 15:25:52 +0530
Message-Id: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKkozWgC/23MQQ6CMBCF4auQWVtToFB15T0MiykzyixsTds0G
 sLdraxd/i953wqJo3CCS7NC5CJJgq/RHRqYF/QPVkK1odPdoK3uVSEuKmXMrLQ1vUPUSMZBPbw
 i3+W9Y7ep9iIph/jZ7dL+1r9MaZVWNBqLA5vzaaSrEGMK3gWMdJzDE6Zt277PzEeXqwAAAA==
X-Change-ID: 20250703-vdev-state-0743baa0ad4b
To: Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Al Viro <viro@zeniv.linux.org.uk>, Ma Ke <make24@iscas.ac.cn>, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Hans de Goede <hansg@kernel.org>, 
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
 Andy Shevchenko <andy@kernel.org>, 
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
 Chen Ni <nichen@iscas.ac.cn>, Fabio Luongo <f.langufo.l@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Yang Yingliang <yangyingliang@huawei.com>, 
 Ludwig Disterhof <ludwig@disterhof.eu>, 
 "Everest K.C." <everestkc@everestkc.com.np>, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>, 
 Akash Kumar <quic_akakum@quicinc.com>, linux-input@vger.kernel.org, 
 mjpeg-users@lists.sourceforge.net, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, kernel@collabora.com, 
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

This patch series introduces state management for video devices.

Currently, V4L2 subdevices have a well-established state management
system [1] that allows the framework to store the subdevice state
at a central location.

Video devices however lack this, leading to inconsistent state handling
across drivers and making it difficult to implement features like
hardware multiplexing in complex media pipelines [2].

The series is composed of three parts:

- Core Infrastructure (PATCH 1-4)
	Introduces the basic state structure, try state support,
	initialization callbacks, and driver helpers
- Framework Integration (PATCH 5-7)
	Integrates state passing through the ioctl wrappers and driver
	implementations
- Driver Examples (PATCH 8-10)
	Use the state to store formats in TI J721E CSI2RX and Rockchip
	RKISP1 drivers

This should also provide a foundation for drivers to extend or subclass
the state structure with device-specific variables in future.

I have tested capture and format negotiation with the converted drivers
on SK AM62A (j721e-csi2rx) and Debix Model A (rkisp1).

[1]: https://lore.kernel.org/linux-media/20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com/
[2]: https://lore.kernel.org/linux-media/20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com/

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Drop RFC tag
- Rebase on top of latest media tree, that includes multiple changes by
  Jacopo and Laurent, which removes all usage of passing v4l2_fh through
  the opaque pointer in ioctl implementations, replacing it with a NULL
  pointer
- Allocate the state dynamically, and free it when done with the device
  or the filehandle
- Introduce an init_state callback so that drivers can initialize the
  state after allocation
- Pass the video device state (as an explicitly typed pointer) to all
  ioctl implemenation across all drivers
- Split the single patch introducing video device state into separate
  patches each making a single logical change before the state is
  actually passed to the drivers in PATCH 7
- In drivers, use a helper to access the current format from the state
- Move the queue busy check back to the drivers, as some codecs and VBI
  devices may support changing formats, so the framework shouldn't
  return -EBUSY
- Drop pixel format info and configuration storage from rkisp1 internal
  strucutre, and calculate them on the fly
- Fix other review comments from Sakari, Laurent and Jacopo, except
  those around dropping the enum and using try_fmt hook to update only
  the state, and s_fmt hook to update hardware registers
- Link to v1: https://lore.kernel.org/r/20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com

---
Jai Luthra (10):
      media: v4l2-core: Introduce state management for video devices
      media: v4l2-dev: Add support for try state
      media: v4l2-dev: Add callback for initializing video device state
      media: v4l2-dev: Add helpers to get current format from the state
      media: v4l2-ioctl: Add video_device_state argument to v4l2 ioctl wrappers
      media: Replace void * with video_device_state * in all driver ioctl implementations
      media: v4l2-ioctl: Pass device state for G/S/TRY_FMT ioctls
      media: ti: j721e-csi2rx: Use video_device_state
      media: rkisp1: Use video_device_state
      media: rkisp1: Calculate format information on demand

 drivers/input/rmi4/rmi_f54.c                       |  22 +-
 drivers/input/touchscreen/atmel_mxt_ts.c           |  23 +-
 drivers/input/touchscreen/sur40.c                  |  35 +-
 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |  34 +-
 drivers/media/common/saa7146/saa7146_video.c       |  37 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |  30 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c          |  38 +-
 drivers/media/i2c/video-i2c.c                      |  39 ++-
 drivers/media/pci/bt8xx/bttv-driver.c              |  84 +++--
 drivers/media/pci/bt8xx/bttv-vbi.c                 |  11 +-
 drivers/media/pci/bt8xx/bttvp.h                    |   9 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c             |  98 +++---
 drivers/media/pci/cx18/cx18-driver.c               |   9 +-
 drivers/media/pci/cx18/cx18-ioctl.c                | 114 +++---
 drivers/media/pci/cx18/cx18-ioctl.h                |   9 +-
 drivers/media/pci/cx23885/cx23885-417.c            |  53 +--
 drivers/media/pci/cx23885/cx23885-ioctl.c          |   8 +-
 drivers/media/pci/cx23885/cx23885-ioctl.h          |   9 +-
 drivers/media/pci/cx23885/cx23885-vbi.c            |   5 +-
 drivers/media/pci/cx23885/cx23885-video.c          |  82 +++--
 drivers/media/pci/cx23885/cx23885.h                |   4 +-
 drivers/media/pci/cx25821/cx25821-video.c          |  57 ++-
 drivers/media/pci/cx88/cx88-blackbird.c            |  47 ++-
 drivers/media/pci/cx88/cx88-vbi.c                  |   2 +-
 drivers/media/pci/cx88/cx88-video.c                |  56 ++-
 drivers/media/pci/cx88/cx88.h                      |   2 +-
 drivers/media/pci/dt3155/dt3155.c                  |  25 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  29 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |  41 ++-
 drivers/media/pci/ivtv/ivtv-driver.c               |   8 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                | 225 ++++++++----
 drivers/media/pci/ivtv/ivtv-ioctl.h                |   6 +-
 drivers/media/pci/mgb4/mgb4_vin.c                  |  55 ++-
 drivers/media/pci/mgb4/mgb4_vout.c                 |  49 ++-
 drivers/media/pci/saa7134/saa7134-empress.c        |  12 +-
 drivers/media/pci/saa7134/saa7134-video.c          |  96 ++++--
 drivers/media/pci/saa7134/saa7134.h                |  38 +-
 drivers/media/pci/saa7146/hexium_gemini.c          |  10 +-
 drivers/media/pci/saa7146/hexium_orion.c           |  10 +-
 drivers/media/pci/saa7146/mxb.c                    |  46 ++-
 drivers/media/pci/saa7164/saa7164-encoder.c        |  39 ++-
 drivers/media/pci/saa7164/saa7164-vbi.c            |  27 +-
 drivers/media/pci/saa7164/saa7164.h                |   9 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     |  46 ++-
 drivers/media/pci/solo6x10/solo6x10-v4l2.c         |  32 +-
 drivers/media/pci/ttpci/budget-av.c                |  10 +-
 drivers/media/pci/tw5864/tw5864-video.c            |  49 ++-
 drivers/media/pci/tw68/tw68-video.c                |  43 ++-
 drivers/media/pci/tw686x/tw686x-video.c            |  53 ++-
 drivers/media/pci/zoran/zoran_driver.c             |  44 ++-
 drivers/media/platform/allegro-dvt/allegro-core.c  |  49 ++-
 .../media/platform/amlogic/c3/isp/c3-isp-capture.c |  18 +-
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  |   9 +-
 .../media/platform/amlogic/c3/isp/c3-isp-stats.c   |   9 +-
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |  36 +-
 drivers/media/platform/amphion/vdec.c              |  30 +-
 drivers/media/platform/amphion/venc.c              |  49 ++-
 drivers/media/platform/aspeed/aspeed-video.c       |  50 ++-
 drivers/media/platform/atmel/atmel-isi.c           |  36 +-
 drivers/media/platform/broadcom/bcm2835-unicam.c   |  33 +-
 .../media/platform/chips-media/coda/coda-common.c  |  69 ++--
 .../platform/chips-media/wave5/wave5-helper.c      |   2 +-
 .../platform/chips-media/wave5/wave5-helper.h      |   3 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |  54 ++-
 .../platform/chips-media/wave5/wave5-vpu-enc.c     |  62 +++-
 .../media/platform/imagination/e5010-jpeg-enc.c    |  34 +-
 drivers/media/platform/intel/pxa_camera.c          |  34 +-
 drivers/media/platform/m2m-deinterlace.c           |  34 +-
 drivers/media/platform/marvell/mcam-core.c         |  52 +--
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |  44 ++-
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  |  34 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  25 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  52 ++-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       |  50 ++-
 .../media/platform/microchip/microchip-isc-base.c  |  33 +-
 drivers/media/platform/nuvoton/npcm-video.c        |  43 ++-
 drivers/media/platform/nvidia/tegra-vde/v4l2.c     |  38 +-
 drivers/media/platform/nxp/dw100/dw100.c           |  35 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  52 ++-
 drivers/media/platform/nxp/imx-pxp.c               |  34 +-
 drivers/media/platform/nxp/imx7-media-csi.c        |  21 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  15 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |  18 +-
 drivers/media/platform/nxp/mx2_emmaprp.c           |  31 +-
 drivers/media/platform/qcom/camss/camss-video.c    |  27 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  48 ++-
 drivers/media/platform/qcom/venus/vdec.c           |  29 +-
 drivers/media/platform/qcom/venus/venc.c           |  38 +-
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   |  42 ++-
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   |  40 ++-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |  21 +-
 drivers/media/platform/renesas/rcar_drif.c         |  30 +-
 drivers/media/platform/renesas/rcar_fdp1.c         |  18 +-
 drivers/media/platform/renesas/rcar_jpu.c          |  21 +-
 drivers/media/platform/renesas/renesas-ceu.c       |  36 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  18 +-
 drivers/media/platform/renesas/sh_vou.c            |  41 ++-
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |   9 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |  18 +-
 drivers/media/platform/rockchip/rga/rga.c          |  24 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      | 289 ++++++++--------
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  10 -
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |  15 +-
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |   9 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  34 +-
 .../media/platform/samsung/exynos-gsc/gsc-m2m.c    |  44 ++-
 .../platform/samsung/exynos4-is/fimc-capture.c     |  45 ++-
 .../platform/samsung/exynos4-is/fimc-isp-video.c   |  32 +-
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |  36 +-
 .../media/platform/samsung/exynos4-is/fimc-m2m.c   |  21 +-
 .../platform/samsung/s3c-camif/camif-capture.c     |  54 ++-
 drivers/media/platform/samsung/s5p-g2d/g2d.c       |  26 +-
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |  34 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc_dec.c   |  48 ++-
 .../media/platform/samsung/s5p-mfc/s5p_mfc_enc.c   |  51 ++-
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   |  26 +-
 drivers/media/platform/st/sti/delta/delta-v4l2.c   |  44 ++-
 drivers/media/platform/st/sti/hva/hva-v4l2.c       |  46 ++-
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |  18 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |  42 ++-
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  20 +-
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |  25 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_capture.c   |  24 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |  31 +-
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  34 +-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |  47 ++-
 drivers/media/platform/ti/am437x/am437x-vpfe.c     |  52 ++-
 drivers/media/platform/ti/cal/cal-video.c          |  54 ++-
 drivers/media/platform/ti/davinci/vpif_capture.c   |  94 ++---
 drivers/media/platform/ti/davinci/vpif_display.c   |  58 ++--
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 127 +++----
 drivers/media/platform/ti/omap/omap_vout.c         |  49 ++-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |  53 ++-
 drivers/media/platform/ti/vpe/vpe.c                |  25 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   |  47 ++-
 drivers/media/platform/via/via-camera.c            |  42 ++-
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
 drivers/media/radio/radio-si476x.c                 |  28 +-
 drivers/media/radio/radio-tea5764.c                |  15 +-
 drivers/media/radio/radio-tea5777.c                |  21 +-
 drivers/media/radio/radio-timb.c                   |  26 +-
 drivers/media/radio/si470x/radio-si470x-common.c   |  25 +-
 drivers/media/radio/si4713/radio-platform-si4713.c |  18 +-
 drivers/media/radio/si4713/radio-usb-si4713.c      |  15 +-
 drivers/media/radio/tea575x.c                      |  21 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  54 +--
 drivers/media/test-drivers/vim2m.c                 |  56 +--
 drivers/media/test-drivers/vimc/vimc-capture.c     |  20 +-
 drivers/media/test-drivers/visl/visl-video.c       |  34 +-
 drivers/media/test-drivers/vivid/vivid-core.c      | 203 ++++++-----
 drivers/media/test-drivers/vivid/vivid-meta-cap.c  |   6 +-
 drivers/media/test-drivers/vivid/vivid-meta-cap.h  |   6 +-
 drivers/media/test-drivers/vivid/vivid-meta-out.c  |   6 +-
 drivers/media/test-drivers/vivid/vivid-meta-out.h  |   9 +-
 drivers/media/test-drivers/vivid/vivid-radio-rx.c  |  16 +-
 drivers/media/test-drivers/vivid/vivid-radio-rx.h  |  16 +-
 drivers/media/test-drivers/vivid/vivid-radio-tx.c  |   6 +-
 drivers/media/test-drivers/vivid/vivid-radio-tx.h  |   6 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   |  30 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.h   |  30 +-
 drivers/media/test-drivers/vivid/vivid-touch-cap.c |  22 +-
 drivers/media/test-drivers/vivid/vivid-touch-cap.h |  22 +-
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c   |  26 +-
 drivers/media/test-drivers/vivid/vivid-vbi-cap.h   |  22 +-
 drivers/media/test-drivers/vivid/vivid-vbi-out.c   |  22 +-
 drivers/media/test-drivers/vivid/vivid-vbi-out.h   |  18 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   | 114 +++---
 drivers/media/test-drivers/vivid/vivid-vid-cap.h   | 117 +++++--
 .../media/test-drivers/vivid/vivid-vid-common.c    |  24 +-
 .../media/test-drivers/vivid/vivid-vid-common.h    |  34 +-
 drivers/media/test-drivers/vivid/vivid-vid-out.c   | 122 ++++---
 drivers/media/test-drivers/vivid/vivid-vid-out.h   |  95 +++--
 drivers/media/usb/airspy/airspy.c                  |  37 +-
 drivers/media/usb/au0828/au0828-video.c            |  74 ++--
 drivers/media/usb/cx231xx/cx231xx-417.c            |  28 +-
 drivers/media/usb/cx231xx/cx231xx-video.c          |  79 +++--
 drivers/media/usb/cx231xx/cx231xx.h                |  39 ++-
 drivers/media/usb/dvb-usb/cxusb-analog.c           |  48 ++-
 drivers/media/usb/em28xx/em28xx-video.c            |  87 +++--
 drivers/media/usb/go7007/go7007-v4l2.c             |  75 ++--
 drivers/media/usb/gspca/gspca.c                    |  51 ++-
 drivers/media/usb/hackrf/hackrf.c                  |  39 ++-
 drivers/media/usb/hdpvr/hdpvr-video.c              |  60 ++--
 drivers/media/usb/msi2500/msi2500.c                |  31 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |  98 ++++--
 drivers/media/usb/pwc/pwc-v4l.c                    |  44 ++-
 drivers/media/usb/s2255/s2255drv.c                 |  55 ++-
 drivers/media/usb/stk1160/stk1160-v4l.c            |  40 ++-
 drivers/media/usb/usbtv/usbtv-video.c              |  24 +-
 drivers/media/usb/uvc/uvc_metadata.c               |  17 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |  59 +++-
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   2 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |  66 ++++
 drivers/media/v4l2-core/v4l2-fh.c                  |   6 +
 drivers/media/v4l2-core/v4l2-ioctl.c               | 381 +++++++++++----------
 drivers/media/v4l2-core/v4l2-mem2mem.c             |  56 +--
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  72 ++--
 drivers/staging/media/av7110/av7110_v4l.c          |  60 +++-
 .../media/deprecated/atmel/atmel-isc-base.c        |  33 +-
 drivers/staging/media/imx/imx-media-capture.c      |  53 ++-
 drivers/staging/media/imx/imx-media-csc-scaler.c   |  23 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |  29 +-
 drivers/staging/media/ipu7/ipu7-isys-video.c       |  30 +-
 drivers/staging/media/meson/vdec/vdec.c            |  26 +-
 drivers/staging/media/starfive/camss/stf-video.c   |  18 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  29 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c      |  24 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c       |   9 +-
 drivers/staging/media/tegra-video/vi.c             |  68 ++--
 drivers/staging/most/video/video.c                 |  39 ++-
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  |  58 ++--
 drivers/usb/gadget/function/uvc_v4l2.c             |  50 ++-
 include/media/v4l2-ctrls.h                         |   5 +-
 include/media/v4l2-dev.h                           |  84 +++++
 include/media/v4l2-fh.h                            |   2 +
 include/media/v4l2-ioctl.h                         | 238 ++++++-------
 include/media/v4l2-mem2mem.h                       |  48 ++-
 include/media/videobuf2-v4l2.h                     |  33 +-
 227 files changed, 5946 insertions(+), 3322 deletions(-)
---
base-commit: 680fa38ea3a19131871a90bac05a610e6247d928
change-id: 20250703-vdev-state-0743baa0ad4b

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


