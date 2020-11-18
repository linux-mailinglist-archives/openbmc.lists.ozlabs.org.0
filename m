Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3CD2B881F
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 00:07:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cbz3c4rB5zDqdP
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 10:07:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ZzfOZdYQ; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cbz2h30WQzDqYK
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 10:06:32 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id z21so5419097lfe.12
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 15:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B+MUbkEnLtpb6DhNQTi+SbU3HOgt8xe0lgnFugqJRUo=;
 b=ZzfOZdYQUA8kSTr5leoCipWghbWjbzZHMQBc6CDoyO8UGyowFRskOVaSoyV9+goK6K
 88cEGmQbLnJvjHH1M5agR7s5tCftcKqmUFZfVLuYacFI4/JdsRCL+RPQPoUC2NSgM79r
 NagaKg5LZCw8qlh6xGZ49fWdNvioyN13/GXWy/qBCG+PRcy7TE2EIxBPrJD+xW1dB+k1
 xcyk6ioGiXfGmm/Yvi42hyVv0YObxl3+J/8uB1NwWeM/QoNHr8fqn9dkt4TQBfDHySJ+
 wwJpCtlGBkhINEAUnMMNfRuZNiEGQz1AMvm45YwtD3Q7wnDHFKAYuRfTtRt0s+GSnfDU
 8jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B+MUbkEnLtpb6DhNQTi+SbU3HOgt8xe0lgnFugqJRUo=;
 b=sBq+B2E7ZHZMsdnEQZHr7mdw/rMD7TlpUKNhQyV1ARKcZaoJGv1c0SFkrHYImityD2
 ycCtjAoXfMonPhff7ttePPIiDJ86cjhBmllFIOR7YuIheSNHT7SMW0/7YEsFJGojrer/
 wannj8GL5H2adtOVJA1RU8h03WXFih/jNILtUjzCd2gW3ONTd02caPQlWR/0+omA6Ir6
 BDO8LUwhnr6GKX3HzZckrqkuXk6nffQmo45OHhvqzPsEbKJOUa4NwwlXG2OqJ40rlSXh
 8tjr8KQ8rauyK+dLgdk1GpWz3zFPDiZM2cbnlOMz1/zo2rLW8HM3VjSOix/vTYQ8y8zo
 HZcQ==
X-Gm-Message-State: AOAM532o+fMUH0ox6MKJ5gwjFWkijuVfwSDB33hg3ugUdR9rWPmoHg4E
 3Aowu/fcWoIkwFauvHxgM9RGaBHtU3g1ffgYVwtMRg==
X-Google-Smtp-Source: ABdhPJwS3xy2I0ffaQuw4Nupv6pAqk9NAE1eqC76352J/tPxx0E4i+QPCHHvGwf1UodSgiHoaH9O86+J4S7KhCB7t2o=
X-Received: by 2002:a19:54e:: with SMTP id 75mr4924242lff.396.1605740787413;
 Wed, 18 Nov 2020 15:06:27 -0800 (PST)
MIME-Version: 1.0
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
 <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
 <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
 <20201007014324.GG6152@heinlein>
 <CAJOps0tKN4ACB46hoNu1EeX4uaSZ_UeArzcZ=ehGA2sz0oT+aQ@mail.gmail.com>
 <BC4115A9-0587-4135-981E-38C086DDD3F9@fb.com>
 <CAPnigKn5cRVz3RuK-czkHVo2od1ZLpHCVgRu9q4OET-_nPwrWw@mail.gmail.com>
 <20201111121431.GI3614@heinlein>
 <CAJOps0vS6+eiZSdL=w6Trb2K_rTj3Rb2TTyp5_n2=_YrjUgH_w@mail.gmail.com>
 <CAJTGxZGOXb4bK9bvVcuKkv8ZBsaQaJor_gLTrrOW1WnQcPe0fw@mail.gmail.com>
In-Reply-To: <CAJTGxZGOXb4bK9bvVcuKkv8ZBsaQaJor_gLTrrOW1WnQcPe0fw@mail.gmail.com>
From: Sui Chen <suichen@google.com>
Date: Wed, 18 Nov 2020 15:06:16 -0800
Message-ID: <CAJOps0sQsr1EDt337GmP8+iFFOuv21OTOgqfL32DJ4omUtBEXA@mail.gmail.com>
Subject: Re: Request to create repository google-ipmi-bmc-health
To: Vijay Khemka <vijaykhemkalinux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 18, 2020 at 12:48 AM Vijay Khemka
<vijaykhemkalinux@gmail.com> wrote:
>
>
>
>>
>>
>> Hello Patrick,
>>
>> Thanks for your understanding for our request to create a new repository.
>>
>> Our team had also met last Friday for a discussion on where the
>> implementation of the blob handler should go, and we also agreed it is
>> preferable to create a new repository compared to putting its
>> implementation in phosphor-health-monitor or phosphor-ipmi-blobs.
>>
>> Now that the IPMI blob handler lives in its own separate repo, it
>> seems to me that the design does not have to be separated right now;
>> the new repo could, for now, hold the monolithic IPMI blob handler
>> where the metric implementation is entirely in the handler.
>
>
> I completely disagree with this approach of having a platform specific
> implementation, I will still prefer to have a generic design in health monitor
> for metrics collection and blob handler can be in a separate repo.
>

Thanks for the explanation, we will keep the platform-specific
implementation (blob handler doing everything) down-stream, while
working on the generic design (blob handler only translating DBus
messages to IPMI blob) upstream in the meantime.

I think we can focus on working out how the added metrics should be
made available on DBus in phosphor-health-monitor; this has to be
resolved no matter where the blob handler lives.

Sui
