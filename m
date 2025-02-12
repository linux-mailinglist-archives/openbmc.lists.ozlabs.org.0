Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D1A33325
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 00:04:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtYm829zvz3cW2
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 10:04:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.51.61.247
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739354818;
	cv=none; b=VDiHxu6YKuxzLWKDHo0dy/mUMEgnUMKM/0nwnAAPl/dVN005IuntOpvwc9lPxNnZMizSBJaiJp3xzk7l+sBaqXK3y0H4yUacWNooALGTc/EjSBAFGp2oKS8sZ6Fvb631qgsumaVUtcT7jeL8KzBSrHN+d5wHMw4d6DWzhC4d7qQU7MeVAVE8eqbl085caarHd+6cYjQb0u148uBaZI0OPi9b1A0Gg1GQGBzi6+BiOSZZRRMX5fOX/3OjHx2x5VhoHznQmpsgd2WDnoGyVbrADh8LReW5w9A3wZty0rVR0EIk7Lb8InDUL/3ElbxO8a+PzePYFsWDnx+Mekmxv0PfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739354818; c=relaxed/relaxed;
	bh=dBRvqTeMi3sU1gZt+wAPtdGb9Lc+leWphom8foCgdJA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XhgDHtf82gdiVyqy/dKflpsUTr6kZRwKiJQJi0JqBgeI8/0VHXna0lsZ8qHlAy2rnNj9i1RHFzO+8SasuSJ3kFCmX9P4Fmwf21FDlhLGLepF5jKzsuLRlBAiDBJR+Wa3Ig6d9BouUEkKH3bWX3EToIHWm8+uLIvArfWsRa4wd1JKa6jKaYAZHhEG3usuXk/eo75/vCdnaSYksTh6i09jIXev2Iy5mrK3UM8A0ngXmDDGd3jU9fr+HUARoDKFSsCNn97kH5GrZshQ5JNBOOJDJRlHFl2H4vPyFCSChmaapDxTwhfRfdT0/YlXH10Y0TdF3xpZuttZXpW42Tt76vDAhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass (client-ip=210.51.61.247; helo=ssh247.corpemail.net; envelope-from=hanchunchao@inspur.com; receiver=lists.ozlabs.org) smtp.mailfrom=inspur.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.61.247; helo=ssh247.corpemail.net; envelope-from=hanchunchao@inspur.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 68 seconds by postgrey-1.37 at boromir; Wed, 12 Feb 2025 21:06:57 AEDT
Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtDW50SWDz2xjP
	for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2025 21:06:56 +1100 (AEDT)
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id KES00136;
        Wed, 12 Feb 2025 18:05:36 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Feb 2025 18:05:36 +0800
Received: from locahost.localdomain (10.94.3.204) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Feb 2025 18:05:35 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nuvoton: npcm8xx: Add NULL check in npcm8xx_gpio_fw
Date: Wed, 12 Feb 2025 18:05:32 +0800
Message-ID: <20250212100532.4317-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.3.204]
X-ClientProxiedBy: Jtjnmail201618.home.langchao.com (10.100.2.18) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 2025212180536ac220fe9cd78e875c27752d06b511bb8
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 13 Feb 2025 10:04:21 +1100
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
Cc: Charles Han <hanchunchao@inspur.com>, linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

devm_kasprintf() calls can return null pointers on failure.
But the return values were not checked in npcm8xx_gpio_fw().
Add NULL check in npcm8xx_gpio_fw(), to handle kernel NULL
pointer dereference error.

Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 70e6966049e4..17825bbe1421 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2374,6 +2374,9 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		pctrl->gpio_bank[id].gc.parent = dev;
 		pctrl->gpio_bank[id].gc.fwnode = child;
 		pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
+		if (pctrl->gpio_bank[id].gc.label == NULL)
+			return -ENOMEM;
+
 		pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
 		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].gc.direction_input;
 		pctrl->gpio_bank[id].gc.direction_input = npcmgpio_direction_input;
-- 
2.43.0

