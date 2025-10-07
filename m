Return-Path: <openbmc+bounces-721-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83465BC09DC
	for <lists+openbmc@lfdr.de>; Tue, 07 Oct 2025 10:25:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgq2c0l6Vz2yrm;
	Tue,  7 Oct 2025 19:25:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759825528;
	cv=none; b=jpSb1wafCGjyxNFOQD+e/EatDAJfd+O6zotCiopi0gUxPZtK2gqqjyCL19GIHHG0K3Sxr0HmEX06IF3GbNsoa0o5LEzSVX2MPmDTsgA3v2dNVo9iQWibeYvA8zo0ojF4l0bdaPfuKFS/m1NQKzfYfP2Zk3uBXNKCpib+LMbrT5acXRP+YUsFBqbg4AkZwUlDU6g8T4dzs2caHwA2QI4gGZwBdwCB/koUEIVnj+dMeyLa8IXdqZhwzb0TmohU/ZkaDkKMTgcUizFAQkp5QHTtqywiAvaHVYRv372TQdvhtv58OrrvXmynvg7CLSEFZK4Qhzx0HQPQBBS+FkqfYoF2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759825528; c=relaxed/relaxed;
	bh=thhiy6WJWkzhbMUJKkuCS8PTiJl8fbR9lhDqJ0nJXS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDMHSZjeB25kJ6KRQZIiBw7m/ghLh+rNcewy3h24Xphjh0n3vUvSU5fuQwLOHDQVqo428jUCe2T0JjEMuSIKLugu7WsfkMPvNa0b4gf7g5hvbDsTjGmc+hr782z3nW3+VS52vE9AFX2CXYw7qtk4VOa11Bgiq55M4m+uRHqXc1eHNmCjFLLE0DEC7sDlEWRnMTNxm2IfbvTIyXsPMiJpsmP5eRKXPMyXWa141r2aiILukZEUlfS1V938ZhYQBHQzjJSrSqYJ2eGurwnutYWKpOrBWVhZ45if7CCBaOuvVy1m5vtGyfHoY98+jGkgE4XxK5H5wDDIXKOb6HkvZs9scA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 331 seconds by postgrey-1.37 at boromir; Tue, 07 Oct 2025 19:25:26 AEDT
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgq2Z2WHpz2xQ4
	for <openbmc@lists.ozlabs.org>; Tue,  7 Oct 2025 19:25:26 +1100 (AEDT)
Received: from [141.14.14.72] (v072.vpnx.molgen.mpg.de [141.14.14.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id C61D66028F362;
	Tue, 07 Oct 2025 10:19:31 +0200 (CEST)
Message-ID: <dfe6111f-8489-4af5-88ed-0f536349ead6@molgen.mpg.de>
Date: Tue, 7 Oct 2025 10:19:31 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] peci: cpu: add Intel Emerald Rapids support
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-2-fr0st61te@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251006215321.5036-2-fr0st61te@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear Ivan,


Thank you for the patch.


Am 06.10.25 um 23:53 schrieb Ivan Mikhaylov:
> Add support for detection of Intel Emerald Rapids processor based on
> CPU model.
> 
> Emerald Rapids Xeon processors with the model set to
> INTEL_EMERALDRAPIDS_X. The data field for this entry is "emr".
> 
> Tested the patch series with AST2600 BMC with 5S Intel Emerald Rapids
> processors & verified by reading cpu & dimm temperature which matches
> host sensor values from lmsensors.

Should you resend you could add the output.

> Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> ---
>   drivers/peci/cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
> index 2dac8ba82787..fbccc1d1b637 100644
> --- a/drivers/peci/cpu.c
> +++ b/drivers/peci/cpu.c
> @@ -321,6 +321,10 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
>   		.x86_vfm = INTEL_SAPPHIRERAPIDS_X,
>   		.data	= "spr",
>   	},
> +	{ /* Emerald Rapids Xeon */
> +		.x86_vfm  = INTEL_EMERALDRAPIDS_X,
> +		.data  = "emr",
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

