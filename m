Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A8194102
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 15:09:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p6Lm3rBFzDqLZ
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 01:09:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=GZ8rhSXB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=q2XRN7uw; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p69G1qQwzDqxX
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 01:01:38 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 56A1C3A5;
 Thu, 26 Mar 2020 10:01:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 26 Mar 2020 10:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=n+w2sz1dWcZaHeDAy/QkWCfzNRJ
 ZI4/Kap5Tk7/DomA=; b=GZ8rhSXBbvSLr8yiS01/F+Xq9hGuakrKDl8LuJ8I/5J
 rlVh/TjR0/AGQq5jUEeK9gJL33vZBubCfcsjSoycemarEJIZtBpM9A0w8cqCKWL/
 kHqcv3mPY35cT6/yLqWTJ5jF3fqSfHkihPEO/NSIKrc5BB2UB2SLY2qtjlMehQEb
 f5SyCo+FVzUmKPqr/enceodxOIDJ/lcGnElgfAmEmSZiOwchdfTQ5yKSkKQt4YBz
 8LjOvcWKfk70fwR5J0FOVl1VHhIcpA6ym576SOUqz8cMIS0KtCvx8LO/0cQR+zsw
 89ZgKT6loNakaLiXnhkXyIyHmIa1fVPhyjkvJ/zfBiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=n+w2sz
 1dWcZaHeDAy/QkWCfzNRJZI4/Kap5Tk7/DomA=; b=q2XRN7uwPc0uq55u+cVTjf
 YFqqBkzEMhiYrbgBEltM/ObKURo6BE+mktWX+3eh/VcDGLKvRGtEt5dHYJMh3RlD
 jz8VW05bUpHg17eYnGwmbc6vd5e1ZMQAHH4toICdDDjwz2KMvDLxf8ALMNn8rPVL
 UEn68+Gd7xClSZNFzNZyW2JP6moOwMk9qf0DFWXgYkgjPepgaaQIw1tSOUjIeiHj
 Gy+3ZSbv5limNKihLBeP/grrZY9aQQ8CQqknHEJHfyxyE0IEBLJmMVuKbwMnk+q+
 MPLHz/nGogt7jmI4zK/+pk9qCljBPt1zbdP8niN7enqOJ2Wpb6HcxF+2jRe2Z10w
 ==
X-ME-Sender: <xms:vrV8XhwB7Ghcuujw0BZ2owmyBoBX5HPAj-rVK_4ErDyNQxIY-58z1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehiedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuffhomhgrihhnpehivghtfhdrohhrghenucfkphepudeiiedr
 udejvddruddvfedruddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:vrV8XliWcKT7d3Q5muTASTdWUTCzH6qDBzqc5O6xFVK3bP3SrkeHvg>
 <xmx:vrV8XmUAztWzJ8x2JKBYpZz8zEsz0q-b05GC33xySbo9S4MN-6uLoQ>
 <xmx:vrV8Xn3yKx9qEGkQKEZL38kwBNX-zSjuyZsU35V6y-HfqeaJjJzmew>
 <xmx:vrV8Xhzf01zYhkvI3uj3VdGJFJtejdTkS5b6LDZvT6QhQDwnD304cQ>
Received: from localhost (mobile-166-172-123-121.mycingular.net
 [166.172.123.121])
 by mail.messagingengine.com (Postfix) with ESMTPA id 31388306996D;
 Thu, 26 Mar 2020 10:01:34 -0400 (EDT)
Date: Thu, 26 Mar 2020 09:01:33 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Proposal for the connected redfish client info
Message-ID: <20200326140133.GB10853@heinlein.lan.stwcx.xyz>
References: <94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com>
 <bfd9332f-1a27-d00f-4379-8c039b9e9b24@linux.vnet.ibm.com>
 <76571c68-ed92-f15f-cfd5-37a323b430b1@linux.intel.com>
 <477c9a0c-ea2a-f1d5-7e0f-59ece898096d@linux.vnet.ibm.com>
 <2e08beba-3904-f3dd-b11e-6df9994f901b@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e08beba-3904-f3dd-b11e-6df9994f901b@linux.vnet.ibm.com>
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
Cc: i.mikhaylov@yadro.com, openbmc@lists.ozlabs.org,
 James Feist <james.feist@linux.intel.com>, rhanley@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 26, 2020 at 01:54:05PM +0530, Ratan Gupta wrote:
> >> This confuses me, how are you getting the serial number for a 
> >> connected client? If so, have you looked into data protection laws 
> >> and storing Personally Identifiable Information?
> >
> > Client have to give this info, it could be anything like hostname of 
> > the client, serial number of the machine etc, it is up to the client 
> > what they want to provide as part of client identifier.
> >
> > Why it is needed?
> >
> > Consider the below use case
> >
> > => Client(x.x.x.x) creates the session with BMC
> >
> > => BMC stores this IP(x.x.x.x)
> >
> > => Now say Client IP(x.x.x.x) got change to y.y.y.y but the session is 
> > still valid.
> >
> > => Stored IP(x.x.x.x) will not be much usable here in this scenario
> >
> > => Here Client Identifier may be usable to identify the connected client.
> >
> > Let me know your thoughts here.

IP addresses are a terrible way of attempting to identify a client
anyhow.  Aren't there hundreds of implementations of authentication
tokens used in web technologies?  Why are we attempting to invent
something new?

It seems like much of the internet world has coalesced around JWT.
https://tools.ietf.org/html/rfc7519

-- 
Patrick Williams
