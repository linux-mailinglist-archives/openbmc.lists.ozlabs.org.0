Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D303219B4C0
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 19:36:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48stfd6qN7zDqKg
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 04:36:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Mj6sP1/n; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48stcw4THmzDr3D
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 04:35:12 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id 19so331148ljj.7
 for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2020 10:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=C1kvZKqOONJ3PeA6zgI1KOqHvOpQ4XU6AZv0RhsIWHU=;
 b=Mj6sP1/n6VlwZLJ4ZebHOwNdifCBGe7UEHJ46YkE/v5S6R6ymtjBBsGgJNQ10PzTJr
 7Ipm3sQ9wFhgyerwT/Gb2h/xo2aGseO9xegjpD58GJFMhkuEdv7WoGmXb927V7uDvJZy
 5uvwJfSPbWXDupf6Lm9CoLX9jZot3UXJpNof1c/hwb1RA83BbDMOBmFKXUnhbA6gZbxL
 a/kf5AVKdAhVLqqjYO1yKVNF252ciOWIYng4+4tqG2fFcP4PnOTtIWpmC+NprBNKfXsU
 xBqzXq2zuoJEdsnI8/hCCTf3u4urjorPEKOPxZkBdvA2l0vX1atO9z1aWsze/G6xcHfG
 Ejiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=C1kvZKqOONJ3PeA6zgI1KOqHvOpQ4XU6AZv0RhsIWHU=;
 b=eyejRL9ABnUNzfTVJfmxPZ0UTa3Pv1KBtaLxzG8nwydkiJPTNLLK4nBhvB3N3KqaxF
 NOzMzDYaW4y6teuWAEioh/c7/2O9kTvhiyTRx+WwpyC6BIR34oKr4uQJpQSJgy2+Bzgo
 9ZdBCjq4gMfGbpLYHpWzqwcI7bGMu1Xh5Pe6Wz+lyuRf7DHzi+cdfyYEOKz6IF+q5est
 DcRr5kEAlRn3G7ZUJQJlRUSPow/yE7XSVblHjstWYQxZ/rROIMlz/LBNidzIroadARPD
 5+TG55SFt+fXYZUTxFoucQO1wio+KwpBID3F/gFopMyp4uvLzrp3X00tb6dNUK/l+6Pz
 zS+A==
X-Gm-Message-State: AGi0PuZPcA1orLNAiTKIUkBXZ3lcNr0Scr516nlv79o/mlf6kbJNgVrs
 r5lTp6nonfe85A88WjBIZGi0sr0kaO0nCSUGDPZd4hxeIKQ=
X-Google-Smtp-Source: APiQypK3KW+omed1VXG5ZBgioAfbTvnwnKZZFBvxftUJovxqiSE0+qazOBkPaQcmJlPJshNaEb7CNJF3Y5E2AFdHoeQ=
X-Received: by 2002:a2e:b0eb:: with SMTP id h11mr14088920ljl.85.1585762504998; 
 Wed, 01 Apr 2020 10:35:04 -0700 (PDT)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Wed, 1 Apr 2020 10:34:53 -0700
Message-ID: <CAH1kD+ans6=BbPP9Sut7OQC3Fdt_=+=QEgzyFgyPa_9vwLS0TQ@mail.gmail.com>
Subject: OpenBMC Janitor/Gardener
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000cf70f005a23e1a46"
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

--000000000000cf70f005a23e1a46
Content-Type: text/plain; charset="UTF-8"

Hi,

I was recently looking into the linux kernel introduction, and I noticed
the kernel janitors https://kernelnewbies.org/KernelJanitors.  It seems
like a pretty interesting idea, and I've been thinking about janitorial
tasks in OpenBMC.

For some context, we've had a handful of new developers join recently, and
I've been looking for some small refactoring projects that they could work
on upstream.

So I guess there are two parts to this email.  First does anyone have some
bite sized improvement task that's been on their wishlist, but there hasn't
been anyone around to work on it.  (In particular things around bmcweb and
phosphor dbus interfaces would be appreciated).

The other thing is, what do people think would be the best way to publicize
these kinds of refactoring/janitorial/gardening tasks. One way would be to
create a *gardening* tag in the github issues.  That way people can set up
filters for ideas that experts think are a good idea, but probably won't
need deep design discussions to get started.

Another way would be to have a monthly/quarterly wishlist gathering on the
mailing list.  That way we have some dedicated time to discuss issues of
the day, and put them together into a markdown document (like a per project
version of the security group wishlist
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list
)

Maybe this is already happening, and I just haven't noticed it.  Anywho,
hope you are all doing well.

Cheers,
Richard

--000000000000cf70f005a23e1a46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I was recently looking into the lin=
ux kernel introduction, and I noticed the kernel janitors=C2=A0<a href=3D"h=
ttps://kernelnewbies.org/KernelJanitors">https://kernelnewbies.org/KernelJa=
nitors</a>.=C2=A0 It seems like a pretty interesting idea, and I&#39;ve bee=
n thinking about janitorial tasks in OpenBMC.</div><div><br></div><div>For =
some context, we&#39;ve had a handful of new developers join recently, and =
I&#39;ve been looking for some small refactoring projects that they could w=
ork on upstream.</div><div><br></div><div>So I guess there are two parts to=
 this email.=C2=A0 First does anyone have some bite sized improvement task =
that&#39;s been on their wishlist, but there hasn&#39;t been anyone around =
to work on it.=C2=A0 (In particular things around bmcweb and phosphor dbus =
interfaces would be appreciated).</div><div><br></div><div>The other thing =
is, what do people think would be the best way to publicize these kinds of =
refactoring/janitorial/gardening tasks. One way would be to create a *garde=
ning* tag in the github issues.=C2=A0 That way people can set up filters fo=
r ideas that experts think are a good idea, but probably won&#39;t need dee=
p design discussions=C2=A0to get started.</div><div><br></div><div>Another =
way would be to have a monthly/quarterly wishlist gathering on the mailing =
list.=C2=A0 That way we have some dedicated time to discuss issues of the d=
ay, and put them together into a markdown document (like a per project vers=
ion of the security group wishlist=C2=A0<a href=3D"https://github.com/openb=
mc/openbmc/wiki/Security-working-group#security-feature-wish-list">https://=
github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wis=
h-list</a>)</div><div><br></div><div>Maybe this is already happening, and I=
 just haven&#39;t noticed it.=C2=A0 Anywho, hope you are all doing well.</d=
iv><div><br></div><div>Cheers,</div><div>Richard</div></div>

--000000000000cf70f005a23e1a46--
