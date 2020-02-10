Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAD81583BC
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 20:32:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Gbdp4CjGzDqMM
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 06:32:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=shdUAmJ1; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gbcl30ZWzDqLc;
 Tue, 11 Feb 2020 06:31:35 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id g3so4421208pgs.11;
 Mon, 10 Feb 2020 11:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZuPt180kRsjCVRCyZy+KTCJcOp2X4om9PYJBQV60Moc=;
 b=shdUAmJ14w97aqe7DSTm0HIXz2ZpCws3HjMztJNoydnWz7J6zzufdnzB/MDKNYKzjn
 Np254hbT6cgaPBn4FZz9ykTV7VmZOWgGY5G4KUBewPJZ+5RTiSSoLznfegSaBWBMTsAx
 gF4sEnhtnTO9ia+sOMz4eYufu/7D2ttRDIqjD+aWVPaJ6KVgTc7mvboVz3b1+J4ME9Ze
 s7F4c9JQ+vO4yJKRUNQVKNNIZ+unVmhZdODmaUO3wHnE1HKQpyYeaNm/mneuWgm/uK+0
 CIeE+sMw+0gmAefHNgRg+orMZZIiObTfERMqDWa9up90fnYoNWCE6hMpkPx71UwbLhCc
 IC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZuPt180kRsjCVRCyZy+KTCJcOp2X4om9PYJBQV60Moc=;
 b=RreOFPGrAW1K5QbL11ofghy7lrgfID5T+PsyE++ty5yFYpI3hZDTV0KiToT9Q9fWJe
 NptbsHu9+3xy7rwhGeUxuWK90zUR3Hyt15VImx/cCwcEr1RnGs6TCpYGkdkyuNesoOU1
 KwVxV45GsZE5jSX/kFhGabxOi2nQMOWUmpbB9GF5laP6QEoAEktQhOjvpnai/JX+0Lz2
 3DL08t5PmGhB4CLu8h1xzIXQkzHqnZnG8m5yrTmXut1QiKBWcGTNpjmfGvAXPMN64+AY
 Rl0cAvd0KXOe/BZ/QoOMMQx8lPeEcjzWj6wNj3t58cBcRMYfgen3aeovdnYldbEmRK66
 smqw==
X-Gm-Message-State: APjAAAWuo/dOWxWeVP7AqCBB38Gv8HwBT9670caq5KKnxvth33nlRyt/
 K2XmzLVYQu3j107r4tZLOMA=
X-Google-Smtp-Source: APXvYqxTAam4vg8YO3HTEwUSpm+D/PTtAnCrM86RpDJMKgUVL7IuukH9eQEDieHTCjyqJRoqovvDwQ==
X-Received: by 2002:a63:e14b:: with SMTP id h11mr3059825pgk.297.1581363093006; 
 Mon, 10 Feb 2020 11:31:33 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::2:87f0])
 by smtp.gmail.com with ESMTPSA id 28sm895963pgl.42.2020.02.10.11.31.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Feb 2020 11:31:32 -0800 (PST)
Date: Mon, 10 Feb 2020 11:31:29 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/3] usb: gadget: aspeed: add ast2600 vhub support
Message-ID: <20200210193128.GC5346@taoren-ubuntu-R90MNF91>
References: <20200131222157.20849-1-rentao.bupt@gmail.com>
 <20200131222157.20849-3-rentao.bupt@gmail.com>
 <CACPK8XcmUYhnePr1AG2M9P-oGvOM=zCM+r44jWUzPYGxUEGOGw@mail.gmail.com>
 <b7bf421b5fad397a7ef430af6c0c09602dd66c2a.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7bf421b5fad397a7ef430af6c0c09602dd66c2a.camel@kernel.crashing.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 10, 2020 at 08:29:22AM +0100, Benjamin Herrenschmidt wrote:
> On Mon, 2020-02-10 at 02:48 +0000, Joel Stanley wrote:
> > On Fri, 31 Jan 2020 at 22:22, <rentao.bupt@gmail.com> wrote:
> > > 
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > > 
> > > Add AST2600 support in aspeed-vhub driver. There are 3 major differences
> > > between AST2500 and AST2600 vhub:
> > >   - AST2600 supports 7 downstream ports while AST2500 supports 5.
> > >   - AST2600 supports 21 generic endpoints while AST2500 supports 15.
> > >   - EP0 data buffer's 8-byte DMA alignment restriction is removed from
> > >     AST2600.
> > > 
> > > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Travelling at the moment so my review might be a bit delayed. Also for
> some reason I missed your original submission, sorry about that, please
> poke me next time if I don't reply within a couple of days !

No worries Ben and thanks for the review. I thought people was too busy
during merge window :)

> 
> One thing to look into as well is the 2600 has revived the "device
> controller" which looks like a cut down version of a vhub device, so we
> should break a bit more the linkage between vhub and the underlying
> devices so the latter can be instanciated standalone...
> 
> (Foor for thought, I'm not asking you to do that right now)

Thanks for sharing your thought. I was actually curious why "device
controller" was back. Anyways I feel it might be easier to break the
linkage when we decide to add driver for the "device controller".


Cheers,

Tao
> 
> Cheers,
> Ben.
> 
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > 
> > > ---
> > >  drivers/usb/gadget/udc/aspeed-vhub/Kconfig | 4 ++--
> > >  drivers/usb/gadget/udc/aspeed-vhub/core.c  | 9 +++++++++
> > >  2 files changed, 11 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> > > index 83ba8a2eb6af..605500b19cf3 100644
> > > --- a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> > > +++ b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> > > @@ -4,5 +4,5 @@ config USB_ASPEED_VHUB
> > >         depends on ARCH_ASPEED || COMPILE_TEST
> > >         depends on USB_LIBCOMPOSITE
> > >         help
> > > -         USB peripheral controller for the Aspeed AST2500 family
> > > -         SoCs supporting the "vHub" functionality and USB2.0
> > > +         USB peripheral controller for the Aspeed AST2400, AST2500 and
> > > +         AST2600 family SoCs supporting the "vHub" functionality and USB2.0
> > > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > > index 94081cc04113..c827bf420278 100644
> > > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > > @@ -42,6 +42,11 @@ static const struct ast_vhub_config ast2400_config = {
> > >         .max_epns = 15,
> > >  };
> > > 
> > > +static const struct ast_vhub_config ast2600_config = {
> > > +       .max_ports = 7,
> > > +       .max_epns = 21,
> > > +};
> > > +
> > >  static const struct of_device_id ast_vhub_dt_ids[] = {
> > >         {
> > >                 .compatible = "aspeed,ast2400-usb-vhub",
> > > @@ -51,6 +56,10 @@ static const struct of_device_id ast_vhub_dt_ids[] = {
> > >                 .compatible = "aspeed,ast2500-usb-vhub",
> > >                 .data = &ast2400_config,
> > >         },
> > > +       {
> > > +               .compatible = "aspeed,ast2600-usb-vhub",
> > > +               .data = &ast2600_config,
> > > +       },
> > >         { }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
> > > --
> > > 2.17.1
> > > 
> 
