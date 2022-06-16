Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EAD54E0EB
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 14:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP1v56Q8pz3bmL
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 22:38:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DOYIsc2y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DOYIsc2y;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP1tb0Thkz3blh
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 22:38:30 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id o37-20020a05600c512500b0039c4ba4c64dso2758694wms.2
        for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lMsDadDdb24G8ftpS8Cq3ubf/ipMSNnN5NBHVoQlnPU=;
        b=DOYIsc2yzf2ymYK8ak6gP/hjONe1qFdLkWmFPrh9FgZF9AMJ+MUt6KMsJW8Gr1AOmN
         tKy9a5V2+1WiLopTI66sOHalLWUut79RTJREQIWbRh5xru11qIwFpBgGK1pJkj/mxLM9
         hQsQcNSaGVAcvwOpiAQ3CrTu3cG7zKKpVhkQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lMsDadDdb24G8ftpS8Cq3ubf/ipMSNnN5NBHVoQlnPU=;
        b=UPwZsxP6+TWocus/qzk5c2iH4KpURubnDWn9QyavzOuSc+hW2od5Wy5Ae37KSSIRsb
         sHIzbkKHAssQLTuXPAxYmBKHw99awme3lqWxaO5NAB5gmyPYM4Gz2egms5vp+IT0vM8i
         3vKhd38OmCp4EGNv236VA5wOcYcCE01yirx3vn47DqKyh14Yqs4PnDInXa2KfTnZhuMW
         JQHETl2qEr+kWh/VFJ1UGkrCBBy/TGmPacT3xH6B67JJtYwS0Sv7MqxPipRBAyqvQEhL
         OOqFyelz2kngpaN+Xb7x+rJEbCSVAucwfNUI5Uho5ed5h68u/NWx6GxSC/Wp4IY5Lr/W
         xwvQ==
X-Gm-Message-State: AOAM530WyTTi40QIOxy1eFyyVnXdz8eDgWb1sGsAAFgHmsZ7cDYxulEi
	+NRdaaDRfLmALencYGOUH+kKUBIMrSvHSTSU9EkjFGfk
X-Google-Smtp-Source: ABdhPJznMP/+aAk+zidpoWD/3hZHUb5QfZfNugeuiwR6CLMuOJ/4V2gQyzyxlxBeRt9/aJ8aLxXpBHOetYPj3ybSsuQ=
X-Received: by 2002:a05:600c:1e21:b0:39c:c2e5:e790 with SMTP id
 ay33-20020a05600c1e2100b0039cc2e5e790mr15540662wmb.190.1655383107349; Thu, 16
 Jun 2022 05:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220610080059.2333501-1-joel@jms.id.au> <20220610080059.2333501-2-joel@jms.id.au>
In-Reply-To: <20220610080059.2333501-2-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jun 2022 12:38:14 +0000
Message-ID: <CACPK8Xeo3U--0kjAKnk-nwHi-C+EW0wbSD0jE82C6Jp1thVhqA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/4] net: phy: ncsi: Add
 phy_interface_is_ncsi() helper
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 at 08:01, Joel Stanley <joel@jms.id.au> wrote:
>
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>
> and use it to avoid configuring NCSI in net_loop() when the DT has no
> support for it.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

I've merged this too.

> ---
>  include/phy.h         | 2 ++
>  drivers/net/phy/phy.c | 7 +++++++
>  net/net.c             | 2 +-
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/include/phy.h b/include/phy.h
> index ed21775f3bbc..a759d04038a3 100644
> --- a/include/phy.h
> +++ b/include/phy.h
> @@ -287,6 +287,8 @@ static inline bool phy_interface_is_sgmii(struct phy_=
device *phydev)
>                 phydev->interface <=3D PHY_INTERFACE_MODE_QSGMII;
>  }
>
> +bool phy_interface_is_ncsi(void);
> +
>  /* PHY UIDs for various PHYs that are referenced in external code */
>  #define PHY_UID_CS4340         0x13e51002
>  #define PHY_UID_CS4223         0x03e57003
> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index daea26c451fe..a0f7b7964464 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -988,3 +988,10 @@ int phy_get_interface_by_name(const char *str)
>
>         return -1;
>  }
> +
> +bool phy_interface_is_ncsi(void)
> +{
> +       struct eth_pdata *pdata =3D dev_get_platdata(eth_get_dev());
> +
> +       return pdata->phy_interface =3D=3D PHY_INTERFACE_MODE_NCSI;
> +}
> diff --git a/net/net.c b/net/net.c
> index f0f9cd4d946b..8449445bf65c 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -409,7 +409,7 @@ int net_loop(enum proto_t protocol)
>         debug_cond(DEBUG_INT_STATE, "--- net_loop Entry\n");
>
>  #ifdef CONFIG_PHY_NCSI
> -       if (protocol !=3D NCSI && !ncsi_active()) {
> +       if (phy_interface_is_ncsi() && protocol !=3D NCSI && !ncsi_active=
()) {
>                 printf("Configuring NCSI\n");
>                 if (net_loop(NCSI) < 0)
>                         return ret;
> --
> 2.35.1
>
