Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F31B9589E0D
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 17:01:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzBlK6Gmkz3bYd
	for <lists+openbmc@lfdr.de>; Fri,  5 Aug 2022 01:01:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzBl23Rnlz2yn3
	for <openbmc@lists.ozlabs.org>; Fri,  5 Aug 2022 01:01:33 +1000 (AEST)
Received: from [172.18.172.87] (unknown [46.183.103.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0544D61EA1928;
	Thu,  4 Aug 2022 17:01:21 +0200 (CEST)
Message-ID: <6fef92f3-6932-5c20-57fe-9eb40d676013@molgen.mpg.de>
Date: Thu, 4 Aug 2022 17:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH v1] dt-binding: ipmi: add fallback to npcm845 compatible
To: Tomer Maimon <tmaimon77@gmail.com>
References: <20220804145516.217482-1-tmaimon77@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220804145516.217482-1-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, minyard@acm.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openipmi-developer@lists.sourceforge.net, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Tomer,


Am 04.08.22 um 16:55 schrieb Tomer Maimon:
> Add to npcm845 KCS compatible string a fallback to npcm750 KCS compatible
> string.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>   Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> index cbc10a68ddef..4fda76e63396 100644
> --- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> +++ b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> @@ -7,7 +7,7 @@ used to perform in-band IPMI communication with their host.
>   Required properties:
>   - compatible : should be one of
>       "nuvoton,npcm750-kcs-bmc"
> -    "nuvoton,npcm845-kcs-bmc"
> +    "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"

Isn’t the added string exactly the same as the one below the compatible 
line?

>   - interrupts : interrupt generated by the controller
>   - kcs_chan : The KCS channel number in the controller


Kind regards,

Paul
