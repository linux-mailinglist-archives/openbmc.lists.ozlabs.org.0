Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 135DD3726B4
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 09:42:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZBdQ0sRnz301g
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 17:42:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TVV5FR72;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=ratankgupta31@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TVV5FR72; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZBd657Gmz2xYk
 for <openbmc@lists.ozlabs.org>; Tue,  4 May 2021 17:42:16 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id u3so11638403eja.12
 for <openbmc@lists.ozlabs.org>; Tue, 04 May 2021 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=DOwkFSIyM2kwAabkqv+EjOSm914v8vn0oyM95dsH/o4=;
 b=TVV5FR727CrfA2a39uqwNCG/F7eeLTRc/QMc1N/PXgW3SoSvUkBO21GPmRlNTK39Kd
 6MZRgOVIXtVr/LpKvcVIQx1KP0+1EsEJDrMIiUz6AhTzVC4FuC6/mCFg5QqT4K3q6VGy
 oADzU1NbBn7RXxHnejHHKz/HLoNfrQ21hbe0Rr5+Wyrnz1kcH5YWIt1lvXHskV/G/AJc
 s6QmrvtWEP3bXb9fhbEHOS931FCcIzKeVXfp+dLdwqjJAMW5HxGyDFdRRiTbPqZbR2yh
 WHDY86vTXoWMCiCp5xki8W27LM7g8llVtzqbwwELQAqpZgIRyYaFFEedNJvM8HTBcgtr
 drHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=DOwkFSIyM2kwAabkqv+EjOSm914v8vn0oyM95dsH/o4=;
 b=Ku4oLZKQB08yo63NIuopT02u/tCgJGvzvJOu1RTy0/R5obxNpDbfKb1VvMC72Eev0W
 irRxRIdsU4qNCgSFgGbvsgCpc2z4X2pXWSiwCkER2KZYhhifaEE4COk78wiabaU1UyZ9
 tM45Gr2vyZN7c85HUGFc8oQ2+OMsNvc6JHzSsfXhW/vlRRJ3p75lyYmmWN6/4kCwWU+d
 6EuUUMNdhbUSlB7AzFfD5zlHYGd2TyOUJ2RsyPRLFaODsWxYvqyK33Qoc85kSSiGvo7Q
 SbnbU6Q66puMyTjoeohjTESS5AnJVPrvI9jLf1MBep+HiDxAGwiSPv41uZX7qqLV5YwE
 dVew==
X-Gm-Message-State: AOAM5311aspzGh2pzlgQydeZ3NMPxigl0y3Jm9oykQfzQykxH+1XqgyK
 76jwKo6uOYt79/g9M8oGCpWWq/UXHL4UZ+0yWPfaSakR
X-Google-Smtp-Source: ABdhPJza1rKM3PwBNDzokoAb5zvpsgekDnLT8UlbjIqgQyjUeMSFXcWBGFmuEBzfpXQFNknVXZGpeJK9roInP2mzemA=
X-Received: by 2002:a17:906:e28c:: with SMTP id
 gg12mr20444086ejb.483.1620114130551; 
 Tue, 04 May 2021 00:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
In-Reply-To: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Tue, 4 May 2021 13:11:35 +0530
Message-ID: <CAMhqiMrgpVyQwXXWmyzpvHhgRCG17=5qgs-Qr--9+=U6RLQU1Q@mail.gmail.com>
Subject: Re: D-bus model proposal for pay for access features
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000003f467a05c17c3723"
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

--0000000000003f467a05c17c3723
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Any comments on the below proposal?

Ratan

On Fri, Apr 30, 2021 at 11:45 PM Ratan Gupta <ratankgupta31@gmail.com>
wrote:

> Hi All,
>
> I would like to introduce a dbus model proposal around pay for access features.Normally IBM system ships with more hardware than was purchased, which can be unlocked later.
>
> Features could be 1) AIX enabled/disabled
> 2) How many processors are enabled
> 3) How much memory is enabled
>
> *Proposed Model:*
>
> The model consists of following main entities:1 - licenses - these objects represents the features.  There will be a license represnting
> feature(one is to one relation ship) and these objects have state - active, inactive, unknown, etc.
> These objects could implement the Delete interface for when a client wishes to disable the license/feature.
>
> 2 - manager - the manager object (distinct from freedesktop object manager) provides a method
> interface to create new license objects.
>
> *Alternate Dbus Model:*
>
> 1 - Licenses: these objects represent an agreement.  These objects have an
> association to one or more features, and these objects have state - active,inactive, unknown, etc.
> These objects could implement the Delete interface for when a client wishes to disable the license.
>
> 2 - Features: these objects describe the features available.
> Feature objects would be static and implementation/platform defined.  A BMC or host firmware update
> could potentially add or remove the available features exposed as dbus objects.  At the moment the
> only feature attribute I can think of is a name and the feature status.
>
> 3 Manager - the manager object (distinct from freedesktop object manager)
> provides a method interface to create new license objects.
>
> The difference between two models areIn the alternate Dbus model we are keeping the feature Dbus object and the License have an associated features
> In the proposed model we are only keeping the license D-bus object which represent the feature.
>
> Flow would be as below with the proposed model -1/ Manager object would be having interface like upload (License activation key)
> 2/ On IBM systems we send this key to the host firmware which activates the features
> 3/ Host Firmware sends the activated feature list to the BMC
> 4/ BMC creates the licenses for the activated features
>
> I suspect an implementation of the above flow is highly IBM specific,
> but I hope some of you have some feedback that might enable some collaboration.
> If not - where should we put this application?
>
> Ratan
>
>

--0000000000003f467a05c17c3723
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>An=
y comments on the below proposal?</div><div><br></div><div>Ratan<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Apr 30, 2021 at 11:45 PM Ratan Gupta &lt;<a href=3D"mailto:ratankgup=
ta31@gmail.com" target=3D"_blank">ratankgupta31@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
pre style=3D"box-sizing:inherit;margin:4px 0px;padding:8px;font-size:12px;l=
ine-height:1.50001;font-variant-ligatures:none;white-space:pre-wrap;word-br=
eak:normal;font-family:Monaco,Menlo,Consolas,&quot;Courier New&quot;,monosp=
ace;border-radius:4px;color:rgb(29,28,29);font-style:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:left;text-indent=
:0px;text-transform:none;word-spacing:0px;text-decoration-style:initial;tex=
t-decoration-color:initial">Hi All,<br><br><span style=3D"box-sizing:inheri=
t;display:block;height:unset"></span>I would like to introduce a dbus model=
 proposal around pay for access features.<span style=3D"box-sizing:inherit;=
display:block;height:unset"></span>Normally IBM system ships with more hard=
ware than was purchased, which can be unlocked later.<br><br style=3D"box-s=
izing:inherit">Features could be <span style=3D"box-sizing:inherit;display:=
block;height:unset"></span>1) AIX enabled/disabled  <br style=3D"box-sizing=
:inherit">2) How many processors are enabled<br style=3D"box-sizing:inherit=
">3) How much memory is enabled<br><br><span style=3D"box-sizing:inherit;di=
splay:block;height:unset"></span><b>Proposed Model:</b><br><br><span style=
=3D"box-sizing:inherit;display:block;height:unset"></span>The model consist=
s of following main entities:<span style=3D"box-sizing:inherit;display:bloc=
k;height:unset"></span>1 - licenses - these objects represents the features=
.  There will be a license represnting <br>feature(one is to one relation s=
hip) and these objects have state - active, inactive, unknown, etc.<br styl=
e=3D"box-sizing:inherit">These objects could implement the Delete interface=
 for when a client wishes to disable the license/feature.<br><br><span styl=
e=3D"box-sizing:inherit;display:block;height:unset"></span><span style=3D"b=
ox-sizing:inherit;display:block;height:unset"></span>2 - manager - the mana=
ger object (distinct from freedesktop object manager) provides a method<br>=
interface to create new license objects.<br><br><span style=3D"box-sizing:i=
nherit;display:block;height:unset"></span><b>Alternate Dbus Model:</b><br><=
br><span style=3D"box-sizing:inherit;display:block;height:unset"></span>1 -=
 Licenses: these objects represent an agreement.  These objects have an<br =
style=3D"box-sizing:inherit">association to one or more features, and these=
 objects have state - active,inactive, unknown, etc.<br>These objects could=
 implement the Delete interface for when a client wishes to disable the lic=
ense.<br><br><span style=3D"box-sizing:inherit;display:block;height:unset">=
</span>2 - Features: these objects describe the features available.<br styl=
e=3D"box-sizing:inherit">Feature objects would be static and implementation=
/platform defined.  A BMC or host firmware update <br>could potentially add=
 or remove the available features exposed as dbus objects.  At the moment t=
he <br>only feature attribute I can think of is a name and the feature stat=
us.<br><br><span style=3D"box-sizing:inherit;display:block;height:unset"></=
span>3 Manager - the manager object (distinct from freedesktop object manag=
er)<br style=3D"box-sizing:inherit">provides a method interface to create n=
ew license objects.<br><br><span style=3D"box-sizing:inherit;display:block;=
height:unset"></span><span style=3D"box-sizing:inherit;display:block;height=
:unset"></span>The difference between two models are<span style=3D"box-sizi=
ng:inherit;display:block;height:unset"></span>In the alternate Dbus model w=
e are keeping the feature Dbus object and the License have an associated fe=
atures<br style=3D"box-sizing:inherit">In the proposed model we are only ke=
eping the license D-bus object which represent the feature.<br><br><span st=
yle=3D"box-sizing:inherit;display:block;height:unset"></span><span style=3D=
"box-sizing:inherit;display:block;height:unset"></span>Flow would be as bel=
ow with the proposed model -<span style=3D"box-sizing:inherit;display:block=
;height:unset"></span>1/ Manager object would be having interface like uplo=
ad (License activation key)<br style=3D"box-sizing:inherit">2/ On IBM syste=
ms we send this key to the host firmware which activates the features<br st=
yle=3D"box-sizing:inherit">3/ Host Firmware sends the activated feature lis=
t to the BMC<br style=3D"box-sizing:inherit">4/ BMC creates the licenses fo=
r the activated features<br><br><span style=3D"box-sizing:inherit;display:b=
lock;height:unset"></span><span style=3D"box-sizing:inherit;display:block;h=
eight:unset"></span>I suspect an implementation of the above flow is highly=
 IBM specific, <br style=3D"box-sizing:inherit">but I hope some of you have=
 some feedback that might enable some collaboration.  <br style=3D"box-sizi=
ng:inherit">If not - where should we put this application?<br></pre><pre st=
yle=3D"box-sizing:inherit;margin:4px 0px;padding:8px;font-size:12px;line-he=
ight:1.50001;font-variant-ligatures:none;white-space:pre-wrap;word-break:no=
rmal;font-family:Monaco,Menlo,Consolas,&quot;Courier New&quot;,monospace;bo=
rder-radius:4px;color:rgb(29,28,29);font-style:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:left;text-indent:0px;t=
ext-transform:none;word-spacing:0px;text-decoration-style:initial;text-deco=
ration-color:initial">Ratan<br></pre></div>
</blockquote></div>
</div>

--0000000000003f467a05c17c3723--
