Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12C4ACF4B
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 03:58:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt74Z72Ylz3Wtt
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 13:58:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=eSTSgcNb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=eSTSgcNb; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JskH71qlfz2xrt
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 22:21:22 +1100 (AEDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 990FC3F1F0
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 11:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644232876;
 bh=8Y9yNV8EX7NTdignHPRQY252HgYt0mlpY9TRr3lWof4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=eSTSgcNb5oVwfcw0ULwPZgHsDxRfMEBuxriKUgbStBXQdjXd11jYqzwadGxDxOykc
 EBWcInM7eeHx4uo934mDavnItYbh1/cl6g4RHkw3DIh9ShzEnFV0mXd5Cni+4d0EmK
 N7gzpz8Iw93dtVHqyQFXATMdhA3XxcSFpZjhYgjv2U2trv+43ejV2/YqONbiPnbekt
 ARkcT2LaYj9VhlJu30bmHzD9Gp5Ms7ZGMrNaL2nKRSc4DHV+gS8mi36Ab0IqXPceus
 vkW+HEomIL1lFyNlc4cOrrywyS1Ob4jRyBtgulQzIsMImsgnHO5eFp5+X3Z6godOzi
 2J1YioqkXRWZQ==
Received: by mail-wm1-f69.google.com with SMTP id
 i8-20020a1c3b08000000b0037bb9f6feeeso3082751wma.5
 for <openbmc@lists.ozlabs.org>; Mon, 07 Feb 2022 03:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Y9yNV8EX7NTdignHPRQY252HgYt0mlpY9TRr3lWof4=;
 b=6Mos+8wNz4AUnjK+CkYAZwhxfpFmYIRTgoY1BW3uL+Ol8Hvfq80cpleLf9IR9MZSv6
 ze8Uz5TnK3Esyv7qNkRiYEG+1pmiHcDb/XaLwxBzdVL6Hp+Il9mERUl/aeOlw3JJPIqz
 MjsgmfgkUuc8xy2th9D1EKs0JnYfKZoKi2U069qtEWW3MMOyqJCHsJ0Fyy5rFByKpii9
 eHBZWgNVFnu1vBglzt04TiH7NRcVo2tnTniV4RjhOld06W9zsjIn+dDgXXZcdlAEPJJA
 A5NSqJ2RglR/fkbtkfgbTTCBgLAMZfkVaUNGD2oYYPWRuy6lYIXcV0gI2ktjYH1njuqu
 r5Bw==
X-Gm-Message-State: AOAM530o/EmjzT3AQX5mRIgjZsk5a6WBamXXOLPwMGGJHu1vOmdWJKDO
 cOCII44V4jj2E2G23zBwKHTu1KdQi22sH7CC4CWMwqaaYjjQEiNl3+ES15y5mcWFGcAGyComf4g
 msO/79sYHa6LhGoQnUDWBeYTQ0iLEsbXVhSGf
X-Received: by 2002:a5d:6603:: with SMTP id n3mr9256737wru.20.1644232866112;
 Mon, 07 Feb 2022 03:21:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz28bw0iWdum97UqccNObiTCl0E42zll9NAhEqs1JdVzu878pa6CnjxT2SeV0Ew8TU0VtcspA==
X-Received: by 2002:a5d:6603:: with SMTP id n3mr9256693wru.20.1644232865857;
 Mon, 07 Feb 2022 03:21:05 -0800 (PST)
Received: from [192.168.0.87] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id b4sm2321525wrw.100.2022.02.07.03.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 03:21:05 -0800 (PST)
Message-ID: <776e1b61-678d-6686-06fe-a74b7ff68b85@canonical.com>
Date: Mon, 7 Feb 2022 12:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/6] i2c: npcm: Fix timeout calculation
Content-Language: en-US
To: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 JJLIU0@nuvoton.com, kfting@nuvoton.com
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-3-warp5tw@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220207063338.6570-3-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 08 Feb 2022 13:58:20 +1100
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

On 07/02/2022 07:33, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> Use adap.timeout for timeout calculation instead of hard-coded
> value of 35ms.
> Use syscon to access gcr, instead of "compatible".

One commit = one fix/feature/logical change, so requirement of syscon
should be a separate commit.


Best regards,
Krzysztof
