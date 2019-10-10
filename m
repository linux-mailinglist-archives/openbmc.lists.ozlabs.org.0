Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B105D1D26
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 02:10:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pWgp6mSqzDqZn
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 11:10:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pWg212BKzDqYX;
 Thu, 10 Oct 2019 11:09:49 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9A09Bj1023417;
 Wed, 9 Oct 2019 19:09:12 -0500
Message-ID: <b749ebb3c85007b7a49f12a4c80613a7a3dbbe61.camel@kernel.crashing.org>
Subject: Re: [PATCH] ftgmac100: Disable HW checksum generation on AST2500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Oskar Senft <osk@google.com>, Florian Fainelli <f.fainelli@gmail.com>
Date: Thu, 10 Oct 2019 11:09:11 +1100
In-Reply-To: <CABoTLcTNwNTua9Neuw5cuFn0Nuz1E6UAakqfkLp1rirbwoQo=w@mail.gmail.com>
References: <20190910213734.3112330-1-vijaykhemka@fb.com>
 <bd5eab2e-6ba6-9e27-54d4-d9534da9d5f7@gmail.com>
 <CACPK8XcS4iKfKigPbPg0BFbmjbT-kdyjiPDXjk1k5XaS5bCdAA@mail.gmail.com>
 <95e215664612c0487808c02232852ef2188c95a5.camel@kernel.crashing.org>
 <CABoTLcTNwNTua9Neuw5cuFn0Nuz1E6UAakqfkLp1rirbwoQo=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
 "openbmc @ lists
 . ozlabs . org" <openbmc@lists.ozlabs.org>, YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vijay Khemka <vijaykhemka@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2019-10-09 at 14:18 -0400, Oskar Senft wrote:
> Does HW in the AST2500 actually perform the HW checksum calculation,
> or would that be the responsibility of the NIC that it's talking to
> via NC-SI?

I wouldn't rely on the NC-SI NIC for UDP/TCP checksums. We should be
providing it with well formed traffic.

Cheers,
Ben.

> Oskar.
> 
> On Wed, Oct 9, 2019 at 12:38 AM Benjamin Herrenschmidt <
> benh@kernel.crashing.org> wrote:
> > On Wed, 2019-09-11 at 14:48 +0000, Joel Stanley wrote:
> > > Hi Ben,
> > > 
> > > On Tue, 10 Sep 2019 at 22:05, Florian Fainelli <
> > f.fainelli@gmail.com>
> > > wrote:
> > > > 
> > > > On 9/10/19 2:37 PM, Vijay Khemka wrote:
> > > > > HW checksum generation is not working for AST2500, specially
> > with
> > > > > IPV6
> > > > > over NCSI. All TCP packets with IPv6 get dropped. By
> > disabling
> > > > > this
> > > > > it works perfectly fine with IPV6.
> > > > > 
> > > > > Verified with IPV6 enabled and can do ssh.
> > > > 
> > > > How about IPv4, do these packets have problem? If not, can you
> > > > continue
> > > > advertising NETIF_F_IP_CSUM but take out NETIF_F_IPV6_CSUM?
> > > > 
> > > > > 
> > > > > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> > > > > ---
> > > > >  drivers/net/ethernet/faraday/ftgmac100.c | 5 +++--
> > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > > b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > > index 030fed65393e..591c9725002b 100644
> > > > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > > > @@ -1839,8 +1839,9 @@ static int ftgmac100_probe(struct
> > > > > platform_device *pdev)
> > > > >       if (priv->use_ncsi)
> > > > >               netdev->hw_features |=
> > NETIF_F_HW_VLAN_CTAG_FILTER;
> > > > > 
> > > > > -     /* AST2400  doesn't have working HW checksum generation
> > */
> > > > > -     if (np && (of_device_is_compatible(np, "aspeed,ast2400-
> > > > > mac")))
> > > > > +     /* AST2400  and AST2500 doesn't have working HW
> > checksum
> > > > > generation */
> > > > > +     if (np && (of_device_is_compatible(np, "aspeed,ast2400-
> > > > > mac") ||
> > > > > +                of_device_is_compatible(np, "aspeed,ast2500-
> > > > > mac")))
> > > 
> > > Do you recall under what circumstances we need to disable
> > hardware
> > > checksumming?
> > 
> > Any news on this ? AST2400 has no HW checksum logic in HW, AST2500
> > should work for IPV4 fine, we should only selectively disable it
> > for
> > IPV6.
> > 
> > Can you do an updated patch ?
> > 
> > Cheers,
> > Ben.
> > 

