Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292A43FC6B
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 14:39:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HghpJ2TDfz2ynQ
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 23:39:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=vzw5fMFn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=vzw5fMFn; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hghnv317Mz2xg3
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 23:39:25 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id o83so13124392oif.4
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 05:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UdqT61vnqCSX2+6/mMKG07G4L9n9Q8W5V35VFx1tqEU=;
 b=vzw5fMFnp1Z3l/sx8s5m/sL1mD+H++ZnXUg3kxEwvRZV6uwWelcceoh1l9FBsIWcX2
 YyykvAMhLenjgWmVgkJV92yZcdblbElMb6zgKmzAwE7R6O8g1YtShSY4oa6kU2C1+Sqs
 rb7La0G0cF+yjwd9b9/7E11LZLCM16r1AuALJp1VqeSFogmT7KP05htTpO/yJO/ePFGG
 03etchEOFSuc7lxEIzlIiNfE3f2ZqOLtPNMxIVW62H6esPYZM4G/M2in0+ukB1I/v+jL
 VwNTGZNAnEmIJiPd8ikoWugPcyOSUCsdIo58C06Pji4KV5pLBH9rBnmEvE2mzaFv8jAj
 LuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UdqT61vnqCSX2+6/mMKG07G4L9n9Q8W5V35VFx1tqEU=;
 b=FqYza/08HLtSbkJrbykFQqpsEqoO3jm1RU/MriDsZVCyloucQP77rFRNvdV/4F/NUr
 s5MLQWBYbumPEFkUhTROdoA43/DDGapZOfQTPe5Ycgox5QxF/ptwJChbfslDq1X0TDrI
 EEcyYtBUwHRCLd4qe3jWdYmYv0IQrCKa4wii62I90fVHgzlS9juW55WI2WCf8SYQumTI
 ZefVWY6tZ/qolr+l5yt7T0QRjdBriGPIZ/txAeoUF3VpjLbNcoa/kBFlp887+K79nMj2
 QBUU2JBnwNKnQpuSC8QNh4B37ZBNa1ImlStufR6pV2Ky1R9LqeJ0RaKJuqzNC3irdh1a
 Gomg==
X-Gm-Message-State: AOAM533w2AeylgMPfOp9dRFltT6qCFLdyYCI/DEfrMZh4lQd6aTlh+wb
 8Vps1HAG+r8lRzrMsLGI1GlftBkBsNL3CnKOf6dRTA==
X-Google-Smtp-Source: ABdhPJxccySo8HY0g6zNh2fMgS2txoBh7NpT4Y2Zrh7dEzw9xvVrBlq7/SMLFY+/g9pN109BwVF2B/gCSaUJISCh6UI=
X-Received: by 2002:aca:60c1:: with SMTP id u184mr13273270oib.50.1635511160916; 
 Fri, 29 Oct 2021 05:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <dcebf35e-56a3-4f16-0380-841925e093f4@amperemail.onmicrosoft.com>
In-Reply-To: <dcebf35e-56a3-4f16-0380-841925e093f4@amperemail.onmicrosoft.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 29 Oct 2021 20:39:10 +0800
Message-ID: <CAGm54UEHiq0BwAMGWAZ=dsfydwDxLD8yvqfZ5FEuWCQY4h=7Jg@mail.gmail.com>
Subject: Re: [External] Fix u-boot 2016.07 env fail on 64MB layout
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Please refer to
https://lore.kernel.org/openbmc/CAGm54UGMSVkT=3WLVLrJwcW8OGcQJZOGYnhVvOrF1qVC7xtdvA@mail.gmail.com/
In short, it's suggested to use the u-boot-aspeed-sdk recipe instead
of u-boot-aspeed for the 64MiB layout.

On Fri, Oct 29, 2021 at 7:16 PM Thang Nguyen
<thang@amperemail.onmicrosoft.com> wrote:
>
> Hi,
> My platform uses Aspeed2500 BMC with 64MB SPI-NOR. Since the change in
> BMC SPI-NOR layout at
> https://github.com/openbmc/linux/commit/985c3f59cc645c397726ad4ca0872cfaf7ef2579,
> the patch
> meta-phosphor/aspeed-layer/recipes-bsp/u-boot/files/0001-configs-ast-Add-redundnant-env.patch
> becomes incorrect for 64MB layout (but still correct for 32MB SPI-NOR
> layout).
> Do you have any idea on correcting it for 64MB layout?
>
> Thanks,
> Thang Q. Nguyen



-- 
BRs,
Lei YU
