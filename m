Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 161592FDCDB
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 00:23:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLhR00hCyzDqc3
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 10:23:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Gsel2jkY; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=MFh5f90T; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLhPz1YvvzDqc3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 10:22:30 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C3EB85C0100;
 Wed, 20 Jan 2021 18:22:26 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 20 Jan 2021 18:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=CCyQUBMBcXKBVTj3+Nh6Z7APbAopb4D
 kJTCq5xttUwA=; b=Gsel2jkYj2y+NSDV0TRxcH96v/u5N8nyHSyS7rjqj38tXPv
 KEYJHE7Q569V6eiELL74AhcbJs8opXfesM5Rl5/o94hJBujgmbAsLz/6YYREC8fX
 /1jDK/0JR9gHiW7u40Pw8ebArg8Yczomteut1fJPlBuAQDd5rGw16uh3jp1apM+a
 En8X5NynrGFvZ0z7gcOBkes3hMd7MAIM3KTWklKszaMFX7EQE/k0LkOXDJKCwTMW
 MoAEMvF6SjQk5QEgrbPYoQ2cwnl7AZi3tarsCxP6LJfhbt6T+zGprG6Ba+e9Jpu4
 2fyNAhwgnILAxAfKfdenZz4bdICp2eQvBLkgbTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CCyQUB
 MBcXKBVTj3+Nh6Z7APbAopb4DkJTCq5xttUwA=; b=MFh5f90Tku7uCELGxuSFzf
 b5BhSdFMg39NBHwUe2fK4Y/U7iEPPPV6qjA08yk+jPAXyaAyqO8xPFduk7Axgxs6
 HT+pnVH62ghL0pOrbBfxGKN+ORNsRIokiZLjOV50j83xqh4IaWm5bt2sdQDEOJtQ
 4WO3OdnAk5UoOlqJwUXKSRR9IlJtQxq47Xow9KFHTGoIC7Erh04WcTBezjltpnqJ
 pwkqYy0iTgkwnusI1xmj0SH1rvQkQ88oVZVX2IlBiUkVDYMOKWJaOEuYsNuSbQbY
 zcabVoXaLuNBMptjAvQwF0QhgBWJN0iBIb20oF2/5kXhqxOHXj0KXu7T0LjCm5Yg
 ==
X-ME-Sender: <xms:MrsIYPDL4WGIPDgknT2LWAsDS8hlYrNB4vkC9UJV59q2AGrdRpW6RQ>
 <xme:MrsIYFiRk_N9brVDUtfkUNFihMiSznJNaJMAtX7jZmVFbMgASc9aQyZu_Jm0fw-tj
 bapViI0FayVEwNkdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuggftrfgrthhtvghrnhepkedtgefhveffieeivdeihfeugeegteel
 heffueevffevkeejfeehfeevtddthfegnecuffhomhgrihhnpehophgvnhgsmhgtqdhprh
 hojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:MrsIYKlK6o4Z6tflHSay3jUsmTmyaI_44XKTgUs5CUv1qJS_8nrS9g>
 <xmx:MrsIYBwMhf-WMsxGzjmreJlYis0KM2pplcGWa0qreNykcp7Z-8msEQ>
 <xmx:MrsIYEQUmwLMOnWwV3ddPWLqxNtS_PINxIHw1ry1j57AI5un7zUT4A>
 <xmx:MrsIYDOXxyYCHwiYCAL-cwMIHH2I4fIX3qNYXLolAM56U2yiovd-QA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1E0E7A0005D; Wed, 20 Jan 2021 18:22:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <004ca9b4-08e6-4d58-bfda-c27d555c04f4@www.fastmail.com>
In-Reply-To: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
Date: Thu, 21 Jan 2021 09:50:09 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ed Tanous" <ed@tanous.net>, "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: Gerrit owners plugin coming
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 21 Jan 2021, at 05:53, Ed Tanous wrote:
> Over the last few weeks, we've been slowly getting the gerrit owners
> plugin deployed and tested, and got the OWNERS files merged into their
> respective meta layers.
> 
> This has been leading up to a process change that has been on the
> roadmap for some time now.  Once the plugin is enabled (and some other
> housekeeping is done) meta-layer changes will be able to be submitted
> to the normal openbmc/openbmc repository, simplifying one portion of
> our review/merge process.  Submitting to openbmc/openbmc is something
> most newcomers to the project expect, and we've had numerous gerrit
> reviews submitted to the wrong repo in error.  Hopefully, this change
> makes meta-layer changes much more normalized.
> 
> Once this goes in, this means that functionally:
> 1. We no longer have a bottleneck on creating new meta-layers,
> renaming meta layers, or moving files between meta layers.  New meta
> layers can be submitted through gerrit similar to any other patchset,
> and will be reviewed with the same process we already have for any
> other type of code, and don't require requesting a new repo in
> advance.
> 2. Changes that require mods to all meta layers (yocto compat fields
> for example) can be done in a single commit, across all systems at
> once, reducing the possibility of breaking builds for meta-layer
> combinations that aren't covered by CI.
> 3. No more waiting for your meta-X changes to get merged into
> mainline, which should reduce the amount of time between recipe bumps
> and the main build reflecting the changes.
> 
> Ownership of the various meta-layer folders is still enforced by
> gerrit through the owners plugin using the OWNERS files.  Today, they
> contain the same mapping as the content in the MAINTAINERS files, so
> no files in the repo actually change ownership.
> 
> The final review to add the OWNERS file to the root of the repo is here:
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/39379
> And has already had some discussion and looks to be good to go.
> Assuming there's no other objections, I'd like to get this change made
> on this coming Sunday.
> 
> Overall, I hope that this will be a great improvement in the overall
> structure and usability of openbmc, and remove at least one stumbling
> block people new to the project tend to hit.

This is great! Thanks for pushing it.

Andrew
