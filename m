Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4F57423F
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 06:23:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk1Yv6FKGz3c3N
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 14:22:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xak1LbDz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xak1LbDz;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk1YN2zByz2yJL;
	Thu, 14 Jul 2022 14:22:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C0286B82373;
	Thu, 14 Jul 2022 04:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28190C3411C;
	Thu, 14 Jul 2022 04:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657772546;
	bh=I/S6MXKj+pJExOorvIiThOlDOL37GW0RHtgnBej/vcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xak1LbDzW3KzB6ZkyWWdNZqxOvwpxZEXDQUjVyY5087A3iQGVEJAAWOvBgbb6tWtV
	 HOCoANuj7eCiK+ac3/PDc+FSVNHyUcQO70EdkhMjezDBFsO2f4qPa8JeFluIswrdtU
	 N1bYAq2hD4Ze7ch4iSUjMG5fBu/gem/EpRNIypc0vgYYGeuuD8HE5IZVKwG9nVEEFF
	 ia4j7vaORdqiegJQcm5e9g9xaIQgNy/RLMUur5sltIigwQ8BN/Q8OGEVbD7fqSBlYQ
	 1ojg/t2ZIvsQMBMUmetDN4LZZkDoJggvc0+U64JGmSAlMaDes+RpVrnMFKE7PSYgSz
	 Nu0M3TWUBZsJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 02/41] pinctrl: aspeed: Fix potential NULL dereference in aspeed_pinmux_set_mux()
Date: Thu, 14 Jul 2022 00:21:42 -0400
Message-Id: <20220714042221.281187-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Haowen Bai <baihaowen@meizu.com>, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Haowen Bai <baihaowen@meizu.com>

[ Upstream commit 84a85d3fef2e75b1fe9fc2af6f5267122555a1ed ]

pdesc could be null but still dereference pdesc->name and it will lead to
a null pointer access. So we move a null check before dereference.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
Link: https://lore.kernel.org/r/1650508019-22554-1-git-send-email-baihaowen@meizu.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index c94e24aadf92..83d47ff1cea8 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -236,11 +236,11 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		const struct aspeed_sig_expr **funcs;
 		const struct aspeed_sig_expr ***prios;
 
-		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
-
 		if (!pdesc)
 			return -EINVAL;
 
+		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
+
 		prios = pdesc->prios;
 
 		if (!prios)
-- 
2.35.1

