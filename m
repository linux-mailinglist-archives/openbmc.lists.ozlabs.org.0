Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A2F7803D7
	for <lists+openbmc@lfdr.de>; Fri, 18 Aug 2023 04:34:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=GoQGvm/Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRmCs2vqcz3cNK
	for <lists+openbmc@lfdr.de>; Fri, 18 Aug 2023 12:34:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=GoQGvm/Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRmCH6vlWz2xq8
	for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2023 12:33:47 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so6887961fa.3
        for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2023 19:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1692326020; x=1692930820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RAslWuc0k7Z23E8SuQVIxC5qM+Axp0w9PmWJ3G0ynaA=;
        b=GoQGvm/Qm64pHrqNswul3eyfBJTaV0VWHuDS38t6JVZLDBS8botS1EKRnrK9WDBqhr
         MucCzAoWvdfLRw/fu/+yVJ2yasbV+lA1EL0vWIV/NxwhJ0raHQWfQE4qZ4z9kEJl+ghp
         h3XAys7z8x+ECLu7L6Run0XkDS6rgDAcdhSIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692326020; x=1692930820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAslWuc0k7Z23E8SuQVIxC5qM+Axp0w9PmWJ3G0ynaA=;
        b=dfy4Y/w1EhqENGmIQDEyog46byZVmgjcaNpBYG+a5IFwI84t2Nt62ui+xn8JzraysJ
         E5U/bFrs/fNYuYlxjuqMPEnccd9RN1W3UeVRRa6rnnVxGrl8IG8Wo8bSz1oyq1qPGu4O
         t6AYQ1qScgJGjOFg6hVd0GWj1Zp7eLzfWS0alJLH8PrC4vO7pPJONpJpmUBPEnlxiu6t
         Z1gAV7lLgSDmDjnVNs2yHksYb9/n5gUfXb/1oGNGNLdHN3azwi6mr1m+WmE4Vqh7WzLX
         t9WNXpjtstYWSomzWEB4vb9q7WOF4eeRtlTHZIEStT3cLoDbi/Ii4qIha/SpyeLVttkc
         bSSw==
X-Gm-Message-State: AOJu0YwqIkVk8moI/X7PCV1+RjVkrnz4/a+tkxrrO8t4omsI4RLmif06
	PUbteSJ8Vt4VijY2ASXFQyhG3R4h40l+9gVyy8E=
X-Google-Smtp-Source: AGHT+IHjrBb3/RDGBAnF9vg/n8u/l0/+QqJxUj0ZmgJELe5dn3IbJ4kUEbv6V2lpB4Tp4zfc7upVmJVujq8WNCIVZaY=
X-Received: by 2002:a2e:7c10:0:b0:2bb:99fa:175f with SMTP id
 x16-20020a2e7c10000000b002bb99fa175fmr743433ljc.24.1692326019996; Thu, 17 Aug
 2023 19:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230816060547.40489-1-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20230816060547.40489-1-Delphine_CC_Chiu@wiwynn.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Aug 2023 02:33:28 +0000
Message-ID: <CACPK8Xda82Bb1xiF0OSLvWXr8hjiMimiWBbm8R2j=vkZ+oGdhA@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.1 v1 0/2] ARM: dts: Meta Yosemite 4 platform
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 16 Aug 2023 at 06:06, Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
>
> Add linux device tree entry related to
> Yosemite 4 specific devices connected to BMC SoC.
>
> Delphine CC Chiu (2):
>   dt-bindings: arm: aspeed: add Meta Yosemite 4 board
>   ARM: dts: aspeed: yosemite4: add Meta Yosemite 4 BMC

Thanks, I've merged this.

In the future be sure to use --suppress-cc=all when sending the mail,
to avoid grumpy responses from non-openbmc community members.

>
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-facebook-yosemite4.dts     | 624 ++++++++++++++++++
>  3 files changed, 626 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemite4.dts
>
> --
> 2.25.1
>
