Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE79660785E
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 15:27:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mv4y55BCSz3dwD
	for <lists+openbmc@lfdr.de>; Sat, 22 Oct 2022 00:27:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mv4xB3Xrjz3c7V
	for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2022 00:26:22 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1olrk5-0001Xp-RL; Fri, 21 Oct 2022 15:07:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1olrk2-000Wlm-JF; Fri, 21 Oct 2022 15:07:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1olrk4-009Z8d-7E; Fri, 21 Oct 2022 15:07:16 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 5/9] rtc: nct3018y: Convert to .probe_new()
Date: Fri, 21 Oct 2022 15:07:02 +0200
Message-Id: <20221021130706.178687-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YlFLu5OUJw4NDw3in/0B6gsTCQDOpTOawwB9KDnQeoM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUplnLP5HT/HvPmi8FNMq+QA1cYckR3YOYITd/r/H aB91hzSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZZwAKCRDB/BR4rcrsCcrOB/ wNfKyV2OQjPzu0FRRw6mkJRB/cFGJfCwU3IaNjz0XxbZ+DCA9uvThjrs2winx8mLhnTZSz9W9u4JSd hEKJAqWJ1jT0jm24c/v8D60vmGJLeG9jEnblO8AR+lU9uT7U4iTbjd3CAZuxwDdzGcXr0d0zF1aiYX 0ObMPU/lv5OReUkf3UuDKldXY0ybhrW0ftxm3q5Dp5qklzySY24AwQeNGY757nvF4NbfVieOYbc8yn 9s95K2ESTquvtSJ6gq3v86QAbPkdRIZkWMQtH8OottzwlGYtCb36p4Ok/Ryp7Cn8UbbvrSuJXDLjLD F3zPCFW4fI1ubwN3t3QCG6x3h6uZSJ
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

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-nct3018y.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index d43acd3920ed..0a3b14c95d90 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -452,8 +452,7 @@ static const struct rtc_class_ops nct3018y_rtc_ops = {
 	.ioctl		= nct3018y_ioctl,
 };
 
-static int nct3018y_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int nct3018y_probe(struct i2c_client *client)
 {
 	struct nct3018y *nct3018y;
 	int err, flags;
@@ -541,7 +540,7 @@ static struct i2c_driver nct3018y_driver = {
 		.name	= "rtc-nct3018y",
 		.of_match_table = of_match_ptr(nct3018y_of_match),
 	},
-	.probe		= nct3018y_probe,
+	.probe_new	= nct3018y_probe,
 	.id_table	= nct3018y_id,
 };
 
-- 
2.37.2

