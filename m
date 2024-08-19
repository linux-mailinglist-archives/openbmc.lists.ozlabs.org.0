Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE11956586
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2024 10:24:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnQcZ1nKRz301G
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2024 18:24:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.46
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.46; helo=mail-wm1-f46.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnQcV39Hyz2xXV;
	Mon, 19 Aug 2024 18:24:25 +1000 (AEST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4280bca3960so35296725e9.3;
        Mon, 19 Aug 2024 01:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724055862; x=1724660662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0eCcNffw7KnF9YgXX3UKwNuk5QFOegAlk5VPZFJsEM=;
        b=LqaxLSHURU/mTaAK+OVrSzT6tjHpqe7sch9pdCkMhoxx8P3gAwWTod+u2G+ljOxoEL
         Ccc9j/3y9QyHre7i9xyqzbULhg+A8AMYuhz4NK3JD2Dlp+CELqjrCX2ugdmDFOKknyDS
         9NGgjEv3e3YaD7tkF9k40qYk+D81qoeJXNTUXC5VdHpqhTUV/ir+oHRbn1IoWFMB3uD0
         7LSjDe3xIGjBpXZxJHfTXs6S1Hy48mSig/rJ1jaaF80NmFzpLwtwxaMcuextMvFvbPot
         Cjs1xAciVYMsrfqyC9yFFoC3zRZBUry4iPAPb3x3R6WXSCUm5iI38Lldem/T5g8Rv7av
         elEA==
X-Forwarded-Encrypted: i=1; AJvYcCXZYPtlVxpMzH2cxwrxhO/kiW4/kbTFWZlUpkCwnOwDWgDuGgFKZMGWmEwNx7NKDKtl/6aVKSnSkg5kFO/iDkFoVZeastLP32mCV9hzmwjXQ1aiG5rRXJahpKeTIHLTz9XQTKJ3l9Bg
X-Gm-Message-State: AOJu0YygATTPypxhiHJPrXErCx1+btjPlfd9Hvn1rgQvieG6yUBbvEFt
	8t1tFNrRuJbAkH748L39YSV6kvD6hjS2N7Sg9iLkuXWMR1wgD2X2
X-Google-Smtp-Source: AGHT+IH7mpE5mezXCGqwhTCXdlU32Io00+sJo7Wg82P1kgrhRFRqhvNEluxZz/pLolJcGdWRdb8zgA==
X-Received: by 2002:a05:600c:1c25:b0:429:a0d:b710 with SMTP id 5b1f17b1804b1-429ed79c76fmr61970335e9.12.1724055861594;
        Mon, 19 Aug 2024 01:24:21 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ded72524sm157543425e9.34.2024.08.19.01.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 01:24:20 -0700 (PDT)
Date: Mon, 19 Aug 2024 10:24:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add aspeed,video binding
Message-ID: <nnjcjt2kuplsy5bbxujuubkn2xdtpifjeiqt5qfvktdmaorzuz@x444p5ezcoch>
References: <20240819080859.1304671-1-jammy_huang@aspeedtech.com>
 <20240819080859.1304671-2-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819080859.1304671-2-jammy_huang@aspeedtech.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, pmenzel@molgen.mpg.de, andrew@aj.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2024 at 04:08:58PM +0800, Jammy Huang wrote:
> The Video Engine block in ASPEED Silicon SoCs is responsible for video
> compressions with a wide range of video quality and compression
> ratio options. It can capture and compress video data from digital or
> analog sources.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../bindings/arm/aspeed/aspeed,video.yaml     | 81 +++++++++++++++++++

Why are you adding duplicated binding? Please read the first comments -
you need to first convert TXT to DT schema. Then you add new properties
in a new patch.

>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml
> new file mode 100644
> index 000000000000..bef7bd2f310a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml

Filename matching compatible.

> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/aspeed/aspeed,video.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED Video Engine

ASPEED or Aspeed?

> +
> +maintainers:
> +  - Eddie James <eajames@linux.ibm.com>
> +  - Jammy Huang <jammy_huang@aspeedtech.com>
> +
> +description: |

Drop |

> +  The ASPEED video engine can be configured to capture and compress video
> +  data from digital or analog sources.
> +
> +select:
> +  properties:
> +    compatible:
> +      pattern: "^aspeed,ast[0-9]+-video-engine$"
> +  required:
> +    - compatible

Drop entire select. No clue what is this.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Preferred naming style for compatibles of video components
> +        pattern: "^aspeed,ast[0-9]+-video-engine$"

???

No, drop.

> +
> +      - enum:
> +          - aspeed,ast2400-video-engine
> +          - aspeed,ast2500-video-engine
> +          - aspeed,ast2600-video-engine
> +
> +  reg:
> +    minItems: 1

No, maxItems.

> +
> +  clocks:
> +    minItems: 2

No. maxItems.

> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +      - const: eclk
> +
> +  interrupts:
> +    minItems: 1

maxItems

> +
> +  aspeed,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Specifies the scu node that is needed if video wants to capture
> +      from sources other than Host VGA.
> +
> +  aspeed,gfx:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Specifies the Soc Display(gfx) node that needs to be queried to get
> +      related information if video wants to use gfx as capture source.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: true

NAK, this cannot be true. Where do you see any device binding having it
true?


> +
> +examples:
> +  - |
> +    video: video@1e700000 {

Drop unused label

> +          	compatible = "aspeed,ast2600-video-engine";

Fix indentation, this is supposed 4 spaces.
