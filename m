Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A14AFDBA49
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 01:45:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vQlH0wF9zDqn1
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 10:45:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NsbFyyC6"; 
 dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vQkX0Q84zDqll
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 10:44:51 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id y23so4294798lje.9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 16:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OFJz/hg1G5UOnoK4f5ybKFfeJ6PV250QKaZwPmMY3q4=;
 b=NsbFyyC6BakHdnQ/tIFRtdfHVnzKcrD47gP0WSTOg7yy0PKm+fPVvyfCYLnWsZ8ljI
 tA4FfpiTcFiGCCaxi+mYXWGyQohNeqZ/nVRPTKOZZUXKWsLdrHyw6HStA/tC9QRih7UA
 wYGLXi+tdf2tsLDJZFtgHkMrcSZXu/yJ8G2UddTakUe6FQ+7TacwLvmUC1juAMO0xU6M
 Wk/IzCLEGH8E0yt/6qj+yiDf01ZmsSki6af/N3/0sXldjrmZeW8cpU79kVYyoxcDMLiq
 ToUBIesh2IyDSrkvgimt3nudLIUYOjQFrBdZRpNxKNvrrzWIIlLWkkhsHR6FSLHxSx8w
 yWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OFJz/hg1G5UOnoK4f5ybKFfeJ6PV250QKaZwPmMY3q4=;
 b=EZ6R/8nnZIBb6iVg/Eov7sC10rpljprsNUbLPXdxNIX0YepjH9t2ROvfIdXsw40Jq4
 epDeQ00nGAsfTw3vC8xhFHtXNuKnCD5T659an5ctggfFdt0mW+tBHzg2nMWLGQAzc+zz
 3EN5Ay/hMC/CXuIMu5YjSUiaZELzfJk0ECiXSuJt/V7RTZAinmKsyj4AUOy5op+ZrYKM
 dq9WpciufQuqnZ+r9YZPnmvzSvyJN+GiGE8NSTn3DfQyMVhQxh+w7UKtO5Pr4bhv9js9
 bPWTzm0JZUZlPblpvhoSG8ZTiU79z+y4r5m8YwcdUKyAhQZaxq+rf0h+xvkIWnmYiWr9
 5nXQ==
X-Gm-Message-State: APjAAAXWH7s4jGoRDElm5Bf2X6dSTQJK5mHHrI2xCyFquzfPOg+81/Mg
 2YwW7DM+ydzEee8xqhgRnhkad93uFwFZIznN1hxtGg==
X-Google-Smtp-Source: APXvYqxozQqfZHA0gOn4uW8WjeqLj52YOGcwDC0AfzA1ghklrLmLdSX/jtDwtgBXWE1ISlFfSTK85sppXIpjmOY5270=
X-Received: by 2002:a2e:880e:: with SMTP id x14mr4054632ljh.42.1571355886273; 
 Thu, 17 Oct 2019 16:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpG_Sy4_jNGqZTJKx1Tyivsu+SpBpWy=vNSH7L=Z0PXAEQ@mail.gmail.com>
 <2F98B4CC-2C61-4AF7-B41A-897C9BA4E32F@fuzziesquirrel.com>
 <CADfYTpEut49XPWs+Ahz5dsRgayLkHToRh-6btHeqbaSR3wnK2A@mail.gmail.com>
 <0b5a46e8-748b-faa0-59fd-c548810c9b12@intel.com>
 <CAH1kD+Z5qJ=tDV76MtAE6bgF8yCq-RYSz8y9jgnOV_SSUTF79g@mail.gmail.com>
In-Reply-To: <CAH1kD+Z5qJ=tDV76MtAE6bgF8yCq-RYSz8y9jgnOV_SSUTF79g@mail.gmail.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 17 Oct 2019 16:44:34 -0700
Message-ID: <CAH1kD+bFPJdXggCuQ9oQZkf9809C3Qw28inLwW7gVzUWrsgLQQ@mail.gmail.com>
Subject: Re: Redfish Aggregator
To: Ed Tanous <ed.tanous@intel.com>, bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="0000000000006b1b38059523cdc1"
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

--0000000000006b1b38059523cdc1
Content-Type: text/plain; charset="UTF-8"

Hi Brad and Ed,

I wanted to check in with you and the rest of the community about the
design path and requirements we're considering for a Redfish Aggregator.

When I think about an Aggregator in this context, I'm thinking about
several Redfish services that are connected to each other using a
star topology.  The central service would be the only service exposed to
clients on the outside network.

The central service would for all intents and purposes look like a single
service to clients, and on the backend it would act as a proxy to the other
hidden services.

One of the big design questions to consider is how thick or thin the
central services caching should be.  In my opinion, the central service
should cache the URI for each of the top level collections (i.e.
Chassis collections, System collection, and Manager collections).  This
should be a decent compromise between performance when clients traverse the
resource tree and overhead in synchronizing the cache in the central agent.

I will be talking with DMTF soon about any extensions to the spec that
might be needed.  In my opinion, this could be accomplished with the spec
as it currently stands, but I'd like to get some input in the following
areas:
   1) DMTF may want to standardize the algorithm that merges separate
resource collections into one collection with unique IDs
   2) There are some questions internally about whether there should be
some metadata letting consumers know that they are working with a proxied
resource.  DMTF may have some concerns about treating a proxied resource
exactly as a local resource.
   3) DMTF was considering an aggregation service that would allow clients
to manage some of the aggregation.  Personally, I'm not a huge fan of this
approach, but we'd want to make sure that what we're doing doesn't get in
the way of those plans.

Anyways, hopefully this huge textblock helps clarify some of Google's
thinking on this issue.  I'm still working on getting up to speed on both
Redfish and open-bmc, so any feedback is greatly appreciated.  Hopefully in
the next couple of weeks I can incorporate feedback from the community and
DMTF, and start getting together a design document for review.

Best Regards,
Richard


On Thu, Oct 10, 2019 at 11:32 AM Richard Hanley <rhanley@google.com> wrote:

> Thank you Ed.  I will take a look a look at that fork.
>
> On Thu, Oct 10, 2019 at 11:09 AM Ed Tanous <ed.tanous@intel.com> wrote:
>
>> On 10/10/19 10:09 AM, Nancy Yuen wrote:
>> > Thanks Brad!  We are envisioning aggregating the separate Redfish stacks
>> > to present a single unified system view.  There is another slide deck of
>> > Redfish Aggregator requirement uploaded to DMTF a few days ago with a
>> > slightly different idea of aggregation (it sounds more like batching,
>> > the aggregator will send a reboot or a fw update, to a bunch of redfish
>> > stacks on multiple systems).
>> >
>>
>> You might want to look at this bmcweb fork that Inspur built for exactly
>> this.
>> https://github.com/inspur-bmc/rmcweb
>>
>>
>> It wasn't built the way I would've recommend it be built, and a lot of
>> it is relying on fake data, but it's a reasonable example of wiping out
>> all the bmcweb Redfish endpoints and replacing them with aggregator
>> ones, without having to modify the core.
>>
>

--0000000000006b1b38059523cdc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Brad and Ed,<div><br></div><div>I wanted to check in wi=
th you and the rest of the community about the design path and requirements=
 we&#39;re considering for a Redfish Aggregator.<br><br>When I think about =
an Aggregator in this context, I&#39;m thinking about several Redfish servi=
ces that are connected to each other using a star=C2=A0topology.=C2=A0 The =
central=C2=A0service would be the only service exposed to clients on the ou=
tside network.=C2=A0<br></div><div><br></div><div>The central service would=
 for all intents and purposes look like a single service to clients, and on=
 the backend it would act as a proxy to the other hidden services.</div><di=
v><br></div><div>One of the big design=C2=A0questions to consider is how th=
ick or thin the central services caching should be.=C2=A0 In my opinion, th=
e central service should cache the URI for each of the top level collection=
s (i.e. Chassis=C2=A0collections, System collection, and Manager collection=
s).=C2=A0 This should be a decent compromise between performance when clien=
ts traverse the resource tree and overhead in synchronizing the cache in th=
e central agent.</div><div><br></div><div>I will be talking with DMTF soon =
about any extensions to the spec that might be needed.=C2=A0 In my opinion,=
 this could be accomplished with the spec as it currently stands, but I&#39=
;d like to get some input in the following areas:</div><div>=C2=A0 =C2=A01)=
 DMTF may want to standardize the algorithm that merges separate resource c=
ollections into one collection with unique IDs</div><div>=C2=A0 =C2=A02) Th=
ere are some questions internally about whether there should be some metada=
ta letting consumers know that they are working with a proxied resource.=C2=
=A0 DMTF may have some concerns about treating a proxied resource exactly a=
s a local resource.</div><div>=C2=A0 =C2=A03) DMTF was considering an aggre=
gation service that would allow clients to manage some of the aggregation.=
=C2=A0 Personally, I&#39;m not a huge fan of this approach, but we&#39;d wa=
nt to make sure that what we&#39;re doing doesn&#39;t get in the way of tho=
se plans.</div><div><br></div><div>Anyways, hopefully this huge textblock h=
elps clarify some of Google&#39;s thinking on this issue.=C2=A0 I&#39;m sti=
ll working on getting up to speed on both Redfish and open-bmc, so any feed=
back is greatly appreciated.=C2=A0 Hopefully in the next couple of weeks I =
can incorporate feedback from the community and DMTF, and start getting tog=
ether a design document for review.</div><div><br></div><div>Best Regards,<=
/div><div>Richard</div><div><br></div><div></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 10, 2019 at 11=
:32 AM Richard Hanley &lt;<a href=3D"mailto:rhanley@google.com">rhanley@goo=
gle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr">Thank you Ed.=C2=A0 I will take a look a look at th=
at fork.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Oct 10, 2019 at 11:09 AM Ed Tanous &lt;<a href=3D"mailto:ed=
.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/10/19 10:09 A=
M, Nancy Yuen wrote:<br>
&gt; Thanks Brad!=C2=A0 We are envisioning aggregating the separate Redfish=
 stacks<br>
&gt; to present a single unified system view.=C2=A0 There is another slide =
deck of<br>
&gt; Redfish Aggregator requirement uploaded to DMTF a few days ago with a<=
br>
&gt; slightly different idea of aggregation (it sounds more like batching,<=
br>
&gt; the aggregator will send a reboot or a fw update, to a bunch of redfis=
h<br>
&gt; stacks on multiple systems).<br>
&gt; <br>
<br>
You might want to look at this bmcweb fork that Inspur built for exactly<br=
>
this.<br>
<a href=3D"https://github.com/inspur-bmc/rmcweb" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/inspur-bmc/rmcweb</a><br>
<br>
<br>
It wasn&#39;t built the way I would&#39;ve recommend it be built, and a lot=
 of<br>
it is relying on fake data, but it&#39;s a reasonable example of wiping out=
<br>
all the bmcweb Redfish endpoints and replacing them with aggregator<br>
ones, without having to modify the core.<br>
</blockquote></div>
</blockquote></div>

--0000000000006b1b38059523cdc1--
