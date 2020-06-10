Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EE1F4BED
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 05:51:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hY1j2K5LzDqXq
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 13:51:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c2f;
 helo=mail-oo1-xc2f.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fDS71Ceq; dkim-atps=neutral
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hY0t18wpzDqKX
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2020 13:50:21 +1000 (AEST)
Received: by mail-oo1-xc2f.google.com with SMTP id e8so204305ooi.11
 for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2020 20:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v7Ug1lNZwnIwvG8nQAGnOjA9Fbh7nKpp3UH3mHsly4A=;
 b=fDS71Ceq+kjZPoPbCZpHxeniSb53p/F3qdb5eEBWp7akWLXotZxy30PhPR2r4dLoFB
 PE8MQq7X34vXe/8smO/Hn95SFXHGpDe7Lo1hlA12YjlWEWoBM6n0ML5kmTz7UG/mtBic
 Ik3BptLT9qYFfnpzobvv+eJeiAmBTCThOoy3PwUjbfCnKR/tKdOT89JFg29Fm9sT8BTG
 AXx0O8udHCfXqmOy2kcxE2yMa2aK7NNwjz93XLRJUOM/HfcVyfdoetmD6HRWasH6MYaw
 N5d/zkIKgKSNecfeWht9MnPgwQ8GcOUoc8zvezCBcNIi5V8NY1rF9LaXBiQUUf8ZEnKg
 C7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7Ug1lNZwnIwvG8nQAGnOjA9Fbh7nKpp3UH3mHsly4A=;
 b=R9wBjSWBmHmcle6FFS9ZZRo7tMiQjNIpS1YvhHboCt4d3Vi5zlyipF1V3nagxGwG83
 kxCjAl+wvJ3mBRIPv2hPEvJfJ9IjEfdSu98tyJR4JTYeCY6uRfUj7iSPE+yVNk3nnODt
 ewT3tyVJ4h7iVHUSKYNTDdmBUTS7VhDniHis03BkAXtLLcv19WV1/L5jOmh0D85L7nQf
 VU9zPKO4uUsuaLxuEry7z8GMaD7v+tla4UCo9Szw8HVClkmuAAfN33bLQ51ylKtUx81r
 cBlRfr/8vOUsVXW0iuXSoYP+kQv/MaQE2tLQ5A389aPDY9Pn7CSm+zDIuA0Hmx/r26hQ
 AwBw==
X-Gm-Message-State: AOAM530f6JBBEY3FSWQz5NyOpVSy4FmvF0NnQp3ZVwWdckB0LX3HmR05
 t9APbqLEyY0dNYlv83pgBxzxP0RMDgSyqqmKnTkXew==
X-Google-Smtp-Source: ABdhPJxI+tUA0WxbSzkKanynaVJhioke3+Bmj2LPrHJs4hSx0/h5JJfj6s6msFcxGAKn0KP6quZ+URCK578q+BHUXgM=
X-Received: by 2002:a4a:b48d:: with SMTP id b13mr872242ooo.82.1591761016624;
 Tue, 09 Jun 2020 20:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX80QSyf95+ibN24nwiAdNLCtdWOQdsgqaHvVbdEG9b8jbA@mail.gmail.com>
In-Reply-To: <CACWQX80QSyf95+ibN24nwiAdNLCtdWOQdsgqaHvVbdEG9b8jbA@mail.gmail.com>
From: Zhenfei Tai <ztai@google.com>
Date: Tue, 9 Jun 2020 20:50:05 -0700
Message-ID: <CAMXw96Mjuw7ci3kZcFAiF9mgKhYwiwo+b-bTHANB3YEwVwZ9fQ@mail.gmail.com>
Subject: Re: mTLS on bmcweb
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="000000000000f6fe1205a7b2bd16"
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

--000000000000f6fe1205a7b2bd16
Content-Type: text/plain; charset="UTF-8"

Hi Ed,

Thanks for the email with great details!

I came to realize that it was my misunderstanding/assumption which caused
the confusion.
I've reviewed the bmcweb TLS documentation and learned mTLS was only one
authentication option other than a requirement.

Zhenfei

On Sun, Jun 7, 2020 at 7:49 PM Ed Tanous <ed@tanous.net> wrote:

> >> I did more testing and found the reason why it accepts any client
> certification.
>
> It looks like you never got a great answer to this.
>
> There's a slight conflict between needs here.  On the one hand, bmcweb
> needs to support multiple authentication mechanisms, some of which are
> compatible with standards that are more or less set in stone (Redfish,
> Dbus-rest api, ect).  On the other hand, a lot of people looking to
> turn on mutual TLS auth are doing so to reduce the scope of code they
> have to "trust" for authentication down to only the SSL library, which
> (hopefully) is rigorously tested.  The problem arises here that there
> are modes, like Redfish and the webui, that require certain assets to
> be available without authentication.  In the case of Redfish, it
> requires the introspectable schema files, in the case of the webui,
> the static pages that make it up need to be loaded so the UI launches
> and the user sees a login page.  (Unrelated note, we make more than is
> needed available here, but that's a different problem.)
>
> When I first built the patch to do mutual TLS, my intention was to at
> least try to support as many authentication mechanisms as I could,
> hence the code you're looking at now that only uses the mutual TLS
> auth as a _possible_ authentication mechanism, leaving the final
> decision be made by the auth code in bmcweb.  One thing that seems to
> have gotten lost in translation somewhere between that code and when
> it hit master is that if mutual TLS is the only enabled authentication
> mechanism at that point in time, we know that we're not operating in
> any standards that would require static assets, and bmcweb can simply
> deny the connection on the front end, like you would expect, in the
> code that you've already found.
>
> TL;DR;
>
> Add something like this:
>
> // Get the current auth config
> AuthConfigMethods& methods =
> crow::persistent_data::SessionStore::getInstance().getAuthMethodsConfig();
> // if only mTLS is enabled, we can close the connection immediately,
> as no other auth methods will be tried.
> if (methods. xtoken == false &&
> methods.cookie == false &&
> methods.sessionToken == false &&
> methods.basic = false &&
> methods.tls == true){
>     return false;
> }
>
> Here:
> https://github.com/openbmc/bmcweb/blame/master/http/http_connection.h#L302
>
> ...and I suspect it'll work like you want.
>

--000000000000f6fe1205a7b2bd16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,<div><br></div><div>Thanks for the email with great =
details!</div><div><br></div><div>I came to realize that it was my misunder=
standing/assumption which caused the confusion.=C2=A0</div><div>I&#39;ve re=
viewed the bmcweb TLS documentation=C2=A0and learned mTLS was only one auth=
entication option other than a requirement.</div><div><br></div><div>Zhenfe=
i</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, Jun 7, 2020 at 7:49 PM Ed Tanous &lt;<a href=3D"mailto:ed@ta=
nous.net">ed@tanous.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">&gt;&gt; I did more testing and found the reason why=
 it accepts any client<br>
certification.<br>
<br>
It looks like you never got a great answer to this.<br>
<br>
There&#39;s a slight conflict between needs here.=C2=A0 On the one hand, bm=
cweb<br>
needs to support multiple authentication mechanisms, some of which are<br>
compatible with standards that are more or less set in stone (Redfish,<br>
Dbus-rest api, ect).=C2=A0 On the other hand, a lot of people looking to<br=
>
turn on mutual TLS auth are doing so to reduce the scope of code they<br>
have to &quot;trust&quot; for authentication down to only the SSL library, =
which<br>
(hopefully) is rigorously tested.=C2=A0 The problem arises here that there<=
br>
are modes, like Redfish and the webui, that require certain assets to<br>
be available without authentication.=C2=A0 In the case of Redfish, it<br>
requires the introspectable schema files, in the case of the webui,<br>
the static pages that make it up need to be loaded so the UI launches<br>
and the user sees a login page.=C2=A0 (Unrelated note, we make more than is=
<br>
needed available here, but that&#39;s a different problem.)<br>
<br>
When I first built the patch to do mutual TLS, my intention was to at<br>
least try to support as many authentication mechanisms as I could,<br>
hence the code you&#39;re looking at now that only uses the mutual TLS<br>
auth as a _possible_ authentication mechanism, leaving the final<br>
decision be made by the auth code in bmcweb.=C2=A0 One thing that seems to<=
br>
have gotten lost in translation somewhere between that code and when<br>
it hit master is that if mutual TLS is the only enabled authentication<br>
mechanism at that point in time, we know that we&#39;re not operating in<br=
>
any standards that would require static assets, and bmcweb can simply<br>
deny the connection on the front end, like you would expect, in the<br>
code that you&#39;ve already found.<br>
<br>
TL;DR;<br>
<br>
Add something like this:<br>
<br>
// Get the current auth config<br>
AuthConfigMethods&amp; methods =3D<br>
crow::persistent_data::SessionStore::getInstance().getAuthMethodsConfig();<=
br>
// if only mTLS is enabled, we can close the connection immediately,<br>
as no other auth methods will be tried.<br>
if (methods. xtoken =3D=3D false &amp;&amp;<br>
methods.cookie =3D=3D false &amp;&amp;<br>
methods.sessionToken =3D=3D false &amp;&amp;<br>
methods.basic =3D false &amp;&amp;<br>
methods.tls =3D=3D true){<br>
=C2=A0 =C2=A0 return false;<br>
}<br>
<br>
Here:<br>
<a href=3D"https://github.com/openbmc/bmcweb/blame/master/http/http_connect=
ion.h#L302" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc=
/bmcweb/blame/master/http/http_connection.h#L302</a><br>
<br>
...and I suspect it&#39;ll work like you want.<br>
</blockquote></div>

--000000000000f6fe1205a7b2bd16--
