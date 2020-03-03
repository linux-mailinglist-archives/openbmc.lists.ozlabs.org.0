Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F497176F88
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 07:35:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WnM43jHKzDqVW
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 17:35:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UbMUxmCC; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WnG45NCkzDqGL;
 Tue,  3 Mar 2020 17:31:08 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id y21so957995pfp.1;
 Mon, 02 Mar 2020 22:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ndx+j6LnVMqCAXHMVDFZLXsjTKEuusKvWbflCc649JY=;
 b=UbMUxmCCJ1iqtAUi6lktmncZnowFCN1CA8b4uv3RRka2O4keDihSXfn8yE9a2iXPoL
 9z7MgPOfyHIRosPIN1a1t2ACLwEftyMbcu3gmo9dew1aYCQFhNfkGldLuMWqX7FNANqi
 b3IkikKS9IgVFw5xhru6Tv/r/MSX3e890v5jp060Rpf0liav7ePur3okq8pvAjXZez3f
 RbpgV6gQE3ti6GZ9F7AQSEaz5PlWceHqzCoQ28ZFbN31V7noE07UcLBpPgX479J2mwQe
 pvsYq98tdanDbB4+zLyYdr0tGxAT/h0gaiN12AZbDOO0eCW7wu6gYGx8ehDn/5CpVpCJ
 a+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ndx+j6LnVMqCAXHMVDFZLXsjTKEuusKvWbflCc649JY=;
 b=MYBRWOEq2paXYyYV7Fs+qHLa+XizzRESZNMjTS7MZ+mNwvOvzZ5A/59D1fqk/rTh9B
 fIKziYSf86TBHgWaRR2dVh5kswkqcAM33Zphc2oHt211efCgTQTtAr9GF5zWyefYwRdF
 epvtYlnHzhiexzM5mDlpgv6uy3k1MLsnTmXqWwk4qYIUwgfnj07+c2uikHk564jqPlOW
 uHUruXoYQqmmfXOpXbrPqtb3WLjQvt8ugzAY6QJep+NwHg6uBCXjOM1jCpX4bruxrd89
 EMJbsenTfN9sZbK5C4lInKBn1tGEu/NX+GLFXOw9IR87VFfP4WAPSaL+PnzvKIL3eoda
 ozfQ==
X-Gm-Message-State: ANhLgQ0fI4NQh0HtVFTIazWSamfVrKEdhAOAdhG2Iq45Wvqc07GbvNZI
 ao5r6CeDsSbJgIJNKBN4/lE=
X-Google-Smtp-Source: ADFU+vuGZQszw51zqWe1fJX1aHCdONMS54hLYZPiwaStPENZVZ7FsvgKtDNPs8Yql9brDHHw68ftjQ==
X-Received: by 2002:aa7:9726:: with SMTP id k6mr146994pfg.196.1583217064295;
 Mon, 02 Mar 2020 22:31:04 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-24-4-25-55.hsd1.ca.comcast.net.
 [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 69sm4375913pfz.97.2020.03.02.22.31.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 22:31:03 -0800 (PST)
Date: Mon, 2 Mar 2020 22:30:57 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
Message-ID: <20200303063056.GA6751@taoren-ubuntu-R90MNF91>
References: <20200228020757.10513-1-rentao.bupt@gmail.com>
 <20200228020757.10513-8-rentao.bupt@gmail.com>
 <20200302234744.GA21778@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302234744.GA21778@bogus>
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
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, taoren@fb.com, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for the careful review and I've addressed all your feedback in
v7 (based on my understanding). Please kindly let me know if you have
further suggestions.


Cheers,

Tao

On Mon, Mar 02, 2020 at 05:47:44PM -0600, Rob Herring wrote:
> On Thu, Feb 27, 2020 at 06:07:57PM -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add device tree binding documentation for the Aspeed USB 2.0 Virtual HUb
> > Controller.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  Changes in v6:
> >    - added 2 required properties into example and passed "make
> >      dt_binding_check".
> >  Changes in v5:
> >    - updated maintainer to Ben.
> >    - refined patch description per Joel's suggestion.
> >  No change in v2/v3/v4:
> >    - the patch is added to the patch series since v4.
> > 
> >  .../bindings/usb/aspeed,usb-vhub.yaml         | 73 +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > new file mode 100644
> > index 000000000000..b9f33310e9a2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> 
> Dual license new bindings please.
> 
> (GPL-2.0-only OR BSD-2-Clause)
> 
> > +# Copyright (c) 2020 Facebook Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/aspeed,usb-vhub.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED USB 2.0 Virtual Hub Controller
> > +
> > +maintainers:
> > +  - Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > +
> > +description: |+
> > +  The ASPEED USB 2.0 Virtual Hub Controller implements 1 set of USB Hub
> > +  register and several sets of Device and Endpoint registers to support
> > +  the Virtual Hub's downstream USB devices.
> > +
> > +  Supported number of devices and endpoints vary depending on hardware
> > +  revisions. AST2400 and AST2500 Virtual Hub supports 5 downstream devices
> > +  and 15 generic endpoints, while AST2600 Virtual Hub supports 7 downstream
> > +  devices and 21 generic endpoints.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2400-usb-vhub
> > +      - aspeed,ast2500-usb-vhub
> > +      - aspeed,ast2600-usb-vhub
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: Common configuration registers
> 
> If 'Common' means something specific to this block, then keep. 
> Otherwise, you can drop ti.
> 
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: The Virtual Hub Controller clock gate
> 
> Drop this.
> 
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  aspeed,vhub-downstream-ports:
> > +    description: Number of downstream ports supported by the Virtual Hub
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> 
> Constraints?
> 
> 'maximum: 5' ?
> 
> default?
> 
> > +
> > +  aspeed,vhub-generic-endpoints:
> > +    description: Number of generic endpoints supported by the Virtual Hub
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> 
> Constraints?
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - interrupts
> > +  - aspeed,vhub-downstream-ports
> > +  - aspeed,vhub-generic-endpoints
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/aspeed-clock.h>
> > +    vhub: usb-vhub@1e6a0000 {
> > +            compatible = "aspeed,ast2500-usb-vhub";
> > +            reg = <0x1e6a0000 0x300>;
> > +            interrupts = <5>;
> > +            clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> > +            aspeed,vhub-downstream-ports = <5>;
> > +            aspeed,vhub-generic-endpoints = <15>;
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&pinctrl_usb2ad_default>;
> > +    };
> > -- 
> > 2.17.1
> > 
