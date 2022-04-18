Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D5505A73
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 17:03:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhqtV630Sz3bYn
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 01:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Di1m9HZH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=ratankgupta31@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Di1m9HZH; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khqt63Gyqz2xD4
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2022 01:02:36 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id v4so17736071edl.7
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7sWbJrRXSp2TG3rlJSziNYBoGm6eiXxI3W3rYheAD0M=;
 b=Di1m9HZHFN8c2E5OKIRmvCaGq6ALWoNkYryxzlaMEdiHyGuil25nnRkAaUBZ3vcPua
 hTuKykAf6Sqy6PhJ3Z9uwGMYpKKgmW+G+/BuPOym3uCy+7D3SBO9PbltZvbc0Nanp3r9
 hTyirMuuO7KtkUBfG5khX7bhLBluqU0N8hEyK7l+NQkt+t96eZe1iWWmVHJKh1vpiS9M
 FGDyKskgHMORumN7qLN3BZxLGVZ7YFQlWn+3L68vAwIWcrfKd/dWvFLUYV/4XKWIwh7H
 g8RrAgdE1N+ibBp9rsEYY5gmjG7SoCsjSzs6uAV2N0ds7ajfTT/oUqQFD5ft7qzF5ncw
 r52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7sWbJrRXSp2TG3rlJSziNYBoGm6eiXxI3W3rYheAD0M=;
 b=ySCj6C8WnKUhP7Im9FAEL+Dy1pHHblBwcjb7H+oPhKtr/1ogZAiVojtZI62+ELhytj
 6Vff7tHm2TaMOcDPTEjwcDzftuX6hl6duaL2zMfND3PS/bcZmO9kKwQEJ4m/6mVAQqM/
 xqr0qXWc+kKiOIQv4YlSM9XJ/suRmjEw4GVTnmrehGplTLG0T3HnQyaRyRY+PlsNNDRV
 sIAUKQjutoevIz01p3gzdlPJ8MmuyekdphUU40EiUTujWNUL/00NNJHDbIHM0y15c0aJ
 CH5iDJr+vQjhObeqIzfzbsHbcsconXCK7mwo6nLKaBU0l6kgZZ8nfwEHMQt+jcFuUwXY
 lNpg==
X-Gm-Message-State: AOAM533QKtBSKTHbffjok/lIOevBBekr5jT2msGlFgMNm6ETXB542AXM
 GuzntnE7b5ud73CChLO75kPvzhvKttj92sg32JA=
X-Google-Smtp-Source: ABdhPJwfZ42SoJmxekbbj0Trkuvffjcb+tWnloDV/fDfGzRXJW9jfK1IaFB2zNp+APrgHLdI3zEX+aadTZINqa7yU3c=
X-Received: by 2002:a05:6402:3604:b0:41c:c4e6:2988 with SMTP id
 el4-20020a056402360400b0041cc4e62988mr12668843edb.157.1650294147148; Mon, 18
 Apr 2022 08:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <04f7f71d-16db-ce88-f359-f7d60c0a798e@linux.ibm.com>
 <41e89e78-67f2-77d2-60f4-63b2bb86d60f@linux.ibm.com>
In-Reply-To: <41e89e78-67f2-77d2-60f4-63b2bb86d60f@linux.ibm.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Mon, 18 Apr 2022 20:32:16 +0530
Message-ID: <CAMhqiMoCssRy5qQWAvxSFwQQKGCDvKim36yh4aH=9cYr_7ZHZA@mail.gmail.com>
Subject: Re: Security Working Group meeting - Wednesday April 13 - results
To: Joseph Reynolds <jrey@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000006a6f0005dcef0c04"
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006a6f0005dcef0c04
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Apparmor doesn't work with openbmc stack, I tried it around 6 months back,
opened up the issue and finally it was told by the apparmor that it is not
trivial one.

https://gitlab.com/apparmor/apparmor/-/issues/183

Ratan

On Thu, Apr 14, 2022 at 3:00 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:

> On 4/12/22 11:28 AM, Joseph Reynolds wrote:
> > This is a reminder of the OpenBMC Security Working Group meeting
> > scheduled for this Wednesday April 13 at 10:00am PDT.
> >
> > We'll discuss the following items on the agenda
> > <
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>,
>
> > and anything else that comes up:
> >
>
> Attended: Joseph Reynolds, Ruud Haring, Chris Engel, Dick (Phoenix),
> Dong Chen, Jesse Arroyo, Yakatawa Sugawara, Russel Wilson, Krishnan
> Sugvanam, Manojkiran Eda, McCawley, Robert Senger, Sandhya Keteshwara,
> Surya (Intel), James Mihm, Terry Duncan, (and unknown caller who joined
> as the meeting was ending).
>
>
> > 1. Renewed interest in securing D-Bus interfaces and using SELinux.
>
> Ruud Haring and Yataka Sugawara and Russel Wilson from IBM Research
> presented a proposal.
>
>
> A recording was made of the presentation and discussion.  TODO: Post the
> recording.
>
>
> DISCUSSION:
>
> The proposal PDF will be shared with the OpenBMC community.  Here is my
> summary of the main points: SELinux is preferred by IBM and some large
> customers to solve several related access control problems: limiting
> access of root processes, application trust, systemd, and D-Bus.  See
> previous discussion 2020-05-13 below: SELinux email use cases and email
> https://lists.ozlabs.org/pipermail/openbmc/2020-April/021477.html
> <https://lists.ozlabs.org/pipermail/openbmc/2020-April/021477.html>
>
>
> Next steps: Follow
>
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#planning-changes
> <
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#planning-changes>with
>
> email discussion, Discord (per
> https://github.com/openbmc/openbmc#contact
> <https://github.com/openbmc/openbmc#contact>) and creating a design for
> phase 1 (below).
>
>
> TODO: Joseph to send email to begin the discussion about SELinux use
> cases which might be shared by multiple OpenBMC users.
>
>
> IBM plans to work in the OpenBMC community project: stage 1 is an opt-in
> SELinux in permissive mode to collect data about which policies are
> needed.  Later stages are to create SELinux policies for access control,
> and then to change configure SELinux to enforce them.
>
>
> Does OpenBMC have existing SELinux policies?  None are known, but see
> the Yocto/OE meta-selinux layer and associated docs.
>
>
> We discussed some difficulties in using SELinux: Configuring the
> meta-selinux layer, configuring the Linux Kernel, and additional space
> requirements (about 20MB)
>
>
> We discussed SELinux vs AppArmor.  IBM has chosen SELinux because it is
> well known to IBM and customers, and has an active community.  Note the
> planned SELinux support is opt-in, so another contributor can add
> AppArmor as needed.
>
>
> The intended reference platform is an x86 system running with the
> AST2600 and  256Mb (or more) flash storage..
>
>
> We discussed SELinux & D-Bus tie-ins.  (OpenBMC D-Bus runs in system
> mode.)  Note that D-Bus has built-in support for SELinux.
>
>
>
> > Access, agenda and notes are in the wiki:
> > https://github.com/openbmc/openbmc/wiki/Security-working-group
> > <https://github.com/openbmc/openbmc/wiki/Security-working-group>
> >
> > - Joseph
> >
>
>

--0000000000006a6f0005dcef0c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,<div><br></div><div>Apparmor doesn&#39;t work with=
 openbmc stack, I tried it around 6 months back, opened up the issue and fi=
nally=C2=A0it was told by the apparmor that it is not trivial one.</div><di=
v><br></div><div><a href=3D"https://gitlab.com/apparmor/apparmor/-/issues/1=
83">https://gitlab.com/apparmor/apparmor/-/issues/183</a><br></div><div><br=
></div><div>Ratan</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Apr 14, 2022 at 3:00 AM Joseph Reynolds &lt;=
<a href=3D"mailto:jrey@linux.ibm.com">jrey@linux.ibm.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 4/12/22 11:28 AM=
, Joseph Reynolds wrote:<br>
&gt; This is a reminder of the OpenBMC Security Working Group meeting <br>
&gt; scheduled for this Wednesday April 13 at 10:00am PDT.<br>
&gt;<br>
&gt; We&#39;ll discuss the following items on the agenda <br>
&gt; &lt;<a href=3D"https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZs=
U2ehMq4xoJRQvLxxsDUWmAOI" rel=3D"noreferrer" target=3D"_blank">https://docs=
.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI</a>&gt;=
, <br>
&gt; and anything else that comes up:<br>
&gt;<br>
<br>
Attended: Joseph Reynolds, Ruud Haring, Chris Engel, Dick (Phoenix), <br>
Dong Chen, Jesse Arroyo, Yakatawa Sugawara, Russel Wilson, Krishnan <br>
Sugvanam, Manojkiran Eda, McCawley, Robert Senger, Sandhya Keteshwara, <br>
Surya (Intel), James Mihm, Terry Duncan, (and unknown caller who joined <br=
>
as the meeting was ending).<br>
<br>
<br>
&gt; 1. Renewed interest in securing D-Bus interfaces and using SELinux.<br=
>
<br>
Ruud Haring and Yataka Sugawara and Russel Wilson from IBM Research <br>
presented a proposal.<br>
<br>
<br>
A recording was made of the presentation and discussion.=C2=A0 TODO: Post t=
he <br>
recording.<br>
<br>
<br>
DISCUSSION:<br>
<br>
The proposal PDF will be shared with the OpenBMC community.=C2=A0 Here is m=
y <br>
summary of the main points: SELinux is preferred by IBM and some large <br>
customers to solve several related access control problems: limiting <br>
access of root processes, application trust, systemd, and D-Bus.=C2=A0 See =
<br>
previous discussion 2020-05-13 below: SELinux email use cases and email <br=
>
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-April/021477.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/pipermail/=
openbmc/2020-April/021477.html</a> <br>
&lt;<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-April/021477=
.html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/piperm=
ail/openbmc/2020-April/021477.html</a>&gt;<br>
<br>
<br>
Next steps: Follow <br>
<a href=3D"https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#plan=
ning-changes" rel=3D"noreferrer" target=3D"_blank">https://github.com/openb=
mc/docs/blob/master/CONTRIBUTING.md#planning-changes</a> <br>
&lt;<a href=3D"https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#=
planning-changes" rel=3D"noreferrer" target=3D"_blank">https://github.com/o=
penbmc/docs/blob/master/CONTRIBUTING.md#planning-changes</a>&gt;with <br>
email discussion, Discord (per <br>
<a href=3D"https://github.com/openbmc/openbmc#contact" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/openbmc/openbmc#contact</a> <br>
&lt;<a href=3D"https://github.com/openbmc/openbmc#contact" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/openbmc/openbmc#contact</a>&gt;) an=
d creating a design for <br>
phase 1 (below).<br>
<br>
<br>
TODO: Joseph to send email to begin the discussion about SELinux use <br>
cases which might be shared by multiple OpenBMC users.<br>
<br>
<br>
IBM plans to work in the OpenBMC community project: stage 1 is an opt-in <b=
r>
SELinux in permissive mode to collect data about which policies are <br>
needed.=C2=A0 Later stages are to create SELinux policies for access contro=
l, <br>
and then to change configure SELinux to enforce them.<br>
<br>
<br>
Does OpenBMC have existing SELinux policies?=C2=A0 None are known, but see =
<br>
the Yocto/OE meta-selinux layer and associated docs.<br>
<br>
<br>
We discussed some difficulties in using SELinux: Configuring the <br>
meta-selinux layer, configuring the Linux Kernel, and additional space <br>
requirements (about 20MB)<br>
<br>
<br>
We discussed SELinux vs AppArmor.=C2=A0 IBM has chosen SELinux because it i=
s <br>
well known to IBM and customers, and has an active community.=C2=A0 Note th=
e <br>
planned SELinux support is opt-in, so another contributor can add <br>
AppArmor as needed.<br>
<br>
<br>
The intended reference platform is an x86 system running with the <br>
AST2600 and=C2=A0 256Mb (or more) flash storage..<br>
<br>
<br>
We discussed SELinux &amp; D-Bus tie-ins.=C2=A0 (OpenBMC D-Bus runs in syst=
em <br>
mode.)=C2=A0 Note that D-Bus has built-in support for SELinux.<br>
<br>
<br>
<br>
&gt; Access, agenda and notes are in the wiki:<br>
&gt; <a href=3D"https://github.com/openbmc/openbmc/wiki/Security-working-gr=
oup" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbm=
c/wiki/Security-working-group</a> <br>
&gt; &lt;<a href=3D"https://github.com/openbmc/openbmc/wiki/Security-workin=
g-group" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/op=
enbmc/wiki/Security-working-group</a>&gt;<br>
&gt;<br>
&gt; - Joseph<br>
&gt;<br>
<br>
</blockquote></div>

--0000000000006a6f0005dcef0c04--
