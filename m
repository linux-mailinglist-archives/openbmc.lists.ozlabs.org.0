Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E45C419E7A
	for <lists+openbmc@lfdr.de>; Mon, 27 Sep 2021 20:41:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJBL30jnRz2yZ6
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 04:41:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.51; helo=mail-ot1-f51.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJBKk02HBz2xXr;
 Tue, 28 Sep 2021 04:40:57 +1000 (AEST)
Received: by mail-ot1-f51.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so18795514otv.4; 
 Mon, 27 Sep 2021 11:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aT74sA8N2lUocgMluPhJs3Gm7SxBOR0E9ip/6duvBVU=;
 b=11YfVPj6MpWHenuP4bihhOHR5avXlF1k7F/jYrg+3KdA51NociACgqYGxUDq3E+ehJ
 nYME1tTcqSZ3DUzqjvRU7VlXoIWblBJ9YzE9zO/vkqnr+jaV/4oC/tZV7LrBYhA4uSr2
 Jd8aqKjsmd8NoYGRBQW1Hv9OxogmEScpqlq45bzWB4v/Jv/aptWXuMjwxqF/SJuoHaum
 K/f1awrnhMKkOd+3frVEU47Jv8Ond94ZOhL5zizwcaVeEk1xeHTDM0L7mSUzPCiYcJSd
 DFxbI11ZQ6bsEC9586zhZJvAMrMIC3RwtkfUEDGFAnHTukLiGOsxFq7syRt24JJxFkFK
 RNyg==
X-Gm-Message-State: AOAM531GCTjERVV/2j4I2ketZL3o8J3K+LkehyVSeebWn77TXDJ5PYwq
 pbJT0HpkV4pQIeBiveYlVQ==
X-Google-Smtp-Source: ABdhPJxYyVnhkkXpCnNCYmWcKTble598kdOQWM1WnmFBNHS1MKlFJTW46Jl/GPLx0rfmdruXu7as7Q==
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr1308181otb.283.1632768054214; 
 Mon, 27 Sep 2021 11:40:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r18sm4245072ooc.27.2021.09.27.11.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 11:40:53 -0700 (PDT)
Received: (nullmailer pid 3622187 invoked by uid 1000);
 Mon, 27 Sep 2021 18:40:52 -0000
Date: Mon, 27 Sep 2021 13:40:52 -0500
From: Rob Herring <robh@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH 09/10] dt-bindings: mmc: aspeed: Add max-tap-delay property
Message-ID: <YVIQNPbbnhIqTSuu@robh.at.kernel.org>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-10-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922103116.30652-10-chin-ting_kuo@aspeedtech.com>
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

On Wed, Sep 22, 2021 at 06:31:15PM +0800, Chin-Ting Kuo wrote:
> Add max-tap-delay proptery in order to record the maximum
> tap delay on different platforms.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 987b287f3bff..5bb66849df65 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -37,6 +37,9 @@ properties:
>    clocks:
>      maxItems: 1
>      description: The SD/SDIO controller clock gate
> +  max-tap-delay:
> +    maxItems: 1

An array?

> +    description: The maximum delay in picosecond for SD/SDIO controller

Properties with a unit should have a standard unit suffix.

Should be common property? If not, needs a vendor prefix.

>  
>  patternProperties:
>    "^sdhci@[0-9a-f]+$":
> -- 
> 2.17.1
> 
> 
