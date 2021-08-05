Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6983E18D7
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 17:55:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgY8y3qYjz3cL8
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 01:55:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=BfZAo7wF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hSo8ddvO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=BfZAo7wF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=hSo8ddvO; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgY8d6pGsz3081
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 01:54:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6E04F5C0085;
 Thu,  5 Aug 2021 11:54:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 05 Aug 2021 11:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=DNCzxJ5YykZy8GQsAXMVYue0Hi
 ir/8seG0dQ4qOiNhc=; b=BfZAo7wFmyXjBTO0cY66pYSbMNGQxQTj7E9+CjciYI
 Qq/0ACoiWQb57kHGWgv5abixd/U2dN2KGw8KjZQwVo/dn9P3vDXoox5gCsfdy2sZ
 PdEiECgW16J2Va0YjMFhsXFh/Wm/a4TGx72lX7OTz0KhO5pNyl4SFuBGZedkor66
 wtE3YEidZLvF4BbJv0o2fHSv6gGvbWGwiydofnwuUq1OH+dJtjApOuemQ8ATPTNq
 5BJbnQWDpQkaUQc+GfO2nKf8n6Ms8MyOThoAWO2cGcpWIWql4kGYRRzteT/e297Z
 0lCwcoqbxC1ahxxTtUh6UvETQVtykta4NgTHLdH29FSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=DNCzxJ5YykZy8GQsAXMVYue0Hiir/8seG0dQ4qOiN
 hc=; b=hSo8ddvO4w7gC+RHYXfp5+NjN2oL3ixhUhzwA1jnG6ipXu4pJ78hvRkIO
 laUhyynnmpk6XP8HG1Re2itnhXWPbS4TnoTy+fg6Ce9okyGWPM8Lagp9qB9/LC2G
 kZz3DULi3RUnuz/K6UiRGKpPP7UQyREKdbq/v7Txj2m3YFc+1bxx85vIIhSpWK/T
 SVXTwkcN4PzPl+eomGnAht5S8LX2KNhxbeupgJnBfSIQfzrzwVcD446vENpKDQfG
 4t4Or0PXKHDP5dewmccEhnjcMlIfXYwkks/+haEEtEKOypksjo//yY5GcPCBjnuE
 dRZRWgr0tpLvW4DgDr02AfjR1GY8Q==
X-ME-Sender: <xms:zQkMYbtkmZ3gIIEQySMwGuP54aulMPYlCitS5r5kzlQkRz0DMm83zg>
 <xme:zQkMYccBKjks87DDG_KB_0Xj8BE6fs_h7lCxpqNjPxE0wjMNxbDsf9yzk2AwRgdXg
 FUDKfQZzf48NzQNwJY>
X-ME-Received: <xmr:zQkMYezjT0Fx7TRTgaXrXKDRJzbWd4DuBBCyJQT8TOCwQUkiUPP8m3xJKrfQxNRPWhligOs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieelgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtkeertddtreejnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepuddvveehhfdvgfdvheeikeeliefgudegledtffevvdeu
 ieffjeduudffudefieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:zQkMYaN_PaDF5C4Tm-Tr4H24btPETmLmUJZY3FCEjRgtpHdggUBm8Q>
 <xmx:zQkMYb-OY7tKXLrZCs47pDNe6LAa8F4ltCNWykv68kDRElKns-FLrg>
 <xmx:zQkMYaX9nfa5R5WCGGsWhIqpsBl7YODtizaix2i5inNn6lVBknYmhw>
 <xmx:zQkMYYESRbeRExVar9dEFU4FZkL82fdtY8gp2RCV8Fv8YEy-4U42Rw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 11:54:52 -0400 (EDT)
Message-ID: <943fa678bf5bf5417d7f5b619ca3d43f2114b489.camel@fuzziesquirrel.com>
Subject: Re: Security Working Group meeting - Wednesday August 4 - results
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Date: Thu, 05 Aug 2021 11:54:57 -0400
In-Reply-To: <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
 <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2021-08-04 at 13:47 -0500, Joseph Reynolds wrote:
> 
> Bonus topics:
> 
> 4 Surya set up a bugzilla within Intel and will administer it.  Demo’d
> the database. We briefly examined the database fields and agreed it 
> looks like a good start.

Hi Joseph

Another idea I've just had that might help here - I wonder/suspect there
are security working group participants that aren't following the
mailing list (which is fine).  If that is the case, they simply aren't
aware of the feedback or questions coming in from the community in
response to your minutes.

Would it help if you Joseph, as the security working group chair who has
the best understanding of who from the meetings can best engage with the
community to directly CC: those meeting participants on the minutes in
addition to the list?  That way they will get the feedback/questions in
their inbox and have the opportunity to engage?

thx - brad

