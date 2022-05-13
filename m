Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B0C525B01
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 07:23:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kzxqw0Swfz3cCd
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 15:23:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kzxqd36rtz3bYJ
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 15:22:53 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aeb24.dynamic.kabel-deutschland.de
 [95.90.235.36])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1757361EA1928;
 Fri, 13 May 2022 07:22:50 +0200 (CEST)
Message-ID: <5e1d0765-5428-b787-75ad-063a1fb051fc@molgen.mpg.de>
Date: Fri, 13 May 2022 07:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/5] arm: dts: Add node for NPCM Video Capture/Encode
 Engine
Content-Language: en-US
To: Marvin Lin <milkfafa@gmail.com>
References: <20220513033450.7038-1-kflin@nuvoton.com>
 <20220513033450.7038-2-kflin@nuvoton.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220513033450.7038-2-kflin@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 mchehab@kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Marvin,


Thank you for the patch.

Am 13.05.22 um 05:34 schrieb Marvin Lin:
> Add node for Video Capture/Differentiation Engine (VCD) and Encoding
> Compression Engine (ECE) present on Nuvoton NPCM SoCs.

Could you please add the datasheet name and revision to the commit message?

What board did you test this on?

> Signed-off-by: Marvin Lin <kflin@nuvoton.com>

As you sent this from your Google Mail account, that address is going to 
be used in the author field. Is your Nuvoton address configured for git?

     git config user.email

Then I would have thought, that that address is also in the files 
generated by `git format-patch`.


Kind regards,

Paul


> ---
>   arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index 3696980a3da1..0d2df74974bf 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -178,6 +178,19 @@
>   			status = "disabled";
>   		};
>   
> +		video: video@f0810000 {
> +			compatible = "nuvoton,npcm750-video";
> +			reg = <0xf0810000 0x10000>, <0xf0820000 0x2000>;
> +			reg-names = "vcd", "ece";
> +			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_VCD>,
> +				 <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_ECE>;
> +			reset-names = "vcd", "ece";
> +			nuvoton,syscon-gcr = <&gcr>;
> +			nuvoton,syscon-gfxi = <&gfxi>;
> +			status = "disabled";
> +		};
> +
>   		apb {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> @@ -553,6 +566,12 @@
>   				pinctrl-0 = <&smb15_pins>;
>   				status = "disabled";
>   			};
> +
> +			gfxi: gfxi@e000 {
> +				compatible = "nuvoton,npcm750-gfxi", "syscon",
> +					     "simple-mfd";
> +				reg = <0xe000 0x100>;
> +			};
>   		};
>   	};
>   
