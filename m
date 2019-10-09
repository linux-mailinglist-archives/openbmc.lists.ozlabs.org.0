Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A18D177F
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 20:22:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pMxv30FVzDqdR
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 05:22:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JCk2r4lL"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pMwx4HwnzDqbW
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 05:21:20 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id r9so2922126edl.10
 for <openbmc@lists.ozlabs.org>; Wed, 09 Oct 2019 11:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yHkBccBcnNHpwY488jaSLlc6fd4IiAVQm1KLgC1eDwU=;
 b=JCk2r4lLdEAtEB4tPPfCe4gQXtDKOAj/uTZqZjswgMEGnPOS15TmojLgEWg9okNphe
 AeJnUULN6KjIa4KZEVZaBHInQ1eDypGuDBuuyCdSKoyR8ZJPKDBhIppH6HpDS4jkxN3n
 kcMVYBHYnDz8YP8O4Zob+eAVkuCmR6JaDum4JOPgVXcl9MnHTqhIHFafpcVv4abD2wWR
 XhjBxJiSQ7LAYLN62EhUspq0sCkoYw6oz4VleeqTj9068qJZxY9Q6sgL/WOP8KzdYWgv
 C6zpWOY2j/ctW270naKNeT19e7aMwPErIi8lSgRqOyd1wljb37pqea7d/hBhHPsXd0FJ
 Gusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yHkBccBcnNHpwY488jaSLlc6fd4IiAVQm1KLgC1eDwU=;
 b=Rn2OigRAd/UQWhhM+xpnZ4VJafMlwq9HhGxSwxqF5Z22Ce1P55nEgd5rl8+izk7eoq
 y0qCfb4RMRzRmJBETbq2alqHpqDUxVIZ+TwyAYOHRmzhb8ty/rbBidqV0aA0y1YvzGkO
 wBrCiFxK6qAUo7VAA5atkSzwBrNKKSNlPCQnO0xaSRP1xv5T2v15lHA6dByJDbMOc6uq
 2pxRvlYtICAfg3J1a2fwPC6hGhfyYpkiOwyNYiVVOxR+G0VBAM9i8qAI2TX2PYAxsYSL
 n2v6y46EWvombhYFohUbMzD07p/hbSEYQ/9Cr89WexG0VyNsBtWoZe74a0bpHghdAJT0
 uxMQ==
X-Gm-Message-State: APjAAAWjYniFrXux0Nfy7GIZAelt0Hfy5x6XwYbdp44gsfjNG7sQK3ZY
 A+IGhysP7g3+7zVR8zMVvXgPNt98tdQYNs0th3LRmLioniA=
X-Google-Smtp-Source: APXvYqyzM1iml8cc0UJCa2V8V1tcCpmvzYZc9tBdwMkMDxZm3liqXHTP04Gsb9J6GSLo1BKLFmmGm3WCshLGV92hV3Y=
X-Received: by 2002:aa7:d04c:: with SMTP id n12mr4125274edo.52.1570645276110; 
 Wed, 09 Oct 2019 11:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190910213734.3112330-1-vijaykhemka@fb.com>
 <bd5eab2e-6ba6-9e27-54d4-d9534da9d5f7@gmail.com>
 <CACPK8XcS4iKfKigPbPg0BFbmjbT-kdyjiPDXjk1k5XaS5bCdAA@mail.gmail.com>
 <95e215664612c0487808c02232852ef2188c95a5.camel@kernel.crashing.org>
In-Reply-To: <95e215664612c0487808c02232852ef2188c95a5.camel@kernel.crashing.org>
From: Oskar Senft <osk@google.com>
Date: Wed, 9 Oct 2019 14:20:59 -0400
Message-ID: <CABoTLcQ=N4ugYeo5jxbGtBR0nbu_Ri-OV4pE0PP-yvwXX7W+uw@mail.gmail.com>
Subject: Re: [PATCH] ftgmac100: Disable HW checksum generation on AST2500
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, netdev@vger.kernel.org,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vijay Khemka <vijaykhemka@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Does HW in the AST2500 actually perform the HW checksum calculation,
or would that be the responsibility of the NIC that it's talking to
via NC-SI?

(Sorry for the double posting! I had HTML mode enabled by default
which causes the e-mail to be dropped in some places)


On Wed, Oct 9, 2019 at 12:38 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Wed, 2019-09-11 at 14:48 +0000, Joel Stanley wrote:
> > Hi Ben,
> >
> > On Tue, 10 Sep 2019 at 22:05, Florian Fainelli <f.fainelli@gmail.com>
> > wrote:
> > >
> > > On 9/10/19 2:37 PM, Vijay Khemka wrote:
> > > > HW checksum generation is not working for AST2500, specially with
> > > > IPV6
> > > > over NCSI. All TCP packets with IPv6 get dropped. By disabling
> > > > this
> > > > it works perfectly fine with IPV6.
> > > >
> > > > Verified with IPV6 enabled and can do ssh.
> > >
> > > How about IPv4, do these packets have problem? If not, can you
> > > continue
> > > advertising NETIF_F_IP_CSUM but take out NETIF_F_IPV6_CSUM?
> > >
> > > >
> > > > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> > > > ---
> > > >  drivers/net/ethernet/faraday/ftgmac100.c | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > index 030fed65393e..591c9725002b 100644
> > > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > @@ -1839,8 +1839,9 @@ static int ftgmac100_probe(struct
> > > > platform_device *pdev)
> > > >       if (priv->use_ncsi)
> > > >               netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> > > >
> > > > -     /* AST2400  doesn't have working HW checksum generation */
> > > > -     if (np && (of_device_is_compatible(np, "aspeed,ast2400-
> > > > mac")))
> > > > +     /* AST2400  and AST2500 doesn't have working HW checksum
> > > > generation */
> > > > +     if (np && (of_device_is_compatible(np, "aspeed,ast2400-
> > > > mac") ||
> > > > +                of_device_is_compatible(np, "aspeed,ast2500-
> > > > mac")))
> >
> > Do you recall under what circumstances we need to disable hardware
> > checksumming?
>
> Any news on this ? AST2400 has no HW checksum logic in HW, AST2500
> should work for IPV4 fine, we should only selectively disable it for
> IPV6.
>
> Can you do an updated patch ?
>
> Cheers,
> Ben.
>
