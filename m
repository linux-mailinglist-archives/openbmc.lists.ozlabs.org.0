Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F36DFA16677
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 06:59:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05F5TXXz3g0n
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:58:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737107083;
	cv=none; b=I+ktiCV5XD/MsaBJ5lubFRqKgEN74BMlm+qjyj1CdpAPjojYEbga210DEecbQ3yp0zyahWGUlUEqvvluIbEBX0QbtfmDX/m2U5LsHkcbcDO35yXfjhAUevRv06c/RauPooN84vyko432TKQP57xVOssEf+lD9D59ZxK7dMKF6T1bkoHf6/H1XQfNfAR7BBiejM2sm1Bb0KpmBk0AeAta3NQwSSvbWxI+JODK0rx+olecSks0nNVB/aEtx2LuLSZHK4VKyerR4D8jgv2H5QGKU2QvxbgtIDB0+EYwNFVqWBrVDRilfHkYzLAzEU0+H1fJ7KkWw2Mj+urogSfEzwHUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737107083; c=relaxed/relaxed;
	bh=rM+bQBfncBy6kitQoUVdaT9KpEwH5/FIfpZz0ICBa3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmSlEfbQPidrtqSGfFq7iAmiDaOlHZJ/U4eQkKjOHe32TxcoIYCgI5RoR8/tiGKBKyfo0/mZMELl4hg7eWESkXN02ezvR22bMeNp2NovZBcB5wO17W+PJm3vQcOsJOYQCCw1ICYLAGuJmeWOFczI2awMRbglRNNIAeBFch8Mb1hmcxk4lp71rUY+Z6J3oAEfEjFE0yqD/ZxsEZu2Ovsgl9l2/4rRGjv/skyHrOaG0u0iVOHrYy1eNzweuc52lfRuxYifMbCvpo6Enx1ka3zcYFX6nl6YzMGFx4pAwMBEtBCGBK9g3yqR8r/ISV7mdw7CSqKpLYF6w3aD/hCEovLQuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=KK0njkFW; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=KK0njkFW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZFFP0zSZz3cjr
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 20:44:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=rM+bQBfncBy6kitQoUVdaT9KpEwH5/FIfpZz0ICBa3E=; b=KK0njk
	FWj51HfkpkVL8c2LRvQPGxDA/inpMsO5+EBRctF9QereT9AC5JvgUPhGnQiY/RIAJkq/dHHlDkZmn
	oypikXjuYhc28poArKOCPfRqi+IKIu2NwmMPMTmWPDb9NhwAgmde93JbemE15LMGR9HOXrt+DrMKZ
	Roptzwhpx1awvOaQTs95yATC8iPvR5x4VTaQdWlGSd8n9DONCEtCbGLwoTV7KRVCY2TqX6Su3mi0S
	iF6jPqO24xW8AloMep4m5B3lc9yOS0Sy3iyGUsMeg/K9tPuBREV8m6tMMaLB0X0mdN7H2BvGS2zB/
	L9V9ryVR1NdFZaBGNpRAX0sAaJhg==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu3-000A1S-3v; Fri, 17 Jan 2025 10:44:35 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 03/12] misc: i2c_eeprom: add eeprom write support
Date: Fri, 17 Jan 2025 10:44:22 +0100
Message-ID: <20250117094434.16641-4-tan.siewert@hetzner.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250117094434.16641-1-tan.siewert@hetzner.com>
References: <20250117094434.16641-1-tan.siewert@hetzner.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: tom.siewert@hetzner.com
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 20 Jan 2025 16:58:31 +1100
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
Cc: Baruch Siach <baruch@tkos.co.il>, Heiko Schocher <hs@denx.de>, Tan Siewert <tan.siewert@hetzner.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Baruch Siach <baruch@tkos.co.il>

Write up to page size in each i2c transfer.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Heiko Schocher <hs@denx.de>
(cherry picked from commit 84c80c63d53bc8a7779b1e7e7084ee3b2d20e768)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 drivers/misc/i2c_eeprom.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index ce2cad44d8d..f25d0540075 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <linux/err.h>
+#include <linux/kernel.h>
 #include <dm.h>
 #include <i2c.h>
 #include <i2c_eeprom.h>
@@ -38,7 +39,24 @@ static int i2c_eeprom_std_read(struct udevice *dev, int offset, uint8_t *buf,
 static int i2c_eeprom_std_write(struct udevice *dev, int offset,
 				const uint8_t *buf, int size)
 {
-	return -ENODEV;
+	struct i2c_eeprom *priv = dev_get_priv(dev);
+	int ret;
+
+	while (size > 0) {
+		int write_size = min_t(int, size, priv->pagesize);
+
+		ret = dm_i2c_write(dev, offset, buf, write_size);
+		if (ret)
+			return ret;
+
+		offset += write_size;
+		buf += write_size;
+		size -= write_size;
+
+		udelay(10000);
+	}
+
+	return 0;
 }
 
 static const struct i2c_eeprom_ops i2c_eeprom_std_ops = {
-- 
2.47.0

