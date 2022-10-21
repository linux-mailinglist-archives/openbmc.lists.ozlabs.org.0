Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844F60785D
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 15:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mv4xV0r42z3dsq
	for <lists+openbmc@lfdr.de>; Sat, 22 Oct 2022 00:26:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
X-Greylist: delayed 1122 seconds by postgrey-1.36 at boromir; Sat, 22 Oct 2022 00:26:19 AEDT
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mv4x731wsz3c7V
	for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2022 00:26:18 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1olrk5-0001XT-RE; Fri, 21 Oct 2022 15:07:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1olrk1-000WlS-8A; Fri, 21 Oct 2022 15:07:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1olrk2-009Z8M-TP; Fri, 21 Oct 2022 15:07:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>
Subject: [PATCH 0/9] rtc: Convert i2c drivers to .probe_new()
Date: Fri, 21 Oct 2022 15:06:57 +0200
Message-Id: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Bp9OcOyleZeruLKjOH3pBb8HDT/kKtym28YFv41winI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUplWDBoXcgANYtax+ko77biRthvJsAMnEqtUECzW PCWJOd+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZVgAKCRDB/BR4rcrsCXJHB/ 0fYRjl2NwNwf2bWjE2+ckBIEgSYfx/Pv6UopUQ0kuxhk4Uv9RCrjbtxs+6lhExILzXjapnXjaOf/li oF5BIlPo4XE4CuqhobsKBmTs2slrG3BPL39zBbDd3iHjzriSsL3PAqc+C4WqbKhq0erABBIyQFcnqi zplXsL1pEDuQXhLLquWbCZtzIL4baFNE3IUMfYNhoLbSW3NwW26Y0PLflVEHxrKpsgQY6EJfJj3jb+ pElziCA+x7ozhIRWzOQRRDrxXdPxC5oXzTWZhRqOU/QhiFQKgLeJxJVHl30NwdhvaYZEYufKIw/96G 3CRnMxoY5laZlKk65wqLW8IHwDT3JD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
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
Cc: Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>, kernel@pengutronix.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

See commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back
type") for the rationale.

Best regards
Uwe

Uwe Kleine-König (9):
  rtc: abx80x: Convert to .probe_new()
  rtc: ds1307: Convert to .probe_new()
  rtc: isl1208: Convert to .probe_new()
  rtc: m41t80: Convert to .probe_new()
  rtc: nct3018y: Convert to .probe_new()
  rtc: pcf2127: Convert to .probe_new()
  rtc: rs5c372: Convert to .probe_new()
  rtc: rv8803: Convert to .probe_new()
  rtc: rx8025: Convert to .probe_new()

 drivers/rtc/rtc-abx80x.c   | 36 ++++++++++++++++++------------------
 drivers/rtc/rtc-ds1307.c   |  8 ++++----
 drivers/rtc/rtc-isl1208.c  |  6 ++++--
 drivers/rtc/rtc-m41t80.c   | 11 ++++++-----
 drivers/rtc/rtc-nct3018y.c |  5 ++---
 drivers/rtc/rtc-pcf2127.c  | 22 +++++++++++-----------
 drivers/rtc/rtc-rs5c372.c  | 11 ++++++-----
 drivers/rtc/rtc-rv8803.c   | 30 ++++++++++++++++--------------
 drivers/rtc/rtc-rx8025.c   |  6 +++---
 9 files changed, 70 insertions(+), 65 deletions(-)


base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.37.2

