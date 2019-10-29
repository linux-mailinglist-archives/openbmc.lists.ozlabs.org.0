Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60811EB9B0
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 23:25:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4740Jl2py8zF5sK
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 09:25:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472bGM5l7rzF36w
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 02:33:47 +1100 (AEDT)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iPTD3-0008Lu-NJ; Tue, 29 Oct 2019 16:15:01 +0100
Message-ID: <39ba2073ca02b391d6006a124ed29d9a57f12a25.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-binding: reset: add NPCM reset controller
 documentation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org, 
 mark.rutland@arm.com, yuenn@google.com, venture@google.com, 
 benjaminfair@google.com, avifishman70@gmail.com, joel@jms.id.au
Date: Tue, 29 Oct 2019 16:14:58 +0100
In-Reply-To: <20191028155403.134126-2-tmaimon77@gmail.com>
References: <20191028155403.134126-1-tmaimon77@gmail.com>
 <20191028155403.134126-2-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Mailman-Approved-At: Fri, 01 Nov 2019 09:21:56 +1100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

On Mon, 2019-10-28 at 17:54 +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM reset controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/reset/nuvoton,npcm-reset.txt     | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> new file mode 100644
> index 000000000000..94793285a2ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> @@ -0,0 +1,35 @@
> +Nuvoton NPCM Reset controller
> +
> +In the NPCM Reset controller boot the USB PHY, USB host
> +and USB device initialize.

Isn't this just a detail of the driver implementation?

> +Required properties:
> +- compatible : "nuvoton,npcm750-reset" for NPCM7XX BMC

Is this driver expected to be reused for other SoCs?

> +- reg : specifies physical base address and size of the register.
> +- #reset-cells: must be set to 1
> +
> +Optional property:
> +- nuvoton,sw-reset-number - Contains the software reset number to restart the SoC.
> +  NPCM7xx contain four software reset that represent numbers 1 to 4.

What's the difference between the four restart bits? Is this something
that has to be configured per board?

> +  If 'nuvoton,sw-reset-number' is not specfied software reset is disabled.
> +
> +Example:
> +	rstc: rstc@f0801000 {
> +		compatible = "nuvoton,npcm750-reset";
> +		reg = <0xf0801000 0x70>;
> +		#reset-cells = <1>;
> +		nuvoton,sw-reset-number = <2>;
> +	};
> +
> +Specifying reset lines connected to IP NPCM7XX modules
> +======================================================
> +example:
> +
> +        spi0: spi@..... {
> +                ...
> +                resets = <&rstc NPCM7XX_RESET_PSPI1>;
> +                ...
> +        };
> +
> +The index could be found in <dt-bindings/reset/nuvoton,npcm7xx-reset.h>.

regards
Philipp

