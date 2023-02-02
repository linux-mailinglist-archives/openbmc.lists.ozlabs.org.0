Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8429B68734E
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 03:19:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6jCM2ldxz3f2q
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 13:19:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=YMJRrGKK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=YMJRrGKK;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6jBm6cHgz3cFH
	for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2023 13:18:40 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C5E923FE;
	Wed,  1 Feb 2023 18:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1675304313;
	bh=M/TiiamgoEuOPBv0/FYKxrV4c/yjfhQRaU4fbng+y9w=;
	h=From:To:Cc:Subject:Date:From;
	b=YMJRrGKKjc/poZmJMmfLqnQg1Pgp1/9mp6URbRZFO5iSMZlZyf5PFaSw1+FdV4k1e
	 tY9+I0asH/MAcBbcPGx+LkQTD8yIX20MSAu+mSdVMzqFj9Ri+nrl3Mz+eZCf9h7s8D
	 N/vLQApfx9yNOr08C9ABA4L8IA6zjGCP6HbNYkRc=
From: Zev Weiss <zev@bewilderbeest.net>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (peci/cputemp) Fix off-by-one in coretemp_label allocation
Date: Wed,  1 Feb 2023 18:18:25 -0800
Message-Id: <20230202021825.21486-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.39.1
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
Cc: linux-hwmon@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jean Delvare <jdelvare@suse.com>, Zev Weiss <zev@bewilderbeest.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, linux-kernel@vger.kernel.org, stable@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The find_last_bit() call produces the index of the highest-numbered
core in core_mask; because cores are numbered from zero, the number of
elements we need to allocate is one more than that.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Cc: stable@kernel.org # v5.18
Fixes: bf3608f338e9 ("hwmon: peci: Add cputemp driver")
---
 drivers/hwmon/peci/cputemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index ec9851daf2e8..f13cc4170f58 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -431,7 +431,7 @@ static int create_temp_label(struct peci_cputemp *priv)
 	unsigned long core_max = find_last_bit(priv->core_mask, CORE_NUMS_MAX);
 	int i;
 
-	priv->coretemp_label = devm_kzalloc(priv->dev, core_max * sizeof(char *), GFP_KERNEL);
+	priv->coretemp_label = devm_kzalloc(priv->dev, (core_max + 1) * sizeof(char *), GFP_KERNEL);
 	if (!priv->coretemp_label)
 		return -ENOMEM;
 
-- 
2.39.1.236.ga8a28b9eace8

