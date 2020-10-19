Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED8292413
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 10:58:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF9f614xzzDqFw
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 19:58:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TDyea6UL; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF9cd6MPfzDqYj;
 Mon, 19 Oct 2020 19:57:19 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id c5so5627507qtw.3;
 Mon, 19 Oct 2020 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4wXjVJ2kLM9uL5zZqS31DB6qTzRp54/Wsz/d0bgYSzU=;
 b=TDyea6ULvpGU7a0Dhx1tL4D0rwfJbSJTi4VN7qeh/4elwEKNOUpmDVqizB19jpmbi5
 ik+Tv9QgHViUgEFekp/zfJOGt55BpkejTYlZIzmBM2jWyoDSQXPgmZgYIHY54csWtczN
 Hf40iCTF2f9opr6ioMeyyzHWYeFWWjCrMULiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4wXjVJ2kLM9uL5zZqS31DB6qTzRp54/Wsz/d0bgYSzU=;
 b=LaKQ+C0lYsJaYOIvfddayaRdQwfsSrBTTR56UKIgdjdyGjW8e+mRsXUXr460DFUNN5
 OOsexN6a2DEcqcPxdxVuVMt81u/vxtpOv7KoswbdUELWGJTufabnefs1Mg0y+Wmvtm0/
 cxP3Me1WAsjuh0fivHHlDRadQCpxM1CGARTGbVBiix2kETqVQyUo8hSLcB5PRmrorqRM
 1y94tVAqJm0uv4pRuWaxK8GN9rb7fyGNc3Lj0w/wlASZpD85QZt+0303dbtM4o2dlXgM
 MwIGmEKf0qjU1k9rO7R3QRKM+JKx+jpMQOkFZbO9koPMhLnQcE1LMnMKpr2byh16edaz
 RSWg==
X-Gm-Message-State: AOAM530x4IoWkClverCndWPtZR1jb27xhmtxtn/EHTXDI6Pm3k69ezzC
 QbItyTrSfHRTYNEPWeL2C5ROjk0TwZUNV2xjSY4=
X-Google-Smtp-Source: ABdhPJziaiqhweWLOlZxU+9528F62BwFkgOqsRM3uuTjs1fr/ZaPnhcOPrPNTkmmTVOf98mby6Bwx3/NXCsuhATsdZI=
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr14060369qta.176.1603097835819; 
 Mon, 19 Oct 2020 01:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
In-Reply-To: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Oct 2020 08:57:03 +0000
Message-ID: <CACPK8Xfn+Gn0PHCfhX-vgLTA6e2=RT+D+fnLF67_1j1iwqh7yg@mail.gmail.com>
Subject: Re: [PATCH] net: ftgmac100: Fix missing TX-poll issue
To: Dylan Hung <dylan_hung@aspeedtech.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
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

On Mon, 19 Oct 2020 at 07:39, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
>
> The cpu accesses the register and the memory via different bus/path on
> aspeed soc.  So we can not guarantee that the tx-poll command

Just the 2600, or other versions too?

> (register access) is always behind the tx descriptor (memory).  In other
> words, the HW may start working even the data is not yet ready.  By

even if the

> adding a dummy read after the last data write, we can ensure the data
> are pushed to the memory, then guarantee the processing sequence
>
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 00024dd41147..9a99a87f29f3 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -804,7 +804,8 @@ static netdev_tx_t ftgmac100_hard_start_xmit(struct sk_buff *skb,
>          * before setting the OWN bit on the first descriptor.
>          */
>         dma_wmb();
> -       first->txdes0 = cpu_to_le32(f_ctl_stat);
> +       WRITE_ONCE(first->txdes0, cpu_to_le32(f_ctl_stat));
> +       READ_ONCE(first->txdes0);

I understand what you're trying to do here, but I'm not sure that this
is the correct way to go about it.

It does cause the compiler to produce a store and then a load.

>
>         /* Update next TX pointer */
>         priv->tx_pointer = pointer;
> --
> 2.17.1
>
