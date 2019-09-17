Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0106FB5691
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 21:58:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xv6l2NRnzDqLj
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 05:58:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.193; helo=mail-oi1-f193.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xv5v1PMXzF3dx
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 05:57:20 +1000 (AEST)
Received: by mail-oi1-f193.google.com with SMTP id 7so3985722oip.5
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 12:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8OJcLjUpBrW1/qbYAiu6WuFYEuH8ShVscvI6okWWXn8=;
 b=kCVK2khml5jbiJZSFAExkf3WFARU35Jif2TlRL7KSPFqh+x7Zx71t0aS9/VfW1BnBr
 kVzi7xB421tvacOzGA0HLpK6xJ7UH1t6IowIT9EMS8SHb/rfei661ermDExxcGjLquAI
 3ie+4JM2M7tqItN7lfVpVB96mlBFAev8jK7tZ6O/p6a/L/4btu9Tui3TP4dp4Uy9iL5W
 GEsV3U0o15zW313Jr9n3IAK/EaD2z1BC6PGS4cEjNWdGG7bny6P3j5a850XK9yOYDKFm
 99ch4CM2j7KaSaMpzXtqYcQ3Z9O9ePQy6cP5NepGgdAIPCzyYehknMA+5Q4z/thmDxAs
 /TVQ==
X-Gm-Message-State: APjAAAW3PIvbmviKmtviFsy96I99rNaevT4Pp6SoJTbJ91BkR2yTZuVO
 pbOfVeQqqONYvO/vR5R91g==
X-Google-Smtp-Source: APXvYqyZSU4eFtO2Ik2YQkAoBuTSYow+Kn3ZPm23D3N/+ENyPy94zmiHTTWDOHk5oVigXiOADvOO7w==
X-Received: by 2002:aca:4c84:: with SMTP id z126mr5362414oia.86.1568750238166; 
 Tue, 17 Sep 2019 12:57:18 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y137sm1092025oie.53.2019.09.17.12.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 12:57:17 -0700 (PDT)
Date: Tue, 17 Sep 2019 14:57:16 -0500
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-binding: hwrng: add NPCM RNG documentation
Message-ID: <20190917195716.GA25687@bogus>
References: <20190912090149.7521-1-tmaimon77@gmail.com>
 <20190912090149.7521-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912090149.7521-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, sumit.garg@linaro.org, linux-crypto@vger.kernel.org,
 herbert@gondor.apana.org.au, arnd@arndb.de, devicetree@vger.kernel.org,
 avifishman70@gmail.com, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, vkoul@kernel.org, robh+dt@kernel.org, mpm@selenic.com,
 venture@google.com, tglx@linutronix.de, jens.wiklander@linaro.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 12 Sep 2019 12:01:48 +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM Random Number Generator (RNG).
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/rng/nuvoton,npcm-rng.txt     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
