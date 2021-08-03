Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D343DF815
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 00:45:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfVLw1YHyz3bnx
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 08:45:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=NCmgs9L7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=NCmgs9L7; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfVLX4T6Rz301P
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 08:44:50 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id c9so962639qkc.13
 for <openbmc@lists.ozlabs.org>; Tue, 03 Aug 2021 15:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ADqukEK1qYbqSuD/iAiwHWWrcEkB6lFRqaPHorp8tFs=;
 b=NCmgs9L7pISbUIrSx8kDo7apoHi6Pf0v1s1ykC2uIzzp7fTdhx3PAm/PFRHfueFSqm
 +/QBOzae0RcknIO2UCKLjloZp+tfKsT8hmE09WKZJE5e4mQddgS0HGIk2E3MsIxd2CS6
 j+5e+tMHbk2L5BMY863h4AYPHXI85+Rg8QXDhmJRxNhsRrGel0s8giub6A/DSGjTn1bf
 /UwdCvZBh2U7zlCCHPCuC37uq9YbJ6o4esA/VIwH0YAPdxz5TzLgWnyNI64Oe9P6U7Ej
 32udfdS9oQgnJqB/UoxOy+scwm8GTxnpXkKYcKyktZ8Kl+tA7bo5ZUBEZtCDGuSivZsI
 c4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ADqukEK1qYbqSuD/iAiwHWWrcEkB6lFRqaPHorp8tFs=;
 b=t0GtC2nB1lEh/w/XTf0XrK+3W1I0ZPafPXsgYxfLYNSon9Y/JsUkVjYf1wpZSzh/8w
 bV5bqSLYoT4ZFasLnGckBNQfCQbCdTtPJhMuJe0U69lF0rrjDrNLQAdzkuzGKswL5t8Z
 YtjSSS2QKWIFGck964ixuTIopWYoPRh1D154yDIMkChQzf9mFxB8OAZHcoto89XSvX0r
 1Y70ydBKNwk/NcvDEvt5kA7I3xbhEqY/szzTmVEb5BaWmk0KmLYDB1KXv8eOHNN0Wbrv
 RFiX5o0R3IyokFJGnTHJpLth1S8wQRT17Ou7mBHz80Gd8yRFnyWIMouxpa1n7P8c09K4
 +m9w==
X-Gm-Message-State: AOAM533ybmtGNDPmmR2oZeBf5an7kc0R3s9wR1nv5CMBe6JlCqq53glg
 xqnqDrQiboHPlW1pOC7jW1/tlHW+jgfWSlvWLhhfdQ==
X-Google-Smtp-Source: ABdhPJx6Z4NEPRSy/k8P/Cp0KmrlpjqYhT8ZjcpJGYAWOqmsxJFTlV7Tmjw208uHD0j5vjbkZKXMTUmfXIXKQgzQhBI=
X-Received: by 2002:a05:620a:1593:: with SMTP id
 d19mr23425214qkk.472.1628030684969; 
 Tue, 03 Aug 2021 15:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyh_UQ8WJktb7ffhkZyeP+btqHJ_JSR28coXqrq3XZAsg@mail.gmail.com>
 <YQm3Cgf5XrpkIwWF@heinlein>
In-Reply-To: <YQm3Cgf5XrpkIwWF@heinlein>
From: Patrick Venture <venture@google.com>
Date: Tue, 3 Aug 2021 15:44:34 -0700
Message-ID: <CAO=notx3M3VXv_U062_2zK+jvnKO4KRsJWMK70cwkqTDRof89g@mail.gmail.com>
Subject: Re: Aspeed BMCs using KCS?
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000a99dfa05c8af6e00"
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
Cc: Titus Rwantare <titusr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a99dfa05c8af6e00
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 2:37 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Tue, Aug 03, 2021 at 01:15:20PM -0700, Patrick Venture wrote:
> > Patrick et al;
> >
> > As you may know, my team is working on enabling lots of stuff with Qemu
> and
> > we dont' have any platforms using KCS with aspeed.  However, we wanted to
> > enable this testing because we have other KCS configurations.  I wanted
> to
> > ask if you have an openbmc image that uses aspeed kcs?
>
> I thought most x86 machines use KCS, but certainly Tiogapass does.
>
>
Yeah - I feel like with most Aspeed set-ups people use BT.  At least all
the ones I've touched.


> meta-facebook/conf/machine/include/facebook-withhost.inc:PREFERRED_PROVIDER_virtual/obmc-host-ipmi-hw
> ?= "phosphor-ipmi-kcs"
>
> A default build of Tiogapass should get you something that attempts to use
> the
> KCS interface.
>

Thanks!


>
> --
> Patrick Williams
>

--000000000000a99dfa05c8af6e00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 2:37 PM Patric=
k Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue=
, Aug 03, 2021 at 01:15:20PM -0700, Patrick Venture wrote:<br>
&gt; Patrick et al;<br>
&gt; <br>
&gt; As you may know, my team is working on enabling lots of stuff with Qem=
u and<br>
&gt; we dont&#39; have any platforms using KCS with aspeed.=C2=A0 However, =
we wanted to<br>
&gt; enable this testing because we have other KCS configurations.=C2=A0 I =
wanted to<br>
&gt; ask if you have an openbmc image that uses aspeed kcs?<br>
<br>
I thought most x86 machines use KCS, but certainly Tiogapass does.<br>
<br></blockquote><div><br></div><div>Yeah - I feel like with most Aspeed se=
t-ups people use BT.=C2=A0 At least all the ones I&#39;ve touched.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
meta-facebook/conf/machine/include/facebook-withhost.inc:PREFERRED_PROVIDER=
_virtual/obmc-host-ipmi-hw ?=3D &quot;phosphor-ipmi-kcs&quot;<br>
<br>
A default build of Tiogapass should get you something that attempts to use =
the<br>
KCS interface.<br></blockquote><div><br></div><div>Thanks!</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Patrick Williams<br>
</blockquote></div></div>

--000000000000a99dfa05c8af6e00--
