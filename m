Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1A6E966E
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 07:36:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472zHs0dGXzF1JL
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 17:36:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ARsAdfvG"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472zCc1dbLzF3V3
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:44 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id w3so779667pgt.5
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 23:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sTzQSV/7sRPq35TdzhWjtH6nxsSmk5rc/lmVue61QIA=;
 b=ARsAdfvGwNBFfF/2LyHY8sP4YvLXrxqf+LCufHJopeZevUT9XnDwujtLg2ZHuBqdWy
 PETt3s1+1qVXJMtcv0cQgJ5e99Wor9Fa7+mE+G5Qtu2QVl4R3vxKTQXEqtXpunGCprwR
 NldRxTV4btMPDpBNIfjtTn0fzRz5S/MTvUGKhKnCJlChtSEzDn0KsXt8yarLWeIOYSCd
 yT1psK02SwDvA1Nt5bYTzn4D1eOJWhXY5107dbdMjmzwKACPuI169xVvpDrA1ppGR65W
 0ocVHNRiHEixw0uJDOMYbDII4LmEFrnq92xjyGtwIF0+xlpjAy0pe83Hu7oLWj7UIYJ1
 Eplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sTzQSV/7sRPq35TdzhWjtH6nxsSmk5rc/lmVue61QIA=;
 b=GUiTTfiKXA6dWqy7OFSp8z0b/qwSS5WpCQLsWrHG23hxaFxLYu8gz4HMegYydSIBvI
 b94NCUls7Gv6NbzYe2lfMkiKF3zBUI+td+IMyDyCw50stbtCMwF0AWWOWAfFkhMe/XNA
 nCX8ZmUvCn4osa0SvM9UFRGtCj/FcISLF6J5DNIuUvkeSrvbBnGPHBUDb3rCBIG9urWR
 0+JmcZpfVjB+QlC0Mp1ME1+TmBTgkoty34cQjZe3PcEdi+y6LGzXhncIBnmOtQAfwaxd
 BpLhfUBTddc9YY9scE/8+4MaCt+BaMiRTAEkug0GuJYFhndJFHskhSkJpZf+LGKrpxqw
 lhQA==
X-Gm-Message-State: APjAAAXTCeZzISX43Nxyy2Mgr5wjwCTNkY2rX8xbarmfQpObtNlH6AB8
 +7A9ujr/R0QcgOYs/EimBh0=
X-Google-Smtp-Source: APXvYqzpVnzwwPELJxPgXeJHCjxXfiTZgcb/v0tNab1Ci0ibrDgrY5LFm93Fm/MFdUIFdthUfFakLA==
X-Received: by 2002:a63:5752:: with SMTP id h18mr15163154pgm.312.1572417161581; 
 Tue, 29 Oct 2019 23:32:41 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i102sm1028018pje.17.2019.10.29.23.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 23:32:41 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot aspeed-dev-v2019.04 3/7] aspeed: pinctrl: Add FSI
 support
Date: Wed, 30 Oct 2019 17:02:21 +1030
Message-Id: <20191030063225.11319-4-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030063225.11319-1-joel@jms.id.au>
References: <20191030063225.11319-1-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl_ast2600.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl_ast2600.c b/drivers/pinctrl/aspeed/pinctrl_ast2600.c
index b22f280e6979..e87b33687f51 100644
--- a/drivers/pinctrl/aspeed/pinctrl_ast2600.c
+++ b/drivers/pinctrl/aspeed/pinctrl_ast2600.c
@@ -242,6 +242,14 @@ static struct aspeed_sig_desc pcie_rc_reset_link[] = {
 	{ 0x500, BIT(24), 0 },
 };
 
+static struct aspeed_sig_desc fsi1[] = {
+	{ 0xd48, GENMASK(21, 20), 0 },
+};
+
+static struct aspeed_sig_desc fsi2[] = {
+	{ 0xd48, GENMASK(23, 22), 0 },
+};
+
 static const struct aspeed_group_config ast2600_groups[] = {
 	{ "MAC1LINK", ARRAY_SIZE(mac1_link), mac1_link },
 	{ "MAC2LINK", ARRAY_SIZE(mac2_link), mac2_link },
@@ -282,6 +290,8 @@ static const struct aspeed_group_config ast2600_groups[] = {
 	{ "I2C15", ARRAY_SIZE(i2c15_link), i2c15_link },
 	{ "I2C16", ARRAY_SIZE(i2c16_link), i2c16_link },
 	{ "PCIERC", ARRAY_SIZE(pcie_rc_reset_link), pcie_rc_reset_link },
+	{ "FSI1", ARRAY_SIZE(fsi1), fsi1 },
+	{ "FSI2", ARRAY_SIZE(fsi2), fsi2 },
 };
 
 static int ast2600_pinctrl_get_groups_count(struct udevice *dev)
-- 
2.23.0

