Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B069D6CB1EB
	for <lists+openbmc@lfdr.de>; Tue, 28 Mar 2023 00:46:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlnxY3jKnz3fSR
	for <lists+openbmc@lfdr.de>; Tue, 28 Mar 2023 09:46:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=jCYRA/Zj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=jCYRA/Zj;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Plnwv464vz3c72
	for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2023 09:46:23 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-172-149.tukw.qwest.net [174.21.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5564E6E0;
	Mon, 27 Mar 2023 15:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1679957174;
	bh=L6bjh3nzL4FxrijRbntIGwR2Sk25I75O/1vW83a/498=;
	h=From:To:Cc:Subject:Date:From;
	b=jCYRA/ZjowslwnigucIbcVrhRDs3MlStV70ahHY9IK2AFPen/Tl02fwfd7LohvJ3F
	 QjcbS7xr97W/NusH2F5kThyT4NzeL5Ebi5ewls0g//4GjSlvmE3Z9TARMQ2K8Sw7JI
	 yhmsx45XSTHh84TbtgX0qTKjlg6s9PYzLyAFKikI=
From: Zev Weiss <zev@bewilderbeest.net>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH] peci: Constify struct peci_controller_ops
Date: Mon, 27 Mar 2023 15:43:15 -0700
Message-Id: <20230327224315.11135-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Zev Weiss <zev@bewilderbeest.net>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

As with most ops structs, we never modify it at runtime, and keeping
function pointers in read-only memory is generally a good thing
security-wise.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/peci/controller/peci-aspeed.c | 2 +-
 drivers/peci/core.c                   | 4 ++--
 include/linux/peci.h                  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
index 731c5d8f75c6..7fdc25afcf2f 100644
--- a/drivers/peci/controller/peci-aspeed.c
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -468,7 +468,7 @@ static void aspeed_peci_property_setup(struct aspeed_peci *priv)
 				      ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT, &priv->cmd_timeout_ms);
 }
 
-static struct peci_controller_ops aspeed_ops = {
+static const struct peci_controller_ops aspeed_ops = {
 	.xfer = aspeed_peci_xfer,
 };
 
diff --git a/drivers/peci/core.c b/drivers/peci/core.c
index 9c8cf07e51c7..0f83a9c6093b 100644
--- a/drivers/peci/core.c
+++ b/drivers/peci/core.c
@@ -44,7 +44,7 @@ int peci_controller_scan_devices(struct peci_controller *controller)
 }
 
 static struct peci_controller *peci_controller_alloc(struct device *dev,
-						     struct peci_controller_ops *ops)
+						     const struct peci_controller_ops *ops)
 {
 	struct peci_controller *controller;
 	int ret;
@@ -113,7 +113,7 @@ static void unregister_controller(void *_controller)
  * Return: Pointer to the newly allocated controller or ERR_PTR() in case of failure.
  */
 struct peci_controller *devm_peci_controller_add(struct device *dev,
-						 struct peci_controller_ops *ops)
+						 const struct peci_controller_ops *ops)
 {
 	struct peci_controller *controller;
 	int ret;
diff --git a/include/linux/peci.h b/include/linux/peci.h
index 06e6ef935297..9b3d36aff431 100644
--- a/include/linux/peci.h
+++ b/include/linux/peci.h
@@ -42,13 +42,13 @@ struct peci_controller_ops {
  */
 struct peci_controller {
 	struct device dev;
-	struct peci_controller_ops *ops;
+	const struct peci_controller_ops *ops;
 	struct mutex bus_lock; /* held for the duration of xfer */
 	u8 id;
 };
 
 struct peci_controller *devm_peci_controller_add(struct device *parent,
-						 struct peci_controller_ops *ops);
+						 const struct peci_controller_ops *ops);
 
 static inline struct peci_controller *to_peci_controller(void *d)
 {
-- 
2.40.0.5.gf6e3b97ba6d2.dirty

