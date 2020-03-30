Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7A2198454
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 21:24:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rj8C4KsQzDqgp
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 06:24:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.67; helo=mail-io1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rj7H2CY5zDqf3;
 Tue, 31 Mar 2020 06:23:52 +1100 (AEDT)
Received: by mail-io1-f67.google.com with SMTP id m15so19125700iob.5;
 Mon, 30 Mar 2020 12:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MXO0cFSUgdRH+a4P/o/GAi4s4MndCf1pU3SuIpqOxH8=;
 b=p2NL7e1IGOQqH0o9DEpOocsp3/ZgExcpU2WO6I568AVubGr8XGLqVbeKuRxWHsqaP7
 dAil+XvnmZWT0WA6zz0IuIxyKLod/p9SvUIiKaqPnkkY2h05pUg1Xle/8LBUdm++aHqT
 pEOptU29aLIvUvMr/k/QdWWHNgEtAhCHL/ICMOJ9Y2zZDLAuDKkeVJ/Fzf+QNGJAyWyu
 26lfXzXar6SZ0nxcTjBNFBp65eXy3K62I2wg4gwN2OsZZUDYyx1xXlwEPmCjtfUivm0H
 KCZWty5yiaju0w3OAlgRhmkVBKw5QOA+9GYCkEVcCHxuQ+P0fsQkXzp6L76SZue6Am8Z
 fj9Q==
X-Gm-Message-State: ANhLgQ3hUrsjawxCnPZ7TN8QRJWS98TWkYez8hTHeOAnGp2YnHWmvj3m
 InseeKYRIedBLe8ChPyM2Q==
X-Google-Smtp-Source: ADFU+vul8Oe41tCjMTU3VB/Pazto4kKTIj+AVWhsXgGw9jz3HDJI0g0/B3oHxwfVXEbonu12CN0a1g==
X-Received: by 2002:a6b:b989:: with SMTP id j131mr12170677iof.6.1585596229713; 
 Mon, 30 Mar 2020 12:23:49 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id p189sm4307507iof.17.2020.03.30.12.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 12:23:49 -0700 (PDT)
Received: (nullmailer pid 22585 invoked by uid 1000);
 Mon, 30 Mar 2020 19:23:47 -0000
Date: Mon, 30 Mar 2020 13:23:47 -0600
From: Rob Herring <robh@kernel.org>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH v2 6/6] dt-bindings: usb: document aspeed vhub device
 ID/string properties
Message-ID: <20200330192347.GA6388@bogus>
References: <20200315191632.12536-1-rentao.bupt@gmail.com>
 <20200315191632.12536-7-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200315191632.12536-7-rentao.bupt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Sun, Mar 15, 2020 at 12:16:32PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Update device tree binding document for aspeed vhub's device IDs and
> string properties.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  No change in v2:
>    - the patch is added into the series since v2.
> 
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> index 06399ba0d9e4..5b2e8d867219 100644
> --- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> +++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> @@ -52,6 +52,59 @@ properties:
>          minimum: 1
>          maximum: 21
>  
> +  vhub-vendor-id:
> +    description: vhub Vendor ID
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - maximum: 65535
> +
> +  vhub-product-id:
> +    description: vhub Product ID
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - maximum: 65535

There's already standard 'vendor-id' and 'device-id' properties. Use 
those.

> +
> +  vhub-device-revision:

Specific to USB, not vhub.

> +    description: vhub Device Revision in binary-coded decimal
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - maximum: 65535
> +
> +  vhub-strings:
> +    type: object
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^string@[0-9a-f]+$':
> +        type: object
> +        description: string descriptors of the specific language
> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +            description: 16-bit Language Identifier defined by USB-IF
> +
> +          manufacturer:
> +            description: vhub manufacturer
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/string
> +
> +          product:
> +            description: vhub product name
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/string
> +
> +          serial-number:
> +            description: vhub device serial number
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/string

For all of this, it's USB specific, not vhub specific. I'm not sure this 
is the right approach. It might be better to just define properties 
which are just raw USB descriptors rather than inventing some DT format 
that then has to be converted into USB descriptors.

Rob
