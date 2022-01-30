Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7BA4A32D0
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 01:22:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmX2k5pVQz3bTD
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 11:22:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.178;
 helo=mail-oi1-f178.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmX2T256Yz2yLT
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 11:22:23 +1100 (AEDT)
Received: by mail-oi1-f178.google.com with SMTP id q8so5215992oiw.7
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 16:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ibh5bZb+8onvBhI3GZYIGBn3IOvNBzxGMepZQyo+6ek=;
 b=ijpQZXNnM9HcvFUsTctL+ygkGd7QqxNobcfTtci113550BxDozKcAgyJCi7oqR7Kri
 mq3h+wAbXDplKOAmCRs10UWV/TDApaU1U/2qNbkfO0YuE92sv+2lX8XOkYdtsTRHmm5M
 vzeKTyvOQ+8M/EsvWayjFPPh6H1L/+k5m9qNJHss+ZOMEmYMCwrtvEeVuRcIU0TyJyCy
 cQ3jmTAb0MN4d5OnwJSFexpeSHp51aufeuuYaxsrPd4yuKK857rGnKOU+Lxifw+JiqGW
 +lR86OTeG4XYPG8BrIqU50rpej4loVLYTIqolPyzL3p44e04g7rhkHzXb/tllePkdTsE
 rFrA==
X-Gm-Message-State: AOAM532yJz8UjsEj82nt/dFTkc0PlsLf0EUwurLPq4YCHsDOG31nJsq1
 eHTCQVJNiZ/YFZCZ4VSI9g==
X-Google-Smtp-Source: ABdhPJxks5VGix5iWHqoMoUIgzq1MfZ1Qhz2CqmrUq3Gw6cO1IsliqmYZDbUrJ6JnFbO8Tb4RG1vDw==
X-Received: by 2002:aca:bb07:: with SMTP id l7mr14920384oif.166.1643502139874; 
 Sat, 29 Jan 2022 16:22:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v4sm9027933oou.1.2022.01.29.16.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 16:22:19 -0800 (PST)
Received: (nullmailer pid 416951 invoked by uid 1000);
 Sun, 30 Jan 2022 00:22:17 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
In-Reply-To: <20220128214427.1990183-1-j.neuschaefer@gmx.net>
References: <20220128214427.1990183-1-j.neuschaefer@gmx.net>
Subject: Re: [PATCH] dt-bindings: timer: nuvoton,
 npcm7xx-timer: Convert to YAML
Date: Sat, 29 Jan 2022 18:22:17 -0600
Message-Id: <1643502137.246273.416950.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 28 Jan 2022 22:44:26 +0100, Jonathan Neuschäfer wrote:
> Let's convert this devicetree binding to YAML, to make it easier to
> extend later.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt  | 21 ---------
>  .../bindings/timer/nuvoton,npcm7xx-timer.yaml | 46 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.example.dt.yaml:0:0: /example-0/timer@f0008000: failed to match any schema with compatible: ['nuvoton,npcm750-timer']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1585958

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

