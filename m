Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D64083D1E
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 00:01:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4637qy60NdzDr1Z
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 08:01:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=hkallweit1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KS5LCUAX"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4637q527tmzDqyw
 for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2019 08:00:16 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id s15so56593104wmj.3
 for <openbmc@lists.ozlabs.org>; Tue, 06 Aug 2019 15:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SyE/O0WhvxOUfPhh+mEZXq7ZPnaC6Vs+gmVPB6kPhjk=;
 b=KS5LCUAXM1QwTK/IvmYORp4hwBU1WBI1ci7hI41WNiFa+ljJdsq8PKdPsBOqlKZr3L
 IJ4gZ9vKdlq/PUeRTlg7h63V6v7snoBdE0mZP+7TdOOtXB54FmUf/Qg7pKWNQQzyEr/F
 kN/y1p1PgRMf9hBsMdqDKvLORZ+Tzle4F0FZhmfpd/37k5WWttZAtU3G9UmzsosN3P/h
 LYAgAG9em8aDgkJNY2Qjszim5tRykdm1a5C043JiTVDTicOvu6FvsjaL2OikVrdykoID
 Rnqfr2dHMj9V4rCWUY9PT6pyQ8RL5AmVyi7+ehvCRpCRKCOp6Otl3nRFkF3LgmVlgox5
 736g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SyE/O0WhvxOUfPhh+mEZXq7ZPnaC6Vs+gmVPB6kPhjk=;
 b=C4xN9iE5bRPyPFPmVxtLvENm9np/SYijHUGZLjbN5mWuk8FqdX2Th0XREH19wCChtk
 siXYRkDLcG3Qg0acYj1IusyHdgS28HQDjFerRQfpvJXBTv/Atf6MChEOISMrN0NXS4fd
 Z7JbIJQLpHong5nH9ffzTvIyfr3KPryjuni+eHWWpAZetEzwcCxsi/7n75aXfhlbtc3q
 8WQWK5QZyLPZzd8ECI0wA8elYjIR5Lkm5JHSZcBqLo5UAMcvZF10dV6y3ZRU1KTpF1B2
 CjjygfqvzB8uuN3u2eX97HSu/QWj6QH2vaslkFucXE+2E5mHkwpIL/tRe0YywXZ275dk
 /k/w==
X-Gm-Message-State: APjAAAWJPQxT+jf4snqntcB0VjRzv0IxqHhlrnfw6UBbTYpX9m7iLXHW
 6jxxaMisjnmdQt8zu4e6NBjDCr99
X-Google-Smtp-Source: APXvYqy1qmA3lEJZfYybzuiIfRhBG2C44G+uNdU4t8D3sg9ZOEeW48P5ilYL5QH4SBLJK2rRF6MPOw==
X-Received: by 2002:a05:600c:254b:: with SMTP id
 e11mr5935859wma.171.1565128811644; 
 Tue, 06 Aug 2019 15:00:11 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f05:8600:c8c7:5fd0:c6c9:d62?
 (p200300EA8F058600C8C75FD0C6C90D62.dip0.t-ipconnect.de.
 [2003:ea:8f05:8600:c8c7:5fd0:c6c9:d62])
 by smtp.googlemail.com with ESMTPSA id o11sm84420698wmh.37.2019.08.06.15.00.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 15:00:11 -0700 (PDT)
Subject: Re: [PATCH net-next v4 2/2] net: phy: broadcom: add 1000Base-X
 support for BCM54616S
To: Tao Ren <taoren@fb.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20190806210931.3723590-1-taoren@fb.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <36d81485-ec23-eb7b-583e-3dd0f90ca562@gmail.com>
Date: Wed, 7 Aug 2019 00:00:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806210931.3723590-1-taoren@fb.com>
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

On 06.08.2019 23:09, Tao Ren wrote:
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
>   - config_aneg: bcm54616s_config_aneg_1000bx function is added for auto
>     negotiation in 1000Base-X mode.
> 
>   - read_status: BCM54616S and BCM5482 PHY share the same read_status
>     callback which manually set link speed and duplex mode in 1000Base-X
>     mode.
> 
> Signed-off-by: Tao Ren <taoren@fb.com>
> ---
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
>  drivers/net/phy/broadcom.c | 62 ++++++++++++++++++++++++++++++++++----
>  include/linux/brcmphy.h    | 10 ++++--
>  2 files changed, 64 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
> index 937d0059e8ac..bf61ed8451e5 100644
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
> @@ -409,7 +409,7 @@ static int bcm5482_config_init(struct phy_device *phydev)
>  	return err;
>  }
>  
> -static int bcm5482_read_status(struct phy_device *phydev)
> +static int bcm54xx_read_status(struct phy_device *phydev)
>  {
>  	int err;
>  
> @@ -451,12 +451,60 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
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
> +static int bcm54616s_config_aneg_1000bx(struct phy_device *phydev)
> +{
> +	int err;
> +	int adv = 0;
> +
> +	if (linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT,
> +			      phydev->supported))
> +		adv |= ADVERTISE_1000XFULL;
> +
> +	err = phy_modify_changed(phydev, MII_ADVERTISE, 0, adv);

The "0" parameter is wrong, it must be ADVERTISE_1000XFULL.
First you reset the bit, and then you set it or not.

> +	if (err > 0)
> +		err = genphy_restart_aneg(phydev);
> +
> +	return err;
> +}
> +
>  static int bcm54616s_config_aneg(struct phy_device *phydev)
>  {
>  	int ret;
>  
>  	/* Aneg firsly. */
> -	ret = genphy_config_aneg(phydev);
> +	if (phydev->dev_flags & PHY_BCM_FLAGS_MODE_1000BX)
> +		ret = bcm54616s_config_aneg_1000bx(phydev);
> +	else
> +		ret = genphy_config_aneg(phydev);
>  
>  	/* Then we can set up the delay. */
>  	bcm54xx_config_clock_delay(phydev);
> @@ -655,6 +703,8 @@ static struct phy_driver broadcom_drivers[] = {
>  	.config_aneg	= bcm54616s_config_aneg,
>  	.ack_interrupt	= bcm_phy_ack_intr,
>  	.config_intr	= bcm_phy_config_intr,
> +	.read_status	= bcm54xx_read_status,

If you use aneg, you should also read what was negotiated.
But this function reads neither negotiated duplex mode nor
pause settings.

> +	.probe		= bcm54616s_probe,
>  }, {
>  	.phy_id		= PHY_ID_BCM5464,
>  	.phy_id_mask	= 0xfffffff0,
> @@ -689,7 +739,7 @@ static struct phy_driver broadcom_drivers[] = {
>  	.name		= "Broadcom BCM5482",
>  	/* PHY_GBIT_FEATURES */
>  	.config_init	= bcm5482_config_init,
> -	.read_status	= bcm5482_read_status,
> +	.read_status	= bcm54xx_read_status,
>  	.ack_interrupt	= bcm_phy_ack_intr,
>  	.config_intr	= bcm_phy_config_intr,
>  }, {
> diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
> index 6db2d9a6e503..b475e7f20d28 100644
> --- a/include/linux/brcmphy.h
> +++ b/include/linux/brcmphy.h
> @@ -200,9 +200,15 @@
>  #define BCM5482_SHD_SSD		0x14	/* 10100: Secondary SerDes control */
>  #define BCM5482_SHD_SSD_LEDM	0x0008	/* SSD LED Mode enable */
>  #define BCM5482_SHD_SSD_EN	0x0001	/* SSD enable */
> -#define BCM5482_SHD_MODE	0x1f	/* 11111: Mode Control Register */
> -#define BCM5482_SHD_MODE_1000BX	0x0001	/* Enable 1000BASE-X registers */
>  
> +/* 10011: SerDes 100-FX Control Register */
> +#define BCM54616S_SHD_100FX_CTRL	0x13
> +#define	BCM54616S_100FX_MODE		BIT(0)	/* 100-FX SerDes Enable */
> +
> +/* 11111: Mode Control Register */
> +#define BCM54XX_SHD_MODE		0x1f
> +#define BCM54XX_SHD_INTF_SEL_MASK	GENMASK(2, 1)	/* INTERF_SEL[1:0] */
> +#define BCM54XX_SHD_MODE_1000BX		BIT(0)	/* Enable 1000-X registers */
>  
>  /*
>   * EXPANSION SHADOW ACCESS REGISTERS.  (PHY REG 0x15, 0x16, and 0x17)
> 

