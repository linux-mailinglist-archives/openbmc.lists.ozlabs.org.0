Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA7431449A
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 01:10:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZNZ12QtbzDrdF
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 11:10:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OAdIn5gL; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZNXz2x4bzDrSt
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 11:09:06 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id t63so16458886qkc.1
 for <openbmc@lists.ozlabs.org>; Mon, 08 Feb 2021 16:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5g/gTHhhvcriES35sRLaL4eVZbkao9HVQLxNEemB2uI=;
 b=OAdIn5gLDxVXWSR3y7I3zxUgirHK+0JVBZuu3NQepIWAAOgJa6LACb+loR/w/VbwPI
 Ua3Is6UpkRjMODQG/QRXIVl2A8wZsnD5z1C0LQ/uowmhE41r+qRIVmg2mcBTahmvn4ss
 MBzzYRM+31Law8unNzo749V7ucbFbqSY0ApWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5g/gTHhhvcriES35sRLaL4eVZbkao9HVQLxNEemB2uI=;
 b=PeXB+dgzPUM4ytLelZVsrlRCu39/26rgLLDVP9xtEDkFwG3l+qGQ0IUC1Fj5CEaex6
 ljbN3M7qaQCKr2Cw9XT6NyYXUONjTApHrLtYQl+yoFUF/JXNZWy1Wr7fr/pAlWZ2C5Lg
 f9v60L/tySHRhUDqi22FERWYt4jPW7skHrBCzfDVpM3dUjrf6U7n/aflkHvWQQpvni91
 7gtgi36kC809Q9Jlg66+RNSnVvG2H60WI60eiYbRmjdWnoSrJtYpLxBwe88s11JRM7gY
 5buulHTz4PJtfPTMfADmFvLIOU77pjT+YNqdY2GNfbO88lljAwq/RmfwuHBIb+fEXtBl
 oWWQ==
X-Gm-Message-State: AOAM533B44yD85zRaRmPS/EfCZgV4FiS6ListVq/zM+UhF0r20D9qJ7j
 GyNCmicthQ+WS+IqYxw6EkeyrDRWI7ysPnYCEJg=
X-Google-Smtp-Source: ABdhPJxlz9XVtQHgUmZSdW5RBL3jFgOSIc2LO3T/twWWDrSW4XmCCcxbwuCTXD4E0ffZaiJ5TPhPnz3BWvX/bpIdLqU=
X-Received: by 2002:a37:57c7:: with SMTP id
 l190mr19757014qkb.487.1612829342141; 
 Mon, 08 Feb 2021 16:09:02 -0800 (PST)
MIME-Version: 1.0
References: <CADVsX8_ua6nShjGQbK1nVqsn34+dArF69sCLcLt6U+0_zXj54w@mail.gmail.com>
 <CADVsX8_vXebzp_bjj5qWg2Xm7i9jZ1N+OmFVA=LAgOJXM6W8MQ@mail.gmail.com>
In-Reply-To: <CADVsX8_vXebzp_bjj5qWg2Xm7i9jZ1N+OmFVA=LAgOJXM6W8MQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Feb 2021 00:08:50 +0000
Message-ID: <CACPK8XekUX78Y349Xj8uAicOXGGzBpdjDQRY_zR7gPKJsvk4TA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: Anton Kachalov <rnouse@google.com>
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

On Sun, 7 Feb 2021 at 22:28, Anton Kachalov <rnouse@google.com> wrote:
>
> Patch has tab symbols. Have no idea how to submit it in 2021 by email :)

:D

I recommend git-send-email. Speak to your google colleagues about how
to set up mail delivery with your corp account.

Cheers,

Joel



>
> On Sun, 7 Feb 2021 at 18:58, Anton Kachalov <rnouse@google.com> wrote:
>>
>> This change satisfies OpenBMC requirements for flash layout.
>>
>> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
>> ---
>>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
>>  1 file changed, 8 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> index bd1eb6ee380f..741c1fee8552 100644
>> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> @@ -182,8 +182,8 @@ bbuboot2@80000 {
>>   reg = <0x0080000 0x80000>;
>>   read-only;
>>   };
>> - envparam@100000 {
>> - label = "env-param";
>> + ubootenv@100000 {
>> + label = "u-boot-env";
>>   reg = <0x0100000 0x40000>;
>>   read-only;
>>   };
>> @@ -195,25 +195,13 @@ kernel@200000 {
>>   label = "kernel";
>>   reg = <0x0200000 0x400000>;
>>   };
>> - rootfs@600000 {
>> - label = "rootfs";
>> - reg = <0x0600000 0x700000>;
>> + rofs@780000 {
>> + label = "rofs";
>> + reg = <0x0780000 0x1680000>;
>>   };
>> - spare1@D00000 {
>> - label = "spare1";
>> - reg = <0x0D00000 0x200000>;
>> - };
>> - spare2@0F00000 {
>> - label = "spare2";
>> - reg = <0x0F00000 0x200000>;
>> - };
>> - spare3@1100000 {
>> - label = "spare3";
>> - reg = <0x1100000 0x200000>;
>> - };
>> - spare4@1300000 {
>> - label = "spare4";
>> - reg = <0x1300000 0x0>;
>> + rwfs@1e00000 {
>> + label = "rwfs";
>> + reg = <0x1e00000 0x200000>;
>>   };
>>   };
>>   };
>> --
>> 2.30.0.478.g8a0d178c01-goog
>>
>>
