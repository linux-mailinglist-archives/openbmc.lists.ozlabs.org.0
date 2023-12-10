Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6780DF5B
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 00:18:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpyMq4kqmz3c3H
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 10:17:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpJzY1CDXz3cSJ
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 09:13:13 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCS2a-0006OU-5i; Sun, 10 Dec 2023 23:12:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCS2S-00ExXo-CA; Sun, 10 Dec 2023 23:12:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCS2S-000RVl-1s; Sun, 10 Dec 2023 23:12:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 00/12] hwrng: Convert to platform remove callback returning 
Date: Sun, 10 Dec 2023 23:12:15 +0100
Message-ID: <cover.1702245873.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=aN2uTP9pET0YKd8ErrSoTK5vjrK84yOnSnlqPftwp5U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBldje/IGRTw6Qp6aopoOZNEu5aabfn86EmYir5f 1EWoJBaSb6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXY3vwAKCRCPgPtYfRL+ TiWpB/0QkgCxo9rWPPZuG0mV+7+gEk/GZc38dQ5EFWJhV8Stqce7VjU2EH4481MoRPnL/0AXAPH XiiR4C7gz2B/1olwgpo6lWRPxtxXYx6Sd3+aWvOsfgqAW/q4OjcKyEk3xg48rrbtLvf1xoWFo7y 0fw9lVR0RmrbvnjwaTKkcDngwN7dAD8Qflw7z7gflMyrKN0MFgRgzwvvbuD5RqWmP2ZVOJM4GRh 0k+qapzlIcA2ElXaxL07bXhanFkd0Mdw38vbHTh4dy8RCryXCfaxbiWkCskcDwfQzZ0FlwQLcQS Fb2Sj2N3HmsMlw8S8d8sC9OF1ybvnjz5+54B3FySEScCa9Gv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Mailman-Approved-At: Tue, 12 Dec 2023 10:16:50 +1100
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Tomer Maimon <tmaimon77@gmail.com>, Martin Kaiser <martin@kaiser.cx>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alim Akhtar <alim.akhtar@samsung.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Hadar Gat <hadar.gat@arm.com>, Deepak Saxena <dsaxena@plexity.net>, kernel@pengutronix.de, Yangtao Li <frank.li@vivo.com>, Yu Zhe <yuzhe@nfschina.com>, Andrei Coardos <aboutphysycs@gmail.com>, =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, Tali Perry <tali.perry1@gmail.com>, Alexandru Ardelean <alex@shruggie.ro>, linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-crypto@vger.kernel.or
 g, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gatien Chevallier <gatien.chevallier@foss.st.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

this series converts all hwrng platform drivers to use .remove_new.
See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for details and the eventual goal.

All driver conversions are trivial as all their remove callbacks return
0 (as good drivers should do).

All patches are pairwise independant. These patches should go in via the
usual hwrng tree. It's merge window material.

Best regards
Uwe

Uwe Kleine-König (12):
  hwrng: atmel - Convert to platform remove callback returning void
  hwrng: cctrng - Convert to platform remove callback returning void
  hwrng: exynos - Convert to platform remove callback returning void
  hwrng: ingenic - Convert to platform remove callback returning void
  hwrng: ks-sa - Convert to platform remove callback returning void
  hwrng: mxc - Convert to platform remove callback returning void
  hwrng: n2 - Convert to platform remove callback returning void
  hwrng: npcm - Convert to platform remove callback returning void
  hwrng: omap - Convert to platform remove callback returning void
  hwrng: stm32 - Convert to platform remove callback returning void
  hwrng: timeriomem - Convert to platform remove callback returning void
  hwrng: xgene - Convert to platform remove callback returning void

 drivers/char/hw_random/atmel-rng.c      | 6 ++----
 drivers/char/hw_random/cctrng.c         | 6 ++----
 drivers/char/hw_random/exynos-trng.c    | 6 ++----
 drivers/char/hw_random/ingenic-rng.c    | 6 ++----
 drivers/char/hw_random/ks-sa-rng.c      | 6 ++----
 drivers/char/hw_random/mxc-rnga.c       | 6 ++----
 drivers/char/hw_random/n2-drv.c         | 6 ++----
 drivers/char/hw_random/npcm-rng.c       | 6 ++----
 drivers/char/hw_random/omap-rng.c       | 6 ++----
 drivers/char/hw_random/stm32-rng.c      | 6 ++----
 drivers/char/hw_random/timeriomem-rng.c | 6 ++----
 drivers/char/hw_random/xgene-rng.c      | 6 ++----
 12 files changed, 24 insertions(+), 48 deletions(-)


base-commit: bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
-- 
2.42.0

