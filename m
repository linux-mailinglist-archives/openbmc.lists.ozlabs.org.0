Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFD54BD50B
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:20:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29bf1MqWz3bN9
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:19:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=t/IDl4ux;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=t/IDl4ux; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1gFW6fg3z2yHL
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 20:32:31 +1100 (AEDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EE84A402FE
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645349548;
 bh=LKjm5LjPQkt9S6ejT9o1cKax4Elbs5PxSQyHCZobrC4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=t/IDl4ux/CLFTFp9z0v3Mj4sMJ+qwqj4KL/i64A6jTQuFGTlCKg4aVe2qMwRib4FT
 PyfYTQeJ68q8+y+8Vr6q+yFnlBK8vHp7DI65rWhPdWVixHt6X/wH7n/UN7kvfRlG5t
 Tp7/YhwXAEjMt5bDKxcBEvAxLbckx2hllA8J+t6HeIILkaMjjlogaz4ywOZOADZuFA
 1UBML1KnAKSHaD3qjBsuZMuchcFzTMeI8hjD95GJWEc0ydrOdd4fFVVxpmpPyBwRBX
 8zHg8CGA1RTCF0mHHJS5CXdWXE/oRAiSSAw9Ioua/736ym5XV2Uq7ESTeeaZSQ91wv
 3W+S86/vp5tcA==
Received: by mail-wr1-f69.google.com with SMTP id
 s5-20020adfbc05000000b001e7af4f2231so5694606wrg.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 01:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LKjm5LjPQkt9S6ejT9o1cKax4Elbs5PxSQyHCZobrC4=;
 b=PLDJSWIzQCj8tUTskCsfaWmxqVpSpZm3MkhDXTFeJRXKdeSNH6B3JMElVbyntsiXo1
 uXwsPR+PslKbsgoGyywvvahMjQ+2VCduysbpAI1V/O76+wfj1/XmrIJlBv4ugpICoW/n
 zbQT9k9BvhDSq/B9QpbBHJ9hLvh5h3BeZK5WI0KioMM4NEqqcGL/G0SjktRzWJIF8201
 SM6T144P72XLBBun0GG65+vl3iT0eltjUwv0pyhV3trDlY9Yy3s0yM6LVewN7GmiQfUN
 UGRWTkZR1k8QiLQX667K3FpHNAl9UBn7L1T7SWQTJVLkjLMF1IKq5lFqEwzia+x1GN6h
 wjqA==
X-Gm-Message-State: AOAM533Fh3zMXWv2WOujjSH1qB/SAsa1IUi1dcaGA9SXQyelPUjMnuEP
 rxHXW5Y1qwqEtCp3W8VQ2jFT6Ntydt66XYNZ5Wg7GwrN0Uba19fjbm9FJTMz7v85Cyoexb0KNOy
 odaVXTurNeCg5LbIrgVWUbqRTG/Ndv2pa5AzF
X-Received: by 2002:a05:600c:230d:b0:37d:5882:ec9b with SMTP id
 13-20020a05600c230d00b0037d5882ec9bmr17101283wmo.162.1645349544139; 
 Sun, 20 Feb 2022 01:32:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5VMR9zGe0H8y1LkWbw0H010mPlQxgB9BfhaHQlQDN2Ch3MW7W25dEBO2fUvk53yZ3IM4IIw==
X-Received: by 2002:a05:600c:230d:b0:37d:5882:ec9b with SMTP id
 13-20020a05600c230d00b0037d5882ec9bmr17101254wmo.162.1645349543973; 
 Sun, 20 Feb 2022 01:32:23 -0800 (PST)
Received: from [192.168.0.117] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id i3sm50975818wrq.72.2022.02.20.01.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 01:32:23 -0800 (PST)
Message-ID: <ae927203-794b-06c6-3bcc-d67f13ab841d@canonical.com>
Date: Sun, 20 Feb 2022 10:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/11] i2c: npcm: Update gcr property name
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
 <20220220035321.3870-5-warp5tw@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220220035321.3870-5-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
> From: Tali Perry <tali.perry1@gmail.com>
> 
> Use a generic name for NPCM system manager reigster.

The subject is not accurate and you entirely skipped in commit msg the
fact of an ABI break.

You do not update a property name but you change the way of getting GCR
regmap.

Best regards,
Krzysztof
