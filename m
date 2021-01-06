Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F35E12EC026
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 16:08:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9t6t14w4zDqQW
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 02:08:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.42; helo=mail-io1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9t5w2vVLzDqNB;
 Thu,  7 Jan 2021 02:08:00 +1100 (AEDT)
Received: by mail-io1-f42.google.com with SMTP id 81so2982991ioc.13;
 Wed, 06 Jan 2021 07:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=sDcxo2YF0ytDnnc725r7joapiGpKbCFaBKSVTNjyV08=;
 b=A2MRoZ+OiZAoRBn3zp6bPOm0NuAItS3sBwugfubPYLvRJX/l8vsA9bLtltyrRib8vU
 hML5KPKSjDKN+Yd84cSNRfKQInaIbesjvkeSnkOCw/OHzF7TOuYShTIsL/nRpJACnZVp
 Eh+oh+MRn60ONN11fm/SAR9uYlWxqmcPAtyq1yQVEwL2mYpNMLd1sGlW2QgIABWPa+Ve
 bkgImfjmXBTcjrXBbLsDs7mXn8ldBMzTpAB9s2st0iFlUAKGG8yWHe1B8yMSi4jg2BVq
 quZh3ls/5g87Yv2/RYCwevzuQFqsOjI8IV23rNI2bH51QdcFbrLb8ANmDAaeENxFZFJj
 g9sw==
X-Gm-Message-State: AOAM532+poqN4lXtgDTH5UFNqqMafL+/qEUyTaW+Xe9N9H8Lt6KN6Zkn
 7l7nQpLLU021ui/ZGdXvQA==
X-Google-Smtp-Source: ABdhPJzcqFMgFW34fkmkOuo+dCdNB7WmoXOrBa8gSy2L1EIrTcOVy6xN9/O2/530ZQJPmTYHIe13/w==
X-Received: by 2002:a5e:aa13:: with SMTP id s19mr3211317ioe.108.1609945678007; 
 Wed, 06 Jan 2021 07:07:58 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f20sm2260581ilr.85.2021.01.06.07.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 07:07:56 -0800 (PST)
Received: (nullmailer pid 2229519 invoked by uid 1000);
 Wed, 06 Jan 2021 15:07:55 -0000
From: Rob Herring <robh@kernel.org>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
In-Reply-To: <20210106055939.19386-2-chiawei_wang@aspeedtech.com>
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
 <20210106055939.19386-2-chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH 1/6] dt-bindings: aspeed: Add eSPI controller
Date: Wed, 06 Jan 2021 08:07:55 -0700
Message-Id: <1609945675.315536.2229518.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, andrew@aj.id.au, maz@kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 p.zabel@pengutronix.de, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 06 Jan 2021 13:59:34 +0800, Chia-Wei, Wang wrote:
> Add dt-bindings and the inclusion header for Aspeed eSPI controller.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/soc/aspeed/espi.yaml  | 252 ++++++++++++++++++
>  .../interrupt-controller/aspeed-espi-ic.h     |  15 ++
>  2 files changed, 267 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/espi.yaml
>  create mode 100644 include/dt-bindings/interrupt-controller/aspeed-espi-ic.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/soc/aspeed/espi.example.dts:45.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/soc/aspeed/espi.example.dt.yaml] Error 1
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1422809

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

