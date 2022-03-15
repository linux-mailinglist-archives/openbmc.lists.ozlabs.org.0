Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB984D98E8
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 11:37:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHqbl48Jcz2yfh
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 21:37:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=fHA5MjuB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=fHA5MjuB; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHqbG5JS8z2xss
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 21:36:57 +1100 (AEDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 216A13F618
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647340610;
 bh=TEi9FBbJRZ98ujLdP/Lz9ClVk8P7w5er1AYT1Hftf6A=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=fHA5MjuBEe6iN4VSuQ5lEYxHNnSgjtNeJtmOyEPgs4QGQhjVagVHeaZ+wvYRhxyQ0
 qTKXKes82JyJKCWUylHyEUBUwPSzCnkuU0nLSiJ28nQgoYZd459gkiEgrFUiHZ+xzb
 da5QVXxpAMlZNyQ168ocS0xccCJ0or/ByUuK1t9LM1mjPX2A8fXRqQcQSbfOYDyrkz
 x3sNhEV+j20XEq5BbEV/fqsJpo1aO907gOeEdtIBho4ycZJNyRO7T285lKcGqYfSDD
 GvdeGjleW8TWfdujZWtXzUBPMM7SUPF7SC2k9SenfYCb2fMh3uOozkBk8oBGtUct0S
 rnNN7iwqmBQqw==
Received: by mail-ed1-f72.google.com with SMTP id
 r8-20020aa7d588000000b00416438ed9a2so10348251edq.11
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 03:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TEi9FBbJRZ98ujLdP/Lz9ClVk8P7w5er1AYT1Hftf6A=;
 b=Opxnr3W8eUCe/AsQpKa984bP7rh2+h/EAGzSsBe+zTNi716VdR0tthv5Tf5pAVXGMD
 /EAcU7RYhTvuCndpurMvgvi1PXdetwJYPwy85P5ajTeWOsGXiq+r5fMLAD1NF5ob8nEN
 nIj25XzyVj9mQiSO2yfCUEMvWwR9OSRuMQ2pa5K6xXbJSHtlRQqDSAIrXVTLHUOIK9kz
 Fw+dDrAKBtl6NOC8SK0K/0/qzplvOXFjU1+Jxfxa+FCes7YYDE0qGwxwiXxaXHkEBC+v
 OdeHhTl0+EG3/I+9je4yhDjK0tFYrzV/nQt0WNRnF66Bp1T6U5imw0L8CIi2FD0JXBq3
 mN+w==
X-Gm-Message-State: AOAM531Mx7yldFPjb6XvogyJvEwS0aaqpO7VkBZN1Nx/Uk4dtOUhh+w1
 h1sdH5egLdtWJJT+vHSNdUTX/BJGvr7eN2u9Bq2eCaCd6Ua+gNp8VoZu89JM2HdWSraWV4oAjzz
 9V24moYfGwtQR4r2qpV3A5ohvS7OdhXpruCuO
X-Received: by 2002:aa7:d295:0:b0:416:438e:d9c4 with SMTP id
 w21-20020aa7d295000000b00416438ed9c4mr25157422edq.98.1647340609110; 
 Tue, 15 Mar 2022 03:36:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNAdezzJXlvUWpVXxB4T7w7pvN/7+3r1jrwVFjSzPbTqD5zxBdf5ZWDjZyxsdEDeC/bjygzg==
X-Received: by 2002:aa7:d295:0:b0:416:438e:d9c4 with SMTP id
 w21-20020aa7d295000000b00416438ed9c4mr25157391edq.98.1647340608923; 
 Tue, 15 Mar 2022 03:36:48 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.googlemail.com with ESMTPSA id
 o3-20020a17090637c300b006d8631b2935sm7869716ejc.186.2022.03.15.03.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 03:36:48 -0700 (PDT)
Message-ID: <bcda63b6-16cd-6514-42e7-fe09f5a5fb34@canonical.com>
Date: Tue, 15 Mar 2022 11:36:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/3] dt-bindings: edac: nuvoton: add NPCM memory
 controller
Content-Language: en-US
To: Medad CChien <medadyoung@gmail.com>, rric@kernel.org,
 james.morse@arm.com, tony.luck@intel.com, mchehab@kernel.org, bp@alien8.de,
 robh+dt@kernel.org, benjaminfair@google.com, yuenn@google.com,
 venture@google.com, KWLIU@nuvoton.com, YSCHU@nuvoton.com,
 JJLIU0@nuvoton.com, KFTING@nuvoton.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, ctcchien@nuvoton.com
References: <20220315055504.27671-1-ctcchien@nuvoton.com>
 <20220315055504.27671-3-ctcchien@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220315055504.27671-3-ctcchien@nuvoton.com>
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

On 15/03/2022 06:55, Medad CChien wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM memory controller.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>  .../edac/nuvoton,npcm-memory-controller.yaml  | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
