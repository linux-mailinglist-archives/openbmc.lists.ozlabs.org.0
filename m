Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCFF105C9E
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 23:25:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JvJN1W7GzDr8H
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 09:25:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PdQBmGCk"; 
 dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JvHk6Kv8zDr5s
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 09:24:32 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id f16so3938370lfm.3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 14:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wzu8I67mOQxzL4/1nCBHldVyNb8hay5fRUGyNvel+CU=;
 b=PdQBmGCk27zWxsiXzQL88/tCvJ25Wfbg7lAKUAx3z2oVwlsKsc4DYY4RlobZ+roVAp
 v44SHTXRdG46TaYie08WJjM/pU6FVfyCOEVUqxZHcz+uza4CllT8+oUJ8Tp32hq4lmmO
 dVBwvGkprU4pI9uAT2XmD85USaNJRy7vWp5yQ48iM1jORrqCIzx9HJSGtMts/+aEjXjK
 7AuRTDkSrnq+EfHSyD7FTdgWSFGI58mlIGZIdTgVRefjFGcL5l+4Jj8tWuCOSOxb6itR
 utB+TKv6GM3ppqGkjXVjZoRfCc7iEnTITBp64to5h+7fcnG3ADDJSwoOsgOBJxjJFyao
 XEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wzu8I67mOQxzL4/1nCBHldVyNb8hay5fRUGyNvel+CU=;
 b=onzXXvCkVypu7ubw3RtFJ8amnw9OqbP5h+ZMbE0OccmCyNyw8kNydJfbD7g5Q+uBqu
 yF59WS3xRI4mpJ6jvbOpeil68cTVxwYdYxs1yask2XUBBtNPGWzGuQ9in5+KmgMhFcJR
 5dIvmd7cyzRsKacbK9RH09DRYqfXIHAx0Cg+l9B1givDdJHsL1/0Js5qAzzzFsNro75X
 A0kjCJfmLw3l6v5VFDaXIbVPnSdF/ipyGooqL1iIHf5pN8IQNuKnkQIIsmsqM7u6CdpR
 JurWXKlbU6fpvhXzqdEtmSU5U1iNWgRWo1b3cV669Tv0bexrcNH/YJpPamZgI+cfMjcQ
 Jb0Q==
X-Gm-Message-State: APjAAAXGGrbelcm9YQzN46WOzLxGwpezRmJS2/oTfoAdtImWeEjK9wu+
 r85Zwi4RGaajyvA9RH3VFKIbRk3ZqPynGYbWc+x3ew==
X-Google-Smtp-Source: APXvYqz7CwbXKw+2hA5ay0sBudG0s6pxcIeLiUu6UaLLsQFqSEWVU51BHSlnPfV1i0Qs6Lk/Q+Wc7ZB/9sFlpt9NLUw=
X-Received: by 2002:ac2:5a08:: with SMTP id q8mr9635117lfn.106.1574375067113; 
 Thu, 21 Nov 2019 14:24:27 -0800 (PST)
MIME-Version: 1.0
References: <CAH1kD+YoUr47P-rvCBd8YxKsd-WXtHuqR0pDHFAUSWT+rihmyg@mail.gmail.com>
 <2e9d22b4-714a-6b16-665a-53faa5692e8f@linux.vnet.ibm.com>
In-Reply-To: <2e9d22b4-714a-6b16-665a-53faa5692e8f@linux.vnet.ibm.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 21 Nov 2019 14:24:15 -0800
Message-ID: <CAH1kD+b_HfiZZ+YdVAhAT0FtsHQhGxzp0MGGNHP9v=gDoEvJtA@mail.gmail.com>
Subject: Re: Redfish Aggregator vs. RDE over PLDM
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000009ecee40597e2c2b8"
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

--0000000000009ecee40597e2c2b8
Content-Type: text/plain; charset="UTF-8"

Hi Deepak,

Thank you very much for this feedback.  You've been very helpful while I've
been working to brainstorm on this subject.

There were a couple of thoughts that led me down this path.

One of the difficulties I see in creating an aggregator comes in how you
slice up a system and make it discoverable.  This might be a google
specific idiosyncrasy, but imagine a case where a Redfish service is
managing a chassis, expect for two sensors which are on a different
service.  How would an aggregator know that these two chassis should be
merged together.  When I read about Platform Descriptor Records (PDR) in
PLDM it seemed to me that it was trying to solve a similar problem.

In my reading of the RDE spec, there are two main issues that it is was
addressing:
  (1) How to fit the Redfish data model into a binary protocol.
  (2) How does a device implement only a portion of a Redfish service.
Most of the spec is dealing with issue (1), but issue (2) is the same issue
that the aggregator is trying to solve.

Another thing that I'm expecting is that at some point we will have some
legacy hardware that will have trouble running an HTTP stack.

This all kind of leads me to a larger point.  Which is that if this Redfish
aggregator is designed in a certain way, it may make RDE integration easier
in the future.  I just wanted to get an idea of whether that design goal is
worth considering.

Thanks,
Richard

On Wed, Nov 20, 2019 at 7:29 AM Deepak Kodihalli <
dkodihal@linux.vnet.ibm.com> wrote:

> On 19/11/19 4:51 AM, Richard Hanley wrote:
> > *Thoughts and Questions*
> > Is RDE on the open-bmc roadmap at the moment?  Are there any other
> > companies looking into adding support for RDE?  Does anyone have any
> > strong feelings on this issue?
> >
> > I think that in the long term a solid implementation of RDE offers a lot
> > more flexibility than a http aggregator.  However, I'd also expect it's
> > significantly more effort to get up and running.  Hence why I am asking
> > how the community feels about this subject.
> >
> >
> > I'm also interested in hearing what people's experience working with
> > MCTP or PLDM have been.  Has anyone here used them in production? Are
> > there any particular highlights or lowlights with the protocols?
>
> IBM will use PLDM over MCTP (over an LPC binding) for Host - BMC
> communications (system management being shared between the Host and the
> BMC) on upcoming systems. The main motivation to switch to PLDM was
> because it fit the bill of an industry standard communications protocol
> with improvements compared to in-band IPMI. RDE was also motivation for
> us to work on implementing a PLDM stack, although RDE isn't on the
> immediate roadmap. If you're interested in looking at the existing
> PLDM/MCTP code/design docs on OpenBMC, I have some links below.
>
> We're able to map our requirements for the in-band Host BMC
> communications path to standard PLDM mostly. We did define a set of OEM
> commands to model a file as a PLDM object (and have that transferred).
> We still need to run this by PMCI to see if it's of interest to anyone
> for standardization purposes.
>
> I'm curious why we'd use RDE for a case where the multiple management
> controllers all do have a network stack and can parse JSON. Wouldn't
> they just implement Redfish (instead of RDE) and hence this makes a case
> for the Redfish Aggregator? Based on my reading of the RDE spec, it
> seemed to target IO adapters, for eg storage controllers, that would
> want to participate in Redfish based management, but the firmware
> running on those wouldn't implement an HTTP stack.
>
> https://github.com/openbmc/pldm
> https://github.com/openbmc/libmctp
> https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md
> https://github.com/openbmc/docs/blob/master/designs/mctp.md
>
> Thanks,
> Deepak
>
>

--0000000000009ecee40597e2c2b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Deepak,<div><br></div><div>Thank you very much for this=
 feedback.=C2=A0 You&#39;ve been very helpful while I&#39;ve been working t=
o brainstorm on this subject.</div><div><br></div><div>There were a couple =
of thoughts that led me down this path.</div><div><br></div><div>One of the=
 difficulties I see in creating an aggregator comes in how you slice up a s=
ystem and make it discoverable.=C2=A0 This might be a google specific idios=
yncrasy, but imagine a case where a Redfish service is managing a chassis, =
expect for two sensors which are on a different service.=C2=A0 How would an=
 aggregator know that these two chassis should be merged together.=C2=A0 Wh=
en I read about Platform Descriptor Records (PDR) in PLDM it seemed to me t=
hat it was trying to solve a similar problem.</div><div><br></div><div>In m=
y reading of the RDE spec, there are two main issues that it is was address=
ing:</div><div>=C2=A0 (1) How to fit the Redfish data model into a binary p=
rotocol.=C2=A0=C2=A0</div><div>=C2=A0 (2) How does a device implement only =
a portion of a Redfish service.</div><div>Most of the spec is dealing with =
issue (1), but issue (2) is the same issue that the aggregator is trying to=
 solve.</div><div><br></div><div>Another thing that I&#39;m expecting is th=
at at some point we will have some legacy hardware that will have trouble r=
unning an HTTP stack.=C2=A0</div><div><br></div><div>This all kind of leads=
 me to a larger point.=C2=A0 Which is that if this Redfish aggregator is de=
signed in a certain way, it may make RDE integration easier in the future.=
=C2=A0 I just wanted to get an idea of whether that design goal is worth co=
nsidering.</div><div><br></div><div>Thanks,</div><div>Richard</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Nov 20, 2019 at 7:29 AM Deepak Kodihalli &lt;<a href=3D"mailto:dkodihal@lin=
ux.vnet.ibm.com" target=3D"_blank">dkodihal@linux.vnet.ibm.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 19/11/19 4=
:51 AM, Richard Hanley wrote:<br>
&gt; *Thoughts and Questions*<br>
&gt; Is RDE on the open-bmc roadmap at the moment?=C2=A0 Are there any othe=
r <br>
&gt; companies looking into adding support for RDE?=C2=A0 Does anyone have =
any <br>
&gt; strong feelings on this issue?<br>
&gt; <br>
&gt; I think that in the long term a solid implementation of RDE offers a l=
ot <br>
&gt; more flexibility than a http aggregator.=C2=A0 However, I&#39;d also e=
xpect it&#39;s <br>
&gt; significantly more effort to get up and running.=C2=A0 Hence why I am =
asking <br>
&gt; how the community=C2=A0feels about this subject.<br>
&gt;<br>
&gt;<br>
&gt; I&#39;m also interested in hearing what people&#39;s experience workin=
g with <br>
&gt; MCTP or PLDM have been.=C2=A0 Has anyone here used them in production?=
 Are <br>
&gt; there any particular highlights or lowlights with the protocols?<br>
<br>
IBM will use PLDM over MCTP (over an LPC binding) for Host - BMC <br>
communications (system management being shared between the Host and the <br=
>
BMC) on upcoming systems. The main motivation to switch to PLDM was <br>
because it fit the bill of an industry standard communications protocol <br=
>
with improvements compared to in-band IPMI. RDE was also motivation for <br=
>
us to work on implementing a PLDM stack, although RDE isn&#39;t on the <br>
immediate roadmap. If you&#39;re interested in looking at the existing <br>
PLDM/MCTP code/design docs on OpenBMC, I have some links below.<br>
<br>
We&#39;re able to map our requirements for the in-band Host BMC <br>
communications path to standard PLDM mostly. We did define a set of OEM <br=
>
commands to model a file as a PLDM object (and have that transferred). <br>
We still need to run this by PMCI to see if it&#39;s of interest to anyone =
<br>
for standardization purposes.<br>
<br>
I&#39;m curious why we&#39;d use RDE for a case where the multiple manageme=
nt <br>
controllers all do have a network stack and can parse JSON. Wouldn&#39;t <b=
r>
they just implement Redfish (instead of RDE) and hence this makes a case <b=
r>
for the Redfish Aggregator? Based on my reading of the RDE spec, it <br>
seemed to target IO adapters, for eg storage controllers, that would <br>
want to participate in Redfish based management, but the firmware <br>
running on those wouldn&#39;t implement an HTTP stack.<br>
<br>
<a href=3D"https://github.com/openbmc/pldm" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/openbmc/pldm</a><br>
<a href=3D"https://github.com/openbmc/libmctp" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/openbmc/libmctp</a><br>
<a href=3D"https://github.com/openbmc/docs/blob/master/designs/pldm-stack.m=
d" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/docs/blo=
b/master/designs/pldm-stack.md</a><br>
<a href=3D"https://github.com/openbmc/docs/blob/master/designs/mctp.md" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/docs/blob/mast=
er/designs/mctp.md</a><br>
<br>
Thanks,<br>
Deepak<br>
<br>
</blockquote></div>

--0000000000009ecee40597e2c2b8--
