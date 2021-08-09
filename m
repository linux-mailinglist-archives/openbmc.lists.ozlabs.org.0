Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F903E5006
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 01:35:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkCBP38vyz2yxP
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 09:35:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=H7Rf7Lcp;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nD9PDJRE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=H7Rf7Lcp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=nD9PDJRE; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkC9t4SGJz2xKM
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 09:35:13 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id E32993200904;
 Mon,  9 Aug 2021 19:35:09 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 09 Aug 2021 19:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=BSZqd
 qlhjnOM9lLnK7KLuZLrbZ0cNJ4XgQYoiAtXVUo=; b=H7Rf7LcpQJqdli3K+G5at
 k5BmlFNy1usVKb5X/gsYie5dLlXuyTldagLw3Fnw3cGyxnAXA5G9kHC5NgMfOTsP
 WuLl/H7929i2IHMETd5VozODNuMQclQlB6gyVLNoCgGfM/dRvBoPgKUTAvZzmT2y
 fD5Qr/pN4ZfKKHZmZT1uhcGQJydSOFoO38R08gswLvt4lGD7ZLsOQv5hdrNpAvu2
 voNJgnAnO7ALWWJpfV5AM++TQsFx8C5S1rV6UKY8UVGL3Gr9ttRhBri9Im7JC46D
 KvRZSZcpsokYEd9x6A41UYyCBMnizGfJsRYPyNw6nOUPnoieebZs1O8w8WB5dpOF
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=BSZqdqlhjnOM9lLnK7KLuZLrbZ0cNJ4XgQYoiAtXV
 Uo=; b=nD9PDJRETQ+mc7dD/wX39/U+v7KavNzukGTYP+MEj0I32Sg91Pz1N0wVS
 Io2i+I3sDBNJXGXJBn+Doenf/8/HgxN2DxYCrJ6an6ang5VTuPLPuJMLyF1Aw48t
 /EkQ7oZOFwAPjEghpSuWGJcJeBvbqnlFNSYqGYMCq9adDj8mgxhDrxHYRMR6dQNd
 fBcb7WubrhkLTz3ImuI+YI0RKuXtCraqrmXZfH0uEOs/PbTCGCTr6OrN0eVzjwp3
 qhN7yEqkhqoNjaeCnipPMZctST48ltr1ljj4U/NGhzlAER+7vOm8jJNRIygOJh2k
 xzGwf7uu+j9p2PJmxg9gp73ypbxRg==
X-ME-Sender: <xms:rLsRYd-X2-MZ-s-XOzxP9vjC3yVkTvW0A85IdOtWI8ImbJEBsM8SCg>
 <xme:rLsRYRsgfPo3oNTGZOqEklDfgIKBpt_dByJyzZJSl_2n6ZZFnGJc-LNNqboK6NNFI
 qnwQJQ_Z3OJCFM5jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeekgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephffgkefhudeghfejudfhtdfguedtfeehjeevteffgeduudetjeeijefh
 heffgfefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:rLsRYbBF9iUA9MrEHM1jogWnwxw3Qg9JNiPWTbHiSAKCXPZgmMjJYQ>
 <xmx:rLsRYRc4m4_K-y-1qtXoT3of6WTPpZ9igBcs--j5iKXROfZFDT_uGw>
 <xmx:rLsRYSNQ83wNrSi4v9-vcHWtFTDrmsoVetnH0i0nvXGhKg83M6g5RA>
 <xmx:rbsRYVYbnDoJnKSl_nru1MGMLIFIqbNIG5UiYOJTRKgB1f8ajfw6tQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8077DAC0DD0; Mon,  9 Aug 2021 19:35:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-552-g2afffd2709-fm-20210805.001-g2afffd27
Mime-Version: 1.0
Message-Id: <794d30f1-42b8-49dd-a192-e7bdc6dc1dd0@www.fastmail.com>
In-Reply-To: <a08ced6c-9213-c05d-a5af-105ffa5f3b26@linux.ibm.com>
References: <a08ced6c-9213-c05d-a5af-105ffa5f3b26@linux.ibm.com>
Date: Tue, 10 Aug 2021 09:04:43 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Add SSH session idle timeouts
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hi Joseph,

On Tue, 10 Aug 2021, at 00:32, Joseph Reynolds wrote:

> [NIST SP800-63B][] requires a timeout of 30 minutes for "assurance=20
> level=20
> 2" (high confidence that the authentication is still valid), or 15=20
> minutes for "assurance level 2" (very high confidence).

You've listed "assurance level 2" here twice; I assume the level increas=
es.

>=20
> Idle session timeouts can technically be implemented one one of three=20=

> places:
> 1. In the communication layer, for example, the SSH client session can=
=20
> timeout.
> 2. In the application.=C2=A0 For example, the Bash shell TMOUT variabl=
e.
> 3. In a layer between the interface and the application.=C2=A0 For exa=
mple,=20
> the "screen" application can provide a timeout function.
>=20
> For example, suppose you want your host console sessions (ssh -p 2200)=
=20
> to time out and close the session.=C2=A0 OpenSSH does not offer an ses=
sion=20
> idle timeout, and [obmc-console][] does not offer a timeout, so how ca=
n=20
> we provide this function?=C2=A0 One idea is to have the SSH server for=
 port=20
> 2200 connect to an application like "screen", set its TMOUT variable,=20=

> and connect that to the console socket.=C2=A0 Or can we add timeout su=
pport=20
> directly to obmc-console?
> [obmc console]: https://github.com/openbmc/obmc-console

Right, let's not be allergic to touching the code for these projects.

obmc-console is an OpenBMC application, and both OpenSSH and dropbear=20=

are open-source, so if we need to make changes in any then we have a=20
path forward.

Whether that's appropriate is a separate question, but let's not create=20=

a maze unnecessarily.

Andrew
