Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B37808AFA
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 15:47:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BloRXfNO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmHF6376Fz3cWG
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 01:47:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BloRXfNO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmHDV4wRpz30K6
	for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2023 01:47:21 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bf8843a6fso802024e87.0
        for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2023 06:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701960435; x=1702565235; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cqlaAjyYoTX21n2s5cfjq7OlbuSAPm9lzmylNhTuY6I=;
        b=BloRXfNOAnLNLGNddduTj5Z2/R1WCfjTbp3/a6onwUIvxO6FgShcSC4fj8uflI6jmS
         0AwVmDdCpjcMhRxuFwMPPq8Dj7c7oaYli6NH3S7n9ooTk+W8iS6TNrxsewJA/L/cIv+g
         Bv5YjUNZ0J29I3cUREifpH5NoMhwRKW8e4PeqSHyAO44FPNzI5LgrtfGL7XItN/3Yp63
         38wkzb56p9n99sGoMwgRvoi+WMB6HdJp1e8vf5+pgfUjNyYNy6JdtngNFEz627rFr/I7
         weMwEr9Wdce+2bQ0LErOpug9vQn6IDFSWuumOvUsiuBkuVuNBzBq5iNe5waaUcUE6Zeo
         PV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701960435; x=1702565235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqlaAjyYoTX21n2s5cfjq7OlbuSAPm9lzmylNhTuY6I=;
        b=uqyD+1bg9mYaGKx2b28V/OqGjb3LTgjCt9ojOW8VZjixA+9P6ub7P8nM1QtDX1Wraf
         yqd4FIZcVkCzRU04DJrOp2JURHga8q+A/JKzOQ0RaZpAvC959m+llGsPbLVj67JI+4u9
         +wzF2nQjIRikNOcq26RWpKLHceh3Wh+/HSiPD3+WDUoErPdoH0czlNv+tuZdoSzoLb05
         WvTN8ptKMGlaCQkM9w58tOIjWPFiJL/nMVQq6BVMuo2GAPTvd46zx3+Zsqq9pak354Be
         NsXHApnsEeaYl4MY15ejtuXmJ1I62XTbxFau7W9d92fmydeTBI3pqtH/eQyZdmwN5RIU
         nFOA==
X-Gm-Message-State: AOJu0YzSr/0V5LqDIPBZ/6oXP/UTYJwRKTO442zUHaVsF7urbEVSSksi
	oqh6CYcgzYE61Oi2TNeY028=
X-Google-Smtp-Source: AGHT+IHt6jmaJ4Kw2i2qQNJQx0ETtzVu6UphNSpRZpwIAZmDoKS9ekjWRCFIkH2tj1BtTLNIyKFnFw==
X-Received: by 2002:a05:6512:3e27:b0:50b:c0f1:f532 with SMTP id i39-20020a0565123e2700b0050bc0f1f532mr4043138lfv.26.1701960434989;
        Thu, 07 Dec 2023 06:47:14 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id e10-20020ac24e0a000000b0050c0215a806sm189601lfr.83.2023.12.07.06.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:47:14 -0800 (PST)
Date: Thu, 7 Dec 2023 17:47:11 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 13/16] net: stmmac: intel: Register generic MDIO
 device
Message-ID: <ohhgcfdvbxo3sffjpf7nedti3gujcwti4cysgim47jgcsum5ay@rrtsfnwktbqb>
References: <20231205103559.9605-14-fancer.lancer@gmail.com>
 <202312060845.lDDRDWET-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312060845.lDDRDWET-lkp@intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 06, 2023 at 08:19:07AM +0800, kernel test robot wrote:
> Hi Serge,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/net-pcs-xpcs-Drop-sentinel-entry-from-2500basex-ifaces-list/20231205-183808
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20231205103559.9605-14-fancer.lancer%40gmail.com
> patch subject: [PATCH net-next 13/16] net: stmmac: intel: Register generic MDIO device
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20231206/202312060845.lDDRDWET-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060845.lDDRDWET-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312060845.lDDRDWET-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c: In function 'intel_mgbe_common_data':
> >> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:646:31: error: 'clk' undeclared (first use in this function)
>      646 |         clk_disable_unprepare(clk);
>          |                               ^~~
>    drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:646:31: note: each undeclared identifier is reported only once for each function it appears in
> 
> 
> vim +/clk +646 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c

Right, my series had been originally based on a branch which had some
of this driver parts fixed. I should have more thoroughly performed
the re-base process. I'll make sure it's fixed on v2.

-Serge(y)

> 
>    446	
>    447	static int intel_mgbe_common_data(struct pci_dev *pdev,
>    448					  struct plat_stmmacenet_data *plat)
>    449	{
>    450		struct fwnode_handle *fwnode;
>    451		char clk_name[20];
>    452		int ret;
>    453		int i;
>    454	
>    455		plat->pdev = pdev;
>    456		plat->phy_addr = -1;
>    457		plat->clk_csr = 5;
>    458		plat->has_gmac = 0;
>    459		plat->has_gmac4 = 1;
>    460		plat->force_sf_dma_mode = 0;
>    461		plat->flags |= (STMMAC_FLAG_TSO_EN | STMMAC_FLAG_SPH_DISABLE);
>    462	
>    463		/* Multiplying factor to the clk_eee_i clock time
>    464		 * period to make it closer to 100 ns. This value
>    465		 * should be programmed such that the clk_eee_time_period *
>    466		 * (MULT_FACT_100NS + 1) should be within 80 ns to 120 ns
>    467		 * clk_eee frequency is 19.2Mhz
>    468		 * clk_eee_time_period is 52ns
>    469		 * 52ns * (1 + 1) = 104ns
>    470		 * MULT_FACT_100NS = 1
>    471		 */
>    472		plat->mult_fact_100ns = 1;
>    473	
>    474		plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
>    475	
>    476		for (i = 0; i < plat->rx_queues_to_use; i++) {
>    477			plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
>    478			plat->rx_queues_cfg[i].chan = i;
>    479	
>    480			/* Disable Priority config by default */
>    481			plat->rx_queues_cfg[i].use_prio = false;
>    482	
>    483			/* Disable RX queues routing by default */
>    484			plat->rx_queues_cfg[i].pkt_route = 0x0;
>    485		}
>    486	
>    487		for (i = 0; i < plat->tx_queues_to_use; i++) {
>    488			plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
>    489	
>    490			/* Disable Priority config by default */
>    491			plat->tx_queues_cfg[i].use_prio = false;
>    492			/* Default TX Q0 to use TSO and rest TXQ for TBS */
>    493			if (i > 0)
>    494				plat->tx_queues_cfg[i].tbs_en = 1;
>    495		}
>    496	
>    497		/* FIFO size is 4096 bytes for 1 tx/rx queue */
>    498		plat->tx_fifo_size = plat->tx_queues_to_use * 4096;
>    499		plat->rx_fifo_size = plat->rx_queues_to_use * 4096;
>    500	
>    501		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
>    502		plat->tx_queues_cfg[0].weight = 0x09;
>    503		plat->tx_queues_cfg[1].weight = 0x0A;
>    504		plat->tx_queues_cfg[2].weight = 0x0B;
>    505		plat->tx_queues_cfg[3].weight = 0x0C;
>    506		plat->tx_queues_cfg[4].weight = 0x0D;
>    507		plat->tx_queues_cfg[5].weight = 0x0E;
>    508		plat->tx_queues_cfg[6].weight = 0x0F;
>    509		plat->tx_queues_cfg[7].weight = 0x10;
>    510	
>    511		plat->dma_cfg->pbl = 32;
>    512		plat->dma_cfg->pblx8 = true;
>    513		plat->dma_cfg->fixed_burst = 0;
>    514		plat->dma_cfg->mixed_burst = 0;
>    515		plat->dma_cfg->aal = 0;
>    516		plat->dma_cfg->dche = true;
>    517	
>    518		plat->axi = devm_kzalloc(&pdev->dev, sizeof(*plat->axi),
>    519					 GFP_KERNEL);
>    520		if (!plat->axi)
>    521			return -ENOMEM;
>    522	
>    523		plat->axi->axi_lpi_en = 0;
>    524		plat->axi->axi_xit_frm = 0;
>    525		plat->axi->axi_wr_osr_lmt = 1;
>    526		plat->axi->axi_rd_osr_lmt = 1;
>    527		plat->axi->axi_blen[0] = 4;
>    528		plat->axi->axi_blen[1] = 8;
>    529		plat->axi->axi_blen[2] = 16;
>    530	
>    531		plat->ptp_max_adj = plat->clk_ptp_rate;
>    532		plat->eee_usecs_rate = plat->clk_ptp_rate;
>    533	
>    534		/* Set system clock */
>    535		sprintf(clk_name, "%s-%s", "stmmac", pci_name(pdev));
>    536	
>    537		plat->stmmac_clk = clk_register_fixed_rate(&pdev->dev,
>    538							   clk_name, NULL, 0,
>    539							   plat->clk_ptp_rate);
>    540	
>    541		if (IS_ERR(plat->stmmac_clk)) {
>    542			dev_warn(&pdev->dev, "Fail to register stmmac-clk\n");
>    543			plat->stmmac_clk = NULL;
>    544		}
>    545	
>    546		ret = clk_prepare_enable(plat->stmmac_clk);
>    547		if (ret) {
>    548			clk_unregister_fixed_rate(plat->stmmac_clk);
>    549			return ret;
>    550		}
>    551	
>    552		plat->ptp_clk_freq_config = intel_mgbe_ptp_clk_freq_config;
>    553	
>    554		/* Set default value for multicast hash bins */
>    555		plat->multicast_filter_bins = HASH_TABLE_SIZE;
>    556	
>    557		/* Set default value for unicast filter entries */
>    558		plat->unicast_filter_entries = 1;
>    559	
>    560		/* Set the maxmtu to a default of JUMBO_LEN */
>    561		plat->maxmtu = JUMBO_LEN;
>    562	
>    563		plat->flags |= STMMAC_FLAG_VLAN_FAIL_Q_EN;
>    564	
>    565		/* Use the last Rx queue */
>    566		plat->vlan_fail_q = plat->rx_queues_to_use - 1;
>    567	
>    568		/* For fixed-link setup, we allow phy-mode setting */
>    569		fwnode = dev_fwnode(&pdev->dev);
>    570		if (fwnode) {
>    571			int phy_mode;
>    572	
>    573			/* "phy-mode" setting is optional. If it is set,
>    574			 *  we allow either sgmii or 1000base-x for now.
>    575			 */
>    576			phy_mode = fwnode_get_phy_mode(fwnode);
>    577			if (phy_mode >= 0) {
>    578				if (phy_mode == PHY_INTERFACE_MODE_SGMII ||
>    579				    phy_mode == PHY_INTERFACE_MODE_1000BASEX)
>    580					plat->phy_interface = phy_mode;
>    581				else
>    582					dev_warn(&pdev->dev, "Invalid phy-mode\n");
>    583			}
>    584		}
>    585	
>    586		/* Intel mgbe SGMII interface uses pcs-xcps */
>    587		if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
>    588		    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
>    589			struct mdio_board_info *xpcs_info;
>    590	
>    591			xpcs_info = devm_kzalloc(&pdev->dev,
>    592						 sizeof(*xpcs_info) + MII_BUS_ID_SIZE,
>    593						 GFP_KERNEL);
>    594			if (!xpcs_info) {
>    595				ret = -ENOMEM;
>    596				goto err_alloc_info;
>    597			}
>    598	
>    599			xpcs_info->bus_id = (void *)xpcs_info + sizeof(*xpcs_info);
>    600			snprintf((char *)xpcs_info->bus_id, MII_BUS_ID_SIZE,
>    601				 "stmmac-%x", plat->bus_id);
>    602	
>    603			snprintf(xpcs_info->modalias, MDIO_NAME_SIZE, "dwxpcs");
>    604	
>    605			xpcs_info->mdio_addr = INTEL_MGBE_XPCS_ADDR;
>    606	
>    607			ret = mdiobus_register_board_info(xpcs_info, 1);
>    608			if (ret)
>    609				goto err_alloc_info;
>    610	
>    611			plat->mdio_bus_data->has_xpcs = true;
>    612			plat->mdio_bus_data->xpcs_an_inband = true;
>    613		}
>    614	
>    615		/* For fixed-link setup, we clear xpcs_an_inband */
>    616		if (fwnode) {
>    617			struct fwnode_handle *fixed_node;
>    618	
>    619			fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
>    620			if (fixed_node)
>    621				plat->mdio_bus_data->xpcs_an_inband = false;
>    622	
>    623			fwnode_handle_put(fixed_node);
>    624		}
>    625	
>    626		/* Ensure mdio bus PHY-scan skips intel serdes and pcs-xpcs */
>    627		plat->mdio_bus_data->phy_mask = 1 << INTEL_MGBE_ADHOC_ADDR;
>    628		plat->mdio_bus_data->phy_mask |= 1 << INTEL_MGBE_XPCS_ADDR;
>    629	
>    630		plat->int_snapshot_num = AUX_SNAPSHOT1;
>    631	
>    632		plat->crosststamp = intel_crosststamp;
>    633		plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
>    634	
>    635		/* Setup MSI vector offset specific to Intel mGbE controller */
>    636		plat->msi_mac_vec = 29;
>    637		plat->msi_lpi_vec = 28;
>    638		plat->msi_sfty_ce_vec = 27;
>    639		plat->msi_sfty_ue_vec = 26;
>    640		plat->msi_rx_base_vec = 0;
>    641		plat->msi_tx_base_vec = 1;
>    642	
>    643		return 0;
>    644	
>    645	err_alloc_info:
>  > 646		clk_disable_unprepare(clk);
>    647		clk_unregister_fixed_rate(clk);
>    648	
>    649		return ret;
>    650	}
>    651	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
