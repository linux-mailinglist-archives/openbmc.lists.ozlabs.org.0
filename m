Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A962521D
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 05:03:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7lSN6PfNz3dvF
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 15:03:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=SvUqyk26;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=SvUqyk26;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7lKj34wDz2xZ7
	for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 14:58:01 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id CA802C08;
	Thu, 10 Nov 2022 19:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1668139075;
	bh=Q1N6Lr7AVNTNE20zEQswX3RXyOyQegJwWelCM9tk/9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SvUqyk26OTxrax5ZQbNlHqXRraUlWYGD1r8GaFAJD+BfjcPMUabZHEPxIULzyQjGF
	 o8mYPFNfilbkHLpDn1G06nLuJ5j/voCtMsom2sk6hdUr+kWbGbXg7kle6AgP3vQyLo
	 k82Z2Kk/HZ2TmQHEjUfc9pA76+wkL265/feTGSPY=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.0 5/7] Revert "hwmon: (pmbus) Add regulator supply into macro"
Date: Thu, 10 Nov 2022 19:57:45 -0800
Message-Id: <20221111035747.31663-6-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111035747.31663-1-zev@bewilderbeest.net>
References: <20221111035747.31663-1-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>, Marcello Sylvester Bauer <sylv@sylv.io>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Guenter Roeck <linux@roeck-us.net>

This reverts commit 54cc3dbfc10dc3db7cb1cf49aee4477a8398fbde.

Zev Weiss reports that the reverted patch may cause a regulator
undercount. Here is his report:

... having regulator-dummy set as a supply on my PMBus regulators
(instead of having them as their own top-level regulators without
an upstream supply) leads to enable-count underflow errors when
disabling them:

    # echo 0 > /sys/bus/platform/devices/efuse01/state
    [  906.094477] regulator-dummy: Underflow of regulator enable count
    [  906.100563] Failed to disable vout: -EINVAL
    [  136.992676] reg-userspace-consumer efuse01: Failed to configure state: -22

Zev reports that reverting the patch fixes the problem. So let's do that
for now.

Fixes: 54cc3dbfc10d ("hwmon: (pmbus) Add regulator supply into macro")
Cc: Marcello Sylvester Bauer <sylv@sylv.io>
Reported-by: Zev Weiss <zev@bewilderbeest.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 1e699e177e339e462cdc8571e3d0fcf29665608e)
---
 drivers/hwmon/pmbus/pmbus.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 7daaf0caf4d3..10fb17879f8e 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -467,7 +467,6 @@ extern const struct regulator_ops pmbus_regulator_ops;
 #define PMBUS_REGULATOR_STEP(_name, _id, _voltages, _step)  \
 	[_id] = {						\
 		.name = (_name # _id),				\
-		.supply_name = "vin",				\
 		.id = (_id),					\
 		.of_match = of_match_ptr(_name # _id),		\
 		.regulators_node = of_match_ptr("regulators"),	\
-- 
2.38.1

