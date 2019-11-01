Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 954EFEBBBE
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 02:37:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4744ZB3pX4zF5Kp
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 12:37:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="k7wYyUwQ"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4744YM5DcLzF4Sl
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 12:36:54 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id t26so11119259qtr.5
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 18:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=chHFW8I08lQlBzuMgtb41nTerNopVs6jkOaZ4A4wumo=;
 b=k7wYyUwQt7JKvElyZQ4dWqzlm4C2zIvjtRTdVhGreRYe4UeB7QGWGtTkaq+mSia/dq
 tW6BDEBm6EyZlgj8iptGIRJt94TyJrVCRbX2Hel4AbzpWYfr4u0Jw8Mk2M6s3UcwUMeI
 u1U5z1/TF/grwBiN1bi1S8ucPkZDMtCVyQ2qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=chHFW8I08lQlBzuMgtb41nTerNopVs6jkOaZ4A4wumo=;
 b=ftdscmBMwLrHB022NCI1pwuJtyh74LIjCFcrukh/fH9NsXbrAxJMGmgbW/Jru9HzRa
 J7UsGNTjwZbHV6S3bonOJ7atVZixF3DrYGUX0XDndnRCzlz1mLATvj+2dYUUL1/JN2Vj
 Yagf3hhuZ3S359hfBU/M4+28RP3QeySm2NLL9obQuF6J0DMiYCbd933XmkiO59GsmuMp
 yn3pF/5vLcgAE4mZs8j9bzn1PBoaWIHKUQtZBL0cgWDZSQ3riwfXkAkjT9gjrBlVVqZW
 5zvKfyvbsZJM5Bte07M6ZrMHLp4Ulycgb3IuZ0e8MIce+duSPXDAye25cP5jOlm+JOwd
 YPpg==
X-Gm-Message-State: APjAAAWMsk5WPLGUrVm1u8oFudtyFPlEzv8Ibgv0Svtvt2eq/7fnPLgR
 9945OIJHiugwcpejRWIqYwsmlnLOdnIzK4+wBsg=
X-Google-Smtp-Source: APXvYqwgwLjUiaI8lvtv5XigJUnfE0opxafAYwVVaoUq0qE+XoZIpcFJ49CebbvhK+qn660PDmmFwx5buEV+WZj48dM=
X-Received: by 2002:ac8:6bcd:: with SMTP id b13mr8777036qtt.234.1572572211029; 
 Thu, 31 Oct 2019 18:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <06422EF3-4D9D-4880-99EA-513C41215F37@fb.com>
In-Reply-To: <06422EF3-4D9D-4880-99EA-513C41215F37@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 1 Nov 2019 01:36:39 +0000
Message-ID: <CACPK8Xf50ud_K-OMNGDQp9NBxNF4GtG9cRRKhDPA6N1z6XBvpg@mail.gmail.com>
Subject: Re: kernel patch pull for IPV6
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vijay,

Please turn off HTML email when posting to the list. Thanks!

On Fri, 1 Nov 2019 at 01:05, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi Joel,
>
> Can you please pull following patch to our openbmc kernel from linux-next repository.
>
> commit cf0eba334268563152e4a8bc9ab865d0037a7948
> Author: Vijay Khemka <vijaykhemka@fb.com>
> Date:   Thu Sep 12 12:04:50 2019 -0700
>
>     net/ncsi: Disable global multicast filter

Do we still need this now that Ben has fixed checksumming?

Did you try testing with the checksumming patch applied and the
multicast one reverted?

>
>
> commit 88824e3bf29a2fcacfd9ebbfe03063649f0f3254
> Author: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Date:   Fri Oct 25 13:47:24 2019 +1100
>
>     net: ethernet: ftgmac100: Fix DMA coherency issue with SW checksum

I've applied this one.

Cheers,

Joel
