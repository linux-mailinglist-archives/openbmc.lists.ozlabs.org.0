Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFFF60DB7B
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 08:41:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxzjG2lK0z3c3G
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 17:41:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=kg8DlPn/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=kg8DlPn/;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mxzhd6W2gz2ywV
	for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 17:40:33 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8672332E;
	Tue, 25 Oct 2022 23:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1666766428;
	bh=+tJW+gpgj86IWCgX8UBB8B0qRrMwtQ5WPdkZ2zcUEak=;
	h=From:To:Cc:Subject:Date:From;
	b=kg8DlPn/42/A5kCWkpCiuTG/FQ7YUmF6omzOSQCiyVrZnwoIh9kwvPUD52euLv7kJ
	 gVqbSpbNFEZck5eZDZ1zHd2HebSEVSZol9cWsHSm23YncQcoxlOg4lgYV8ybSvLMW5
	 rb++eCKAdUb/iSa2TcHKp+3KIEJpqc8qJ+fCF+uI=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] Revert "config/ast2500: Enable RAM devices"
Date: Tue, 25 Oct 2022 23:40:21 -0700
Message-Id: <20221026064021.16683-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Zhang Jian <zhangjian.3032@bytedance.com>, Joel Stanley <joel@jms.id.au>, Dylan Hung <dylan_hung@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This reverts commit ba91e9df1e16db0d209177148e864c65e58eb00f.

CONFIG_RAM=y currently breaks DRAM initialization on ast2500; Aspeed
recommends against using it [0].

[0] https://lore.kernel.org/openbmc/HK0PR06MB2834AE1581020A5B7CE191839C5B9@HK0PR06MB2834.apcprd06.prod.outlook.com/

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Note that I'm not at all tied to this particular patch as the fix if
the interested parties can agree on better course of action; I'm
mostly just hoping to spur some further conversation given that
currently a vanilla OpenBMC build bricks my ast2500 systems in a way
that's not real easy to recover without a flash programmer.

 configs/evb-ast2500_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index d2a4e835dd12..b83c315e5057 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -64,7 +64,6 @@ CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
 CONFIG_PHY=y
 CONFIG_PINCTRL=y
-CONFIG_RAM=y
 CONFIG_DM_SERIAL=y
 CONFIG_SYS_NS16550=y
 CONFIG_SPI=y
-- 
2.38.1

