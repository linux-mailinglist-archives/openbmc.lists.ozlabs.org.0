Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F2BE186
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:42:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dj4G1p6QzDqMk
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:42:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cZFQgNoG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="vhgN6PZ1"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhts2MLdzDqZ9
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:34:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3298D4E4;
 Wed, 25 Sep 2019 11:34:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 11:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=80t49yUmTjxMS
 nA8I9JIsl6t600IjN1hqbYbWjxh6s8=; b=cZFQgNoGQOwl1cJQ3PmhZcrlTa3Rz
 qT6sGDWTL3ih0IC6vnrbsOjxafX4OYUMU/H2eX0r9fUj//f+LLSNl1LIW9i/zlDd
 Z4/m2E7Gqn3bFW+X78li2T4yULZ5b6R/5ijOaz64V2//u34AkW6Y8inGdTakKbUJ
 8JhomNfERZN+oEDLMIV+I1HG057POYI7nrzOgk99p1jNNzO9dEyY6Txwm/w2ulve
 UAnM/2M4ZoG+HMc7gWEUHP86PAvOBdUFuuVH884UiwXF1qQNpRL4XVSyB247TKDK
 3t2AMndwdZ94//zdi4Iy2622xz8DNKCBixogP9neSNFzEgpIOkLwsjXKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=80t49yUmTjxMSnA8I9JIsl6t600IjN1hqbYbWjxh6s8=; b=vhgN6PZ1
 IamUCPRYEy1otbgbQwvldTd5pKe7HAiuecBwaqqqehU8HFgS4y1t+pjtdDyuJP7+
 n3FjjbHi+Vsj5KZMca/dEHZHhEmwDTTCZ9DazHB8P4ni/IJTf8I1LJp86JknOYkU
 Bd5aoycyfDVFT8l8PDqseBPMpkvPos8PUFuPrN48KGfyWeBpSTQweEyoNylqx1tN
 JsCE7eaIFHkm8jI9/VFKn13zlTQgUd3DtdVTC3e+7D9mBAcFBcgoCoZOlSmLr8cS
 Sv2BDsPo97XQhAjgxDm3Yc6w+BXdnE1tLx4jQ8QG/Zn8V1xxNx/MyQ8vO/bApmSK
 3EdN/ClFyS+tXg==
X-ME-Sender: <xms:AomLXSzr_ciJUmJD1eECaQIzg-CBm59poXTJd6oJjecLTOzkLjCldw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepfe
X-ME-Proxy: <xmx:AomLXSifG0uri5Pc5NMG7ujzxoFGlOKfaSMM9ZxbqQ8iWKQ2XB4ueQ>
 <xmx:AomLXfWgS_ai5C5vlRnRVUKehn90RX3_VBgNmiNXTowrSe4BwTT2Xg>
 <xmx:AomLXc2vqredzK72UM_937xgcMY6S3eKexqp3joXgzt1n06RYffH2A>
 <xmx:AomLXdWclSiatk1Q_-NrTEgZTfRc9_cgEE_Ih-t2-L1V4hlOUV97SA>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 46B18D6005D;
 Wed, 25 Sep 2019 11:34:25 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 5/8] dt-bindings: net: ftgmac100: Document
 AST2600 compatible
Date: Thu, 26 Sep 2019 01:04:36 +0930
Message-Id: <20190925153439.27475-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190925153439.27475-1-andrew@aj.id.au>
References: <20190925153439.27475-1-andrew@aj.id.au>
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

