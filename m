Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 651AD4BD50A
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:19:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29Zw5xRXz2x9Q
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:19:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=KSmxYmvy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=KSmxYmvy; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1gCX0XZWz30DX
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 20:30:46 +1100 (AEDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 11F073F1F6
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645349436;
 bh=ZhlW2P314Xp7IVd+FJpw1KLggsQP1D5CsVCti6D2Xfc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=KSmxYmvycHA/GnrjTK7MTM9G8+4oBOHjP+ipCHTOItmFs+zB6TL/+RmZ7sXCz1tnM
 xIFLF6VZNwPU2sjNSBzKuIsuMPIK81srfTcaRyjp3/2lcv7qxZAqUrLVVRtMVmP7Rq
 eHN2WtkwNYBWZhGlM8lXFaQMOKq7lGh5v8lw4ZCuQhzuzo16j6eyalGU08dabCwwrX
 Wg5pbsRiGEonI3LpkATe7Wi+PVBlVekvLVA5EkL+aOnaMXgs5Q9xrC0FuW9E0/7VKR
 PTaUaYcsbYztvcomFc7l18Z1+8QobrQb1ytbgAdTwWjTzJYtfxRgUtDYbUSMZRZIX6
 c8LhWq9p9FY0w==
Received: by mail-wr1-f69.google.com with SMTP id
 g15-20020adfbc8f000000b001e9506e27ddso2628697wrh.22
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 01:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZhlW2P314Xp7IVd+FJpw1KLggsQP1D5CsVCti6D2Xfc=;
 b=diEe2ux4Coj9iNP2SJ/UuX90uihDhj8eRCwSNdADtmoASzS0F1uRUM3zKVHOYhjCbu
 GCRvguD1rDSHiEZmojBqfwY0eqYLy7IJa9MX5qkpGLxZZZGrxEPQr9nK0/h4Ub2m63GW
 RVqM2b2ZMOrRVP1yhx3Wo+ALqQ0m6EFybUlAF15LFjiEKngS276N9/l1HhIBbgbT8DcN
 yikEjYL0o65+dA4LKoXT6Mz/tVfrK6e5lBoifA78iIJc4N2rK/moQ9opAsshDFLKhNL3
 GA5FN3JSD4fNm3vhkVOqgq4/5rx79JMRQ42bT2iFuTdUTka/z66u2CsOiVT9oGdAM3hY
 xUcg==
X-Gm-Message-State: AOAM5322Zx9dPv0FHUrPZihYnafd2nQ0gIQRYpkrMjBrTgtwsVwL3nDG
 fnYIyIpkKF5ubo0CkNTSuqs4cifal7TdUBhKQMkccCQncBm1wNWYiPxCtlYtNyQuzNUCVNpsQ+w
 S3ssrNnNWvUtZnMl14+vRqAu/ZDYmyOAtbe78
X-Received: by 2002:a5d:568a:0:b0:1e4:7cc8:fa6d with SMTP id
 f10-20020a5d568a000000b001e47cc8fa6dmr11679907wrv.48.1645349433179; 
 Sun, 20 Feb 2022 01:30:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDPzoJ3r3Cf/g14eN02kggEVtqJQJJBBiuuP/xysWCL9EyAUqqQm+LFlX4Qx6fEQSqO5pRiw==
X-Received: by 2002:a5d:568a:0:b0:1e4:7cc8:fa6d with SMTP id
 f10-20020a5d568a000000b001e47cc8fa6dmr11679891wrv.48.1645349432988; 
 Sun, 20 Feb 2022 01:30:32 -0800 (PST)
Received: from [192.168.0.117] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id x7sm39145432wro.21.2022.02.20.01.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 01:30:32 -0800 (PST)
Message-ID: <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
Date: Sun, 20 Feb 2022 10:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
Content-Language: en-US
To: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
References: <20220220035321.3870-1-warp5tw@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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

On 20/02/2022 04:53, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This patchset includes the following fixes:
> 
> - Add dt-bindings description for NPCM845.
> - Bug fix for timeout calculation.
> - Better handling of spurious interrupts.
> - Fix for event type in slave mode.
> - Removal of own slave addresses [2:10].
> - Support for next gen BMC (NPCM845).
> 
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
> 
> Addressed comments from:
>  - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/670
>  - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/760

How did you address the ABI change comment? I still see you break the
ABI with the introduction of a new, required property.


Best regards,
Krzysztof
