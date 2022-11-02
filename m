Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE861695C
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 17:41:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2Xhf0z4kz3cGk
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 03:41:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.44; helo=mail-oa1-f44.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2XhF1Tjhz2xKV
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 03:40:59 +1100 (AEDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13be3ef361dso20863736fac.12
        for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2022 09:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+qIpBdMeiwMSdKxhevqq/k7KwaaJsQLzkW85JVdIao=;
        b=MDxWx56yyPsYiUYoLjICkl7YnufLK/5IoN6tNEw5DXre59hF5PucEb6EdwF+3luw/t
         A0Wgw6sU7GMfU3+M6Pm/tJJtKA774UMXqlgrMA6t+DyqDG0XpDUyCbw/8rOnC9IzQEfR
         ejxgwaliRMYgnx1xeOfgTDGg9fuN6kJyQ+BknFn9k8A5nA3popRI6EXXd5iaLfQoaGby
         OuBBZQ58CGn5b5vxVVA2y/POl5TYYPFdfoX2wPjZclcYvaOcHB1FcAZiXY29iJxADhEu
         vJxN5KnFTcKDNc7paxCe2Nk9XPPoiXDLGHgNPssYrQODyZwBWtBEk5EcK0w8WnU4Vkjt
         c9Fg==
X-Gm-Message-State: ACrzQf3z8JjNdivxK3SoER1nI48C/nKJdWE81XbA7GX3d19mrtSirJXO
	C6e+6F5vfxM1g9R3TkVnPg==
X-Google-Smtp-Source: AMsMyM6f3lSc5rozDexOGm1YJwC+cz1fMbEXwplGHe3C/bKL7xZEBfeU6Fgy9bW+3b/j+e12LhudwQ==
X-Received: by 2002:a05:6870:785:b0:131:e39c:9140 with SMTP id en5-20020a056870078500b00131e39c9140mr15365528oab.261.1667407256894;
        Wed, 02 Nov 2022 09:40:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i16-20020a056870a69000b0013b8b3710bfsm6213718oam.13.2022.11.02.09.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 09:40:56 -0700 (PDT)
Received: (nullmailer pid 4016578 invoked by uid 1000);
	Wed, 02 Nov 2022 16:40:58 -0000
Date: Wed, 2 Nov 2022 11:40:58 -0500
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 2/3] dt-bindings: regulator: Add regulator-output
 binding
Message-ID: <166740725744.4016522.5256752936838143557.robh@kernel.org>
References: <20221031233704.22575-1-zev@bewilderbeest.net>
 <20221031233704.22575-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031233704.22575-3-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Naresh Solanki <naresh.solanki@9elements.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Mon, 31 Oct 2022 16:37:03 -0700, Zev Weiss wrote:
> This describes a power output supplied by a regulator, such as a
> power outlet on a power distribution unit (PDU).
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
> 
> Changes since v1:
>  - removed 'regulator-leave-on' property
> 
>  .../bindings/regulator/regulator-output.yaml  | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/regulator-output.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
