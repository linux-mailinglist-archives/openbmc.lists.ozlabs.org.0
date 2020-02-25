Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7778316F388
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 00:37:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RwMF4kyszDqDC
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 10:37:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=xiangliu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Jam/P3gl; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RwLY2PSBzDqSm
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 10:36:35 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id l16so983890qtq.1
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 15:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TSz0vgHIIzwI8zc4lj8lv5ulWO6W1ZIK2hqROhuWlZc=;
 b=Jam/P3glhhMxjpiNr4okoRgDOc63vcSjcgQMh3YSFfvfLW1y5SI5bBymWGjEtOMvts
 dI0l32169IMaPkSdw7FdB+mloym8956W0Uz7VlssWiKuPgpxRpjo9blH4WOeSGyXwXoG
 C4vFHl3Mhys9BWYybFT0sQc1I9HQgI8OByjX3JiEYMbhsBRzCMgU50m65DTpbupZD086
 1/U/cS9vmdaPfzb+C4qwLnpM0xUk0KQnw5eDwWuto9f4Q/ANueZ6N3N7Diy4giI4Tgyl
 3JrdT/ivGXAktUGtFpSy2yflnogyPEcv65KzxgMDanh0DvinkypwKBGsuHfUsCxoBw6B
 yVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TSz0vgHIIzwI8zc4lj8lv5ulWO6W1ZIK2hqROhuWlZc=;
 b=pekzpVhMkvADL+wBmZ2fSoJ/GAzaEmXWK8FE7TuMme4WX/qYBhchFoyfY2SmY1R2fp
 eaTmCtEDkY41sMCiNfgq83N4A2oUR1utl8uyE6sNV9tBQan0dgutJdt6YppxgnOEfwwM
 xKHPQxvPZvkFVAlBQF45QSNkKRsv5QpGyXrKOWJnuFAaDsUis595dB6VBJ7XJjnK2fE+
 cKv4tEM9QIiUkiBJWxdzv9ONEePRe4Pq0dlgjSfgR709bsYAenoRnIZvQicMtBHPl89L
 FJ9K5Q+KjSmfPC2HpsKw9gp9v+O0nBS5E/bQkPDpa7qyyyafN3t2oaz+ywvtYGr4JDQX
 oYlw==
X-Gm-Message-State: APjAAAWcbnU+DeCog4W3xY9rv/KknyAEjBsTkYXfDerXv8gCHrDG6ZBy
 4mVNuDAr7xdbnBKarSg1o9vxBMmktplfF0bJL/Sjtw==
X-Google-Smtp-Source: APXvYqzJGHt21smtsKOc1c+oEqNZF2B25Jjasv/1hH+dTRGH3x0TM7Af+LWu56T+bhRkq5nK1hHw/LJ/Ksv3zrs7Aks=
X-Received: by 2002:ac8:554b:: with SMTP id o11mr1351585qtr.36.1582673791775; 
 Tue, 25 Feb 2020 15:36:31 -0800 (PST)
MIME-Version: 1.0
References: <CAH57Xkz0BDp9NY7QdB0i329t=YS7Vk4TQccv8bg6DSXknYVsUg@mail.gmail.com>
 <20200225022603.GI67957@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200225022603.GI67957@patrickw3-mbp.dhcp.thefacebook.com>
From: Xiang Liu <xiangliu@google.com>
Date: Tue, 25 Feb 2020 15:35:55 -0800
Message-ID: <CAH57Xkw6LgCeSK3AnR5Cy6SHY5wY8b6FMQV+9sG_QMhFmQ1d-Q@mail.gmail.com>
Subject: Re: Possibility to move microsemi switchtec-user support from
 meta-facebook to a shared meta-layer
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000027f733059f6ef50e"
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
Cc: openbmc@lists.ozlabs.org, amithash@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000027f733059f6ef50e
Content-Type: text/plain; charset="UTF-8"

Thank you Patrick! We will then try to port this recipe to some other meta
layer. Hopefully we can find a good place for it :)

Regards,
Xiang

On Mon, Feb 24, 2020 at 6:26 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Mon, Feb 24, 2020 at 01:54:27PM -0800, Xiang Liu wrote:
> > Hi Amithash and other openbmc contributors,
> >
> > It seems the Microsemi switchtec-user tool has been integrated to
> > meta-facebook, the recipe is currently located at:
> >
> https://github.com/facebook/openbmc/blob/eaf4d364e55f96a5b37331049db1a718d8667e5a/meta-facebook/meta-fbep/recipes-fbep/plat-libs/switchtec-user_2.2-rc1.bb
> >
> > I am wondering if this recipe could be moved to a shared meta-layer, like
> > meta-phosphor or an upstream layer? As our team at Google will also need
> > this tool.
>
> Xiang,
>
> Glad to hear you find this useful.  We won't ever import the meta-tree
> at facebook/openbmc directly into openbmc/openbmc.  We've started a new
> openbmc/meta-facebook for our machine specific support here.
>
> If there are recipes under facebook/openbmc that you find useful and we
> haven't already ported them to some openbmc/meta-* layer, feel free to
> do so.  Off the top of my head I'm not sure the best place for this
> particular recipe.
>
> --
> Patrick Williams
>

--00000000000027f733059f6ef50e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Patrick! We will then try to port this recipe to=
 some other meta layer. Hopefully we can find a good place for it :)<div><b=
r></div><div>Regards,</div><div>Xiang</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 24, 2020 at 6:26 PM =
Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Mon, Feb 24, 2020 at 01:54:27PM -0800, Xiang Liu wrote:<br>
&gt; Hi Amithash and other openbmc contributors,<br>
&gt; <br>
&gt; It seems the Microsemi switchtec-user tool has been integrated to<br>
&gt; meta-facebook, the recipe is currently located at:<br>
&gt; <a href=3D"https://github.com/facebook/openbmc/blob/eaf4d364e55f96a5b3=
7331049db1a718d8667e5a/meta-facebook/meta-fbep/recipes-fbep/plat-libs/switc=
htec-user_2.2-rc1.bb" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/facebook/openbmc/blob/eaf4d364e55f96a5b37331049db1a718d8667e5a/meta-face=
book/meta-fbep/recipes-fbep/plat-libs/switchtec-user_2.2-rc1.bb</a><br>
&gt; <br>
&gt; I am wondering if this recipe could be moved to a shared meta-layer, l=
ike<br>
&gt; meta-phosphor or an upstream layer? As our team at Google will also ne=
ed<br>
&gt; this tool.<br>
<br>
Xiang,<br>
<br>
Glad to hear you find this useful.=C2=A0 We won&#39;t ever import the meta-=
tree<br>
at facebook/openbmc directly into openbmc/openbmc.=C2=A0 We&#39;ve started =
a new<br>
openbmc/meta-facebook for our machine specific support here.<br>
<br>
If there are recipes under facebook/openbmc that you find useful and we<br>
haven&#39;t already ported them to some openbmc/meta-* layer, feel free to<=
br>
do so.=C2=A0 Off the top of my head I&#39;m not sure the best place for thi=
s<br>
particular recipe.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--00000000000027f733059f6ef50e--
