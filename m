Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A07350A78
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 00:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9hPl4hk5z30BP
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 09:51:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Yj+w/5v0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Yj+w/5v0; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9hPW0lv3z2ydJ
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 09:51:10 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id v70so437348qkb.8
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 15:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NVO1U75K3JqovCcbRVO2MIRRLv9YAoPr1yCw9HQAMn4=;
 b=Yj+w/5v0Oueic9X9dKI+TE9raHCef6zrhxJwIeC7YA5+5sGd4Nw4EHhqMHIutcq80O
 kE2TUs+4YOshJwMK6Y2IUAyCDETau6q91vToxzyPpFvjquiuy0c1SX7cc+tdrMCEV7Qo
 eAQbwFwwJqEgdHqrNEccMtCxLBXtijymEZlA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVO1U75K3JqovCcbRVO2MIRRLv9YAoPr1yCw9HQAMn4=;
 b=CC/ofeM+4nsvVc9f5aEJj+JF4NY3iEzbXU3EtIri5cDLy8bf0XO40qnaO0wPFh1MfC
 zoWc5YGQ1n83wfn1pdXGGRviYT76tze182tNwVLDwYufWsoS5UOZs/7LjjWZEMFAOFB4
 Y7ZQZWIXKIUNa1+I6+kFE9ob5doPboJZ0+ct+HHQVsFa7tcwmIQSLJnuqw03j5WtR85j
 NfgLA6ip2NiN3OhI05YK6G/+L34HK9jnz4zOAqh6j5RFeFFFO3gVQi/waXzaceoBSKF1
 YmEQLF3hoDIqAMvb4wOXJ0SCX7JwNlBrtA1OVp+o+EafBS/KeDam+1xw68gV6Q7FHiTn
 whSQ==
X-Gm-Message-State: AOAM5336ZhcsUiDHBRF/J3C5wIRQegWrh4S69zRa5rfBUgAokFZ//hRI
 /E9OaX6JgYyOTc8lnjx943FniIa0Q8DTKZ1FN8A=
X-Google-Smtp-Source: ABdhPJxoGb4/DQ5tQaY7KHEG63Kq6LvaNYHRC5vQMMDZAzPiZHfZMYN8/YF9JlDZmTud/KW9RfoG/vQ3Uzh2KQUifGw=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr5587409qki.487.1617231066722; 
 Wed, 31 Mar 2021 15:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwn2X=HadjAgzSOnn6JztYLwFe7bd4c38BKb63dxXu2SonZ=Q@mail.gmail.com>
 <CAHwn2XmVxCWzpvO1AMKT44KCbH7OZE38K0kDosV1kvYw0boR_A@mail.gmail.com>
In-Reply-To: <CAHwn2XmVxCWzpvO1AMKT44KCbH7OZE38K0kDosV1kvYw0boR_A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Mar 2021 22:50:54 +0000
Message-ID: <CACPK8XfcTXsdSviy1WGdXgkrHYQR924bpst7zeeK0bxT5MOTAw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] board: aspeed: Enable
 SGPIO in SCU
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

Hi Willy,

On Wed, 31 Mar 2021 at 21:33, Willy Tu <wltu@google.com> wrote:
>
> I am not exactly sure if this is the way to send the patch for u-boot. But I am trying to update a patch for https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc.
>
> It just gives the options to have the u-boot enable the SGPIO registers for SCU.

I strongly encourage you to bring up your new systems using a newer
u-boot tree; ASPEED's v2019.04 based SDK contains support for the
2400, 2500 and 2600 chips.

If you have already done the work to bring up v2016.07, I can merge
your fix into the v2016.07 tree. However the patch you sent is
corrupt. I recommend using git-send-email to send patches, as they
preserve whitespace in a way our email clients do not.

Cheers,

Joel

>
> Please take a look.
>
> Best,
>
> Willy Tu
>
> On Wed, Mar 31, 2021 at 2:31 PM Willy Tu <wltu@google.com> wrote:
>>
>> From a2d7336bb59df8f2ef622d4369fc035b2aafd74c Mon Sep 17 00:00:00 2001
>> From: Willy Tu <wltu@google.com>
>> Date: Mon, 22 Mar 2021 17:01:56 -0700
>> Subject: [PATCH] board: aspeed: Enable SGPIO in SCU
>>
>> Add option to enable register for SGPIO in SCU
>>
>> Signed-off-by: Willy Tu <wltu@google.com>
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
>>   default "ast-g4-phy" if ASPEED_NET_PHY
>>   default "ast-g4-ncsi" if ASPEED_NET_NCSI
>>
>> +config ENABLE_SGPIO
>> +    tristate "Enable SGPIO in SCU"
>> + default n
>> +
>>  endif
>> diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
>> index 656495307b..e2463d4524 100644
>> --- a/board/aspeed/ast-g4/ast-g4.c
>> +++ b/board/aspeed/ast-g4/ast-g4.c
>> @@ -22,6 +22,19 @@ int board_init(void)
>>   /* address of boot parameters */
>>   gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>>   gd->flags = 0;
>> +
>> +#ifdef CONFIG_ENABLE_SGPIO
>> + /* Unlock SCU */
>> + writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
>> +
>> + /* Enable SGPIO Master */
>> + u32 reg = readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
>> + reg |= (SCU_FUN_PIN_SGPMI |
>> + SCU_FUN_PIN_SGPMO |
>> + SCU_FUN_PIN_SGPMLD |
>> + SCU_FUN_PIN_SGPMCK);
>> + writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
>> +#endif
>>   return 0;
>>  }
>>
>> --
>> 2.31.0.208.g409f899ff0-goog
>>
