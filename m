Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48738520DA7
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 08:14:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky77222txz3bs9
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 16:14:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky76k4LBWz3bcW
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 16:14:35 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aeae3.dynamic.kabel-deutschland.de
 [95.90.234.227])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5908D61E6478B;
 Tue, 10 May 2022 08:14:26 +0200 (CEST)
Message-ID: <8d46eeb8-7926-f842-6105-1975a5adc3fe@molgen.mpg.de>
Date: Tue, 10 May 2022 08:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 2/3] dt-bindings: edac: nuvoton: add NPCM memory
 controller
Content-Language: en-US
To: Medad CChien <medadyoung@gmail.com>
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-3-ctcchien@nuvoton.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220510031056.1657-3-ctcchien@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 benjaminfair@google.com, linux-edac@vger.kernel.org, KFTING@nuvoton.com,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, bp@alien8.de,
 james.morse@arm.com, YSCHU@nuvoton.com, mchehab@kernel.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Medad,


Thank you for your patch.

Am 10.05.22 um 05:10 schrieb Medad CChien:
> Document devicetree bindings for the Nuvoton BMC NPCM memory controller.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   .../edac/nuvoton,npcm-memory-controller.yaml  | 61 +++++++++++++++++++
>   1 file changed, 61 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> new file mode 100644
> index 000000000000..6f37211796a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/edac/nuvoton,npcm-memory-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM Memory Controller
> +
> +maintainers:
> +  - Medad CChien <ctcchien@nuvoton.com>

Just a side note, that in my experience functional like 
<linux-npcm-memory-controller@nuvoton.com> instead of personal addresses 
are useful, as you can configure on your side, who to deliver messages 
to. For example, if you are on sick leave or vacation, you just 
configure to deliver the message to a colleague of yours (or they get 
messages in the first place anyway).

Maybe you can bring that up at Nuvoton.

[…]


Kind regards,

Paul
