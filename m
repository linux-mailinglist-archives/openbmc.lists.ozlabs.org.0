Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8044005F
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 18:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgnwN57JMz30Qv
	for <lists+openbmc@lfdr.de>; Sat, 30 Oct 2021 03:30:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=Bgb4iq2U;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=oHbnu1XD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=Bgb4iq2U; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=oHbnu1XD; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgnvt3n2lz2ybK
 for <openbmc@lists.ozlabs.org>; Sat, 30 Oct 2021 03:30:01 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B143F5C006B;
 Fri, 29 Oct 2021 12:29:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 29 Oct 2021 12:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:content-transfer-encoding
 :in-reply-to; s=fm3; bh=CvZ28hXfOY/6SlGw4miZjWJBElK07XIx5vw5vSkm
 p+Q=; b=Bgb4iq2UN4M5XaxNGP1JWaxsv9R9zbRaOTLJa7PAStJGNWRC9XAEg7ve
 5TIwqB4CManA1edwj9LRBOQIKE9Hy1AsEy+DW4UeKPgnfPaEoKee0ctwkIWPIuIN
 8izJ1NSKTEl6dDhxbdx8t9GqaoT82qfaC0NPWtOd9xjDAiboMiS6nShl9FNXCe8L
 HfGtkrF7gsSORekHcWqzIIr/sRl7lNnmWbICG0UjD+0kBD1+CRKiISxHDTkmkTjI
 laGYTIHHNSxDUx3c20exFWZU0hA02eYs+6BTYEAe/lL27mcPwyfmFgfiUDRac5YI
 ukhJNALozqQnzbqY3vXYdRnG0IJC5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=CvZ28hXfOY/6SlGw4miZjWJBElK07XIx5vw5vSkmp
 +Q=; b=oHbnu1XDFJtzKpCyGFYhDYKUHmbXJWLrNXteweREcvZe0TmCN/ijLqOzH
 5WllGtcmFqJmuXN8dhmuCY97FmjLkRcEaiftZxJPql1ob1ZufBauGPtY1Y0UiPwe
 +nZrcZU7UUhb+Tlg5u7OAnMcMkx0gWRWMprtWaL8N1q/1yq+66qAAan2BqiXh/A5
 WBBZ5NNXNfNOSA2hqNw+ieOJY9FO3JSDgJX8OpJS5WP/mUPX5uDXSWdB+2thT5ES
 EROoo88uY7K7GgEtmUrNUksOV4ARpURAnA0yRC6hcanx3IVfvGVtW+eUnLxdag6A
 WYviWeWTbe96Q8TRy18G4i0n/VxXQ==
X-ME-Sender: <xms:hCF8YZaOEKxyqaa2fAQeMzdOYAefKmRZX4oC_Zjj7ChyQTNp67AKxw>
 <xme:hCF8YQaWZfGHdFLLk_fL7aj0hsACRJ29dkEvfPI9CtFNYppEVNflbVK-Dr42cluee
 mk-J0l-zmTXPH9j4cY>
X-ME-Received: <xmr:hCF8Yb-c8oX-7Hv1_f-eC4zQwXN9ZEaJlOBdhMS7r-AlNLSo2f38EDhK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpedtkefgledvheeukedvkeefgfdvhfeigeekuefhleek
 vdejieetveeuhffftdegieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigs
 sehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:hCF8YXrDF2icJ3Jp6nesrYsE_9Wi_iBpMfV9-9RsmHR5iPQ3_Ig3uQ>
 <xmx:hCF8YUqbeeisI4gLW8M5M8e3G9vvnoQxEg3OTQH1IO8QIDJu-gIP8g>
 <xmx:hCF8YdQ2ahLwiXDViZnhLWMN03FkgxSb8hDW8cIokSNfr7D0dddabg>
 <xmx:hSF8YbTyiGRNjG7ZzamC98w1o3pZ3lU_DeCsZEHrGnAys-KXypqsVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 12:29:56 -0400 (EDT)
Date: Fri, 29 Oct 2021 12:29:54 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: OTP-5: "OpenBMC TOF Proposal" Process
Message-ID: <20211029162954.nkwfhzineypitwu5@cheese>
References: <YXDtrwHhUcxwtlij@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXDtrwHhUcxwtlij@heinlein>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 20, 2021 at 11:33:51PM -0500, Patrick Williams wrote:
>As I mentioned in https://lore.kernel.org/openbmc/YXDrQAf73igsbu7+@heinlein/,
>the TOF needs a process for making proposals.  We have a bit of a cycle though
>in that we need a proposal for the process but we don't have a process for
>proposals.  So, this email is a proposal for the process for making proposals
>with which I am attempting to follow the proposed proposal process.
>
>Before I get into the proposal itself, the proposal proposes how the community
>should interact with proposals.  I propose that we all follow said
>proposal(s):

Thank you for this ^ 🤣

>Any member of the OpenBMC community may give feedback by:
>
>1. Expressing a vote to the top post of the Github issue.
>2. Providing grammatical suggestions to the Gerrit commit.
>3. Responding on the mailing list with opinions on non-grammatical OTP content.

I think I would just like to see the entire conversation happen on the 
list.  What would be the difficult parts with that?

>4. (Least desirable) Providing off-line feedback to a TOF member(s).

If it is undesirable why do we have it?  Maybe we could list that 
rationale to make sure this option is only used for those special cases?

>Community members should refrain from:
>
>1. Voting on any comment in the Github issues beyond the top post.
>2. Cluttering the mailing list discussion with grammatical suggestions.

I would agree this would be a minor annoyance but is it worth splitting 
the review process across both Gerrit and the list?  My opinion?  no.

-brad
