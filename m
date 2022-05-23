Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EB5531F5C
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 01:48:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6YvF4MKFz3086
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 09:48:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=T+RcZ88t;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YjeBBFJH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=T+RcZ88t; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=YjeBBFJH; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Ytn1QHsz2yny
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 09:48:32 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id AD71232009D4;
 Mon, 23 May 2022 19:48:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 23 May 2022 19:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1653349708; x=
 1653436108; bh=Xg9Ikcs6ZGCr7SzoeTMc0O+p7AOSo7oG0V4zquUrfps=; b=T
 +RcZ88ti/vgoXA6Vbqz1GcEru1Rrr4I0fRpSo4CujflK13rYWFisrUVY5xvK5bgQ
 nUEMbrUNmAau8RbuEx9mfOMedtjwPvW4wFy2dYg/fNWhDx3d4DdY8zWnw6e2pQ49
 jfvmjzE4NtFIMgk4+g2N5LF8tI/RiSuwMQSGJJVnirY4vY2xMZjJokpK3eN67sKP
 M2efsq5w2Bq97GeZ03Moi0B+J7mAA0uicG3bwknS//8G+RmZpL9Nf4j4vFOQEGuR
 P1Nl0b2eWiyVMm6MWCZJ+2DGkxWA63crk71NQpU916SAtYc2Vay6xOJjFruhiMg9
 wFobhEppdd3+F5x60ZFHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653349708; x=1653436108; bh=Xg9Ikcs6ZGCr7SzoeTMc0O+p7AOS
 o7oG0V4zquUrfps=; b=YjeBBFJHku0M/GDi7QEO8EqfB7j3zgPGu9+xlRh9rbI3
 +8h+wIII5/vKe+ORD376RWzAuCbcXfBDbnpVdafvipIO6eeu09HYBSdX/gya8Bcl
 Qi+uaOy79qBNQCCuIWsHK8qaoZSck65xYrhn/1+q0IC66r1uNgYZT7zYTm1wra6+
 /EnzzgEI9JqU84E1+A1WrvWzx5LF9J96XjgI40Z5woSX77ySbmmQ237K/4bS6oDX
 BV0EzRAKHWuuFjgJG9PiZS2eCuLkVmx+aGYpNT1lYucyJ5HLpll1mCSUktrPXTTV
 LcEP3lPEAkicVKtxa6EsB3HoIof/t6TlJjef1qcx1w==
X-ME-Sender: <xms:TB2MYjYeoJxnZNwceNGZ0gbLwi1pCOTAuYS8n8TzuCW5bMhQeKPLNQ>
 <xme:TB2MYiZ9D4EigQDJWqjlqKD7PBvbWC44JcaEasyHcFkAfBBPaEZaHfmmDzIK2lec2
 hKTRT6A9Sfg5WBB73s>
X-ME-Received: <xmr:TB2MYl_FcCgUhj8wcMMJUaKbN1S8QrX1ABDpd8rYFFQPfmRZ4Sz6GUuM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjedvgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepffdvleejtefgveelfedutdegheeutdfggfdvteevkeek
 leevieegjeeffeeuffejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:TB2MYprPziMMNiviI7zN2bj5qd1egjTYk7eAWe7s3XahushqIBE1_Q>
 <xmx:TB2MYuqEzjd2XUKQzMc87tHRiJBUrE9vQIW-L_HJBukXcJD6UvZ02g>
 <xmx:TB2MYvRv90JkWgkdbV9ZFxGbjMPElaRn0I7JulIXrMyprK17FJn-ug>
 <xmx:TB2MYl2Fyb7Uht6d11OsGjtKAmrYTordmYGbbS3kbFqVY7mTms_E2Q>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 May 2022 19:48:27 -0400 (EDT)
Date: Mon, 23 May 2022 19:48:25 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: John Broadbent <jebr@google.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
Message-ID: <20220523234825.lcbgr2kljbf536cx@cheese>
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
 <CAEAQM=Lo9AcUrw1c2bT_pYNtG0LpT9w2=McMbx=RY=SP0V_4PA@mail.gmail.com>
 <CAH2-KxBqT-A91Jpj9ENTcajvgzO=oDRsTUPe=eLaOVBhVSjDqw@mail.gmail.com>
 <CAPw1Ef_dMf43e567LLAfMZp6khWWQAm=i63LHfOwWkyiSe-MFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPw1Ef_dMf43e567LLAfMZp6khWWQAm=i63LHfOwWkyiSe-MFA@mail.gmail.com>
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
Cc: Ed Tanous <edtanous@google.com>, Cody Smith <scody@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 23, 2022 at 02:07:55PM -0700, John Broadbent wrote:

>>  "I have no interest in making this easier for you (if it is worse in
>other ways for the project)."   - referring to downstream only features.

>This is the wrong way to view features the community does not want, 

Can you talk about what features the community does not want?  If I pick 
on Google a little bit there is already a google-misc repo where Google 
puts whatever features it wants.  There is the meta-google layer that 
doesn't actually have any platforms in it.  There is the newly approved 
Google SMM logging feature/repo.  There is an OEM Google REST API in 
upstream bmcweb.  There are multiple Google OEM IPMI repositories.  And 
to be fair, Google isn't alone here - IBM has an API in bmcweb and 
layers without platforms too.  Where is the external (community) push 
back on features?  The only one I am aware of is a feature IBM wanted to 
contribute (which for the record, I am not convinced rejecting it was 
appropriate):
https://lore.kernel.org/openbmc/CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com/

My point is, I am having trouble accepting that community pushback is 
what causes downstream patches.

> and features we would not be allowed to share. 

This I can accept as a generator of downstream patches.  I actually 
support the monorepo concept for the most part, but not with this as 
motivation.  If IBM's pay-for-access feature (reference the thread I 
linked above if that doesn't make sense) was counter to the spirit of 
open source (again, I don't think it is), adding this kind of thinking 
to our decision process is even more counter.

>There is a layer of complexity
>that we use to integrate with our data centers services that only we need.
>A better model would allow openbmc to be flexible enough to enable
>downstream features.

And an even better model would be one where there is a path to getting 
all features upstream?
