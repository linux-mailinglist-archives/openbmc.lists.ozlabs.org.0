Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942BF9918
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 19:50:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CGys32J6zF53M
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 05:50:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="e8G3h7RK"; 
 dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CG9S2C2fzF3cj
 for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2019 05:14:35 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id j13so19822221ioe.0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 10:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U+JIRvPsGEmIOYp4z5p7tSnf9H+CVT8P6zkE/Rwq4Bk=;
 b=e8G3h7RKDkHY8cgqS5c5B6u5PogbALAx/SH1Ch+uN/DLdYya+tIKr+0+MThHFggnyo
 gQ6jRx5DjfFTO8nVVtLvvwlUJqC1huQ/qDu5nLdBko5RA2ozZIzNSAgduSIzi7x0todT
 9LxkfNJpjLz6JDYeqXsjZSi6LWQc/mAKTTxkHOcdhDCF2uPcmuy2If4fZkB4MXC24vyK
 Cim09pwUsefuQzpnJyIUyeQyfKkj+imcJuM5cA1J90rK8EbOeygzPCVNsfEIYMsXXJRD
 d+j5Jcpwls5I3nqpHUotupYgCmqTCrY3nxndW+GnzLMug0UQlpBetFoa75fc5Y8j7Tcc
 XrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+JIRvPsGEmIOYp4z5p7tSnf9H+CVT8P6zkE/Rwq4Bk=;
 b=XRYOW7IrSG6VERxaFkhiqwdEnNj6E47Nk8883/FHTzM20dRIB7FN/mdVji4+hZoKjk
 mJTKns8yjsOj0LDCMQV+nxCG7CzmpOrc77PPmrdqbEGSU4MUrHPVGqtWg9tTDBizsaOK
 8RHXBEK5PJt5YHG3cCGMMdoHx6dJtDMCb4hIT4w4EvHBBp3tlLZ5jifV0MwuCppVV0AX
 fQhK94r2keRAYoK+iguQa+iAYJyuEERe6CW/if6HPRTgD0JY26I9wQP3voinhqi6R9nH
 9ARmTOcs5Jmyc2PmMiMlT3DgvMNnKwkQyj35Vkk/iqjGBJFKqw++0p33yhi6DJ6RFyTu
 MGcQ==
X-Gm-Message-State: APjAAAV3cNzz3y395jn2WQkcEvZ7SsPGntfpahOkp3G6MZ2bYisyICSd
 4o6rIV91Zcni0WGD5P3ogb2xi3E4jkdO8l4yWJDqIA==
X-Google-Smtp-Source: APXvYqzL8UDsJDHmALp+rpDQfm53dssq+ayOX9bQhto/z2KaE0ILPeYWU934mzAxGOXS90UMAqsGZC7nLo7nnhovms0=
X-Received: by 2002:a6b:18c1:: with SMTP id 184mr7339907ioy.40.1573582471216; 
 Tue, 12 Nov 2019 10:14:31 -0800 (PST)
MIME-Version: 1.0
References: <CAGMNF6U81+d9wz4h_TiPBA0EoxC6bhiUZ67mozWWwwT4GTVMCg@mail.gmail.com>
 <9AC7EF7E-3FFF-4855-B9DE-80F3B68236E0@fuzziesquirrel.com>
 <CAGMNF6W8bWD_2Zpynz9vcVdGA9d8B+QfbA=oau2zQj+xpf9NEw@mail.gmail.com>
 <CEB2088C-C91F-46ED-9FC1-2480893767E0@fuzziesquirrel.com>
In-Reply-To: <CEB2088C-C91F-46ED-9FC1-2480893767E0@fuzziesquirrel.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 12 Nov 2019 10:14:05 -0800
Message-ID: <CAGMNF6WLawVcR0hH+Mg=2=zSXJ9120GkMzYkhHrOQXL--xjfrw@mail.gmail.com>
Subject: Re: Yocto/bitbake recipe 'diff test'?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000394c9205972a389a"
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
Cc: yocto@yoctoproject.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000394c9205972a389a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 10:05 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
>
> > On Nov 12, 2019, at 1:55 AM, Kun Yi <kunyi@google.com> wrote:
> >
> > Sure, it's partially due to how we set up the build downstream. Our
> downstream would put all the needed layers in one bblayers file, so we
> would have something like:
> >
> >   ##OEROOT##/meta \
> >   ##OEROOT##/meta-poky \
> >   ##OEROOT##/meta-openembedded/meta-oe \
> >   ##OEROOT##/meta-openembedded/meta-networking \
> >   ##OEROOT##/meta-openembedded/meta-python \
> >   ##OEROOT##/meta-phosphor \
> >   ##OEROOT##/meta-google \
> >   ##OEROOT##/meta-google-gbmc \
> >   ##OEROOT##/meta-aspeed \
> >   ##OEROOT##/meta-nuvoton \
> >   ##OEROOT##/meta-openpower \
> >   ##OEROOT##/meta-ingrasys \
> >   ##OEROOT##/meta-ingrasys/meta-zaius \
> >   ##OEROOT##/meta-quanta \
> >   ##OEROOT##/meta-quanta/meta-gsj \
> > ...
> >
> > The distinct advantage of this approach is that we would be able to
> build images for different machine types using the same layer conf, so th=
e
> build doesn't need to be reconfigured if you were to test on another
> platform.
> >
> > The challenge, as you can imagine, is that each meta layer now cannot
> 'leak' any variable. e.g. if some recipe in meta-quanta sets a variable f=
or
> quanta systems only, then it must specify "_quanta" or a similar suffix t=
o
> prevent the variable expansion to apply to other systems. I think this ru=
le
> is generally preferred upstream, but not sure whether it is an official
> guideline.
> >
> > With my proposal, it would be much easier for a multi-system layer setu=
p
> like ours to work. Not only that, it would benefit the most common use
> cases: moving variable definitions in bitbake recipes, or even just addin=
g
> a variable for a particular machine feature. Having a visible diff would
> make reviewing the changes so much easier.
>
> Thanks for the background Kun.
>
> I know yocto has a concept of Q&A checks that can be run - would it make
> sense to try something like this via that mechanism?  Emit warnings (whic=
h
> we can elevate to build failures in CI) if variables aren=E2=80=99t prope=
rly
> overriden?  That is nice because it doesn=E2=80=99t require any changes t=
o our CI
> system.
>
> That's an approach I haven't thought of. Thanks Brad! I'm a little worrie=
d
that it would incur more bitbake changes, but let's see if the Yocto folks
have ideas.


> I=E2=80=99ve cross posted to the yocto mailing list in case there is any =
interest
> or ideas there.  Here is a link to the entire thread as I remove a little
> too much context I think=E2=80=A6
>
> https://lists.ozlabs.org/pipermail/openbmc/2019-November/019409.html
>
> -brad



--=20
Regards,
Kun

--000000000000394c9205972a389a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 12, 2019 at 10:05 AM Brad Bis=
hop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquir=
rel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br>
<br>
&gt; On Nov 12, 2019, at 1:55 AM, Kun Yi &lt;<a href=3D"mailto:kunyi@google=
.com" target=3D"_blank">kunyi@google.com</a>&gt; wrote:<br>
&gt;=C2=A0 <br>
&gt; Sure, it&#39;s partially due to how we set up the build downstream. Ou=
r downstream would put all the needed layers in one bblayers file, so we wo=
uld have something like:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-poky \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-openembedded/meta-oe \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-openembedded/meta-networking \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-openembedded/meta-python \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-phosphor \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-google \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-google-gbmc \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-aspeed \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-nuvoton \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-openpower \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-ingrasys \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-ingrasys/meta-zaius \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-quanta \<br>
&gt;=C2=A0 =C2=A0##OEROOT##/meta-quanta/meta-gsj \<br>
&gt; ...<br>
&gt; <br>
&gt; The distinct advantage of this approach is that we would be able to bu=
ild images for different machine types using the same layer conf, so the bu=
ild doesn&#39;t need to be reconfigured if you were to test on another plat=
form.<br>
&gt; <br>
&gt; The challenge, as you can imagine, is that each meta layer now cannot =
&#39;leak&#39; any variable. e.g. if some recipe in meta-quanta sets a vari=
able for quanta systems only, then it must specify &quot;_quanta&quot; or a=
 similar suffix to prevent the variable expansion to apply to other systems=
. I think this rule is generally preferred upstream, but not sure whether i=
t is an official guideline.<br>
&gt; <br>
&gt; With my proposal, it would be much easier for a multi-system layer set=
up like ours to work. Not only that, it would benefit the most common use c=
ases: moving variable definitions in bitbake recipes, or even just adding a=
 variable for a particular machine feature. Having a visible diff would mak=
e reviewing the changes so much easier.<br>
<br>
Thanks for the background Kun.<br>
<br>
I know yocto has a concept of Q&amp;A checks that can be run - would it mak=
e sense to try something like this via that mechanism?=C2=A0 Emit warnings =
(which we can elevate to build failures in CI) if variables aren=E2=80=99t =
properly overriden?=C2=A0 That is nice because it doesn=E2=80=99t require a=
ny changes to our CI system.<br>
<br></blockquote><div>That&#39;s an approach I haven&#39;t thought of. Than=
ks Brad! I&#39;m a little worried that it would incur more bitbake changes,=
 but let&#39;s see if the Yocto folks have ideas.<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
I=E2=80=99ve cross posted to the yocto mailing list in case there is any in=
terest or ideas there.=C2=A0 Here is a link to the entire thread as I remov=
e a little too much context I think=E2=80=A6<br>
<br>
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2019-November/019409.=
html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/piperma=
il/openbmc/2019-November/019409.html</a><br>
<br>
-brad</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></di=
v></div></div>

--000000000000394c9205972a389a--
