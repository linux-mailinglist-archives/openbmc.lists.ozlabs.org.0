Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6406D8065E
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2019 15:50:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46155l66QrzDr7d
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2019 23:50:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y7YbIfLE"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4615471KyMzDqQG
 for <openbmc@lists.ozlabs.org>; Sat,  3 Aug 2019 23:49:25 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id s49so40016108edb.1
 for <openbmc@lists.ozlabs.org>; Sat, 03 Aug 2019 06:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q9IYzXzeSG4lP61BIGe+9K600R3iR4YK5dngtIf1XZw=;
 b=Y7YbIfLEVEkeURkI7Si54tkA2K1z2oH3rnNRWxGtq/queELL96TXwddImkkxPD/5Q/
 1wzJrIy7LIsA25Bqy8rHkQQmW7/oV1+v1VqHFH2yRxG3Cj3t5xza/a6YcEeviuyomwov
 8/vnb2dyJtBcF6GJL3Ne4hxV0Q1yxIYUV+ejYM1cHeKuNGMEF4THnATi2t4UqD3sNrYY
 2elZ5gAaNmbLDbZrdZwCOlXwfVwMbq7uPfKLJRMF3u0OBvfQ8BKZ3spYIA18uwo1f3hP
 GMqOSWuQQX+jk8RALpXFFoEfn4rTsWo4BYVUl4+EWmZcSksvIJebP6I4H5n+kwP5JAQd
 0RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q9IYzXzeSG4lP61BIGe+9K600R3iR4YK5dngtIf1XZw=;
 b=jKyo2EDk2OkdmBHVfMS9pr0HrT07sxWA9DTs2hj+BpZ8pjMhALWmkeW2VYi2bdvELE
 e29dSNqyyJxFFhA3VfvXP9QOF5TNCD4J8iJ8O0JHZpZRbWfmNO0mITzqVbbzYJl3T0wg
 mqbDtKdaOWTKCgudl6Ignmsz9JWCSOy28SlvF39fu4asLayulGsy+b0phNJ7e/u1MV+u
 MwjkJlluAJwaIhZuNrj/qjq2jCYCCCwgq1nX8ZeBeIjQpHJ6LoqbfvERiftL10NZJxNs
 V2F3kiK+KZsmqMzj51InlI5/aYsPewN4OMldv27/jmgQFc3ATbeNxcEJ1Ws5lV0VU3Dc
 boAQ==
X-Gm-Message-State: APjAAAX2LHZ/VcsFzHWgnHILLkmdLSWdBhEAsiD4VQ3CB5K2D2uh5a0T
 vgng44NtZdo1Sav1CrXFyOnE+pYqZSDX3OrLElc=
X-Google-Smtp-Source: APXvYqx5YKskBh9c+q1I8ptCGQnTFpUAYjm/PTRVHjoweEcJhII/GJDreTqzlPy6JVujHosI1xHxryk9oOTWq0p4D8A=
X-Received: by 2002:a05:6402:1351:: with SMTP id
 y17mr41719081edw.18.1564840157544; 
 Sat, 03 Aug 2019 06:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190802215419.313512-1-taoren@fb.com>
In-Reply-To: <20190802215419.313512-1-taoren@fb.com>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Sat, 3 Aug 2019 16:49:06 +0300
Message-ID: <CA+h21hrOEape89MTqCUyGFt=f6ba7Q-2KcOsN_Vw2Qv8iq86jw@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
To: Tao Ren <taoren@fb.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 netdev <netdev@vger.kernel.org>, openbmc@lists.ozlabs.org,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 lkml <linux-kernel@vger.kernel.org>, Justin Chen <justinpopo6@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tao,

On Sat, 3 Aug 2019 at 00:56, Tao Ren <taoren@fb.com> wrote:
>
> genphy_read_status() cannot report correct link speed when BCM54616S PHY
> is configured in RGMII->1000Base-KX mode (for example, on Facebook CMM
> BMC platform), and it is because speed-related fields in MII registers
> are assigned different meanings in 1000X register set. Actually there
> is no speed field in 1000X register set because link speed is always
> 1000 Mb/s.
>
> The patch adds "probe" callback to detect PHY's operation mode based on
> INTERF_SEL[1:0] pins and 1000X/100FX selection bit in SerDES 100-FX
> Control register. Besides, link speed is manually set to 1000 Mb/s in
> "read_status" callback if PHY-switch link is 1000Base-X.
>
> Signed-off-by: Tao Ren <taoren@fb.com>
> ---
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
>  drivers/net/phy/broadcom.c | 41 +++++++++++++++++++++++++++++++++-----
>  include/linux/brcmphy.h    | 10 ++++++++--
>  2 files changed, 44 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
> index 937d0059e8ac..ecad8a201a09 100644
> --- a/drivers/net/phy/broadcom.c
> +++ b/drivers/net/phy/broadcom.c
> @@ -383,9 +383,9 @@ static int bcm5482_config_init(struct phy_device *phydev)
>                 /*
>                  * Select 1000BASE-X register set (primary SerDes)
>                  */
> -               reg = bcm_phy_read_shadow(phydev, BCM5482_SHD_MODE);
> -               bcm_phy_write_shadow(phydev, BCM5482_SHD_MODE,
> -                                    reg | BCM5482_SHD_MODE_1000BX);
> +               reg = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
> +               bcm_phy_write_shadow(phydev, BCM54XX_SHD_MODE,
> +                                    reg | BCM54XX_SHD_MODE_1000BX);
>
>                 /*
>                  * LED1=ACTIVITYLED, LED3=LINKSPD[2]
> @@ -409,7 +409,7 @@ static int bcm5482_config_init(struct phy_device *phydev)
>         return err;
>  }
>
> -static int bcm5482_read_status(struct phy_device *phydev)
> +static int bcm54xx_read_status(struct phy_device *phydev)
>  {
>         int err;
>
> @@ -464,6 +464,35 @@ static int bcm54616s_config_aneg(struct phy_device *phydev)
>         return ret;
>  }
>
> +static int bcm54616s_probe(struct phy_device *phydev)
> +{
> +       int val, intf_sel;
> +
> +       val = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
> +       if (val < 0)
> +               return val;
> +
> +       /* The PHY is strapped in RGMII to fiber mode when INTERF_SEL[1:0]
> +        * is 01b.
> +        */
> +       intf_sel = (val & BCM54XX_SHD_INTF_SEL_MASK) >> 1;
> +       if (intf_sel == 1) {
> +               val = bcm_phy_read_shadow(phydev, BCM54616S_SHD_100FX_CTRL);
> +               if (val < 0)
> +                       return val;
> +
> +               /* Bit 0 of the SerDes 100-FX Control register, when set
> +                * to 1, sets the MII/RGMII -> 100BASE-FX configuration.
> +                * When this bit is set to 0, it sets the GMII/RGMII ->
> +                * 1000BASE-X configuration.
> +                */
> +               if (!(val & BCM54616S_100FX_MODE))
> +                       phydev->dev_flags |= PHY_BCM_FLAGS_MODE_1000BX;
> +       }
> +
> +       return 0;
> +}
> +
>  static int brcm_phy_setbits(struct phy_device *phydev, int reg, int set)
>  {
>         int val;
> @@ -655,6 +684,8 @@ static struct phy_driver broadcom_drivers[] = {
>         .config_aneg    = bcm54616s_config_aneg,
>         .ack_interrupt  = bcm_phy_ack_intr,
>         .config_intr    = bcm_phy_config_intr,
> +       .read_status    = bcm54xx_read_status,
> +       .probe          = bcm54616s_probe,
>  }, {
>         .phy_id         = PHY_ID_BCM5464,
>         .phy_id_mask    = 0xfffffff0,
> @@ -689,7 +720,7 @@ static struct phy_driver broadcom_drivers[] = {
>         .name           = "Broadcom BCM5482",
>         /* PHY_GBIT_FEATURES */
>         .config_init    = bcm5482_config_init,
> -       .read_status    = bcm5482_read_status,
> +       .read_status    = bcm54xx_read_status,
>         .ack_interrupt  = bcm_phy_ack_intr,
>         .config_intr    = bcm_phy_config_intr,
>  }, {
> diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
> index 6db2d9a6e503..b475e7f20d28 100644
> --- a/include/linux/brcmphy.h
> +++ b/include/linux/brcmphy.h
> @@ -200,9 +200,15 @@
>  #define BCM5482_SHD_SSD                0x14    /* 10100: Secondary SerDes control */
>  #define BCM5482_SHD_SSD_LEDM   0x0008  /* SSD LED Mode enable */
>  #define BCM5482_SHD_SSD_EN     0x0001  /* SSD enable */
> -#define BCM5482_SHD_MODE       0x1f    /* 11111: Mode Control Register */
> -#define BCM5482_SHD_MODE_1000BX        0x0001  /* Enable 1000BASE-X registers */
>
> +/* 10011: SerDes 100-FX Control Register */
> +#define BCM54616S_SHD_100FX_CTRL       0x13
> +#define        BCM54616S_100FX_MODE            BIT(0)  /* 100-FX SerDes Enable */
> +
> +/* 11111: Mode Control Register */
> +#define BCM54XX_SHD_MODE               0x1f
> +#define BCM54XX_SHD_INTF_SEL_MASK      GENMASK(2, 1)   /* INTERF_SEL[1:0] */
> +#define BCM54XX_SHD_MODE_1000BX                BIT(0)  /* Enable 1000-X registers */
>
>  /*
>   * EXPANSION SHADOW ACCESS REGISTERS.  (PHY REG 0x15, 0x16, and 0x17)
> --
> 2.17.1
>

The patchset looks better now. But is it ok, I wonder, to keep
PHY_BCM_FLAGS_MODE_1000BX in phydev->dev_flags, considering that
phy_attach_direct is overwriting it?

Regards,
-Vladimir
