Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA87BA2A2
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 14:37:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bn5h3KTfzDqP7
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 22:37:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oEv8wg03"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Aqst8wqR"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bn4p4CvhzDqP0
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 22:36:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F64720F20;
 Sun, 22 Sep 2019 08:36:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 22 Sep 2019 08:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=80t49yUmTjxMS
 nA8I9JIsl6t600IjN1hqbYbWjxh6s8=; b=oEv8wg03Z3a6aRKnaxl5kKlDl+ZtA
 j1P1aFEko3HYI7zktqNKqHPFwmOauGk1jNw/Z9eKW7I7anYGyY0AXLr+EK2PFlBU
 Y7y9DR/rD0ql3Z6Z3LGFy4bXfYrP+BuIlaLUeKSKRod78D/ETyO9v0d+Yjq7plZr
 GtCXxpPf8M/3yn8m80qyzmKV6KMRYLHn1jkSAxpxyQmX6uKhFfIBy2zqw6dlQ4J5
 XEoZkqMxRYW47Qf5Ld60M77Vh97qTFgUpY9k2f9odxOD5fQt4yD7SA4xtQOYBorV
 iDsuW+auzrDPGDkWcqc7+f/eYDy2fw0OUmMEi4V0pNmXvEFXhRzvuVzlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=80t49yUmTjxMSnA8I9JIsl6t600IjN1hqbYbWjxh6s8=; b=Aqst8wqR
 PP2s5gk48cBEFXx4ayAymyE8tkw3C3J2EIFn8cM7mtvUzGt/a8/PZkNpwwR4ulDf
 2aO2wab0p800ZxHn6P3F7EmHItKxUC7DoRxn8sAhA+Gz3Luy8dZ7yUCxxliN7wbt
 AGABVgM94u7XQ2cJFdF+vVWas+DauQjJc9FXinpmiGyyf7YIjGxUGUq5J+LnvLvA
 o33HN/EOVLNwI2sMT1S8F+x2/nubiWf874RT/fH73SkaNZFCt1sOXKbWEw6Rh+5A
 a2rWQ10wA5GwbPhY6uQVEhA8nyXRxyuGEz9JkbySqa/o2NLAne2VaZvMFljfNlrk
 kXUo05+J908JZQ==
X-ME-Sender: <xms:xmqHXU4eAyt_W4sIrHgNqPs1KAzTgdErSGmwOtd5V3wUx2EaKFB1HA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgeptd
X-ME-Proxy: <xmx:xmqHXRpl-Mulgj2OowBHiSw-I3hT8UIwU-_pO6g3h7wG06NdNk6COw>
 <xmx:xmqHXcDnvsODjPeQm7w3ouV2MCoq6oGKArl9smM2bkhdotw4C_9Elw>
 <xmx:xmqHXaRiDf6FsUKWsU-vs5jnbJe4rCQaVNKrzId5vSJzxnCXoaqkwg>
 <xmx:xmqHXSXH-OY2la9ffxv5vALCCPVLFa3naxjkCpD14xNsH6vSIGBcNw>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7DD078005C;
 Sun, 22 Sep 2019 08:36:20 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 1/6] dt-bindings: net: ftgmac100: Document
 AST2600 compatible
Date: Sun, 22 Sep 2019 22:06:55 +0930
Message-Id: <20190922123700.749-2-andrew@aj.id.au>
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

The AST2600 contains an FTGMAC100-compatible MAC, although it no-longer
contains an MDIO controller.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/net/ftgmac100.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
index 72e7aaf7242e..04cc0191b7dd 100644
--- a/Documentation/devicetree/bindings/net/ftgmac100.txt
+++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
@@ -9,6 +9,7 @@ Required properties:
 
      - "aspeed,ast2400-mac"
      - "aspeed,ast2500-mac"
+     - "aspeed,ast2600-mac"
 
 - reg: Address and length of the register set for the device
 - interrupts: Should contain ethernet controller interrupt
-- 
2.20.1

