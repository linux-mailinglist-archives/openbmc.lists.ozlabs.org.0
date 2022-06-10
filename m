Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58710545CA1
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 08:50:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKBRL43HZz3by6
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 16:50:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Qr/zBVUh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Qr/zBVUh;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKBR02dMJz30D0
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 16:49:46 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id u8so30866010wrm.13
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 23:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hqgfZgB6nE3cjEKTbKQdXPMzXu6M7Ldmy/c+LDEFX3w=;
        b=Qr/zBVUhW6i3d3oVhncbtLVvNGGfIYQoOt6GzzI5/FgFrw42ezBNQ2CbPfuGDIlyJF
         7cJp88T1nejY3HMyjVd57DxTjjlInDTHTQJj6Qi6AHgGi/eOBQqh4t3LAroPzl9zIuLW
         1TtBJCJeqexhhSgiW8R8yQL3sN/bY98OHq4jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqgfZgB6nE3cjEKTbKQdXPMzXu6M7Ldmy/c+LDEFX3w=;
        b=TyYvDeP6U8VYohCgyVnYEhjcgu7rRq5l3imh6wikjVHkog4Qts1wyoJgQBTpKCRgYs
         2ZbgtE1SNqi75QVATLiAsJBtZD84B8vGcfuvEZ5RWZl6Ext5EQE4hwkFiav6vgs3V6Lg
         uql+AW8oQqBSy7SBsAwPY1PpkuC4WVGv3+oRp2XupCZP2cd/7BF5cmf9Xgv/A0Ew0hXp
         FhH5OmLkUfV/7WNsmDJBM9Ek8zmyczYVDeQdNzsGAzZrR+ITgjgShSaU8ONAxsTCun1o
         PRK1ykbnli/MFa9w+Iep3EMdKDwoqhnJKO6YwqCpA5OlfzZNGT25kuQQ1LmGSebG5lVU
         neww==
X-Gm-Message-State: AOAM532tDgrLOq/2A97qmh1Y0GSGI2PwrqojzT7Hjib6AYypJUgJlFj5
	5naaMcPEtL87+AuvXhcTF40rVITLIbEcwC3bpT4=
X-Google-Smtp-Source: ABdhPJzwsOHzGYT5OcJkj4klZzaKHBeOVAyo50NZtlXLJs6L4kjl8E5P18kijL9t8DLtYBECyxIk7MbAxaa4TPIt+d4=
X-Received: by 2002:a5d:5686:0:b0:217:7da8:8c5a with SMTP id
 f6-20020a5d5686000000b002177da88c5amr27482352wrv.3.1654843782344; Thu, 09 Jun
 2022 23:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220608082221.460166-1-clg@kaod.org> <20220608101727.GR11809@packtop>
 <4c2702c7-14ee-df07-5c5c-eca257947536@kaod.org>
In-Reply-To: <4c2702c7-14ee-df07-5c5c-eca257947536@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jun 2022 06:49:30 +0000
Message-ID: <CACPK8XdzQi_tyRS05OXBeWAMKUJjCnr0B=SSRA=FKUtX1ppFuw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add a palmetto board (AST2400)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> No because of NCSI support. net_loop() would need some tweak to
> avoid configuring NCSI if the DT has no advertise support.
>
> Here is a tentative try below, tested on the AST2500 EVB.

Thanks for the patch. I tested it in qemu for rainier (p10bmc) and
ast2600 evb + CONFIG_PHY_NCSI=y and it worked.

 I then tested on hardware and it failed, as it seems we're still
trying to talk ncsi. Here's the call stack when running 'dhcp' from
the u-boot command line:

#0  ncsi_startup (phydev=0xbcf76bc8) at ../drivers/net/phy/ncsi.c:862
#1  0xbef95e28 in ftgmac100_start (dev=<optimized out>) at
../drivers/net/ftgmac100.c:378
#2  0xbefbf488 in eth_init () at ../net/eth-uclass.c:275
#3  0xbefc0814 in net_loop (protocol=DHCP) at ../net/net.c:426

ftgmac100_phy_init is calling phy_connect, and it's connecting the
ncsi phy driver:

struct phy_device *phy_connect(struct mii_dev *bus, int addr,
                               struct eth_device *dev,
                               phy_interface_t interface)
{
        struct phy_device *phydev = NULL;
        uint mask = (addr > 0) ? (1 << addr) : 0xffffffff;

#ifdef CONFIG_PHY_FIXED
        phydev = phy_connect_fixed(bus, dev, interface);
#endif

#ifdef CONFIG_PHY_NCSI
        phydev = phy_device_create(bus, 0, PHY_NCSI_ID, false, interface);
#endif

This logic will need to be fixed so we only set ncsi if the device
tree specifies it.

> Subject: [PATCH] net: phy: ncsi: Add phy_interface_is_ncsi() helper

> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -988,3 +988,10 @@ int phy_get_interface_by_name(const char *str)
>
>         return -1;
>   }
> +
> +bool phy_interface_is_ncsi(void)
> +{
> +       struct eth_pdata *pdata = dev_get_platdata(eth_get_dev());


> +
> +       return pdata->phy_interface == PHY_INTERFACE_MODE_NCSI;
> +}
> diff --git a/net/net.c b/net/net.c
> index f0f9cd4d946b..8449445bf65c 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -409,7 +409,7 @@ int net_loop(enum proto_t protocol)
>         debug_cond(DEBUG_INT_STATE, "--- net_loop Entry\n");
>
>   #ifdef CONFIG_PHY_NCSI
> -       if (protocol != NCSI && !ncsi_active()) {
> +       if (phy_interface_is_ncsi() && protocol != NCSI && !ncsi_active()) {
>                 printf("Configuring NCSI\n");
>                 if (net_loop(NCSI) < 0)
>                         return ret;
> --
> 2.35.3
>
>
>
