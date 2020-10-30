Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF82A1077
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 22:45:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNG7t0y46zDqqJ
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 08:45:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QwA1wrUg; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNG2g0NwKzDqwW
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2020 08:40:58 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id u19so9015151ion.3
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 14:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=EzLUTbCcIb7nRwGIrRB/v7mc4hynjx3l3cwMTWDSiX0=;
 b=QwA1wrUg6dzXRsnTdoedVYPPbSrjeLJF6hNbX/JXNkpMmMkfnibV8fGcQIbu/gZEqg
 4UlC3CW2GL/tGkzXGA730UQZfWtEVQ6hO2RwP3IfBzqpZy9VOtkUH5bh160Zi2Gsw9fa
 2VnvgHPsqRQXtItsMclfbrKJaATDlC1vkBCpyU+wDY4eSV91Lsb8aMHPwBbY/N5RXo8B
 YE3lEEArkm2h34I3mtRM0WbcjLlQi3xP/VmpVMo74+KoPfIIKoUihXrvbRYAftZ0zKyW
 F/kEFv8trSi33Mp9jmfgJEpF2Q8Hu0g1Eif6rSZLOp6FUW1JQDl8CJrqim9Uvx0/MNIt
 FKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=EzLUTbCcIb7nRwGIrRB/v7mc4hynjx3l3cwMTWDSiX0=;
 b=OwAbkPC4GjJx9SjitKL7SuUPdcje8Lexezk+dlOzA6ZMibfTaJU13rbVHQc1OQ2ZZC
 yCGqpi3lgmF7b9a0oq6cYqTfRjdScawGAgLIf+OhFzY0vStLqlQsyf7yivftioPtSH7q
 AbWkREyGD4rWhlO+LTJjNWuaVZDY0mjMQDYYwHqSVWIhyA7m0dyO4BE92bfJ0d6MTUbs
 k/QDax/f5Va9tjRIAOq/cDylZ2Zecp6DJbDNG2BLpGTRMu7GaeExjiNrSR9L5mno8eLC
 BJloCcRyP71ywxosm4l9aYTZi5PcBth3/g5/fkaAfFFnaqgXpXEZ5teqDnRsUInamNSm
 6B2A==
X-Gm-Message-State: AOAM5304PC31abKCut+Sb28HmJJm8Vlo0hEmV/QzIRRJV9/j5kKASSYZ
 bVv1nS/bAl3L5G79S2FQlJGKnGmEaws8SkhlrWV0Lx+J5bk=
X-Google-Smtp-Source: ABdhPJx7zsSjeIjiEbPIUkRIwqP9SdSPf2FFX91jOoNCaKAQZGGaqv7KnJwTg+uwW/580xIppaXCBF18DpMzlitt61s=
X-Received: by 2002:a05:6602:208c:: with SMTP id
 a12mr3329996ioa.55.1604094051734; 
 Fri, 30 Oct 2020 14:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <CADVsX8_pFwe-Zef0fpNfZFL3s9fiJrvRFAfwjZNt911hUq341Q@mail.gmail.com>
In-Reply-To: <CADVsX8_pFwe-Zef0fpNfZFL3s9fiJrvRFAfwjZNt911hUq341Q@mail.gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Fri, 30 Oct 2020 22:40:40 +0100
Message-ID: <CADVsX88OzLv2dX4JfQ8+uuKON+hLC1qS6BvLUpwiJ241_N9S5g@mail.gmail.com>
Subject: Re: Current master is broken
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000243f4105b2ea402a"
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

--000000000000243f4105b2ea402a
Content-Type: text/plain; charset="UTF-8"

Raise it up.

Even with the recent checkout it is still broken even for qemutarget.

On Fri, 23 Oct 2020 at 20:22, Anton Kachalov <rnouse@google.com> wrote:

> The recent commit af5e4ef732faedf66c6dc1756432e9de2ac72988 broke the build:
>
> https://pastebin.com/5tTYHd68
>
> The do_package() step tries to chown the base-files/3.0.14-r89/package/usr
> directory to 0:0 uid/gid
>
> I've tried to remove build/tmp and re-run several times. Fails with the
> same error. If I use the previous commit
> (36fe5df200a94e3ce82ba2dcad16c0a4127f6d46) it builds without any issues.
>

--000000000000243f4105b2ea402a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Raise it up.<div><br></div><div>Even with the recent check=
out it is still broken even for qemutarget.</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 23 Oct 2020 at 20:=
22, Anton Kachalov &lt;<a href=3D"mailto:rnouse@google.com">rnouse@google.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr">The recent commit=C2=A0af5e4ef732faedf66c6dc1756432e9de2=
ac72988 broke the build:<div><br></div><div><a href=3D"https://pastebin.com=
/5tTYHd68" target=3D"_blank">https://pastebin.com/5tTYHd68</a><br></div><di=
v><br></div><div>The do_package() step tries to chown the=C2=A0base-files/3=
.0.14-r89/package/usr directory to 0:0 uid/gid</div><div><br></div><div>I&#=
39;ve tried to remove build/tmp and re-run several times. Fails with the sa=
me error. If I use the previous commit (36fe5df200a94e3ce82ba2dcad16c0a4127=
f6d46) it builds without any issues.</div></div>
</blockquote></div>

--000000000000243f4105b2ea402a--
