Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CCC6FC72D
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 14:55:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFyms0XBfz3fKl
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 22:55:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ejZtosfO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ejZtosfO;
	dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFymD44f1z3c8v
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 22:54:35 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-3f38a9918d1so132011cf.1
        for <openbmc@lists.ozlabs.org>; Tue, 09 May 2023 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683636871; x=1686228871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HA0CMCa5SV3ayaRNbP6nW7ZgvQnMFsFoF0GJi+3G1rU=;
        b=ejZtosfOio8zfVWxU9sGWfF7vf02dvJe13ybxh51kdi123P6VV85v4W43CeHWUY9Rn
         EADVP8BNgjZXrGJvNW7dLcVh0wyNJbW/f/KKgw7keKRzGLh+FwJWXQry0yjsLkEBsBcS
         S1M4VhSvipnZm/MXU//k8xLG8vLk1lxuxZvJTKQPrPSM9ayJDLrZVCaaHjFZQNegiRo9
         0MOzRdFfNMSOUqY/3KVtFwcBr+yHLU9+VTYqNPtv8uOmN8HVMclvBIq8HyKNEFy6/CD6
         1XOYwg7NmnisDpsiDSquLTssgEUx3aThScQyr2zPlqaUajb0JNeLGgTGGzLANzEeTIiZ
         6SPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683636871; x=1686228871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HA0CMCa5SV3ayaRNbP6nW7ZgvQnMFsFoF0GJi+3G1rU=;
        b=RzAmgl66v+nXraoJRqK01LTRf1sjsNpSuZeSbmo7BQOhUX3e6la0p2bayNxJb3WnxW
         SMVmBYBzXRRLKzujmBKvtHZ/aG1DFn20UK5M9QT1n2caEpf27sddW+K/ALYNZRNzi1AG
         a0zeUHSYdFTekC/51Hz7lOvUOx9xplSoqkUk14SftbhOWdHZrGAsNYUqzK4TlgLcEeUT
         qkAfKDJW5FFXYMmwyw7LCG7YJlmmUd0Hal3rIBIDTZvVVNjEsnjIXjumOButHmuYRw0H
         080EDnM8EL/9QCo7ci9bN+8Wy+Hgweh5Uti2jhiwto2SYvLzYwbSw/2RyNxTJ6BH+rnT
         ceuA==
X-Gm-Message-State: AC+VfDwSmg1c6QLQ3HWIlcwLIT4uxuVCnBmFs/cs2aFUg6bMoK+FOdcc
	/etk/KLLrXktvGJhxmLlPIr5fkAY4nj/Hpf1ksMGmA==
X-Google-Smtp-Source: ACHHUZ5yZRyIupryf3CPCbQrQFfJ0rHPE5pFt0xPFjhCx769aTMQbS30eXAsVUUXz5a9BfrXtVi/EqV4St8dZE5L0OQ=
X-Received: by 2002:a05:622a:178e:b0:3ef:2f55:2204 with SMTP id
 s14-20020a05622a178e00b003ef2f552204mr428099qtk.6.1683636871022; Tue, 09 May
 2023 05:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcQNTwxi5nVRG8yRoDrrtV-pO-WA1ubtFVmnLnebPLucmg@mail.gmail.com>
 <9b2c7872-fbe3-4691-b5c1-bf69290b4186@hatter.bewilderbeest.net>
In-Reply-To: <9b2c7872-fbe3-4691-b5c1-bf69290b4186@hatter.bewilderbeest.net>
From: Oskar Senft <osk@google.com>
Date: Tue, 9 May 2023 08:54:16 -0400
Message-ID: <CABoTLcSMuJbU7yyb3fUwfCzLfPkrGWJmqvN1VtC3eUqpHyYbPQ@mail.gmail.com>
Subject: Re: entity-manager: SBTSI and hwmontempsensor
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: multipart/alternative; boundary="000000000000a138a205fb424150"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a138a205fb424150
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zev

Thank you for your quick response!

Ali got it to work - it was much easier than I had thought. Thanks for all
your great work!

Oskar.

On Thu, May 4, 2023 at 5:10=E2=80=AFPM Zev Weiss <zev@bewilderbeest.net> wr=
ote:

> On Thu, May 04, 2023 at 01:00:47PM PDT, Oskar Senft wrote:
> >Hi Zev
> >
> >In
> >
> https://github.com/openbmc/entity-manager/commit/e22143df37faa0b0f5e2918d=
2f505b9f64e74b0f
> >you "removed devices now managed by hwmontempsensor".
> >
> >I'm trying to figure out how to add SBTSI support for the TYAN S8036 boa=
rd
> >(AMD Milan). Do I just add the device to the DTS and then reference it i=
n
> >EntityManager board configuration via its bus and address?
> >
> >Is there still a way to dynamically get Entity Manager (or now
> >dbus-sensors) to bind the driver or does it HAVE to happen in the DTS no=
w?
> >
> >Thanks!
> >
> >Oskar.
>
> Hi Oskar,
>
> Assuming you use a corresponding, recent enough version of dbus-sensors
> (i.e. including commit a1456c4aba, though hopefully also with at least
> commit 7627c860fa, which was a follow-up bugfix), it *should* work the
> same way it did before, with the device described in your E-M config.
>
> It shouldn't be in your DTS, because then it'd be statically defined and
> hwmontempsensor wouldn't be able to remove it when the host is powered
> off (which I assume you'd want).
>
> In terms of userspace/kernel separation, it's overall pretty similar to
> how it had been previously, just with the management of device lifetimes
> (instantiation & removal) moved to hwmontempsensor instead of
> entity-manager.
>
> Hopefully that's clear?  Let me know if you're having trouble getting
> things working though.
>
>
> Zev
>
>

--000000000000a138a205fb424150
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Zev<div><br></div><div>Thank you for your quick respons=
e!</div><div><br></div><div>Ali got it to work - it was much easier than I =
had thought. Thanks for all your great work!</div><div><br></div><div>Oskar=
.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, May 4, 2023 at 5:10=E2=80=AFPM Zev Weiss &lt;<a href=3D"mail=
to:zev@bewilderbeest.net" target=3D"_blank">zev@bewilderbeest.net</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Ma=
y 04, 2023 at 01:00:47PM PDT, Oskar Senft wrote:<br>
&gt;Hi Zev<br>
&gt;<br>
&gt;In<br>
&gt;<a href=3D"https://github.com/openbmc/entity-manager/commit/e22143df37f=
aa0b0f5e2918d2f505b9f64e74b0f" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/openbmc/entity-manager/commit/e22143df37faa0b0f5e2918d2f505b9f6=
4e74b0f</a><br>
&gt;you &quot;removed devices now managed by hwmontempsensor&quot;.<br>
&gt;<br>
&gt;I&#39;m trying to figure out how to add SBTSI support for the TYAN S803=
6 board<br>
&gt;(AMD Milan). Do I just add the device to the DTS and then reference it =
in<br>
&gt;EntityManager board configuration via its bus and address?<br>
&gt;<br>
&gt;Is there still a way to dynamically get Entity Manager (or now<br>
&gt;dbus-sensors) to bind the driver or does it HAVE to happen in the DTS n=
ow?<br>
&gt;<br>
&gt;Thanks!<br>
&gt;<br>
&gt;Oskar.<br>
<br>
Hi Oskar,<br>
<br>
Assuming you use a corresponding, recent enough version of dbus-sensors <br=
>
(i.e. including commit a1456c4aba, though hopefully also with at least <br>
commit 7627c860fa, which was a follow-up bugfix), it *should* work the <br>
same way it did before, with the device described in your E-M config.<br>
<br>
It shouldn&#39;t be in your DTS, because then it&#39;d be statically define=
d and <br>
hwmontempsensor wouldn&#39;t be able to remove it when the host is powered =
<br>
off (which I assume you&#39;d want).<br>
<br>
In terms of userspace/kernel separation, it&#39;s overall pretty similar to=
 <br>
how it had been previously, just with the management of device lifetimes <b=
r>
(instantiation &amp; removal) moved to hwmontempsensor instead of <br>
entity-manager.<br>
<br>
Hopefully that&#39;s clear?=C2=A0 Let me know if you&#39;re having trouble =
getting <br>
things working though.<br>
<br>
<br>
Zev<br>
<br>
</blockquote></div>

--000000000000a138a205fb424150--
