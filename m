Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E12441DCF3B
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 16:11:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SWk26sQkzDqdG
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 00:10:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SWgD1LR4zDqc7
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 00:08:23 +1000 (AEST)
Received: by mail-io1-f65.google.com with SMTP id h10so7532982iob.10
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 07:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hkdAaLYIc0WsgyOtF7HphxQvDajMRAVCt9ecUnq6cSs=;
 b=V5qNH3C+HWgiRR65k/LfArJ7wIN1U2TvbyRzwT+Tf6XKMrbgFcvQ9s1GmWbgvxj66A
 uTI8ba0E0pqlZxCfiHzIYXxvBcRf4759e4xY063fwhk1cDLnGd3DMT7qiIPXxqNT62TM
 +F/nkmSjQNmRZya+g44tFGo3/uvng9eQpt4gPwUc7r/2L16Eol4JwXg1Q/k+Ph8YsEEN
 VgR44Thj5JJAu7BO19zIlsr52ai+kYLFTNkZr4v3rU0JMzsUD2SgBJ3cCwR6oIBLir5j
 H9lBohthOLsYLZDTWjnwIJ46BhH9HzB1FPREHGcCoLYvhstaQypp/zHOH8Opkaz9ukvA
 6v7w==
X-Gm-Message-State: AOAM5317PPIziEe4yjM/hW2t/4uLuaZk+1u6vaz6v/8BO37cl80LjjVb
 P3HiQ9r2VnfJJXGMpoLnIQ==
X-Google-Smtp-Source: ABdhPJzuJXTY4mbZgkKCxsK6OiELIu9X1jZKqPMjnJt3n48gVbBt7CPOXr61k8mGVP/9ied0TyLdOw==
X-Received: by 2002:a02:90cd:: with SMTP id c13mr3832204jag.83.1590070100265; 
 Thu, 21 May 2020 07:08:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id c13sm3060220ilu.81.2020.05.21.07.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 07:08:18 -0700 (PDT)
Received: (nullmailer pid 2308939 invoked by uid 1000);
 Thu, 21 May 2020 14:08:17 -0000
Date: Thu, 21 May 2020 08:08:17 -0600
From: Rob Herring <robh@kernel.org>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
Message-ID: <20200521140817.GA2308392@bogus>
References: <20200520095113.185414-1-tali.perry1@gmail.com>
 <20200520095113.185414-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520095113.185414-2-tali.perry1@gmail.com>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, wsa@the-dreams.de,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 kfting@nuvoton.com, brendanhiggins@google.com, ofery@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 20 May 2020 12:51:11 +0300, Tali Perry wrote:
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

See https://patchwork.ozlabs.org/patch/1294210

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

