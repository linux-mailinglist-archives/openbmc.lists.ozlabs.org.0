Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06303597492
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 18:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7DjR6FVfz3bnV
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 02:58:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=avPIUEGd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HeANiZXg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=avPIUEGd;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HeANiZXg;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Dhx3G8Nz3bgC
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 02:57:36 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 44E533200978;
	Wed, 17 Aug 2022 12:57:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 17 Aug 2022 12:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660755450; x=1660841850; bh=AKEI+Jh9PBMCAT4vDd8edlSeK
	1yu9WF/viDcmwucpUI=; b=avPIUEGdn7y/1Axfg2ELeCDcPtwmT3X+vlrdFEzOg
	YmF9Xonrtw9VgsDDNZmWsdq2zynhlyrgVx/I0mTWXFG9q8j5AvilSaLm1QeO3zEN
	exqN/tGoqXqshm62K7KPgQAnzsnXZdqRpQhF05seqq9a4uAppSWd1tAACJav6sf8
	s4W5/T/GzzZuX/2kRPmmRgK5SeY6DlExS5+mf8O03m2qyjJooj6ftbxEwc8LvHoy
	NNW8OlhNCstURUWlhWd/yGQNcI5r19J0nDm8A2MPhwIHeqls06ffuxhNXx9yWq8c
	HM1kVeVjoarpsWUkQgcHx0vjp2FCt3bV+g/uoOs8K9rdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1660755450; x=1660841850; bh=A
	KEI+Jh9PBMCAT4vDd8edlSeK1yu9WF/viDcmwucpUI=; b=HeANiZXgK0bvQx5Md
	oBmofWG3YDPkTPoJCePjj2MxiHmsIw/CG04kC4YKub3CyAVRhKqqcqDcLkryYIqE
	FI2giC++bIC5Z4qEmE/eL3MmWWyvvRD6AvhpOSjTVAPaVTMc2oQ+cA8h63HUzPFc
	+Nbfr4rQOiffU6Ew7sLtoDSg9hm6Xbt1eHmJrviF8+tG1qUWvJlgWC4XI0+oYZGB
	tGBiUt8LMvdqytyGxaGtIch5s3xjS91IdbU/LxPIXF2WzMl+tCC2Z3y9cLJd0pnb
	BbD6hRSB1e/fhIDr97W/DJkw2gFAHl+tWBAQdTPZCb3TIct3E6HZkpxC8IidcYHO
	Apdjg==
X-ME-Sender: <xms:-R39YvMu6BD9GRE6V2B1Lvtmru9bKlJ2PuSxt_XB_SfNMU0l_e5xRA>
    <xme:-R39Yp9rBBeG0IppS3iceXT_wb2viGC9iul7kJvdbmK-A3Zk1eX_nSE5nj85LSjSt
    rIgG7pidVZzoT08uro>
X-ME-Received: <xmr:-R39YuQEh9UsYqma-QeimuC7pPtXO_EN08f1lgUgr4ZKhsplxHIR8FRm5RAsZ3e-94G2Xxl85UoEjsyQUSIv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepudfhiefggfetkeeugeejgedvhfffjeevgeeifeei
    vddtkeetjeduudegjeethfdtnecuffhomhgrihhnpeifvggsvgigrdgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigs
    sehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:-R39YjtZ9beAaoVKFR_sNeJTBMmE8J1uKkKaDpuNutfnqC_qyz-z_Q>
    <xmx:-R39YnfESWrwVByeo5bn9wwXvvPT1IB5wd9EG_4Gmjtfn_wJhp9r3w>
    <xmx:-R39Yv0shlhJrH7yFVjaWCo8nJ9344brRYYFYzKiAGelRckhJ0ndMw>
    <xmx:-h39YvEw6r5E1XOEWR0sURLkRdWExGk929ZC42tYl7akuwlrG3MksA>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 12:57:29 -0400 (EDT)
Message-ID: <483497ac27ae1474633ed666d19ade3e577a7e5d.camel@fuzziesquirrel.com>
Subject: Re: Security Working Group meeting - Wednesday August 17
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, 
	openbmc <openbmc@lists.ozlabs.org>
Date: Wed, 17 Aug 2022 12:57:28 -0400
In-Reply-To: <7f7f8fb1-0bb0-d453-e96c-8f8e40f7b3d7@linux.ibm.com>
References: <772c9b0d-c06e-e4bc-b114-45a413926092@linux.ibm.com>
	 <61158439-f152-4399-86f8-a4f730dd967b@www.fastmail.com>
	 <7f7f8fb1-0bb0-d453-e96c-8f8e40f7b3d7@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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

On Wed, 2022-08-17 at 11:13 -0500, Joseph Reynolds wrote:
> On 8/17/22 12:11 AM, Andrew Jeffery wrote:
> >=20
> > On Wed, 17 Aug 2022, at 12:37, Joseph Reynolds wrote:
> > > This is a reminder of the OpenBMC Security Working Group meeting
> > > scheduled for this Wednesday August 17 at 10:00am PDT.
> > Given the discussion from last meeting, is this on Discord?
>=20
> No.=C2=A0 The meeting access for Aug 17 is the same as before:
> https://ibm.webex.com/meet/joseph.reynolds1
>=20
> I wanted to give a couple of weeks notice (A) for attendees to firm up
> any objections to moving

Injecting my opinions in case they are helpful...but probably not =F0=9F=A4=
=A3

I likely sound clich=C3=A9 but someone will always be unhappy with every
decision, including this one.  As the WG host, have -you- been convinced
that improved collalboration between the security working group and the
developer community is worthwhile, and that moving to Discord will
improve that?  If so - go for it!

People were (and still are) opposed to moving from IRC to Discord, but
we now have 500 people on our server and levels of collaboration in the
developer community never before seen in OpenBMC...

Thanks,
Brad
