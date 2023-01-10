Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC1664FEF
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 00:25:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ns6Nn32Jyz3c9Q
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 10:25:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k5GWUzCe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k5GWUzCe;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ns6Ls2zZpz3fMf;
	Wed, 11 Jan 2023 10:23:33 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DBAB6192F;
	Tue, 10 Jan 2023 23:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF0AC433EF;
	Tue, 10 Jan 2023 23:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673393009;
	bh=o0df4cpNRy6YpDsjwjtXWXgChokTskhqflfwg7VOyFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k5GWUzCe9Mf2FxRWayVjMUxkI+N8OTh185uZ/ZA0GjsXOJGIFXnFtpY48F4SpgNLi
	 WN5TjjNDN7CDoAFRUYEDTFukBWK0G8WLdeixrtvKE35pd9wnRZ+YyF02s01tQeB3PA
	 4CuaVQYrYlVSfEc8pZScSWGeczpvOSarDxJnG5pkXxYWCuolNZD0HXay1YFSGPEP8c
	 ICEK8MiARdccmj19Kv7ZafvRJoQ49Yh3lwbcDfbrP9EdHTcd9/eaEPD0xgTCTmeZkG
	 T3WKcKNQGtO8FvoKMLD+kxtiBIvDDXK2Bhxp1VPqRkwWkXy/S8fHI0AQsX7Q3I5pDQ
	 AySDMKSJFyTDA==
Received: by mail-vs1-f54.google.com with SMTP id i185so13989647vsc.6;
        Tue, 10 Jan 2023 15:23:29 -0800 (PST)
X-Gm-Message-State: AFqh2kpXbUYkyW/ylhNCpxNp6KRCwdxu1vKcKh6uy9SA022wlb1vVTur
	qLeH1jX4627wdM/rx4XI4ulpHCAxxYYSnXwotQ==
X-Google-Smtp-Source: AMrXdXsCb25ac3FsRapXcWksL279Hr0yJ0SVS03/Ax5VVj47am4K7cFEqdRASW3Mr/Jkd4YD+4EiAON9OOD+WarqVws=
X-Received: by 2002:a05:6102:1594:b0:3b1:4b76:5b44 with SMTP id
 g20-20020a056102159400b003b14b765b44mr8953747vsv.53.1673393008473; Tue, 10
 Jan 2023 15:23:28 -0800 (PST)
MIME-Version: 1.0
References: <20230110-dt-usb-v1-0-8e366e326513@kernel.org> <20230110-dt-usb-v1-2-8e366e326513@kernel.org>
In-Reply-To: <20230110-dt-usb-v1-2-8e366e326513@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Jan 2023 17:23:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZJUr+9UEm0AJeYgxb_9UNSbgeKaUctuVw7FCFMjR_+g@mail.gmail.com>
Message-ID: <CAL_JsqKZJUr+9UEm0AJeYgxb_9UNSbgeKaUctuVw7FCFMjR_+g@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: usb: Convert multiple "usb-ohci"
 bindings to DT schema
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 10, 2023 at 5:18 PM Rob Herring <robh@kernel.org> wrote:
>
> "usb-ohci" is another "generic" OHCI controller compatible string used by
> several platforms. Add it to the generic-ohci.yaml schema and remove all
> the old binding docs.
>
> Marvell pxa-usb.txt has "usb-ohci" in the example, but actual users don't,
> so drop it.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/powerpc/nintendo/wii.txt   | 10 -------
>  .../devicetree/bindings/usb/generic-ohci.yaml      | 31 ++++++++++++++++---
>  Documentation/devicetree/bindings/usb/ohci-nxp.txt | 24 ---------------
>  .../devicetree/bindings/usb/ohci-omap3.txt         | 15 ----------
>  Documentation/devicetree/bindings/usb/pxa-usb.txt  |  2 +-
>  .../devicetree/bindings/usb/spear-usb.txt          | 35 ----------------------
>  6 files changed, 28 insertions(+), 89 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wii.txt b/Documentation/devicetree/bindings/powerpc/nintendo/wii.txt
> index c4d78f28d23c..3ff6ebbb4998 100644
> --- a/Documentation/devicetree/bindings/powerpc/nintendo/wii.txt
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wii.txt
> @@ -97,16 +97,6 @@ Nintendo Wii device tree
>     - reg : should contain the EXI registers location and length
>     - interrupts : should contain the EXI interrupt
>
> -1.g) The Open Host Controller Interface (OHCI) nodes
> -
> -  Represent the USB 1.x Open Host Controller Interfaces.
> -
> -  Required properties:
> -
> -   - compatible : should be "nintendo,hollywood-usb-ohci","usb-ohci"
> -   - reg : should contain the OHCI registers location and length
> -   - interrupts : should contain the OHCI interrupt
> -
>  1.h) The Enhanced Host Controller Interface (EHCI) node
>
>    Represents the USB 2.0 Enhanced Host Controller Interface.
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> index 4fcbd0add49d..b898303381f8 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>
>  title: USB OHCI Controller
>
> -allOf:
> -  - $ref: "usb-hcd.yaml"
> -
>  maintainers:
>    - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> @@ -49,7 +46,16 @@ properties:
>                - ingenic,jz4740-ohci
>                - snps,hsdk-v1.0-ohci
>            - const: generic-ohci
> -      - const: generic-ohci
> +      - enum:
> +          - generic-ohci
> +          - ti,ohci-omap3
> +      - items:
> +          - enum:
> +              - cavium,octeon-6335-ohci
> +              - nintendo,hollywood-usb-ohci
> +              - nxp,ohci-nxp
> +              - st,spear600-ohci
> +          - const: usb-ohci
>
>    reg:
>      maxItems: 1
> @@ -119,11 +125,28 @@ properties:
>        - host
>        - otg
>
> +  transceiver:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The associated ISP1301 device. Necessary for the UDC controller for
> +      connecting to the USB physical layer.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>
> +allOf:
> +  - $ref: usb-hcd.yaml
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: nxp,ohci-nxp
> +    then:

Sigh. Need a 'properties' in here...

> +      transceiver: false
> +
>  additionalProperties: false
>
>  examples:
> diff --git a/Documentation/devicetree/bindings/usb/ohci-nxp.txt b/Documentation/devicetree/bindings/usb/ohci-nxp.txt
> deleted file mode 100644
> index 71e28c1017ed..000000000000
> --- a/Documentation/devicetree/bindings/usb/ohci-nxp.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -* OHCI controller, NXP ohci-nxp variant
> -
> -Required properties:
> -- compatible: must be "nxp,ohci-nxp"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- interrupts: The OHCI interrupt
> -- transceiver: phandle of the associated ISP1301 device - this is necessary for
> -               the UDC controller for connecting to the USB physical layer
> -
> -Example (LPC32xx):
> -
> -       isp1301: usb-transceiver@2c {
> -               compatible = "nxp,isp1301";
> -               reg = <0x2c>;
> -       };
> -
> -       ohci@31020000 {
> -               compatible = "nxp,ohci-nxp";
> -               reg = <0x31020000 0x300>;
> -               interrupt-parent = <&mic>;
> -               interrupts = <0x3b 0>;
> -               transceiver = <&isp1301>;
> -       };
> diff --git a/Documentation/devicetree/bindings/usb/ohci-omap3.txt b/Documentation/devicetree/bindings/usb/ohci-omap3.txt
> deleted file mode 100644
> index ce8c47cff6d0..000000000000
> --- a/Documentation/devicetree/bindings/usb/ohci-omap3.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -OMAP HS USB OHCI controller (OMAP3 and later)
> -
> -Required properties:
> -
> -- compatible: should be "ti,ohci-omap3"
> -- reg: should contain one register range i.e. start and length
> -- interrupts: description of the interrupt line
> -
> -Example for OMAP4:
> -
> -usbhsohci: ohci@4a064800 {
> -       compatible = "ti,ohci-omap3";
> -       reg = <0x4a064800 0x400>;
> -       interrupts = <0 76 0x4>;
> -};
> diff --git a/Documentation/devicetree/bindings/usb/pxa-usb.txt b/Documentation/devicetree/bindings/usb/pxa-usb.txt
> index 9c331799b87c..53fdae4fa6f6 100644
> --- a/Documentation/devicetree/bindings/usb/pxa-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/pxa-usb.txt
> @@ -22,7 +22,7 @@ Optional properties:
>  Example:
>
>         usb0: ohci@4c000000 {
> -               compatible = "marvell,pxa-ohci", "usb-ohci";
> +               compatible = "marvell,pxa-ohci";
>                 reg = <0x4c000000 0x100000>;
>                 interrupts = <18>;
>                 marvell,enable-port1;
> diff --git a/Documentation/devicetree/bindings/usb/spear-usb.txt b/Documentation/devicetree/bindings/usb/spear-usb.txt
> deleted file mode 100644
> index 1dc91cc459c0..000000000000
> --- a/Documentation/devicetree/bindings/usb/spear-usb.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -ST SPEAr SoC USB controllers:
> ------------------------------
> -
> -EHCI:
> ------
> -
> -Required properties:
> -- compatible: "st,spear600-ehci"
> -- interrupts: Should contain the EHCI interrupt
> -
> -Example:
> -
> -       ehci@e1800000 {
> -               compatible = "st,spear600-ehci", "usb-ehci";
> -               reg = <0xe1800000 0x1000>;
> -               interrupt-parent = <&vic1>;
> -               interrupts = <27>;
> -       };
> -
> -
> -OHCI:
> ------
> -
> -Required properties:
> -- compatible: "st,spear600-ohci"
> -- interrupts: Should contain the OHCI interrupt
> -
> -Example:
> -
> -       ohci@e1900000 {
> -               compatible = "st,spear600-ohci", "usb-ohci";
> -               reg = <0xe1800000 0x1000>;
> -               interrupt-parent = <&vic1>;
> -               interrupts = <26>;
> -       };
>
> --
> 2.39.0
>
