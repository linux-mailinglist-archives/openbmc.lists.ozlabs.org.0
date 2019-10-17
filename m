Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33645DA292
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 02:08:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tqJ11ZsjzDr7h
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 11:08:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::532;
 helo=mail-ed1-x532.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="R6PY7C5r"; 
 dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tqH96YTDzDqXs
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 11:07:31 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id f20so206654edv.8
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 17:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xDO2rF1IRiQCoquVEeY/Set8MyUtaDG7XPZ0wHz8eiA=;
 b=R6PY7C5rS+KAg9KA677ZLmhvmUJoqd5MY9XHWXG10fV3Z8QKA9NFAnw/xysUUYHWev
 awxp3bBU6c13M3ttz2v6c7PAb5sC3AJcc1NYRRVJYmkPTZv7fLbEMqRrFwodn8it+LDe
 FfX8EW4SUg0WqBt/4+TTmqbqMIlLhMReVBFyfeEa+YubxJfZoJvBVLzmhwSCVipvNtiI
 9UFV8aONHewtrqvTbWBu4d9rezQFMmhasZ75ohOPAc8E37szyMFHOl+/bNsNwv6Nkzke
 SZC8LSmlJLizN568Aoad5x47mQtTdGZqmb7kSUP0ucEXGC3vTZq6ZRZdqDOaqgL2+pg0
 NkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xDO2rF1IRiQCoquVEeY/Set8MyUtaDG7XPZ0wHz8eiA=;
 b=oLxX2bVuVndkBfKSGR0j8mpTp8+swUZc0QKuN42ZzUPV/fblsmNOXS5NeMMzp5radA
 +SnTpCKzwlrlULSHyWgq8rGX2LWmgOPBW7ULBlXEwDkosPSh7etGYHigWIPAIOauge8L
 Kvz5mNl/JUO8zGGRTjcJCqnC9jOh86VSfGJs9uf/HO/Y/296mQl76we7XEbFKOnkSfKK
 EyK9IpZrs0M+v+X1kdAX99QwrtHT+nIE7CWcO5QnVCNItBMHVxeFBTcFXgmoqYhjmhTX
 UkX5WnHtHlRsBP1NWdBtNzH9hox0G0/cUPsiZU3fipIKtHFT6ZuQnZUj3ZqAo7WtfzYj
 ZHDA==
X-Gm-Message-State: APjAAAV6BjQl2AXJ0tbYOj8GVlU+tALj/WxRQm5FJ/XteBoAHqLOwoqi
 u5wkXhJHB88KQ7j+1ocfZz7aLRqAn7UNnC5BmiZsZl0xLn8=
X-Google-Smtp-Source: APXvYqy9ohCmsW8Fr5M0dAmwSQM2ypdDBvcOaNZWCKw8tdJpBIB0133vwI1yYfg4lSdMbbLkhZIOXdsPA5CB+RIZtqs=
X-Received: by 2002:a17:906:1942:: with SMTP id b2mr987117eje.36.1571270839795; 
 Wed, 16 Oct 2019 17:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <33bfd87f4c3345d28be4e8c1d64f1437@SCL-EXCHMB-13.phoenix.com>
 <CABoTLcSgz-_LJ3tZ70-WenCqWqv3Kknfsbe1qstKmoTiP2wqQA@mail.gmail.com>
 <6ed83860-c187-4da8-9f2d-17deef391dae@www.fastmail.com>
In-Reply-To: <6ed83860-c187-4da8-9f2d-17deef391dae@www.fastmail.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 16 Oct 2019 20:07:03 -0400
Message-ID: <CABoTLcQ3SbDbPwXkOqsDgy0F23fJ4yfK3t-eYE_DUw63mbEFaA@mail.gmail.com>
Subject: Re: Recommendations for development platforms for the ASPEED AST2500
 & AST2600?
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="00000000000041073d05951000f2"
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
Cc: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000041073d05951000f2
Content-Type: text/plain; charset="UTF-8"

It's basically just the DTS. TYAN tried to upstream it and got a number of
good review responses. However, I didn't have the time (yet) to go back and
work on them.

I'll see that I do that soon.

Thanks for offering to help! I'll get back to you for feedback.

Oskar.

On Wed, Oct 16, 2019 at 7:19 PM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Thu, 17 Oct 2019, at 02:14, Oskar Senft wrote:
> > Hi Bruce
> >
> > I've had good experience with the TYAN S7106. We still need to upstream
> > the DTS for the board, though (sorry, upstreaming is hard).
>
> How can we help with upstreaming your changes? Its better that they're
> there
> than out of tree / inaccessible to others.
>
> Andrew
>

--00000000000041073d05951000f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">It&#39;s basically just the DTS. TYAN tri=
ed to upstream it and got a number of good review responses. However, I did=
n&#39;t have the time (yet) to go back and work on them.</div><div dir=3D"l=
tr"><br></div><div dir=3D"ltr">I&#39;ll see that I do that soon.=C2=A0<br><=
/div><div dir=3D"ltr"><br></div><div>Thanks for offering to help! I&#39;ll =
get back to you for feedback.</div><div><br></div><div>Oskar.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 16=
, 2019 at 7:19 PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">and=
rew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
<br>
On Thu, 17 Oct 2019, at 02:14, Oskar Senft wrote:<br>
&gt; Hi Bruce<br>
&gt; <br>
&gt; I&#39;ve had good experience with the TYAN S7106. We still need to ups=
tream <br>
&gt; the DTS for the board, though (sorry, upstreaming is hard).<br>
<br>
How can we help with upstreaming your changes? Its better that they&#39;re =
there<br>
than out of tree / inaccessible to others.<br>
<br>
Andrew<br>
</blockquote></div></div>

--00000000000041073d05951000f2--
