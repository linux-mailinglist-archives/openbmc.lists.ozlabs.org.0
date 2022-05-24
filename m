Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4158A532915
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 13:33:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sXZ18szz3flw
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 21:33:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=dR4Gks7o;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=y0ARIJyO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=dR4Gks7o; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=y0ARIJyO; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6sWP3z41z3fjP
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 21:32:48 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6CF043200413;
 Tue, 24 May 2022 07:32:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 24 May 2022 07:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1653391961; x=
 1653478361; bh=cqdRLQ4WoXujx3gUWzJxaotauVGKDjf4Bk8/ltZHrGw=; b=d
 R4Gks7o58/RAhQr3uWOlH5XWpAMJOFWhjD3gMLL3EXD5owCtwx5HDkPIbRuWerm1
 UF6BTm+R2syoQloI8A6T9/nohI7owwdwNCW83LWu1A981QxWh9QPDdQQmhpcmepf
 qbEvZbDlim0UxRPwmRRVK3twv6RbhERZcO70oJNpnmwtGboN+W3MTbON8Nu36kf5
 838C1MRa2aM+bIrZ3IKvEMY0xxvtum8yAibBkSbG43TRrnlIYKQXUOHvICVsd2V9
 EvSzlP1uaJyJPbAgVFtCgtLjEQahJ5zp00ncTdIKz62uO8J3yk2GYCQCZkVUlaSj
 dt4/XGP+eakbhHpmlsXMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653391961; x=1653478361; bh=cqdRLQ4WoXujx3gUWzJxaotauVGK
 Djf4Bk8/ltZHrGw=; b=y0ARIJyOFdQNf9InYIumSDL39WfvXhlCCU2xSEyT4V+F
 es+7BUQ+I6iZOdSGzMNt8/VO4rxdoCHaclScQbAY8J7pVsmBItNkYS4NtEZ/URuo
 M9pN+qLEO5FJ5f0SXHHG+q4qROZVkaH7uOdGUTAWnl1m2RZ7UaNDeZcR+6rwfS3N
 YiPrFfpSZbCkGykknnOirbbCNwn+b6iOZo40Say+gHi+/ibC5t0dGPiH0OdO2ed/
 jczfUSjw/srJRrs8zkE6sSMcq3ywg+Lmz7W8BpTtepvyKnspLd3naeeU9VEHUGaC
 ttqgEd5e1j8XZLmlw40Y7LRyEFJWIz+FVFUtbWU/aw==
X-ME-Sender: <xms:WcKMYuX0TOZ78zysx1qjkXQkPCR97BXEUL7hCklLiylt5rCGsIfK0w>
 <xme:WcKMYqkf3NOuxvqOzG_P0iolG8rqupSwkoTUvFoKxgHKi7bEfJecp8HPX-tsB8nEA
 Vso4qiYBjcSINsB9Vg>
X-ME-Received: <xmr:WcKMYiapV65KUKUIlNVwsR2Dr1nptrojN9v7wiDcDmKa92e6JmdGgsdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeefgdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhephfefffevuddugfefvdejffeiheeujeelffdtteevkeeu
 gedvjeekjeeijeeuhfeknecuffhomhgrihhnpehophgvnhgsmhgtrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigs
 sehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:WcKMYlWVNiWOs37EvXRxf-pBxsIzzUaGYUc_M__QSzom4tls1otDkg>
 <xmx:WcKMYom3B3_PYSAuNhw11GcQpfx87eoTiGPMzT5NliHP9Qn3yyjwYg>
 <xmx:WcKMYqfXYIb1ReoL8oAGsFYSl55fw-DUn1P4kThboEsYJoszpvY1Dw>
 <xmx:WcKMYtzMlIUSmlgbPpm4jXqHsCQbBiCzy3-OdcA5InZKsrGHl7-qUg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 May 2022 07:32:41 -0400 (EDT)
Date: Tue, 24 May 2022 07:32:39 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: John Broadbent <jebr@google.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
Message-ID: <20220524113239.nxdi6wylnfl2o7d4@cheese>
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
 <CAEAQM=Lo9AcUrw1c2bT_pYNtG0LpT9w2=McMbx=RY=SP0V_4PA@mail.gmail.com>
 <CAH2-KxBqT-A91Jpj9ENTcajvgzO=oDRsTUPe=eLaOVBhVSjDqw@mail.gmail.com>
 <CAPw1Ef_dMf43e567LLAfMZp6khWWQAm=i63LHfOwWkyiSe-MFA@mail.gmail.com>
 <20220523234825.lcbgr2kljbf536cx@cheese>
 <CAPw1Ef8K3Nti_Gq03ACkUvgPZCuJyQHDhKq6TRLqJi_JmU69aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPw1Ef8K3Nti_Gq03ACkUvgPZCuJyQHDhKq6TRLqJi_JmU69aA@mail.gmail.com>
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

Hi John

On Mon, May 23, 2022 at 08:54:06PM -0700, John Broadbent wrote:
>> My point is, I am having trouble accepting that community pushback is
>> what causes downstream patches.
>
>Could you give me some insight on that? Why does that surprise you?

I thought I did - I listed several examples where the community has 
embraced and accepted Google-only features.

>
>I don't want to call out any concrete examples without talking to the
>change owner first.
>(I don't want to put them on 'blast')
>
>But we can glance at my work.
>https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53563/8
>https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53325
>
>I have been trying to get these two changes in for the last 19
>calendar days. If it gets heldup by
>https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/53676.
>I might have to patch to make my deadline.
>
>The ask in PDI will take real time to negotiate, maybe months (as the last
>attempt took 5 months, and still failed)
>My schedule says I had 3 weeks to make this change?

Ah.  These aren't examples of the community rejecting your patches 
because your features are unwanted.  These look like the normal 
consensus building process, which, you are absolutely right, that can 
take a long time (although five months seems a bit long), and be a 
generator of downstream patches.

Thanks,
Brad
