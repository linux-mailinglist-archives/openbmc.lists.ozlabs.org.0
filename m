Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BD541A8C
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 05:05:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NsDX6MrxzDqyB
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 13:05:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="fsanEKMj"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NsD16qKrzDqjj
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 13:04:31 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id a27so9086564qkk.5
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 20:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6sBkuW5RQFR6hgAQi/dlC9FEomm/jkegouw3JFSj56I=;
 b=fsanEKMjaXlm9ERJyILWpE5XtBycwddSCsEu+euGmQj2us/DGRZo+nEy+HXKqzqWDM
 rt+tkX8ti0OR3jJ1qaQkA4MjQqgUQrYFaqULAb5WmABRhxCSFRUcL/W6Wis0+WJgvCSx
 xZ2R55rmY2fE5tQQHnFaqFrKf6LcfgAfaZYFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6sBkuW5RQFR6hgAQi/dlC9FEomm/jkegouw3JFSj56I=;
 b=qog9u7CJgl4YRaF3hw1/qTb0kCxlzdy6VOXtbO/Oh+Cl8UEwcD7Tg5MNLIv2bitYzq
 JNjPihAAIfKjQrvxNQDRs2+3tfPMNKmP34h08C6WS34XvvAg49wx5kS5KXEco6ZxwrhF
 PGaeXuK3XZFuAOS00z47BpfM/0f7RI8PhUr2yyOx4LgdhwkOql3ZtrQ4TywT1ZgmP2bV
 Hjzh3qXwzSz1Vnhd4dx/1m0y6p7x8T2HgUDRZAd7AoR82TuWKYLdrrpru+7h6GQh/nAq
 UyWOrbQ+m+SM4qw/VeYu8hjEGzfDjhI4iuiA7s8Rxekl1U5OdD+daHn2J6hf/pw/PeCm
 zjew==
X-Gm-Message-State: APjAAAWUik7k84ExA/lVz/m7REdZtoLTzZ42Utmc+SjWPEweCaPV2vm6
 WWN23m6AELWnTDXrucJLO7h3CYY3s4zI5WHTlWM=
X-Google-Smtp-Source: APXvYqwHasGnhPolyKp5+ia8BykGKmfy/cUlpwNVJCwcjYBR6YUqAztLHenPY1Us6MkwoVOM+KLetB2yexgPKeMJjsk=
X-Received: by 2002:a37:4793:: with SMTP id
 u141mr38031758qka.355.1560308667083; 
 Tue, 11 Jun 2019 20:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190606044950.5930-1-sam@mendozajonas.com>
 <20190606044950.5930-4-sam@mendozajonas.com>
In-Reply-To: <20190606044950.5930-4-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 03:04:14 +0000
Message-ID: <CACPK8Xdm4_Pnyj02Fws26mPeNSpRo5i7xHA__YbX94GbXU70mQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] net/ftgmac100: Add NC-SI mode support
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Simon Glass <sjg@chromium.org>, joe.hershberger@ni.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 6 Jun 2019 at 04:50, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
>
> Update the ftgmac100 driver to support NC-SI instead of an mdio phy
> where available. This is a common setup for Aspeed AST2x00 platforms.
>
> NC-SI mode is determined from the device-tree if either phy-mode sets it
> or the use-ncsi property exists. If set then normal mdio setup is
> skipped in favour of the NC-SI phy.
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
>  drivers/net/ftgmac100.c | 39 +++++++++++++++++++++++++++++----------

> @@ -181,7 +183,7 @@ static int ftgmac100_phy_adjust_link(struct ftgmac100_data *priv)
>         struct phy_device *phydev = priv->phydev;
>         u32 maccr;
>
> -       if (!phydev->link) {
> +       if (!phydev->link && !priv->ncsi_mode) {
>                 dev_err(phydev->dev, "No link\n");
>                 return -EREMOTEIO;
>         }
> @@ -217,7 +219,8 @@ static int ftgmac100_phy_init(struct udevice *dev)
>         if (!phydev)
>                 return -ENODEV;
>
> -       phydev->supported &= PHY_GBIT_FEATURES;
> +       if (!priv->ncsi_mode)
> +               phydev->supported &= PHY_GBIT_FEATURES;

Instead of hiding this behind ncsi_mode I was assuming the ncsi "phy"
driver would answer these questions through the phy_read callbacks.

If you don't think that is going to work then this solution isn't too
invasive, and we've been using this in Linux for a while, so we know
it works.
