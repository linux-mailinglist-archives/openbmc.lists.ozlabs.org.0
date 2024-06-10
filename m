Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89533902ADE
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2024 23:49:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TNxupFfd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vylp43y8wz3cQx
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2024 07:49:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TNxupFfd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VylnY0SCNz30W7
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2024 07:49:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 418D060B47;
	Mon, 10 Jun 2024 21:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BFBC2BBFC;
	Mon, 10 Jun 2024 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718056157;
	bh=6rK6kG35qBwO/AO3WH2+bsLTUjj0hj1Fg9/KKEErN5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNxupFfdMBrulaD4zLTRrPI27tDCyvRWw6YXAKdQsRp26TpVWqpCqHfvNU/qKMFzf
	 7CbmdLycYeDZgmoenPhQwRrqynmOEqKJiva+z4usuIU+66MHQp6ny/OMIpb+G3SXqI
	 XIyYYhSa47MtgcNfFI6EljtAcrdweW2oRXcl3bgKXbovgaWnmZZeOXZ8IrO5kilE1D
	 UGZDdBxg7RHyEwPgyH/FSGxIlfnY1+f9Sszq1O7NxkuSDPCaxCEqWCZSkQr2j8DKRt
	 vehHQk9ypX8A+6vdxhPQoEy9pqXXYpkIzOTBPTFUb8yfTkaTbc9jXTEikMLKEhDE+d
	 gsGegFxRl5Hgg==
Date: Mon, 10 Jun 2024 15:49:16 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v2 06/10] dt-bindings: net: Add Synopsys DW xPCS
 bindings
Message-ID: <20240610214916.GA3120860-robh@kernel.org>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-7-fancer.lancer@gmail.com>
 <20240605232916.GA3400992-robh@kernel.org>
 <d57e77t4cz434qfdnuq7qek6zxcaehxmzlqtb3ezloh74ihclb@wn7gbfd6wbw7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d57e77t4cz434qfdnuq7qek6zxcaehxmzlqtb3ezloh74ihclb@wn7gbfd6wbw7>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2024 at 12:54:33PM +0300, Serge Semin wrote:
> On Wed, Jun 05, 2024 at 05:29:16PM -0600, Rob Herring wrote:
> > On Sun, Jun 02, 2024 at 05:36:20PM +0300, Serge Semin wrote:
> > > Synopsys DesignWare XPCS IP-core is a Physical Coding Sublayer (PCS) layer
> > > providing an interface between the Media Access Control (MAC) and Physical
> > > Medium Attachment Sublayer (PMA) through a Media independent interface.
> > > >From software point of view it exposes IEEE std. Clause 45 CSR space and
> > > can be accessible either by MDIO or MCI/APB3 bus interfaces. In the former
> > > case the PCS device is supposed to be defined under the respective MDIO
> > > bus DT-node. In the later case the DW xPCS will be just a normal IO
> > > memory-mapped device.
> > > 
> > > Besides of that DW XPCS DT-nodes can have an interrupt signal and clock
> > > source properties specified. The former one indicates the Clause 73/37
> > > auto-negotiation events like: negotiation page received, AN is completed
> > > or incompatible link partner. The clock DT-properties can describe up to
> > > three clock sources: peripheral bus clock source, internal reference clock
> > > and the externally connected reference clock.
> > > 
> > > Finally the DW XPCS IP-core can be optionally synthesized with a
> > > vendor-specific interface connected to the Synopsys PMA (also called
> > > DesignWare Consumer/Enterprise PHY). Alas that isn't auto-detectable in a
> > > portable way. So if the DW XPCS device has the respective PMA attached
> > > then it should be reflected in the DT-node compatible string so the driver
> > > would be aware of the PMA-specific device capabilities (mainly connected
> > > with CSRs available for the fine-tunings).
> > > 
> > > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > > 
> > > ---
> > > 
> > > Changelog v2:
> > > - Drop the Management Interface DT-node bindings. DW xPCS with MCI/APB3
> > >   interface is just a normal memory-mapped device.
> > > ---
> > >  .../bindings/net/pcs/snps,dw-xpcs.yaml        | 133 ++++++++++++++++++
> > >  1 file changed, 133 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
> > > new file mode 100644
> > > index 000000000000..7927bceefbf3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
> > > @@ -0,0 +1,133 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/net/pcs/snps,dw-xpcs.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Synopsys DesignWare Ethernet PCS
> > > +
> > > +maintainers:
> > > +  - Serge Semin <fancer.lancer@gmail.com>
> > > +
> > > +description:
> > > +  Synopsys DesignWare Ethernet Physical Coding Sublayer provides an interface
> > > +  between Media Access Control and Physical Medium Attachment Sublayer through
> > > +  the Media Independent Interface (XGMII, USXGMII, XLGMII, GMII, etc)
> > > +  controlled by means of the IEEE std. Clause 45 registers set. The PCS can be
> > > +  optionally synthesized with a vendor-specific interface connected to
> > > +  Synopsys PMA (also called DesignWare Consumer/Enterprise PHY) although in
> > > +  general it can be used to communicate with any compatible PHY.
> > > +
> > > +  The PCS CSRs can be accessible either over the Ethernet MDIO bus or directly
> > > +  by means of the APB3/MCI interfaces. In the later case the XPCS can be mapped
> > > +  right to the system IO memory space.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - description: Synopsys DesignWare XPCS with none or unknown PMA
> > > +        const: snps,dw-xpcs
> > > +      - description: Synopsys DesignWare XPCS with Consumer Gen1 3G PMA
> > > +        const: snps,dw-xpcs-gen1-3g
> > > +      - description: Synopsys DesignWare XPCS with Consumer Gen2 3G PMA
> > > +        const: snps,dw-xpcs-gen2-3g
> > > +      - description: Synopsys DesignWare XPCS with Consumer Gen2 6G PMA
> > > +        const: snps,dw-xpcs-gen2-6g
> > > +      - description: Synopsys DesignWare XPCS with Consumer Gen4 3G PMA
> > > +        const: snps,dw-xpcs-gen4-3g
> > > +      - description: Synopsys DesignWare XPCS with Consumer Gen4 6G PMA
> > > +        const: snps,dw-xpcs-gen4-6g
> > > +      - description: Synopsys DesignWare XPCS with Consumer Gen5 10G PMA
> > > +        const: snps,dw-xpcs-gen5-10g
> > > +      - description: Synopsys DesignWare XPCS with Consumer Gen5 12G PMA
> > > +        const: snps,dw-xpcs-gen5-12g
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description:
> > > +          In case of the MDIO management interface this just a 5-bits ID
> > > +          of the MDIO bus device. If DW XPCS CSRs space is accessed over the
> > > +          MCI or APB3 management interfaces, then the space mapping can be
> > > +          either 'direct' or 'indirect'. In the former case all Clause 45
> > > +          registers are contiguously mapped within the address space
> > > +          MMD '[20:16]', Reg '[15:0]'. In the later case the space is divided
> > > +          to the multiple 256 register sets. There is a special viewport CSR
> > > +          which is responsible for the set selection. The upper part of
> > > +          the CSR address MMD+REG[20:8] is supposed to be written in there
> > > +          so the corresponding subset would be mapped to the lowest 255 CSRs.
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - enum: [ direct, indirect ]
> > > +
> > > +  reg-io-width:
> > > +    description:
> > > +      The way the CSRs are mapped to the memory is platform depended. Since
> > > +      each Clause 45 CSR is of 16-bits wide the access instructions must be
> > > +      two bytes aligned at least.
> > > +    default: 2
> > > +    enum: [ 2, 4 ]
> > > +
> > > +  interrupts:
> > > +    description:
> > > +      System interface interrupt output (sbd_intr_o) indicating Clause 73/37
> > > +      auto-negotiation events':' Page received, AN is completed or incompatible
> > > +      link partner.
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description:
> > > +      Both MCI and APB3 interfaces are supposed to be equipped with a clock
> > > +      source connected via the clk_csr_i line.
> > > +
> > > +      PCS/PMA layer can be clocked by an internal reference clock source
> > > +      (phyN_core_refclk) or by an externally connected (phyN_pad_refclk) clock
> > > +      generator. Both clocks can be supplied at a time.
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +
> > > +  clock-names:
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +    anyOf:
> > > +      - items:
> > > +          enum: [ core, pad ]
> > 
> 
> > This has no effect. If it is true, then the 2nd entry is too.
> 
> Yeah, from the anyOf logic it's redundant indeed. But the idea was to
> signify that the DT-node may have one the next clock-names
> combination:
>    clock-names = "pad";
> or clock-names = "core";
> or clock-names = "core", "pad";
> or clock-names = "pclk";
> or clock-names = "pclk", "core";
> or clock-names = "pclk", "pad";
> or clock-names = "pclk", "core", "pad";

That would be:

oneOf:
  - minItems: 1
    items:
      - enum: [core, pad]
      - const: pad
  - minItems: 1
    items:
      - const: pclk
      - enum: [core, pad]
      - const: pad

*-names is enforced to be 'uniqueItems: true', so we don't have to worry 
about repeated entries.

This also nicely splits between MMIO and MDIO.

> > 
> > You are saying all the clocks are optional and any combination/order is 
> > valid. Do we really need it so flexible? Doubtful the h/w is that 
> > flexible.
> 
> Well, I failed to figure out a more restrictive but still simple
> constraint. Here are the conditions which need to be taken into
> account:
> 1. "pclk" is specific for the memory-mapped DW XPCS only (DT-nodes
> found under normal system bus super-node). DT-nodes placed under the
> MDIO-bus super-node obviously have the MDIO-bus communication channel
> which is clocked by the internal clock generator.
> 2. "core" (also mentioned as "alt" in the HW-databooks) and "pad"
> clock sources can be found on XPCS with DW Enterprise Gen2, Gen4, Gen5
> and Gen6 PMAs. (At least that's what I managed to find in the DW XPCS
> v3.11a HW-manual.) Both of these clock sources can be specified at a
> time. So it's the software responsibility to choose which one to use.
> 
> So based on the notes above it's still possible to have no clock
> source specified if it's an MDIO-based DW XPCS with a PMA/PHY with no
> ref-clock required.
> 
> Any idea of how to implement the constraint with these conditions
> followed?
> 
> -Serge(y)
