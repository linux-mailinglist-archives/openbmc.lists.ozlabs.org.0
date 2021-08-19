Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D9C3F19C0
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 14:49:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr4NM0qW4z3cLN
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 22:49:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.170;
 helo=mail-oi1-f170.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr4My4fs7z306F;
 Thu, 19 Aug 2021 22:49:17 +1000 (AEST)
Received: by mail-oi1-f170.google.com with SMTP id t35so8337325oiw.9;
 Thu, 19 Aug 2021 05:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=zg3VPS1fKrsY8XB+1ftfUYl3cw7kXB5wzWtSZiId8do=;
 b=D/4qTcnhX6+9VEYY287AlyKxHPWThX1PGxphJBH6YBgFtkrRqfcVkKHX/NHDXhA8Hi
 jtaBhWV+JxxfTk7D9djMXuxufdMNM3rVs+uYnOJoXToBfVC2KPx54jhsxyQVbNiJs26I
 4oEt2lTO9LsfFX7xSlqfB4Z1br/QP2NDOUgNSaEVHMFeKzZbQNOwtw6om+SsY+Co+o2U
 t37YD+YVjn/WH9wGM89FyMg/P2StlOO1CdLi7IlG1kJIIxjHGOhEdFK28WBwmwNXzmQB
 MEZ1x5bY8V7+BBicK3+adWAg4HXMxo3B1QTmKnAXwfWEGQ0aDm4dWf0BLUwPAFhF789F
 uY5w==
X-Gm-Message-State: AOAM530c2YRDCqabAPNu0lo4G11deKDy2/B7ufMkev01H3TwGRNZUfEu
 JnQLe4nL0SdhuPm0V9ytcQ==
X-Google-Smtp-Source: ABdhPJxasodywzNSc6uJ4iwV43paF2LoulLSjp2aRVVDaH0jW5MB4naam6DRVd0hfPm4uL/TRc+LWA==
X-Received: by 2002:a05:6808:1390:: with SMTP id
 c16mr2490439oiw.123.1629377352689; 
 Thu, 19 Aug 2021 05:49:12 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m16sm546305oop.3.2021.08.19.05.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 05:49:12 -0700 (PDT)
Received: (nullmailer pid 288211 invoked by uid 1000);
 Thu, 19 Aug 2021 12:49:09 -0000
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
In-Reply-To: <20210819080040.31242-2-chiawei_wang@aspeedtech.com>
References: <20210819080040.31242-1-chiawei_wang@aspeedtech.com>
 <20210819080040.31242-2-chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: aspeed: Add eSPI controller
Date: Thu, 19 Aug 2021 07:49:09 -0500
Message-Id: <1629377349.157361.288210.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 19 Aug 2021 16:00:36 +0800, Chia-Wei Wang wrote:
> Add dt-bindings for Aspeed eSPI controller
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/soc/aspeed/espi.yaml  | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/soc/aspeed/espi.example.dts:35.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/soc/aspeed/espi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1518493

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

