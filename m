Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2EB289BA7
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 00:14:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7Mn15LYwzDr4L
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 09:14:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2f;
 helo=mail-yb1-xb2f.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=g4EG/tb5; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7MSr6dMLzDqHx
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 09:00:26 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id c3so8374712ybl.0
 for <openbmc@lists.ozlabs.org>; Fri, 09 Oct 2020 15:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3713Am9EXECAlqKUhmbW2LlmIVE2s23voMuAzyiNIxs=;
 b=g4EG/tb5rSGWQUJXTNNffdJp7giAF8zSimP4rxJlFlM94rFc5X9nbKY+XfAvmeN9EA
 OY7J9qbVB1ietWnNt5nZBd4AYcdndsDYa6dVJIt0cURaIK7qe3BW9k5L4dFy8265mDem
 bdoqJIwZfMUNluez2zxBA7301SVNhvN1fAK+x2v+qmjbDiKWzYVc6nkdufUxZgqIAzYn
 sRanVkGzJVEip+aprbtHgVB8tAQDCUIyGoFsGHcsm6TaONj+sc8oVJsb6qHCkenNxsZY
 7teEILrOJOhqQxqY9Q5TWEzaHV+3N6yOqsar23+Yk2UUiH/2I3CwqQhgc5OVBbiUIGyh
 O94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3713Am9EXECAlqKUhmbW2LlmIVE2s23voMuAzyiNIxs=;
 b=bzB2u5m50mCMvtZquzjBm6jPMZ/E52A0AafHEZZyiHAs/OmD0IDoSrZDHhASvjUsA1
 1+0ziu3YGb83IA0bXPITXqbQsGPdjMfC37JPpru2Y1BoA1/22XQCxmqRB4AR/T4eCcGi
 lxLof1Cqg3KHzI4ycEbf2IV3bY3pKmKnyvW3QUVXyJyWUGCb0Cc59JR0JQeGqjY+5VeZ
 V9X+PQYiCZtgtqZ7sCg7nmgoQb6GCxvNn6zjTdETt7OnyvrD+ZoLZs/km8dI243qtTwD
 AACuDlnaFEi3IzqrZgkHaT/SL+ZlQYTAYbKZeQXEptxQq/I40g/eQEz3UaLTHh5xDYK+
 g5bg==
X-Gm-Message-State: AOAM533cqxm+O7vm+wI8z8C3iESuJ217fimn4XMF42Yu80EkI5TBqXdH
 P624q2xzz3ViMk/+DiNh4VCv7J5/1nVcpnhbJ1dTSA==
X-Google-Smtp-Source: ABdhPJwFF1wIoB1Q1KLxPNDI9ZTVBuAOUZPtYXGT1R6NtoVP5C5jDu7VxVheEMaySOaAhvYu/tQVKXz8eMop7QeEgyY=
X-Received: by 2002:a25:cb88:: with SMTP id
 b130mr20663675ybg.521.1602280822420; 
 Fri, 09 Oct 2020 15:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
In-Reply-To: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 9 Oct 2020 14:59:46 -0700
Message-ID: <CADfYTpEjyQG_k2RpfDK=Q-S1P5H7kW7hZp8B7A9HfVL--ahjrA@mail.gmail.com>
Subject: Re: Heading out
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000040ba5a05b14413a3"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000040ba5a05b14413a3
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 7, 2020 at 12:49 PM James Feist <james.feist@linux.intel.com>
wrote:

> Hi everyone,
>
> This will be my last week on the OpenBMC project. I'll be moving on to
> something unrelated to OpenBMC. It's been great working with you all.
> All the repos I maintain have additional maintainers who will continue
> to maintain those projects. I'll begin removing myself from the
> maintainers lists shortly.
>
> Best of luck with the project,
>
> -James
>
> feistjj@gmail.com
>

Good luck in your next role!

--00000000000040ba5a05b14413a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 7, 2020 at 12:49 PM James=
 Feist &lt;<a href=3D"mailto:james.feist@linux.intel.com">james.feist@linux=
.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi everyone,<br>
<br>
This will be my last week on the OpenBMC project. I&#39;ll be moving on to =
<br>
something unrelated to OpenBMC. It&#39;s been great working with you all. <=
br>
All the repos I maintain have additional maintainers who will continue <br>
to maintain those projects. I&#39;ll begin removing myself from the <br>
maintainers lists shortly.<br>
<br>
Best of luck with the project,<br>
<br>
-James<br>
<br>
<a href=3D"mailto:feistjj@gmail.com" target=3D"_blank">feistjj@gmail.com</a=
><br>
</blockquote></div><br clear=3D"all"><div>Good luck in your next role!<br><=
/div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><span><div=
 dir=3D"ltr" style=3D"margin-left:0pt" align=3D"left"></div></span></div></=
div></div>

--00000000000040ba5a05b14413a3--
