Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40761260D16
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 10:09:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlyTr3KtszDqCY
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 18:09:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=crapouillou.net (client-ip=89.234.176.41; helo=crapouillou.net;
 envelope-from=paul@crapouillou.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=crapouillou.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=rfr/QNV5; 
 dkim-atps=neutral
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhzDs5nj0zDqjg
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 21:32:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1599132362; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=SR+iHQciNK1Dv29p/vdSQ9gduW5dmKiBTrl2NLxMY20=;
 b=rfr/QNV5RzywkcrtwTfLhKPhjdrJfEhu9mfs28GozR5K5U8TlPo9A01AW4BtxUR0RBNi1G
 wp1us28vEA+MBOzKHcKM5g0SmOT77V5i42hS1PHUdaVWF/CjlRncgOuu0whBvXUbmSWVwR
 h6uZjr6MxNY4Y4dlFC9WpuGu+k9PXQk=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <Peter.Chen@nxp.com>,
 Cristian Birsan <cristian.birsan@microchip.com>,
 Felipe Balbi <balbi@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Alan Stern <stern@rowland.harvard.edu>, Tony Prisk <linux@prisktech.co.nz>,
 Bin Liu <b-liu@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 00/20] usb: Use new pm_ptr() macro
Date: Thu,  3 Sep 2020 13:25:34 +0200
Message-Id: <20200903112554.34263-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2020 17:47:25 +1000
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
Cc: Paul Cercueil <paul@crapouillou.net>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The pm_ptr() macro was introduced to avoid conditional compilation of
the PM code. Instead of having the .suspend/.resume functions compiled
conditionally if CONFIG_PM_SLEEP, they are now always visible by the
compiler, which can then detect bugs, and will be discarded if unused.

Cheers,
-Paul

Paul Cercueil (20):
  usb/host: ohci-platform: Use pm_ptr() macro
  usb/host: ehci-spear: Use pm_ptr() macro
  usb/host: ehci-npcm7xx: Use pm_ptr() macro
  usb/host: ehci-platform: Use pm_ptr() macro
  usb/cdns3: core: Use pm_ptr() macro
  usb/chipidea: core: Use pm_ptr() macro
  usb/misc: usb3503: Use pm_ptr() macro
  usb/misc: usb4604: Use pm_ptr() macro
  usb/musb: am35x: Use pm_ptr() macro
  usb/musb: da8xx: Use pm_ptr() macro
  usb/musb: musb_dsps: Use pm_ptr() macro
  usb/musb: ux500: Use pm_ptr() macro
  usb/phy: am335x: Use pm_ptr() macro
  usb/phy: mxs-usb: Use pm_ptr() macro
  usb/gadget/udc: atmel: Use pm_ptr() macro
  usb/gadget/udc: bdc: Use pm_ptr() macro
  usb/gadget/udc: mv-u3d: Use pm_ptr() macro
  usb/gadget/udc: pch: Use pm_ptr() macro
  usb/gadget/udc: renesas: Use pm_ptr() macro
  usb/gadget/udc: snps: Use pm_ptr() macro

 drivers/usb/cdns3/core.c                | 13 ++++---------
 drivers/usb/chipidea/core.c             | 26 +++++++++++--------------
 drivers/usb/gadget/udc/atmel_usba_udc.c |  8 +++-----
 drivers/usb/gadget/udc/bdc/bdc_core.c   |  9 +++------
 drivers/usb/gadget/udc/mv_u3d_core.c    |  8 +++-----
 drivers/usb/gadget/udc/pch_udc.c        | 11 +++--------
 drivers/usb/gadget/udc/renesas_usb3.c   |  8 +++-----
 drivers/usb/gadget/udc/snps_udc_plat.c  | 16 +++++----------
 drivers/usb/host/ehci-npcm7xx.c         |  8 +++-----
 drivers/usb/host/ehci-platform.c        |  8 +++-----
 drivers/usb/host/ehci-spear.c           |  8 +++-----
 drivers/usb/host/ohci-platform.c        | 19 ++++++++----------
 drivers/usb/misc/usb3503.c              | 18 ++++++++---------
 drivers/usb/misc/usb4604.c              |  8 +++-----
 drivers/usb/musb/am35x.c                |  8 +++-----
 drivers/usb/musb/da8xx.c                |  8 +++-----
 drivers/usb/musb/musb_dsps.c            | 20 +++++++------------
 drivers/usb/musb/ux500.c                |  8 +++-----
 drivers/usb/phy/phy-am335x.c            |  8 +++-----
 drivers/usb/phy/phy-mxs-usb.c           | 11 +++++------
 20 files changed, 87 insertions(+), 144 deletions(-)

-- 
2.28.0

