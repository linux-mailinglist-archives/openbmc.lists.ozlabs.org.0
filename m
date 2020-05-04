Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E051C4987
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 00:21:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GHPX5NQZzDqXK
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 08:21:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=rICIrqgw; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GHNJ66ZNzDqQ8
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 08:19:59 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id z22so11031510lfd.0
 for <openbmc@lists.ozlabs.org>; Mon, 04 May 2020 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kRaFpm9DvV7AFTl6o0t+vR2FQ1CygP2+Jl9Zbw/Gb/o=;
 b=rICIrqgwRIRDJS1BfzBEbolgZQXyj/Zk7InuMUrPzw2Js09zHi5TTCZKF5arL4i9Ny
 i2vBQM5likDkSyXe3UAvEWGe7R7qfMVEeApBxSdaXXKjycS3K9DGYYI/9gvBABKmHn9u
 ORAyJ636pYIdkRO+MGZcbb+X/N8SCH2gPowKmEjPFvYVX2qYqXKdHxv9hejWdpydo/QL
 1Z8Cyhre8lkBksUg5Z8Wbj5ngHpCfa/31qR69IRB4IhawQZEDCxwmrSaLdjJAjG3thtX
 HFT8rbLHh/UD87h7qcVK7JSpvl1ZUrN3J6l9Ugp2e5SCv2wcklSkNQhDkXu+74aqM+Z3
 byzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kRaFpm9DvV7AFTl6o0t+vR2FQ1CygP2+Jl9Zbw/Gb/o=;
 b=B7EdfGkGUIdQlqXYme951HW6hoIj6lNxq6wmdC0lLKIEHiYd3UEoomJBtke3AZjcqC
 XHKdrF3zZA5EO/DHL25tmQEx8Xd1GyJ1QRlL88cuyfOqgpaH+8+khqOUnlaUqxjDCoQh
 HrHrOi0sxqw1ojOkZBmc+soM+yPnOgAGTTxPhaSboO8C1P/xzCBPWVvG9DogrXEbnRiD
 trZg4kPJIka1pQiraIKqyXNgnadfpQ82/hkOmfkQEFZl4MPBvq59E4+vwnJ4mfio31bR
 52iQqXoN7YM0dJ8VOrZvRcYCo2oHQ43UDs6AYwOAYu40dSp3b/+Kabh8aZ8mtOxDh2Jk
 RphA==
X-Gm-Message-State: AGi0PuaPd0ozRS/Mv3gPd3atMjFvuDFhZirgQsoXe/V8DGTV2eeMg3Ie
 /FGSpCzlBM2FOTVokGXOTDYOr3LGF+OFp969C0iS/N+I
X-Google-Smtp-Source: APiQypLtr83UUr7iwjWSp2PLkzWbukdAG7ek7Tynyq2M0ctTTru0efb6Ym/T9EinI+J4vOsKtcIcbkxbmWR9RQWQGUk=
X-Received: by 2002:a19:e013:: with SMTP id x19mr2506986lfg.49.1588630794230; 
 Mon, 04 May 2020 15:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAH1kD+Y1u0CHZ_6PRV8GKmzSq49sg24QD1X99KZRZK=GN-Aedw@mail.gmail.com>
 <11791.1588627267@localhost>
In-Reply-To: <11791.1588627267@localhost>
From: Richard Hanley <rhanley@google.com>
Date: Mon, 4 May 2020 15:19:42 -0700
Message-ID: <CAH1kD+bKnGtca3SzAyaSwz4pQHG9EMWJfKHLtGHXMh=_jOTCtw@mail.gmail.com>
Subject: Re: Survey for Certificate Management Needs
To: Michael Richardson <mcr@sandelman.ca>
Content-Type: multipart/alternative; boundary="0000000000002bb95905a4d9eef3"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002bb95905a4d9eef3
Content-Type: text/plain; charset="UTF-8"

On Mon, May 4, 2020 at 2:21 PM Michael Richardson <mcr@sandelman.ca> wrote:

> Richard Hanley <rhanley@google.com> wrote:
>     > 3) Finally we need to
>     > support revocations lists. AFIAK, there is no support for this today.
>
> What are the certificates you speak of for?
> If you are talking about HTTPs end-point certificates for bmcweb, then
> there
> is nothing to do for CRLs, because CRLs aren't a function of the HTTPS
> End-Entity certificate you are worried about.
>
> They are provided by the CA, and it's a problem of the HTTP browser to
> validate.
>
So I don't understand your CRL point.
>
>
I think that CRL becomes more of an issue when communication is
mutually authenticated.  If a client is given a certificate from the CA,
then there should be a way for that client's cert to be revoked on a BMC.


>     > Finally, I'm expecting we will need an out of band mechanism to talk
>     > with hardware root of trust (e.g. OpenTitan https://opentitan.org/).
>
> Possibly.
>
> --
> ]               Never tell me the odds!                 | ipv6 mesh
> networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT
> architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on
> rails    [
>
>
>

--0000000000002bb95905a4d9eef3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, May 4, 2020 at 2:21 PM Michael Ri=
chardson &lt;<a href=3D"mailto:mcr@sandelman.ca">mcr@sandelman.ca</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Richard Ha=
nley &lt;<a href=3D"mailto:rhanley@google.com" target=3D"_blank">rhanley@go=
ogle.com</a>&gt; wrote:<br>
=C2=A0 =C2=A0 &gt; 3) Finally we need to<br>
=C2=A0 =C2=A0 &gt; support revocations lists. AFIAK, there is no support fo=
r this today.<br>
<br>
What are the certificates you speak of for?<br>
If you are talking about HTTPs end-point certificates for bmcweb, then ther=
e<br>
is nothing to do for CRLs, because CRLs aren&#39;t a function of the HTTPS<=
br>
End-Entity certificate you are worried about.<br>
<br>
They are provided by the CA, and it&#39;s a problem of the HTTP browser to<=
br>
validate.<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
So I don&#39;t understand your CRL point.<br>
<br></blockquote><div><br></div><div>I think that CRL becomes more of an is=
sue when communication is mutually=C2=A0authenticated.=C2=A0 If a client is=
 given a certificate from the CA, then there should be a way for that clien=
t&#39;s cert to be revoked on a BMC.=C2=A0=C2=A0</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 &gt; Finally, I&#39;m expecting we will need an out of band m=
echanism to talk<br>
=C2=A0 =C2=A0 &gt; with hardware root of trust (e.g. OpenTitan <a href=3D"h=
ttps://opentitan.org/" rel=3D"noreferrer" target=3D"_blank">https://opentit=
an.org/</a>).<br>
<br>
Possibly.<br>
<br>
--<br>
]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Never tell me the o=
dds!=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ipv6 me=
sh networks [<br>
]=C2=A0 =C2=A0Michael Richardson, Sandelman Software Works=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 IoT architect=C2=A0 =C2=A0[<br>
]=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:mcr@sandelman.ca" target=3D"_blank">=
mcr@sandelman.ca</a>=C2=A0 <a href=3D"http://www.sandelman.ca/" rel=3D"nore=
ferrer" target=3D"_blank">http://www.sandelman.ca/</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0ruby on rails=C2=A0 =C2=A0 [<br>
<br>
<br>
</blockquote></div></div>

--0000000000002bb95905a4d9eef3--
