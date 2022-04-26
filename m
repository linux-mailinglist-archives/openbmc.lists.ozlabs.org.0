Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7749650F392
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 10:20:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnZZv1wbWz3bdK
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 18:20:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H2gjdZBO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52b;
 helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=H2gjdZBO; dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnYHy2MWzz3096
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 17:22:53 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id b24so21156747edu.10
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MKxnmTE3uOgxAO/+uZwxLwv2U0/Qh3mDlrdirHKM0/A=;
 b=H2gjdZBOC2dpNIMF+Q8CmNuGnW1EMJQqaDtejdVkfxPiVDP71nSmUPUMuYVusy33yh
 6W8SCytU7RaPPwdJ6mhjdk56k36sVzaVBnHWb4NASLG4SRhqKOMYTQeHEuR1IB3Bz7DD
 fSZ7adxHzuDnAKeDLjHb/C+rw/TuthcIJmHq/Qw4pjeGPCWm7epnFT8YBqZ3bCfB8CDS
 BAwENOVkg04Kd3/FCn4/A3gBgkmG3tfmaJgOCJXgBnS7XaGGtjXoB2tDj6UGBDMp6qxa
 V+qaFu6ffVxQr1/Cv9Y8rc4Gd2sYDPyEnjhh/M5+p2Eu1JXposGwiT9OSAqBCeeOTlsm
 1KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MKxnmTE3uOgxAO/+uZwxLwv2U0/Qh3mDlrdirHKM0/A=;
 b=cvaqh15xUJRj52XpQSEUJmmaHdZ/flw8ozOAE3CavRTsOYL0gBndm481hVsXeZM8HC
 UfCtnfI2ojQomEl1KbJDWMBRgMwjzRQc27onz1HysL3KKB/H466Vhat2/304EApghMaq
 6XyFmfcB4+y8Vw3NGhMdRDBLVd7Ea328o6zwQoHUyZZUWiwpo2aBBwh7TfSfDG7kYPqY
 jDmU2oOq7udoI5vbkKY9JljH+KSWCHVC9toyvZPfIHqV3mCtR9XAfS7X+sWAb2+6EzuD
 IrMcZZGbzwz5aQBe8cKG1B+QSiNbX3k2/QW9kVU9oFtKVjocMjDJn8VRlNOsR0unlP5f
 nKCw==
X-Gm-Message-State: AOAM5318n92bZCTUM8KkzuOT8PNC2fMn380tcODuAeIot96WxloP5jAd
 OXCqUbfxsm0GvvjeopBHd1C/sA==
X-Google-Smtp-Source: ABdhPJzvu2Vd064kjxJq6VJYtqsPamQ6BFDr3D9T7sP1wZH04kUchD/daCDrNxQkvt9PXDOkYA3e4g==
X-Received: by 2002:a05:6402:2815:b0:420:c32e:ebe2 with SMTP id
 h21-20020a056402281500b00420c32eebe2mr22751734ede.1.1650957770522; 
 Tue, 26 Apr 2022 00:22:50 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ak18-20020a170906889200b006f39a445b93sm1706351ejc.141.2022.04.26.00.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 00:22:50 -0700 (PDT)
Message-ID: <f2fe2b0c-1f57-9bd0-d03a-990c83648a65@linaro.org>
Date: Tue, 26 Apr 2022 09:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 10/11] arch: arm: boot: dts: Introduce HPE GXP Device
 tree
Content-Language: en-US
To: nick.hawkins@hpe.com, verdun@hpe.com, joel@jms.id.au, arnd@arndb.de,
 openbmc@lists.ozlabs.org
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-11-nick.hawkins@hpe.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220421192132.109954-11-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 18:19:48 +1000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 21/04/2022 21:21, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> The HPE SoC is new to linux. This patch
> creates the basic device tree layout with minimum required
> for linux to boot. This includes timer and watchdog
> support.
> 
> The dts file is empty at this point but will be
> updated in subsequent updates as board specific features
> are enabled.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> 
> ---
> v5:
> * Fixed commit message to show previous changes
> * Fixed typo ehci -> echi

One more thought, but I am pretty sure we talked about this already:
please fix your commit subject. git log --oneline.


Best regards,
Krzysztof
