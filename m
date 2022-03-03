Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B9E4CBB91
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 11:39:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8SCM5TlRz3c2N
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 21:39:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=WSVknr8T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=WSVknr8T; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8SBl4z2Vz3c2F
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 21:38:39 +1100 (AEDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E41C93F5FE
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646303914;
 bh=oUgxYlRh1Rc86CInB1MrO8TopcdQbjgGLLfiUWjhGQU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=WSVknr8T5SuZQdjE024UDzLzyYoFbgyGizW5sFUoOT+KI505pKc1s6PxlxD4HElVF
 a/rPYDaTdyZ6KPoMJbtaRRpQIDCW3EYlcgIXR96S+twwcTOYXiWfN6JWK3faFeE0tL
 4/k/BvTEO1EkrTbjhcPJ3/UHiAUKqdfkbN62hdB/NBIxgapblVTT1VLYEabfPxryar
 cjDQQYbChTLIS9akNn98+QbxifLwkXgCb39LH6dZmB43ssDr/pTHFYtmYBrflsjSo0
 gtPfQo1IELQzLJIVsiiwJ2hfJpoNwltlzSozMIq9OLt6OVxSlYg+v/4dtM6IhzP9uR
 rn25i1gVbcjFQ==
Received: by mail-ed1-f72.google.com with SMTP id
 y26-20020a50ce1a000000b00415e9b35c81so384176edi.9
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 02:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oUgxYlRh1Rc86CInB1MrO8TopcdQbjgGLLfiUWjhGQU=;
 b=13bZgW+WZDkf7Uj1dPXMwJwJIKUrh4hUmL/sAvv+1y0DlbsNLeUfcmJu6pbcN3IojE
 UbuznSQkVXMZOUw1jhF2p8RKH7zfqFKCYeCkQL1Tr5VbxMFK3/1j7t8sLF3WsisYxZ5W
 bVRLR4axesYf162WQA/NhW3ChrkpPMjck5DOoBweWMdSrBZ5PrPNRR1pxHH/4iX0vJ0s
 ePzC4w7QP7UrZaWf54FPXHk11yzALoX1ybNFMxNyjWTs+jAKtgRZO9JjQvnSWQ6uMmnL
 syRBpNCdFQwrE3ozAYtpR/fnDryPLXAnTVvrRbTKK9SPVdXjJbPcBS/uOVJj2jTintUv
 2Xpg==
X-Gm-Message-State: AOAM530Fvj2ZyEpxun+aeyKiOC2uZDPXJ5KXI8pMSgSxTR+co4wAZUwT
 QTKoIOB0jxkjwEZAJHLse68xeICFqFwy1gJpOW4tweY1GGKdmwYVxKQqRy0DB+jHUlhu/LNcm+X
 UTSm98ItpJgi7Hxsui093D7hV1GWxRbthzAoW
X-Received: by 2002:a17:907:96ac:b0:6d3:4554:598b with SMTP id
 hd44-20020a17090796ac00b006d34554598bmr26295415ejc.424.1646303911146; 
 Thu, 03 Mar 2022 02:38:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye4d98ukofTvzQtJabYxzo+G/VGXZ0sIYUyS+Fa9bVBgV0PS+X9Wcsjj3cNKZfPz17muBx8A==
X-Received: by 2002:a17:907:96ac:b0:6d3:4554:598b with SMTP id
 hd44-20020a17090796ac00b006d34554598bmr26295394ejc.424.1646303910960; 
 Thu, 03 Mar 2022 02:38:30 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 co19-20020a0564020c1300b00412879e4645sm671037edb.55.2022.03.03.02.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 02:38:30 -0800 (PST)
Message-ID: <d4f6fc91-ad07-7d4b-9c87-ec556ef26ff7@canonical.com>
Date: Thu, 3 Mar 2022 11:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 04/11] i2c: npcm: Change the way of getting GCR regmap
Content-Language: en-US
To: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 JJLIU0@nuvoton.com, kfting@nuvoton.com
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-5-warp5tw@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220303083141.8742-5-warp5tw@gmail.com>
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
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 03/03/2022 09:31, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> Change the way of getting NPCM system manager reigster (GCR)
> and still maintain the old mechanism as a fallback if getting
> nuvoton,sys-mgr fails while working with the legacy devicetree
> file.
> 
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
