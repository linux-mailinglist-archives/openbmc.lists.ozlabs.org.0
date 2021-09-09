Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C960405039
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 14:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4z1t2JQLz2yNf
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 22:33:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.47; helo=mail-oo1-f47.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4z1X3CRTz2xr8;
 Thu,  9 Sep 2021 22:33:03 +1000 (AEST)
Received: by mail-oo1-f47.google.com with SMTP id
 k20-20020a4ad114000000b0029133123994so505020oor.4; 
 Thu, 09 Sep 2021 05:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=JB+SNLlfcpm25i4sSN9couzo+TEO2P9+BVL7k3+yKII=;
 b=4OGcCt6MVDRyYlNETRY/eTzxoGmtCBw8m4PuEk2MAlShuKobS7p11AETTNtCJX3Fl9
 vIvBHLesles0+0nwdNpdLLdDgPe8c5V/OGNxVQlAKed5qQfxRlaNEOQ0qHZP4r6iqv61
 A00B/M1BlnRIg4sV7KMnuFH0UxjPNSsUQD+De2zac/RQiUCOXMTaAQaRnyx25bsx1HY0
 5OnljZvjpUv4uGa5XcCD1CSnqKUUxaLbbUeTRHCRLr0wqUAiziwlko3xRGQpr93yw+Qc
 NgbxduKiPTHlhRwc96gKvz3HR3cg7RkE1ZP3JJl+ZwFg+q9BDccZeaJf/CCupJ/f4eEZ
 BHAQ==
X-Gm-Message-State: AOAM5326L/yaYbv4jb7emoGEmMhboiCTv0dEKDaWOnoarG0E7le/epic
 gjHaBCqKAGjjpKKxMLSSUw==
X-Google-Smtp-Source: ABdhPJy0XHmtcFAE2dZpjjWrUVCUjH89FQg2tjEgw63aJCweJIVoZOV4v+I/L15n0a2BOIdJD2bWuQ==
X-Received: by 2002:a4a:a509:: with SMTP id v9mr2241178ook.73.1631190780811;
 Thu, 09 Sep 2021 05:33:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c7sm411181otm.27.2021.09.09.05.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 05:32:59 -0700 (PDT)
Received: (nullmailer pid 200344 invoked by uid 1000);
 Thu, 09 Sep 2021 12:32:53 -0000
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
In-Reply-To: <20210909102907.32037-2-chiawei_wang@aspeedtech.com>
References: <20210909102907.32037-1-chiawei_wang@aspeedtech.com>
 <20210909102907.32037-2-chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: aspeed: Add UART routing controller
Date: Thu, 09 Sep 2021 07:32:53 -0500
Message-Id: <1631190773.304300.200343.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, yulei.sh@bytedance.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, osk@google.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 09 Sep 2021 18:29:05 +0800, Chia-Wei Wang wrote:
> Add dt-bindings for Aspeed UART routing controller.
> 
> Signed-off-by: Oskar Senft <osk@google.com>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../bindings/soc/aspeed/uart-routing.yaml     | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/aspeed/uart-routing.example.dt.yaml:0:0: /example-0/lpc@1e789000: failed to match any schema with compatible: ['aspeed,ast2600-lpc-v2', 'simple-mfd', 'syscon']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1526149

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

