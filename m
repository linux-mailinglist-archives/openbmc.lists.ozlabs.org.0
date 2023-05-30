Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CC9715858
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 10:24:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVlnD0bhjz3f7W
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 18:24:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ougkutwe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ougkutwe;
	dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVlmf183dz3cf8
	for <openbmc@lists.ozlabs.org>; Tue, 30 May 2023 18:24:17 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96fe2a1db26so747875966b.0
        for <openbmc@lists.ozlabs.org>; Tue, 30 May 2023 01:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1685435050; x=1688027050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V8eS65llqj3o0IGqscjHz8jL4w1NP5jFHyj6GpCDyjY=;
        b=Ougkutwe9PHQM/EvRP1A+K59BEhw4lQ8fYKcdZ9/YUzhKIK7IA8C1sZ/xehASBJqV4
         VGVuWEZxVrEyiA7+8lGXC0ZG9LbF4BETpQFUUXVECa30WRHFC4+7kwYULarw7KXL7BIK
         /Sr/IVOf1B+EY377tiUuA53CkM7KYkv36LFzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685435050; x=1688027050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8eS65llqj3o0IGqscjHz8jL4w1NP5jFHyj6GpCDyjY=;
        b=CMAEU4bwZE5fX1Tcay+WPVbOrUwBAfx36VpjZvg+NTTdL8j6lAckAjPHgxg/gP3bUk
         +2njW1PMkVDlpW2hCmr8crFqau+LNgVOkWn500Y7Iq0iH0Kp64kSOsj00lzaoOBrJnzm
         S1RQJnic6uPnY6TOkXM3CbuAxaplI0ppRXHHhy/1e7PhJkupR+glmRSFd8VHU7VkQRad
         X9o/Q8R1HhvXJzVHUBnnHECfV2deE7fXjuVohkKHxuFikLGfwnjsMDGESDVlivh1coFy
         CULZ38+pE1KFXsioGeZYzgYmZtw6IXXMYMucv3l7QaMFSdCMpuP+JfjwzhtxkIb6Jlhl
         IEnA==
X-Gm-Message-State: AC+VfDxuwxDOrUIcQTmn0IvzUDKPML0CNmAdMUEEYVnumz9Ys0Rae57D
	lAGs08Ng2SjOdC0QSrtA3MiHifjQEVlRS/WuWZg=
X-Google-Smtp-Source: ACHHUZ6ojQ6J6vE6G9Mf5s0TTaDE/eqWJWinEo+uJAuFjPqnPjvaCVesqnHL9shgQTIftiVsIvXyr42twEhvfo8aniQ=
X-Received: by 2002:a17:907:868e:b0:973:a30d:b264 with SMTP id
 qa14-20020a170907868e00b00973a30db264mr1578945ejc.46.1685435050023; Tue, 30
 May 2023 01:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230530030320.548408-1-lintao1890@163.com> <CACPK8XekG1Fic2U-mvsLnT7y+==0AQMe3SPVTX-nsEnRUtZ_zQ@mail.gmail.com>
 <21d8ff22.3660.1886b4df93d.Coremail.lintao1890@163.com>
In-Reply-To: <21d8ff22.3660.1886b4df93d.Coremail.lintao1890@163.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 May 2023 08:23:58 +0000
Message-ID: <CACPK8XeRHVnVgQ_FpOsVW4H447_W-Te31C=AdbeqTK5btNH37A@mail.gmail.com>
Subject: Re: Re: [PATCH u-boot v2019.04-aspeed-openbmc v5] board: ast2600: Add
 Inspur SCM V1 board
To: lintao1890 <lintao1890@163.com>
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
Cc: LinTao <lintao.lc@inspur.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 30 May 2023 at 06:33, lintao1890 <lintao1890@163.com> wrote:
> > +int board_late_init(void)
> >> +{
> >> +       /* Turn on SCM LED1 */
> >> +       gpio_request(ASPEED_GPIO(B, 2), "");
> >> +       gpio_direction_output(ASPEED_GPIO(B, 2), GPIO_ACTIVE_LOW);
> >
> >Are you able to do this with a gpio hog in the device tree?
> >
> >If so, we would prefer that approach as it avoids adding another
> >platform to the source tree.
> >
> >Cheers,
> >
> >Joel
>
> I will be on the board_ late_init  adding other functions ,
> this turn on led1 is only the first fill.
>
> I hope my first submission is as simple as possible,
> so I added this Turn on Led.
>
> It ( "turn on led1") will be deleted in the future.
>
> so I didn't do this in the device tree .

In this case, I recommend submitting a series with the full set of
changes you have prepared. Add the device tree in the first patch, and
a second patch with your board file. Avoid adding code that you later
delete.

Cheers,

Joel
