Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 925951364BC
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 02:28:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v53N3ZLzzDqbq
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 12:28:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=anCG+TsG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=N4cCwtVE; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v52j1sjMzDqb1
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 12:27:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BE2E821165;
 Thu,  9 Jan 2020 20:27:54 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 09 Jan 2020 20:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=e9CLcP5EdpeeGqj8Dz8t5pBUp7NKuue
 LxfVmsT1QZKk=; b=anCG+TsGK7+svuUVKgF4GJsDzggAcIHuOI+BYBVOxuJqX1f
 vjiBRPD497e187Oq9sbTXGMGoU/tKzF4fBVU2P3wwafz8sVBfLbE9YCpS3A8kumv
 +SNZ+q2OCOBkcPC7TlD53bWyVsZFSp5yV26S4O+ewB7jNxlHEw2DpHv0i8Phmogv
 K8KeDpgTbsNsXVFsyryyBLlxOLQo76f7D5EkB+P/mjOTzPbEXTjgayjtVxVF7TJX
 DLaiNa1G20FYzPvqBkNDnEVoOdiPB48GKAejfMsehaGcg2Z+TbawCAWhwUUvDfdP
 lvgwO+yM43uEvh2KGCOjtp72kz1ViDyBIaBWciQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=e9CLcP
 5EdpeeGqj8Dz8t5pBUp7NKuueLxfVmsT1QZKk=; b=N4cCwtVEuquZMmPGKnUgfF
 2FaO6mS9IIDrAvQi+FMjriz09noHNR2APXPCRAHIQ78/+fwq4+KURCoN0oKlU2fn
 yspN0rJKPRx0ahFw//Deci+esbm2CL+xWRfPc1mCgUuDQduu6E3GBQn3K1F9I/iZ
 nFFGt69uTt2bVO+uPfLjjMuL1l/InaVicJ7yse1SthWLdCwDw3U8qR2l1S8RqITq
 zYZ3H3+7P1ZwZ6/C0l8zWwlNh4F2H3OHz+PyuWSJ9aeWPWEpAoXa1dFcRVBztb1i
 aTPeXQTMWIVw2j4pvBkqiFzNiXB24JWLCFQ9sIHkaKBMaPrNhyjEpFW4fP71DB7A
 ==
X-ME-Sender: <xms:GdMXXqa8kq1giTE_sRlwI4EpzSEsQiDSTw1yyStFMfHEHUI9m7xgAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeivddgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehoiihlrggsshdrohhrghenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:GdMXXrEvaxUdSD7g_ncugNWaLKNnePj_gNC5rqSuD4xkVXyhk4jqWw>
 <xmx:GdMXXvbqA6G-ZTgmN5tJ5X4dkOVGfONaWSurTBbON4kSlI8IKCKIHQ>
 <xmx:GdMXXk0wVgzhKvP7IlIZGucVerQx7e0YlToVwPgUBJM-FnY7ZtkKGA>
 <xmx:GtMXXmuLQ-v_Y8mBPvj0bLSiq4HVIzAz97FtH8EVGNn8iMPps_p8bA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8C61BE00A2; Thu,  9 Jan 2020 20:27:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <bc761c66-5d19-4c37-b8d5-58251457835e@www.fastmail.com>
In-Reply-To: <CAH1kD+aa+mG=sMqFstNCokUtdd0QcxL_gxnP=hDJkF-oU2+Ykg@mail.gmail.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <DEDED966-177F-472A-B9EE-677A3114743A@fb.com>
 <CAH1kD+aa+mG=sMqFstNCokUtdd0QcxL_gxnP=hDJkF-oU2+Ykg@mail.gmail.com>
Date: Fri, 10 Jan 2020 11:59:54 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Richard Hanley" <rhanley@google.com>, "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re: MCTP over PCI on AST2500
Content-Type: text/plain
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
Cc: Sharad Khetan <sharad.khetan@intel.com>, rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Richard,

On Fri, 10 Jan 2020, at 07:15, Richard Hanley wrote:
> I'll add a +1 in interest for MCTP.
> 
> Performance would be better if this is moved to the kernel, but I'm a 
> bit curious about any other pros and cons of working in userspace.
> 
> One of our most immediate use cases for MCTP would be in a UEFI BIOS 
> before a Redfish client can be bootstrapped. Would things be more 
> portable for BIOS vendors if this is done in userspace. I genuinely 
> don't know enough about that area to know which is more flexible.

As MCTP is just a transport it has a fairly well-contained set of behaviours
(by contrast, see PLDM). The idea of implementing MCTP in the kernel isn't
really about performance so much as providing a consistent, binding-
independent interface to userspace. The advantage here is that as the
bindings would also be implemented in-kernel we avoid creating bespoke
interfaces to plumb binding-specific behaviours out to userspace just to
hook into e.g. libmctp. This should lead to less friction getting patches
adding support for new bindings merged upstream (at the cost of getting
an MCTP subsystem into the kernel).

The proposal is to add a new socket address family, AF_MCTP. A number of
MCTP concepts map fairly neatly onto existing networking concepts - it's a
packet-switched network routing data between components inside the
platform over heterogeneous bus types. The approach is somewhat inspired
by AF_CAN for CAN bus. libmctp already prepares its consumers for a socket-
based interface with the demux daemon, so existing consumers would only
need a small change to switch to the kernel-based socket interface.

I've written a little more about it all in the past:

https://lists.ozlabs.org/pipermail/openbmc/2019-May/016460.html

Hope that helps!

Andrew
