Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5148F893A
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 07:58:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Bz9156Q5zDrQf
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 17:58:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::133;
 helo=mail-il1-x133.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ul7Pwm0J"; 
 dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bz632mBpzF54b
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 17:55:38 +1100 (AEDT)
Received: by mail-il1-x133.google.com with SMTP id d83so14561057ilk.7
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 22:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GGQElTC8InAr0liURXzjv8BZzMUbliBJThPP9PKElEw=;
 b=Ul7Pwm0JNYfoR+KzhzjRIPCy7orwpmtjvyIyq0PfPfAx10I/7bcK45oUUY/5FUGk3z
 Lf2spW+v8BwfYmqn+JxPi/8zXIL2l2y9l8CByK7JK9/ysRuuS5GLTB3n2sTiD941HZ7B
 xIrgNc8vS5/1wV3p1/0ixnHAOR+S1XGJ6fjLp/8s1JSLnYvuKq5d0Gkb5PWFo5LR/SMK
 HMv85XQUqIPtbkccqrcHZmGELFy2RjfXZnRK/Fy3DhBzPfdg912BfpIZLOcplnreYGqR
 MFWO3ed7YDKL8RoSdbKJYvWRfTaeXJhFc4BLtRDL+amnftrKuYL5wNy01kmPdCO30YXV
 +7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GGQElTC8InAr0liURXzjv8BZzMUbliBJThPP9PKElEw=;
 b=QVfGrOaDS+vBBS9B7Z/agiNgmQVK9kCMsZhOsVmSg9rOLj7tdbzsU4bYRsaIxJkDRS
 ptVLBftT4TPFnCqgf6r/zeZDqoBE9Kg2Sy1BIQij8tksmx9vYJkxwz2e/txfyAGUbtoV
 RA6fX4IOLUA7+gKid569VURCrPwfE9M/j+lz/RJtelwt5kMzVKeX2eVYvBLpQ9hgZIzM
 dQlv5679k3VjKggoyMmQSQQJnaD7QdvOwsnU/H/LkHUlBgEXpg1X0JDSMlIwu/If5e8Q
 Ml9+AVn7FavtzrQEwLYuFVm7jSo/kwhIRIf8NaJ3ra+7VfRoO7Xhxi7ViA0fwRPdJA2z
 2vCw==
X-Gm-Message-State: APjAAAUrrGN8Js9LXTY6y2zSREPog3zsNRmpHeHJ2AXMwoTdUlP418zR
 5QAlZeRSpmbGmlLPswGc9OaZPclsYWl1S57gExZNHQ==
X-Google-Smtp-Source: APXvYqyBazj9SsgrbROqwD12WAMOhxywowjvva664c8yb6/HJEDG3XepJ8JJYlqTTgIru4r6PTxYhvKxWG016EgIC3E=
X-Received: by 2002:a92:d484:: with SMTP id p4mr34885409ilg.52.1573541731589; 
 Mon, 11 Nov 2019 22:55:31 -0800 (PST)
MIME-Version: 1.0
References: <CAGMNF6U81+d9wz4h_TiPBA0EoxC6bhiUZ67mozWWwwT4GTVMCg@mail.gmail.com>
 <9AC7EF7E-3FFF-4855-B9DE-80F3B68236E0@fuzziesquirrel.com>
In-Reply-To: <9AC7EF7E-3FFF-4855-B9DE-80F3B68236E0@fuzziesquirrel.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 11 Nov 2019 22:55:03 -0800
Message-ID: <CAGMNF6W8bWD_2Zpynz9vcVdGA9d8B+QfbA=oau2zQj+xpf9NEw@mail.gmail.com>
Subject: Re: Yocto/bitbake recipe 'diff test'?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000f3ed44059720bbf2"
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

--000000000000f3ed44059720bbf2
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 11, 2019 at 11:01 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> Hi Kun
>
> > On Nov 11, 2019, at 1:45 PM, Kun Yi <kunyi@google.com> wrote:
> >
> > Hello there,
> >
> > After being hit by several regressions due to overrides in Yocto recipes,
>
> I have not heard of any regressions.  Can you elaborate?
>

Sure, it's partially due to how we set up the build downstream. Our
downstream would put all the needed layers in one bblayers file, so we
would have something like:

  ##OEROOT##/meta \
  ##OEROOT##/meta-poky \
  ##OEROOT##/meta-openembedded/meta-oe \
  ##OEROOT##/meta-openembedded/meta-networking \
  ##OEROOT##/meta-openembedded/meta-python \
  ##OEROOT##/meta-phosphor \
  ##OEROOT##/meta-google \
  ##OEROOT##/meta-google-gbmc \
  ##OEROOT##/meta-aspeed \
  ##OEROOT##/meta-nuvoton \
  ##OEROOT##/meta-openpower \
  ##OEROOT##/meta-ingrasys \
  ##OEROOT##/meta-ingrasys/meta-zaius \
  ##OEROOT##/meta-quanta \
  ##OEROOT##/meta-quanta/meta-gsj \
...

The distinct advantage of this approach is that we would be able to build
images for different machine types using the same layer conf, so the build
doesn't need to be reconfigured if you were to test on another platform.

The challenge, as you can imagine, is that each meta layer now cannot
'leak' any variable. e.g. if some recipe in meta-quanta sets a variable for
quanta systems only, then it must specify "_quanta" or a similar suffix to
prevent the variable expansion to apply to other systems. I think this rule
is generally preferred upstream, but not sure whether it is an official
guideline.

With my proposal, it would be much easier for a multi-system layer setup
like ours to work. Not only that, it would benefit the most common use
cases: moving variable definitions in bitbake recipes, or even just adding
a variable for a particular machine feature. Having a visible diff would
make reviewing the changes so much easier.


> -brad
>


-- 
Regards,
Kun

--000000000000f3ed44059720bbf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 11, 2019 at 11:01 AM Brad=
 Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzzies=
quirrel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Kun<br>
<br>
&gt; On Nov 11, 2019, at 1:45 PM, Kun Yi &lt;<a href=3D"mailto:kunyi@google=
.com" target=3D"_blank">kunyi@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hello there,<br>
&gt; <br>
&gt; After being hit by several regressions due to overrides in Yocto recip=
es,<br>
<br>
I have not heard of any regressions.=C2=A0 Can you elaborate?<br></blockquo=
te><div>=C2=A0</div><div>Sure, it&#39;s partially due to how we set up the =
build downstream. Our downstream would put all the needed layers in one bbl=
ayers file, so we would have something like:</div><div><br></div><div>=C2=
=A0 ##OEROOT##/meta \<br>=C2=A0 ##OEROOT##/meta-poky \<br>=C2=A0 ##OEROOT##=
/meta-openembedded/meta-oe \<br>=C2=A0 ##OEROOT##/meta-openembedded/meta-ne=
tworking \<br>=C2=A0 ##OEROOT##/meta-openembedded/meta-python \<br>=C2=A0 #=
#OEROOT##/meta-phosphor \<br>=C2=A0 ##OEROOT##/meta-google \<br>=C2=A0 ##OE=
ROOT##/meta-google-gbmc \<br>=C2=A0 ##OEROOT##/meta-aspeed \<br>=C2=A0 ##OE=
ROOT##/meta-nuvoton \<br>=C2=A0 ##OEROOT##/meta-openpower \<br>=C2=A0 ##OER=
OOT##/meta-ingrasys \<br>=C2=A0 ##OEROOT##/meta-ingrasys/meta-zaius \<br>=
=C2=A0 ##OEROOT##/meta-quanta \<br>=C2=A0 ##OEROOT##/meta-quanta/meta-gsj \=
<br></div><div>...</div><div><br></div><div>The distinct advantage of this =
approach is that we would be able to build images for different machine typ=
es using the same layer conf, so the build doesn&#39;t need to be reconfigu=
red if you were to test on another platform.</div><div><br></div><div>The c=
hallenge, as you can imagine, is that each meta layer now cannot &#39;leak&=
#39; any variable. e.g. if some recipe in meta-quanta sets a variable for q=
uanta systems only, then it must specify &quot;_quanta&quot; or a similar s=
uffix to prevent the variable expansion to apply to other systems. I think =
this rule is generally preferred upstream, but not sure whether it is an of=
ficial guideline.</div><div><br></div><div>With my proposal, it would be mu=
ch easier for a multi-system layer setup like ours to work. Not only that, =
it would benefit the most common use cases: moving variable definitions in =
bitbake recipes, or even just adding a variable for a particular machine fe=
ature. Having a visible diff would make reviewing the changes so much easie=
r.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-brad<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv></div>

--000000000000f3ed44059720bbf2--
