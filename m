Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 723116C445D
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 08:51:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhLJ128Pkz3cRW
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 18:50:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhLHf3D9hz2yNm
	for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 18:50:37 +1100 (AEDT)
Received: from [192.168.0.2] (unknown [95.90.235.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1F2BA61CC40F9;
	Wed, 22 Mar 2023 08:50:33 +0100 (CET)
Message-ID: <59886f87-c277-5917-a521-5893ab75acee@molgen.mpg.de>
Date: Wed, 22 Mar 2023 08:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ARM: npcm: remove select of non-existant ERRATA
Content-Language: en-US
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>
References: <20230316204749.19902-1-r.czerwinski@pengutronix.de>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230316204749.19902-1-r.czerwinski@pengutronix.de>
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
Cc: linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Tali Perry <tali.perry1@gmail.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Rouven,


Thank you for your patch.

Am 16.03.23 um 21:47 schrieb Rouven Czerwinski:

There is a small typo in the commit message summary/title: 
non-exist*e*nt. Maybe also mention the errata number:

ARM: npcm: Remove select of non-existent ARM_ERRATA_794072

> config ARCH_NPCM7XX selects ARM_ERRATA_794072, however this config
> option does not exist since the workaround for the errata requires
> secure mode access which needs to be run by the bootloader or firmware
> since linux can't determine whether it is running in secure mode.

Please add a Fixes: tag.

> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> ---
>   arch/arm/mach-npcm/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
> index 63b42a19d1b8..d933e8abb50f 100644
> --- a/arch/arm/mach-npcm/Kconfig
> +++ b/arch/arm/mach-npcm/Kconfig
> @@ -30,7 +30,6 @@ config ARCH_NPCM7XX
>   	select ARM_ERRATA_764369 if SMP
>   	select ARM_ERRATA_720789
>   	select ARM_ERRATA_754322
> -	select ARM_ERRATA_794072
>   	select PL310_ERRATA_588369
>   	select PL310_ERRATA_727915
>   	select MFD_SYSCON

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul
