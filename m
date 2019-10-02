Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D6C882C
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 14:18:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jwCq0VfmzDqYM
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 22:18:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cfVL8hQl"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jw6H32sWzDqY1
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 22:13:58 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w8so6516776plq.5
 for <openbmc@lists.ozlabs.org>; Wed, 02 Oct 2019 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oa0C2A2h9VFvNUmh68s1hA63puE+Sj5wheI4OuvxHtc=;
 b=cfVL8hQlcsNYbVzsgGKXkTeVbuxoYA6HwZFZXKifoNuy00f4WzF6EJGa4ldGDGzkiP
 UBIOMHF7kG3ANoyXZg4sQwUa5HZGhsaqXsZUYKcmxOcbY1qtOeTcdIgLi7C9/9mNEOGV
 2Uy6tQ59/5DAoG2ncsIrrObDtpUKMATaNX/Ged1EbIJZWH/l2mkBz4vgmQFadmXATlOG
 yy0YyPdXFeRc0w3osiLBXW2XUVMQ1SlhiewICl0lROa91YY5a8fZvQqpCEwXeR+d4Uhf
 /3xdaoCmIrS7L8G0GpKujd/UaI169jvU2g5LEMuSfSc+BhlqgO5vmdx0CwISnKlTsR4j
 XLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=oa0C2A2h9VFvNUmh68s1hA63puE+Sj5wheI4OuvxHtc=;
 b=YiHrHiJ47MzQ3ft8MWuJaBmo64EIg49+GF7vhmWZUvnQd3qxt0oVxn0jm28B+0V/sO
 wy6y+0Z1Z1TjO/5Rwqe4a1owA7hyN5e68PUf0izKGvWKx6ap0Evy6ls8rj8y2dv1R0Mu
 iqmy0m6fdU0qX995+gtwBfhqAgpovGQtOZX6WZRnYovshwBIwbEAaUIGYu4+QHjJtzA9
 ZmnpdRrcXASWvQbWzM98XAb4d+JT2RsQLhXT8g9210egRgCmT7rnc+KNw58bO2SYLRLj
 IgGBfWop39Y1k6dPfYzxK5s9isFtpCr2s4Vx6+Lwo6OyxUXFPAIN73gu2YjVsDc4gAaL
 11JQ==
X-Gm-Message-State: APjAAAXQP9u+iotQFaydQiVmkLx6raOQHOOVGkTgt/LAXa+sJkEVPHYo
 CNkqtZyPCg3MkaRaGmFoqa5Bayj9Few=
X-Google-Smtp-Source: APXvYqxc3SfR6qggT7lZRsolmoLxDqQ7xdDVNi4xOfWXYadDNlkfYZ+6O4nu7J8C8jbOh5uxegrKcg==
X-Received: by 2002:a17:902:9b83:: with SMTP id
 y3mr3546275plp.25.1570018436282; 
 Wed, 02 Oct 2019 05:13:56 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id p189sm20252344pfp.163.2019.10.02.05.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 05:13:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3] clk: ast2600: Fix enabling of clocks
Date: Wed,  2 Oct 2019 21:43:43 +0930
Message-Id: <20191002121343.12424-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The struct clk_ops enable callback for the aspeed gates mixes up the set
to clear and write to set registers.

Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
This can be tested with Cedric's qemu as of 58b9c85302ad ("aspeed/scu:
Fix W1C behavior") by inspecting SCU090 after a booting the tacoma
machine with the aspeed FSI enabled:

Before:

 $ devmem 0x1e6e2090
 0xFFFFFFF2

After:

 $ devmem 0x1e6e2090
 0xBFEFFFF2
---
 drivers/clk/clk-ast2600.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 63558d5e9f36..9191bc3e78ee 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -269,10 +269,11 @@ static int aspeed_g6_clk_enable(struct clk_hw *hw)
 
 	/* Enable clock */
 	if (gate->flags & CLK_GATE_SET_TO_DISABLE) {
-		regmap_write(gate->map, get_clock_reg(gate), clk);
-	} else {
-		/* Use set to clear register */
+		/* Clock is clear to enable, so use set to clear register */
 		regmap_write(gate->map, get_clock_reg(gate) + 0x04, clk);
+	} else {
+		/* Clock is set to enable, so use write to set register */
+		regmap_write(gate->map, get_clock_reg(gate), clk);
 	}
 
 	if (gate->reset_idx >= 0) {
-- 
2.23.0

