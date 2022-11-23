Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419463652A
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 17:00:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHQnc0bZ6z3dvF
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 03:00:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OSZ2n10h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OSZ2n10h;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHQn349fbz3045
	for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2022 02:59:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7118861DD6;
	Wed, 23 Nov 2022 15:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65271C43144;
	Wed, 23 Nov 2022 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669219187;
	bh=NS11AyaOOzYSASBYlc4oJCK5uNhVXwOLd4pt39/P0oY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OSZ2n10hM0hKrs7saAE7lKyKvqaPuuWCmVvdvLWDgbVeRI4IlkEC1Nz5RxAbWnUrR
	 ERHj1FNKpKY4E56WAxU8lOPQRg+RTjG4s2/53E/TejSFYKhIofzEPKxBree6tvNoBn
	 OfaZjFr6nztFBkCdlwn9JaqZNUpxdQbcNG3+3P5AgCiTMo+W9+PXxllv+00Gw831Nn
	 eYI3q+1AYyZNO6CKbSJ8kIf2/tiqaHs79kdbyOzy57uaFv7p/4msdFMK6Um+Qeb6Kc
	 HLXKy0NPUUE7RDAvrd9/W1nPExKCzrpIqKafOrqnHIc0umhHY7Ryd9JoCoGrWsRJLM
	 ODVHkRk97DMMg==
Message-ID: <7561a0c3-c63b-a3f2-efeb-4bb0f4ad03e4@kernel.org>
Date: Wed, 23 Nov 2022 16:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7 3/7] dt-bindings: arm: nuvoton: Add bindings for NPCM
 GFXI
Content-Language: en-US
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221122085724.3245078-1-milkfafa@gmail.com>
 <20221122085724.3245078-4-milkfafa@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221122085724.3245078-4-milkfafa@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 22/11/2022 09:57, Marvin Lin wrote:
> Add dt-bindings document for Graphics Core Information (GFXI) node. It
> is used by NPCM video driver to retrieve Graphics core information.
> 
> Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> ---
>  .../bindings/arm/npcm/nuvoton,gfxi.yaml       | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
> new file mode 100644
> index 000000000000..5b785bda5739
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/npcm/nuvoton,gfxi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Graphics Core Information block in Nuvoton SoCs
> +
> +maintainers:
> +  - Joseph Liu <kwliu@nuvoton.com>
> +  - Marvin Lin <kflin@nuvoton.com>
> +
> +description:
> +  The Graphics Core Information (GFXI) are a block of registers in Nuvoton SoCs
> +  that analyzes Graphics core behavior and provides inforomation in registers.

typo: information

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nuvoton,npcm750-gfxi
> +          - nuvoton,npcm845-gfxi
> +      - const: syscon
> +      - const: simple-mfd

That's not simple-mfd, you do not have any devices.


Best regards,
Krzysztof

