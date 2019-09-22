Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FDABA2AD
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 14:38:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bn6x6K6CzDqPf
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 22:38:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KET8opnk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ulcj1wxa"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bn4r6q1MzDqP7
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 22:36:28 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 98E8E210D8;
 Sun, 22 Sep 2019 08:36:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 22 Sep 2019 08:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Pm0kXIjD5EnSX
 CMvxmhv05EI+M+VF9thTQPnyey0/W0=; b=KET8opnk8xlrLsVWJprRI+NUsH7R4
 R1x+FXbxOTOD3/fobol7JLZMBjmQMYD7aK4+ldGYdtD8EQkkXTev32IkH7AxUM1A
 +icxUw0dXtMnUvi3EBsAFQIty5kDAwHotxOtrM+LlZTW3tMMsqgTSJPJarVk8iGK
 YkEt/RPy/0Aj1nXDfC3gIOuZb1WOQNeJsl9Id2xmT1ksMy1JQ3Gq0wGPTaFY0aU7
 MFynPH+7f6CCYaugXuYI+mxyrhAvQaANdRiBjuUR0H5a8vRa3PNiXkdddAv20uWo
 1LDYnuYk03HTIq1gX1g82bhOwRNMKbZKfZ7AfvWbSGRIAQTTinNSB2okg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Pm0kXIjD5EnSXCMvxmhv05EI+M+VF9thTQPnyey0/W0=; b=Ulcj1wxa
 gDLzRalrsw8oY4ptLW9eOiT10UXMkC3/ZDOYYucZzz4h3Cq5QHoGNFkQGvcDZwIU
 S95xX5gH2Zythg9Lw4w/ytHK+6HYh33wycFCYVngH9rRHj4AsuOyJHkVrEXOJOCo
 xrij7s54gUyPdG6J4nnSjONJkCONsIO/vP7TVcz68KJv6MMyd9FE2RqH1Z2BBUKS
 rUYZNSOQ0jHda7sWF3hjHhuBcJCtI78HYnb4lrJxop2HlA71XqCKpCvHlX9NMeVu
 aLzsZNZiibh4VK4HVI7CfIil44W/5tSgd906Vggwoso6Gfx7PJvWtA8fVCLVD6Mq
 MLztHcPX/ubHYw==
X-ME-Sender: <xms:ymqHXdpIqFrSqi7h4-Wo_n1ciL_3LBWFU8dU4yMEW4BfTigSa2fgEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepud
X-ME-Proxy: <xmx:ymqHXSAHheONpyQRxylmCtagw8zV726fCcGJXgZdtHrrcC68Qk1HLw>
 <xmx:ymqHXTfKHa9H9EqdbjXO76b1lvbYX_Jdb_Nh4Jn-5ZwMdw9GGSmAFg>
 <xmx:ymqHXcAu0ftqdMkevWIDYPuFgJvBA61er9QduUYJDCozQESivQ-o2Q>
 <xmx:ymqHXR5iAR3OA3soia0a9y0MrUBrUmsSSSMuJRFwE1sZpCzGcr1pRA>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id C769880059;
 Sun, 22 Sep 2019 08:36:24 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 3/6] dt-bindings: clock: Add AST2600 RMII RCLK
 gate definitions
Date: Sun, 22 Sep 2019 22:06:57 +0930
Message-Id: <20190922123700.749-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922123700.749-1-andrew@aj.id.au>
References: <20190922123700.749-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2600 has an explicit gate for the RMII RCLK for each of the four
MACs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 include/dt-bindings/clock/ast2600-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 38074a5f7296..ac567fc84a87 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -84,6 +84,11 @@
 #define ASPEED_CLK_MAC34		65
 #define ASPEED_CLK_USBPHY_40M		66
 
+#define ASPEED_CLK_GATE_MAC1RCLK	67
+#define ASPEED_CLK_GATE_MAC2RCLK	68
+#define ASPEED_CLK_GATE_MAC3RCLK	69
+#define ASPEED_CLK_GATE_MAC4RCLK	70
+
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
 #define ASPEED_RESET_JTAG_MASTER2	54
-- 
2.20.1

