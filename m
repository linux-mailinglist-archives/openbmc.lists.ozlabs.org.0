Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1539319CDFB
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 02:57:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48thPD6cXFzDqfF
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 11:57:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=xCs3Fev0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=tjsLQu9e; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48thLH6tQjzDrfG
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 11:55:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 34D885C0096;
 Thu,  2 Apr 2020 20:55:17 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 02 Apr 2020 20:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=gYRCksOQ6MhFIqx6qlXHT0D4VzZkNh+
 oZubeF9+29Xk=; b=xCs3Fev0acaev+xo+K5XsWlox01dgCljX6VO6MWraHzLOYM
 o58dL1cI4jdDr9mR9Valcb+WmCNoofk37zsb1NNDYrp7CIlis57y9xHkJh5XvMKp
 pKi3pUvi0sFJsN1sU8xqBPD7Cxs0Po++dXpXP8cn/RE3X35aSNQx/elVGsk+UGeI
 Js/a6qG7Vbi/F3CCysIxkl4As0ifz17SNq7tuXQMPT2X0CW9mozpMxl661jUpqbj
 857UTCBl28fR8kTtCMwRkyqU2H6EQX7EKiA7hKqkG8JTY6ENTK9/ZivWkYluZMZD
 E2m84XS7taev4smFKigeugTTDcpm6lrgAFfif3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gYRCks
 OQ6MhFIqx6qlXHT0D4VzZkNh+oZubeF9+29Xk=; b=tjsLQu9eOZmiez5UOALggg
 8S0LZlpcOxBPHqvaTKLsYLIUCFJospstKQz66Yj4AFBmSi8ofLQVsvdQYHWNLc4/
 KibRR7y1Gktl00y01JBM98dmhC0r1pjfUgBmHwG/XG+ngQCdWP2rN4joutOQvc1r
 j/a9x1Qjm4JCStCRqHdpDETMcYhBjriehm+0uXxyxzJp/P8l3b9Fv7BQknkgep2D
 3r60aZdKQGD9wFDCWjXoD6mpoHfdayzueh7+98qjBHRXToiSKJ9Wnl9+d1/yNn9V
 LidieQpYputbz++Oa4cNa30LXlcO5io0WlOQjYUWMdIQKroTsi/HdVOKywG4u0dQ
 ==
X-ME-Sender: <xms:dImGXth98Ts182J7U1-E36SywAda6QucOeLk4K9tPwTtXvX5Dc9JzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdehgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:dImGXi3JHsMsEMXVQowo43HgXyOLMzxdR7A-BaeUkIZivLbUlhSIAA>
 <xmx:dImGXrpWnt7DkFzDpIi4kuvOtC0IjHUss2XbmL4ISqVLMHMeQDR8wA>
 <xmx:dImGXoE1V7ysLIqFaq1ll-l2xYFjMDxjKxb7HEczjT-eCM3TLFdvng>
 <xmx:dYmGXt-fNn7_Y1JEOe43nvQ_YYTUN7bN8Gc39kq3YDW6DjOMgBORKA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8D058E00B0; Thu,  2 Apr 2020 20:55:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1080-gca5de7b-fmstable-20200402v5
Mime-Version: 1.0
Message-Id: <ca1f8cce-6def-48a4-bc63-1ef2a4ecddc1@www.fastmail.com>
In-Reply-To: <CACPK8XfksmQhoax5NLLxJuvD5OVzZyScQNiTXuC0gzjKG1UsHw@mail.gmail.com>
References: <20200330015142.132779-1-joel@jms.id.au>
 <20200330015142.132779-3-joel@jms.id.au>
 <CACPK8XfksmQhoax5NLLxJuvD5OVzZyScQNiTXuC0gzjKG1UsHw@mail.gmail.com>
Date: Fri, 03 Apr 2020 11:25:37 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-5.4 v2 2/2] fsi: aspeed: Support cabled FSI
Content-Type: text/plain
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 30 Mar 2020, at 12:24, Joel Stanley wrote:
> On Mon, 30 Mar 2020 at 01:51, Joel Stanley <joel@jms.id.au> wrote:
> >
> > Some FSI development systems have internal FSI signals, and some have
> > external cabled FSI. Software can detect which machine this is by
> > reading a jumper GPIO, and also control which pins the signals are
> > routed to through a mux GPIO.
> >
> > This attempts to find the GPIOs at probe time. If they are not present
> > in the device tree the driver will not error and continue as before.
> >
> > The mux GPIO is owned by the FSI driver to ensure it is not modified at
> > runtime. The routing jumper obtained as non-exclusive to allow other
> > software to inspect it's state.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  drivers/fsi/fsi-master-aspeed.c | 47 +++++++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> > index f49742b310c2..374e158ccdc7 100644
> > --- a/drivers/fsi/fsi-master-aspeed.c
> > +++ b/drivers/fsi/fsi-master-aspeed.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/regmap.h>
> >  #include <linux/slab.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/gpio/consumer.h>
> >
> >  #include "fsi-master.h"
> >
> > @@ -419,6 +420,46 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
> >         return 0;
> >  }
> >
> > +static int tacoma_cabled_fsi_fixup(struct device *dev)
> > +{
> > +       struct gpio_desc *routing_gpio, *mux_gpio;
> > +       int gpio;
> > +
> > +       /*
> > +        * The routing GPIO is a jumper indicating we should mux for the
> > +        * externally connected FSI cable.
> > +        */
> > +       routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing",
> > +                       GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> > +       if (IS_ERR(routing_gpio))
> > +               return PTR_ERR(routing_gpio);
> > +       if (!routing_gpio)
> > +               return 0;
> > +
> > +       mux_gpio = devm_gpiod_get_optional(dev, "fsi-mux", GPIOD_ASIS);
> > +       if (IS_ERR(mux_gpio))
> > +               return PTR_ERR(mux_gpio);
> > +       if (!mux_gpio)
> > +               return 0;
> > +
> > +       gpio = gpiod_get_value(routing_gpio);
> > +       if (gpio < 0)
> > +               return 0;
> 
> Pretend this says:
> 
>        gpio = gpiod_get_value(routing_gpio);
>        if (gpio < 0)
>                return gpio;

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
