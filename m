Return-Path: <openbmc+bounces-739-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A62BDBD31
	for <lists+openbmc@lfdr.de>; Wed, 15 Oct 2025 01:41:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmW272r69z2yGM;
	Wed, 15 Oct 2025 10:41:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760484263;
	cv=none; b=V3bR+GZmpdB/X5E/NekJmoMht5EJENZ1l7Ez4GVKHKNncMZvzIn9o0HpXar47RCZgZbJejRh+hfspR8rAtsb1iIzeXm+NQmUejZiLLBcmd54aFP85FSVoS13V+qSfI56ySJTcJAE7ttlK5mtucG7H4pktPdpFE1Fj3nOaGbiqNNWU1cH8X55QpQHw60aRuqY+DxUVA0jAI+0ZeHtlpTaUumpRRRp1RO1a+W2MzM2TMkWoBwYyacMPO//hCVTxT/sRZOBCdS20eIEg6I2HZaC3fwLttKfRiFb6spyguQsvdUt+OylOdq052fszZuNat8tc+8fq5RRb2+0l3O1meyyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760484263; c=relaxed/relaxed;
	bh=EzbA3h2diXeHnSi6hUxLmW4I+M7NlNe4WP1JAxxHucA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcIEcqEy3WZgGPicVmGIsRI/CyqKxdzswkPn5xtTlEyrWfqQSFFFGaWDHQlw2QBFseulUuMlALHvw4bRlooIXYo050W4axGTJz3oGKDHd7yAgLSM6ne+4pqUCR2Kn3BZ5JMOH8Gr1cqu8raE3SS604eKDSugYpXB00Aos4uXe8uaVgplmhX9Nq+/2zLa5Vcm5NkivDJQOXk9+NFTAccnkzdVWmQcmwaMflS7a+Pzdhs914s+THCiJmjiicKmY2tpzm7cWDjTX3Dk46HBGMCadRxQ8clVAhBlg3rfBFpAa3RTnrHyYbbcjlJbXhrOLcrO/ZQGJczugcmccb3VM+gkbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=minyard.net; dkim=pass (2048-bit key; unprotected) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=x5hlsQsV; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com; envelope-from=corey@minyard.net; receiver=lists.ozlabs.org) smtp.mailfrom=minyard.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=x5hlsQsV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=minyard.net (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com; envelope-from=corey@minyard.net; receiver=lists.ozlabs.org)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmVfY00Qnz2xcB
	for <openbmc@lists.ozlabs.org>; Wed, 15 Oct 2025 10:24:20 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7b4f7a856acso2282752a34.3
        for <openbmc@lists.ozlabs.org>; Tue, 14 Oct 2025 16:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1760484258; x=1761089058; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzbA3h2diXeHnSi6hUxLmW4I+M7NlNe4WP1JAxxHucA=;
        b=x5hlsQsVcLjeF/AxHDqZcGBdtipO8SsJf83/HK/gK8Jgt0C+c/qWCaFLXHwwsvRQ40
         ID1eL4cWginaVnkuibRGQ5m1FHzYHR3HZHcZnxJkmCY1S7fmfImhCxN/Em5MBPV3bblL
         jwDnqzqGjCuRAmbevx0Lq4RFulr6ZnpSgT25XVy2bpg4hL+umgOu9f+iOSFn0B+OIZIr
         nHrHQmCPfg3M+nykvqCBiYBBIe0jw+Yvuo1xlm4pOuzFW694TTgC95ZS9UFujQVXWz3K
         BEUiTBxRWAcZRl3lRJB8DETindL7YgNPyHjX3l6HrqlJ1z+kqCkfoVzTHLj5nLS/6tll
         ugkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484258; x=1761089058;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzbA3h2diXeHnSi6hUxLmW4I+M7NlNe4WP1JAxxHucA=;
        b=shLFitaqJ0Xh+obiXssYiloLbW0CrfrfCMhTJuojQUn4VQFWxyVPx9UOx4gOj31LVM
         tMN7Sm0V3Qnmlcl2P+G1zRGVxDhWk3nWY3T8v4JD3zfIjEAekpN77nbPT8SznJPLWey7
         EQfPTHfBRAi6+u9uzZrF4yWCNi/R5niVzd9kmbx3Q3Y4NoIoPcaPhCVlesharalSdYF6
         6Nc8gcKet5icTmpa0Pf6uiQYheKs8myWC1Pxev5ruzWsKlZbzRZXsCtrmr498ycbHW2e
         8F6dfTjaR5fsArHdGtCjdJtdgWGf+TmH8+N4XhALs+dJHfGFCubayEg1FCkzCzNKBVIC
         N69w==
X-Forwarded-Encrypted: i=1; AJvYcCWwz/6gl2W6nhZo1Bn2vq2EN/+3zgUpm5Bhcp7nyoGAjEmddUmw+Nirj7BOLefvtP1SS54Fp4B2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIBejhh2H0C/e1mzIeNwQrbMdVBY7S/bW3Kf9jUtB0xG0TPswV
	m7QtwFDWId8nQZ1rVPSSyboAZtyFvVLWb1ACKmTU/fYcXRdwYrcRXJO2bS9s3Cus7xg=
X-Gm-Gg: ASbGnctgEkkQmKRVSI6Vl3DjDfconHFjBGuKUS/xxl0UcC68QvDDUIMzuCP+FQT21xe
	kP0ofMXEv1Rl2U8bhRcC1qsoX9NyT5mtk03xNgzAX1U+adYEQRhB/VuHuumJUFTNfEZ1O5WdRiy
	u70DSixYaYM0tdvp7y6GtQRcBtni2C18j6WuvEzgB7jxtHFZiAPPkMxkQXHPkhetSjQc2LnL6dl
	bHMS62GXUADT63PpSIAwe9m798tb4xW34k5h32xJooMt6MKqgwQKBFxXOK9Zb4THtbsXZCiDQUC
	K0vq7YLcmM0zqpZQAAUZlYPoT6NwQnaLKdayejiLHxOSuIFEYKVI1wdXfDD3P0CoE+UFukXg8BE
	TweGuU+ERQaINLXpGfOZTP+i3fGSoxCiNPdg24usyXW3X8XQa3Wq5IUY=
X-Google-Smtp-Source: AGHT+IFQc/e1ZbUnpoFVWuijFM2zvD8w2iyi9D7yf/z3QjAKE+FCW90DUZ0U3/TgiDPhnHf198NIsA==
X-Received: by 2002:a05:6830:641b:b0:74a:1f03:db5a with SMTP id 46e09a7af769-7c0df71bb2cmr14506181a34.3.1760484258480;
        Tue, 14 Oct 2025 16:24:18 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:ad63:63fb:ee1c:2ee9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c0f9067d80sm4859579a34.11.2025.10.14.16.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:24:17 -0700 (PDT)
Date: Tue, 14 Oct 2025 18:24:12 -0500
From: Corey Minyard <corey@minyard.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: ipmi: Convert nuvoton,npcm750-kcs-bmc to DT
 schema
Message-ID: <aO7bnNtjU4G0_c1c@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20251014152935.3782463-1-robh@kernel.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014152935.3782463-1-robh@kernel.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 10:29:34AM -0500, Rob Herring (Arm) wrote:
> Convert the nuvoton,npcm750-kcs-bmc binding to DT schema format. It's a
> straight-forward conversion.

I have queued this for 6.19, but I would like a review from the people
that worked on this file previously.

Thanks,

-corey

> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/ipmi/npcm7xx-kcs-bmc.txt         | 40 --------------
>  .../ipmi/nuvoton,npcm750-kcs-bmc.yaml         | 55 +++++++++++++++++++
>  2 files changed, 55 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
>  create mode 100644 Documentation/devicetree/bindings/ipmi/nuvoton,npcm750-kcs-bmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> deleted file mode 100644
> index 4fda76e63396..000000000000
> --- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -* Nuvoton NPCM KCS (Keyboard Controller Style) IPMI interface
> -
> -The Nuvoton SOCs (NPCM) are commonly used as BMCs
> -(Baseboard Management Controllers) and the KCS interface can be
> -used to perform in-band IPMI communication with their host.
> -
> -Required properties:
> -- compatible : should be one of
> -    "nuvoton,npcm750-kcs-bmc"
> -    "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"
> -- interrupts : interrupt generated by the controller
> -- kcs_chan : The KCS channel number in the controller
> -
> -Example:
> -
> -    lpc_kcs: lpc_kcs@f0007000 {
> -        compatible = "nuvoton,npcm750-lpc-kcs", "simple-mfd", "syscon";
> -        reg = <0xf0007000 0x40>;
> -        reg-io-width = <1>;
> -
> -        #address-cells = <1>;
> -        #size-cells = <1>;
> -        ranges = <0x0 0xf0007000 0x40>;
> -
> -        kcs1: kcs1@0 {
> -            compatible = "nuvoton,npcm750-kcs-bmc";
> -            reg = <0x0 0x40>;
> -            interrupts = <0 9 4>;
> -            kcs_chan = <1>;
> -            status = "disabled";
> -        };
> -
> -        kcs2: kcs2@0 {
> -            compatible = "nuvoton,npcm750-kcs-bmc";
> -            reg = <0x0 0x40>;
> -            interrupts = <0 9 4>;
> -            kcs_chan = <2>;
> -            status = "disabled";
> -        };
> -    };
> diff --git a/Documentation/devicetree/bindings/ipmi/nuvoton,npcm750-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/nuvoton,npcm750-kcs-bmc.yaml
> new file mode 100644
> index 000000000000..fc5df1c5e3bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/nuvoton,npcm750-kcs-bmc.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ipmi/nuvoton,npcm750-kcs-bmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM KCS BMC
> +
> +maintainers:
> +  - Avi Fishman <avifishman70@gmail.com>
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +  - Tali Perry <tali.perry1@gmail.com>
> +
> +description:
> +  The Nuvoton SOCs (NPCM) are commonly used as BMCs (Baseboard Management
> +  Controllers) and the KCS interface can be used to perform in-band IPMI
> +  communication with their host.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nuvoton,npcm750-kcs-bmc
> +      - items:
> +          - enum:
> +              - nuvoton,npcm845-kcs-bmc
> +          - const: nuvoton,npcm750-kcs-bmc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  kcs_chan:
> +    description: The KCS channel number in the controller
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - kcs_chan
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    kcs@0 {
> +        compatible = "nuvoton,npcm750-kcs-bmc";
> +        reg = <0x0 0x40>;
> +        interrupts = <9 4>;
> +        kcs_chan = <1>;
> +    };
> -- 
> 2.51.0
> 

