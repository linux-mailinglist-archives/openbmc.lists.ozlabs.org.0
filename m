Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FACA7C986B
	for <lists+openbmc@lfdr.de>; Sun, 15 Oct 2023 11:01:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BUGN3LWY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7Z3z1vFyz3cCG
	for <lists+openbmc@lfdr.de>; Sun, 15 Oct 2023 20:01:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BUGN3LWY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7Z3K3gcqz2ydN
	for <openbmc@lists.ozlabs.org>; Sun, 15 Oct 2023 20:00:59 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bfed7c4e6dso42447491fa.1
        for <openbmc@lists.ozlabs.org>; Sun, 15 Oct 2023 02:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697360453; x=1697965253; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sUKXBDAU7yRvgkxOo63NtcyklMaDwxQR1L1y1/Du95g=;
        b=BUGN3LWYrWIxLsoZjvNlMJwsiS8jkwXY7DOn0NpMbj55gW8FVA3gjc2omGVjjQZK3y
         N8GrvXUQVugWGNuHAg5jJseF9AzngU1gLxbeRYbyQVzrv+QZKEutgz4ZPzsv1iwQ0T2Z
         ywDBZi6YwyV4bXia3JrWkF8VXIUC0roN+8dYmRoykaeTTKamcSNuyaNxDF4okLRHWLUz
         teVr3V+CYSw1CGARYwa2ICtGCCBFcohMBsNs/x5bJ6ySIhPyN1ZLw4OuzLoDDhmni4yQ
         6b3J4/7SPa0YHfW1gQ5HB+qY3/qAuflrDXL4HjzoxxOYZ5s/ut5S8qi+j2sxbapbMNY3
         Z48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697360453; x=1697965253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUKXBDAU7yRvgkxOo63NtcyklMaDwxQR1L1y1/Du95g=;
        b=EwDKrBTar5pdDvQE2y32my2Q2hvlIki0JHq1uRV/JNEk8qWSuG+k0sS0I59cmMflBP
         nGlixpN1yMLJultPnFQ+5ywQT+xsfX01bv0wbZHAqv4r6JNVNaj1C8Vpi5drSJNwXIGu
         1EpHPQ50UEgkNkkMa69drgmxGyXQpwGZkYMlLIX43iUjmB3ykxTwiBSiMVHGW7CYPK6E
         ybslq3qfg6WOQfFcC58ZPtHD5wjnuHG94cDJbguR9sVD9XhPW+rpn7dDu/vCtqYZMBAS
         yoF/W0yakv3crxDbemD+pU0PDO8zWrvTwWp6ZYzcInQG1e7iULFlrquiSw1BQOnBZWzO
         9JrQ==
X-Gm-Message-State: AOJu0YyDePV+agGTzK9ShE4xRNIfd3BJJ6iqH0sSJvOOY7uPnFlR0teK
	v7q4nNNetZSHcTFGi+5pYR4METxWgVufs37i1pQ=
X-Google-Smtp-Source: AGHT+IEeRq5SP6mqrb0AloTKLb9pI1Hmn2zRyq5heXljQOw5f+hV25tMCL00qCO52s4kDz7hA9KXi+cggZZEr6EGgvE=
X-Received: by 2002:a2e:2413:0:b0:2bf:fd6c:ddfc with SMTP id
 k19-20020a2e2413000000b002bffd6cddfcmr24524661ljk.45.1697360452663; Sun, 15
 Oct 2023 02:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231012230057.3365626-1-tmaimon77@gmail.com> <20231012230057.3365626-3-tmaimon77@gmail.com>
 <7598fcfa-7047-434d-be03-41cb2bb46ecb@kernel.org>
In-Reply-To: <7598fcfa-7047-434d-be03-41cb2bb46ecb@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 15 Oct 2023 12:00:41 +0300
Message-ID: <CAP6Zq1iOyGfYAEQ+psK9Xz-QYXc4Poo6sJhUsNH3m80HmE7v2w@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: usb: ci-hdrc-usb2: add npcm750 and
 npcm845 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: benjaminfair@google.com, avifishman70@gmail.com, gregkh@linuxfoundation.org, peter.chen@kernel.org, linux-usb@vger.kernel.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, joel@jms.id.au, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks a lot for your comments, I really appreciate it!

I will run scripts/get_maintainers.pl to the latest kernel.

After running scripts/get_maintainers.pl do I need to send the
patchset with resend on V6 or do I need to send V7 with the new
maintainers list

Thanks,

Tomer

On Fri, 13 Oct 2023 at 16:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/10/2023 01:00, Tomer Maimon wrote:
> > Add a compatible string for Nuvoton BMC NPCM750 and Nuvoton BMC NPCM845.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
>
> Please kindly resend and include all necessary To/Cc entries.
>
> Best regards,
> Krzysztof
>
