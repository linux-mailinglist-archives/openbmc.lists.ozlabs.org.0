Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E6BE197
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:46:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dj8c3NlnzDqc1
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:46:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CMrWtZT+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Gv9PP7ks"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhtv3V46zDqZ9
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:34:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6400E4E8;
 Wed, 25 Sep 2019 11:34:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 11:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=4L2uciMlwPKw6
 NVgmSskfFKGJ+TIqBRdUNzu7aGn5q0=; b=CMrWtZT+MTKalG1IEmBpBVqXEGjWO
 XN9LuS2JMQH7KP4zJpvxJdjLbl2NEDMUvEqX9qGLsWbG/EvjgXS5BtyYxjjBug9H
 Ao68Ip0llMiuylVxnG+ZJKgcxuvOBToHnhmxZeFXs7dFuZylQ73Qfd+ksv8KizfY
 Av8XgeSnIX9zsNGzpbW+gYlqG8sbwbfnaULqE6N+YK5YWSwFNu8MWwiCGadMYX+d
 +7V2P3/Elln7scLnR2TYfKwfzx/niHxOC82NeogNbDMd7IhZjrhvoqrccAqZL0cX
 1DJ3RfhpEYrg8g9RE1aAPyNbkI9Kc5xmM/c49mWsoBGvThEYhBxFExTNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=4L2uciMlwPKw6NVgmSskfFKGJ+TIqBRdUNzu7aGn5q0=; b=Gv9PP7ks
 ucvycmQfnI0308SDmOxKagN+T+N7BoTeHh5+2uEQIh3nVmYGI1Q4Yv5GMHmvOPlG
 7j1Bp93EcOJw6X6jr6fc+hgAC8KWNnxsvlf1IGOsVg/CXZz7NB3ZxdpJKC95s6dH
 /TfsxBNvgX9Qi/nV73O2Ktvo/8RDimoqhfA9hFTtG8s8CDb/5JJMtM++rULxxlfV
 mHY30VaCdv4BbCJa8wkjtEMOGk9nRs9vqnHvTm7T1VliIbEEZBAiAMeTgdDARWoM
 +MIOddIRddEtRYpiV0Dyq7OVhr4mBhZfKs+y1nVht24p8anZfmazr92eoyv3DDvO
 GUiYp/dWwOU3mw==
X-ME-Sender: <xms:BImLXWPFaUQpQPVHxIYPq07D3te7Hl7lmlD2QpPJKEccUowae4WcBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepfe
X-ME-Proxy: <xmx:BImLXT98q8-oOAm1fk2O3bWbrPUk6lfaglgq_v0rlR-vy01bMGWwcw>
 <xmx:BImLXdZgFFPWq34kdBtI3VYgFUBDd9ilrARjSkfpwGCGZUjwSuXp2w>
 <xmx:BImLXZFmhPb-VfHHHyO2RVlqKk_u2xNFX8O6LH5aRTF4Dwg0cl3wRw>
 <xmx:BYmLXQVuEjaoJyGxqZEogftjQeRitvX-HaYE61qLLXuOiGFrXOJqgg>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 52D5CD60057;
 Wed, 25 Sep 2019 11:34:27 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 6/8] dt-bindings: net: ftgmac100: Describe
 clock properties
Date: Thu, 26 Sep 2019 01:04:37 +0930
Message-Id: <20190925153439.27475-7-andrew@aj.id.au>
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

