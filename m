Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E56883CC
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 22:22:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464xWK4v4tzDqQs
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 06:22:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=hkallweit1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uFKxwL3J"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464xV11mvRzDqSH
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 06:21:44 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id v15so6845585wml.0
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 13:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KRYBujXeesavxkZEhR2u/6WvFBsfbrUIYbLhrwxBRGM=;
 b=uFKxwL3JgE0/swoMA2NXpTNyIp5TCvLNtLftadRXPE/WyTthtwaM2pE5IPvoVns/IL
 VAmK0o271QCRnGMdGuZw79XaH19S845iC1xUOvhW1KT21Rq8SGcqPf2IP/XnBG2bOc3U
 lLmdLEe0fcLzz8WAj8U5ZTmduFnBj13zt0c2TJcfh3nfq/uAb6bIlLk9Egwz7LTlKbsP
 H+rc5M30ZNNJr0f+SQs1FY8vuU8nPE93PU3KS2F/j8zaM3WR52mm+OOEZ2/lcQMRLxa9
 V5CV15JQo5ZXNzw9df6jVDSzCUaBGPz9pgDTOy2tlYw3L2hKub06oRq6cI4PhW82CjTm
 Q+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KRYBujXeesavxkZEhR2u/6WvFBsfbrUIYbLhrwxBRGM=;
 b=hR9SGPqbf6dPSlYe8WR4BGBXiVYLWimclIVYbQZUNEFXKgW98KysIsHzStLNVPvNFS
 cGXt2eV0n1EZxpoC86ZqYKVwNozcvXohmoxwQhZAdasVv4qGwzQDm89gp90dlN+NdoIk
 LlYtDA1je90XKgUcoRASd6GsePrkucUgO3TU/A+0cBlAG6yPmbPC2iNbgUTd6sWDoTmV
 /kwWgl10hBc7VWXF0hy/nMngvgccZQ7J0hI6mbTCOeEqIZLZj0tGE7WDYhAImmTW4JaI
 rFO23Ppxjs5mRpSY0mHE2MEtVP1yGsSyc1KHN8I9hliW2BfIO/pvY3o2T+zZmv/NNAZW
 Zs0g==
X-Gm-Message-State: APjAAAUul65KsN5ZC9Pku1IH4O1deNWfh5AZn7fQsSM8IHjJWnVugbs8
 EiPCVKGe7WN4RJWCrEGsyo0Aw+nh
X-Google-Smtp-Source: APXvYqyLCY2+UnvuTTTsqp0D0bjjDvSXFr7omopd9/6FzcqezAx2P2Hvi0mh6qbVaBd/hIzjpvsyBQ==
X-Received: by 2002:a1c:61d4:: with SMTP id
 v203mr11610033wmb.164.1565382100073; 
 Fri, 09 Aug 2019 13:21:40 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f2f:3200:2994:d24a:66a1:e0e5?
 (p200300EA8F2F32002994D24A66A1E0E5.dip0.t-ipconnect.de.
 [2003:ea:8f2f:3200:2994:d24a:66a1:e0e5])
 by smtp.googlemail.com with ESMTPSA id o11sm305922wrw.19.2019.08.09.13.21.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 13:21:39 -0700 (PDT)
Subject: Re: [PATCH net-next v6 3/3] net: phy: broadcom: add 1000Base-X
 support for BCM54616S
To: Tao Ren <taoren@fb.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20190809054411.1015962-1-taoren@fb.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <97cd059c-d98e-1392-c814-f3bd628e6366@gmail.com>
Date: Fri, 9 Aug 2019 22:21:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809054411.1015962-1-taoren@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 09.08.2019 07:44, Tao Ren wrote:
> The BCM54616S PHY cannot work properly in RGMII->1000Base-KX mode (for
> example, on Facebook CMM BMC platform), mainly because genphy functions
> are designed for copper links, and 1000Base-X (clause 37) auto negotiation
> needs to be handled differently.
> 
> This patch enables 1000Base-X support for BCM54616S by customizing 3
> driver callbacks:
> 
>   - probe: probe callback detects PHY's operation mode based on
>     INTERF_SEL[1:0] pins and 1000X/100FX selection bit in SerDES 100-FX
>     Control register.
> 
>   - config_aneg: calls genphy_c37_config_aneg when the PHY is running in
>     1000Base-X mode; otherwise, genphy_config_aneg will be called.
> 
>   - read_status: calls genphy_c37_read_status when the PHY is running in
>     1000Base-X mode; otherwise, genphy_read_status will be called.
> 
> Signed-off-by: Tao Ren <taoren@fb.com>
> ---
>  Changes in v6:
>   - nothing changed.
>  Changes in v5:
>   - include Heiner's patch "net: phy: add support for clause 37
>     auto-negotiation" into the series.
>   - use genphy_c37_config_aneg and genphy_c37_read_status in BCM54616S
>     PHY driver's callback when the PHY is running in 1000Base-X mode.
>  Changes in v4:
>   - add bcm54616s_config_aneg_1000bx() to deal with auto negotiation in
>     1000Base-X mode.
>  Changes in v3:
>   - rename bcm5482_read_status to bcm54xx_read_status so the callback can
>     be shared by BCM5482 and BCM54616S.
>  Changes in v2:
>   - Auto-detect PHY operation mode instead of passing DT node.
>   - move PHY mode auto-detect logic from config_init to probe callback.
>   - only set speed (not including duplex) in read_status callback.
>   - update patch description with more background to avoid confusion.
>   - patch #1 in the series ("net: phy: broadcom: set features explicitly
>     for BCM54616") is dropped: the fix should go to get_features callback
>     which may potentially depend on this patch.
> 
>  drivers/net/phy/broadcom.c | 54 +++++++++++++++++++++++++++++++++++---
>  include/linux/brcmphy.h    | 10 +++++--
>  2 files changed, 58 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
> index 937d0059e8ac..fbd76a31c142 100644
> --- a/drivers/net/phy/broadcom.c
> +++ b/drivers/net/phy/broadcom.c
> @@ -383,9 +383,9 @@ static int bcm5482_config_init(struct phy_device *phydev)
>  		/*
>  		 * Select 1000BASE-X register set (primary SerDes)
>  		 */
> -		reg = bcm_phy_read_shadow(phydev, BCM5482_SHD_MODE);
> -		bcm_phy_write_shadow(phydev, BCM5482_SHD_MODE,
> -				     reg | BCM5482_SHD_MODE_1000BX);
> +		reg = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
> +		bcm_phy_write_shadow(phydev, BCM54XX_SHD_MODE,
> +				     reg | BCM54XX_SHD_MODE_1000BX);
>  
>  		/*
>  		 * LED1=ACTIVITYLED, LED3=LINKSPD[2]
> @@ -451,12 +451,44 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
>  	return ret;
>  }
>  
> +static int bcm54616s_probe(struct phy_device *phydev)
> +{
> +	int val, intf_sel;
> +
> +	val = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
> +	if (val < 0)
> +		return val;
> +
> +	/* The PHY is strapped in RGMII to fiber mode when INTERF_SEL[1:0]
> +	 * is 01b.
> +	 */
> +	intf_sel = (val & BCM54XX_SHD_INTF_SEL_MASK) >> 1;
> +	if (intf_sel == 1) {
> +		val = bcm_phy_read_shadow(phydev, BCM54616S_SHD_100FX_CTRL);
> +		if (val < 0)
> +			return val;
> +
> +		/* Bit 0 of the SerDes 100-FX Control register, when set
> +		 * to 1, sets the MII/RGMII -> 100BASE-FX configuration.
> +		 * When this bit is set to 0, it sets the GMII/RGMII ->
> +		 * 1000BASE-X configuration.
> +		 */
> +		if (!(val & BCM54616S_100FX_MODE))
> +			phydev->dev_flags |= PHY_BCM_FLAGS_MODE_1000BX;
> +	}
> +
> +	return 0;
> +}
> +
>  static int bcm54616s_config_aneg(struct phy_device *phydev)
>  {
>  	int ret;
>  
>  	/* Aneg firsly. */
> -	ret = genphy_config_aneg(phydev);
> +	if (phydev->dev_flags & PHY_BCM_FLAGS_MODE_1000BX)
> +		ret = genphy_c37_config_aneg(phydev);
> +	else
> +		ret = genphy_config_aneg(phydev);
>  

I'm just wondering whether it needs to be considered that 100base-FX
doesn't support auto-negotiation. I suppose BMSR reports aneg as
supported, therefore phylib will use aneg per default.
Not sure who could set 100Base-FX mode when, but maybe at that place
also phydev->autoneg needs to be cleared. Did you test 100Base-FX mode?

Heiner
