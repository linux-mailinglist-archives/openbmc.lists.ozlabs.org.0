Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAD43E8992
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 06:55:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkyFJ2hJhz30gd
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 14:55:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Gai2yVwv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Gai2yVwv; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkyDr2Rwgz2yMM
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 14:55:23 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so2721263pjl.4
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 21:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8oF8tZVS3pGDVKt+bf6yt6BZ8KjxO6fQKJJWkjvH2yU=;
 b=Gai2yVwvJmX2Oo5QmswglfiJvUe4jo+OxSqja4qn2CiiaCraGD3SdgmkkWyGJeyUbZ
 uaiFb6LfBG58UhvufYOHHQLzExeX/SNpauHNhB05WOMlGKWDBX+YUJrF91HhShcxijPv
 ViNcbDe2aKJNIBc9LRUVJw4yQz3u90TwY9hMNZGY3QKV6YSoOGsTbwxIDg2zdGfS7jDU
 pr02fBDFsHM1shx2OJ+qGHxK7UO4UlMQD7LKQxyueOghsUTzE37H3yE7eAgxS4xsyXFP
 z19r3OakUUb/uHq33coCHM6pDOEuE41en0lYlNz5qu99aGxyOt0orOzjZym0mMnVxKDu
 H8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8oF8tZVS3pGDVKt+bf6yt6BZ8KjxO6fQKJJWkjvH2yU=;
 b=JmX4IqyTywXkMn3KnBF6mTpGiQDdPBlY8NJOA1cCl9MRIz1TbHHRi4+3cqe7mZTq6F
 oyVOQA64sj+ZeyUDROFrw70BtgZt6v1kW50xPUNgIBs26SN0d13XDh939dO32q0dvHj6
 qDs5EejMCWuCmjUfoIRth4XbbnrqmpDqDHg5xYoIjWYHWbAdsbrYyGS3nw0fGkkWksKi
 txVdzdseKOo95k4Jy0MQAM9+b9+E5+G3cOiWUQHBmL7Ie6h3ofX5EdMOqLBEKZZvdfJa
 TrHqk0VdXiH5HXckgMLS1DbBTmTE2Vr+zhwCEdAAZM/HDYfZa6qSePfW6CtcVkaWwRfw
 Ceiw==
X-Gm-Message-State: AOAM531CIchvgIU3Ib18Vg2X8ZNXpwFa/XVKavyrAWMm+22JX+06idkx
 CwBLR5ZCQJZQ8VZjPjWU8A9PAIuRCRkgcsh8EfvjMLulvIq3AP61
X-Google-Smtp-Source: ABdhPJwpmQoch+WjklIinoqMrGX8urSW/eMeVY27M0RVZnPdnE5wswEvRZmlgTAgs6q7Ek/naYRdsBq3cQXCc+y2Y9g=
X-Received: by 2002:aa7:8097:0:b029:3cd:b205:cfe9 with SMTP id
 v23-20020aa780970000b02903cdb205cfe9mr8129255pff.1.1628657717280; Tue, 10 Aug
 2021 21:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwn2X=uDqvQiH05+zSpZiuF-t6iHYpucXXSLDJjn4TfZ0iOUA@mail.gmail.com>
In-Reply-To: <CAHwn2X=uDqvQiH05+zSpZiuF-t6iHYpucXXSLDJjn4TfZ0iOUA@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Tue, 10 Aug 2021 21:55:06 -0700
Message-ID: <CAHwn2X=gfL7h54JqR8xF3X2eQnK3JkFqDGLB+rLEH94c6mvspA@mail.gmail.com>
Subject: Re: [phosphor-sel-logger] Watchdog Event Monitor Usage
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000b3aa5805c9416cce"
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>, Charles.Hsu@quantatw.com,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b3aa5805c9416cce
Content-Type: text/plain; charset="UTF-8"

Just a friendly ping on this topic.

If no one has any concern, then I will replace it.

Adding `Charles.Hsu@quantatw.com` since he added this feature.

On Mon, Aug 9, 2021 at 1:38 PM Willy Tu <wltu@google.com> wrote:

> Hi all,
>
> I am writing this to see if anyone is using the Watchdog Event Monitor
> option in phosphor-sel-logger.
>
> Option: `log-watchdog`
>
> I have made a few changes to `phosphor-watchdog` that sends out Timeout
> signals during timeout events.
>
> See https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-watchdog/+/44749
>
> I am thinking of replacing the existing watchdog event to check that
> signal instead or checking for the `Enabled` property change.
>
> See
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-sel-logger/+/45622
>
> I think the existing change is wrong, since changing the `Enabled`
> property does not necessary mean the watchdog event got triggered.
>
> So I am wondering if anyone needs the watchdog event monitor? or if I can
> replace it.
>
> Best,
>
> Willy Tu
>

--000000000000b3aa5805c9416cce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just a friendly ping on this topic.<div><br></div><div>If =
no one has any concern, then I will replace it.</div><div><br></div><div>Ad=
ding `<a href=3D"mailto:Charles.Hsu@quantatw.com">Charles.Hsu@quantatw.com<=
/a>` since he added this feature.</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 9, 2021 at 1:38 PM Willy=
 Tu &lt;<a href=3D"mailto:wltu@google.com">wltu@google.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
Hi all,<br><div><br></div><div>I am writing this to see if anyone is using =
the Watchdog Event Monitor option in phosphor-sel-logger.</div><div><br></d=
iv><div>Option: `log-watchdog`</div><div><br></div><div>I have made a few c=
hanges to `phosphor-watchdog` that sends out Timeout signals during timeout=
 events.</div><div><br></div><div>See=C2=A0<a href=3D"https://gerrit.openbm=
c-project.xyz/c/openbmc/phosphor-watchdog/+/44749" target=3D"_blank">https:=
//gerrit.openbmc-project.xyz/c/openbmc/phosphor-watchdog/+/44749</a><br></d=
iv><div><br></div><div>I am thinking of replacing the existing watchdog eve=
nt to check that signal instead or checking for the `Enabled` property chan=
ge.</div><div><br></div><div>See=C2=A0<a href=3D"https://gerrit.openbmc-pro=
ject.xyz/c/openbmc/phosphor-sel-logger/+/45622" target=3D"_blank">https://g=
errit.openbmc-project.xyz/c/openbmc/phosphor-sel-logger/+/45622</a></div><d=
iv><br></div><div>I think the existing change is wrong, since changing the =
`Enabled` property does not=C2=A0necessary mean the watchdog event got trig=
gered.</div><div><br></div><div>So I am wondering if anyone needs the watch=
dog event monitor? or if I can replace it.</div><div><br></div><div>Best,</=
div><div><br></div><div>Willy Tu</div></div>
</blockquote></div>

--000000000000b3aa5805c9416cce--
