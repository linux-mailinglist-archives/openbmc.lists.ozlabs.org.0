Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A187B392493
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 03:52:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr9mX5NlSz2ymV
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 11:52:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QPAs0Wlg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QPAs0Wlg; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr9mB1xGRz2xv1
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 11:51:53 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id 76so3148926qkn.13
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 18:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8FxwFi0SKp3Wp1tdRFUIMGX5PRG+HiURnfk2pCfPS7A=;
 b=QPAs0WlgmRBML5ksXfgiJTVwHqCkTnp0mkp9qMRcowcp9oUns9jT9s9y2K/AocZi2q
 RnWl/JVg64G4dwtWPq2swDL0hyjeDM/Y7SI8ZqQpUHzs2csW/dhx9kyrNob4x3EfUsJE
 av2chbgXrFPKP1udlud/jnzfvpTcDi9thunyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8FxwFi0SKp3Wp1tdRFUIMGX5PRG+HiURnfk2pCfPS7A=;
 b=OEFJgdYUwWiGVOhWcy6KA4weTLsUe+wy+mlLJB322wQQNha2GhPYdJCkKEifnkV5Ll
 DX4zA3NgFbWZzMqfq9a9K6dvQNBKPmjW5xnGSL62PyeFpkR6MBzO/CArdaR32usVoJXT
 tbiMeNlcibTHiPC+xRqvYWDdcRYl6yr6txVA+e5abdcfPUTnF3f0dVzYhpupqUE0YYFr
 TWfcYPj2XtDAu5Jt2bQ5ypIFEEhCxPtsbuaNB2nD7uWu1iwvXQsyEBrteL7o1UrCkkgK
 EfnanzyFJLEJqBRniJiwu1Oours9JOYajQ154D32BCTJR6K7kQM2M9Ly5s7BpgJg31xR
 vv9A==
X-Gm-Message-State: AOAM533BCqIb6YvZFi+FRkUWdSbf0yQkLL/9PKrGZ41CmwLEZFU11hYN
 g/sI+yKeNEm1PZ9Oy/4uwAdVq/ZJ0tBmaV8a85k=
X-Google-Smtp-Source: ABdhPJxDuzfEyHyo1MGkGMkHy6OmOB4H+dETtDmO6Bup0x140oNE+1OrUxV+o8d+CZ7dgZj45oeuafpOiEzOAqjuW/0=
X-Received: by 2002:a37:6442:: with SMTP id y63mr1117007qkb.273.1622080309509; 
 Wed, 26 May 2021 18:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210424003821.3697200-1-wltu@google.com>
 <CAHwn2Xm+BnwbU-hHrKT-oazomh+V42t3Dm=xXhVJozNEdiDd8g@mail.gmail.com>
In-Reply-To: <CAHwn2Xm+BnwbU-hHrKT-oazomh+V42t3Dm=xXhVJozNEdiDd8g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 May 2021 01:51:37 +0000
Message-ID: <CACPK8XeSd8TVXQoj-G5baQPdEH5aP2G4RmhcfDzNPMnZvcfS0Q@mail.gmail.com>
Subject: Re: [PATCH dev-5.10] arm: dts: nuvoton: gsj: Enable Nuvoton fan filter
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
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 26 May 2021 at 15:48, Willy Tu <wltu@google.com> wrote:
>
> ping
>
> On Fri, Apr 23, 2021 at 5:38 PM Willy Tu <wltu@google.com> wrote:
>>
>> gsj platform sometimes also see low fan speed issue that can be partly
>> prevented with this fan filter.

This property is not supported by the kernel, so it will not do
anything. Do you intend to submit driver support?

>>
>> Signed-off-by: Willy Tu <wltu@google.com>
>> ---
>>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>> index 3ff116aaacb3..86facfc08c6e 100644
>> --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>> @@ -408,18 +408,21 @@ fan@0 {
>>                 reg = <0x00>;
>>                 fan-tach-ch = /bits/ 8 <0x00 0x01>;
>>                 cooling-levels = <127 255>;
>> +               fan_filter_en;
>>         };
>>
>>         fan@1 {
>>                 reg = <0x01>;
>>                 fan-tach-ch = /bits/ 8 <0x02 0x03>;
>>                 cooling-levels = /bits/ 8 <127 255>;
>> +               fan_filter_en;
>>         };
>>
>>         fan@2 {
>>                 reg = <0x02>;
>>                 fan-tach-ch = /bits/ 8 <0x04 0x05>;
>>                 cooling-levels = /bits/ 8 <127 255>;
>> +               fan_filter_en;
>>         };
>>  };
>>
>> --
>> 2.31.1.498.g6c1eba8ee3d-goog
>>
