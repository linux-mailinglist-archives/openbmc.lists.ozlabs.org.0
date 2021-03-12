Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3CE33822C
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:20:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRKj3mM1z3dH2
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:20:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=V4iQ3B+D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=V4iQ3B+D; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRK06kWsz3cnw
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:19:48 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id g185so22671316qkf.6
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c+UfQ5qUff/S2dotKdikUx7pn/0co+F2oRAkW1FEZJw=;
 b=V4iQ3B+De9XO5QH9u7HINslIOGWKAMuTryM4PQpny+wXTznQwvo0hiV9Svq1Bbcjmb
 3fDvTFlkrK3RRgrHk88a4mbVfq1V5Jvpao/9mM88ewsDJYrNVuQpIe6cLLVTz/L5O4Ip
 zQBDavfgCHLqkqo6UwcNL+3eTd7tOi+iyFBCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c+UfQ5qUff/S2dotKdikUx7pn/0co+F2oRAkW1FEZJw=;
 b=obl/SrUdbVMyjAtS/ZeXr98zF069MRmRy+dNs7Rlk9OXHyp3yG7nGfOwfO888sV7ON
 SuxFLmyWvOhzhJUaJ9rTrwiKxjmWk9bzqDozCFEJfEdd43R95u4a8G3IB1psMzNIKJui
 6qXWsaigRdVjKsAsrNcNzzuizNm4L2TDj99DvMjcxVjfr7eR1IwlkKcjvX90GI0UGUSd
 t044kEi51lKzOSyX+v+lJNMLIkXePXynX6qVsKzqlxiomB/yunm5807PRaSNlk7OLT2U
 Uz/qJf/u1+35TgpC1G6fq6aDQF5VPPTTeBg5Nve71ljhQPMkUkdTagBvoHpY3O/HWjiJ
 kP6Q==
X-Gm-Message-State: AOAM531oyfLVMhkT3oCCO43QDYxCHIDfWXGAF2AJfkInrPyCevczQkFC
 ZzqObzI4Iy5hehQzR4HJxJ64kJj5oNd2iypxcHc=
X-Google-Smtp-Source: ABdhPJxeCJouddH0MkR5bx5fOwyrIzye6jvPUZnQ6uaBfDHS8FZ8n0Y+MnLrAnmeBeePtUEDO/YUowSXhgfcx4O4nbo=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr10468767qkn.273.1615508385274; 
 Thu, 11 Mar 2021 16:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-14-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-14-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:19:33 +0000
Message-ID: <CACPK8XewJUfpJTVEmBddse7iM5UgyaDnGOvWzk0hNDy5Z0vUVA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 13/35] dt: bindings: mmc: Add phase control
 properties for the Aspeed SDHCI
To: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Andrew Jeffery <andrew@aj.id.au>
>
> Add properties to control the phase delay for input and output data
> sampling.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Andrew, can you please review this and the other mmc related device
tree changes in this series.

I'm particularly interested in the upstream state of these changes.

> ---
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 987b287f3bff..ebcb9ed4e308 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -37,6 +37,14 @@ properties:
>    clocks:
>      maxItems: 1
>      description: The SD/SDIO controller clock gate
> +  "aspeed,input-phase":
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description:
> +      The input clock phase delay value.
> +  "aspeed,output-phase":
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description:
> +      The output clock phase delay value.
>
>  patternProperties:
>    "^sdhci@[0-9a-f]+$":
> --
> 2.27.0
>
