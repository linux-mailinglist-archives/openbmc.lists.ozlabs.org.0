Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D4166AD8
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 00:17:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nr8C6MYczDqYV
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 10:16:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BSJZ5HUT; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Nr7d0sCJzDqXK
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 10:16:27 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id w1so233599ljh.5
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 15:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ck0yNtnppMfQyJuzWA04cQPmcorSVZ9E5tsz6K/XOLM=;
 b=BSJZ5HUT+7E6Q9RjUzpE6KZ9JiICCCX4K9TMVqUf66Ff3QFfL60VlliADxcQX4w1Ko
 5uCF1Fpg8znHHXbBBPTSlTm4Mxt2W7qpc/Aem6haRZMqGUc6HneKcBBgwh19ylopwc5/
 WJssLjjEKfoKd9d/V4xCjwgTV/kBodQFURkJCBHVqEQgIIkLhBshHEz4Gfe5GK/b1Hn7
 OqGGNOp6l4zOfYZ0F3LyyVKsl656wa0LfESeTBy2rv6Y706t4qi8jLjk9HQ53AkhIEOW
 Dxz2gFWJs9rthtwcBJuNMpA7NtC9xMLSAF2xnFQbeVEXMphyaaxIxZFv/I23KmS4Q3sM
 R5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ck0yNtnppMfQyJuzWA04cQPmcorSVZ9E5tsz6K/XOLM=;
 b=bif0HcmLVzShTOnjEqbLo5XhngJropLyjNCODQz8t00ogcrgUBW1EkOHml+/E4migX
 yReqOMzwt6zrMuLWP83xklTML5zV0uv0UFSA1icwIob/YExiYbYt/9xVawVewEQPP13T
 9PJlzNG50jmIUt55RXaC/sWD/O/hfp5f+aEAqZ3IzbdNT2dZZNOb+vW/Ljp6TgCPS9E/
 dkrBpVWezaRWGVpMfnREIn8SRPzFB9tfqiWF5wKI4Ybd0sq8rknK4fAXQFtEcNQ2Vy9L
 gIGJfDYboX+/cXPCsurxaPG2QOUdCLNMhUEzju5YAC06w3JgNTyrWLQq3VUXE8u9hNWW
 C92g==
X-Gm-Message-State: APjAAAW4v7/G1VRyLGyQ2/55v4JWoDNnUPfg4YZbQAyPtK0d90X8ywRF
 6qKoIxkaQtyEZBjh59nlxhQdI+rJvxCBEFdb0gzA7c9T
X-Google-Smtp-Source: APXvYqytafowfQT4UGhGIoXqqJl3Wxi8o1okDnwzVLg+waU+iB1v5WMPNcQk38080gPvjCsBEj/HoQDR2ajZiAYgBhE=
X-Received: by 2002:a05:651c:232:: with SMTP id
 z18mr20968487ljn.85.1582240581935; 
 Thu, 20 Feb 2020 15:16:21 -0800 (PST)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Thu, 20 Feb 2020 15:16:10 -0800
Message-ID: <CAH1kD+YZiZfhUwaxr3Vroe8a2BTWzdVj6T9Ubg8ypA+Txzg3Ag@mail.gmail.com>
Subject: API Aggregator Data Model + OCP Summit
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d639bd059f0a17ba"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d639bd059f0a17ba
Content-Type: text/plain; charset="UTF-8"

HI all,

Apologies for being radio silent on a BMC aggregator for the last few
weeks.  This email is a bit long, but I wanted to give everyone a quick
snapshot of what I've been thinking about in this space.

(As a quick aside, I mentioned in the last meeting that I will be giving a
talk at the OCP Summit in March
<https://www.opencompute.org/summit/global-summit/schedule>.  The talk
should be summarizing the discussions we've had here in Open BMC, and will
be trying to raise interest in the problem.  Hopefully I'll get to meet
some of you at the summit).

Anyways, the last few discussions about the aggregator have made it clear
that there is some conceptual work to be done on defining what exactly the
aggregator is, and what services need to be created.

To that end, I think the most concise definition of the aggregator is that
it is a way for services to register an API, and consistent semantics for
frontends to be built on top of the registered APIs.

So from the aggregator's point of view, there is no difference between a
local resource or a remote resource.  This implies that any frontend built
on top of the aggregator wouldn't have to worry about "where" the request
gets handled, since that concept has been abstracted away.

Originally, I was thinking that this aggregation service would be done
using Redfish.  This has some problems for systems that want to use another
protocol, or want to use some mixture of protocols (i.e. a out of band
Redfish service alongside an in band IMPI host interface).

However, as a jumping off point I asked myself three questions:
  1) What is the minimum amount of information I would need to construct a
Redfish service?
  2) How reusable is that minimal data model for other protocols and use
cases?
  3) How well does it support our existing DBus usage and ecosystem?

From that I think we can get a lot of traction by combining two core data
types: Resource Nodes and Edges.

A resource node would contain the following:
  Profile - This would be metadata about the resource, including schema,
cache policy, names, and ACLs

  Supported Methods - Resources could implement any of the HTTP methods
(GET, PUT, POST, PATCH, DELETE).

  Supported Actions - Redfish makes a distinction between calls that
manipulate data and calls that manipulate the physical world.  I think that
separation makes a lot of sense in a general protocol.

   Event Dispatch - This would be the async method for resources to send
events up to any frontend that was listening

   Task Monitor - Each resource may have tasks that are being run as part
of another request.  By giving each resource a task monitor they can own
their tasks without needing to integrate into some global monitor.

Meanwhile the edges would connect resources together, and contain a list of
tags that describe the relationship (e.g. collection membership, contained
by, managed by, etc.)

One thing I like about this data model is that it let's us do some
meaningful work at the aggregation layer without having to know anything
about the data/methods that the resources are providing.

When it comes to sociability with other protocols, I think it is relatively
lightweight.  The data model is a bit richer than what IPMI offers, but I
don't think it is so rich that it would be extra hard to write wrappers.
It would also be a very useful component if the community wanted to support
RDE over PLDM.

So, to close this email, I want to lay out how I would imagine this
aggregator would be used in practice.

Once the aggregator starts up it would have a root resource.  This would
give any important process metadata, a default entry point to look at
registered resources, and a place for clients to listen for events.

Daemons could then register resources.  When they register a resource, they
would give the resource definition and the edges used to connect it into
the aggregator's resource graph.  The aggregator would send event messages
to any listeners whenever a resource is created or destroyed.

When it comes to presenting these resources to the outside world, a
frontend could contain an in memory copy of the resource definition and
edges (since those would be relatively stable), and query the aggregator
for a snapshot of resources at a given time.  The hope is that frontends
could be as stateless as possible.

There are some other topics I could add. In particular I think caching
becomes a very important subject once you start managing distributed BMCs.
However, this email has gotten long enough, so I think I will save that for
another day.

Thanks,
Richard

--000000000000d639bd059f0a17ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI all,<div><br></div><div>Apologies for being radio silen=
t on a BMC aggregator for the last few weeks.=C2=A0 This email is a bit lon=
g, but I wanted to give everyone a quick snapshot of what I&#39;ve been thi=
nking about in this space.</div><div><br></div><div>(As a quick aside, I me=
ntioned in the last meeting that I will be giving a talk at the <a href=3D"=
https://www.opencompute.org/summit/global-summit/schedule" target=3D"_blank=
">OCP Summit in March</a>.=C2=A0 The talk should be summarizing the discuss=
ions we&#39;ve had here in Open BMC, and will be trying to raise interest i=
n the problem.=C2=A0 Hopefully I&#39;ll get to meet some of you at the summ=
it).</div><div><br></div><div>Anyways, the last few discussions about the a=
ggregator have made it clear that there is some conceptual work to be done =
on defining what exactly the aggregator is, and what services need to be cr=
eated.</div><div><br></div><div>To that end, I think the most concise defin=
ition of the aggregator is that it is a way for services to register an API=
, and consistent semantics for frontends to be built on top of the register=
ed APIs.</div><div><br></div><div>So from the aggregator&#39;s point of vie=
w, there is no difference between a local resource or a remote resource.=C2=
=A0 This implies that any frontend built on top of the aggregator wouldn&#3=
9;t have to worry about &quot;where&quot; the request gets handled, since t=
hat concept has been abstracted away.</div><div><br></div><div>Originally, =
I was thinking that this aggregation service would be done using Redfish.=
=C2=A0 This has some problems for systems that want to use another protocol=
, or want to use some mixture of protocols (i.e. a out of band Redfish serv=
ice alongside an in band IMPI host interface).</div><div><br></div><div>How=
ever, as a jumping off point I asked myself three questions:</div><div>=C2=
=A0 1) What is the minimum amount of information I would need to construct =
a Redfish service?</div><div>=C2=A0 2) How reusable is that minimal data mo=
del for other protocols and use cases?</div><div>=C2=A0 3) How well does it=
 support our existing DBus usage and ecosystem?</div><div><br></div><div>Fr=
om that I think we can get a lot of traction by combining two core data typ=
es: Resource Nodes and Edges.</div><div><br></div><div>A resource node woul=
d contain the following:</div><div>=C2=A0 Profile - This would be metadata =
about the resource, including schema, cache policy, names, and ACLs</div><d=
iv>=C2=A0</div><div>=C2=A0 Supported Methods - Resources could implement an=
y of the HTTP methods (GET, PUT, POST, PATCH, DELETE).</div><div><br></div>=
<div>=C2=A0 Supported Actions - Redfish makes a distinction between calls t=
hat manipulate data and calls that manipulate the physical world.=C2=A0 I t=
hink that separation=C2=A0makes a lot of sense in a general protocol.</div>=
<div>=C2=A0 =C2=A0</div><div>=C2=A0 =C2=A0Event Dispatch - This would be th=
e async method for resources to send events up to any frontend that was lis=
tening</div><div><br></div><div>=C2=A0 =C2=A0Task Monitor - Each resource m=
ay have tasks that are being run as part of another request.=C2=A0 By givin=
g each resource a task monitor they can own their=C2=A0tasks without needin=
g to integrate into some global monitor.</div><div><br></div><div>Meanwhile=
 the edges would connect resources together, and contain a list of tags tha=
t describe the relationship (e.g. collection membership, contained by, mana=
ged by, etc.)</div><div><br></div><div>One thing I like about this data mod=
el is that it let&#39;s us do some meaningful work at the aggregation layer=
 without having to know anything about the data/methods that the resources =
are providing.=C2=A0=C2=A0</div><div><br></div><div>When it comes to sociab=
ility with other protocols, I think it is relatively lightweight.=C2=A0 The=
 data model is a bit richer than what IPMI offers, but I don&#39;t think it=
 is so rich that it would be extra hard to write wrappers.=C2=A0 It would a=
lso be a very useful component if the community=C2=A0wanted to support RDE =
over PLDM.</div><div><br></div><div>So, to close this email, I want to lay =
out how I would imagine this aggregator would be used in practice.</div><di=
v><br></div><div>Once the aggregator starts up it would have a root resourc=
e.=C2=A0 This would give any important process metadata, a default entry po=
int to look at registered resources, and a place for clients to listen for =
events.</div><div><br></div><div>Daemons could then register resources.=C2=
=A0 When they register a resource, they would give the resource definition =
and the edges used to connect it into the aggregator&#39;s resource graph.=
=C2=A0 The aggregator would send event messages to any listeners whenever a=
 resource is created or destroyed.</div><div><br></div><div>When it comes t=
o presenting these resources to the outside world, a frontend could contain=
 an in memory copy of the resource definition and edges (since those would =
be relatively stable), and query the aggregator for a snapshot of resources=
 at a given time.=C2=A0 The hope is that frontends could be as stateless as=
 possible.</div><div><br></div><div>There are some other topics I could add=
. In particular=C2=A0I think caching becomes a very important subject once =
you start managing distributed BMCs.=C2=A0 However, this email has gotten l=
ong enough, so I think I will save that for another day.</div><div><br></di=
v><div>Thanks,</div><div>Richard</div><div></div></div>

--000000000000d639bd059f0a17ba--
