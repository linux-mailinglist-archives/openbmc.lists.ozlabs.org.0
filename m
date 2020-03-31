Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54A1988BC
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 02:15:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rqbL4HkTzDqkd
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 11:15:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rqZM1zM9zDqkh;
 Tue, 31 Mar 2020 11:14:17 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 02V0DJbF013894
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 30 Mar 2020 19:13:23 -0500
Message-ID: <4dc3ac910c79dcca398eb5161dde44e1cc50baca.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 6/6] dt-bindings: usb: document aspeed vhub device
 ID/string properties
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Rob Herring <robh@kernel.org>, rentao.bupt@gmail.com
Date: Tue, 31 Mar 2020 11:13:17 +1100
In-Reply-To: <20200330192347.GA6388@bogus>
References: <20200315191632.12536-1-rentao.bupt@gmail.com>
 <20200315191632.12536-7-rentao.bupt@gmail.com>
 <20200330192347.GA6388@bogus>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, taoren@fb.com,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-30 at 13:23 -0600, Rob Herring wrote:
> On Sun, Mar 15, 2020 at 12:16:32PM -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Update device tree binding document for aspeed vhub's device IDs and
> > string properties.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  No change in v2:
> >    - the patch is added into the series since v2.
> > 
> >  .../bindings/usb/aspeed,usb-vhub.yaml         | 68 +++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > index 06399ba0d9e4..5b2e8d867219 100644
> > --- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > +++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > @@ -52,6 +52,59 @@ properties:
> >          minimum: 1
> >          maximum: 21
> >  
> > +  vhub-vendor-id:
> > +    description: vhub Vendor ID
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > +      - maximum: 65535
> > +
> > +  vhub-product-id:
> > +    description: vhub Product ID
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > +      - maximum: 65535
> 
> There's already standard 'vendor-id' and 'device-id' properties. Use 
> those.

So yes and no... I don't fundamentally object but keep in mind that
traditionally, the properties are about matching with a physical
hardware.

In this case however, we are describing a virtual piece of HW and so
those IDs are going to be picked up to be exposed as the USB
vendor/device of the vhub on the USB bus.

Not necessarily an issue but it's more "configuration" than "matching"
and as such, it might make sense to expose that with a prefix, though I
would prefer something like usb-vendor-id or usb,vendor-id...

> > +
> > +  vhub-device-revision:
> 
> Specific to USB, not vhub.

Same as the above.

> > +    description: vhub Device Revision in binary-coded decimal
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > +      - maximum: 65535
> > +
> > +  vhub-strings:
> > +    type: object
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      '^string@[0-9a-f]+$':
> > +        type: object
> > +        description: string descriptors of the specific language
> > +
> > +        properties:
> > +          reg:
> > +            maxItems: 1
> > +            description: 16-bit Language Identifier defined by USB-IF
> > +
> > +          manufacturer:
> > +            description: vhub manufacturer
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/string
> > +
> > +          product:
> > +            description: vhub product name
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/string
> > +
> > +          serial-number:
> > +            description: vhub device serial number
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/string
> 
> For all of this, it's USB specific, not vhub specific. I'm not sure this 
> is the right approach. It might be better to just define properties 
> which are just raw USB descriptors rather than inventing some DT format 
> that then has to be converted into USB descriptors.

Raw blob in the DT is rather annoying and leads to hard to parse stuff
for both humans and scripts. The main strenght of the DT is it's easy
to read and manipulate.

Also not the entire descriptor is configurable this way.

That said, it could be that using  the DT for the above is overkill and
instead, we should consider a configfs like the rest of USB gadget.
Though it isn't obvious how to do that, the current gadget stuff
doesn't really "fit" what we need here.

Maybe we could expose the port as UDCs but not actually expose them on
the bus until the hub is "activated" via a special configfs entry...

Cheers,
Ben.

> os the 
> Rob

