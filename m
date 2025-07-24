Return-Path: <openbmc+bounces-401-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91688B1026A
	for <lists+openbmc@lfdr.de>; Thu, 24 Jul 2025 09:54:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnjvT2F10z3blv;
	Thu, 24 Jul 2025 17:54:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753343669;
	cv=none; b=V/n7VMmlAHTq0M/HxhxuRts/KzwKJLcKipBZEonyZBY2T5pqm4/e/tUVUHTCiudVqpEOKItxiV2OkXwSgn/WtfFt0c7dnzviSUfz4dzNKfNqAEbMfDL8DfOIZ8y6UmVWLXd+XkDtKiCF+8oz1RvecEsh1vjy+RtunCtr5WWZgay08geEa73ZTTiKACIf/tiAgF2py/U4YJKd28a96lUnbDnNvxKRDd1QlhfdZ/+afMfcjbOxQmWb23Ypo6KRO48R4/0TPT+5PDLbSz9Iel9OioMeITGF2M7Evx7IG5S0Pplblfmq6le+E644LgET57u3NJePFxvcPcrM/jPYow4gBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753343669; c=relaxed/relaxed;
	bh=9jM8k4Bpz7aYzlLA/z9EXbMpkEeWBpnurEqrN4qSICA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chF9nREHjFg8h8YVcqKIqC6FQ26DrnCLtnV+eya0BQX/dlxoNK1HEexXub0XBlXVXZdc5quYMM3KOEE8lAhGPE0OL0MMBVr+WGj0B+9KflSYX0jpuxf3b+b7M9+oYF4+azULhUtdBQ1Z4LlUQ02HxC+GAXIG41dO+Vg3P9xQmvQo0Xj/lZKOXPm5B/l7epopF/8s+EwOMG2Pf1h3Leaa2iL7ArNP34VHKlQryGGX7pornRHMuN2TfplJiyEykr3Iqs2qif4bqFbxKXaMNRLmxcjIMpL2ezFRSlVp5Za6s5d64XX9AH+0EmFx0DBlps4erwCWDifJE8TS35qH+EeiEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lQ1RJw1j; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lQ1RJw1j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnjvS46Vxz30T0;
	Thu, 24 Jul 2025 17:54:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C34016111F;
	Thu, 24 Jul 2025 07:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17996C4CEED;
	Thu, 24 Jul 2025 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753343666;
	bh=i2i4FvAvcuu68l81dS/YVmY3OFVFW2LN9O82CoVKe7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQ1RJw1jj5vQdH0uQDIh+j8DzG4WT0pzw1BFCODaK/ai5Be+TDcZckKWh6m7BRM0X
	 Qc0N6jpaWb3Wp65fn5U8Fy1XO6H4Uexv+t5Z9AeZs0M1+6hzF9Ylb+z9LeDT8Ws/rN
	 mr8nkjmOgTlmFkOhMemTJ0VOjd0I7ylq92bPH+8q0ao28yYivPvYLpfRwDgQqFrvP/
	 7/jCbKR6hNfiLqmNh6DRmPgSYOqTEsWq7FYERfSrDMQmtSMWIoh3WL3K7VB6JgaJxb
	 wWau+MTJmlC1y0iWM2ky+Zwcru9Lc4oqIZxNneD2pcRcqIQ8BRtyxUt/1/c1Otvg1W
	 hzyyArKWXSZNA==
Date: Thu, 24 Jul 2025 09:54:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b
 board
Message-ID: <20250724-sweet-radiant-stoat-10d86d@kuoka>
References: <20250723222350.200094-1-donalds@nvidia.com>
 <20250723222350.200094-2-donalds@nvidia.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723222350.200094-2-donalds@nvidia.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 23, 2025 at 03:23:49PM -0700, Donald Shannon wrote:
> This is an Aspeed AST2600 based unit testing platform for GB200.
> UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
> differences, additional gpio expanders, and voltage regulator gating
> some devices.
> 
> Reference to Ast2600 SOC [1].
> Reference to Blackwell GB200NVL Platform [2].
> 
> Link: https://www.aspeedtech.com/server_ast2600/ [1]
> Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
> Signed-off-by: Donald Shannon <donalds@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 456dbf7b5ec8..624581db2330 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -99,6 +99,7 @@ properties:
>                - inventec,starscream-bmc
>                - inventec,transformer-bmc
>                - jabil,rbp-bmc
> +              - nvidia,gb200-ut30b
>                - nvidia,gb200nvl-bmc
>                - qcom,dc-scm-v1-bmc
>                - quanta,s6q-bmc
> -- 
> 2.43.0
> 

