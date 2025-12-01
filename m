Return-Path: <openbmc+bounces-954-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34096C95D4D
	for <lists+openbmc@lfdr.de>; Mon, 01 Dec 2025 07:31:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKYsc0FfNz30YZ;
	Mon, 01 Dec 2025 17:29:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764570580;
	cv=none; b=dLB2JOvG/+xYoGTpZaYJMplwBOQHIfMb5/Bo7kjoWMqvTzosaEZkpT5Z0qGitBNp9JZT/v5kvHhUIn+d8gKchhdxE5UIlJvKMCWt+Ua3LwG4Nps5Pi6uAK1+nN2x/YkNfNzlXzwlRTgAT4vB4RQVTPDX2BFgfxmHVp72sDBurubXvuU3JyHQQ6uRbjbpTMRkZlqatxLxRnn4oIEndMKh/saxNAS2mvCNRz0mKo91x5Gs0qFTVppfVBp02dfD1FIsoUy8gLAlqhDmQKnoKDVhQ9TB1jHE/42OL2XAHdjwyNXTzAIMc+R/gGiyn6gtM+BG7+0cFnY6DLThuxN4TaSLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764570580; c=relaxed/relaxed;
	bh=AK1yMazosvq6Moup2L8MdLat4UXPgtpy8Lkk448O614=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kS35iDDguEtHlNOkT2cQno/c5FZF733R8ZokHsmeRQcBJ2WlZhhK5KvwOk1/hXmMl9+5LK1FCiLgHsQ4GMKouKj53vqxcAHx7ZPRVy446gzdZdYhSC4xaTyVDRVqUq0fJWjECYI11azkaGgX65UFcmMMEmhlNefRnuUzfX9oWjZFOi8yTxzR5MRCep/kvFMPhsk8mSmCjeS8YhH+fawpLhSQqvlNJrIOmrROS1rRDrPRa4moKb9TgNOrf5ONbJfz7xLRCror/eLsLH+dtqSu+KU7ldncxRpPBakkiiP2RMiQLE4vbYy8iD/KBDiXh80DkHlTXM+vJfDn0ndn+t4x9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dKYsb3sfnz3bSK;
	Mon, 01 Dec 2025 17:29:39 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Dec
 2025 14:29:17 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Dec 2025 14:29:17 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 1 Dec 2025 14:29:17 +0800
Subject: [PATCH v6 7/7] MAINTAINERS: Add ASPEED PCIe RC driver
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251201-upstream_pcie_rc-v6-7-8c8800c56b16@aspeedtech.com>
References: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
In-Reply-To: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764570556; l=1055;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=2CuvbQgMn+gLhHMIz6Ugd9HDL3ZMZSXMjI0gjd/rarg=;
 b=wuwOp5p4ht9frjF1McU2aKEe2NSYc9XmLjTZrpN201zBxIEuu0PKHgRGAxNp7FJUY7IhxhEEF
 V6ymMCHXf2kBWaTQJeW50xCSKk4iq24wGYZeNHlp7E8xyU41e9u30iF
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add maintainer for ASPEED PCIe RC driver.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf1fe32f55d3..d988274c28f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3837,6 +3837,18 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
 F:	drivers/media/platform/aspeed/
 
+ASPEED PCIE CONTROLLER DRIVER
+M:	Jacky Chou <jacky_chou@aspeedtech.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-pci@vger.kernel.org
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
+F:	Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
+F:	drivers/pci/controller/pcie-aspeed.c
+F:	drivers/phy/aspeed/Kconfig
+F:	drivers/phy/aspeed/pcie-phy-aspeed.c
+
 ASUS EC HARDWARE MONITOR DRIVER
 M:	Eugene Shalygin <eugene.shalygin@gmail.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.34.1


