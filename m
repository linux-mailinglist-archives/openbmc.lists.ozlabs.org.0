Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D647643806
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 23:24:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQylm3hdwz3bY9
	for <lists+openbmc@lfdr.de>; Tue,  6 Dec 2022 09:24:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.44; helo=mail-oa1-f44.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQylL6tZ0z3045
	for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2022 09:24:29 +1100 (AEDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-12c8312131fso15225087fac.4
        for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2022 14:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Co/zzkCX57YjiIHZ6diFtz/RTM1yDwFRLGgy9CALn3k=;
        b=OVaFqJsXwRLgiJ0SDB4RL4uV7Wgood3Wc1FT0uSjn2ZZ8wHDv7O0JPU6YwA1GYbhCQ
         /ux11YtPwZXrScmPY7GI8+Y4TiHHuQSgroZLqEJNzJ0Ym8+5UDenJZMXC9BPYsJ7EXe8
         BckX2bvJYk6ugD07h77dF+lmHPzGctmFKGdcz3v/GRnH0vXmzirdMPwM9rHAqS39xTMJ
         p+19fJLjVdDEM7It6ic+BnqOAFVTSJAOaxoKiQCvYPhzn2GIiOfP7NoFIE5FQsX1Xb32
         qf3Opm+33Tv+w/GU+gDsSorrvPR28WLVp32RWQwCoUkQ4hincE2ez/YyEEj5SnSiaOJt
         30FQ==
X-Gm-Message-State: ANoB5pmmGMHWIl5NBv7bWZ6OyP5Bp+UoDja4oLsqnXVvBnzviPEKgObv
	Yr2REcFLQkiHPZsInmgwtA==
X-Google-Smtp-Source: AA0mqf5KPUlOKZlk8T+En9HAYLNzQISM+hJVBszps97tjWaKv7NPMdh/GkYpXW4fVkzPRyfrlNTQ5g==
X-Received: by 2002:a05:6870:bf0f:b0:13b:b20d:5c72 with SMTP id qh15-20020a056870bf0f00b0013bb20d5c72mr38013206oab.200.1670279066004;
        Mon, 05 Dec 2022 14:24:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m23-20020a4ad517000000b004a085ddc771sm5971373oos.6.2022.12.05.14.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 14:24:25 -0800 (PST)
Received: (nullmailer pid 2797234 invoked by uid 1000);
	Mon, 05 Dec 2022 22:24:24 -0000
Date: Mon, 5 Dec 2022 16:24:24 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: npcm,sdhci: Document NPCM SDHCI
 controller
Message-ID: <167027906409.2797176.10003950661420135791.robh@kernel.org>
References: <20221205085351.27566-1-tmaimon77@gmail.com>
 <20221205085351.27566-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205085351.27566-2-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, adrian.hunter@intel.com, andy.shevchenko@gmail.com, pbrobinson@gmail.com, davidgow@google.com, skhan@linuxfoundation.org, gsomlo@gmail.com, tali.perry1@gmail.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Mon, 05 Dec 2022 10:53:50 +0200, Tomer Maimon wrote:
> Add binding for Nuvoton NPCM SDHCI controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/mmc/npcm,sdhci.yaml   | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
