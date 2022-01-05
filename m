Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 286A048539A
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 14:30:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTVjZ0HsLz30H3
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 00:30:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.170;
 helo=mail-oi1-f170.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTVjJ2Y6Yz2xC6
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 00:30:26 +1100 (AEDT)
Received: by mail-oi1-f170.google.com with SMTP id r131so398489oig.1
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jan 2022 05:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+zF0DYhczYohQzVtQksUxrHBVJTvqinpDR5pxsDDR8M=;
 b=hlVOwadGS89DIPqLQ8PHBEnuyLaqXJ8b94+4aD+mFJoO6Rg7HXos8uFkv/Je19O8yn
 2d/SXT43PAR0J46gadYM/PybwBu9xYD4s4eCtUm6RWUe9xkm0/DwKrNvyzK03WDl9lsB
 DXmS3jhudfywnChHtFKk9KjzMdqqLhOqVqmZbMpzmRv5tXEfxZ4pQH0pi6BQcDL7arbZ
 zfS1trf1trFwxqgHMHkmE5l2pP2VsMdN8z5tpPh/5IvKeEM7Xwm/MVHbNQNWdZLa9ihU
 D7z7z53EtHTsj7pLL0+gjj4u9Btm0Rh0kR2o3389V9+gCC/Ewm4mxQfiYBtl8ODaBU6G
 KXgg==
X-Gm-Message-State: AOAM53258P7h3kIycM8NlNd6+1kfxXCduYgUdWioasC4MpNb3gg5GrJt
 T2GeBlbW89JacOMU1TZDuQ==
X-Google-Smtp-Source: ABdhPJw1d5ah49d3Jl3IsUw0xrOgpEkxfYxAa2QPu9MPmIFKwyRRk2oGBlauz6+RNW3y6n6OMTzriw==
X-Received: by 2002:aca:5a87:: with SMTP id o129mr2609359oib.114.1641389423719; 
 Wed, 05 Jan 2022 05:30:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id ay40sm10287652oib.1.2022.01.05.05.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:30:23 -0800 (PST)
Received: (nullmailer pid 2950533 invoked by uid 1000);
 Wed, 05 Jan 2022 13:30:21 -0000
Date: Wed, 5 Jan 2022 07:30:21 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 1/8] dt-bindings: rng: apm, x-gene-rng: convert APM RNG to
 dtschema
Message-ID: <YdWdbac/WQloqU57@robh.at.kernel.org>
References: <20211227183251.132525-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227183251.132525-1-krzysztof.kozlowski@canonical.com>
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
Cc: Nishanth Menon <nm@ti.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Matt Mackall <mpm@selenic.com>, Tali Perry <tali.perry1@gmail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, openbmc@lists.ozlabs.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 27, 2021 at 07:32:44PM +0100, Krzysztof Kozlowski wrote:
> Convert the APM X-Gene RNG bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/rng/apm,rng.txt       | 17 -------
>  .../bindings/rng/apm,x-gene-rng.yaml          | 47 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rng/apm,rng.txt
>  create mode 100644 Documentation/devicetree/bindings/rng/apm,x-gene-rng.yaml

Series applied, thanks.

Rob
