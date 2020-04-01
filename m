Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25119A314
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 02:48:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sSHp5BYZzDqpg
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 11:48:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pbw9SN2u; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sSGh5Z7yzDqbF;
 Wed,  1 Apr 2020 11:47:54 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id fh8so1873666pjb.5;
 Tue, 31 Mar 2020 17:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Grz3j5qN3bekOkWLBc9tIOx+lzkuYvmCGEjHfUkVS6w=;
 b=pbw9SN2uZr6z7NS/82qUlJyAHKLLx0o8fecHkIroHnXMV5ctnPROphGfQlBBot1HCJ
 9OcK1ZODxSAfZkdboOKfCd5C/IeOTtoX6AWP9AGnjMnwMF/7ZnG6SxBatPQjXWM31rFD
 bj4DxdivZodaaqf4CWmsWFHmRKfVgv3Wig1D7R1wuEuoEhm07ugJ67hxbTZa73y0n32b
 2GIVLDRCaIvrlBYTQprdx+bvgZ6PQXyND3bjQz/iajIWAl4AkY+9Na7JIKzDTW6ICix1
 /Y3bZijNDGJd8T9XyAvaZzhhNbsG4Bdlrpm5TThQ7kHe/ac11lz2rXrGlfUtBVo4nHVo
 8VnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Grz3j5qN3bekOkWLBc9tIOx+lzkuYvmCGEjHfUkVS6w=;
 b=TMLsOoJDtaHNYBYsTaidnyfmLixi7qwjvfQuvgpPqF8wiShnguX9qM97YMW3hjUuZk
 0ivF96asfaX1JXWr72pBhH4F0lX0Ugs5/aKpLTC6hpHHHedVZr8kWmF7cYApWgspcytB
 dUiQ1jUeGG3/6Llil7K37Pia7BE1NFH053nIkO3LD8j1GYw7b7msMWOHdFdbctFRcXAP
 KWGTaRnZfEENu+bttYd8dPtB26jeYnOsHy7y+Vsndyz2R6b3TXMlk/mbaLLrfoVj4xlq
 fXvKSUhy7lQ/zpr7cW8D9DT1cJN/l0btQ5o7TGkV317OH7vWhBsFNXBJopg+1xVooPOF
 +QUA==
X-Gm-Message-State: AGi0PuY+43iGbEmAiuySI4YfmOaSOuNstTxwdxGRIOmz3A0LSswSWQSk
 SB/HeBuG+ydHH+k9Jz3Eumw=
X-Google-Smtp-Source: APiQypIwqp4XKFr4P8Yaluep4OmNAhSpUlnlig+OHmK65ulBwuoPP+K+mnxUF/3q8q4/i/5EaGbmXA==
X-Received: by 2002:a17:90a:da06:: with SMTP id
 e6mr1793956pjv.14.1585702070887; 
 Tue, 31 Mar 2020 17:47:50 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-24-4-25-55.hsd1.ca.comcast.net.
 [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id x188sm261705pfx.198.2020.03.31.17.47.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 31 Mar 2020 17:47:50 -0700 (PDT)
Date: Tue, 31 Mar 2020 17:47:43 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/6] dt-bindings: usb: document aspeed vhub device
 ID/string properties
Message-ID: <20200401004741.GA6923@taoren-ubuntu-R90MNF91>
References: <20200315191632.12536-1-rentao.bupt@gmail.com>
 <20200315191632.12536-7-rentao.bupt@gmail.com>
 <20200330192347.GA6388@bogus>
 <4dc3ac910c79dcca398eb5161dde44e1cc50baca.camel@kernel.crashing.org>
 <CAL_JsqKZeCC352TKFGDNRRogSefF9vq+J=WqCEeg59PBsSOW1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKZeCC352TKFGDNRRogSefF9vq+J=WqCEeg59PBsSOW1w@mail.gmail.com>
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
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux USB List <linux-usb@vger.kernel.org>, Tao Ren <taoren@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 10:21:10AM -0600, Rob Herring wrote:
> On Mon, Mar 30, 2020 at 6:14 PM Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> >
> > On Mon, 2020-03-30 at 13:23 -0600, Rob Herring wrote:
> > > On Sun, Mar 15, 2020 at 12:16:32PM -0700, rentao.bupt@gmail.com wrote:
> > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > >
> > > > Update device tree binding document for aspeed vhub's device IDs and
> > > > string properties.
> > > >
> > > > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > > > ---
> > > >  No change in v2:
> > > >    - the patch is added into the series since v2.
> > > >
> > > >  .../bindings/usb/aspeed,usb-vhub.yaml         | 68 +++++++++++++++++++
> > > >  1 file changed, 68 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > > > index 06399ba0d9e4..5b2e8d867219 100644
> > > > --- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > > > @@ -52,6 +52,59 @@ properties:
> > > >          minimum: 1
> > > >          maximum: 21
> > > >
> > > > +  vhub-vendor-id:
> > > > +    description: vhub Vendor ID
> > > > +    allOf:
> > > > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > > > +      - maximum: 65535
> > > > +
> > > > +  vhub-product-id:
> > > > +    description: vhub Product ID
> > > > +    allOf:
> > > > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > > > +      - maximum: 65535
> > >
> > > There's already standard 'vendor-id' and 'device-id' properties. Use
> > > those.
> >
> > So yes and no... I don't fundamentally object but keep in mind that
> > traditionally, the properties are about matching with a physical
> > hardware.
> >
> > In this case however, we are describing a virtual piece of HW and so
> > those IDs are going to be picked up to be exposed as the USB
> > vendor/device of the vhub on the USB bus.
> >
> > Not necessarily an issue but it's more "configuration" than "matching"
> > and as such, it might make sense to expose that with a prefix, though I
> > would prefer something like usb-vendor-id or usb,vendor-id...
> 
> For FDT uses, it's pretty much been configuration. It's mostly been
> for PCI that I've seen these properties used.

Thank you Rob and Ben for the comments. I thought about using "vendor-id"
or "idVendor" prefixed with "usb", "hub" or "vhub", and I chose "vhub"
just to distinguish from per-port usb devices' properties in the future.
Anyways I'm very happy to update the names per your suggestions.

> 
> > > > +
> > > > +  vhub-device-revision:
> > >
> > > Specific to USB, not vhub.
> >
> > Same as the above.
> >
> > > > +    description: vhub Device Revision in binary-coded decimal
> > > > +    allOf:
> > > > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > > > +      - maximum: 65535
> > > > +
> > > > +  vhub-strings:
> > > > +    type: object
> > > > +
> > > > +    properties:
> > > > +      '#address-cells':
> > > > +        const: 1
> > > > +
> > > > +      '#size-cells':
> > > > +        const: 0
> > > > +
> > > > +    patternProperties:
> > > > +      '^string@[0-9a-f]+$':
> > > > +        type: object
> > > > +        description: string descriptors of the specific language
> > > > +
> > > > +        properties:
> > > > +          reg:
> > > > +            maxItems: 1
> > > > +            description: 16-bit Language Identifier defined by USB-IF
> > > > +
> > > > +          manufacturer:
> > > > +            description: vhub manufacturer
> > > > +            allOf:
> > > > +              - $ref: /schemas/types.yaml#/definitions/string
> > > > +
> > > > +          product:
> > > > +            description: vhub product name
> > > > +            allOf:
> > > > +              - $ref: /schemas/types.yaml#/definitions/string
> > > > +
> > > > +          serial-number:
> > > > +            description: vhub device serial number
> > > > +            allOf:
> > > > +              - $ref: /schemas/types.yaml#/definitions/string
> > >
> > > For all of this, it's USB specific, not vhub specific. I'm not sure this
> > > is the right approach. It might be better to just define properties
> > > which are just raw USB descriptors rather than inventing some DT format
> > > that then has to be converted into USB descriptors.
> >
> > Raw blob in the DT is rather annoying and leads to hard to parse stuff
> > for both humans and scripts. The main strenght of the DT is it's easy
> > to read and manipulate.
> 
> True, and I'd certainly agree when we're talking about some vendor
> specific blob. but there's already code/tools to parse USB
> descriptors.
> 
> > Also not the entire descriptor is configurable this way.
> >
> > That said, it could be that using  the DT for the above is overkill and
> > instead, we should consider a configfs like the rest of USB gadget.
> > Though it isn't obvious how to do that, the current gadget stuff
> > doesn't really "fit" what we need here.
> 
> Surely the descriptor building code can be shared at a minimum.
> 
> Regardless of whether gadget configfs fits, usually it is pretty clear
> whether something belongs in DT or userspace. That should be decided
> first.
> 
> > Maybe we could expose the port as UDCs but not actually expose them on
> > the bus until the hub is "activated" via a special configfs entry...
> 
> If control of the hub is done by userspace, I'd think configuration
> should be there too.
> 
> Rob

Perhaps it's my lack of greater knowledge in gadget/dt areas, and I'm not
quite clear what would be the recommended/accepted approach for this
case. I'm looking forward for more suggestions.


Cheers,

Tao
