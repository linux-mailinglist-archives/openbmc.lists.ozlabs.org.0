Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788228DA09
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 08:42:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB2s76wVtzDqVr
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 17:42:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gvwvpNlT; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB2rM6Bt1zDqPj;
 Wed, 14 Oct 2020 17:41:37 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id m9so1588595qth.7;
 Tue, 13 Oct 2020 23:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYVpb77m81OGf8esxe67DpKeQQwwty0E+qYw8pndICs=;
 b=gvwvpNlTL3VrOueBdyU/G8UQbGwlGUi6tQ7MrIIfHkbf70jG3r6LUtToDGUZ+9m39/
 KfjtQcVRhcGMXxWti/NGll0qTZ1Q8CAi/Es21qFuucypc2RaJ0CuhlaFAeaZJumRVtOO
 a1krOnxX3f/6+7qhVJJduGx0pNHO/tN18sq1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYVpb77m81OGf8esxe67DpKeQQwwty0E+qYw8pndICs=;
 b=XKi3lB1i/QHw2NI5HSoG/ZF/q5bRSpZK3rn+/v+rsxbYVdX9lV9ZqwUSwYI5oawpt+
 siJLG3z1kB1QCEmqP1hkVy2SfBoRt+q4FZ/vn+lxYip1O8xWSZpHJIqWoaK7uIByCE2T
 lqIkwXELiVj3YC/OVbMQrUbZ2q6TK5OV8z7WWslLXfJCStFSN23/T1dPaMJrAspsesKa
 nuUpRkYK01Ff9i00ylpd4etUUf44XDYNBWMD85INAEbcItAQwiphrQqcYcknU2Nptynr
 AZekBEncV6BCAPlEWH9BbadAtyZRI5QMiGEtkXLw0cQx5VU9QTQwB6PD+pdHftmwPRV8
 2TZg==
X-Gm-Message-State: AOAM531gtcAB6Q6oUbgnl2niy4pEr+F3NtPhEsWP5BSvypFdYYH9OiuJ
 GWsNcJEH/kWIQN2RALoKlPvoWoT8+qICaYVKzGM=
X-Google-Smtp-Source: ABdhPJzad1ODvABFwHM1RxsMIzpF0CMNZppbarTgOXe/6nXpCz8ZZmDpmc9ZYxiNOFy8SZ/ngRLiC4c8WchQTZillxk=
X-Received: by 2002:ac8:3674:: with SMTP id n49mr3349956qtb.385.1602657693846; 
 Tue, 13 Oct 2020 23:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201014060632.16085-1-dylan_hung@aspeedtech.com>
 <20201014060632.16085-2-dylan_hung@aspeedtech.com>
In-Reply-To: <20201014060632.16085-2-dylan_hung@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Oct 2020 06:41:21 +0000
Message-ID: <CACPK8Xe_O44BUaPCEm2j3ZN+d4q6JbjEttLsiCLbWF6GnaqSPg@mail.gmail.com>
Subject: Re: [PATCH 1/1] net: ftgmac100: Fix Aspeed ast2600 TX hang issue
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

On Wed, 14 Oct 2020 at 06:07, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
>
> The new HW arbitration feature on Aspeed ast2600 will cause MAC TX to
> hang when handling scatter-gather DMA.  Disable the problematic feature
> by setting MAC register 0x58 bit28 and bit27.

Hi Dylan,

What are the symptoms of this issue? We are seeing this on our systems:

[29376.090637] WARNING: CPU: 0 PID: 9 at net/sched/sch_generic.c:442
dev_watchdog+0x2f0/0x2f4
[29376.099898] NETDEV WATCHDOG: eth0 (ftgmac100): transmit queue 0 timed out

> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>

This fixes support for the ast2600, so we can put:

Fixes: 39bfab8844a0 ("net: ftgmac100: Add support for DT phy-handle property")

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
>  drivers/net/ethernet/faraday/ftgmac100.h | 8 ++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 87236206366f..00024dd41147 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1817,6 +1817,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
>                 priv->rxdes0_edorr_mask = BIT(30);
>                 priv->txdes0_edotr_mask = BIT(30);
>                 priv->is_aspeed = true;
> +               /* Disable ast2600 problematic HW arbitration */
> +               if (of_device_is_compatible(np, "aspeed,ast2600-mac")) {
> +                       iowrite32(FTGMAC100_TM_DEFAULT,
> +                                 priv->base + FTGMAC100_OFFSET_TM);
> +               }
>         } else {
>                 priv->rxdes0_edorr_mask = BIT(15);
>                 priv->txdes0_edotr_mask = BIT(15);
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
> index e5876a3fda91..63b3e02fab16 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.h
> +++ b/drivers/net/ethernet/faraday/ftgmac100.h
> @@ -169,6 +169,14 @@
>  #define FTGMAC100_MACCR_FAST_MODE      (1 << 19)
>  #define FTGMAC100_MACCR_SW_RST         (1 << 31)
>
> +/*
> + * test mode control register
> + */
> +#define FTGMAC100_TM_RQ_TX_VALID_DIS (1 << 28)
> +#define FTGMAC100_TM_RQ_RR_IDLE_PREV (1 << 27)
> +#define FTGMAC100_TM_DEFAULT                                                   \
> +       (FTGMAC100_TM_RQ_TX_VALID_DIS | FTGMAC100_TM_RQ_RR_IDLE_PREV)

Will aspeed issue an updated datasheet with this register documented?


> +
>  /*
>   * PHY control register
>   */
> --
> 2.17.1
>
