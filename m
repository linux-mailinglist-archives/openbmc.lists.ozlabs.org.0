Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC5250EB52
	for <lists+openbmc@lfdr.de>; Mon, 25 Apr 2022 23:39:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnJM430jBz3bqJ
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 07:39:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.46; helo=mail-oa1-f46.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnJLk0pzbz3bd9;
 Tue, 26 Apr 2022 07:39:24 +1000 (AEST)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-e9027efe6aso10194727fac.10; 
 Mon, 25 Apr 2022 14:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M3R043itbLpaOlNutqBsUrB9rfl8TA7O8rvFQFaCgW0=;
 b=1UL/8VnpNoOJSI741w0Ou7A7UGnhxCeDUqo61a37tbf61FWut5OWoCgysI91BfTYgT
 gciwWa01eTH0NcKZ10lzrNdcKl18SaNEif6NkkvghhSKuXtQ7ZoHoos14JGnjebyroNa
 lcxMBdfR4iB91JLZopQWrWZi+K1JxXCtnLB4DP07PEScH5zOoxhxQ9I05BVAeKEEfv9a
 n3m44g0zhnYHSd4TtBWyr0WWNlwX/rSYyeqfubsiTcWbh6toMEGRHMeEKCsL79EmJubZ
 KBg77sGCuQ7nbP61Sli2uoYLgJ7oSRA5UtR3eIW58N4dKSfSlJxiWvCYlIvYujYrjSRz
 Qusg==
X-Gm-Message-State: AOAM532WNGBo3nkb4GhfCoRRqqGMZZGiYu4mb6AWSdMhlARoQNNEAyw1
 KGnUOTVV6OjkAoK3haQdCA==
X-Google-Smtp-Source: ABdhPJx95JVH34JzFNbcrxkClorcgvSIy6VQetgVvlAGfeInSVtMGuS9SDe47ls3sAPTDW45mGk2tA==
X-Received: by 2002:a05:6870:618e:b0:e5:c2f3:e009 with SMTP id
 a14-20020a056870618e00b000e5c2f3e009mr8008861oah.10.1650922761186; 
 Mon, 25 Apr 2022 14:39:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r8-20020a05683001c800b006059d4bc39dsm2893087ota.6.2022.04.25.14.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 14:39:20 -0700 (PDT)
Received: (nullmailer pid 334467 invoked by uid 1000);
 Mon, 25 Apr 2022 21:39:19 -0000
Date: Mon, 25 Apr 2022 16:39:19 -0500
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v7 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Message-ID: <YmcVB/9lB6xkw4d2@robh.at.kernel.org>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422040803.2524940-3-quan@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>,
 linux-aspeed@lists.ozlabs.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Open Source Submission <patches@amperecomputing.com>,
 openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 22 Apr 2022 11:08:02 +0700, Quan Nguyen wrote:
> Add device tree binding document for the SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
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
> 

Reviewed-by: Rob Herring <robh@kernel.org>
