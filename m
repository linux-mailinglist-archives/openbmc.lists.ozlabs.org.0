Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C43A584910
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 02:27:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lv7cs1GX9z2y2D
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 10:27:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=ETa4TebB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hojvCTtM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=ETa4TebB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hojvCTtM;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lv7cR6Rrlz2xHn
	for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2022 10:26:47 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 053575C009F;
	Thu, 28 Jul 2022 20:26:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 28 Jul 2022 20:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1659054406; x=
	1659140806; bh=Pg4skg7qC05DMXjPsdGM+SPp1heQ3pZMuMzVqvWY4Ds=; b=E
	Ta4TebBQbrVp5Ae00Mngt0Qd302GkdZbw2BWULX/pSN7Wkc1vuM2AUPvfVm4NOHj
	3NUGS5As2eMTLJ6AKgm7UE7T9MeXa6BxW1nDE8+mPC4O27ZKtjAKVU5CYHLVzCo9
	ccoWJyIsH6VGQezHK4TIFxy3K4uuwRuiWfy5wt0upWqIzqvYN5EIbd2lbzF+Tk9P
	D1bsh5aK9v3l/Qv4siXEDalhkhvH0Rt/vfw78xT060OomgzstebfIIacR/09KGpW
	0fOIrwSNbfubrnGlRWeRKX3z2/JvokN70gCWTQUlafq2d5SdeS9rK5l3xQk5zwwG
	6FLoTKDtgaN3Q6FrhcQOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659054406; x=1659140806; bh=Pg4skg7qC05DMXjPsdGM+SPp1heQ
	3pZMuMzVqvWY4Ds=; b=hojvCTtMEy0DuKXuc6p8hQDdgwX3C9XvrnKg/WDLY6Hi
	sRf9XiGaCZzhHDd61Pj78xOccsvhP6kKvgz6eern01+I4IGeA/YvBFjoFoh/54SU
	2URkNkvpjRHvhruMFvruo/qoRt27RhN6vg07LcqURDA1BZvFMWZbhnmemvd1/xdG
	A67+41i5YJJz+HRzrs6h3736Y7MJfxkr46y8T+EEOc+JVQs86BArOq4SjsrPh3Yp
	HyNBktOI7JhtNXfDKqBFAFJ3hNuR3srQyKV+xqMwACq8SZBEoU0yoYB8kNS+Us1f
	rMbIkUFEz+NQLv0gebY6m/DYGxDI8slriH15Rgs/jA==
X-ME-Sender: <xms:RSnjYv0cF8hy5OdQ6uwhV84lmHQfGcoNa1y6QvXeVpk-4DFR2mLbFA>
    <xme:RSnjYuHBFF0bO1pg8NsgVnIQKn8EvdxPMQBDXhebhZKGIg-FjSd3qvm8L26_zzeIR
    CYdc755NbNCmMi9scE>
X-ME-Received: <xmr:RSnjYv4K0xgbyxbqoLvIjtvDLuYofmPoGmWl8QZqC4ch2_Lg0plZJlKj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduhedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetueffgeetgfeugfettddugfduvddukefhffet
    ffefvdegledvieelteffudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:RSnjYk1Ox9gRNIHfSHvncdgykZBzGm1ypnWNvpygX2YfPMKjdHCFPA>
    <xmx:RSnjYiFJdY5jIoqAmCC-aD1jkV64n6zj5bHt4F-slUbV-bz65YQPcA>
    <xmx:RSnjYl9l9pAsehzHGfDEf8dhVLwaqEAexQwe0SqVT_1wCgIVyGB9GA>
    <xmx:RinjYkP2yvrzcQ9143UKjf7SdGfe1EEhe8g5g0amiEe7wXU98lNEAQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Jul 2022 20:26:45 -0400 (EDT)
Date: Thu, 28 Jul 2022 20:26:43 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: dbus prefixes (was: DBus ObjectManager Interface usages within
 the project)
Message-ID: <20220729002643.s3zsmwnykdqy6zf4@cheese>
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
 <adb35a4e-718e-03b2-a562-2c2c6d59f3b0@yadro.com>
 <Ys6u143YCgQwujIP@heinlein.stwcx.org.github.beta.tailscale.net>
 <149abf3d-7afd-7e16-eed2-2099293578da@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <149abf3d-7afd-7e16-eed2-2099293578da@yadro.com>
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

On Wed, Jul 27, 2022 at 02:15:34PM +0300, Alexander Amelkin wrote:
>
>Again, why (for what purpose) do we have to obey those statements?
>What exactly are we achieving by obeying them? Do we need to achieve that?
>
>We're creating a closed system that does not interact with any 
>external software using d-bus.

I agree.  The spec also recommends that we version our service names and 
interfaces, but we don't do that either.

Further, outside of the OpenBMC community, DBus programming conventions 
are such that the service name defines the interface schema for a given 
service.  We don't adhere to that convention either.

The way I look at it is, our use of DBus is mostly an implementation 
detail of our tightly coupled system.  We don't use it as an interface 
to the outside world.  All of these conventions being discussed exist to 
aid with the latter.

Thanks,
Brad
