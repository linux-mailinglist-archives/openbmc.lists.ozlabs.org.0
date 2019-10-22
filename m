Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38550DFCD5
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 06:48:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y1HG0GMNzDqKZ
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 15:48:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WIHwWeW9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mLBkEL8t"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y1FJ1yJ4zDqKf
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 15:47:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F06A214DB;
 Tue, 22 Oct 2019 00:46:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 22 Oct 2019 00:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=qzsQfnMdhewZW
 GX1d+QhaLheA7ai/xnWBuWwM4pOlMM=; b=WIHwWeW9T4OB3xbXUT2AhfIH7yy4d
 U+yad433oaTG/vxtW8VbyhCDBtNjiDP2C1PrHUa6dkB25PVzi0Y5Gzjex/O35RRZ
 MQRf2ykurH7lU/WgeS9zECIOR6He0l3nA2IleKYu5okkpsso/hhh9pglZXfqoeL5
 +2iQFcuERT8e3hFbc1gLQKWTRa40GN/1tWwD88irbXg3FXF3jBnqKL7FZI/iDizY
 wIuAA/WcMZcgr7GhEjIbsjdE11phwTpxEQALTTR4jhmP8dcpTNF8VDgCxq1FeO4r
 mtKnFs8ZdDg3eMXHAmPxvEHltolMkJSJIgdMWjqswklO+/14xqNNjXahw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qzsQfnMdhewZWGX1d+QhaLheA7ai/xnWBuWwM4pOlMM=; b=mLBkEL8t
 IpOgZ8B5lKRUbgnzrZ9FZY47rXzxzJRO8KzfD1uNn9Q7Vj/fXQ5kUvr2P4HNDHnw
 /XUpafGIGahLzZSN1G3wymV1loEwO9oJHnsLY5tFoE41z9Gf+zRQvZVc8frJoucF
 wgtPBEw2ovdMZIyI0ZX1yV2JHL29APmMKJr1eHev5tncyMpJwkgklTAUE4lOuT5B
 cfG3wbL/YVsAJZUN2RrBkdYnE0E5XZWDRfKtyEn93qOSXIabGLusa+OcqwuDBsPg
 fBfeS64wYFIBuTUOcGSy0eBWLAhsQu0dW2RsXFQ6tosiW+oCKmr9KZHEOFLtnBEI
 OawAOUamvxmxHQ==
X-ME-Sender: <xms:wYmuXRMkEnPSKQfOCL7lbRi5COl8-cj5lT2WMAx832AEL-RjtMs4jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeeigdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrvdeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 vd
X-ME-Proxy: <xmx:wYmuXbAzSyaE1TI2C3v4CI5lSgnRlJz11NRss-bLpktm0Vil8XoE7w>
 <xmx:wYmuXUjT67P6PtoMyn47sgwjV4QTSJJCSD1lrSjH-DY-j7JQQRz-bg>
 <xmx:wYmuXQeCIEJnY7GtegrOj6J-iZgSa0l0oN469Lp7L3PDWnvo2Tt1Sw>
 <xmx:wYmuXeNUgKzW-E2JTv6S6L8E3QXqGeWbHYDNyLpVz9O8puuFkGE5ng>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id 62BB380060;
 Tue, 22 Oct 2019 00:46:56 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 3/4] ARM: dts: tacoma: Hog LPC pinmux
Date: Tue, 22 Oct 2019 15:47:36 +1100
Message-Id: <20191022044737.15103-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022044737.15103-1-andrew@aj.id.au>
References: <20191022044737.15103-1-andrew@aj.id.au>
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

Requesting pinmux configuration is done at driver probe time. The LPC IP
is composed of many sub-devices, each with their own driver, and no
driver exists for the entire IP block. Avoid having each sub-device
request the LPC pinmux by just hogging it in the pinctrl node.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index bf363a735232..e51e8839bd56 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -792,3 +792,10 @@
 &wdt2 {
 	status = "okay";
 };
+
+&pinctrl {
+	/* Hog these as no driver is probed for the entire LPC block */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpc_default>,
+		    <&pinctrl_lsirq_default>;
+};
-- 
2.20.1

