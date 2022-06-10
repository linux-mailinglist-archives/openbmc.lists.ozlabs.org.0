Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2611545DF1
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 09:59:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKCzm6g1xz3btD
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 17:59:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ZbjKUWWD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ZbjKUWWD;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKCzN1mstz305H
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 17:59:26 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so752603wmq.0
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 00:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2p8Qbi4mKzarg4sq/oTOgWetYC2NNb1zi9monysti0s=;
        b=ZbjKUWWDFICtW9QlIPpQuBWUGHFochYXKsuQ09tu6b2W7OmzLypmQo42m/JKVrFdsU
         shJqpOmEK4tVVcX8LBv1jKTfwRzAs7p6aOCU94gSVq8FfhYcj/jqdx5EOfAZ6fCmIt74
         ZZ4DY0eM5eUCmfWNBV3Hmgf5Bh94U12EgjVR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2p8Qbi4mKzarg4sq/oTOgWetYC2NNb1zi9monysti0s=;
        b=DhCvPrpQusbY7eSfmjSjLjtN7OpOlu1bqdg9I997oWgsN+DdGaFlEQK8l7exlahQxD
         CrLnvq3WhawROT0R5nm+im1pPdTYuzr2OsQyh7bMQb6UTr/JCSQhaEVQNz5F375WYWyD
         r5EH2jGmXYRHypq4KWGWELDbHmlRd+CgGRMrQnU8N28nbzAW6AwI2R0rvmTePwhjw3bT
         IDB6jh15vyH3/fG9mvK1JA3ZFKh8IropC2KDUYHQTz4WnYFwyjxEXcNVO6/GNIYdxTX9
         wxCFyTSxkpBdtp0COGQGBU+KGfqQal3BxBoZZgw7BK7UM8tiKTrXVldt0Seuy1c9gc9Y
         LjrA==
X-Gm-Message-State: AOAM533QCUN4jPEoU7KTbV/Q1j/62FGyji3yM1T71H9yQOFAkJhH1jGB
	nEn7EFyYelvpmYGf9nK+rIVvcKFHuDHPGpa23Dr3kU2Y
X-Google-Smtp-Source: ABdhPJyQMvS8m5koCeCs1aIE91ayi4bh8GA6IzS7sCLQDMO339IMK9vKTkS+IrcbNEn5RWyQ7Ab9FQOKnUGPSUt4z7s=
X-Received: by 2002:a05:600c:5d3:b0:39c:506d:c987 with SMTP id
 p19-20020a05600c05d300b0039c506dc987mr7647720wmd.10.1654847963483; Fri, 10
 Jun 2022 00:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220608082221.460166-1-clg@kaod.org> <20220608101727.GR11809@packtop>
 <4c2702c7-14ee-df07-5c5c-eca257947536@kaod.org> <CACPK8XdzQi_tyRS05OXBeWAMKUJjCnr0B=SSRA=FKUtX1ppFuw@mail.gmail.com>
 <0e3eb1a1-a370-fc48-1f88-032d2ca436c2@kaod.org>
In-Reply-To: <0e3eb1a1-a370-fc48-1f88-032d2ca436c2@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jun 2022 07:59:11 +0000
Message-ID: <CACPK8XcJNNV0VK=HrLy=DfCyKB-CLjAfasNQCf9fsaYmJMC+iQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add a palmetto board (AST2400)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 at 07:54, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 6/10/22 08:49, Joel Stanley wrote:
> >> No because of NCSI support. net_loop() would need some tweak to
> >> avoid configuring NCSI if the DT has no advertise support.
> >>
> >> Here is a tentative try below, tested on the AST2500 EVB.
> >
> > Thanks for the patch. I tested it in qemu for rainier (p10bmc) and
> > ast2600 evb + CONFIG_PHY_NCSI=3Dy and it worked.
> >
> >   I then tested on hardware and it failed, as it seems we're still
> > trying to talk ncsi. Here's the call stack when running 'dhcp' from
> > the u-boot command line:
> >
> > #0  ncsi_startup (phydev=3D0xbcf76bc8) at ../drivers/net/phy/ncsi.c:862
> > #1  0xbef95e28 in ftgmac100_start (dev=3D<optimized out>) at
> > ../drivers/net/ftgmac100.c:378
> > #2  0xbefbf488 in eth_init () at ../net/eth-uclass.c:275
> > #3  0xbefc0814 in net_loop (protocol=3DDHCP) at ../net/net.c:426
> >
> > ftgmac100_phy_init is calling phy_connect, and it's connecting the
> > ncsi phy driver:
> >
> > struct phy_device *phy_connect(struct mii_dev *bus, int addr,
> >                                 struct eth_device *dev,
> >                                 phy_interface_t interface)
> > {
> >          struct phy_device *phydev =3D NULL;
> >          uint mask =3D (addr > 0) ? (1 << addr) : 0xffffffff;
> >
> > #ifdef CONFIG_PHY_FIXED
> >          phydev =3D phy_connect_fixed(bus, dev, interface);
> > #endif
> >
> > #ifdef CONFIG_PHY_NCSI
> >          phydev =3D phy_device_create(bus, 0, PHY_NCSI_ID, false, inter=
face);
> > #endif
>
> That's ugly :/ and we have the ncsi information in the caller.
>
> > This logic will need to be fixed so we only set ncsi if the device
> > tree specifies it.
>
> yes. Something like :
>
> @@ -932,7 +932,13 @@ struct phy_device *phy_connect(struct mi
>   #endif
>
>   #ifdef CONFIG_PHY_NCSI
> -       phydev =3D phy_device_create(bus, 0, PHY_NCSI_ID, false, interfac=
e);
> +       {
> +               struct eth_pdata *pdata =3D dev_get_platdata(dev);
> +
> +               if (pdata->phy_interface =3D=3D PHY_INTERFACE_MODE_NCSI)
> +                       phydev =3D phy_device_create(bus, 0, PHY_NCSI_ID,
> +                                                  false, interface);
> +       }
>   #endif
>
>         if (!phydev)
>
>
> ?

I have something a little different. I'll send it out in a moment.

>
> C.
>
>
> >> Subject: [PATCH] net: phy: ncsi: Add phy_interface_is_ncsi() helper
> >
> >> --- a/drivers/net/phy/phy.c
> >> +++ b/drivers/net/phy/phy.c
> >> @@ -988,3 +988,10 @@ int phy_get_interface_by_name(const char *str)
> >>
> >>          return -1;
> >>    }
> >> +
> >> +bool phy_interface_is_ncsi(void)
> >> +{
> >> +       struct eth_pdata *pdata =3D dev_get_platdata(eth_get_dev());
> >
> >
> >> +
> >> +       return pdata->phy_interface =3D=3D PHY_INTERFACE_MODE_NCSI;
> >> +}
> >> diff --git a/net/net.c b/net/net.c
> >> index f0f9cd4d946b..8449445bf65c 100644
> >> --- a/net/net.c
> >> +++ b/net/net.c
> >> @@ -409,7 +409,7 @@ int net_loop(enum proto_t protocol)
> >>          debug_cond(DEBUG_INT_STATE, "--- net_loop Entry\n");
> >>
> >>    #ifdef CONFIG_PHY_NCSI
> >> -       if (protocol !=3D NCSI && !ncsi_active()) {
> >> +       if (phy_interface_is_ncsi() && protocol !=3D NCSI && !ncsi_act=
ive()) {
> >>                  printf("Configuring NCSI\n");
> >>                  if (net_loop(NCSI) < 0)
> >>                          return ret;
> >> --
> >> 2.35.3
> >>
> >>
> >>
>
