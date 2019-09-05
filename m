Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45005AA623
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 16:42:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PNhX20wjzDqVB
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 00:42:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fS0Qwwm4"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PNg21QbdzDqPM
 for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2019 00:41:34 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id p2so1759710edx.11
 for <openbmc@lists.ozlabs.org>; Thu, 05 Sep 2019 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHWtT5iV/isQMi999bxAmxXT3ZJW1HcrRcSR8kXm7Y0=;
 b=fS0Qwwm4XcPrR56xCzeN/8RQuZjS1xxcyMXZ61KYaNiK2ngdi5RTaUggYoM5QqWqRJ
 czAxSk7rQuHXVfux40Pc5ZkwMzCXpe3thOXiq0hODCUTB3y8blkVDITTaY+bgXIS4CtK
 kpNWyVRoTRQ22ha0/ElfCuxwn0t22lq4cGA//YfB2eVgnCoDwptI1pNQKEdvphCypOkO
 eNjVHDRovLZ429FrN0md7ijb1wwPhFwuuljZdDxhNqA/dmTVnGY4wSwAugjTxYfY2Yi1
 sXfF9XpAOigqWlIJCJ9OxtO7qx47v/EcnAHYEK8sAynr3jJsa2TMk/Cxz8kSDjo9bm7o
 GfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHWtT5iV/isQMi999bxAmxXT3ZJW1HcrRcSR8kXm7Y0=;
 b=duq7OTCWwpK/P3/Enc/LD/AUdrLvaC30UmGHrZFVFwxB91h3r/asK/qgi04jlT7Ry4
 CgSoDjDcGEGguw/rUp7kXhcngAhuwNyuBhbIOMaT4/02K/bevh7FiLlq/lDU9rPAnLT6
 xK+Rg9yl+gPhAQIL68zQ2FsCn4uKXMkd9l7MarSwESGVLkXAnJMQUGEvUvNbGgMxLzUJ
 ygF/F4yy3kw4xTKOHLo2bdNKbuPebDcAymvI6zbScgH35f+VeAyw3t0OFu83IXtjLwi6
 b4ULyaP9a/E6S1uWH1Cn1pWH+LZpiKMNqvXbcqaBYw6oOPCL3wpNmr6plgTKXSxx8lhr
 VcaQ==
X-Gm-Message-State: APjAAAXPcjwHTs0cxRUOvv5OMLwA/REkVpHXxcuK5Eq20JAWxOf3Hu4y
 4+GlyV2VPU3dT5sexAZXhNv5lsjtODlpyspXJbeo3g==
X-Google-Smtp-Source: APXvYqwqfiJYjqeVQyGNwDRAslc051uOxKZP9nnN2i+wIun4idVWyMnLkULGI7ok6m5nFZaY/Nqm9fskhj7xxUMgTgM=
X-Received: by 2002:a17:906:583:: with SMTP id 3mr3076608ejn.74.1567694489686; 
 Thu, 05 Sep 2019 07:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190731013404.243755-1-osk@google.com>
 <20190731013404.243755-2-osk@google.com>
 <b4670171-e161-4d7a-91dc-a1e5a95f7dbc@www.fastmail.com>
 <f1d2757119807a48833eba193cd9b443dde0ccba.camel@ozlabs.org>
In-Reply-To: <f1d2757119807a48833eba193cd9b443dde0ccba.camel@ozlabs.org>
From: Oskar Senft <osk@google.com>
Date: Thu, 5 Sep 2019 10:41:13 -0400
Message-ID: <CABoTLcTR-iNEftk8ThnyBKn0qD2+jTAOFmZAdGciVXj6KJJcww@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: serial: 8250: Add documentation for
 espi-enabled.
To: Jeremy Kerr <jk@ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="0000000000002d4d2f0591cf514a"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002d4d2f0591cf514a
Content-Type: text/plain; charset="UTF-8"

Hi Andrew and Jeremy

Thanks for both your input, that was helpful. I'm sorry it took me so long
to get back to this. I hope it's in better shape now.

> Given it's ASPEED-specific I expect you should use a vendor prefix for the
> > property, e.g. aspeed,espi-enabled.
>
That was a very good point.


> > However, as I understand it you want to determine what polarity the SIRQ
> > should be regardless of which of eSPI or LPC are enabled, so I don't
> think
> > the property name should be an explicit statement about eSPI. Maybe
> > "aspeed,sirq-polarity-sense"?
>
> Yep, +1 on Andrew's comments here. This property isn't an indication on
> whether espi is enabled, but a method to detect it.
>
I agree. I was so focused on functionality that I didn't look at this with
a wider view.

I'll send v3 of the patch that contains appropriate changes. I'll also
include further lists and individuals to get OKs as needed.

Thanks
Oskar.

--0000000000002d4d2f0591cf514a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Andrew and Jeremy<div><br></div><div>T=
hanks for both your input, that was helpful. I&#39;m sorry it took me so lo=
ng to get back to this. I hope it&#39;s in better shape now.</div><div><br>=
</div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">&gt; Given it&#39;s ASPEED-specific I expect you should use a=
 vendor prefix for the<br>
&gt; property, e.g. aspeed,espi-enabled.<br></blockquote><div>That was a ve=
ry good point.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">&gt; However, as I understand it you want to determine what pol=
arity the SIRQ<br>
&gt; should be regardless of which of eSPI or LPC are enabled, so I don&#39=
;t think<br>
&gt; the property name should be an explicit statement about eSPI. Maybe<br=
>
&gt; &quot;aspeed,sirq-polarity-sense&quot;?<br>
<br>
Yep, +1 on Andrew&#39;s comments here. This property isn&#39;t an indicatio=
n on<br>
whether espi is enabled, but a method to detect it.<br></blockquote><div>I =
agree. I was so focused on functionality that I didn&#39;t look at this wit=
h a wider view.</div><div><br></div><div>I&#39;ll send v3 of the patch that=
 contains appropriate changes. I&#39;ll also include further lists and indi=
viduals to get OKs as needed.</div><div><br></div><div>Thanks</div><div>Osk=
ar.</div></div></div>

--0000000000002d4d2f0591cf514a--
