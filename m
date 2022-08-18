Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F2B598640
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 16:45:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7njZ40YLz3cd3
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 00:45:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.47; helo=mail-pj1-f47.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7njH2rn3z3blx
	for <openbmc@lists.ozlabs.org>; Fri, 19 Aug 2022 00:44:50 +1000 (AEST)
Received: by mail-pj1-f47.google.com with SMTP id x63-20020a17090a6c4500b001fabbf8debfso2039985pjj.4
        for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 07:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=7v4XktmQiYSbnjprvETwVVhTiVD9OLc1xcjNusmMMB0=;
        b=XM4klprihuClzbEr3cU8iWLBcodIcIEbGbx8gBIjbgx0QY9nqLYr2Rf098Ss/nTNHe
         TtWsmXZRC4v+JT9FHxTikchFkU+zOQBpk2gx9LEEjOa+606rpe8CHhU+dokiLYDWlEXw
         Zap7CtTJfEguXLbKzrf+eZzPanhvkINd6oSs2xsmQgnCs6v0W5daW1sSRBB5IZeCUki5
         DmR1UIm1pp9Gl7G82gnsS5R3JTvxAJHf17ZjChno9iD5/Q7MWqTypUwxyHCUBE3AWpwU
         Q0H7Lf2EDS+WnCk7KU3T7B/ZZThxgFrCsI3G2XSs4D+DnMF2EDU5ciPNLlmWjYL7ZcyC
         ZcRw==
X-Gm-Message-State: ACgBeo2x5SlZpRXwnCf1Of+lxcIwN/aWHMiTDviqVl+6rU/vZRSR7yBP
	B5v86ourZcahKLbgLgZ4Tg4TcgfwOw==
X-Google-Smtp-Source: AA6agR4gZIoeLMHhdkO0CcwKC98NvtuC+kOjfzlxXMvMc09CYmNSc8Qa2z7wSvYYQVvm8ZhiD/nQdg==
X-Received: by 2002:a17:90b:3b47:b0:1fa:d988:c916 with SMTP id ot7-20020a17090b3b4700b001fad988c916mr329024pjb.240.1660833887856;
        Thu, 18 Aug 2022 07:44:47 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:80c2:7290:7acd:8d54:3db6:21d4])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090264cf00b00172a8e628e7sm1476467pli.190.2022.08.18.07.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 07:44:47 -0700 (PDT)
Received: (nullmailer pid 1839513 invoked by uid 1000);
	Thu, 18 Aug 2022 14:44:42 -0000
Date: Thu, 18 Aug 2022 08:44:42 -0600
From: Rob Herring <robh@kernel.org>
To: Marvin Lin <milkfafa@gmail.com>
Subject: Re: [PATCH v13 2/3] dt-bindings: edac: nuvoton: Add document for
 NPCM memory controller
Message-ID: <20220818144442.GB1829017-robh@kernel.org>
References: <20220816094641.8484-1-milkfafa@gmail.com>
 <20220816094641.8484-3-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816094641.8484-3-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tmaimon77@gmail.com, tali.perry1@gmail.com, KFTING@nuvoton.com, YSCHU@nuvoton.com, bp@alien8.de, ctcchien@nuvoton.com, james.morse@arm.com, mchehab@kernel.org, kflin@nuvoton.com, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 16, 2022 at 05:46:40PM +0800, Marvin Lin wrote:
> Add dt-bindings document for Nuvoton NPCM memory controller.
> 
> Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> ---
>  .../edac/nuvoton,npcm-memory-controller.yaml  | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
