Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E29327ED
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 16:00:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lQoxGcv+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNghB50JDz3fQt
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 00:00:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lQoxGcv+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNggb2vYXz2yvk
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2024 00:00:11 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e057c4885b3so5105649276.3
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 07:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721138408; x=1721743208; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lIYYgZjJeFCs7Y+LIRhfG3lDfhBgez0kIXqO6mnHrXc=;
        b=lQoxGcv+8I3gtEOnanqXEOri8WXl2TA7DzINl82gQS1WS5VIWf9g7PZ1vCvBcrbUpd
         DCxvMKnrx7PvqGwF1hX0C6FDqpZ39plkRg278hxDCqKdi4NCv6ew3ByOB7VzHTRqFMYk
         PwEs80++ccxHFmKanoCY8pBqjWSnvSb7qiSQ0zH7qfAEeUbVbq4lYkpEoz72+KN1BAzi
         8feKNxgdPbgVU+EYhdDMsDJ6NcmXZ6XtAEX09v0Gb5O5sAvrodYq2aluVGkH4YESDpxg
         Ccu3xMalA75bGsH6FMchhgnMNpwMdkKguanDD45YU1DQu/KhlMJ+gRG/Y9LeyddUByHN
         SSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721138408; x=1721743208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIYYgZjJeFCs7Y+LIRhfG3lDfhBgez0kIXqO6mnHrXc=;
        b=Ihvg7fBtkwQ/1x7AXkFcCWueV1dzN5bs2oBFDad4yFCqlzfEP271OT94S1Fd4Az/0N
         MKYNrx9kMeHjC1HF2N6FfEjkbKBA/cwYfmbDfyBn1MmRIxzbJ+m4wP8SKXK3DH5Di3qr
         xdt2oFo8wdAoNjX98jALer7zJgC710si6q4PpoPwqXerwabdRMaDQIYilrynJyAnQe9v
         GbNkwgY1neJbKXFZKVG9YL5o2/Z2bhK6SPiUy4dv5dV+rN6SFMYYICqA2GHHzgEiJ3MA
         8rzDjrmrWsTetNE7awoGzxSComB9NSvTPbSOhFyfZknWL+cESfoiZinbeE1X1IRCH3ZM
         xmSw==
X-Gm-Message-State: AOJu0YywHc9eVr43RFVDDphbiOAanFBHdRnWxbsfPtyFxPjCn1DPaHTk
	8gd+8TwqybFE1x7R3+VGx1DA0/NmGtMHhTYho4BTr7AsTwbvA7LXron2Ok2tIZrol9MNDJnhhiP
	ltJKryZh/RHg9ikFGxjuTo77OdwI=
X-Google-Smtp-Source: AGHT+IH35io/81q8A55lN1G76nyj7nYc1M3DElSTPHStWr4WtabPixTNk/yOmuCAkVEjwBKmTV6HjvVYOAcodS6GTG0=
X-Received: by 2002:a05:6902:188c:b0:e03:a4ca:bfb2 with SMTP id
 3f1490d57ef6-e05d5686c5dmr2905579276.12.1721138408429; Tue, 16 Jul 2024
 07:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240709145039.1910298-1-tmaimon77@gmail.com> <842718e13e0484b228705bbb9a7e2c82d33a28ad.camel@codeconstruct.com.au>
In-Reply-To: <842718e13e0484b228705bbb9a7e2c82d33a28ad.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 16:59:56 +0300
Message-ID: <CAP6Zq1jvXMyb7d3J_VDBWkWxFe-H_Qj41+c+OOSsDsp+M1W3wA@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1] net: stmmac: Add NCSI support for STMMAC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Marvin Lin <milkfafa@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,


On Tue, 16 Jul 2024 at 06:25, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2024-07-09 at 17:50 +0300, Tomer Maimon wrote:
> > Add NCSI support for STMMAC.
> >
> > Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 196 ++++++++++++------
> >  .../ethernet/stmicro/stmmac/stmmac_platform.c |  27 ++-
> >  include/linux/stmmac.h                        |   1 +
> >  4 files changed, 158 insertions(+), 68 deletions(-)
>
> What's the state of this patch with respect to upstream? Is this
> something specific to the openbmc/linux dev-6.6 tree, or is there an
> upstream equivalent? If the latter, can you please link to the relevant
> patch?
This patch set hasn't been upstream yet to OpenBMC vanilla and  Its
not specific to openbmc/linux dev-6.6 tree.
We plan to upstream it to Linux version 6.11 (I believe it the next
few weeks), since we need to upgrade the NPCM from dev-6.1 to dev-6.6,
we would appreciate if you could add it now to dev-6.6
>
> Andrew

Thanks,

Tomer
