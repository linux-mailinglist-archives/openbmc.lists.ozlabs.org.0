Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D14E349F0D
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 02:50:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F64fs1ZXdz3brn
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 12:50:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.46; helo=mail-io1-f46.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F64fb0PbBz2yhF;
 Fri, 26 Mar 2021 12:49:58 +1100 (AEDT)
Received: by mail-io1-f46.google.com with SMTP id e8so3889268iok.5;
 Thu, 25 Mar 2021 18:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N9Te2GQTu4UomMNR5C1yrVqQ8Ms/2vbp9BYJ7j0G8SY=;
 b=Alq/pYnCTdUVK0OIl3faKdO2x5HDUhA5FYYmp+Qc/W/AGXDB3LYRV91y0icoHGtZn9
 d8LT8x/yja7QzKuT9N5XSRywBRBEESIVFkPWdyOJQLDt9g9cpG7w+/9IcFwezuxJbyHZ
 wPTBdZM9uFUr5JE9babKx+VevaYJZM9McTWPNs2WS6SwbRq83xWMJDh59WMaNYi3vron
 2q+s4xAr7uIEOheKhnqP+be0r2sjkrzGDgg25aSxx/K7n/Lzxz5g58xx0RUSwod8KXBN
 LlrPNBQYfQlCivCco94r+VOzonqxt9S51zxJ9nMU3HQTh9x/f5zGyGYeklORplc+ZZ01
 M67A==
X-Gm-Message-State: AOAM530rhs1CEr9vM47jUQvEEuZ7alQSSYf1AhVKN9yNOALc5ZN8jVae
 5x8CkxhaxUAD4xEt92U7Lw==
X-Google-Smtp-Source: ABdhPJzoTwDGhGHQRCjyGQmKg+KE2sK/7QlyDCM2mrD6AWIkiUxBHRzesApHsW7lgBo9JGVADjnmEg==
X-Received: by 2002:a6b:ea04:: with SMTP id m4mr8486022ioc.160.1616723396206; 
 Thu, 25 Mar 2021 18:49:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g8sm3140676ile.44.2021.03.25.18.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:49:55 -0700 (PDT)
Received: (nullmailer pid 2160116 invoked by uid 1000);
 Fri, 26 Mar 2021 01:49:47 -0000
Date: Thu, 25 Mar 2021 19:49:47 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 18/21] dt-bindings: ipmi: Add optional SerIRQ property
 to ASPEED KCS devices
Message-ID: <20210326014947.GA2160061@robh.at.kernel.org>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-18-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319062752.145730-18-andrew@aj.id.au>
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
Cc: minyard@acm.org, devicetree@vger.kernel.org, chiawei_wang@aspeedtech.com,
 ryan_chen@aspeedtech.com, benjaminfair@google.com,
 linux-aspeed@lists.ozlabs.org, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 openipmi-developer@lists.sourceforge.net, lee.jones@linaro.org,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 16:57:49 +1030, Andrew Jeffery wrote:
> Allocating IO and IRQ resources to LPC devices is in-theory an operation
> for the host, however ASPEED don't appear to expose this capability
> outside the BMC (e.g. SuperIO). Instead, we are left with BMC-internal
> registers for managing these resources, so introduce a devicetree
> property for KCS devices to describe SerIRQ properties.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
