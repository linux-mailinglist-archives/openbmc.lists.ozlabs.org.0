Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 280EE419ECA
	for <lists+openbmc@lfdr.de>; Mon, 27 Sep 2021 20:59:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJBlB0bxhz2yPP
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 04:59:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.175;
 helo=mail-oi1-f175.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJBks2XSkz2xYN;
 Tue, 28 Sep 2021 04:59:15 +1000 (AEST)
Received: by mail-oi1-f175.google.com with SMTP id z11so26934630oih.1;
 Mon, 27 Sep 2021 11:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eV+PRo6a2MRz/DpkFNL4n5kAGNJtpr9EpyO3zFy3ARk=;
 b=leOXFEIVgi69FjUEuGKgnDWLVVb4jVJ0hKtbrmcvpBs1SZxF9Ngytn61TBbwFTR6DV
 MV9schLUI78Qhy3k+kEQA95xe/cxnQREYx3MibQerhKYLjABuWWfjMlBZs17nrN23SM0
 yLrWBXoiD0UWs1WcPTNBVuFeROHqGcnwb4ftjgUmb/+gKmI14cfZYtcsZlg17spPVv7S
 rgqkabqAwLnI/CuL4DbjKZiXOkosvAkLgK7svazHX/azY7tKNvcze9ewk3iYl466lZ40
 HXpubmK3VcRpZny77Rw8xPYsDrzFgW0KFKniVqtLX8CJIk87W9cPOcAjZqQWXq6M7mRy
 oamQ==
X-Gm-Message-State: AOAM5323tBBy8pvUJcIQtl7OtHq2x2yWaRjdiZAJyq1TQgJQkXx9BLVF
 Q4MXFCFzIzBMe/zRbjvc3Q==
X-Google-Smtp-Source: ABdhPJwMJelZ7z1gOyM6KU2hxuI5UxVhhaZKlukjtCf2pvupYDr2rXhjepC7YZIdsEs7BDBH3vdEvw==
X-Received: by 2002:aca:604:: with SMTP id 4mr520177oig.8.1632769152914;
 Mon, 27 Sep 2021 11:59:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p64sm4054025oih.29.2021.09.27.11.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 11:59:12 -0700 (PDT)
Received: (nullmailer pid 3666744 invoked by uid 1000);
 Mon, 27 Sep 2021 18:59:11 -0000
Date: Mon, 27 Sep 2021 13:59:11 -0500
From: Rob Herring <robh@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH 10/10] dt-bindings: mmc: aspeed: Add a new compatible
 string
Message-ID: <YVIUf7/4ukMcrOb9@robh.at.kernel.org>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-11-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922103116.30652-11-chin-ting_kuo@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, sboyd@kernel.org,
 steven_lee@aspeedtech.com, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org, andrew@aj.id.au,
 mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 22, 2021 at 06:31:16PM +0800, Chin-Ting Kuo wrote:
> Add "aspeed,ast2600-emmc" compatible string for the sake of
> distinguishing between SD and eMMC device.

Why?

Is the h/w block different? We already have properties to handle some of 
the eMMC specifics. Also, you can have a child node for the eMMC device 
if you need that.

> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 5bb66849df65..41105cd104c6 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -52,6 +52,7 @@ patternProperties:
>            - aspeed,ast2400-sdhci
>            - aspeed,ast2500-sdhci
>            - aspeed,ast2600-sdhci
> +          - aspeed,ast2600-emmc
>        reg:
>          maxItems: 1
>          description: The SDHCI registers
> -- 
> 2.17.1
> 
> 
