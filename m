Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351FC55BC3D
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 00:01:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX1rz0R4Yz3blj
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 08:01:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.169; helo=mail-il1-f169.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX1rb5N3Lz2xsr;
	Tue, 28 Jun 2022 08:01:03 +1000 (AEST)
Received: by mail-il1-f169.google.com with SMTP id 9so6959277ill.5;
        Mon, 27 Jun 2022 15:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TZkUYB3BYeJsEsDSI6PmO4Ag8GHC0FQvV7iN+YB5Q0Q=;
        b=3pBvx3HVKw0L7ApDs4oWa9RWEYatiOOkD/x+fKRv+NuUGTCi4cvemfRx943Lyg4WJM
         PqIeV6S5hUd6232QDzHIebVDXKAa9DE3LI9wxo/sZ0sMCEqPLx1NmLY9redS21Yj8YoW
         0lG8BRkTl52FqqPtxPvjfWsd6LDB6s0Yv3fVcyN5/9qiE3w0pHXeFn8cSo5QRAO9WNpx
         Okmr5yb43mNciLo+zvvPRnNu54UT+s7Kv3fccbtOPm7yRMl5L6sPuLcU+OWwHR9jZaxD
         dOfWT2Y/+kwegVvZTbxy3Te9K3IZARgrrxFvMIIP6j+jrfrkWAGhVL9uALzDAUN1HQeT
         IB5A==
X-Gm-Message-State: AJIora+Q1nePdaendULb0zeBidKkFZfOOtA5YPRCnwnrerjsho+Kk3uT
	dIsQRo/16XLo6yJ7Tvu5iQ==
X-Google-Smtp-Source: AGRyM1ssOJCADmXqWwlgb8kDzOGggbdItlatIWFU04SmaYPNYTJ0Nxv2RE7Xu59Xf0OzqmtEW0/lww==
X-Received: by 2002:a05:6e02:188a:b0:2d4:7fd:dbf with SMTP id o10-20020a056e02188a00b002d407fd0dbfmr8113049ilu.217.1656367260514;
        Mon, 27 Jun 2022 15:01:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id bo22-20020a056638439600b0033c8edf022bsm2409410jab.144.2022.06.27.15.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 15:01:00 -0700 (PDT)
Received: (nullmailer pid 3041223 invoked by uid 1000);
	Mon, 27 Jun 2022 22:00:58 -0000
Date: Mon, 27 Jun 2022 16:00:58 -0600
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v8 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Message-ID: <20220627220058.GA3036977-robh@kernel.org>
References: <20220615090259.1121405-1-quan@os.amperecomputing.com>
 <20220615090259.1121405-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615090259.1121405-3-quan@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 15, 2022 at 04:02:58PM +0700, Quan Nguyen wrote:
> Add device tree binding document for the SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v8:
>   + None
> 
> v7:
>   + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
> 
> v6:
>   + None
> 
> v5:
>   + None
> 
> v4:
>   + Fix warning with dt_binding_check [Rob]
>   + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml [Quan]
> 
> v3:
>   + Switched to use DT schema format [Rob]
> 
> v2:
>   + None
> 
>  .../devicetree/bindings/ipmi/ssif-bmc.yaml    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
