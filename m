Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FA1A8B13D
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 08:55:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcsGz1lxPz3cQD
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 16:55:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744786519;
	cv=none; b=D7g/T1KAPkwAHADyqBUbvH64n7Zq4YtbXHTzxAxmSn2Z7Em3xhTDJ2MOOIQSeDlMhdnKzbHcI5owQIGSAk5ZewSn94Gee4NwHMspGJyHncWFz4722M29ZRZVFg0qqq5quxRiraB6knYyWEjnZzJHAlcOF+T7unH3wT0BGnIbM85SBLy/l3XY1MFw/nI5Uwj/SWeeyBKO8dxH2NKLY9sEfLyJJJZb/wZ22SXsjk3RZSnlNNW10DRT+ZPBXyjDaJwRxlQkkBMwYeDdvO8HUpOySEg2L4VeAnnT9Wxuvhe4jkdNHNMdC5VUSBMLunYsfvRiP6bW8nqQfH/tAy6yLo8sTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744786519; c=relaxed/relaxed;
	bh=wY5T75LdXs19iUuXGuUcTUNfTIYrvrakxaiIGz6Np1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f06wxWaV+ZhesDMu87uQrbjjzcbgDlnw5FlmkPHvOavr17Q+e2FDnHuu8VXZ0i8y0Y6VIygWpQ9H8wUhI5PV2wZsM6r0rlMD1pyPa6RHRX6rXvdVpPVZ2sj2ZvKJUE3Io+/KA8IIBTTJkeq9fXBRIio+w9iHSduEaQdFa6ZMNcnevlW0RHuyMSelKPuHyClK1MraqVsj1bK4XvlYi5aJ8Vo7Zfzm0hZgNLM9t5eDuciKfiJz9OIZiPTddSPNRHX0Gv0GAWJtaJz/4hMQie1YS4CQ2PYY3mTtVbBebGHkAo7j2pH9dkkYIfZU08FegonWq8bNNgX3lXOcBTqHgCtE+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S/3jgQyE; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S/3jgQyE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 189 seconds by postgrey-1.37 at boromir; Wed, 16 Apr 2025 16:55:19 AEST
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcsGv24v2z2ySk
	for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 16:55:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61E9049FCA;
	Wed, 16 Apr 2025 06:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5A3C4CEE2;
	Wed, 16 Apr 2025 06:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744786517;
	bh=9483KVRR+VyjWpfj8/PmYms6WhIigj+r/oHwCDrTj+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S/3jgQyEb24mEGySglCbuuNXPZ4YAqJtG/zBPWR8Q6qD5Gh2ypzwHFG9g9rNH18bz
	 vAJenDgnPEqP8K3bjwsVilheTIxPdgtVeDdXbTS99xpWV6C3n3pWTQuPGdaQ+/tYez
	 Z1K4ir4iBVOBkye9+GyoaPI5c1LlG2Ug4/Vy6qgu4EVg6CG33rycN79Q/vDsKs+LOo
	 Pg7/Xcv2mwQ5wvC9GLe5Taob3kXPd+KYTBiDxFJGdCJkxbVn/ZUvzz+Co95pjzeNuy
	 LmxtOOwd6E1L+GjsahZ92UECkVN8XyC2Z8CTlOLg6ByIFdaahf5RnUaeA3UGeosgFT
	 2vTmE0vF35ZPQ==
Message-ID: <79400920-22b4-4bce-b204-c58087495c22@kernel.org>
Date: Wed, 16 Apr 2025 08:55:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: Fix nuvoton 8xx clock properties
To: "William A. Kennington III" <william@wkennington.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250415232521.2049906-1-william@wkennington.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250415232521.2049906-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 16/04/2025 01:25, William A. Kennington III wrote:
> The latest iteration of the clock driver got rid of the separate clock

I don't see the binding deprecated.

> compatible node, merging clock and reset devices.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
>  .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 16 ++++++----------
>  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  8 ++++++++
>  2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> index ecd171b2feba..4da62308b274 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> @@ -47,17 +47,13 @@ ahb {
>  		interrupt-parent = <&gic>;
>  		ranges;
>  
> -		rstc: reset-controller@f0801000 {
> +		clk: rstc: reset-controller@f0801000 {
>  			compatible = "nuvoton,npcm845-reset";
>  			reg = <0x0 0xf0801000 0x0 0x78>;

So now it lacks quite a bit of address space. This must be explained in
commit msg.

>  			#reset-cells = <2>;
>  			nuvoton,sysgcr = <&gcr>;
> -		};
> -
> -		clk: clock-controller@f0801000 {
> -			compatible = "nuvoton,npcm845-clk";
> +			clocks = <&refclk>;
>  			#clock-cells = <1>;
> -			reg = <0x0 0xf0801000 0x0 0x1000>;
>  		};
>  
>  		apb {
> @@ -81,7 +77,7 @@ timer0: timer@8000 {
>  				compatible = "nuvoton,npcm845-timer";
>  				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0x8000 0x1C>;
> -				clocks = <&clk NPCM8XX_CLK_REFCLK>;
> +				clocks = <&refclk>;

Not explained in commit msg.


Best regards,
Krzysztof
