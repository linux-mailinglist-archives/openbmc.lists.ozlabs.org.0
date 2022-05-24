Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFA55321C4
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 05:54:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6gLr3MZvz308C
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 13:54:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=o3okTujt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=jebr@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=o3okTujt; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6gLP4TKHz2ypf
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 13:54:20 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id a10so17217552ioe.9
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 20:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iBi61UDBureQMZRDOcamIquswsq8e/thbperu9e1484=;
 b=o3okTujtpKhBXEHQpgc9J7aiIRIDN8FLlUXEP8jWxwA3Qr8EobdZGwVV28pLBCRCyB
 JyLbH2CqwCYhMBtjWBOQUTMkuNNZdDuwCm5GnW39KUCelnK1fxelcvOqdNAimojG+xxe
 OvssLl4Rsyz+qlN8HHW76GqnNqVojaO9TpHJg539sOonvQ8TXiJTZYz+nZbUkHU0J2z8
 FLE+C+mrnl4oHWps0ngqMfsLaiuo2v4rhrJf2K5tDaB/Hlp1HGrNsqQziC01rGnljbdw
 gKp/ORzWsD9zW3tKOmy424J9viMhOw8nW7N8JrNQEbS9xz8seFlTczU6bl5JPPGP2H90
 JASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iBi61UDBureQMZRDOcamIquswsq8e/thbperu9e1484=;
 b=CMHmT2o/bMSWRdYwaraVjgUSZHSY9bNRkK4fsHm0ss3iuRwHPJsyDKWWGFUIoXxo38
 eF09tCHdNLVJC3ahOnqDkx1OmnlONjbHEiFr/tn28CAbewrN8RRCFW70k5rVdHuU5e5g
 JIYxg7wTROubyVyCLiC66ew5mSEDtRPG97m3mVXopea/jKoLVRDWdVrFrpS0aTlsNM6h
 LuKy+JCcqjUoySguzpztW+330c4q6eF+naFQuB+ITXNGben4Ghv3ZGiOPI5kcu4+1ruz
 Wfc5qXRGOpX6JvmV3fNF824IbnFKh+QbnMIue4bNogX2iS+mhtxEWFKzq/hDQgXgqRcc
 eKiQ==
X-Gm-Message-State: AOAM533goze7dWwJtpdiSPaerAmhdgpLg9yB6KacPuOnlm4R3XJbFIGS
 VaZnNjRxghy8uFgPa6pUXqyy6/BC542M+mRKTi5FUw==
X-Google-Smtp-Source: ABdhPJxVUqwfpdLUopNtBTH2JExSWP1+Y2HmIPZ5khpJ1OmkObBoDz67t9Wxhn1SofuPyDE11AF0f7bozUVrVjNTFuY=
X-Received: by 2002:a02:230a:0:b0:32b:6f71:4411 with SMTP id
 u10-20020a02230a000000b0032b6f714411mr13506100jau.214.1653364457094; Mon, 23
 May 2022 20:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
 <CAEAQM=Lo9AcUrw1c2bT_pYNtG0LpT9w2=McMbx=RY=SP0V_4PA@mail.gmail.com>
 <CAH2-KxBqT-A91Jpj9ENTcajvgzO=oDRsTUPe=eLaOVBhVSjDqw@mail.gmail.com>
 <CAPw1Ef_dMf43e567LLAfMZp6khWWQAm=i63LHfOwWkyiSe-MFA@mail.gmail.com>
 <20220523234825.lcbgr2kljbf536cx@cheese>
In-Reply-To: <20220523234825.lcbgr2kljbf536cx@cheese>
From: John Broadbent <jebr@google.com>
Date: Mon, 23 May 2022 20:54:06 -0700
Message-ID: <CAPw1Ef8K3Nti_Gq03ACkUvgPZCuJyQHDhKq6TRLqJi_JmU69aA@mail.gmail.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="00000000000026c35205dfb9e9ce"
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
Cc: Ed Tanous <edtanous@google.com>, Cody Smith <scody@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000026c35205dfb9e9ce
Content-Type: text/plain; charset="UTF-8"

> My point is, I am having trouble accepting that community pushback is
> what causes downstream patches.

Could you give me some insight on that? Why does that surprise you?

I don't want to call out any concrete examples without talking to the
change owner first.
(I don't want to put them on 'blast')

But we can glance at my work.
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53563/8
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53325

I have been trying to get these two changes in for the last 19
calendar days. If it gets heldup by
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/53676.
I might have to patch to make my deadline.

The ask in PDI will take real time to negotiate, maybe months (as the last
attempt took 5 months, and still failed)
My schedule says I had 3 weeks to make this change?

Again, would rather not talk about others patches, but if you have insight
please feel free to join in.

Thanks



On Mon, May 23, 2022 at 4:48 PM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> On Mon, May 23, 2022 at 02:07:55PM -0700, John Broadbent wrote:
>
> >>  "I have no interest in making this easier for you (if it is worse in
> >other ways for the project)."   - referring to downstream only features.
>
> >This is the wrong way to view features the community does not want,
>
> Can you talk about what features the community does not want?  If I pick
> on Google a little bit there is already a google-misc repo where Google
> puts whatever features it wants.  There is the meta-google layer that
> doesn't actually have any platforms in it.  There is the newly approved
> Google SMM logging feature/repo.  There is an OEM Google REST API in
> upstream bmcweb.  There are multiple Google OEM IPMI repositories.  And
> to be fair, Google isn't alone here - IBM has an API in bmcweb and
> layers without platforms too.  Where is the external (community) push
> back on features?  The only one I am aware of is a feature IBM wanted to
> contribute (which for the record, I am not convinced rejecting it was
> appropriate):
>
> https://lore.kernel.org/openbmc/CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com/
>
> My point is, I am having trouble accepting that community pushback is
> what causes downstream patches.
>
> > and features we would not be allowed to share.
>
> This I can accept as a generator of downstream patches.  I actually
> support the monorepo concept for the most part, but not with this as
> motivation.  If IBM's pay-for-access feature (reference the thread I
> linked above if that doesn't make sense) was counter to the spirit of
> open source (again, I don't think it is), adding this kind of thinking
> to our decision process is even more counter.
>
> >There is a layer of complexity
> >that we use to integrate with our data centers services that only we need.
> >A better model would allow openbmc to be flexible enough to enable
> >downstream features.
>
> And an even better model would be one where there is a path to getting
> all features upstream?
>

--00000000000026c35205dfb9e9ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; My point is, I am having trouble accepting that commu=
nity pushback is<br>&gt; what causes downstream patches.<div><br></div><div=
>Could you give me some insight on that? Why does that surprise=C2=A0you?</=
div><div><br></div><div>I don&#39;t want to call out any concrete examples =
without talking to the change owner first.</div><div>(I don&#39;t want to p=
ut them on &#39;blast&#39;)<br><br></div><div>But we can glance at my work.=
=C2=A0=C2=A0</div><div><a href=3D"https://gerrit.openbmc.org/c/openbmc/bmcw=
eb/+/53563/8">https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53563/8</a><br>=
</div><div><a href=3D"https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53325">=
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53325</a><br></div><div><br><=
/div><div><div>I have been trying to get these two changes in for the last =
19 calendar=C2=A0days. If it gets heldup=C2=A0by</div><div><a href=3D"https=
://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/53676">https://g=
errit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/53676</a>.</div><div=
>I might have to patch to make my deadline.</div><div>=C2=A0</div><div>The =
ask in PDI will take real time to=C2=A0negotiate, maybe months (as the last=
 attempt took 5 months, and still failed)<br>My schedule=C2=A0says I had 3 =
weeks to make this change?</div><div><br></div><div>Again, would rather not=
 talk about others patches, but if you have insight please feel free to joi=
n in.</div><div><br></div><div>Thanks</div><div></div></div><div><br></div>=
</div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, May 23, 2022 at 4:48 PM Brad Bishop &lt;<a href=3D"mailto:bradl=
eyb@fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon=
, May 23, 2022 at 02:07:55PM -0700, John Broadbent wrote:<br>
<br>
&gt;&gt;=C2=A0 &quot;I have no interest in making this easier for you (if i=
t is worse in<br>
&gt;other ways for the project).&quot;=C2=A0 =C2=A0- referring to downstrea=
m only features.<br>
<br>
&gt;This is the wrong way to view features the community does not want, <br=
>
<br>
Can you talk about what features the community does not want?=C2=A0 If I pi=
ck <br>
on Google a little bit there is already a google-misc repo where Google <br=
>
puts whatever features it wants.=C2=A0 There is the meta-google layer that =
<br>
doesn&#39;t actually have any platforms in it.=C2=A0 There is the newly app=
roved <br>
Google SMM logging feature/repo.=C2=A0 There is an OEM Google REST API in <=
br>
upstream bmcweb.=C2=A0 There are multiple Google OEM IPMI repositories.=C2=
=A0 And <br>
to be fair, Google isn&#39;t alone here - IBM has an API in bmcweb and <br>
layers without platforms too.=C2=A0 Where is the external (community) push =
<br>
back on features?=C2=A0 The only one I am aware of is a feature IBM wanted =
to <br>
contribute (which for the record, I am not convinced rejecting it was <br>
appropriate):<br>
<a href=3D"https://lore.kernel.org/openbmc/CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDF=
weqsttTULRJK38o1Ung@mail.gmail.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lore.kernel.org/openbmc/CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK=
38o1Ung@mail.gmail.com/</a><br>
<br>
My point is, I am having trouble accepting that community pushback is <br>
what causes downstream patches.<br>
<br>
&gt; and features we would not be allowed to share. <br>
<br>
This I can accept as a generator of downstream patches.=C2=A0 I actually <b=
r>
support the monorepo concept for the most part, but not with this as <br>
motivation.=C2=A0 If IBM&#39;s pay-for-access feature (reference the thread=
 I <br>
linked above if that doesn&#39;t make sense) was counter to the spirit of <=
br>
open source (again, I don&#39;t think it is), adding this kind of thinking =
<br>
to our decision process is even more counter.<br>
<br>
&gt;There is a layer of complexity<br>
&gt;that we use to integrate with our data centers services that only we ne=
ed.<br>
&gt;A better model would allow openbmc to be flexible enough to enable<br>
&gt;downstream features.<br>
<br>
And an even better model would be one where there is a path to getting <br>
all features upstream?<br>
</blockquote></div>

--00000000000026c35205dfb9e9ce--
