Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34B733C198
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 17:23:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzhZ25HHcz2yxx
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 03:23:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.176;
 helo=mail-il1-f176.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzhYs0pWXz2yxP
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 03:23:44 +1100 (AEDT)
Received: by mail-il1-f176.google.com with SMTP id b5so9880496ilq.10
 for <openbmc@lists.ozlabs.org>; Mon, 15 Mar 2021 09:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HgwqlBmuUehNrsPso/cPfGiCGc8t+4arPnqvft1WhQ0=;
 b=BmDqidfnsiUGqXXbQzOr5xYhD/yaRSArWxd0nAuspcKQbVa9SG8EQOxJfSlGxkRQP5
 2T8ndg1IXH9ZQeI8k0IZHUtNme8mZQD6fYXYk1VyE7a1BDSUIm+c5r1+Ch3Sb+PFsbrv
 rT/8XdSf9IQANcqpVKcVkOsXRfV0lRiJOxj2Ajsi0f2DI66d9JTToOnFKXUCipE7YEqF
 GBTLBQgdaR9QZ14B/ksG23kRUoeVm67ZZ3Eqsawf12we6bU4lxdsSO/ifZPwUg+k3u6K
 DXpZyHH+MnLnGBc75syxzMLfzDT/NW2hRBW+VE8QGI4rSsFzhTLGvVjOXy6ZGlSWPtm1
 Whvg==
X-Gm-Message-State: AOAM530T8Zz2GF+tmWVgXqz4q2EETmceuJHtXt2X/5XGy7CgTeixyQ9E
 8hNP5M7FKZzNEY3wjJJdmg==
X-Google-Smtp-Source: ABdhPJwDAcpD05CHoQUAKE09TR1uWqtzl//CAmUKHIvFTBJMPDTDR0bhhtMfk58tO6VZivbHAbXuhA==
X-Received: by 2002:a92:c641:: with SMTP id 1mr357910ill.94.1615825421671;
 Mon, 15 Mar 2021 09:23:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id o13sm7121497iob.17.2021.03.15.09.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:23:40 -0700 (PDT)
Received: (nullmailer pid 977577 invoked by uid 1000);
 Mon, 15 Mar 2021 16:23:38 -0000
Date: Mon, 15 Mar 2021 10:23:38 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert nuvoton,npcm750 binding to
 YAML
Message-ID: <20210315162338.GA973222@robh.at.kernel.org>
References: <20210313175321.2515675-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210313175321.2515675-1-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Mar 13, 2021 at 06:53:20PM +0100, Jonathan Neuschäfer wrote:
> The general trend is to have devicetree bindings in YAML format, to
> allow automatic validation of bindings and devicetrees.
> 
> Convert the NPCM SoC family's binding to YAML before it accumulates more
> entries.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> If someone else wants to be listed as the maintainer, please let me
> know.
> 
> 
> v3:
> - In this version, I removed the nuvoton,npcm750-evb compatible string
>   again. I had previously introduced it to simplify the binding a little
>   bit, but Tomer Maimon suggested to keep /compatible of
>   nuvoton-npcm750-evb.dts as-is (i.e. only use "nuvoton,npcm750", no
>   board-specific string).
>   Because of this change, I am not including Rob Herring's R-b tag.

I think you should add nuvoton,npcm750-evb. Not so much for that board, 
but to ensure any additional boards get a board specific compatible.

> 
> v2:
> - https://lore.kernel.org/lkml/20210116010907.3475405-1-j.neuschaefer@gmx.net/
>   https://lore.kernel.org/lkml/20210303154622.3018839-1-j.neuschaefer@gmx.net/
> - Fix indentation to satisfy yamllint
> - Fix $schema line
> ---
>  .../devicetree/bindings/arm/npcm/npcm.txt     |  6 ------
>  .../devicetree/bindings/arm/npcm/npcm.yaml    | 20 +++++++++++++++++++
>  2 files changed, 20 insertions(+), 6 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/npcm/npcm.txt b/Documentation/devicetree/bindings/arm/npcm/npcm.txt
> deleted file mode 100644
> index 2d87d9ecea85b..0000000000000
> --- a/Documentation/devicetree/bindings/arm/npcm/npcm.txt
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -NPCM Platforms Device Tree Bindings
> ------------------------------------
> -NPCM750 SoC
> -Required root node properties:
> -	- compatible = "nuvoton,npcm750";
> -
> diff --git a/Documentation/devicetree/bindings/arm/npcm/npcm.yaml b/Documentation/devicetree/bindings/arm/npcm/npcm.yaml
> new file mode 100644
> index 0000000000000..8cca0396a5d59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/npcm/npcm.yaml
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/npcm/npcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NPCM Platforms Device Tree Bindings
> +
> +maintainers:
> +  - Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: NPCM750 development board
> +        const: nuvoton,npcm750
> +
> +additionalProperties: true
> --
> 2.30.1
> 
