Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 629499AE260
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2024 12:20:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZ23h71hVz3c4y
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2024 21:20:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729765213;
	cv=none; b=AGyhtZ9PjsFKXR5cWbaP/NZUL0OdKeScSfUAVFt/Lcfj+/1zmkce59Q7QMJllGFrpgKvmD5Fodc3rnz5Xo1Pz795/0gUsoFxOajzYljOZodj7V2PItt22xZVT/BV6Rm2kCsALNodFGnJJyBBUBiyjKzo70gaa54TtzDYCwYh+HrQUEX7YM3Y/XDNs2QFmuTp6bFwzQvG24SeZ007G+pad9CUaYhaaafKs452Kh48xZbB1IKaCBhTfQOG/zY+ZyGdFHO9jAa3Tbey8P7Hsv9uDHDi+VEFzFmEYO5e+BOUKGQG14SHZ/bjtrWYBl6i9KGycbbUTNwqAJOc+CArJzG2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729765213; c=relaxed/relaxed;
	bh=RvHJU9EAOF9xOUpM45mYWiQ61gp7TJG3qkWoVzsZDZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDX61s13dDNqEhy25wReDr1TNs198HKuQRcIy6BGRi2INWhR+/WTB0lJA0iFGovmrzo0MU2vOjpQC2GyZ0oelC70mIxbYHUu28PZ1kndqzKhv+3LDM5xWH3RL2aPR8cv+CwhLWMLMZKJs+v6ECcSc5PFWaQVggNpySTTIU62F/fUaUT6X/nQhKsvdScU28zjw5c0DtKTnOSVuce+1P2A7kEB9duMoeJaCctNgT7AMgdvP5SIhpYQmHAkpSBBiHy0Tg/JZB3ZRui4smJdjZw5tx1gNI7+FYJ6eSwxeYdUjOpTik5PO/pDO6Z5ahGDBJGKCzyfyTKYQz6BK7PMFHdCYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SA2w5szo; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SA2w5szo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZ23c07lqz2yYk
	for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2024 21:20:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 451E0A45330;
	Thu, 24 Oct 2024 10:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91D8C4CEC7;
	Thu, 24 Oct 2024 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729765209;
	bh=JZRT/LML4GQueNnOCFhx/XljE+CECLtfbjWTWn0M5qM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SA2w5szoWW2BU+Mf4zmP7FiFjH4iVCZmxCMflLXidIUuRUUTZ1ytMhG27HIercfbf
	 wkMowBMShKDw1Ey5mRNdzBoUvJcwcUo+vPBYlNOL+hqzwkQX0eky30pcFtGk386rLn
	 27Zk8qFLxPpFT0cMNBQ2e3+VQhvrZTXGm+7QkXquEfoqMGJuuuxn2aJ9il53fI5Ib9
	 DFCfGISL7OXw+1Tn7/Th/eC2BuUwGDiHxcjSwHe0MjyeM/4LnBWMH4qyzfxujpV3MS
	 3XWW9hVIs4V6oVVYsHYrJvaLALQIR+k86ZJh8N9VGa35vrONdI3ktam4bvjOltGzmq
	 WkJmjbnzR5d3Q==
Date: Thu, 24 Oct 2024 12:20:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v7 3/4] i2c: npcm: use i2c frequency table
Message-ID: <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-4-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021062732.5592-4-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tyrone,

...

> -	/* 100KHz and below: */
> -	if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
> -		sclfrq = src_clk_khz / (bus_freq_khz * 4);
> -
> -		if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> -			return -EDOM;
> -
> -		if (src_clk_khz >= 40000)
> -			hldt = 17;
> -		else if (src_clk_khz >= 12500)
> -			hldt = 15;
> -		else
> -			hldt = 7;
> -	}
> -
> -	/* 400KHz: */
> -	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
> -		sclfrq = 0;
> +	switch (bus_freq_hz) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
> +		smb_timing = smb_timing_100khz;
> +		table_size = ARRAY_SIZE(smb_timing_100khz);
> +		break;
> +	case I2C_MAX_FAST_MODE_FREQ:
> +		smb_timing = smb_timing_400khz;
> +		table_size = ARRAY_SIZE(smb_timing_400khz);
>  		fast_mode = I2CCTL3_400K_MODE;
> -
> -		if (src_clk_khz < 7500)
> -			/* 400KHZ cannot be supported for core clock < 7.5MHz */
> -			return -EDOM;
> -
> -		else if (src_clk_khz >= 50000) {
> -			k1 = 80;
> -			k2 = 48;
> -			hldt = 12;
> -			dbnct = 7;
> -		}
> -
> -		/* Master or Slave with frequency > 25MHz */
> -		else if (src_clk_khz > 25000) {
> -			hldt = clk_coef(src_clk_khz, 300) + 7;
> -			k1 = clk_coef(src_clk_khz, 1600);
> -			k2 = clk_coef(src_clk_khz, 900);
> -		}
> -	}
> -
> -	/* 1MHz: */
> -	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
> -		sclfrq = 0;
> +		break;
> +	case I2C_MAX_FAST_MODE_PLUS_FREQ:
> +		smb_timing = smb_timing_1000khz;
> +		table_size = ARRAY_SIZE(smb_timing_1000khz);
>  		fast_mode = I2CCTL3_400K_MODE;
> -
> -		/* 1MHZ cannot be supported for core clock < 24 MHz */
> -		if (src_clk_khz < 24000)
> -			return -EDOM;
> -
> -		k1 = clk_coef(src_clk_khz, 620);
> -		k2 = clk_coef(src_clk_khz, 380);
> -
> -		/* Core clk > 40 MHz */
> -		if (src_clk_khz > 40000) {
> -			/*
> -			 * Set HLDT:
> -			 * SDA hold time:  (HLDT-7) * T(CLK) >= 120
> -			 * HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
> -			 */
> -			hldt = clk_coef(src_clk_khz, 120) + 7;
> -		} else {
> -			hldt = 7;
> -			dbnct = 2;
> -		}
> +		break;
> +	default:
> +		return -EINVAL;

There is here a slight change of behaiour which is not mentioned
in the commit log. Before the user could set a bus_freq_hz which
had to be <= I2C_MAX_..._MODE_FREQ, while now it has to be
precisely that.

Do we want to check what the user has set in the DTS?

(Or am I missing something?)

Thanks,
Andi
