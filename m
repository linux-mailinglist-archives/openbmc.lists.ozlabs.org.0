Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE9934F45E
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 00:39:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F94BG1TJKz3bt3
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:39:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.45; helo=mail-ot1-f45.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F94B317Z3z2xZq;
 Wed, 31 Mar 2021 09:39:07 +1100 (AEDT)
Received: by mail-ot1-f45.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so17107796otk.5; 
 Tue, 30 Mar 2021 15:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+kL3ZRB3j6i01duxPJ9vYcO9kwxP1k0mr9iO+0pJBac=;
 b=syw/UHAaCmXTWjuakPoVDr5roLgjViK/sSuSYFzSirSEo57MaiVrOZHxBHm7Za8vDY
 nCJjjmCoMWQVXK7eurGWSwzvG+0CvpqpffpUc+5P+iCC/NMhb22f06hQOptVq8sfu41A
 U4xPCJamSrXDA9gP6yILBL5l3S8ThFxr7N8U6CCNpxgegSY9QChkbuIHvfbLLCqwCzf5
 lFVoSd8RI2qqPd9SxiNJi6xc8UJHL5K5UGhXo6cUSBXz4ldu2rRUK382k8zVX0Oi3ibS
 I+g7U+Zabd25gQ/C5aDA2p+DXmrtvJneBx/gERuX4uesM5zCyf+V6r2x8OUNBQA0+M7l
 +Pwg==
X-Gm-Message-State: AOAM5333PKKEy3qHCTwJGIjSujsCYDxicE3C7NZsSLVrWy8Z+zIzQ6pm
 5x4Kxw2vGiRWewmJRcxJ9g==
X-Google-Smtp-Source: ABdhPJz1lPUhXrNxrHWj4A+J8TggtXB6qqS9Os++Ci/kdeMEGSETxa/ogDjwDKvpjvbG+y2lHU8MwA==
X-Received: by 2002:a05:6830:4110:: with SMTP id
 w16mr138691ott.348.1617143944665; 
 Tue, 30 Mar 2021 15:39:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v1sm42689otk.67.2021.03.30.15.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:39:04 -0700 (PDT)
Received: (nullmailer pid 841804 invoked by uid 1000);
 Tue, 30 Mar 2021 22:39:02 -0000
Date: Tue, 30 Mar 2021 17:39:02 -0500
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 2/3] dt-bindings: serial: 8250: update for
 aspeed,sirq-active-high
Message-ID: <20210330223902.GA837825@robh.at.kernel.org>
References: <20210330002338.335-1-zev@bewilderbeest.net>
 <20210330002338.335-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330002338.335-3-zev@bewilderbeest.net>
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
Cc: - <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 29, 2021 at 07:23:37PM -0500, Zev Weiss wrote:
> Update DT bindings documentation for the new incarnation of the
> aspeed,sirq-polarity-sense property.

Why?

This isn't a compatible change.

> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
> index f54cae9ff7b2..0bbb7121f720 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -13,7 +13,7 @@ allOf:
>    - $ref: /schemas/serial.yaml#
>    - if:
>        required:
> -        - aspeed,sirq-polarity-sense
> +        - aspeed,sirq-active-high
>      then:
>        properties:
>          compatible:
> @@ -181,13 +181,11 @@ properties:
>    rng-gpios: true
>    dcd-gpios: true
>  
> -  aspeed,sirq-polarity-sense:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> +  aspeed,sirq-active-high:
> +    type: boolean
>      description: |
> -      Phandle to aspeed,ast2500-scu compatible syscon alongside register
> -      offset and bit number to identify how the SIRQ polarity should be
> -      configured. One possible data source is the LPC/eSPI mode bit. Only
> -      applicable to aspeed,ast2500-vuart.
> +      Set to indicate that the SIRQ polarity is active-high (default
> +      is active-low).  Only applicable to aspeed,ast2500-vuart.
>  
>  required:
>    - reg
> @@ -227,7 +225,7 @@ examples:
>          interrupts = <8>;
>          clocks = <&syscon ASPEED_CLK_APB>;
>          no-loopback-test;
> -        aspeed,sirq-polarity-sense = <&syscon 0x70 25>;
> +        aspeed,sirq-active-high;
>      };
>  
>  ...
> -- 
> 2.31.1
> 
