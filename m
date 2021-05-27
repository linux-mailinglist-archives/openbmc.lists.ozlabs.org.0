Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C739268F
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 06:49:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrFj42QpDz2ymP
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 14:49:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=E+72bAnw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=E+72bAnw; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrFhp50dZz2xb1
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 14:49:13 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id t17so2630918qta.11
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 21:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ArPxzChTrWMbJyIiORtlz3MjB+esQWdYIhiLwAuQoAg=;
 b=E+72bAnwXdJvf+jDL81smDmGwGVCRflt+1VSVHDgwNgF5Dzvjc9Wkewnn73a5jcAN4
 FCGU1K004nFaj7L0AZG6KGcqA5GXgYJoYGhMBfhK7tnYT7TdMzIRX9PTCECzhN2KaYMo
 8efV3SWGmWtjvgEG2TiyBwkp+ao/+D/RSayrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ArPxzChTrWMbJyIiORtlz3MjB+esQWdYIhiLwAuQoAg=;
 b=Lu2WT/AKPsiHjFcRsGaM4SOlyn+pUM2wVUamAnD7cJSCIbcHRhhYrvMm12OOJpYNLQ
 IpIAgkKwR7zsvzUywIZ4QXI+E4cJgKoEi43WLMG/guz1H9NKth1J7sFR9qxXbKZQkXb7
 nMgkyPlI63wluj6ZSKnrwOWxJjf7RBJSuAJfgjQl41z4x92IShPQ/ABQopVPRaH+4SmL
 5I+C+6Zdmv1BkSliX6YA0mZN3VIeA/vElv1zuryNwpA90w1uCWlU188AZ4Auv/iwkWjE
 +yi1TVaGJY3RZlsc0aCoBk8Gc8zNq4MeCspXwLzaJnaP5zpNPNv2VVi21mbd2GJ0w3Hm
 dqIg==
X-Gm-Message-State: AOAM531Rz+11lwRRalxglAaurEFDB9Mf2d0MsQOhMEOn38yZ19IkEv2I
 CjDTOBTScxLLzbol6it3xdxFKcmx+s0+KfbgxjE=
X-Google-Smtp-Source: ABdhPJzD4S38BFnVReIkJL30gz2Gjxq/2DLIbfpaee2lZZ1HFiD8enQgXniGGsafGpFAJuPI+++P/0PqAu373qItE1E=
X-Received: by 2002:ac8:5e51:: with SMTP id i17mr1574610qtx.263.1622090949644; 
 Wed, 26 May 2021 21:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210424003821.3697200-1-wltu@google.com>
 <CAHwn2Xm+BnwbU-hHrKT-oazomh+V42t3Dm=xXhVJozNEdiDd8g@mail.gmail.com>
 <CACPK8XeSd8TVXQoj-G5baQPdEH5aP2G4RmhcfDzNPMnZvcfS0Q@mail.gmail.com>
 <CAHwn2X=pYrX0ZCrSuzSZ-cW86EP9gaDCLTDjeWHBq35Nhg2KBg@mail.gmail.com>
In-Reply-To: <CAHwn2X=pYrX0ZCrSuzSZ-cW86EP9gaDCLTDjeWHBq35Nhg2KBg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 May 2021 04:48:56 +0000
Message-ID: <CACPK8XemenVwv-n-mi6mpHUFKXaLtbAxRKbQQKnXf==zymR5TQ@mail.gmail.com>
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

Hi WIlly,

I know that Google's mail clients make this harder than it should be,
but please do not top post when replying on the mailing list.

On Thu, 27 May 2021 at 03:02, Willy Tu <wltu@google.com> wrote:
>
> ah, good catch.
>
> I didn't realize that was the case. It looks like it is up to Nuvoton to upstream it.
>
> https://github.com/Nuvoton-Israel/linux/blob/NPCM-5.10-OpenBMC/drivers/hwmon/npcm750-pwm-fan.c#L800
>
> Or maybe I can just make the change for them? Not sure.

I suggest sending a patch to mainline to support the features that
Nuvoton have in that tree.

Cheers,

Joel

>
> Willy Tu
>
> On Wed, May 26, 2021 at 6:51 PM Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Wed, 26 May 2021 at 15:48, Willy Tu <wltu@google.com> wrote:
>> >
>> > ping
>> >
>> > On Fri, Apr 23, 2021 at 5:38 PM Willy Tu <wltu@google.com> wrote:
>> >>
>> >> gsj platform sometimes also see low fan speed issue that can be partly
>> >> prevented with this fan filter.
>>
>> This property is not supported by the kernel, so it will not do
>> anything. Do you intend to submit driver support?
>>
>> >>
>> >> Signed-off-by: Willy Tu <wltu@google.com>
>> >> ---
>> >>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 3 +++
>> >>  1 file changed, 3 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>> >> index 3ff116aaacb3..86facfc08c6e 100644
>> >> --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>> >> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>> >> @@ -408,18 +408,21 @@ fan@0 {
>> >>                 reg = <0x00>;
>> >>                 fan-tach-ch = /bits/ 8 <0x00 0x01>;
>> >>                 cooling-levels = <127 255>;
>> >> +               fan_filter_en;
>> >>         };
>> >>
>> >>         fan@1 {
>> >>                 reg = <0x01>;
>> >>                 fan-tach-ch = /bits/ 8 <0x02 0x03>;
>> >>                 cooling-levels = /bits/ 8 <127 255>;
>> >> +               fan_filter_en;
>> >>         };
>> >>
>> >>         fan@2 {
>> >>                 reg = <0x02>;
>> >>                 fan-tach-ch = /bits/ 8 <0x04 0x05>;
>> >>                 cooling-levels = /bits/ 8 <127 255>;
>> >> +               fan_filter_en;
>> >>         };
>> >>  };
>> >>
>> >> --
>> >> 2.31.1.498.g6c1eba8ee3d-goog
>> >>
