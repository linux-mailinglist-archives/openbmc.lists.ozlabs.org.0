Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EC74AC25C
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 16:04:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsqDy5w81z3bSq
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 02:04:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=cfNWMuY6;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aafy2FxS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=cfNWMuY6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=aafy2FxS; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsqDV3YhJz2xBV
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 02:04:26 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 539D33202113;
 Mon,  7 Feb 2022 10:04:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Feb 2022 10:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=1qgKl6N4zhoA08lqEXx3+JopS52gVw
 bVnOMx+Ef8nCE=; b=cfNWMuY6bn2cbE5GXg6eXa1VSQOR+ThxsfvZ0cJ1BjU3h5
 UrgduaiM6eJfUZJnOWszsEHklVeyymXHsdTXgXL2YbDFOJASdhxnT+0hxj6slL78
 fuYd0HRZEV6OGnKrJVntwoEC35vqc+CumI27bfq6a1tgnpyP+c/60HR2Z267k9fE
 Pyg3QKROFY0fPugoHD5bq9U7WJHhsox4qMVNgPRvATUrvlvH4SnRDkJWU4Yh/gpt
 TaTE7zH/17Xb9ObMOfroE9N2BXgexh16GqlsoRW1xj27BDzcOi9jAtoSke5hdIiH
 AmxZMvi4KwWSlstFh3tDhsWp3xkRS0lYba2Rc09g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1qgKl6
 N4zhoA08lqEXx3+JopS52gVwbVnOMx+Ef8nCE=; b=aafy2FxSQV8kYNGHr8Mg45
 VddEOuX98QyJscW8U4UKLI6kdm8Mz2T1BKSmUmMJ0umqJhTK8ohqDcNc7/inJe2b
 j3riFjgkN5rF/LjZyykwrkHA2T9DM+EORWpmLDVWeFPNT0EZwu3v3s1T2G8Hyu20
 mx5MQ0aktcbaPn4WJKU1zyi4PEXp7606buTi0dam4QFuh0ul7vIbVBOufqxGeoP/
 CxH2a05UXoM6Gjn/NKEpKZhczHnQX3hpLpx1pKKTjtGqiY0Tu4z+dqKKaob+7xG3
 Q1HZsoRvnk+yjbd4/phGo3/WGtSkuui1VqJ0DUmVEfhtKw+gvQMdoCiGztEJmoyw
 ==
X-ME-Sender: <xms:9zQBYm6mYqvsZgsKrv3E6vyta8dULu4fsZt9ensvBA7E0XZ9Qt7ILQ>
 <xme:9zQBYv7M5bMkzstoa4cS1ZbxNGj5eg9wbBFrgHApS3HnBq1LGhuyB5TBGwEhDksGD
 ZE3mdZmAAT6EqGFkQ>
X-ME-Received: <xmr:9zQBYlfUjER9ToP3gv9TUlS1FqOUHahXJqOm648HdTkXp1z6ANIWRLBDgSN9mBAQGO_e7X-CiwN2bP9eMbuYZTZ6O55s084VmYlvmga74A9fItF73_qtxW3ZqEobGPVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:9zQBYjL_0y1KWApWHv5BX1xBLKSfIaaPA0uiMXbaOEacM-0L_bAJzA>
 <xmx:9zQBYqJY5tTqGxPr3eaITxy6Fr5oOyVX0va9yUG-V1fiMxIOgo-H3g>
 <xmx:9zQBYkzl80s14q74bpXW0F8CYP7i2SJfUCpGAeRY8uCgvHm3nPmzBA>
 <xmx:9zQBYvHDhd7ALB-CV9x8SuYJdubB7TKMQYEHsfBUAhFqp0o3HgL3yQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 10:04:20 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw: aspeed_gpio: Cleanup stray semicolon after switch
Date: Tue,  8 Feb 2022 01:34:07 +1030
Message-Id: <20220207150409.358888-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220207150409.358888-1-andrew@aj.id.au>
References: <20220207150409.358888-1-andrew@aj.id.au>
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
Cc: peter.maydell@linaro.org, openbmc@lists.ozlabs.org, qemu-arm@nongnu.org,
 clg@kaod.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Not sure how that got there.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/gpio/aspeed_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 911d21c8cfbe..c63634d3d3e2 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -571,7 +571,7 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
                       HWADDR_PRIx"\n", __func__, offset);
         return 0;
-    };
+    }
 }
 
 static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
-- 
2.32.0

