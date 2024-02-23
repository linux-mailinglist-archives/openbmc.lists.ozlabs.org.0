Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F686128E
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 14:19:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th9bS4qbrz3vYs
	for <lists+openbmc@lfdr.de>; Sat, 24 Feb 2024 00:19:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1186 seconds by postgrey-1.37 at boromir; Sat, 24 Feb 2024 00:19:29 AEDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th9b51vnvz3cZL
	for <openbmc@lists.ozlabs.org>; Sat, 24 Feb 2024 00:19:29 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9D-0005Vj-7r; Fri, 23 Feb 2024 13:59:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9B-002QaH-Cu; Fri, 23 Feb 2024 13:59:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9B-00AKBb-0v;
	Fri, 23 Feb 2024 13:59:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 0/5] media: Convert to platform remove callback returning void
Date: Fri, 23 Feb 2024 13:59:03 +0100
Message-ID: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=dNTdMhvFNVyajGGdPnCRtbGM3K5852fvZvh1CYrbK2o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2JaYWAXNZR/7vO+Bhsce5/fJuAZT6zSbuHJIf qyZmLanS2iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdiWmAAKCRCPgPtYfRL+ TsCEB/9hU+G65ugHIoFQGGiGBeQzlf7/ojqYt07VM6PK8HM5TcBKqVYRvdkr2G+JYUPSvJu0XA7 lkRiL1bokmXfTeF9di/aLwQqxGWm2k1n33BvnTAwUyEKs8Ku/WbNPVt3wcsJjXmsVmYob65XB8h XZcxwAx36IZliajjFgcX41VlwYyXbK5xj6QlQU1EnVJoMbrohK/as6V/nIahFkvM3usLvRpx9gn s6jMpbpohpPqfhnWRXXzljkY4193tKWCjbyvf6/oKEPjBn2lzwm+GrQ5XSgB5PM/eHd/zMLRHqj 8KyYqrTwsB2ulA89sHoPOQkHao/DjhfOrr3PBtyMCOHCKs5L
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
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
Cc: Joseph Liu <kwliu@nuvoton.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, Jackson Lee <jackson.lee@chipsnmedia.com>, linux-stm32@st-md-mailman.stormreply.com, NXP Linux Team <linux-imx@nxp.com>, openbmc@lists.ozlabs.org, Jai Luthra <j-luthra@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de, Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, Nas Chung <nas.chung@chipsnmedia.com>, Marvin Lin <kflin@nuvoton.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

this series converts all drivers below drivers/media/platform to struct
platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
Provide a remove callback that returns no value") for an extended
explanation and the eventual goal.

All conversations are trivial, because their .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, so they could be
picked up individually. But I'd hope that they get picked up all
together by Mauro.

Best regards
Uwe

Uwe Kleine-König (5):
  media: chips-media: wave5: Convert to platform remove callback
    returning void
  media: nuvoton: Convert to platform remove callback returning void
  media: nxp: imx8-isi: Convert to platform remove callback returning
    void
  media: stm32-dcmipp: Convert to platform remove callback returning
    void
  media: ti: j721e-csi2rx: Convert to platform remove callback returning
    void

 drivers/media/platform/chips-media/wave5/wave5-vpu.c       | 6 ++----
 drivers/media/platform/nuvoton/npcm-video.c                | 6 ++----
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c        | 6 ++----
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 6 ++----
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c      | 6 ++----
 5 files changed, 10 insertions(+), 20 deletions(-)


base-commit: 33e1d31873f87d119e5120b88cd350efa68ef276
-- 
2.43.0

