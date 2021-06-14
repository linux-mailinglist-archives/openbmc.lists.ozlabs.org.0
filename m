Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9393A5CDB
	for <lists+openbmc@lfdr.de>; Mon, 14 Jun 2021 08:19:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3LrG6phhz3018
	for <lists+openbmc@lfdr.de>; Mon, 14 Jun 2021 16:19:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZwGQdDii;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2b;
 helo=mail-io1-xd2b.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZwGQdDii; dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3Lqx6bztz2xvH
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jun 2021 16:18:53 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id h5so1719103iok.5
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jun 2021 23:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JqbNUsI2BWstDxXImrYeCAHAtkiFFj5z3SpyFBNObVo=;
 b=ZwGQdDiiQT7XzUE+sFOgImKrju3S77EbdWB+vkmRm2uLK3ksEmKI9waAJTvflkHPFU
 l5wLL6oIJTR/cUAuh4+N0FIYAtzAp28wFnqBvHwOd3RPDTSfLW1wUoCLsTfi7VvqWFpv
 HRvnOo20fZ4yIHaI4OmTP0mSOBy3fEsROaU1aSGqP8g407HablGxUMbgSMUbjMzK9k3w
 bHYdx/74FsluGtjH3HvG9Ra1bIot49XBcs9nejVk2m2y+sm3+CSVz9dam+47bG1bPLlG
 fslLjX1/Tc4AXcTO4n7+gf4FDPHKRGz7t85V5W36GHNH5PqSVoz7k3vnucPLJyLYSmJq
 Snxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JqbNUsI2BWstDxXImrYeCAHAtkiFFj5z3SpyFBNObVo=;
 b=DgS8PeZnkX0RjJUY2a4UXXBZFXSqeu1MWjICn35ntQnaKEnzw2v+B05JgHOGMEX7hr
 ubj1bE0wOEDMRs40kJJTCUGDQSQNhsGQvBZsrXT2MCqW9rjJeDjhIEXu2dpvebSqZ6Ml
 M5msTzwr36iW6Rj6R8glBY+B4Q+/0NavqRE/7C+tRz8mfbpv0dWnzBxIiBpnJtcWSchm
 QzRTYDVhGXAo3Loe8XFJRxOWIE635qkUd0WNNeyGoq4YNaZ0RjujToECQ65o+ixd4PAN
 GTVwEQ5r9cGKTgDSE9Av4aHnuE0hQyKanqK+G1RJ2Q6ZA46g0+ZN9ZXV7q7VWOFbTsY1
 233A==
X-Gm-Message-State: AOAM530Yq/RCEzplCzBNoKFnX6aorKVp/haWpF210WXp4Ely+Xkn5VyZ
 CvnqdU1CdnuJGvFklvW2HtZTcHPAcBoZH/yf748=
X-Google-Smtp-Source: ABdhPJxK9wDMrXbf1Tq19BjVoKn4JXvQQwqGC6HtUkBHnkTlleC7K45pcppWgoEYFG0lAIEmY+jLZnK7qk1sy8hgRmE=
X-Received: by 2002:a5d:914a:: with SMTP id y10mr13358206ioq.156.1623651529107; 
 Sun, 13 Jun 2021 23:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
 <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
 <CAOLfGj6dzb6Q-BOU0AJy_thd1Gt78+and_cmU4tOUNide3Gf0w@mail.gmail.com>
 <CAOLfGj6YympZyvXO7NCPMaHNEi9CwAS97y6_-fncDHbqv5s8Bg@mail.gmail.com>
 <20210526061119.b7n2beqthbemsoba@gmail.com>
 <CAOLfGj6Ep89yknFbx2qHLv9woQ80SNJQD2cwJOa7y=tE7=VyLg@mail.gmail.com>
 <20210526085623.mhls24mmo4idu5we@gmail.com>
 <CAOLfGj7b0TEwqAEocAo=hGobCuZUoC4Zk9X_jY8Cs7NzQgi14w@mail.gmail.com>
 <20210526160816.pvpxzwnix3lgwaln@gmail.com>
 <CAOLfGj6WmBxQNm_LDNfW-m5Bs5sndxwoVJ6QupwHo+cvBDL7qA@mail.gmail.com>
 <20210526182153.xcbs5dp6sprzv7u2@gmail.com>
 <CAOLfGj6Sn77vH-TrE-GmHrYCJ7AMHs2zr0HR_yJrES1qX_buow@mail.gmail.com>
 <CAH2-KxC8jkKMXmHa=9SsLBFORbHbsJ2DUTPhoCLp_0uam0q8tA@mail.gmail.com>
 <CAOLfGj7d=VmXrXXd09nW==1Th5OCiP0nyfWbUbYDssRJ94Os-g@mail.gmail.com>
In-Reply-To: <CAOLfGj7d=VmXrXXd09nW==1Th5OCiP0nyfWbUbYDssRJ94Os-g@mail.gmail.com>
From: Artem Senichev <artemsen@gmail.com>
Date: Mon, 14 Jun 2021 09:18:37 +0300
Message-ID: <CAHsrh9L4d96C5_8=QVmujdf71iALnQdCk=zzJ3Hb=Spey5NZxA@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Nan Zhou <nanzhou@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Spencer Ku <spencer.ku@quanta.corp-partner.google.com>,
 Litzung Chen <litzung.chen@quanta.corp-partner.google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>, a.senichev@yadro.com,
 a.filippov@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jun 12, 2021 at 12:07 AM Nan Zhou <nanzhou@google.com> wrote:
>>
>> >
>> >> > Or did me missing something?
>> >> >
>> >> > Also, we already talked about it: there's a problem that if BMC los=
es the
>> >> > power before it sends out a signal to hostlogger, data in memory wo=
n't be
>> >> > persisted.
>> >> Yes, I agree that this is a problem. But there are ways to fix it wit=
hout
>> >> breaking the current functionality of Hostlogger.
>> >> We can use rsyslog with external log server, or increase the buffer s=
ize
>> >> in obmc-console-server, or use systemd-cat with logrotate.
>> >> We can even add a new mode to Hostlogger that will not use the buffer=
, but
>> >> as I said earlier, there are not many common parts.
>> >
>> > I guess you are arguing we need a new daemon rather than modify Hostlo=
gger, right? +Ed Tanous here to see what his opinion is.
>> If Nans use case is in fact totally different, and can't be handled in
>> the same application I think that's ok, but I'd like to see the new
>> application put in the hostlogger repo so it can share the routines
>> that are common (things like finding and opening the unix socket,
>> managing the reads, and the zlib integration) and to ensure that users
>> find it when searching for code that solves this problem, as on the
>> outset they're pretty similar, just with seemingly different rules.
>> If we don't put it there, it seems like we'd have to duplicate a lot
>> of code.
>
> Thanks a lot for the previous discussion. Following up on this, is it acc=
eptable if we add a new application (it will be a new binary + a new system=
d service config) in the hostlogger repo to support the stream application?=
 We can add options to control whether to turn on this new stream applicati=
on. In this way, existing applications stay unchanged. As Ed said, we could=
 use codes that deal with unix sockets and reads. It should also make sense=
 that console codes are put together in the same place.
>
> Please let us know what you think. Your confirmation will be very valuabl=
e and will unblock our development.

I still don't see a reason to have two different applications in one
repository, but let's try.
I believe that the common part with socket opening/reading (about 100
lines of code) is nothing compared to the complexity of supporting
such sophisticated configuration in meson and bb files.

--
Best regards,
Artem Senichev
