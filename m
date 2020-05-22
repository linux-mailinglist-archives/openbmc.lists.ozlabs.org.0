Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C961DF235
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 00:45:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TM563JWpzDqcP
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 08:45:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.194;
 helo=mail-il1-f194.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TM1v2PFRzDr0r
 for <openbmc@lists.ozlabs.org>; Sat, 23 May 2020 08:42:26 +1000 (AEST)
Received: by mail-il1-f194.google.com with SMTP id l20so12312372ilj.10
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 15:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JuCuXLGKu/Cpaze8rVHktM6qeXHp4VtIRO2ypPo4gW0=;
 b=MIG79C1X6XejUUWoxrwZKFJ501f9qEecFBQ9UqoprsV/syCzDRHsOJsxTlY0HDhWSc
 nxwTFdHwep/HTVGh7HAM2JDFsbGCZGS0c6jkLKTUQxYnZeAC9+NA4pb8I3wi9vOrW/vw
 Zqr4UjSrwriKrwRXqS1UOgENmKCPzUVddEOiHiyPUfCHQSQp9pAzlw53ejJiOviZnyzK
 tOx1fbF8vG2Up7EdNamuMQORBLD7qcK+j9FSeiShsJ3arq3KGVAEBVJrDHd2iqp9U6mI
 2mVxT9KbYVz1Iy4YngvvlArZnsBEXcDJERQRRhdYe0nE+Yp8A1KprJeX6GpVaeD/rojf
 KOhg==
X-Gm-Message-State: AOAM532zs/2hs3vF66EZDCTlRoFzvEc8cByB1HLceAsyagvtIH/QbnMX
 mFlpFiRPq5AVgiGCzT9qgQ==
X-Google-Smtp-Source: ABdhPJzavXPf6QraDSSP+C8Cf0zAAigF73AyOksGDL0HvQxYO0MhIQUfBalrWcaf30LuSiDr4uw5bQ==
X-Received: by 2002:a05:6e02:130e:: with SMTP id
 g14mr15735257ilr.38.1590187339802; 
 Fri, 22 May 2020 15:42:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id e26sm4195065ioe.39.2020.05.22.15.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 15:42:19 -0700 (PDT)
Received: (nullmailer pid 848403 invoked by uid 1000);
 Fri, 22 May 2020 22:42:17 -0000
Date: Fri, 22 May 2020 16:42:17 -0600
From: Rob Herring <robh@kernel.org>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v13 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
Message-ID: <20200522224217.GA847856@bogus>
References: <20200522113312.181413-1-tali.perry1@gmail.com>
 <20200522113312.181413-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522113312.181413-2-tali.perry1@gmail.com>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, kfting@nuvoton.com,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 wsa@the-dreams.de, brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 ofery@google.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 22 May 2020 14:33:10 +0300, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1296162

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

