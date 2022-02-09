Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A824AFF06
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 22:14:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvCLG0Flhz2yYJ
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 08:14:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.53; helo=mail-oo1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvCL1124bz2xYQ
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 08:14:00 +1100 (AEDT)
Received: by mail-oo1-f53.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so3973689ooi.7
 for <openbmc@lists.ozlabs.org>; Wed, 09 Feb 2022 13:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wZPEl1RMQZWE3jEg2XVztPJu2RbgeLrPJ2Tl4FP1soA=;
 b=5y+Xx/onHhnl4UDODjeHV236cu11v77Flh1EgjjGrZ0ncXzVwhi8+E077aSPqg3tAs
 v1XinnUXvwKWzbvRt+JsWIw7GXUll68WvVywVay+I5BfPOzlJYNABoXHqROno2YFRtN4
 zmYWMSNbJgLY1WpoDZBvPQKU4aF9Od8RUr8Z0MREIPd/tmg7RzYZgaS9AKIFBu4YPijw
 kMy/KTqnie6V8EYz+Dy5KTy2a59KtlzIUwF9iG0hCZCyXdcSNSdfsbchvD9AwAadUOnJ
 UhYCyYsdnXZXubntPvvxrwuOWeUrLLjbJ+CHHgH/XHU6ArgHKsgS9Dn+fEuszfqCpS2d
 lP5w==
X-Gm-Message-State: AOAM530k19Ewu5YVeiUxOqpuj2aC2bu1SpCHdFV0B2S9RK60xzq0wE2+
 2QaLqPa5kBYroDyVsWPB3Q==
X-Google-Smtp-Source: ABdhPJyavqXd6E1F+Ok3CwsfGK8qPHRcKMHn3sry6JXo2/tbJ+R4elSwpx1xYpRncV1FyJJ9r41UTw==
X-Received: by 2002:a05:6870:1209:: with SMTP id 9mr1342957oan.8.1644441236746; 
 Wed, 09 Feb 2022 13:13:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n12sm7235105oop.5.2022.02.09.13.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 13:13:55 -0800 (PST)
Received: (nullmailer pid 924633 invoked by uid 1000);
 Wed, 09 Feb 2022 21:13:54 -0000
Date: Wed, 9 Feb 2022 15:13:54 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2] dt-bindings: timer: nuvoton, npcm7xx-timer: Convert to
 YAML
Message-ID: <YgQukui1nWyfPvPH@robh.at.kernel.org>
References: <20220130102704.2892072-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220130102704.2892072-1-j.neuschaefer@gmx.net>
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

On Sun, 30 Jan 2022 11:27:02 +0100, Jonathan Neuschäfer wrote:
> Let's convert this devicetree binding to YAML, to make it easier to
> extend later.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> v2:
> - Fix nuvoton,npcm750-timer compatible string
> ---
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt  | 21 ---------
>  .../bindings/timer/nuvoton,npcm7xx-timer.yaml | 46 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
> 

Applied, thanks!
