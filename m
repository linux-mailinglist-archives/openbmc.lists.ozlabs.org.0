Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0041F4D5DFC
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 09:59:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFKcB72vRz2yxV
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 19:59:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=qiedKUuT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=qiedKUuT; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFKbk6DhTz2xTq
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 19:58:41 +1100 (AEDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4ABA83F338
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646989113;
 bh=4oWCA4NLKvjSmIF/iS2q4v0RGuN/XnWESBLEc5FowtU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=qiedKUuTHl3gPJIqzcQEEPmz6uJsMPhD0b3peWMCyBbl7oCgJbzAarfwBoB866/s7
 OHY2GNjOJNTTnzQZ/+eBsZbfdxvxl65KX3UXe4On3nlhjYcBJQnFgpJnPzg4kIiP/0
 hqGLPTh6nfieJMdwh6hB6Un7te1+QrXNVXhO5CFTefFL/dexcBYVaB4Kr8eN3LhWMx
 Cbs5asPAMZBNuKQ7QV8AdnvFGPHt1ypi/0H2cpXFk2dxKo98wnM/yKU/BxCwmRMsps
 ccRivZGoTbOXeBUWECK6df07CgoATyWhgaHc2WsyvXIJmW0zIHkrghiWharPbk8i6I
 aSvRtY99kg5OA==
Received: by mail-ej1-f72.google.com with SMTP id
 og24-20020a1709071dd800b006dab87bec4fso4615392ejc.0
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 00:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4oWCA4NLKvjSmIF/iS2q4v0RGuN/XnWESBLEc5FowtU=;
 b=W7F+QeqNyE18tBxWFHDk8ekS2CJuWwyrP9JeEHfHK6xmZZM7LuEeblmcGNlOwh3xyF
 ONFSRRJnNgfttaN7o1GTlkD7j6npGa7oKe7AARo8gDbA40ZCjxnJYuJKjCRQKvFXg7uH
 w/QBurlBbAHEdgT0qZCpPHvejViz2tFG7YhL8qkv4MA46QKGuDu/lURp3XBieTdQVHda
 +gH2bASG3rbwnP2/imjnkxJ69/7OQoeO2VD+Ej17g7EOfo6BT4uYWkSiv3z8mj4doxpC
 ohnzvRelgXy7VqxCoe0gmOYUG5gJ32Pgb0p0fAud4QjQ8hYcGyh4lI1ebem23j98FjXd
 1hpg==
X-Gm-Message-State: AOAM531Q6oB5fPYfX6MMRaS0gkR9PJrcE1qgSuqz6WT9CdmIpUDJk2XK
 I4nTt75gOrlkKcbpKM9lWl+d6mKVYIjS8mlFhkhYDuM3w2xYv2qiJBC0IEXa2RMVyC3D7sSndni
 k58/cbOT+1tpJOTxdribYSgzwBsm7+8PfN4q+
X-Received: by 2002:a17:906:7852:b0:5bb:1bdb:e95f with SMTP id
 p18-20020a170906785200b005bb1bdbe95fmr7861551ejm.435.1646989112770; 
 Fri, 11 Mar 2022 00:58:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO1BN5CDGpOVftYD6z0QjOIReFTewAdaLx5yU/nD7h3MjTVXoyy86j2o/DRNBRsU6XYOPTNg==
X-Received: by 2002:a17:906:7852:b0:5bb:1bdb:e95f with SMTP id
 p18-20020a170906785200b005bb1bdbe95fmr7861521ejm.435.1646989112541; 
 Fri, 11 Mar 2022 00:58:32 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 og49-20020a1709071df100b006db0dcf673esm2742538ejc.27.2022.03.11.00.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 00:58:31 -0800 (PST)
Message-ID: <a6e719f2-2ca1-4ae6-680e-46ec0dd96969@canonical.com>
Date: Fri, 11 Mar 2022 09:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] dt-bindings: edac:
 nuvoton,npcm-memory-controller.yaml
Content-Language: en-US
To: Medad CChien <medadyoung@gmail.com>, rric@kernel.org,
 james.morse@arm.com, tony.luck@intel.com, mchehab@kernel.org, bp@alien8.de,
 robh+dt@kernel.org, benjaminfair@google.com, yuenn@google.com,
 venture@google.com, KWLIU@nuvoton.com, YSCHU@nuvoton.com,
 JJLIU0@nuvoton.com, KFTING@nuvoton.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, ctcchien@nuvoton.com
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-3-ctcchien@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220311014245.4612-3-ctcchien@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/03/2022 02:42, Medad CChien wrote:
> Add device tree bindings for NPCM memory controller.

Use reasonable subject. You missed the verb describing what are you
doing here. See git history for this and other directories.

> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>  .../edac/nuvoton,npcm-memory-controller.yaml  | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> new file mode 100644
> index 000000000000..46f61b0806ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/edac/npcm-edac.yaml#

Please, test your changes. This won't work.

Best regards,
Krzysztof
