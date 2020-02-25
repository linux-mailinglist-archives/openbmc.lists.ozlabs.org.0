Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 686BB16EA28
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 16:32:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rjbh4pLRzDqW8
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 02:32:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mvcHQLxG; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RjZw5M0WzDqSw
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 02:31:36 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id r16so12435663otd.2
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 07:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZNCR5yhsKENoIZROvxOcZ8eKKKNLftR2G/m0i83Yv/8=;
 b=mvcHQLxG7/tN/qk2VPD818mm5yJ5pBRNBADK4YC0eSKlty9iNdcyCotAzs2C8cxrSM
 8cNPI8y8rfAE/l86irVV0qA87gXLooe/pwLQnY6dlJLElocMz2DSYiSP4EK0cPx6LmsO
 5S8y2gIX4af7jzfMuc/MwGSfP8eTdmc9KQ6p3XsUc8Ij+9xk/Q8mSgVGF0lpT6wlUGuT
 0ig/hM4t2gui0D09HKyZd4Fci2evUpyX7lvAeZ9RC+lgbg/fpCbz5C40Bs2pAW5eAmGP
 3PxfAFtwmW3MRPfTfGP53xAphLYGgVvRm/GGZmzyZV1ErH4ZMh4KGikireNMQ9IyQvMR
 sOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZNCR5yhsKENoIZROvxOcZ8eKKKNLftR2G/m0i83Yv/8=;
 b=tqkjBzs6EE6FErd6JqO+Jz8fXMVOVwsW/PK+Ludz61Onpsh1CCyx3JNuv5A/PUgdvO
 ynuwZOcgtjLgVpHCxa/05FQuDYMaXWqan/qUQolaVekKb+8CRu2llQknLMoX2wGbQ/rh
 1+6IVuZA913JbVaXyVaVH2Sid8GJuj0ZZ/yDjsm7Uf0S+QftQFC2EGfYvlOwmTlBjxIi
 bp9lRhWrOKYaAAfVLy79Z4GQ+5KV1+IJQ3mewHPlSdA4ONjsC+KDdzvvMSde+hU2Xfu1
 eNwv0az2+gQKk+AIiFmrzTdgZN40m/6/U5IQBu4Kz5VvEP+QAz4xnmdI4GPfjb3QKmuX
 sJOg==
X-Gm-Message-State: APjAAAX+RQ68SAZUsYrfLzzr1jkTLq0ubcU5dvug7uquXDbZqNUKQrDy
 PhdMDms0dBoLzmyGxwmeroMOIPGg
X-Google-Smtp-Source: APXvYqzQ7mdqwLdVpkbyqtXpYNfXxoklEqd1hDwi0IlLv38kruojftECQDUoDBe8Ldga0+ivH6poqA==
X-Received: by 2002:a05:6830:1db3:: with SMTP id
 z19mr45990040oti.292.1582644691034; 
 Tue, 25 Feb 2020 07:31:31 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id z21sm5727817oto.52.2020.02.25.07.31.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 07:31:29 -0800 (PST)
Subject: Re: OpenBMC Starting Point
To: Andrew Geissler <geissonator@gmail.com>
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
 <5937.1579503424@localhost>
 <CA+k9xxb0eBfXVeA4zxULKL-0NCwmO6=vPw7TBkyGt4fc6xfmOg@mail.gmail.com>
 <217C5292-AFE8-4139-A1DF-0761BF719781@gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <2c6ac542-9834-8571-ae85-4b3074e78372@gmail.com>
Date: Tue, 25 Feb 2020 09:31:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <217C5292-AFE8-4139-A1DF-0761BF719781@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/24/20 2:23 PM, Andrew Geissler wrote:
> 
> 
>> On Feb 24, 2020, at 9:40 AM, Samuel Herts <sdherts@gmail.com> wrote:
>>
>> So if I wanted a c++ script to run on the bmc whenever I desired, how exactly would I go about implementing it as a module to run? Kind of like the Phosphor state manager module that the Hello World guide starts on, specifically, what steps would I need to take or what resources should I look into for creating my own module that will run when a specific command is sent, like the systemctl start phosphor.
> 
> 
> This would probably make a good tutorial under
> https://github.com/openbmc/docs/tree/master/development
> but here’s the really fast answer from my perspective.

This is a *really good* quick-start tutorial. Care to push it as such?

Thanks Andrew!

Kurt Taylor (krtaylor)

<snip>
