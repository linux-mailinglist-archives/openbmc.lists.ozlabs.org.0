Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1096ADA
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 22:48:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CjY96Db6zDrCp
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 06:47:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GTI+9raM"; 
 dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CjXF5zg6zDr6q
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 06:47:09 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id o9so160986iom.3
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 13:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iEwD66pv7NI/IZQ6SLrO8GHZmsLYqPJlNQwHnsoAJyA=;
 b=GTI+9raMS4TSuMmvSOov8VpGlK6+sE5iGUYKJibfwvZxBA7DFoLQZ1rl51D9+go3z+
 aBZLnLhMsRZfyoeE6l0U3RyLzgBgsdxBNcZ7hC7/wyi+pN1e1HPxcXliDtiZHExQhIEh
 w1waGvANB0sqvwvhiP8BpQ9NM1X65DACyuimOel5/fuBsZj+8IVe9uqphSS2JyRU2xe2
 eDcE0nQzwMFjZpzgJMKzgezDm3poeKQiUGkv/T/ZmkD/IGqs+qwlKO9/TWDBY/QwZ1Jq
 QvbSlNns7odeNNEhcE+7Iu28kA4Ai3mzRtTPK3FGYpf/6HZogrgK4LUahVf3mjP9cY6D
 y0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iEwD66pv7NI/IZQ6SLrO8GHZmsLYqPJlNQwHnsoAJyA=;
 b=MNLj//jgiLpXr0LW8wE7+zl8/P6ywahPsO06fkxUY5vwHMkMo9+Ry11CABr2ITXVTL
 HuvE25LXKawiWr5/zcu1WTHQAx6FDTpe9QxTTYz3PIhENjtx+ycACrrMuoROZfKij0oI
 ihi0XsBu574EyN2ChPlOVxAmBtNlbQIxX464cJWCQrX/8ka3+2+mTEiC3VuLDyQGEIvh
 DQXMkO6NX7wiC5Z/ZrcgY4R5LjmLCLZV+u4EsnKKcVLhg3lbMLqD2C0J7ctfeQXUrB4d
 FxPQs/dIAiVvndXpuVNxGglM+2yq8/rku3mFqWWNDkjbyxensdq9VsJXJLrolU6wKKDP
 zeEw==
X-Gm-Message-State: APjAAAWLWXU2LjZqAxRr6SXWRD9V2NgvF6JN6qiP43FheJorcVC0mbvn
 Yf5opyW5jxjUEGmLKbAXqyQtRzxUr+RmWp4app+3Eg==
X-Google-Smtp-Source: APXvYqzbpSrVg1od9M7YjIxlN6vVmPwXoJsKz0E8nMZJ6Mg6HGtaUfD1fdUTK2ZuC3eZ7yuXhCiJ4sqXRdPzAnZlFow=
X-Received: by 2002:a5d:8353:: with SMTP id q19mr4961041ior.59.1566334021885; 
 Tue, 20 Aug 2019 13:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com>
 <20190722163049.kyupys7alq6zzq6x@thinkpad>
 <CAGMNF6UO0T7Dq4--QDXGkbWZ3CwKAhFSLxy5rKeMW-Af=V=o_A@mail.gmail.com>
 <843FFB1F-4CF1-45EB-80E1-216FD23C8E2D@fuzziesquirrel.com>
In-Reply-To: <843FFB1F-4CF1-45EB-80E1-216FD23C8E2D@fuzziesquirrel.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 20 Aug 2019 13:46:35 -0700
Message-ID: <CAGMNF6V-ReCHTbSpM0Ly65f+PsCZDf+KAjL+pEybmWKYaNjBjg@mail.gmail.com>
Subject: Re: Integrate collectd with OpenBMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000f9cd280590928ee2"
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
Cc: Gabriel Matute <gmatute@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f9cd280590928ee2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No problem, thanks!
Brad, could you also add Gabriel to the list of OpenBMC contributors? His
email is gabomatute@gmail.com
Does he need to sign the CLA individually?

On Tue, Aug 20, 2019 at 9:19 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> at 12:30 PM, Kun Yi <kunyi@google.com> wrote:
>
> > hi Brad,
> >
> > We are making some progress toward two things that we'd like to push
> > upstream:
> > 1. An C++ wrapper for RRD "-- librrdplus=E2=80=9D
> > 2. An IPMI OEM handler -- "rrd-ipmi-blobs=E2=80=9D
> >
> > Would you please help create these two repositories?
>
> done!
>
> Sorry about the delay Kun.  I added this to my todo list and then forgot
> about it :-(
>
> -brad
>


--=20
Regards,
Kun

--000000000000f9cd280590928ee2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No problem, thanks!=C2=A0<br><div>Brad, could you also add=
 Gabriel to the list of OpenBMC contributors? His email is=C2=A0<a href=3D"=
mailto:gabomatute@gmail.com">gabomatute@gmail.com</a></div><div>Does he nee=
d to sign the CLA individually?</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 20, 2019 at 9:19 AM Brad B=
ishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">=
bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">at 12:30 PM, Kun Yi &lt;<a href=3D"mailto:kunyi@=
google.com" target=3D"_blank">kunyi@google.com</a>&gt; wrote:<br>
<br>
&gt; hi Brad,<br>
&gt;<br>
&gt; We are making some progress toward two things that we&#39;d like to pu=
sh=C2=A0 <br>
&gt; upstream:<br>
&gt; 1. An C++ wrapper for RRD &quot;-- librrdplus=E2=80=9D<br>
&gt; 2. An IPMI OEM handler -- &quot;rrd-ipmi-blobs=E2=80=9D<br>
&gt;<br>
&gt; Would you please help create these two repositories?<br>
<br>
done!<br>
<br>
Sorry about the delay Kun.=C2=A0 I added this to my todo list and then forg=
ot=C2=A0 <br>
about it :-(<br>
<br>
-brad<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Regards,<div>Kun</div></div></div>

--000000000000f9cd280590928ee2--
