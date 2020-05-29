Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF411E875D
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 21:11:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YZ0y3WMNzDqjT
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 05:11:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.193;
 helo=mail-il1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YYwr6vxgzDqBS
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 05:07:37 +1000 (AEST)
Received: by mail-il1-f193.google.com with SMTP id v11so3591205ilh.1
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 12:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AmmoIynqErhFkuRJwlx52xsY8NmsJqOG5Lk1cUQU3YE=;
 b=XXbjJ4U594vMEZznmhIh7kKfq6elHw+fLI6cYBAmAl75/K10r9mxPLbxCdsb8je6sP
 lq91ge9MxV6Jvj3DXD/sYcZLAbpOyLIIBrw424fk7/Ig34wcDfblSVOY2hI/77V3tMVs
 uJrzLHBFmIY9GT90XVgi8LoFkm948UxXDEfoHhJyBbTr1Gpdm+sRykyTZ+z3EKoHKRvT
 ALmU0x4LgpWY9zC9G42hMPCzSkv2Lv4VtQhGoifIiP6+XUD4FUu54JPPChkiI+HoEjRv
 WJn5hmcRXq9hIJKkvNakNE/qCdUQWr5ElvpqfzOLKqSFYuq57Bs4e1/AiG/EseFNjQFD
 pIvw==
X-Gm-Message-State: AOAM532JELERaAad8QHsQJuS8va0gQAe0lZFp6HwhfoKTj1jhbBQuT9W
 4wLZDOpAZONKb6mA6fXPjw==
X-Google-Smtp-Source: ABdhPJzkLLdu5roIJcHsxHt0QxtA8mUuU5tAWtM9q7Hr970zjZQbkaIVDDN9GVpaVGM0KZrpYm8IKw==
X-Received: by 2002:a92:c78b:: with SMTP id c11mr2843313ilk.56.1590779253823; 
 Fri, 29 May 2020 12:07:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id p11sm758817ioo.26.2020.05.29.12.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 12:07:32 -0700 (PDT)
Received: (nullmailer pid 2767944 invoked by uid 1000);
 Fri, 29 May 2020 19:07:31 -0000
Date: Fri, 29 May 2020 13:07:31 -0600
From: Rob Herring <robh@kernel.org>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v14 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
Message-ID: <20200529190731.GA2767581@bogus>
References: <20200527200820.47359-1-tali.perry1@gmail.com>
 <20200527200820.47359-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527200820.47359-2-tali.perry1@gmail.com>
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
 wsa@the-dreams.de, brendanhiggins@google.com, ofery@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 27 May 2020 23:08:18 +0300, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
