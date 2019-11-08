Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F7F5AEF
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2019 23:33:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478w640dTdzF3X7
	for <lists+openbmc@lfdr.de>; Sat,  9 Nov 2019 09:33:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Em2p+E3H"; 
 dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478w593pvBzF6Q6
 for <openbmc@lists.ozlabs.org>; Sat,  9 Nov 2019 09:32:44 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id f24so2622690lfh.10
 for <openbmc@lists.ozlabs.org>; Fri, 08 Nov 2019 14:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pKtLiHPZWGHUmtSpuqIe8Z+M0jA4nA95SkkYfe/SZ/U=;
 b=Em2p+E3Hxbc3iIv68LOhqXs6fJyR2dEtscOxzZpo5z5fPBoW+gnmvULeNDLh3BIZHI
 XXIxSUehVvM53WHkfqJ9YU6tQqvBtBJ9QliX4VOZxSRZzujXvWO6hLAPJ/43KoXM1va3
 h6gRx/KNeRXbr8hOrkKHdEADvfnS8pRHq71VCocHdE04+WfoYZWSXhjiXjKf8jpaAVwE
 uoPWhTzj7h9lNBR2t8eksusfhxdvYcfzABajxgU8gQmnuadgt/Cs8MLqHOlGRrk10Euc
 XZlaEAOEIiDy1xLj67gny5PmxJFL/DjTPa9VzGjz+kNQ+/Lh/DhsVszVcSsmczInegv0
 2YtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pKtLiHPZWGHUmtSpuqIe8Z+M0jA4nA95SkkYfe/SZ/U=;
 b=KNAbOusUVbTjoTsj8LGFBhH1x3TS9AmWM7r/6cZgNH/j3G8bNXrhNAKRo/p9uD4hXp
 FjKj3qxat3ZrDIWF5VLAGlW62ML8omh2hKEXCmGt7ssCs8H1WwuqW7pSsQgJHVW3YNkG
 MJGDRPGr3LEIoH8bQzyXAZYUaIy7oiO9VU1bmW4lDhplSsrkt9gbRcXEs3EXjCTc0QYa
 TJBZxsyy2qnxPnTYwgRfHpWthMmnqCGUKVzIwbEE6xoomvRg8xMTeNTxWTB/dv418av0
 D/myb9j6QiRn0DOOZO6LtiuiWzeHbyMfTmk9VcPaZNz38qnalaFn5gaghUYh4vH17/nr
 zEqw==
X-Gm-Message-State: APjAAAWWZ3WekpGV29j7VPDpbZ93cEBdfQZX14VePxsSysguCVT5E+cp
 inR+lkxRg1+lzYsezKVRYVAmZIz9PHw0L2rbxwT94+/Spac=
X-Google-Smtp-Source: APXvYqyPn6FPCjb7tTGOYlWq9h+daHt5+oRZnYZnYyoYHerw3/mOHQLKdmMkqjh5njJEMtXXrG48VQrZyqevWJ3DBvM=
X-Received: by 2002:ac2:4d17:: with SMTP id r23mr8386488lfi.56.1573252360051; 
 Fri, 08 Nov 2019 14:32:40 -0800 (PST)
MIME-Version: 1.0
References: <CAH1kD+YQNVKSmH1qP777b2ch6vt=8EENkeE2b7VB_bpZh-DROg@mail.gmail.com>
 <2a34ceec-f10a-d34d-a23e-48d87141a589@linux.intel.com>
In-Reply-To: <2a34ceec-f10a-d34d-a23e-48d87141a589@linux.intel.com>
From: Richard Hanley <rhanley@google.com>
Date: Fri, 8 Nov 2019 14:32:28 -0800
Message-ID: <CAH1kD+a5i55Y-yZS49x20FZkF7kqPGiAjVb+vRSpBNhhyrbYYw@mail.gmail.com>
Subject: Re: Redfish Code Generation
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000001059080596dd5c94"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001059080596dd5c94
Content-Type: text/plain; charset="UTF-8"

Hi James,

I do not have a white paper yet, but I will be putting one together.
Overall, there are two broad areas that I'm thinking about here.

The first is that I get the feeling that there is a growing need to work
directly with the Redfish data model.  If the industry is indeed moving
towards RDE for expansion components, then there will eventually be some
need to serialize Redfish schemas to/from BEJ.  Moreover, here at Google
I'm expecting that we will need to convert the Redfish data model from JSON
to protocol buffers in order to integrate into our data centers.

Tasks like these seem like decent candidates for automation, because it's
primarily about data not logic.  I agree with you're point that a lot of
the logic in bmcweb is around the d-bus layer.  So I'll make sure to avoid
mixing the two problems together.

The other thing that I'm hoping, is that once you have some tooling to
generate the data model, then you can start building up some testing and
validation.  This could be as simple as providing some compile time type
checking, and runtime assertions.  I could imagine it growing to validate
Redfish profiles, but let's not get too far ahead of myself.

You also make a good point about code size.  I could imagine code
generation done in a bad way would bloat the code.  I'll make sure to keep
that in the forefront of any design.

Thanks,
Richard

On Fri, Nov 8, 2019 at 11:49 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 11/8/19 9:42 AM, Richard Hanley wrote:
> > Hi everyone,
> >
> > I was considering work on spiking out a tool to parse Redfish OpenAPI
> > schemas, and create some minimal code generation.  Most of the existing
> > swagger tools I've found for Open API are either for clients or too
> > heavy weight for embedded use.
> >
> > Has anyone in the community looked into this subject?  Would people be
> > interested in such a tool? Are there any pitfalls that people found that
> > I should be aware of?
>
> I heard at the hackathon that a couple of vendors have tried / are doing
> this, and most of the pitfalls were size. OpenBmc also makes the problem
> more interesting as the schemas aren't normally all that difficult to
> create, it's negotiating with dbus, limiting the api calls, and all the
> interfaces that seems to cause most of the problems. I'd be interested
> in what code you're trying to generate and what problem you're trying to
> solve. If you have some sort of white paper I'd be willing to give
> feedback.
>
> -James
>
> >
> > Thank you,
> > Richard
>

--0000000000001059080596dd5c94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<br><br>I do not have a white paper yet, but I wi=
ll be putting one together. Overall, there are two broad areas that I&#39;m=
 thinking about here.<br><br>The first is that I get the feeling that there=
 is a growing need to work directly with the Redfish data model.=C2=A0 If t=
he industry is indeed moving towards RDE for expansion components, then the=
re will eventually be some need to serialize Redfish schemas to/from BEJ.=
=C2=A0 Moreover, here at Google I&#39;m expecting that we will need to conv=
ert the Redfish data model from JSON to protocol buffers in order to integr=
ate into our data centers.<br><br>Tasks like these seem like decent candida=
tes for automation, because it&#39;s primarily about data not logic.=C2=A0 =
I agree with you&#39;re point that a lot of the logic in bmcweb is around t=
he d-bus layer.=C2=A0 So I&#39;ll make sure to avoid mixing the two problem=
s together.<br><br>The other thing that I&#39;m hoping, is that once you ha=
ve some tooling to generate the data model, then you can start building up =
some testing and validation.=C2=A0 This could be as simple as providing som=
e compile time type checking, and runtime assertions.=C2=A0 I could imagine=
 it growing to validate Redfish profiles, but let&#39;s not get too far ahe=
ad of myself.<br><br>You also make a good point about code size.=C2=A0 I co=
uld imagine code generation done in a bad way would bloat the code.=C2=A0 I=
&#39;ll make sure to keep that in the forefront of any design.<br><br>Thank=
s,<br>Richard<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Nov 8, 2019 at 11:49 AM James Feist &lt;<a href=3D=
"mailto:james.feist@linux.intel.com">james.feist@linux.intel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 11/8/19 =
9:42 AM, Richard Hanley wrote:<br>
&gt; Hi everyone,<br>
&gt; <br>
&gt; I was considering work on spiking out a tool to parse Redfish OpenAPI =
<br>
&gt; schemas, and create some minimal code generation.=C2=A0 Most of the ex=
isting <br>
&gt; swagger tools I&#39;ve found for Open API are either for clients or to=
o <br>
&gt; heavy weight for embedded use.<br>
&gt; <br>
&gt; Has anyone in the community looked into this subject?=C2=A0 Would peop=
le be <br>
&gt; interested in such a tool? Are there any pitfalls that people found th=
at <br>
&gt; I should be aware of?<br>
<br>
I heard at the hackathon that a couple of vendors have tried / are doing <b=
r>
this, and most of the pitfalls were size. OpenBmc also makes the problem <b=
r>
more interesting as the schemas aren&#39;t normally all that difficult to <=
br>
create, it&#39;s negotiating with dbus, limiting the api calls, and all the=
 <br>
interfaces that seems to cause most of the problems. I&#39;d be interested =
<br>
in what code you&#39;re trying to generate and what problem you&#39;re tryi=
ng to <br>
solve. If you have some sort of white paper I&#39;d be willing to give feed=
back.<br>
<br>
-James<br>
<br>
&gt; <br>
&gt; Thank you,<br>
&gt; Richard<br>
</blockquote></div>

--0000000000001059080596dd5c94--
