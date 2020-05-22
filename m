Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 039261DF1B3
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 00:16:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TLRW1v54zDqyj
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 08:16:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=kIg1xAkh; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TLQh58f8zDqxk
 for <openbmc@lists.ozlabs.org>; Sat, 23 May 2020 08:15:24 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 82so7386464lfh.2
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 15:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W63q4TU+3QbgX3XX0ufj7B/q4965NOtN353RRKxGlGo=;
 b=kIg1xAkhTLxZSEUAg5NDqxVnJthbrFhPNcjQnhvQwSpPS8K1n6BFhT21Bm04dj+EFl
 n0LMyFp/8GeHSoaoYksHIU9VvwTbLrwWVWf3C7p4FQirbbPkYJCsXg3LqjOFhslC9Job
 1p/7Vl4Y4G53kFH/mkz9Rpgh2PNpUu4R4M36nsic1NHDVla4x2lx5x/oqmWpKkRKR3AB
 OGO1sb4sQrUVD69RkJ3T0PVgPqf9c6TMPCByhchunKILxX0PVtHe5u8bad9/YZ3n23NB
 r5yaNE/4BfpEISEw8rnIiHA4a6mW7NmKHq6LMKxMjvgxuwYTxZNrUrZke0E3NNVALklj
 LQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W63q4TU+3QbgX3XX0ufj7B/q4965NOtN353RRKxGlGo=;
 b=DDzuYnfZ86mxKy0ud0/Ib59MITlHriWK+DzeAc54aJUW/CQx3R/rbYw43taAmGO2jr
 g4gwgwqe/YsdEFvS5n2ffnBAL5QjLpz9hcuSZkLWgf2T2Enb6trMmaO27MYnRg0nC+k/
 Al36sYVWxNXGtdrSxcu58FIylGj9bbW/GX7wNzRMAISgEfKx6ijFt5as+LH1pVVdXElH
 HAVAFOKMnFKNMBfXytHvPj6BqiBig0ETqrIZm7AbORs+VERiqnir+ymGHhtzQThhorbx
 dzfysf8KHwQHynHBObhQlSOgZJcG0Tt85y3NjvTFkUUKYe0BqbKrY/l6DhCZW+tlxCVN
 ZxWQ==
X-Gm-Message-State: AOAM530X+bwwfRqDBoVptBfMh/TI0M9lQfM7/odGoEFA5PAuk9KZ16v7
 XUKd9T6thzI/IKQtlcp+wcmygcnpwF6ih0G2lpHXWA==
X-Google-Smtp-Source: ABdhPJz6weqcP31OI8IXO4ew2dzYDhP7cj+PVIPImTDSVfrkiKs3Nei4CQnFzc7kqv2JPw6cRCLs+kNLy/g0fdqqzoo=
X-Received: by 2002:ac2:55b2:: with SMTP id y18mr8471410lfg.55.1590185715721; 
 Fri, 22 May 2020 15:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <bbd0955547ff46728528fd14d52fb04d@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <bbd0955547ff46728528fd14d52fb04d@SCL-EXCHMB-13.phoenix.com>
From: William Kennington <wak@google.com>
Date: Fri, 22 May 2020 15:15:04 -0700
Message-ID: <CAPnigKn3TOKhMTimsigFGmA0axAR9VrrrFhYuRNVFuxnkq1XVQ@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash state recovery
To: Patrick Voelker <Patrick_Voelker@phoenix.com>
Content-Type: multipart/alternative; boundary="000000000000b6c75005a643f6cd"
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
Cc: Patrick Venture <venture@google.com>,
 "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b6c75005a643f6cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was working on a change to fix this a couple of weeks ago and implement
the needed expiry / cancellation mechanisms to make everything happy. Right
now the easiest thing you can is reset the BMC or just the ipmi daemon.

On Fri, May 22, 2020 at 3:06 PM Patrick Voelker <Patrick_Voelker@phoenix.co=
m>
wrote:

> When running burn_my_bmc, if I exit the program during image upload with
> ctrl-c, it seems that the bmc gets left in a state that is difficult to
> recover from.
>
>
>
> When attempting to run the update again I can see that the
> /flash/active/image blob is present.  burn_my_bmc opens the cleanup blob,
> commits it, and then closes it but the state doesn=E2=80=99t change. I do=
n=E2=80=99t have
> the cleanup-delete option enabled but it doesn=E2=80=99t look like that c=
leans up
> the state anyhow.
>
>
>
> Internally, it looks like I need to get to abortProcess() but to do that =
I
> need to close the current session but I don=E2=80=99t have a way to obtai=
n the
> sessionID after the fact.  Also the stale session doesn=E2=80=99t seem to=
 expire
> (as mentioned in the readme.md) and I can=E2=80=99t find the support for =
that in
> the code.
>
>
>
> Can you give me a pointer on the best known way to recover from this
> scenario without rebooting the BMC?
>
>
>

--000000000000b6c75005a643f6cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was working on a change to fix this a couple of weeks ag=
o and implement the needed expiry / cancellation mechanisms to make everyth=
ing happy. Right now the easiest thing you can is reset the BMC or just the=
 ipmi daemon.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, May 22, 2020 at 3:06 PM Patrick Voelker &lt;<a href=3D=
"mailto:Patrick_Voelker@phoenix.com">Patrick_Voelker@phoenix.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_6801074455345089409WordSection1">
<p class=3D"MsoNormal">When running burn_my_bmc, if I exit the program duri=
ng image upload with ctrl-c, it seems that the bmc gets left in a state tha=
t is difficult to recover from.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">When attempting to run the update again I can see th=
at the /flash/active/image blob is present.=C2=A0 burn_my_bmc opens the cle=
anup blob, commits it, and then closes it but the state doesn=E2=80=99t cha=
nge. I don=E2=80=99t have the cleanup-delete option enabled
 but it doesn=E2=80=99t look like that cleans up the state anyhow.<u></u><u=
></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Internally, it looks like I need to get to abortProc=
ess() but to do that I need to close the current session but I don=E2=80=99=
t have a way to obtain the sessionID after the fact.=C2=A0 Also the stale s=
ession doesn=E2=80=99t seem to expire (as mentioned in
 the readme.md) and I can=E2=80=99t find the support for that in the code. =
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Can you give me a pointer on the best known way to r=
ecover from this scenario without rebooting the BMC?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</blockquote></div>

--000000000000b6c75005a643f6cd--
