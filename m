Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E713BF48A
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:58:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGjC5QVqzDqGq
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:58:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iNT3/TIa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="1iPtqJDb"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGCQ6PnkzDqlm
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:46 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 84909711;
 Thu, 26 Sep 2019 09:35:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=M6C2qfsoXGX2h
 C89f6pnGYxHLJHX77ETNyyCwyfHW5A=; b=iNT3/TIabC1K3glETh26sJ23XX//c
 t9ZTAAg9GzaJJRwXUTwRnrzclbzX92CtcgWUdesaa8COzWL/7IHNB1CIQ+x4xJcf
 ohkbsnz+Q/7i7LIUhXUYEMSZOB3/2YcsyYMZLuJT1Pyjo4lGdvMGHvXyeLlXC9H5
 wrwmptej9X4Qt8Pnr87PEdBkUJs2vSeIbRgmfa2LKBGpsSLetAsB0kW6EU5kb46W
 +JGoKFB4giB0ieGuj61z1cmvWduLfBQpbsEABz0ZqHU+Bg1/BuKdnuWVe419d2Ts
 sf1ZfIdL7ChXAcGUL/8t3g3yGoG5sSarvjWp957mVJ1mtztxiEusT3iiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=M6C2qfsoXGX2hC89f6pnGYxHLJHX77ETNyyCwyfHW5A=; b=1iPtqJDb
 0tFij1ly2fOAj4MLV+LKs5p4QwUxmFKOt7QWETTcEpHLzoGI+uE8BJW1RRo4IiPS
 IePx+haNJwZZIliEXosj6r04c1M625+xgB3n0no6khA6dYsMvsr3Ez13HbRarkoO
 TezWG1XlDL0XKvmN9o/M1LMy54VaskEUVxsHpTTt3XVSjhMEEeoAxGdLuQSbU5Es
 c41l6PmnNipOOP17ftPCuKUXaFojHh6DnYE2wsNaZShB1LUfmIjbzD8ganicCETf
 qKAioa4bmzQFsCsaJzp/GcuSjP4uU8VwJ3AlgapDow6EBCVpFW734PQLqmTO62pP
 /YieCf6bIlNZZQ==
X-ME-Sender: <xms:sL6MXQe8xRUK4vAwFMTY3C8oeBX435dbUSNoZhKMAuCQ3foAmFq2rQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepuddt
X-ME-Proxy: <xmx:sL6MXQYMws6OlZMYL3xn7YcH2wlADkbzs-6H18guaAVuLNaP7Y2tfg>
 <xmx:sL6MXX1nYtvpqWDVaWp9PcCH9-g_0sRLqKBMSBl-m9pPZ8YBRhIHrQ>
 <xmx:sL6MXZ0jfYKhE7G-VzQEEqGmKNS4elzcHUjyuKD-xIC27AQlRX6zNQ>
 <xmx:sL6MXVPCICQObhrasFJMZKy0JxwimaB-MWDHdGeH2u6He-XZNEe-ng>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 276CDD6005A;
 Thu, 26 Sep 2019 09:35:41 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 12/15] ARM: dts: aspeed-g6: Fix EMMC function in
 pinctrl dtsi
Date: Thu, 26 Sep 2019 23:06:05 +0930
Message-Id: <20190926133608.30566-13-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926133608.30566-1-andrew@aj.id.au>
References: <20190926133608.30566-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, johnny_huang@aspeedtech.com,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The binding was updated to better reflect the intended use of the
hardware and the existing function/groups for SD3 were dropped.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
index 5b8bf58e89cb..045ce66ca876 100644
--- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
@@ -852,14 +852,9 @@
 		groups = "SD2";
 	};
 
-	pinctrl_sd3_default: sd3_default {
-		function = "SD3";
-		groups = "SD3";
-	};
-
 	pinctrl_emmc_default: emmc_default {
-		function = "SD3";
-		groups = "EMMC";
+		function = "EMMC";
+		groups = "EMMCG4";
 	};
 
 	pinctrl_sgpm1_default: sgpm1_default {
-- 
2.20.1

