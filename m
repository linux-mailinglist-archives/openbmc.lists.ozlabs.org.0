Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B43053924B0
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 04:03:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrB1P5XGZz2ylk
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 12:03:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=auySxEy+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=auySxEy+; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrB1831FHz2xtn
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 12:03:07 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id 5so1881708qvk.0
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 19:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3RUOIzAOrsZ+yvr706lzSuNqJp0SfgPM9pFhx9XH7TM=;
 b=auySxEy+epqhorMIUoKUHrJxnOMOHwmGnssyDY76ymPIQ+Wq1+R3339QmXYAWVXyvh
 bMm2exgz/tWZ4AssB4DOHL8L1h1otIQxwB07WvGHwQE19zxhArATOt8C4HlpRest/shs
 2liJlP2dibCD1kqV8mKauzJn3cuM9q9Na/UkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3RUOIzAOrsZ+yvr706lzSuNqJp0SfgPM9pFhx9XH7TM=;
 b=BTVkIdocMXjV9GJKGf5Zx/usNaFxxzqSiQ3zNrOkEUlQP1amqEsZtTek9Q9Dl+ScW2
 gVBab0UzdD/ZPSeN1jmEO0mUZsPhVy7CUKwnHRAmDLMU7adZpxhEUEIA8o6xwoaIzDkG
 dTAxRQ9AofSAyQPkJq0MruKj+Zk+7GN+CUSvBgElBWfDm5IAk2yy0zxfD+8DL1jWJwzC
 wcxLyqDGgistTKc039MuEh5LrEBEQNGFvjYqEN9kTHvir/YurKh0oIQAbP6n+dMusiMF
 h52h5EFlvMyZEjvew0XJIZB5clGxs8aymmFFt0SnUTC+hPMc2HmpRXzRRe9Kzgo299nJ
 gGIg==
X-Gm-Message-State: AOAM531/6xlniisA6EYQOrXs3pRyGUF9eO/bwipk3+bIFAS1+FWpmar5
 wVFjiJUW4y213R6/UOzWrjtbjM1XYdpJR71Nc6Id5ao2
X-Google-Smtp-Source: ABdhPJyZBQ0ra6zlnVNZLGatUx3j3emS7bqiyMwt935DNPPWM+lBZRi79o1o6OYOy3dEiDNZgrj5kVnr88FRgeLVIbc=
X-Received: by 2002:a0c:d409:: with SMTP id t9mr1326074qvh.18.1622080984145;
 Wed, 26 May 2021 19:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210413161238.2816187-1-wltu@google.com>
 <CAHwn2X=yDYN7V=ScrnREzAtCNZnAmRn8CzxOp033OR7POkTA5Q@mail.gmail.com>
In-Reply-To: <CAHwn2X=yDYN7V=ScrnREzAtCNZnAmRn8CzxOp033OR7POkTA5Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 May 2021 02:02:52 +0000
Message-ID: <CACPK8Xe_7he1Rp9gpzPRyvnwhSB2P+wqFUBerq9Mp8ZMjyMWHA@mail.gmail.com>
Subject: Re: [PATCH] board: ast-g4: Enable SGPIO in SCU
To: Willy Tu <wltu@google.com>
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
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 26 May 2021 at 15:51, Willy Tu <wltu@google.com> wrote:
>
> ping.
>
> I also missed the branch for this patch, but this should be in the v2016.07-aspeed-openbmc u-boot branch.
>
> On Tue, Apr 13, 2021 at 9:12 AM Willy Tu <wltu@google.com> wrote:
>>
>> Add option to enable register for SGPIO in SCU
>> for ast-g4.
>>
>> Signed-off-by: Willy Tu <wltu@google.com>

I've applied this, but I strongly encourage you to move to a newer
branch. The 2019.04 branch is based off the latest aspeed SDK which
claims support for the ast2400.

>> ---
>>  board/aspeed/ast-g4/Kconfig  |  4 ++++
>>  board/aspeed/ast-g4/ast-g4.c | 13 +++++++++++++
>>  2 files changed, 17 insertions(+)
>>
>> diff --git a/board/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kconfig
>> index 2bec9a733a..e78030ae34 100644
>> --- a/board/aspeed/ast-g4/Kconfig
>> +++ b/board/aspeed/ast-g4/Kconfig
>> @@ -19,4 +19,8 @@ config SYS_CONFIG_NAME
>>         default "ast-g4-phy" if ASPEED_NET_PHY
>>         default "ast-g4-ncsi" if ASPEED_NET_NCSI
>>
>> +config ENABLE_SGPIO
>> +    tristate "Enable SGPIO in SCU"
>> +       default n
>> +
>>  endif
>> diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
>> index 656495307b..e2463d4524 100644
>> --- a/board/aspeed/ast-g4/ast-g4.c
>> +++ b/board/aspeed/ast-g4/ast-g4.c
>> @@ -22,6 +22,19 @@ int board_init(void)
>>         /* address of boot parameters */
>>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>>         gd->flags = 0;
>> +
>> +#ifdef CONFIG_ENABLE_SGPIO
>> +       /* Unlock SCU */
>> +       writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
>> +
>> +       /* Enable SGPIO Master */
>> +       u32 reg = readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
>> +       reg |= (SCU_FUN_PIN_SGPMI |
>> +                       SCU_FUN_PIN_SGPMO |
>> +                       SCU_FUN_PIN_SGPMLD |
>> +                       SCU_FUN_PIN_SGPMCK);
>> +       writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
>> +#endif
>>         return 0;
>>  }
>>
>> --
>> 2.31.1.295.g9ea45b61b8-goog
>>
