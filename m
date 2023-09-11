Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEE479AB12
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 21:37:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ieuOLUOS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkxnc6PXhz3c9r
	for <lists+openbmc@lfdr.de>; Tue, 12 Sep 2023 05:37:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ieuOLUOS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkxn24MNpz30Bg
	for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2023 05:37:08 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5007abb15e9so8220247e87.0
        for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 12:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694461022; x=1695065822; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtHFkIB4HjNpruap74rc4M+x6RD0lNjgWaeMc48DnVQ=;
        b=ieuOLUOSvylPFhVyxZ6wS6kAi857/ogpq0+u5V5WnsLGKitPjOJMeOgnmdGe/wYoDi
         MgSJ3RKd4Pe80smy1Tgkuyi/H59vW8WMAPV9kj9M77/xazs631oT7y7xMT481rJXRCJA
         Sckci5Wahh//pHUqg3YinJb+YvPXy9yTvaRxSMXF8W6Y5Oz+xziBNJu7x+G5Lppy/4eS
         bLY0vrRsBEwq+qxKqEPi9OXTEK2Bb6u6UDmz7E8H2HNF9FGvGK1LxS2yqFoq0paBKiMK
         yoknZ/bFfwNHp6fL/DocpBZ8xci49zABwL/vQGQNO/I9S+l3WjqdUaTO8SclhlOhjG8N
         pJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694461022; x=1695065822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtHFkIB4HjNpruap74rc4M+x6RD0lNjgWaeMc48DnVQ=;
        b=SwD5o7z/Ax8/SqOQ4aGaqHqbGwipsDxPryXLfpov8y5UywaTFzJbKGhGP5mYz+VNnt
         icqYXiazLaJLYnDr4tg/ixN3IeNX5uyAa/Bvd78S2eafU0cfCtn0yFXde+xJHb2paUk4
         FVG2gDwjucY0l9SNf/LM7YDVd9rJKZJ6Oks8Lfbb53E0vp4i777fuAHLtBWNBQ6Ev8wi
         Jwp9o1O1ixygIpjb/6+28hWTBwlRfc+uRd87ZI18T0crjpHefhLobbAtIL0BOCE7my2S
         wZqsexJVcCJcO37O5JkE9K7S4yZqWyMijcPcxz761dYA+JOYw5mxCqBMmMcjyRM7SOEq
         YNoQ==
X-Gm-Message-State: AOJu0YyVjr1wNOLsTq+W4wRl7ZKdTgvUj6u4rLSHwmZslO5NqXHLMVbj
	KWp0nYz4m7aLIxU/Rj3/WkhWiZOfbrvCpbi91vg=
X-Google-Smtp-Source: AGHT+IEHONmFCXlIl8CtsQ1p//AgYvzN0oFymF5kb+m/A+LqIbbN2JHzQ3n/Wj2UhSy7rLEgh8So+tK68vdnGyP+3QY=
X-Received: by 2002:a2e:8297:0:b0:2bc:e330:660b with SMTP id
 y23-20020a2e8297000000b002bce330660bmr9020360ljg.9.1694461022242; Mon, 11 Sep
 2023 12:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230828140849.21724-1-tmaimon77@gmail.com> <CACRpkdY0C7S_VjZ8CKxj9MOv401jUPesvwKwHyCfHM+p8jRSOg@mail.gmail.com>
In-Reply-To: <CACRpkdY0C7S_VjZ8CKxj9MOv401jUPesvwKwHyCfHM+p8jRSOg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 11 Sep 2023 22:36:50 +0300
Message-ID: <CAP6Zq1gd7j7c3RuB+E4S65JNhOmEEZOMgn2AqXwO29f=BRKXzA@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] pinctrl: nuvoton: add pinmux and GPIO driver for NPCM8XX
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks a lot Linus
appreciate it :-)

On Mon, 11 Sept 2023 at 16:53, Linus Walleij <linus.walleij@linaro.org> wro=
te:
>
> On Mon, Aug 28, 2023 at 4:08=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com=
> wrote:
>
> > This patch set adds pinmux and GPIO controller for the Arbel NPCM8XX
> > Baseboard Management Controller (BMC).
>
> Patches applied. I can send some more nitpicky comments about
> patch 2/2 but they are not serious enough to warrant a resend of the
> patches, it is better to touch it up in-tree, if at all.
>
> Good work with this driver, and also good patience since you
> iterated 7 versions and polished everything up so it's really nice
> and shiny now!
>
> Yours,
> Linus Walleij
