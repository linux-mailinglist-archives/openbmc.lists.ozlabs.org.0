Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E6C318D4D
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 15:27:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbzV53pqmzDwn7
	for <lists+openbmc@lfdr.de>; Fri, 12 Feb 2021 01:27:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=d3jJVZq9; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbzCJ27SMzDsgG
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 01:14:17 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id f20so5771744ioo.10
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bn5Yp0EPYLh6tXt5v+lnL3/g897TF4pH8qlNdgra3X0=;
 b=d3jJVZq9j72sLUe1B+rDULi+89kdxn+ZA+OxINDBNftedJ7j4GeA5oONPzKSfknjTQ
 fCqpZg5RLZO2UZxZxpkJOQizOY4s2OMyUVvQbBy+Sp/PyGmxGq7kbQwp/O6VaT5Se5j3
 T5oGN7E+d1zMZxgF04fwE7JYql8FI7PTp46Yy0gXSClC9GgQCdMbo3o6IhgiTV6UGhxm
 I9cv9YENVELFnv4NnkJ1g6C97b18QlBSBVMigAa94jMZYXU0aC7YKkIW5eyXduhMoVn9
 BpS8mfrVauxH6XHfQ5QtccKvPGbR0xv/mCKNbi/Wq2oUlHfFdoviunpFv9PvWu4NG6S8
 EUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bn5Yp0EPYLh6tXt5v+lnL3/g897TF4pH8qlNdgra3X0=;
 b=VBSg7MzRlMs3Mq+Ke/wldAo6PIs26Yuaw1p6U1mDA/CG1H5QRDBFZH9W4NtpJvkL44
 awkZAv62iXZknUMLVqWvyM1596W5JA/DGLMKTjYaoSU0Q6CYnTwzR9GAHqwS5hTfbBQp
 RsBWTl1kgqfiGxRCDA//u84xBJP6MqqFV9khp490Eq9kLiaNhRXlXPA0Nbjv6bxx0urT
 FIm5y2tMw01tKcE7Z7p4kXiWArGAvsVaYR1jCrIENVgPHjFwv8hgalQT/wwB58wjx3nT
 vWwblzfl0nNnIDmn72AyMEZa6fAAjsHumm0Qs6Ie/BduAm8YBq2qOcu7c16NJyzCRggV
 UOLg==
X-Gm-Message-State: AOAM533Bfx0X32ZL5hwNW1ZIIRgkc++Pzk+ifIyBeTiBAeM+vVcDypl3
 o9mPuIqpjFfkM+hrqEuj8UAG7LgxD+V5XedJ/KC57A==
X-Google-Smtp-Source: ABdhPJwn4In52VV6NER+AWichqq/HMsAcXlJym/MeYNCDmnpYzMQlr+xnnKD6zF3QmkY1FDyijEWkEiYbfWu9KJghBw=
X-Received: by 2002:a02:1649:: with SMTP id a70mr8665011jaa.97.1613052852636; 
 Thu, 11 Feb 2021 06:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20210211083454.37117-1-gmouse@google.com>
 <20210211083454.37117-2-gmouse@google.com>
 <CACPK8XdjeidAdPYXV1-WXrbxcPyy4PBE0S-u-3FoH3UcEj0d6g@mail.gmail.com>
 <CADVsX88AWU79pKquryvUCaT9Z4czj_16bXZv9fX+4q924XmRrw@mail.gmail.com>
In-Reply-To: <CADVsX88AWU79pKquryvUCaT9Z4czj_16bXZv9fX+4q924XmRrw@mail.gmail.com>
From: Anton Kachalov <gmouse@google.com>
Date: Thu, 11 Feb 2021 15:14:00 +0100
Message-ID: <CADVsX88BWmJQ=dJ6LchzL6cus9dCh3N5coTy_LahMOyLRTvQPw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Add Fii Kudo system
To: Joel Stanley <joel@jms.id.au>
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
Cc: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Lancelot Kao <lancelot.kao@fii-usa.com>,
 Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

So, actual patch in the previous email with subject "ARM: dts:
nuvoton: Fix flash layout".

Idk why git send-email decided to send two separate emails.

On Thu, 11 Feb 2021 at 13:12, Anton Kachalov <gmouse@google.com> wrote:
>
> Oh, I did tried to send a specific patch. git send-email shown a correct body message (without actual patch hunks) before sending, but then it sends wrong data (e.g.last commit instead of provided patch file).
>
> I had to subscribe to ML with primary email. Internal issues were caused by using an email alias that I use to sign-offs the commits.
>
>
> On Thu, Feb 11, 2021, 10:24 Joel Stanley <joel@jms.id.au> wrote:
>>
>> Hello Anton,
>>
>> On Thu, 11 Feb 2021 at 08:35, <gmouse@google.com> wrote:
>> >
>> > From: Lancelot Kao <lancelot.kao@fii-usa.com>
>> >
>> > Add device tree for the Kudo BMC. Kudo is an Ampere (Altra)
>> > server platform manufactured by Fii and is based on a Nuvoton
>> > NPCM730 SoC.
>>
>> I see you got git send email working :)
>>
>> Where did you want this patch applied? We already have it in the
>> openbmc tree (both 5.8 and 5.10).
>>
>> If you would like to see it merged upstream, a few notes:
>>
>>  - remove the OpenBMC-Staging-Count tag. That's for us to use in
>> openbmc land, but will confuse mainline devs
>>  - When sending someone else's patch, be sure to add your own signed
>> off by. This applies for the openbmc kernel tree as well as mainline.
>>  - Use scripts/get_maintainer.pl in the kernel tree to work out where
>> to send the patch. In this case, it should go to linux-arm-kernel. You
>> can cc me as I've been helping out with Nuvoton pull requests.
>>
>> Cheers,
>>
>> Joel
>>
>>
>> >
>> > OpenBMC-Staging-Count: 1
>> > Signed-off-by: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
>> > Signed-off-by: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>
>> > Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
>> > Reviewed-by: Vivekanand Veeracholan <vveerach@google.com>
>> > Reviewed-by: Benjamin Fair <benjaminfair@google.com>
>> > Reviewed-by: Joel Stanley <joel@jms.id.au>
>> > Link: https://lore.kernel.org/r/20201116232127.7066-1-lancelot.kao@fii-usa.com
>> > Signed-off-by: Joel Stanley <joel@jms.id.au>
