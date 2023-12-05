Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7D80511F
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:48:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MPZSrwUA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sky1y0xjFz3dBw
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:48:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MPZSrwUA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxly3rLBz3cF1
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:30 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50bce78f145so6567894e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772586; x=1702377386; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/W7bRr2FIytmHTP+ve4vRfpj/k8/yIBrLP2P8LnNEk=;
        b=MPZSrwUAIgfKZEbxJet/hBOkEyL2IV9lFhMRKjpnXZ9zkWpU/2giy/8bRRup40nc2J
         h8HMFelWVzE3xJiagYCOkhRKadXmFXsTARCl2eRH2c4YJUAbVS3ZLAlUfDJtNyteZNMO
         95bQujStC62znRE7O2gtRP1eNgHhEBL7rKQUWwtRPqVf9S3RuShy0+sLeNXsy4R/XePM
         p/wN8vnz8BhGFTST8IseAhLjwgVPkLOXRGZu+Ej+yCn1gTXBDzXmj3+9ebtN3CyUg9TH
         j9k88HFv2L5Amze4KKSKsQnXrav3JvH/WxRK02PRFeQKvXaG/j05cfAaho3eYa1cyoaB
         5fMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772586; x=1702377386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/W7bRr2FIytmHTP+ve4vRfpj/k8/yIBrLP2P8LnNEk=;
        b=D64M2Laj4kW1VQVWZNpUzzsRgk5AagZh4BhgF75ZBv069QQRoCVSPpY3HE1BCZWjXA
         B3I31zYKz2CfU2KeGJjDY/4iTXlFiLmsuDoKCCN0P8cOO1OXwgWiv0I8jYhaSMPXxfR2
         wGNBsCUiulASES+KYIqDSd16AxmtAgEf2YAKwUhAX3CCCJE8SWn51EnFxuc3m09OAw5F
         DhzHlgjn/wGK1I3WJh26sV+VqtOsPKdsB8SBXNCfPDrVGv19UguanvPJoa1EbA3cEu5I
         gZ859cjqkA+6h9qiX3rqZB/LdlcmiAIJi9fhNr/abX94ODiUoo/N5ZiPHUNJNEviDXEi
         tD0w==
X-Gm-Message-State: AOJu0YwBtEgxhaR3ecHG2H4kQuD4xpMwDgoiPZvukDYHvD3KQ2GtIzzT
	9gxOMD3+tE/F0ilLU8fQV7E=
X-Google-Smtp-Source: AGHT+IES81scnB9OAc2hliG1AqfHqUzn12268APbl0b9mr/HfSY9+lceF3Al8CkH/xAT+wtxcOc+8g==
X-Received: by 2002:a19:3848:0:b0:50c:4e7:87b8 with SMTP id d8-20020a193848000000b0050c04e787b8mr175943lfj.23.1701772586273;
        Tue, 05 Dec 2023 02:36:26 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id v8-20020ac25928000000b0050bf7a9c4adsm567335lfi.225.2023.12.05.02.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:25 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH net-next 13/16] net: stmmac: intel: Register generic MDIO device
Date: Tue,  5 Dec 2023 13:35:34 +0300
Message-ID: <20231205103559.9605-14-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The DW XPCS driver has been updated to being bindable with the respective
MDIO device registered during the MDIO bus probe procedure. As an example
of using that feature let's convert the Intel mGBE low-level driver to
registering the MDIO-device board info. Thus the registered DW XPCS device
will be a subject of the fine-tunings performed during the MDIO-device
probe procedures.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 60283543ffc8..7642c11abc59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -4,6 +4,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/pci.h>
+#include <linux/phy.h>
 #include <linux/dmi.h>
 #include "dwmac-intel.h"
 #include "dwmac4.h"
@@ -585,6 +586,28 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	/* Intel mgbe SGMII interface uses pcs-xcps */
 	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
+		struct mdio_board_info *xpcs_info;
+
+		xpcs_info = devm_kzalloc(&pdev->dev,
+					 sizeof(*xpcs_info) + MII_BUS_ID_SIZE,
+					 GFP_KERNEL);
+		if (!xpcs_info) {
+			ret = -ENOMEM;
+			goto err_alloc_info;
+		}
+
+		xpcs_info->bus_id = (void *)xpcs_info + sizeof(*xpcs_info);
+		snprintf((char *)xpcs_info->bus_id, MII_BUS_ID_SIZE,
+			 "stmmac-%x", plat->bus_id);
+
+		snprintf(xpcs_info->modalias, MDIO_NAME_SIZE, "dwxpcs");
+
+		xpcs_info->mdio_addr = INTEL_MGBE_XPCS_ADDR;
+
+		ret = mdiobus_register_board_info(xpcs_info, 1);
+		if (ret)
+			goto err_alloc_info;
+
 		plat->mdio_bus_data->has_xpcs = true;
 		plat->mdio_bus_data->xpcs_an_inband = true;
 	}
@@ -600,7 +623,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 		fwnode_handle_put(fixed_node);
 	}
 
-	/* Ensure mdio bus scan skips intel serdes and pcs-xpcs */
+	/* Ensure mdio bus PHY-scan skips intel serdes and pcs-xpcs */
 	plat->mdio_bus_data->phy_mask = 1 << INTEL_MGBE_ADHOC_ADDR;
 	plat->mdio_bus_data->phy_mask |= 1 << INTEL_MGBE_XPCS_ADDR;
 
@@ -618,6 +641,12 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->msi_tx_base_vec = 1;
 
 	return 0;
+
+err_alloc_info:
+	clk_disable_unprepare(clk);
+	clk_unregister_fixed_rate(clk);
+
+	return ret;
 }
 
 static int ehl_common_data(struct pci_dev *pdev,
-- 
2.42.1

