Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023A1EC57C
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 01:10:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c76v1lNnzDqS8
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 09:10:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ZfJOlbVz; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c7695tsqzDqS3
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 09:09:37 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id c11so354490ljn.2
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2020 16:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o1oGzJ6nvz5iHlj4lmNa8C+h/SC8zPj+HciYm7Ilnj4=;
 b=ZfJOlbVzalgHg9HzFZXWvpuRNpJBR3TGJ2vV0PA6P/0DTGCPOO7SDKdBvD27hdk24z
 wJM8KUB9D0vHJTCkfjvmf1/+pp3I4S4QjJq4PFSNomA+bM0MPIiQjV7pMvHyWaiGh+Th
 PP7aq69r+Xs6l7lmYDbRYCsyqcUsW0iYpJ7oIgZ+5AQJYXzI0JyfonwSC6sNN5o4Iql8
 8vc5rkFdkKOY3t/XBbMvRMOpMLz86REdZa1qObi/s4w8Bi+DVbq6ZUUcJup55YtBz48r
 YinYANxYWKGAsRlLQ7UgOU8dDX4XPT+x+QattfZ5wONvKLxgzo9hupqLN98BTVuu6G+t
 zAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o1oGzJ6nvz5iHlj4lmNa8C+h/SC8zPj+HciYm7Ilnj4=;
 b=R2oOgHZJ5OtF70U4MZwyBJhA6dr5LHeuK9ZE2Wb3/aNy1WmgEcL6AiFB3oju0JTy3m
 0HbDp95PIREFk4l/sJg+dgnVJ5C51ES1Ibx3fid7HBqSTxbGmAlvMljuWbQX2S8dJLdd
 bN7jSbwDy6MhyhiICoGe53ttxHOM48YXZlhztcPIa2zLIfu42nOnMV1fbx+DEZ7Uro10
 iqj5EImSMrsJPp6C/vE9MHhHoM0zzpje3sJbGCpWGUnPLTJi0jH0Z0f8+EWWi0n3bSvu
 2m6ZrtOoMtfJd5M/648tSJKNaUHLapNfRsaXdG+VbqNcXdTXNg5+SvtW911jyOHHavdn
 8SKQ==
X-Gm-Message-State: AOAM530epD55+VxivxI3BSAls4isd1+CXoKwV+caQa+GmZACxe8c77yb
 euwId8+y1mBPF8eZ3xSINK6g7ptfjr33JIZmcUl4TaF3lvQ=
X-Google-Smtp-Source: ABdhPJynReZXz8NBy2dZBl0+iLV2f/2F82QHyu+9NscC7/foc8nexNH5GcH6JBpsNp6FHsQ9VHhXVM6mChHQeVKc57U=
X-Received: by 2002:a05:651c:120d:: with SMTP id
 i13mr581942lja.381.1591139372747; 
 Tue, 02 Jun 2020 16:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
 <CAGm54UGorGfE-0FKj_+o3faU6sO-DW5jRoqPxFzx0VKwuD6Juw@mail.gmail.com>
 <CAPnigKku77Tc60TAAb_yTJaWNePYWM204BF8erJS7CjhxrAPRA@mail.gmail.com>
 <20200602230639.GK17541@heinlein>
In-Reply-To: <20200602230639.GK17541@heinlein>
From: William Kennington <wak@google.com>
Date: Tue, 2 Jun 2020 16:09:21 -0700
Message-ID: <CAPnigKk76EqMo=dZEJ1s6zi9w9DcsiEVbtDY1-2aj-PERjuqew@mail.gmail.com>
Subject: Re: OpenBMC Logging and Error Handling Dos and Don'ts
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000001a245f05a7220103"
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 openbmc <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001a245f05a7220103
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The structured messaging is good to keep, but we should put more useful
information into the message. The message doesn't need to have structure.
Having duplicate information should be okay and desirable to make messages
nicely human parseable. Not sure I like just appending in the key/values
passed as systemd message entries.

On Tue, Jun 2, 2020 at 4:06 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Mon, Jun 01, 2020 at 11:07:46PM -0700, William Kennington wrote:
> > If you use the fmt library it would only require one extra temporary
> string
> > to be constructed and it works trivially with something like phosphor
> > logging.
> >
> > log<level::INFO>(fmt::format("My error: {}", filename));
> >
> > It also has the advantage of understanding basic c++ types like
> > std::strings and std::string_views.
> >
> > On Mon, Jun 1, 2020 at 8:33 PM =E9=83=81=E9=9B=B7 <yulei.sh@bytedance.c=
om> wrote:
> >
> > > I have a bit concern about this. The existing phosphor-logging API
> > > does not support this well.
> > > Specifically, it does not support the "printf" way to generate a
> > > string with the variables to log.
> > > So previously we typically put the variables in entries.
> > > I do agree that logging the variables in the MESSAGE field is much
> better.
> > > But to encourage such logging, the logging API should be enhanced to
> > > support the "printf" way.
> > > E.g.
> > >     log<level::INFO>("Something is wrong: %s:%d", xx, xxx);
> > > is much better than:
> > >     std::string to_log =3D xxx; // generate the message manually
> > >     log<level::INFO>(to_log);
> > >
> > > Otherwise, it's really not convenient to write such logging code.
> > >
>
> Separate from this proposal from Brad, I'd like to work on a
> next-generation of phosphor-logging.  When we originally implemented
> phosphor-logging we were all pretty new to C++14.  I think there can be
> some great improvement in the syntax of phosphor-logging now that we
> have C++17 (and more experience).
>
> The biggest change I'd like to do is in the way the structured entries
> are defined, but I think we can improve the verbosity of syntax in
> making a log in general.
>
> Some example syntax:
>
> // Current syntax (and I'm being especially verbose on the namespaces).
> phosphor::logging::log<phosphor::logging::level::ERR>("Some message",
>     phosphor::logging::entry("EXAMPLE=3D%s"), example_str);
>
> // Potential syntax
> lg::error("Some message", "EXAMPLE"_s, example_str);
>
> In a code-review I was on, we had some discussions about how difficult
> it is to create data that isn't in the "-o verbose" and I think William
> and Lei are both referring to that as well.  I am concerned that a
> generic format leads us more to unstructured logging, which personally I
> don't like.  My suggestion is that we have some easy syntax to indicate
> "also put this structured data into the raw message" so that my example
> above the message becomes "Some message. EXAMPLE=3D'the string'".
>
> I'd be interested to hear what "next generation logging" others have in
> mind.
>
> --
> Patrick Williams
>

--0000000000001a245f05a7220103
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The structured messaging is good to keep, but we should pu=
t more useful information into the message. The message doesn&#39;t need to=
 have structure. Having duplicate information=C2=A0should be okay and desir=
able to make messages nicely human parseable. Not sure I like just appendin=
g in the key/values passed as systemd message entries.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2, 2020 =
at 4:06 PM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patric=
k@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, Jun 01, 2020 at 11:07:46PM -0700, William Kennington wro=
te:<br>
&gt; If you use the fmt library it would only require one extra temporary s=
tring<br>
&gt; to be constructed and it works trivially with something like phosphor<=
br>
&gt; logging.<br>
&gt; <br>
&gt; log&lt;level::INFO&gt;(fmt::format(&quot;My error: {}&quot;, filename)=
);<br>
&gt; <br>
&gt; It also has the advantage of understanding basic c++ types like<br>
&gt; std::strings and std::string_views.<br>
&gt; <br>
&gt; On Mon, Jun 1, 2020 at 8:33 PM =E9=83=81=E9=9B=B7 &lt;<a href=3D"mailt=
o:yulei.sh@bytedance.com" target=3D"_blank">yulei.sh@bytedance.com</a>&gt; =
wrote:<br>
&gt; <br>
&gt; &gt; I have a bit concern about this. The existing phosphor-logging AP=
I<br>
&gt; &gt; does not support this well.<br>
&gt; &gt; Specifically, it does not support the &quot;printf&quot; way to g=
enerate a<br>
&gt; &gt; string with the variables to log.<br>
&gt; &gt; So previously we typically put the variables in entries.<br>
&gt; &gt; I do agree that logging the variables in the MESSAGE field is muc=
h better.<br>
&gt; &gt; But to encourage such logging, the logging API should be enhanced=
 to<br>
&gt; &gt; support the &quot;printf&quot; way.<br>
&gt; &gt; E.g.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0log&lt;level::INFO&gt;(&quot;Something is wron=
g: %s:%d&quot;, xx, xxx);<br>
&gt; &gt; is much better than:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0std::string to_log =3D xxx; // generate the me=
ssage manually<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0log&lt;level::INFO&gt;(to_log);<br>
&gt; &gt;<br>
&gt; &gt; Otherwise, it&#39;s really not convenient to write such logging c=
ode.<br>
&gt; &gt;<br>
<br>
Separate from this proposal from Brad, I&#39;d like to work on a<br>
next-generation of phosphor-logging.=C2=A0 When we originally implemented<b=
r>
phosphor-logging we were all pretty new to C++14.=C2=A0 I think there can b=
e<br>
some great improvement in the syntax of phosphor-logging now that we<br>
have C++17 (and more experience).<br>
<br>
The biggest change I&#39;d like to do is in the way the structured entries<=
br>
are defined, but I think we can improve the verbosity of syntax in<br>
making a log in general.<br>
<br>
Some example syntax:<br>
<br>
// Current syntax (and I&#39;m being especially verbose on the namespaces).=
<br>
phosphor::logging::log&lt;phosphor::logging::level::ERR&gt;(&quot;Some mess=
age&quot;,<br>
=C2=A0 =C2=A0 phosphor::logging::entry(&quot;EXAMPLE=3D%s&quot;), example_s=
tr);<br>
<br>
// Potential syntax<br>
lg::error(&quot;Some message&quot;, &quot;EXAMPLE&quot;_s, example_str);<br=
>
<br>
In a code-review I was on, we had some discussions about how difficult<br>
it is to create data that isn&#39;t in the &quot;-o verbose&quot; and I thi=
nk William<br>
and Lei are both referring to that as well.=C2=A0 I am concerned that a<br>
generic format leads us more to unstructured logging, which personally I<br=
>
don&#39;t like.=C2=A0 My suggestion is that we have some easy syntax to ind=
icate<br>
&quot;also put this structured data into the raw message&quot; so that my e=
xample<br>
above the message becomes &quot;Some message. EXAMPLE=3D&#39;the string&#39=
;&quot;.<br>
<br>
I&#39;d be interested to hear what &quot;next generation logging&quot; othe=
rs have in<br>
mind.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--0000000000001a245f05a7220103--
