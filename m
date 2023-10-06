Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B337BBD8E
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 19:18:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=XjNt/p8u;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aBcZc0EQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2FWV45Xqz3dDJ
	for <lists+openbmc@lfdr.de>; Sat,  7 Oct 2023 04:18:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=XjNt/p8u;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aBcZc0EQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2FVq6MqDz3bvB
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 04:17:55 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id AD3FA5C01D4;
	Fri,  6 Oct 2023 13:17:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 06 Oct 2023 13:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1696612670; x=1696699070; bh=/9
	D/At6vvnv4ytkaV/NThvy76qY/nY4JAPWF5Y9zFd8=; b=XjNt/p8u6oiJXAlX8E
	T/SHmGZK+Q/o3ujnw67GVPFsDFSCvj1tJHuvrhZngEBD8UEhnVmHdtmi1F/P/hfv
	ww21w38xy3DS/2gTCOjYm7Nko2MCJStSTBfL7K6j9Y8W33y+Y5of1A6GdIUv1omO
	2KRlQieeTNrHcwJ/R3IH4P0ybQ3hcLhv/kIv4oyww7u+gAlZz9WzObSkJtSkeYh0
	nmt9bk+FfLsf7QaOd+MlBXtH4en3IDJMXruO60AbuErAu8BMFCPyLfRcL98mli4X
	R/s74PwHolQ0fYn9YevCnmM/ch3iP6PLeuRwVRTKXeLILhCx5yPwpDqlN90cz7WB
	91SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1696612670; x=1696699070; bh=/9D/At6vvnv4ytkaV/NThvy76qY/nY4JAPW
	F5Y9zFd8=; b=aBcZc0EQwyO/9Iv2UZq61GLy3ZxbeTDUzwzuIdvJ/dkdtwB9I5Q
	YWPQ8On40BxLsVc00L0QMxlECNxEY11Hb1y4FkWtAnnjolDX/guYJfi+XOexcNID
	Xbp6FF61Z/UER7GNaw8GTmCZrJH3rM8WH7W9PCdOCqNJgX/CLFpzsaHd/NndJT31
	luzfFHE/ighWiNvoALrE+/hbWEGEyJoLdATv4IT5DIyLZYPgu++PsX7glbRonsEm
	FN/StClPyZJR2y4VoAxe9+KUoMJKvhXgCYGUNjntbiGAZu6ER5+14ldQrhK69DhN
	CfY6wMs2Kdzx2+Va3ISUB7oI9d0kDrUP4DQ==
X-ME-Sender: <xms:PkEgZcTUlk17cE1jlUyLvrKL4cTyw1EnDi3M7kWw2ZMQaDn1ahrcCw>
    <xme:PkEgZZzLBvHUu6rbe3rVVHP0tUSFPYZTCQRPPc6ZzitkM4RJ4xt74Le8c3kvnJs6s
    Bj7PkXk5fn4i6pCY7M>
X-ME-Received: <xmr:PkEgZZ0xA65kgAismAmX3dakUWuXSTkhv7fMk6Ag93875k1-vA2_tYYlHMbChEzJWJGNebVDCGFV1cZQhn9WEaO4UFHVuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkefstddttdejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeegfeejtedtvddtffdvhfeifffhhffgfeefffdv
    ieeiudevveehjeetfedugeejnecuffhomhgrihhnpehophgvnhgsmhgtrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgv
    higssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:PkEgZQCajh37iT1V2JA9I12VsaDVwBLa_E0GVVkpJV2XVHHaLketug>
    <xmx:PkEgZVhWV-ioze4Cfy1W2k1o7H20dVQ_MrhXNY0BkrEgIHYY4GD8uA>
    <xmx:PkEgZcpvyc6LnhEbocUmuXvH0vSLaqv2hMxlNj60j79p-A5WDzQRzQ>
    <xmx:PkEgZTbrAi_jj__kkKueKCu8DRn8ZZHrqYGwlwnMVyfLLlofRAICGA>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 13:17:49 -0400 (EDT)
Date: Fri, 6 Oct 2023 13:17:46 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: D-bus model proposal for pay for access features -
 LicenseService at OpenBMC
Message-ID: <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein>
 <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, Sunitha Harish <sunithaharish04@gmail.com>, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 06, 2023 at 07:29:27AM -0500, Patrick Williams wrote:
>On Fri, Oct 06, 2023 at 10:21:01AM +0530, Sunitha Harish wrote:
>> Hi Patrick,
>>
>> Re-starting this discussion with the design that is being worked at
>> License Manager: Add license manager design (Ibd6c6f35) · Gerrit Code
>> Review (openbmc.org) <https://gerrit.openbmc.org/c/openbmc/docs/+/64710>.
>
>I've already written enough on this topic.  You've not added much in
>terms of what I've already written, so I'm not sure what more you want
>me to say.

I just want to say that OEMs have many, many happy customers that gladly 
pay for unlocking things.  They just don't typically hang out here 🙂.  
I just bought a BMC license key the other day for my ~8 year old 
Supermicro x10slh-f.  For what it is worth.  I know a lot of people have 
a problem with charging for security fixes but this is bigger than just 
that.

The legal/DMCA concerns are interesting.  I do wonder if the concerns 
could be generalized to all the code, though, and not just a license 
service.  Licensing features may not be in every OpenBMC users business 
model, but doesn't every business have just as much incentive to go 
after developers for public disclosure of -anything- that could impact 
its business?  What makes the DMCA applicable to a license service only, 
and not, for example, any old security vulnerability in foocorp-ipmi-oem 
or foocorp-misc?
