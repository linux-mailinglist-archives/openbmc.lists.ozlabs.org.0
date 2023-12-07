Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A9808AC6
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 15:37:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mKlVsmPu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmH1P2STdz3cns
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 01:37:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mKlVsmPu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmH0m4C2jz3cWG
	for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2023 01:37:11 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50be3eed85aso1002344e87.2
        for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2023 06:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701959827; x=1702564627; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P/n/DJfS500DzkD8o2lIXV8iW85crXSXBVQD2G7alNw=;
        b=mKlVsmPucB+80uPhXEMu11+1dUDG1Bgb/TB+CSenfTL59CDK5C4W8Ycg+Rujb7WOrt
         pOfWLlc3Hoe5mgJV04f6PjAeg2mA/5iIdCkOnhbks0I5iJPUgo6aI67+pDX0GPnUFBZO
         qd/b/YOx7lzg2bunCJx9rLRxGXB4jWCW1LAeqX+Lm0j8jESqi5gM/OtR/aw/c1/prOHQ
         DxIUvdxE+I6qnjO0/G9eOv8AiYSQtNx3ouSVYM0sUkgXTfr6qsFISZKxulJzB95X61Of
         TD//0SsL1n+zzjI5VoY5H3SsjCCeio/A7H9ifQrlqKnfC7i3oGVR56CLcIrJ0u4BWtgg
         /X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959827; x=1702564627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/n/DJfS500DzkD8o2lIXV8iW85crXSXBVQD2G7alNw=;
        b=E3J1o8niIMotBF3SVNmqFljRI/BLACg3ejXJRFKt3/ayTspJupPKoAMqwuf9X8nfwH
         81hvTg7Jyxak1O0rbasLA89PbWLyKRQrk88az6QeRz6Tgs+b6nmGRhu7atwUFP/FCLRC
         EV5Mc5p5AwcP+AxDB01Q29VCGvZhUOyZOpGPKC6NrJrb6pGzG2IBFUu102bSzCpcgqzI
         7n6gH+J8NtIayd2SvPZykB1JXA08V+w3QR8t27ZSo4czamq6oJ5HXjDs8+JVhbJNKTKz
         qGoZW3mt0fXTXJO4cgaY8MOD/HkCrFUzFnHJUui3mL+GyEIDcyyjEb/nxr4f6iJyK8g8
         o7TQ==
X-Gm-Message-State: AOJu0YzZ/PC31371LiLr2Hsqiwc7KMHy7ycwbfuvCmRAxjQvsSfBPNxE
	TOoGLZCWGFfN9flq7gzG914=
X-Google-Smtp-Source: AGHT+IGovfLmkKIpNWXQzCi7+4Z29EuCi9BtTtr8LpMmdT8CKQjdK8hgB4jjJwsDKG30N8bWSXmUog==
X-Received: by 2002:a05:6512:230a:b0:50b:c8a0:5657 with SMTP id o10-20020a056512230a00b0050bc8a05657mr2022447lfu.17.1701959827365;
        Thu, 07 Dec 2023 06:37:07 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id q9-20020a0565123a8900b0050c0bbbe3d2sm186046lfu.256.2023.12.07.06.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:37:06 -0800 (PST)
Date: Thu, 7 Dec 2023 17:37:03 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 11/16] net: pcs: xpcs: Change
 xpcs_create_mdiodev() suffix to "byaddr"
Message-ID: <jiblfzhnqjztssy76dojx6g7vyqgpjymnt4hz6yg6xv2psn3fo@pro373rkjbbq>
References: <20231205103559.9605-12-fancer.lancer@gmail.com>
 <202312060634.Cblfigt2-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312060634.Cblfigt2-lkp@intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 06, 2023 at 07:03:46AM +0800, kernel test robot wrote:
> Hi Serge,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/net-pcs-xpcs-Drop-sentinel-entry-from-2500basex-ifaces-list/20231205-183808
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20231205103559.9605-12-fancer.lancer%40gmail.com
> patch subject: [PATCH net-next 11/16] net: pcs: xpcs: Change xpcs_create_mdiodev() suffix to "byaddr"
> config: arc-randconfig-001-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060634.Cblfigt2-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060634.Cblfigt2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312060634.Cblfigt2-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c: In function 'txgbe_mdio_pcs_init':
> >> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:150:16: error: implicit declaration of function 'xpcs_create_mdiodev'; did you mean 'xpcs_create_byaddr'? [-Werror=implicit-function-declaration]
>      150 |         xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
>          |                ^~~~~~~~~~~~~~~~~~~
>          |                xpcs_create_byaddr
> >> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:150:14: warning: assignment to 'struct dw_xpcs *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      150 |         xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
>          |              ^
>    cc1: some warnings being treated as errors
> 
> 
> vim +150 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c

Ah, right. I had been creating the series some times earlier than this
code was introduced and just missed it on the last rebase. I'll fix
this on v2.

-Serge(y)

> 
> 854cace61387b6 Jiawen Wu      2023-06-06  121  
> 854cace61387b6 Jiawen Wu      2023-06-06  122  static int txgbe_mdio_pcs_init(struct txgbe *txgbe)
> 854cace61387b6 Jiawen Wu      2023-06-06  123  {
> 854cace61387b6 Jiawen Wu      2023-06-06  124  	struct mii_bus *mii_bus;
> 854cace61387b6 Jiawen Wu      2023-06-06  125  	struct dw_xpcs *xpcs;
> 854cace61387b6 Jiawen Wu      2023-06-06  126  	struct pci_dev *pdev;
> 854cace61387b6 Jiawen Wu      2023-06-06  127  	struct wx *wx;
> 854cace61387b6 Jiawen Wu      2023-06-06  128  	int ret = 0;
> 854cace61387b6 Jiawen Wu      2023-06-06  129  
> 854cace61387b6 Jiawen Wu      2023-06-06  130  	wx = txgbe->wx;
> 854cace61387b6 Jiawen Wu      2023-06-06  131  	pdev = wx->pdev;
> 854cace61387b6 Jiawen Wu      2023-06-06  132  
> 854cace61387b6 Jiawen Wu      2023-06-06  133  	mii_bus = devm_mdiobus_alloc(&pdev->dev);
> 854cace61387b6 Jiawen Wu      2023-06-06  134  	if (!mii_bus)
> 854cace61387b6 Jiawen Wu      2023-06-06  135  		return -ENOMEM;
> 854cace61387b6 Jiawen Wu      2023-06-06  136  
> 854cace61387b6 Jiawen Wu      2023-06-06  137  	mii_bus->name = "txgbe_pcs_mdio_bus";
> 854cace61387b6 Jiawen Wu      2023-06-06  138  	mii_bus->read_c45 = &txgbe_pcs_read;
> 854cace61387b6 Jiawen Wu      2023-06-06  139  	mii_bus->write_c45 = &txgbe_pcs_write;
> 854cace61387b6 Jiawen Wu      2023-06-06  140  	mii_bus->parent = &pdev->dev;
> 854cace61387b6 Jiawen Wu      2023-06-06  141  	mii_bus->phy_mask = ~0;
> 854cace61387b6 Jiawen Wu      2023-06-06  142  	mii_bus->priv = wx;
> 854cace61387b6 Jiawen Wu      2023-06-06  143  	snprintf(mii_bus->id, MII_BUS_ID_SIZE, "txgbe_pcs-%x",
> d8c21ef7b2b147 Xiongfeng Wang 2023-08-08  144  		 pci_dev_id(pdev));
> 854cace61387b6 Jiawen Wu      2023-06-06  145  
> 854cace61387b6 Jiawen Wu      2023-06-06  146  	ret = devm_mdiobus_register(&pdev->dev, mii_bus);
> 854cace61387b6 Jiawen Wu      2023-06-06  147  	if (ret)
> 854cace61387b6 Jiawen Wu      2023-06-06  148  		return ret;
> 854cace61387b6 Jiawen Wu      2023-06-06  149  
> 854cace61387b6 Jiawen Wu      2023-06-06 @150  	xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
> 854cace61387b6 Jiawen Wu      2023-06-06  151  	if (IS_ERR(xpcs))
> 854cace61387b6 Jiawen Wu      2023-06-06  152  		return PTR_ERR(xpcs);
> 854cace61387b6 Jiawen Wu      2023-06-06  153  
> 854cace61387b6 Jiawen Wu      2023-06-06  154  	txgbe->xpcs = xpcs;
> 854cace61387b6 Jiawen Wu      2023-06-06  155  
> 854cace61387b6 Jiawen Wu      2023-06-06  156  	return 0;
> 854cace61387b6 Jiawen Wu      2023-06-06  157  }
> 854cace61387b6 Jiawen Wu      2023-06-06  158  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
