Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A5872455
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 17:29:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq1Gx3fNxz3vhF
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 03:29:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq1Fk1Y33z3vjH
	for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2024 03:28:10 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXde-0003TE-Di; Tue, 05 Mar 2024 17:27:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXdb-004aQ6-BQ; Tue, 05 Mar 2024 17:27:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXdb-000BLT-0m;
	Tue, 05 Mar 2024 17:27:31 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Corey Minyard <minyard@acm.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Joel Stanley <joel@jms.id.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH 0/6] ipmi: Convert to platform remove callback returning void
Date: Tue,  5 Mar 2024 17:26:57 +0100
Message-ID: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=akuyQtqoo/B3hV/chnHG5wVOgTCyAThdceXHF/fH15A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl50fRz5wnO886UiVtmDZppCw512REhKLTJ37/R cjMJ8BIAQOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZedH0QAKCRCPgPtYfRL+ Tt0QCACfWXFQXGllPYlGx99A5WMWmjUJ3qKWPt2/V2+WSj9FOOD4XPVrXQIzPGNpJtaU9YA3azZ TDx31hB9G1IrJRDVStMpNcrqzVTCqVkez6rIqv71yrq9Nkkzm+ljiiwUbpg3q2tXh+g+DwA75b4 +h2OsgZmurirtKIn6Y4bosTeQXrPut2pfqGguD//L/QXtr932vSPJHNsBLXRpmx/kzgiPTV4iWY KQRXsODp+dMAsCr5bF2w3YmA6DV/qfLu/ET6bpsNg7S4KRY8limLnmvP1/gvjyAtrf0x9uNcY4Z ieCRCLSfiQ2a4cy8NcK+q0LYg0TiPcZY4OKxt916rKV9TFrS
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
Cc: Benjamin Fair <benjaminfair@google.com>, linux-aspeed@lists.ozlabs.org, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

this series converts all drivers below drivers/char/ipmi to struct
platform_driver::remove_new(). See commit 5c5a7680e67b ("platform: Provide a
remove callback that returns no value") for an extended explanation and the
eventual goal.

All conversations are trivial, because their .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, so they could be
picked up individually. But I'd hope that they get picked up all
together by Corey.

Best regards
Uwe

Uwe Kleine-König (6):
  ipmi: bt-bmc: Convert to platform remove callback returning void
  ipmi: ipmi_powernv: Convert to platform remove callback returning void
  ipmi: ipmi_si_platform: Convert to platform remove callback returning void
  ipmi: ipmi_ssif: Convert to platform remove callback returning void
  ipmi: kcs_bmc_aspeed: Convert to platform remove callback returning void
  ipmi: kcs_bmc_npcm7xx: Convert to platform remove callback returning void

 drivers/char/ipmi/bt-bmc.c           | 5 ++---
 drivers/char/ipmi/ipmi_powernv.c     | 6 ++----
 drivers/char/ipmi/ipmi_si_platform.c | 6 ++----
 drivers/char/ipmi/ipmi_ssif.c        | 5 ++---
 drivers/char/ipmi/kcs_bmc_aspeed.c   | 6 ++----
 drivers/char/ipmi/kcs_bmc_npcm7xx.c  | 6 ++----
 6 files changed, 12 insertions(+), 22 deletions(-)

base-commit: 11afac187274a6177a7ac82997f8691c0f469e41
-- 
2.43.0

