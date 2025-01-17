Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC238A16674
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 06:58:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc0556hbMz3c7R
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:58:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737107081;
	cv=none; b=e2BNsLQVE2kO6DBfCi1y/RvucakWnf6Ae3qZ3EN6F5SA9ejGRJSwt03TnqLHsTA/8h5g3gtH0IXREjryAWe+ALhf5wbpuBRRX7L2fR2J4ZZXub/Xa4KlV98zhG9vkZmq9NLlNPTmHRUyoZYwz4o+QhqXkZ95PFzTqH7x8olSp85BOAKSPTQkC5lLzbGJgKbc71jDF/5CLWlDlnWZw5/ANwiLHZIO7xeHFW7dSpO0NotySb17p8U9h4mnho53xcY7zGQSUfsgCDRWybit0c/JVH8AHJ6KDYf/j6kZ9qdP5KcCqcZB4QngWpCOVsAx/K2AqyBoyo7yVBFiw9Ne6MhU0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737107081; c=relaxed/relaxed;
	bh=HpanrZa2wclQWiIHg4/MRBEQnvbyg0RqkGfjqG6EB6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLOm+5TiCw23sVyOO5ERT8ABZEtt1kQYRzSQlzR9W/8Nf5n9DowU51EzBg4jDdO50QMRFCvsn4c3f446b3JFA5bJwa4dsYFoJlzYum720iC5N8fYE5G5n2hr4ueAtSl62OtX3Bi4yVH0f2k9zbh2qlLhjZX86onPW9JKl+XGmhHIJ3s40O1bkuaAiWmA5Wc27Mm154VJqzifpi/rIXXwg7uuBURB0sh7LyH/605Zyy7uXJBZlr84p0g75SIJ3A4ykPRcc1ZXOvyTgpKpPsmFgDrXEe5hYfv76RcsCMoLrvleKyRNQphTitDtnevx+QFLT+59G3+Qh/9iMAYIAGf6Dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=RuZq9I90; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=RuZq9I90;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZFFM0P2Tz3cjS
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2025 20:44:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=HpanrZa2wclQWiIHg4/MRBEQnvbyg0RqkGfjqG6EB6U=; b=RuZq9I
	90YGsTnK0FMZ97ROBJINTf8Zgem6+82+31rOJSS3UPzRQ3O+yRbfbxtFWm2VrnHZ0LtNMYSdLoMMk
	mupd5XzDm7uiU5fYx0J5WABm+zhPE0ocaKeR+WURLGNuhGD15VC4AmntBAtE0+gOlyH43C4VPSp2w
	t0uigcdsisSaVvQqy3ikm1TunVT7vSaR+C8X+O30KUaCSJj51iqfHSRkqQM4fFp5VbEo5HshiI0cc
	Jmz1mCPKsFS/gqoIsaCFnc0fzgZ58u+vlsBggDr6UmzMaeEXkw4OVI6oEWncwiu7Uh1u5flNLJ4G+
	ho519hEopIrs9YsC4XKJABpm+3CQ==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu2-000A1S-Vt; Fri, 17 Jan 2025 10:44:35 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 02/12] misc: i2c_eeprom: support DT pagesize property
Date: Fri, 17 Jan 2025 10:44:21 +0100
Message-ID: <20250117094434.16641-3-tan.siewert@hetzner.com>
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

Read the page size from DT when available.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Heiko Schocher <hs@denx.de>
(cherry picked from commit a29034d1e6d1c1535055f455b5af5906a7edbc04)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 drivers/misc/i2c_eeprom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index 29ad87c1d7b..ce2cad44d8d 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -50,6 +50,12 @@ static int i2c_eeprom_std_ofdata_to_platdata(struct udevice *dev)
 {
 	struct i2c_eeprom *priv = dev_get_priv(dev);
 	u64 data = dev_get_driver_data(dev);
+	u32 pagesize;
+
+	if (dev_read_u32(dev, "pagesize", &pagesize) == 0) {
+		priv->pagesize = pagesize;
+		return 0;
+	}
 
 	/* 6 bit -> page size of up to 2^63 (should be sufficient) */
 	priv->pagewidth = data & 0x3F;
-- 
2.47.0

