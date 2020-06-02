Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9261EB5A1
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 08:08:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bhSF4NKhzDqTY
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 16:08:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FjBk0aSM; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bhRR6cDszDqS7
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 16:08:02 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id 202so5408290lfe.5
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2020 23:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c2KDwPQ+7dgNbpbNVpVM8WEueTJq66FWbi0vXvUANHc=;
 b=FjBk0aSMJ9tV/oYlmw0wFtt8h8N08KF/7GWuRT/QsPW0PF6IrdpqRPwQ/z8b5iF/R6
 PaHj7Qn8hoGj6UJIMX9uFbsqN2Aj8+0NetnFQq5qutKYUocaqZ54+TpmLOuA2rMLRTNS
 9TwZTtA6VqFKvwk4ApNfTTgPZY3dLtBpQwEs5+BAaFyadBwLtjVxmOSQVou9cEgHuhTx
 dfBAep8elSG2uTAcxs7evoX4iWRG6YAkHNJfogGcZtPE/f/QGdxLrQ0R75hQLTwlVHMu
 tI+qSprz8khr7mVniA0Hlf0Z/wn2nf5+Hw++c7D+peGQI19XvcBq5B3Hd6OnVsaHgM5y
 mcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c2KDwPQ+7dgNbpbNVpVM8WEueTJq66FWbi0vXvUANHc=;
 b=AxbRWLCg8E0FYYhsLZInNyqYIrMTAPi7IYBQ14xBcqJeIZFQEpOkp+Ulr9MesJf7vX
 TmWYO7Nv1UsyLEpA/940lE79lDHngu2Ik3d9TSG7/PrUK8k6KMcoQBw5iX/rvOWW6a9P
 8lNgqc/3BH0bm9/DuMIwUFdjMaQ1MfLWv9li+6T6+JZb2vWBpVOOzIzIvF8WTrmf+uu9
 S7UKAi/CcCH046U7EldtqbBMHjXlyHySUscXDXOYgTOF+ag1MulbR3p9A4hX1PzJZAhK
 gd2rAr4O8EbZGQ+IKU5E7DYVBHYrRfKR0x1/DGs5Uzwf2eXd42ee7mgkpm3Ie0nOyoxg
 av6A==
X-Gm-Message-State: AOAM530ma/2PzL7Xjj0qgj6NOLHIZZxTCRuU5m6GHMLakNkyz2vo98DU
 J9wfSJts10VFQVbehAnnG5ghhawz+6IyS9qVFIKO3A==
X-Google-Smtp-Source: ABdhPJy2gmX1dXZTtYAisd+pt+XjcEsEMFQyLDKTjUqWkyWl1v1ttxsSpiC1joSyc8JFkEnfxfp4edKAAnO0ZF1Wq6M=
X-Received: by 2002:ac2:4887:: with SMTP id x7mr12968637lfc.23.1591078077211; 
 Mon, 01 Jun 2020 23:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
 <CAGm54UGorGfE-0FKj_+o3faU6sO-DW5jRoqPxFzx0VKwuD6Juw@mail.gmail.com>
In-Reply-To: <CAGm54UGorGfE-0FKj_+o3faU6sO-DW5jRoqPxFzx0VKwuD6Juw@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Mon, 1 Jun 2020 23:07:46 -0700
Message-ID: <CAPnigKku77Tc60TAAb_yTJaWNePYWM204BF8erJS7CjhxrAPRA@mail.gmail.com>
Subject: Re: OpenBMC Logging and Error Handling Dos and Don'ts
To: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Content-Type: multipart/alternative; boundary="0000000000009aa50605a713bb20"
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009aa50605a713bb20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you use the fmt library it would only require one extra temporary string
to be constructed and it works trivially with something like phosphor
logging.

log<level::INFO>(fmt::format("My error: {}", filename));

It also has the advantage of understanding basic c++ types like
std::strings and std::string_views.

On Mon, Jun 1, 2020 at 8:33 PM =E9=83=81=E9=9B=B7 <yulei.sh@bytedance.com> =
wrote:

> > ---
> > ## Don't require `-o verbose` for systemd journal MESSAGE field context
> > The MESSAGE field of a systemd journal entry should be self describing
> and not
> > rely on additional structured log data.  For example when the MESSAGE
> field
> > references a filesystem path, the path should appear in the MESSAGE
> field.
> > When the MESSAGE field references a failed system call, the system call
> and the
> > return value should appear in the MESSAGE field.  This keeps the journa=
l
> > informative and useful for casual journal users.  Note that it is
> perfectly
> > acceptible to add (duplicate) structured log entry values for the data
> that
> > appears in MESSAGE.  This guideline only prescribes that the data _not_
> be
> > omitted from the MESSAGE field value.
> >
>
> I have a bit concern about this. The existing phosphor-logging API
> does not support this well.
> Specifically, it does not support the "printf" way to generate a
> string with the variables to log.
> So previously we typically put the variables in entries.
> I do agree that logging the variables in the MESSAGE field is much better=
.
> But to encourage such logging, the logging API should be enhanced to
> support the "printf" way.
> E.g.
>     log<level::INFO>("Something is wrong: %s:%d", xx, xxx);
> is much better than:
>     std::string to_log =3D xxx; // generate the message manually
>     log<level::INFO>(to_log);
>
> Otherwise, it's really not convenient to write such logging code.
>

--0000000000009aa50605a713bb20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you use the fmt library it would only require one extra=
 temporary string to be constructed and it works trivially with something l=
ike phosphor logging.<div><br></div><div>log&lt;level::INFO&gt;(fmt::format=
(&quot;My error: {}&quot;, filename));</div><div><br></div><div>It also has=
 the advantage=C2=A0of understanding basic c++ types like std::strings and =
std::string_views.</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 1, 2020 at 8:33 PM =E9=83=81=E9=9B=B7 &=
lt;<a href=3D"mailto:yulei.sh@bytedance.com">yulei.sh@bytedance.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; ---=
<br>
&gt; ## Don&#39;t require `-o verbose` for systemd journal MESSAGE field co=
ntext<br>
&gt; The MESSAGE field of a systemd journal entry should be self describing=
 and not<br>
&gt; rely on additional structured log data.=C2=A0 For example when the MES=
SAGE field<br>
&gt; references a filesystem path, the path should appear in the MESSAGE fi=
eld.<br>
&gt; When the MESSAGE field references a failed system call, the system cal=
l and the<br>
&gt; return value should appear in the MESSAGE field.=C2=A0 This keeps the =
journal<br>
&gt; informative and useful for casual journal users.=C2=A0 Note that it is=
 perfectly<br>
&gt; acceptible to add (duplicate) structured log entry values for the data=
 that<br>
&gt; appears in MESSAGE.=C2=A0 This guideline only prescribes that the data=
 _not_ be<br>
&gt; omitted from the MESSAGE field value.<br>
&gt;<br>
<br>
I have a bit concern about this. The existing phosphor-logging API<br>
does not support this well.<br>
Specifically, it does not support the &quot;printf&quot; way to generate a<=
br>
string with the variables to log.<br>
So previously we typically put the variables in entries.<br>
I do agree that logging the variables in the MESSAGE field is much better.<=
br>
But to encourage such logging, the logging API should be enhanced to<br>
support the &quot;printf&quot; way.<br>
E.g.<br>
=C2=A0 =C2=A0 log&lt;level::INFO&gt;(&quot;Something is wrong: %s:%d&quot;,=
 xx, xxx);<br>
is much better than:<br>
=C2=A0 =C2=A0 std::string to_log =3D xxx; // generate the message manually<=
br>
=C2=A0 =C2=A0 log&lt;level::INFO&gt;(to_log);<br>
<br>
Otherwise, it&#39;s really not convenient to write such logging code.<br>
</blockquote></div>

--0000000000009aa50605a713bb20--
