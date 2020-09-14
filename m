Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA8A268970
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 12:41:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqjbP6ZQYzDqT7
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 20:41:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LAhnVK+j; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqjZc2Xx9zDqSy
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 20:41:11 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id j2so6310995eds.9
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 03:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wb2UMnmvFSzfyGrSKzRSpWcFB5yi6FJK4sjN5CtZ89k=;
 b=LAhnVK+j1sP6Nypwz3lhv9XRN9Ot7xZG44jzyrwHUbjPtf5qKI5vUS32121onLxBYu
 axJ6WgCyVCrsR2ZCpXa3ELzg1Pu0zl6EDoTSex0AL+M1jUUiaguo9fu5q+lC0wiAAaBr
 oENBRThLIcrJ5M00U5n4q/mit9i/itDW8NL0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wb2UMnmvFSzfyGrSKzRSpWcFB5yi6FJK4sjN5CtZ89k=;
 b=EbCbcStny+kj1MomKjHBjbyRHORGe9z1IQP3vXS1cUflpart+diDaNKBGCU8epx296
 ZrfY7u9v55D7lHONIas4Nhrw34lrAqx0E4pO9mxV05wnX8IoSn2rwDqJfvB4BLsIOJVA
 wW5StNcxNwjK8hRmvL0/7LHnXnDsXrMh/inVnwZl6OSfXczrtT9fvRFCnoubn0sN5bg+
 l5W7R4kPxAf8TfjFWEZ+ElTehw0KpaKp1MKMGUhLEKBeGpAx//EwioNmz8U0x34nVpft
 FLFaeM1BGaEe5yQAaGVCezK50I8FyzUESsRIEREgEnbK97cp0NoQLyOvaFuMcCzZLEve
 7M8Q==
X-Gm-Message-State: AOAM531DgJD4uelZKuXwfAJJNlcvvpdRBb+lPa+uwiy1HqTEPVpTxkLO
 PBMFd17lZiAGLv2DXdZkZg34XXVthzDYs9STVr0=
X-Google-Smtp-Source: ABdhPJxZl3JhZvCV3HRTPNo8nfhxwJGOh8aS1ffhUxuhGJfBvbiPGGugvW1ocZmgrg5jHPsgT2bzSd9QDIRRbb7h2W8=
X-Received: by 2002:aa7:de03:: with SMTP id h3mr16767285edv.232.1600080066956; 
 Mon, 14 Sep 2020 03:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200913095126.119727-1-tmaimon77@gmail.com>
In-Reply-To: <20200913095126.119727-1-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Sep 2020 10:40:54 +0000
Message-ID: <CACPK8XeR_LV=5sYKtD9J-8Y+F=RC7qVYXxVUrsE-T7QvJZgyfQ@mail.gmail.com>
Subject: Re: [dev-5.7 v1 1/4] net: npcm-emc: modify check mac_address function
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

On Sun, 13 Sep 2020 at 09:51, Tomer Maimon <tmaimon77@gmail.com> wrote:
>

I'm able to apply these patches, but we've moved from 5.7 to 5.8. I
have applied to dev-5.8 instead.

It would be good to see an upstream submission of the emc driver :)

Cheers,

Joel


> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/net/ethernet/nuvoton/npcm7xx_emc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> index 9872da33fa5d..f07449e2f68d 100644
> --- a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> +++ b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> @@ -1752,7 +1752,7 @@ static void get_mac_address(struct net_device *dev)
>
>         mac_address = of_get_mac_address(np);
>
> -       if (mac_address != 0)
> +       if (!IS_ERR(mac_address))
>                 ether_addr_copy(dev->dev_addr, mac_address);
>
>         if (is_valid_ether_addr(dev->dev_addr)) {
> --
> 2.22.0
>
