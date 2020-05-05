Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5C1C4BD7
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 04:14:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GNZH0qMqzDqZT
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 12:13:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=r7J2hhPb; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GNYd6j3fzDqWM
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 12:13:24 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id w14so54866lfk.3
 for <openbmc@lists.ozlabs.org>; Mon, 04 May 2020 19:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mj+Dy2YQh6puUejU7yNIG+RQzPqyAia3v+BwvUPorj0=;
 b=r7J2hhPbYxC/43frmovZ1ozRe8SBydtI06fXwwaVIzJdoWDeFSZQwTW6n87ppU8/I+
 GyQErnFLKsgovyU2oL7+xp0I7i9fWn4IafvDbseFPgf7uMVgHORBrLx4GqpH0km7c/ot
 /j5FjHYqrYDt0IZE+aUTk1Sf2+k2ZtCHEIuRUBq7T9uN0aUlOcUDdfFUyUiJSSztBfDI
 sy6KOSMa27rmcNNlXFeVWxUzoTuAsXFCvWm7lFxMIOFMzjNJniUaE+6dgZM2Hdw8iCPB
 Y+7IADMyruz2k8gCrY0Fsg4iRlRqqMv2OeAXAM4PiAqJaqKNrAgQugcS+Oxij8tZhtf8
 PPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mj+Dy2YQh6puUejU7yNIG+RQzPqyAia3v+BwvUPorj0=;
 b=NfnZUyGtTrWPXP62Aky7E9cQ7rixqyfBb1vLr0Y1VC0z1viPuA8XboXXZiQI86ZBQt
 yM7uGDZ2MQqQyNLjBUbZ7xqsO8EIWa+kBLGzbSfSdu00GOmoK+4yAS2cHmGW3CfbbPBG
 ZM6xrqs8d8g1lO7hlWPqJzIeAuQJh2wAlttmVLb5vcOxGWYPfLPilRvShLyAvz+QAkoZ
 dnoVLVNnTS16vzUnY9nvix+GQAAQq+X5o1Yp9hagwFpIlE+9WObhJ0oHhyxYzNu8gyth
 L6Mh5JeMKi+afL6jSWdFvZcj1Ct/VIDiPOuOkApH6fgLEA+NRHAY3jou6TKTJCKUBAFq
 krTA==
X-Gm-Message-State: AGi0Pua8gkhnGmPBdr0dvr78LX+0Ug1OBqGvombjftOs58waHPDxpXFq
 oEP6Ru71G3zYxV4lRnnuhZukW5VH8wswbLhkYsA+y2jw
X-Google-Smtp-Source: APiQypLKYHcTKbZqcP6aUozKdSvQZ7cNHQzinvAdeVdbXVBtDMR8o7pjDisvCmH8k7DAYFp+rg2iWavpCb4QV5wlNG4=
X-Received: by 2002:a19:4285:: with SMTP id p127mr71559lfa.46.1588644799659;
 Mon, 04 May 2020 19:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAH1kD+Y1u0CHZ_6PRV8GKmzSq49sg24QD1X99KZRZK=GN-Aedw@mail.gmail.com>
 <11791.1588627267@localhost>
 <CAH1kD+bKnGtca3SzAyaSwz4pQHG9EMWJfKHLtGHXMh=_jOTCtw@mail.gmail.com>
 <26047.1588638024@localhost>
In-Reply-To: <26047.1588638024@localhost>
From: Richard Hanley <rhanley@google.com>
Date: Mon, 4 May 2020 19:13:08 -0700
Message-ID: <CAH1kD+ZQ8TmHvZoEX2k7vfbA=cT2m5of+qeX64dGrhAyLdoMBQ@mail.gmail.com>
Subject: Re: Survey for Certificate Management Needs
To: Michael Richardson <mcr@sandelman.ca>
Content-Type: multipart/alternative; boundary="000000000000f5868d05a4dd30f4"
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

--000000000000f5868d05a4dd30f4
Content-Type: text/plain; charset="UTF-8"

On Mon, May 4, 2020 at 5:20 PM Michael Richardson <mcr@sandelman.ca> wrote:

>
> Richard Hanley <rhanley@google.com> wrote:
>     > I think that CRL becomes more of an issue when communication is
>     > mutually authenticated.  If a client is given a certificate from the
>     > CA, then there should be a way for that client's cert to be revoked
> on
>     > a BMC.
>
> Again, it's the CA that issues the CRL.
> If you want to revoke authorization, then you need to do that.
> I'm unware of client-certificate based authorization in bmcweb at this
> time.
>

There is some support for it in bmcweb. Intel added it at the beginning of
the year.  We've just started looking into it, so I don't have a great idea
of what is and isn't implemented yet.


>
> If your authorization process if just "signed by CA foo"
> (i.e. authentication), then you would have to rely on the CA to revoke the
> certificate.
>
> If your authorization process consists of a list of pinned EE certificates,
> then you could delete/mark-inactive the broken certificate.
>
> If you combine both methods, then in theory, you could have a "anything
> signed by CA foo, unless it is on blacklist X".  But that's not a CRL,
> that's
> a blacklist.
>
>
Perhaps I mispoke here, but let's imagine a situation where a machine is
suspected to have been tampered with.  In that case the machine could be
re-imaged and have the CA sign a new cert with the same username.  The CA
would then need to deploy the CRL to any servers (BMCs in this case) that
interacted with that user. In practice (for us at least), that CA doesn't
really know what users are authorized where, so the CRL is widely
distributed.

That's also one of the reasons I like RBAC, and other systems like it. They
do a really good job at cleanly separating authorization and
authentication.

> --
> ]               Never tell me the odds!                 | ipv6 mesh
> networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT
> architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on
> rails    [
>
>

--000000000000f5868d05a4dd30f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 4, 2020 at 5:20 PM Michae=
l Richardson &lt;<a href=3D"mailto:mcr@sandelman.ca">mcr@sandelman.ca</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Richard Hanley &lt;<a href=3D"mailto:rhanley@google.com" target=3D"_blank">=
rhanley@google.com</a>&gt; wrote:<br>
=C2=A0 =C2=A0 &gt; I think that CRL becomes more of an issue when communica=
tion is<br>
=C2=A0 =C2=A0 &gt; mutually authenticated.=C2=A0 If a client is given a cer=
tificate from the<br>
=C2=A0 =C2=A0 &gt; CA, then there should be a way for that client&#39;s cer=
t to be revoked on<br>
=C2=A0 =C2=A0 &gt; a BMC.<br>
<br>
Again, it&#39;s the CA that issues the CRL.<br>
If you want to revoke authorization, then you need to do that.<br>
I&#39;m unware of client-certificate based authorization in bmcweb at this =
time.<br></blockquote><div><br></div><div>There is some support for it in b=
mcweb. Intel added it at the beginning of the year.=C2=A0 We&#39;ve just st=
arted looking into it, so I don&#39;t have a great idea of what is and isn&=
#39;t implemented yet.</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
If your authorization process if just &quot;signed by CA foo&quot;<br>
(i.e. authentication), then you would have to rely on the CA to revoke the<=
br>
certificate.<br>
<br>
If your authorization process consists of a list of pinned EE certificates,=
<br>
then you could delete/mark-inactive the broken certificate.<br>
<br>
If you combine both methods, then in theory, you could have a &quot;anythin=
g<br>
signed by CA foo, unless it is on blacklist X&quot;.=C2=A0 But that&#39;s n=
ot a CRL, that&#39;s<br>
a blacklist.<br>
<br></blockquote><div><br></div><div>Perhaps I mispoke=C2=A0here, but let&#=
39;s imagine a situation where a machine is suspected to have been tampered=
 with.=C2=A0 In that case the machine could be re-imaged and have the CA si=
gn a new cert with the same username.=C2=A0 The CA would then need to deplo=
y the CRL to any servers (BMCs in this case) that interacted with that user=
. In practice (for us at least), that CA doesn&#39;t really know what users=
 are authorized where, so the CRL is widely distributed.</div><div><br></di=
v><div>That&#39;s also one of the reasons I like RBAC, and other systems li=
ke it. They do a really good job at cleanly separating=C2=A0authorization a=
nd authentication.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
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
</blockquote></div></div>

--000000000000f5868d05a4dd30f4--
