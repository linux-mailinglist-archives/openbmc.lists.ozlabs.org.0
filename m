Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B261F1DD7C6
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 21:59:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SgRq5HvRzDqvn
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 05:59:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.65; helo=mail-io1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SgR21yQWzDqv1
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 05:58:19 +1000 (AEST)
Received: by mail-io1-f65.google.com with SMTP id k18so8982691ion.0
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 12:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qnmu+TvlIm7jMheLKRmKbVdT8yJM4Ib4roFx6Ri+kOU=;
 b=W5rLq38BXpujbDgEkFLznt7qYc+ObzIQ4B1h8QZiTmWLiEe4XbDrWViclY4OOjhGZm
 VQLqsoLu7RYa4GUh4fBPFf7rROQ1kyexjQ51fguSvyLHXGNaHhzNB+DY7anZhM4z5MbB
 7Bkpybjt6v58epRJ912aVRfWhN+Wf9xGeMHehOaPvPusICZkFZjxxNB13UYJaAVmSsGP
 csSsVdhJGm0DhbJ4XD+0t+4XqDVgsiOTzXqXeg4UvFTB8CxmRhzkF75rVOFg4Oy1Z37w
 gizcO7S/AMOZPnqGHZP/so7Rr3jWWaKcwUbHr4jp2LOuiagmkMXqRaMRK7YYzWsZIT98
 Keow==
X-Gm-Message-State: AOAM531DZc5uUT8nFLBEmnTpLA26DYU8MbRUVS2BwA7TpwREN2Gb14bv
 yChe9M/LKwDGv6puiq45AA==
X-Google-Smtp-Source: ABdhPJwMao229/7LqfcaVPM7jNkfJvReoW9ujB9zAGukbIvbaGMmkriGLneoVhuPZEJr8LMRcnrSRw==
X-Received: by 2002:a02:c8c7:: with SMTP id q7mr5370610jao.111.1590091096617; 
 Thu, 21 May 2020 12:58:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id m89sm3517861ill.40.2020.05.21.12.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:58:16 -0700 (PDT)
Received: (nullmailer pid 2797115 invoked by uid 1000);
 Thu, 21 May 2020 19:58:14 -0000
Date: Thu, 21 May 2020 13:58:14 -0600
From: robh@kernel.org
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v12 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
Message-ID: <20200521195814.GA2796824@bogus>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521110910.45518-2-tali.perry1@gmail.com>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, wsa@the-dreams.de,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 kfting@nuvoton.com, brendanhiggins@google.com, ofery@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 21 May 2020 14:09:08 +0300, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts:22.28-29 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1295115

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

