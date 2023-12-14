Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECAA813C9B
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 22:28:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KkHldzj6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srlnn5bMWz3dJ0
	for <lists+openbmc@lfdr.de>; Fri, 15 Dec 2023 08:28:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KkHldzj6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrlnD06Lkz3c5t
	for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2023 08:27:42 +1100 (AEDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2cc3dd2d897so24336051fa.0
        for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 13:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702589254; x=1703194054; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrW1sfUu89fHeO1MZ5ub9Mm5kDvZ0tDvgiSWpImaFl8=;
        b=KkHldzj64Gqiik/d2X9LPOrQJ2FnPnppiC0oHcLBgkzohZL83u94cuCT+uPnbRvUtq
         9HLr0x077N07V7wuoOCGJxVNa+4zEOLmgd7pUtiOU2GwkMHis3TYucwKAyaNUDprt2Vv
         1F94YLQe4oEkDMNcu7jS7fITcf1CDqGgbrZ+hSE/METjgRj15/ThLRHxJtC1kZPSyRC6
         /lkPWx9huAvCzmHw0XzVNg/IZzrXdHvsVA0Gch/yej04hLOW0wJXd8BLdgTpBiZln+LF
         LD7QaREB9toKLlxqm7EIouuyIe7DqmSRcw5oWauG9mqjMaCsxzmkrhMGjNPXGrQSA0/9
         /tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702589254; x=1703194054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrW1sfUu89fHeO1MZ5ub9Mm5kDvZ0tDvgiSWpImaFl8=;
        b=f6V9oxhX1wf1sV9Kz8yssPvmyHH1pNckt4e7PjR5ckFq6OCAQfWMQvTE3napc48IQO
         22bDnLTxhAZMetT+oJEEDJVbiaWNHtenRcWePcQCDhe7ju5DdYhR4uw7UON9/PjNzR0C
         az0BwOr60T3nqknhitZIrqPbhBc/4CLkBquWkvmxHP1Gda413QK3wJltbVTJK40MCR1O
         AY3gl7wP60AClBGlzQDivAPtuGNNUM3Zp9lsoTMK165rT35CXNO0CQV4N/INSVf6iO80
         REYo2fD/mtTJXMHipwRjbORy81lf/pKtTs3T7v5L7AdFR/dB9AgwO3w4b3Ft7oyMKj6g
         h8BQ==
X-Gm-Message-State: AOJu0Yymj0v/9Lq0xmDJ6SWiaCcNZ9DR8U3pkL871yZAauf1X/xq0ty0
	tH4haRUBISybmuukzWkjYiE=
X-Google-Smtp-Source: AGHT+IFlTf7dJhBgKBnEh/y8JH80Xfnv1x+c8aSAdkMdyiQzGw8j0qjuZf73U1eyWu/s8XZ0Ex5Yog==
X-Received: by 2002:ac2:5a06:0:b0:50e:166a:e5cb with SMTP id q6-20020ac25a06000000b0050e166ae5cbmr1060763lfn.97.1702589253775;
        Thu, 14 Dec 2023 13:27:33 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
        by smtp.gmail.com with ESMTPSA id d22-20020a193856000000b0050bf1c67922sm2003200lfj.79.2023.12.14.13.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 13:27:33 -0800 (PST)
Date: Fri, 15 Dec 2023 00:27:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next 08/16] dt-bindings: net: Add Synopsys DW xPCS
 bindings
Message-ID: <52rttyyba6tbklxqv3gif2oyz4ttwlqcaljdkjesb6vaji45pz@46u6t573y7k2>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-9-fancer.lancer@gmail.com>
 <20231214174058.GA624576-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214174058.GA624576-robh@kernel.org>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob

On Thu, Dec 14, 2023 at 11:40:58AM -0600, Rob Herring wrote:
> On Tue, Dec 05, 2023 at 01:35:29PM +0300, Serge Semin wrote:
> > Synopsys DesignWare XPCS IP-core is a Physical Coding Sublayer (PCS) layer
> > providing an interface between the Media Access Control (MAC) and Physical
> > Medium Attachment Sublayer (PMA) through a Media independent interface.
> > >From software point of view it exposes IEEE std. Clause 45 CSR space and
> > can be accessible either by MDIO or MCI/APB3 bus interfaces. The later
> > case is described by means of a dedicated DT-bindings which imply having
> > the DW XPCS Management Interface defined as a DT-supernode which child the
> > PCSs nodes would be (in the same way as the standard MDIO buses and
> > devices are normally defined).
> > 
> > Besides of that DW XPCS DT-nodes can have the interrupts and clock source
> > properties specified. The former one indicates the Clause 73/37
> > auto-negotiation events like: negotiation page received, AN is completed
> > or incompatible link partner. The clock DT-properties can describe up to
> > two clock sources: internal one and the one connected to the chip pad.
> > Either of them is supposed to be used as the device reference clocks.
> > 
> > Finally the DW XPCS IP-core can be optionally synthesized with a
> > vendor-specific interface connected to Synopsys PMA (also called
> > DesignWare Consumer/Enterprise PHY). Alas that isn't auto-detectable
> > anyhow so if the DW XPCS device has the respective PMA attached then it
> > should be reflected in the DT-node compatible string so the driver would
> > be aware of the PMA-specific device capabilities (mainly connected with
> > CSRs available for the fine-tunings).
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > ---
> >  .../bindings/net/pcs/snps,dw-xpcs.yaml        | 88 +++++++++++++++++++
> >  .../bindings/net/snps,dw-xpcs-mi.yaml         | 88 +++++++++++++++++++
> >  2 files changed, 176 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
> >  create mode 100644 Documentation/devicetree/bindings/net/snps,dw-xpcs-mi.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
> > new file mode 100644
> > index 000000000000..9694ef51abad
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
> > @@ -0,0 +1,88 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/pcs/snps,dw-xpcs.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synopsys DesignWare Ethernet PCS
> > +
> > +maintainers:
> > +  - Jose Abreu <Jose.Abreu@synopsys.com>
> > +
> > +description:
> > +  Synopsys DesignWare Ethernet Physical Coding Sublayer provides an interface
> > +  between Media Access Control and Physical Medium Attachment Sublayer through
> > +  the Media Independent Interface (XGMII, USXGMII, XLGMII, GMII, etc)
> > +  controlled by means of the IEEE std. Clause 45 registers set. The PCS can be
> > +  optionally synthesized with a vendor-specific interface connected to
> > +  Synopsys PMA (also called DesignWare Consumer/Enterprise PHY) although in
> > +  general it can be used to communicate with any compatible PHY.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description: Synopsys DesignWare XPCS with none or unknown PMA
> > +        const: snps,dw-xpcs
> > +      - description: Synopsys DesignWare XPCS with Consumer Gen1 3G PMA
> > +        const: snps,dw-xpcs-gen1-3g
> > +      - description: Synopsys DesignWare XPCS with Consumer Gen2 3G PMA
> > +        const: snps,dw-xpcs-gen2-3g
> > +      - description: Synopsys DesignWare XPCS with Consumer Gen2 6G PMA
> > +        const: snps,dw-xpcs-gen2-6g
> > +      - description: Synopsys DesignWare XPCS with Consumer Gen4 3G PMA
> > +        const: snps,dw-xpcs-gen4-3g
> > +      - description: Synopsys DesignWare XPCS with Consumer Gen4 6G PMA
> > +        const: snps,dw-xpcs-gen4-6g
> > +      - description: Synopsys DesignWare XPCS with Consumer Gen5 10G PMA
> > +        const: snps,dw-xpcs-gen5-10g
> > +      - description: Synopsys DesignWare XPCS with Consumer Gen5 12G PMA
> > +        const: snps,dw-xpcs-gen5-12g
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description:
> > +      System interface interrupt output (sbd_intr_o) indicating Clause 73/37
> > +      auto-negotiation events like':' Page received, AN is completed or
> 

> like':' ?

Right. I'll drop it.

> 
> > +      incompatible link partner.
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:

> > +      PCS/PMA interface be can clocked either by internal reference clock

s/be can/can be

> > +      source or by an externally connected (via a pad) clock generator.
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      enum: [ core, pad ]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> 

> Don't you always need a clock?

It depends on the PMA nature. Synopsys PHY requires either of the two
clocks: alt/core clock or pad clock. Both of them might be supplied on
a platform though, but only one can be selected at a time. It's done
by means of the Synopsys PHY-specific CSR exposed in the MMD 1
(PMA/PMD). If there is non-Synopsys PHY (PMA) attached then I guess it
can be also clocked somehow, but it will be platform-depended.

> 
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    mdio-bus {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      xgmac_pcs: ethernet-pcs@0 {
> > +        compatible = "snps,dw-xpcs";
> > +        reg = <0>;
> > +
> > +        interrupts = <79 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        clocks = <&ccu_core>, <&ccu_pad>;
> > +        clock-names = "core", "pad";
> > +      };
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/net/snps,dw-xpcs-mi.yaml b/Documentation/devicetree/bindings/net/snps,dw-xpcs-mi.yaml
> > new file mode 100644
> > index 000000000000..67ddba9d61fd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/snps,dw-xpcs-mi.yaml
> > @@ -0,0 +1,88 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/snps,dw-xpcs-mi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synopsys DesignWare Ethernet PCS Management Interface
> > +
> > +maintainers:
> > +  - Serge Semin <fancer.lancer@gmail.com>
> > +
> > +description:
> > +  Synopsys DesignWare Ethernet PCS provides an interface between MAC and PMA
> > +  through the Media Independent Interface. The PCS CSRs can be accessible over
> > +  the Ethernet MDIO bus or directly by means of the APB3/MCI interfaces. In the
> > +  later case the XPCS can be mapped right to the system IO memory space.
> > +
> > +allOf:
> > +  - $ref: mdio.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: snps,dw-xpcs-mi
> > +
> > +  reg:
> > +    items:
> > +      - description:
> > +          DW XPCS CSRs space can be either 'directly' or 'indirectly'
> > +          accessible. In the former case all Clause 45 registers are
> > +          contiguously mapped within the address space MMD '[20:16]',
> > +          Reg '[15:0]'. In the later case the space is divided to the
> > +          multiple 256 register sets. There is a special viewport CSR
> > +          which is responsible for the set selection. The upper part of
> > +          the CSR address is supposed to be written in there thus the
> > +          corresponding subset would be mapped over the lowest 255 CSRs.
> > +
> > +  reg-names:
> > +    items:
> > +      - enum: [ direct, indirect ]
> > +
> > +  reg-io-width:
> > +    description:
> > +      The way the CSRs are mapped to the memory is platform depended. Since
> 

> dependent

Ok.

> 
> > +      each Clause 45 CSR is of 16-bits wide the access instructions must be
> > +      two bytes aligned at least.
> > +    default: 2
> > +    enum: [ 2, 4 ]
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral MCI/APB3 bus clock source
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +
> > +patternProperties:
> > +  'ethernet-pcs@[0-9a-f]+$':
> > +    type: object
> > +
> > +    $ref: pcs/snps,dw-xpcs.yaml#
> 

> This causes dw-xpcs to be validated twice. Does this MDIO bus support 
> other devices on it or it is fixed config?

It turned out I was wrong to define the DW XPCS interface as the MDIO
bus. DW XPCS can be synthesized with one of the next management
interfaces:

1. MDIO - normal serial MDIO-bus interface.
2-3. MCI/APB3 - parallel interfaces so the PCS device can be easier
embedded into the system memory bus.

Initially I thought that more than one device can be accessible over
the same MCI/APB3 port with the MS bits being used to reach particular
device. But just recently I discovered that it wasn't correct. The
port_id_i[4:0] input signal isn't present for the MCI or APB3
interface. Thus the DW XPCS device is just a normal memory-mapped
platform device with no such thing like DW XPCS MI above. I'll change
the currently implemented hierarchical device representation from:

mdio@1f05d000 {
	compatible = "snps,dwmac-mi";
	reg = <0 0x1f05d000 0 0x1000>;

	xgmac_pcs: ethernet-pcs@0 {
		compatible = "snps,dw-xpcs";
		reg = <0>;
	};
};
to just a single node:
xgmac_pcs: ethernet-pcs@0 {
	compatible = "snps,dw-xpcs";
	reg = <0 0x1f05d000 0 0x1000>;

	...
};

I pointed that out earlier today in a comment to another patch of this
series:
https://lore.kernel.org/netdev/xhj7jchcv63y2bmnedxqffnmh3fvdxirccdugnnljruemuiurz@ceafs7mivbqp/

-Serge(y)

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    mdio@1f05d000 {
> > +      compatible = "snps,dw-xpcs-mi";
> > +      reg = <0x1f05d000 0x1000>;
> > +      reg-names = "indirect";
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      clocks = <&ccu_pclk>;
> > +      clock-names = "pclk";
> > +
> > +      reg-io-width = <4>;
> > +
> > +      ethernet-pcs@0 {
> > +        compatible = "snps,dw-xpcs";
> > +        reg = <0>;
> > +      };
> > +    };
> > -- 
> > 2.42.1
> > 
