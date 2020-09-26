Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B3C27A551
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 04:06:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C05V93LCmzDqWL
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 12:06:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=rikard.falkeborn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RQzNrdvY; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BzKxY68j6zDqLr
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 06:23:57 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id y17so6611416lfa.8
 for <openbmc@lists.ozlabs.org>; Sat, 26 Sep 2020 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5MPEzNOA663F2rbjDyQib41GdeOlEXoHbEZvlfAz7eM=;
 b=RQzNrdvY6AYSPQcJGWRfkOM6T2i/eaj9EGcRCa0kEzvG1P50i4qXD9mvIarbsDRRtf
 SJz2sYkmsOE4Z7294LlKo0QuC+4y71IUr2XBDjYT0rCXRhmZ8IXjr+nsdW8r5kdseA7H
 d3Cf6HPYZ8El9qA2M/zJp85aKxc6lDQ/lqpH0rsQR7ACnf0au6YhRZoP14Csg8+l3eBn
 N9AMjc8X4VpP2aa9vS0642DNQZiGpWOUcL7jKkJlAErXP05y2IbVdz2ivUbY9WeINNkk
 GQMLKkDgwBt5tT3+lWK7hM4M7BE7mVze8e4HSbOWALy1h9iCR2wYeTVo1WhErVhiNho7
 N/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5MPEzNOA663F2rbjDyQib41GdeOlEXoHbEZvlfAz7eM=;
 b=g/ApMnrkvNCPi+0JG5vh27tyiOD+Iw7Nt9+POhrbCiS1ynd2rGN73nHH/G1rM0xxYY
 kHir5A7Jb3ArmE2Bipe+ngBqSBf4FgkW4/y1wznIUPDyFfBbmS1aTL6CgvXSF6cd+mpq
 EhO9fvSk50lIJhF0IEk8bcHmho78DKckhU5apfRJTXQlw3PH2PgTvXkTLagJbzEbDWhL
 mOuMnI6nhecGuIAk8AgVi4j9AHNHa4ybzoT6nW5H8GwT04iYqBMScQSy+hhTZ5z7aD7D
 NNgZiI69W6JlMa9LG2RV5T7qadwgKxdCFWnF42DdrXS/nupvAc9+EX77y10o7NByENml
 t83g==
X-Gm-Message-State: AOAM531QeRqKEJxrw4x/puCjDlm4FDWnOQIUew1l/dsJ/2jhJp9A8/+t
 QqnD77BJAzr5sl9wz8CHQ18=
X-Google-Smtp-Source: ABdhPJwvlM+PuoX2Ouzgz9XavCdjxvsRaA1aV0KE5QcQDoUGGnRIhnb+WJZFgPn01LVFSPzbmotHkg==
X-Received: by 2002:a19:560a:: with SMTP id k10mr1427446lfb.599.1601151831498; 
 Sat, 26 Sep 2020 13:23:51 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se.
 [82.196.111.59])
 by smtp.gmail.com with ESMTPSA id s20sm2108883lfs.135.2020.09.26.13.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 13:23:50 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nuvoton: npcm7xx: Constify static ops structs
Date: Sat, 26 Sep 2020 22:23:42 +0200
Message-Id: <20200926202342.31014-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Sep 2020 12:05:45 +1000
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
Cc: Benjamin Fair <benjaminfair@google.com>, linux-gpio@vger.kernel.org,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The only usage of these structs is to assign their address to various
ops fields in the pinctrl_desc struct, which are const pointers. Make
them const to allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index a935065cdac4..6de31b5ee358 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1601,7 +1601,7 @@ static void npcm7xx_dt_free_map(struct pinctrl_dev *pctldev,
 	kfree(map);
 }
 
-static struct pinctrl_ops npcm7xx_pinctrl_ops = {
+static const struct pinctrl_ops npcm7xx_pinctrl_ops = {
 	.get_groups_count = npcm7xx_get_groups_count,
 	.get_group_name = npcm7xx_get_group_name,
 	.get_group_pins = npcm7xx_get_group_pins,
@@ -1701,7 +1701,7 @@ static int npcm_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinmux_ops npcm7xx_pinmux_ops = {
+static const struct pinmux_ops npcm7xx_pinmux_ops = {
 	.get_functions_count = npcm7xx_get_functions_count,
 	.get_function_name = npcm7xx_get_function_name,
 	.get_function_groups = npcm7xx_get_function_groups,
@@ -1842,7 +1842,7 @@ static int npcm7xx_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	return 0;
 }
 
-static struct pinconf_ops npcm7xx_pinconf_ops = {
+static const struct pinconf_ops npcm7xx_pinconf_ops = {
 	.is_generic = true,
 	.pin_config_get = npcm7xx_config_get,
 	.pin_config_set = npcm7xx_config_set,
-- 
2.28.0

