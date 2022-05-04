Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D4F51AF49
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 22:34:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtpV22CCKz3bwQ
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 06:34:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.49; helo=mail-oa1-f49.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtpTB050tz3brH
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 06:34:05 +1000 (AEST)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso2390949fac.2
 for <openbmc@lists.ozlabs.org>; Wed, 04 May 2022 13:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PE0/mr3CK6LI2EW3G3CcGXz8d3sJvD5z1eOffL3SZjk=;
 b=c1ehVEhs7gdHVaq6O7BpIcdGfrVGcWfEE+9dm3YL4za2cVNPItsT7IAuX+2PbSAFcE
 BxLX9VGG/6jm5H1vYTJF2dW6NVnmPvcI1/PDH/LARaQfde2oyhrCz83KlnMhrbF6HEQU
 l/djkJy44mW9XWHQYn7wLxIzeVohRTRDfvqsK9ase58NvGU+9ePM2s6ihr3JzMG8DMsH
 TZpHFlbpDgUbnRHlYYVCgEOY1Uhmkfjr9kbuAG07WxV+iB/DRXpRIVemTRLxmBc0SOdd
 Zq3v7GwRZ3x6CXO8oVcu/pCy94aXFbOPQoBeoVaa+/yyi74smwIj7WzbimTlvPCS50TR
 +G8A==
X-Gm-Message-State: AOAM531c99DH/1RBwF8an1Zg0ItYyAjjwgSMpmuX7ReSIRNYaD4z2mGd
 GQV3w0hDF2hmvxu5XnC1OQ==
X-Google-Smtp-Source: ABdhPJzaPpzsZu9OKNhkox9cq3OHRCZ9ylrNs5rWf3k1HTRCFemLek1wCkKpOsQ6zTmeEYZ9rFdaHA==
X-Received: by 2002:a05:6870:8896:b0:ed:a31a:fbf7 with SMTP id
 m22-20020a056870889600b000eda31afbf7mr656809oam.273.1651696441692; 
 Wed, 04 May 2022 13:34:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f11-20020a4ae60b000000b0035eb4e5a6bdsm6217952oot.19.2022.05.04.13.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:34:01 -0700 (PDT)
Received: (nullmailer pid 2180122 invoked by uid 1000);
 Wed, 04 May 2022 20:34:00 -0000
Date: Wed, 4 May 2022 15:34:00 -0500
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 1/7] dt-bindings: timer: nuvoton,npcm7xx-timer: Allow
 specifying all clocks
Message-ID: <YnLjOH+2WMHFV86j@robh.at.kernel.org>
References: <20220429172030.398011-1-j.neuschaefer@gmx.net>
 <20220429172030.398011-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220429172030.398011-2-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Benjamin Fair <benjaminfair@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Patrick Venture <venture@google.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Avi Fishman <avifishman70@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 openbmc@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 29 Apr 2022 19:20:24 +0200, Jonathan Neuschäfer wrote:
> The timer module contains multiple timers. In the WPCM450 SoC, each timer
> runs off a clock can be gated individually. To model this correctly, the
> timer node in the devicetree needs to take multiple clock inputs.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> v2:
> - no changes
> ---
>  .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml  | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
