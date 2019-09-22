Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5535BA2B1
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 14:40:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bn9H1mXQzDqCw
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 22:40:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eq8/OFu8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SyOWOe1M"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bn4q0SF1zDqP1
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 22:36:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7597C20FE3;
 Sun, 22 Sep 2019 08:36:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 22 Sep 2019 08:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=4L2uciMlwPKw6
 NVgmSskfFKGJ+TIqBRdUNzu7aGn5q0=; b=eq8/OFu80gxEylhTqToD6moii/vUq
 ZKeq+hnrb4HCXsi8RqR0206l0lG27Eb//UikoSBg0YcfNlZEbaaMGDRybs9bjwDq
 8OybWgrZAxLi+JTOoPBXPDzhepldSKaBoKE+/xIX7iP/4EB80q5FZhmnbayCW7FN
 6SPPaQMIay8UytHfUB/pXUliFkf6OMyRheXrIvbBYkCfny+1qbWIejr6cCoj0lPj
 De//rANEPT3aRJ7d2dSdPNjjtOSUXQnEhRvhw4CNOblial++KGH7xObtdNZbPA4R
 g79WXCt+nXGBPOvi7mKCQd70orDN696XQgCTprbC8aNebhWw1gMQxtTPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=4L2uciMlwPKw6NVgmSskfFKGJ+TIqBRdUNzu7aGn5q0=; b=SyOWOe1M
 NAjkQsPMU+4moN/G4eBj0d6+Loh/U6zTBEyeERg/URZ+xQkObUQwMSzcjc4ZZRQl
 Oy0+pIgHjv0hJxSqlZ+naOn8RAMKjO6lQ1Va27jMKFDhp/aFan45RsUkv1k6TzJf
 8W0Imu5zlPQAbSm1JooZqNGXARma+UkhylqSO2wKwuWZ0AWQdW7jK0XrWzmd2DWq
 lvbPTPhiS60av1WLkA2YDpeeY20CgpS4xDamj6ZCddacC2QZML0GUrMuzSCr5D/j
 erdMN+DfNiqN4H/Gjof4EBDCBc6+gY3jGcycsx6QP94Je6sCaCRRbT+WqkRVRIcP
 RpqunDqXwrXzTg==
X-ME-Sender: <xms:yGqHXbtHKoBlyNC4ZY5BFeqlQ-RHuWQn6J4w37SqrVmogLSeH7KeJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepud
X-ME-Proxy: <xmx:yGqHXTVCNR4AUxmc-Egd6SUdw_sYt3lDM7DmRwYDUKDCPNYrg3EcPQ>
 <xmx:yGqHXYdgK142CfcNxQjaK5cZG2bdqMiN9aUW8KZHKdPOr-PaXTL5tw>
 <xmx:yGqHXeKMDsV3ozyzZxxfHHQ9nsjfx37iWwnayLbshFMWz094Mqii-g>
 <xmx:yGqHXWx_MJq7CLn9M1Dhu7DgjhVgqusZC9hJqaodFl7bUu7kAJe8iA>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id BBB258005A;
 Sun, 22 Sep 2019 08:36:22 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 2/6] dt-bindings: net: ftgmac100: Describe clock
 properties
Date: Sun, 22 Sep 2019 22:06:56 +0930
Message-Id: <20190922123700.749-3-andrew@aj.id.au>
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

Critically, the AST2600 requires ungating the RMII RCLK if e.g. NCSI is
in use.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/net/ftgmac100.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
index 04cc0191b7dd..c443b0b84be5 100644
--- a/Documentation/devicetree/bindings/net/ftgmac100.txt
+++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
@@ -24,6 +24,12 @@ Optional properties:
 - no-hw-checksum: Used to disable HW checksum support. Here for backward
   compatibility as the driver now should have correct defaults based on
   the SoC.
+- clocks: In accordance with the generic clock bindings. Must describe the MAC
+  IP clock, and optionally an RMII RCLK gate for the AST2600.
+- clock-names:
+
+      - "MACCLK": The MAC IP clock
+      - "RCLK": Clock gate for the RMII RCLK
 
 Example:
 
-- 
2.20.1

