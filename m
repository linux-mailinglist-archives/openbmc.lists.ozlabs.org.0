Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D89AFF96
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 17:07:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T4yP5QHfzF3Kd
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 01:07:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="JhSfdGDL"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4Y30124zF3Br;
 Thu, 12 Sep 2019 00:49:10 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id o12so25613046qtf.3;
 Wed, 11 Sep 2019 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A5XOn0vC4GPgnCNAb2xJhPh7fm7Qsc3YVcoeu66V0ow=;
 b=JhSfdGDLWHQchSsKTTbaYL2d3lanGWh1bU6snzqMqlYUsbTmgquu741IO2y4CzLnnn
 xFF9+5sLDaKVVLzlMzpM5GNJHAe0EdZjfADYanypoGJBIcqS7xQozfjP/J0VtWg1MKnl
 T/6lk/ytL2NJX3N6br94MvUgja326wcjG36kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A5XOn0vC4GPgnCNAb2xJhPh7fm7Qsc3YVcoeu66V0ow=;
 b=T0v4hZ1tPH50/ueF4erm/mlScvrzbJ1PnZGMlfcW8JwUhs1Isan33iPeR3OFfFgqmS
 TbycCDK5XoiA2cFwsiHkNj8MT4JACa7/zfnt7/f8g2V2yWE3XSzCoNu1tanST9vHvNUj
 Vb9c9TRDo8lgLxT58jbYd1vdQ8N34WPeEF0wiSEp8Z08bIAJIbmkdvGbdO6rGmFVA7Xn
 0sYuapRHtwYG/7rBYb8tqZaPns19NuYGueHy81RD/uYUJtAg/i87uUUyNBPhmIsrfmcY
 +8jgXMHfBDW08fuH+GERWc/o5NVW7d16CE31Z0KvgD2LF2jnEQm1IVUrxJoQj4xteL3B
 69Rw==
X-Gm-Message-State: APjAAAUpum79s8o2xmzmGE5x9roC/jMZOi5dOG3uBg70aSrkXDxr6Cp0
 0/17hf8j2qYYoYL8gakmwt+6Oz3XUJAXHD9g0ss=
X-Google-Smtp-Source: APXvYqwWsmekgnVOZyP3ztRXLVkJUawqY8waZNluPJpoBtGqhHcgvfBOQH1tISxUZoQoAh6xx+1tOYTyMaOU7g5POGA=
X-Received: by 2002:ac8:2e94:: with SMTP id h20mr36118219qta.234.1568213346860; 
 Wed, 11 Sep 2019 07:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190910213734.3112330-1-vijaykhemka@fb.com>
 <bd5eab2e-6ba6-9e27-54d4-d9534da9d5f7@gmail.com>
In-Reply-To: <bd5eab2e-6ba6-9e27-54d4-d9534da9d5f7@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Sep 2019 14:48:54 +0000
Message-ID: <CACPK8XcS4iKfKigPbPg0BFbmjbT-kdyjiPDXjk1k5XaS5bCdAA@mail.gmail.com>
Subject: Re: [PATCH] ftgmac100: Disable HW checksum generation on AST2500
To: Florian Fainelli <f.fainelli@gmail.com>,
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, netdev@vger.kernel.org,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Luis Chamberlain <mcgrof@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ben,

On Tue, 10 Sep 2019 at 22:05, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 9/10/19 2:37 PM, Vijay Khemka wrote:
> > HW checksum generation is not working for AST2500, specially with IPV6
> > over NCSI. All TCP packets with IPv6 get dropped. By disabling this
> > it works perfectly fine with IPV6.
> >
> > Verified with IPV6 enabled and can do ssh.
>
> How about IPv4, do these packets have problem? If not, can you continue
> advertising NETIF_F_IP_CSUM but take out NETIF_F_IPV6_CSUM?
>
> >
> > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> > ---
> >  drivers/net/ethernet/faraday/ftgmac100.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> > index 030fed65393e..591c9725002b 100644
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -1839,8 +1839,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
> >       if (priv->use_ncsi)
> >               netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> >
> > -     /* AST2400  doesn't have working HW checksum generation */
> > -     if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
> > +     /* AST2400  and AST2500 doesn't have working HW checksum generation */
> > +     if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac") ||
> > +                of_device_is_compatible(np, "aspeed,ast2500-mac")))

Do you recall under what circumstances we need to disable hardware checksumming?

Cheers,

Joel

> >               netdev->hw_features &= ~NETIF_F_HW_CSUM;
> >       if (np && of_get_property(np, "no-hw-checksum", NULL))
> >               netdev->hw_features &= ~(NETIF_F_HW_CSUM | NETIF_F_RXCSUM);
> >
>
>
> --
> Florian
