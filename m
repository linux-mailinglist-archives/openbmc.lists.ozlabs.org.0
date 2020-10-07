Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AA2858DA
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 08:54:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5lSN0S13zDqLl
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 17:54:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hV4vtNnf; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5lRT44nszDqF6
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 17:53:41 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id y198so1424811qka.0
 for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2020 23:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mi5a8JUWRdEOSIRItx4pFc8k92Hd1U7jNPTvKKEyEzA=;
 b=hV4vtNnfBGsBs+alXGR+syesmE3h77t7vgRtySrAIXjfjzVjr72EImIkikLydkUCVc
 2NWswIS40+CRgUtuRlyo0YuolbK0poxoqqE4NgraprBn4QMINhshEjz5z+byDl+NN59i
 i6Jc45VicXzYbM1Ca1F1J7rEXm7u61LybXvEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mi5a8JUWRdEOSIRItx4pFc8k92Hd1U7jNPTvKKEyEzA=;
 b=kKTCYwO8l+uFtYAJ4/CvARnVO1TWNfkGhFGS8q5LJZuj6aetT5Uuejtbp+DU/OKg4B
 e0rcTD+8oMKfwpBcgwd0hh0p7k/3HTD85O0zx57aA2TYcPoXE7y3w4BRTGd30oDSo/2S
 UdcfJqVr/5f0rYAulT54fB/xOZ2OxL8zvMqiFw9OupFwFXmVS7A680Pvq4ZTSq6oLAtI
 KA3hdEeEX7oi+fcmI5MOAXOi8xH4hIUHIDzUA/7AJsMhOX6FBAGyRZooOvlhvvWfArkV
 PoGRwgFxSihVJmg6A071Szw0T0MUxC6bO8dghF1kTAhuwuq5kdtiAkl7q7eqTJonXqhJ
 rF1w==
X-Gm-Message-State: AOAM531lxyw71Rp6NwpkoawUbS3zIbHOu0RpCCcsndWN+AzF+XmgmYmg
 g5AoQ3DyTm0fZ/zT9QeuZEgSb3TMJUJ1dRJIV/Ogkbs1o4U=
X-Google-Smtp-Source: ABdhPJxcF4c37FW+o6AbUPz6Cgk0wtOlTVSSndLQOneK7me/YDYLjB/moFvVq90W+Q2Wdb+ZfFBrE0uE8x7/RmwfJSw=
X-Received: by 2002:a37:48cc:: with SMTP id v195mr1498521qka.66.1602053619256; 
 Tue, 06 Oct 2020 23:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200929063955.1206-1-wangzhiqiang.bj@bytedance.com>
 <20200929063955.1206-2-wangzhiqiang.bj@bytedance.com>
 <CACPK8XdVSRQU92+hqYyVRe2QTgnKSFgn2QVf7P4VX4jyKvyYFw@mail.gmail.com>
In-Reply-To: <CACPK8XdVSRQU92+hqYyVRe2QTgnKSFgn2QVf7P4VX4jyKvyYFw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 06:53:27 +0000
Message-ID: <CACPK8XeFfBQKnWnn-4Jmr9VMV0CxpERNsfPeHOVT610457pnvg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v3 2/2] ARM: dts: aspeed: Add Bytedance
 g220a BMC machine
To: John Wang <wangzhiqiang.bj@bytedance.com>
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
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>, xuxiaohan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 7 Oct 2020 at 06:38, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 29 Sep 2020 at 06:40, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
> >
> > From: Lotus Xu <xuxiaohan@bytedance.com>
> >
> > The g220a is a server platform with an ASPEED AST2500 BMC.
> >
> > Signed-off-by: Lotus Xu <xuxiaohan@bytedance.com>
> > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> Thanks, I've applied this to dev-5.8.
>


> +&kcs3 {
> +       kcs_addr = <0xCA2>;
> +       status = "okay";
> +};
> +
> +&kcs4 {
> +       kcs_addr = <0xCA4>;
> +       status = "okay";
> +};

I booted your system in qemu and noticed the kcs driver failed to load:

[    2.717595] ast-kcs-bmc: probe of 1e78902c.kcs failed with error -22
[    2.719104] ast-kcs-bmc: probe of 1e789114.kcs failed with error -22

You need to adjust your system to the v2 bindings, in the same way
this patch did:

https://patchwork.ozlabs.org/project/openbmc/patch/20200930075153.2115-1-aladyshev22@gmail.com/

As I have already merged your patch, I did this for you.

# ls /dev/ipmi-kcs*
/dev/ipmi-kcs3  /dev/ipmi-kcs4

Cheers,

Joel
