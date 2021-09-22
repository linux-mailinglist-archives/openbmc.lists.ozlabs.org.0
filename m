Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7781E41474E
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 13:08:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDwWX2zrwz2xtv
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 21:08:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDvkQ3rXWz2ynm;
 Wed, 22 Sep 2021 20:32:30 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18MAB9WG012572;
 Wed, 22 Sep 2021 18:11:09 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Sep
 2021 18:31:28 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <adrian.hunter@intel.com>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <andrew@aj.id.au>
Subject: [PATCH 10/10] dt-bindings: mmc: aspeed: Add a new compatible string
Date: Wed, 22 Sep 2021 18:31:16 +0800
Message-ID: <20210922103116.30652-11-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18MAB9WG012572
X-Mailman-Approved-At: Wed, 22 Sep 2021 21:04:50 +1000
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
Cc: BMC-SW@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add "aspeed,ast2600-emmc" compatible string for the sake of
distinguishing between SD and eMMC device.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
index 5bb66849df65..41105cd104c6 100644
--- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
@@ -52,6 +52,7 @@ patternProperties:
           - aspeed,ast2400-sdhci
           - aspeed,ast2500-sdhci
           - aspeed,ast2600-sdhci
+          - aspeed,ast2600-emmc
       reg:
         maxItems: 1
         description: The SDHCI registers
-- 
2.17.1

