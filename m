Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0050D3E1620
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 15:56:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgVWL4dCGz3cWN
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 23:55:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=vI7RtKPP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Zq+v/jU8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=vI7RtKPP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Zq+v/jU8; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgVW332zGz30R3
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 23:55:43 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 789405C0087;
 Thu,  5 Aug 2021 09:55:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 05 Aug 2021 09:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=sYmUbEpZC+wYslQjw12fW4ALZn
 sXY4mYOD/T8bIMXF0=; b=vI7RtKPPaprmPb7mUGLQkOSAwmXcgE9t/MHg4U8lFp
 OjmpSkHGW/OYjIpswC98xfmjqfQGIfDaGeq7keZa3rckRY5VISQcnjBLLsHQo6pn
 3bcSWSH1ge+wKniVLVFHIaB15iALY9GBMxkYjU1EmsHQR9qMOdv0s5Uq75AlYzc7
 RdUrBYdFrKiUk1Jk82tLJc9j/2eY8GaP7iYQUB6IvGO+vpZJ0GIO1D2GoJkM2lGf
 EzOy8HQQfqrdQ+gMWJ7mf2VSisepB2/its/t2sa/9PsouFbcojJueDjoutuP+cXv
 LSIMLJt0Khvz9zP5x+FTQnhdHwcZOHlsZ0z/SG/3Vy3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=sYmUbEpZC+wYslQjw12fW4ALZnsXY4mYOD/T8bIMX
 F0=; b=Zq+v/jU8PJxy4ksdM3gggoYRYd02xsGo3Bx0GJqWIEc7ZvvIikR0y6yN9
 i08Ie/jMfKL4zNjMw7OctvQggzJ0nkUj6L2gZzNA1BjfGuT2bZVMu95aE53A5sEm
 3FSkJJrY1CRxr41MutUXzaleY21SnzcXQ9UsqvU1cs8VRgDUO3sXVAdpowybc/X+
 U2/PZ552xuw9/GcQpDkaSxMM/p2YdbgXU61jYoQ27sEHSaFS3YswRzNGMrjBxaZU
 ffpSqqqT5TtAQf1mx5XFVvOgGqae/CuTRgePrAyGS1BvU6OsIHtbAtvKT+LzUT1u
 jmptlC6ytLKXrLdY352lL8UqbWNnw==
X-ME-Sender: <xms:2-0LYRs-63CBmn9lZNdeZSgePFg-6S8LT3fG-SDarp_qYuADITl2ZA>
 <xme:2-0LYafPz2C4UQ5Tzut1k7-tBkIB4t9s9oH4iQCbb8cbCAMl5C7GmTGQiiiaDEcIA
 UuHEW9YVH0BT6DLjb8>
X-ME-Received: <xmr:2-0LYUzMXyQGDr2qf9150Srb4h_f2q1iKv8ceeEzzngwmz4YQuixr9UFhyet2i__QdPzOF8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieelgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtkeertddtreejnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhephfdtlefhtdfhvefgtdeufeekudefgeegjeekheeihfel
 ledvfedvgfekveeffffhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuh
 gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:2-0LYYOwSREzP5iBR0u5qbWkexowXV2MVVtAs4l0EEZ5Uv_fUrqF4A>
 <xmx:2-0LYR-e_R8GclzKlxSMx2ZsLczY8nTk1MfRXZnw7UUdJvJqTj3Xdw>
 <xmx:2-0LYYXJhqLpLOhy7R3xEskJqzBAM8uN8t3iMAJixXXKSmOmsqbtWg>
 <xmx:3e0LYUmqxGxMN7UHkyHL2TPWSvI8M2dae80ckIp8BliKSFhePbT24Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 09:55:39 -0400 (EDT)
Message-ID: <169a8f7b4c746995a1cd1e8781b4f427b61d4c83.camel@fuzziesquirrel.com>
Subject: Re: Security Working Group meeting - Wednesday August 4 - results
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, James Mihm <james.mihm@intel.com>,
 "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
Date: Thu, 05 Aug 2021 09:55:43 -0400
In-Reply-To: <CAH2-KxBqzCr--LN93P=OsmorDPkbgzDxyxpSGckzFX7MAv96eA@mail.gmail.com>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
 <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
 <YQr0E+NP+7QKIrf1@heinlein>
 <1fb3f67c-84d1-a84b-c44f-a9c2774cfd9b@linux.ibm.com>
 <YQr9RWolIR7witlQ@heinlein>
 <6aa885f5-6870-4ca7-b5b5-cfc9568f1f96@www.fastmail.com>
 <CAH2-KxBqzCr--LN93P=OsmorDPkbgzDxyxpSGckzFX7MAv96eA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ed Tanous <edtanous@google.com>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2021-08-04 at 16:57 -0700, Ed Tanous wrote:
> On Wed, Aug 4, 2021 at 4:48 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> > 
> > 
> > 
> > On Thu, 5 Aug 2021, at 06:19, Patrick Williams wrote:
> > > On Wed, Aug 04, 2021 at 03:39:45PM -0500, Joseph Reynolds wrote:
> > > > On 8/4/21 3:09 PM, Patrick Williams wrote:
> > > > > On Wed, Aug 04, 2021 at 01:47:31PM -0500, Joseph Reynolds
> > > > > wrote:
> > > > > 
> > > > > > 4 Surya set up a bugzilla within Intel and will administer
> > > > > > it.  Demo’d
> > > > > > the database. We briefly examined the database fields and
> > > > > > agreed it
> > > > > > looks like a good start.
> > > > > > 
> > > > > Once again I'll ask ***WHY***??!?
> > > > > 
> > > > > https://lore.kernel.org/openbmc/YNzsE1ipYQR7yfDq@heinlein/
> > > > > https://lore.kernel.org/openbmc/YPiK8xqFPJFZDa1+@heinlein/
> > > > > 
> > > > > Can we please create a private Github repository and be done
> > > > > with this topic?
> > > > 
> > > > I don't have any insight into how to resolve this question.
> > > > 
> > > >  From today's meeting: using bugzilla has advantages over github
> > > > issues:
> > > > - lets us define the fields we need: fix commitID, CVSS score,
> > > > etc.
> 
> I'm also really not following this as a rationale for starting a
> completely new server.  This is easy enough to add on github in the
> bug template.
> 
> > > 
> > > These are pretty minor when you could just add a comment template
> > > with this
> > > information.
> > > 
> > > > - has desirable access controls, specifically acess by the
> > > > security
> > > > respone tram plus we can add access for the problem submitter
> > > > and the
> > > > problem fixer
> > > 
> > > So does Github.
> 
> +1
> 
> > > 
> > > ----
> > > 
> > > I really don't think that some subset of the community should go
> > > off on their
> > > own bug tracking system.
> > 
> > +1
> > 
> > I'm not aware of any effort to use Github security advisories so
> > far. I
> > think we should try that before burdening ourselves and any bug
> > reporters with yet more disjoint bits of infrastructure (we already
> > have the two mailing lists, discord, gerrit, and github).
> 
> +1
> 
> > 
> > Andrew


+1 from me as well on all points.  We already use GitHub bug templates
and GitHub security controls in this project with great success and the
community is here to support the security working group if you don't
know how to make use of those.

Additional benefits to GitHub that were pointed out to me is that GitHub
checks passwords against leak databases, supports 2FA, can be configured
to require 2FA for those that have access.  GitHub is also more likely
to keep their software updated than a privately maintained bugzilla
instance.  In 2021 it is just too hard to compete with the scale of
support that services like GitHub provide.

I think my proposal would be that the security working group create a
new GitHub organization here:

https://github.com/openbmc-security

The security WG leadership could own the organization and create any
number of groups, acls, repositories (public or private), wikis, etc..

thx - brad

