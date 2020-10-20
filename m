Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 514DB2933E0
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 06:16:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFgLF5dz2zDqW2
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 15:16:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=beGRlKaA; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFgJL3YGCzDqVQ;
 Tue, 20 Oct 2020 15:14:58 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id t6so277352qvz.4;
 Mon, 19 Oct 2020 21:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Doa5MN9UVqAi2ZBrxUM6vlz/cuBDGnQg9D05ebwmrCg=;
 b=beGRlKaAtJmvndCmbfAvOcBZJmTc7go7JN24RumXXIvY0P/rWFLs/N+fbycTBdOA3F
 7lvaPqJvuyVQVuJ/VLpq6zjUro2GF97ydpeC80mdDCDLp/qyjRo0U4oC44hZ36h9t9AO
 cM8JuxMbthxoPel8+LJBjE+1i06JZpIHrMNUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Doa5MN9UVqAi2ZBrxUM6vlz/cuBDGnQg9D05ebwmrCg=;
 b=nI5sH8MVPeWfZjSvLYpSBxrCKzMT3TNJoWigrv+4/eaT7NKYDe10qJjysuNH9FmFm6
 v/DeAidtKuXCZErV90WLrkKAqU+cei1M7yimkIAnZXBGqjWRJhO4ZM4KGJrMiiVVnSmF
 NWgTeyG3CIuWoq090MPrHbg4tp4BCPPXmQZ2/PSP7a1Qfk6txeNit0bh/btZCnFUKWUO
 u4RpfP8lfYVW2uZ8aVhCFf1Gd8RUxRtZvVd1/bNd3hN3HS4VcTfjRRwqgPmu+tH/eMb6
 W3kBqlcv/REKLLRNQTvrsjDpVUg1jEmkPCPe4x6HgYoxvhE/oh7jZlsgWXhH6XKXj/Ki
 Ib3Q==
X-Gm-Message-State: AOAM532BqHObuN19cqNUJdiNnqhCMo1EeyImpsb4xaf5rn29vBP6TjH5
 posVk1Hi0gRNNVXDUH0HWZyVpNqv0YsNewYqlok=
X-Google-Smtp-Source: ABdhPJywZAPmDv8rfDMsC6fQughlNzS16j6qH9Ov4ukKgR4TWEzP5SWO12PW/etRHRc/w4udSafZKWBKeFcmTuGCALY=
X-Received: by 2002:ad4:54e9:: with SMTP id k9mr1327596qvx.18.1603167295058;
 Mon, 19 Oct 2020 21:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
 <20201019085717.32413-5-dylan_hung@aspeedtech.com>
In-Reply-To: <20201019085717.32413-5-dylan_hung@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Oct 2020 04:14:42 +0000
Message-ID: <CACPK8Xc8NSBzN+LnZ=b5t7ODjLg9B6m2WDdR-C9SRWaDEXwOtQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] ftgmac100: Restart MAC HW once
To: Dylan Hung <dylan_hung@aspeedtech.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Po-Yu Chuang <ratbert@faraday-tech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, netdev@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 19 Oct 2020 at 08:57, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
>
> The interrupt handler may set the flag to reset the mac in the future,
> but that flag is not cleared once the reset has occured.
>
> Fixes: 10cbd6407609 ("ftgmac100: Rework NAPI & interrupts handling")
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 0c67fc3e27df..57736b049de3 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1326,6 +1326,7 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
>          */
>         if (unlikely(priv->need_mac_restart)) {
>                 ftgmac100_start_hw(priv);
> +               priv->need_mac_restart = false;
>
>                 /* Re-enable "bad" interrupts */
>                 ftgmac100_write(FTGMAC100_INT_BAD, priv->base + FTGMAC100_OFFSET_IER);
> --
> 2.17.1
>
