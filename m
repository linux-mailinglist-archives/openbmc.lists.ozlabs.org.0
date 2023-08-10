Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D797771F7
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 09:56:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLzl82BPTz30PN
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 17:56:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLzkl49C2z2xpx
	for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 17:55:57 +1000 (AEST)
Received: from [192.168.0.2] (unknown [95.91.208.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 028F961E5FE04;
	Thu, 10 Aug 2023 09:55:30 +0200 (CEST)
Message-ID: <d23de35f-8d55-4f80-a6ce-281f83fd4243@molgen.mpg.de>
Date: Thu, 10 Aug 2023 09:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: nuvoton: Add DT compatible
To: Mia Lin <mimi05633@gmail.com>
References: <20230809095112.2836-1-mimi05633@gmail.com>
 <20230809095112.2836-2-mimi05633@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230809095112.2836-2-mimi05633@gmail.com>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, benjaminfair@google.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, conor+dt@kernel.org, tali.perry1@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, mylin1@nuvoton.com, krzysztof.kozlowski+dt@linaro.org, KFLIN@nuvoton.com, linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Mia,


Thank you for your patch. It’d be great if you mentioned nct3015y in the 
commit message summary/title. Maybe:

dt-bindings: rtc: Add compatible nct3015y to nuvoton,nct3018y

Am 09.08.23 um 11:51 schrieb Mia Lin:
> Add DT compatible "nuvoton,nct3015y" to select

What do you mean by “to select”?

Also, maybe add how you tested this.

> Signed-off-by: Mia Lin <mimi05633@gmail.com>
> ---
>   Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> index 4f9b5604acd9..67fc60fd395c 100644
> --- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> @@ -15,7 +15,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: nuvoton,nct3018y
> +    enum:
> +      - nuvoton,nct3018y
> +      - nuvoton,nct3015y

Would sorting the list be useful?

>     reg:
>       maxItems: 1


Kind regards,

Paul
