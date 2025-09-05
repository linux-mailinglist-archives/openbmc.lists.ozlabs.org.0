Return-Path: <openbmc+bounces-602-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D8B4816A
	for <lists+openbmc@lfdr.de>; Mon,  8 Sep 2025 02:01:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKnDc5f0xz2xS2;
	Mon,  8 Sep 2025 10:01:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757049687;
	cv=none; b=SgoANaLyPCDXIYRCn0+NM780Kx+kZRVzxmbV5g4K0s8as+y01FAJBth6Shxfyps3KSle9FB8Gxul11H4h/MG3R2ovO1CvViivfkBpg9xt9X4f1lpXXeI3V/MQKoucuNHavoPMEcw7e2dely70ka3nCxnxshuu9PkaEm/cEhBd+ig0fBB66AHP7wo1BWvUi/f10LBQpnoz9cp13f64lK2iC2dNeilkLxdETBwBrTL+AVTddFJOWcaJWZVkBr4P3UaZuZGD2F2fGvnskIm0kupqJQfeaTmoa3uM1h5RIEhKjyFrPBoKtARTh8dzynVR+n/+jcHoNAymPDQAkFDRlNrJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757049687; c=relaxed/relaxed;
	bh=93HDDhnPlJoUIuv0aOxFs6Hwi8PNmcmVMfTrVyv9Am0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEAQJlYJv1nAhz7kiWRD2TtUOfuAn5JRHGZwjB9D2zDYJSHKzH31qaUhTAT2SDFP9JnPSI1tiF+fXJjveJOeJIIPz872PwbZZYYuRcHrVMUz9y1ZL1hoYLHC6dvKvpY0YxzxzZS3/JGeQmln2+UclHPaSusCYubpsckKTSJTBWWmfwQkQBX18dEqgoCcHAGGESYKqbsotHH/Wd1WBFtaQJ7IKR7m0zIgIHYm/f34aGbV5utjVYAOH/aX2iCwb+2g36ds7ZGzl5P4w6HdKFvI/RQ8eCdGJs68qhpY5W4+v/3Tts7zgUKt0JHEUfLKXoQojBAQlZVMtGbmYCJp7fmTcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p0CmTSir; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p0CmTSir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ4T134T0z30Vj;
	Fri,  5 Sep 2025 15:21:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A3C444300;
	Fri,  5 Sep 2025 05:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26279C4CEF5;
	Fri,  5 Sep 2025 05:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757049683;
	bh=mqIISEo7LPLprFNDEUcKEaTHvMz7CvLt6reLpOwI+yU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0CmTSirH7yBCDozYoC9DlsvzZCfvAFIewxsKM229y/tgJZn5KvA0nn3sSZy76qey
	 0S5HgHbORGIloKt+m8EPv9nwzjEz43zvj3GBh53cftXZ8LLcH2zIdfbPPrP54KB6BQ
	 Y2h836z0EzbOsronUrzBLoG3jbU4WNYmVjvqvhHWcF1NTZg3/tqWeUc2cGUFYxeukL
	 kfQqw2XDwWAaZUdqwkQ76KnorupCoWqE331UKGXqY7Fus4/Dm24wxaW1aZzCZRbE2e
	 gkSyeEO9z828d4a56/6cKYREIuv1xIUvsIvs2LWAKAjEAlx31YF3I/J3fbDyUTP1PM
	 JQ3SWIjkiqXVQ==
Date: Fri, 5 Sep 2025 10:51:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, kishon@kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 03/10] dt-bindings: PCI: Add ASPEED PCIe RC support
Message-ID: <xg5avkbsoux7rw7dg67bhf7rupgr66nzak27y2jmcerrqhlb4u@l63vz3jaie2g>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
 <20250901055922.1553550-4-jacky_chou@aspeedtech.com>
 <20250902211221.GA1179675-robh@kernel.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902211221.GA1179675-robh@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 02, 2025 at 04:12:21PM GMT, Rob Herring wrote:
> On Mon, Sep 01, 2025 at 01:59:15PM +0800, Jacky Chou wrote:
> > ASPEED AST2600 provides one PCIe RC for Gen2 and AST2700 provides three
> > PCIe RC for two Gen4 and one Gen2. All of these RCs have just one root
> > port to connect to PCIe device. And also have Mem, I/O access, legacy
> > interrupt and MSI.
> > 
> > Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> > ---
> >  .../bindings/pci/aspeed,ast2600-pcie.yaml     | 179 ++++++++++++++++++
> >  1 file changed, 179 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml b/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
> > new file mode 100644
> > index 000000000000..fe75bf2961c8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
> > @@ -0,0 +1,179 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/aspeed,ast2600-pcie.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED PCIe Root Complex Controller
> > +
> > +maintainers:
> > +  - Jacky Chou <jacky_chou@aspeedtech.com>
> > +
> > +description:
> > +  The ASPEED PCIe Root Complex controller provides PCI Express Root Complex
> > +  functionality for ASPEED SoCs, such as the AST2600 and AST2700.
> > +  This controller enables connectivity to PCIe endpoint devices, supporting
> > +  memory and I/O windows, MSI and legacy interrupts, and integration with
> > +  the SoC's clock, reset, and pinctrl subsystems.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2600-pcie
> > +      - aspeed,ast2700-pcie
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  ranges:
> > +    minItems: 2
> > +    maxItems: 2
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: IntX and MSI interrupt
> > +
> > +  resets:
> > +    items:
> > +      - description: PCIe controller reset
> > +
> > +  reset-names:
> > +    items:
> > +      - const: h2x
> > +
> > +  msi-parent: true
> > +
> > +  aspeed,ahbc:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the ASPEED AHB Controller (AHBC) syscon node.
> > +      This reference is used by the PCIe controller to access
> > +      system-level configuration registers related to the AHB bus.
> > +      To enable AHB access for the PCIe controller.
> > +
> > +  aspeed,pciecfg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the ASPEED PCIe configuration syscon node.
> > +      This reference allows the PCIe controller to access
> > +      SoC-specific PCIe configuration registers. There are the others
> > +      functions such PCIe RC and PCIe EP will use this common register
> > +      to configure the SoC interfaces.
> > +

So these config registers are part of the PCIe domain? Is so, accessing them as
syscon is wrong. You should configure the registers directly from the RC and EP
controller drivers.

> > +  interrupt-controller:
> > +    description: Interrupt controller node for handling legacy PCI interrupts.

s/legacy PCI interrupts/INTx

> > +    type: object
> > +    properties:
> > +      '#address-cells':
> > +        const: 0
> > +      '#interrupt-cells':
> > +        const: 1
> > +      interrupt-controller: true
> > +
> > +    required:
> > +      - '#address-cells'
> > +      - '#interrupt-cells'
> > +      - interrupt-controller
> > +
> > +    additionalProperties: false
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: aspeed,ast2600-pcie
> > +    then:
> > +      required:
> > +        - aspeed,ahbc
> > +    else:
> > +      properties:
> > +        aspeed,ahbc: false
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: aspeed,ast2700-pcie
> > +    then:
> > +      required:
> > +        - aspeed,pciecfg
> > +    else:
> > +      properties:
> > +        aspeed,pciecfg: false
> > +
> > +required:
> > +  - reg
> > +  - interrupts
> > +  - bus-range
> > +  - ranges
> > +  - resets
> > +  - reset-names
> > +  - msi-parent
> > +  - msi-controller
> > +  - interrupt-map-mask
> > +  - interrupt-map
> > +  - interrupt-controller
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/ast2600-clock.h>
> > +
> > +    apb {
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> 
> No need to show this node.
> 
> > +
> > +      pcie0: pcie@1e770000 {
> > +        compatible = "aspeed,ast2600-pcie";
> > +        device_type = "pci";
> > +        reg = <0x1e770000 0x100>;
> > +        linux,pci-domain = <0>;
> > +        #address-cells = <3>;
> > +        #size-cells = <2>;
> > +        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> > +        bus-range = <0x80 0xff>;

Why bus number starts from 128?

> > +
> > +        ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
> > +            0x02000000 0x0 0x70000000 0x70000000 0x0 0x10000000>;
> > +
> > +        status = "disabled";
> 
> Examples should be enabled. Drop.
> 
> > +
> > +        resets = <&syscon ASPEED_RESET_H2X>;
> > +        reset-names = "h2x";
> > +
> > +        #interrupt-cells = <1>;
> > +        msi-parent = <&pcie0>;
> 
> There shouldn't be any need to point to yourself.
> 
> > +        msi-controller;
> > +
> > +        aspeed,ahbc = <&ahbc>;
> > +
> > +        interrupt-map-mask = <0 0 0 7>;
> > +        interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> > +                        <0 0 0 2 &pcie_intc0 1>,
> > +                        <0 0 0 3 &pcie_intc0 2>,
> > +                        <0 0 0 4 &pcie_intc0 3>;
> > +        pcie_intc0: interrupt-controller {
> > +          interrupt-controller;
> > +          #address-cells = <0>;
> > +          #interrupt-cells = <1>;
> > +        };
> > +
> > +        pcie@8,0 {
> > +          reg = <0x804000 0 0 0 0>;

Why the device number starts from 8?

If there are platform specific reasons behind this numbering scheme, it should
be mentioned in the description.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

