Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B2A54E0ED
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 14:41:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP1xX6Bwtz3bks
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 22:41:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=UnWXK47g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=UnWXK47g;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP1x717N6z3bZc
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 22:40:43 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id c130-20020a1c3588000000b0039c6fd897b4so2754046wma.4
        for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=WAtQJV+FZ5lUIRWeXieR9MvqciREOXa5WQ5LFwl38DM=;
        b=UnWXK47gL4EZIC6aOO9vvHtvr3IXQIZ/Oeq0e1HQ3/tMUPuQzdSFbwbpDUVEZz/quN
         HI/IY5e0NAIvJHaVBzbQKTnCLZDiyhz7A72Ys4WF9bwV6qOxzxJXr9YtWyq3cqFW/rlQ
         udqold8TiFsPQQRx8Lc9sDkfs8cvBOjkaB9oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=WAtQJV+FZ5lUIRWeXieR9MvqciREOXa5WQ5LFwl38DM=;
        b=3dA6zs+m44T1g0AlX/3JziyXQWHhUp0rs8hz+DVq30AMa0MfRioCNWspZqF1K1Oyuf
         K6ICMFzYd0iVCKl22oEkbJIOfpN150PUrAamenUSX8sKzKykC8i3ZSF8wAN9tWJjw7+I
         ZkhTfcIthY1TDsNmaLQaP0x5BCJGlFoE2risZdEeQ0QwOU1Zv4wiw0xBrwDibfQ9ulvz
         2jDZbKJAsWFsTzNgHBnJM3tAlWGKwC6bTrRQCOObhhsgAjL/4pTp4U73W1IN2e8xXbRE
         x2RFJOWpwLLy/VbUDAa0BJdL4BWQmSIlQMG2hVJcYYoDa6Hjbp71TqzK6MA/kAokVENa
         hYTg==
X-Gm-Message-State: AOAM531uhF3w27DQl7KrCyTPTagHDTe91XE+/ypHs+CblJB2q5Ih++7N
	oUUpOJhdKL7AUKGakHP9Zt4AaJeu4gSEa+2O4dRSqAfN
X-Google-Smtp-Source: ABdhPJyjk+3JJ9+yThe4vRu60y1r1nlr7PO3sJ50MYu5uTyMo8iq7Pu10fFvKlcmpQWB1sdGnufPx8qBvesCQrv7Jyc=
X-Received: by 2002:a05:600c:1990:b0:39c:81f0:a882 with SMTP id
 t16-20020a05600c199000b0039c81f0a882mr15369168wmq.72.1655383238609; Thu, 16
 Jun 2022 05:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220608074402.1876079-1-joel@jms.id.au>
In-Reply-To: <20220608074402.1876079-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jun 2022 12:40:25 +0000
Message-ID: <CACPK8Xe4GG9P7rYwSXi0r43owHyWnzUheMjQ3NQ_acgWD-+OkQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 0/3] Consolidate dts
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jun 2022 at 07:44, Joel Stanley <joel@jms.id.au> wrote:
>
> This reduces the maintenance required for the device trees by having the
> variants of the AST2600 EVB only contain the things that differ.
>
> Aspeed, can you comment on the A1 device tree? I wasn't sure if the eMMC
> timings need to be different. If not, we can get rid of that device tree
> entirely.
>
> Joel Stanley (3):
>   dts: ast2600: Consolidate A1 device tree
>   dts: ast2600: Consolidate A0 device tree
>   dts: ast2600: Consolidate NCSI device tree

As there's been no objection I've gone ahead and merged this series.

>
>  arch/arm/dts/ast2600-ncsi.dts  | 294 +-------------------------------
>  arch/arm/dts/ast2600a0-evb.dts | 264 +----------------------------
>  arch/arm/dts/ast2600a1-evb.dts | 301 +--------------------------------
>  3 files changed, 11 insertions(+), 848 deletions(-)
>
> --
> 2.35.1
>
