Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54178397B3B
	for <lists+openbmc@lfdr.de>; Tue,  1 Jun 2021 22:26:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvkG74jSfz2yss
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 06:26:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=ZDx9sTFI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fnwVhT0c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=ZDx9sTFI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fnwVhT0c; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvkFp41n2z2yR8
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 06:26:21 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id ED9F2EB3;
 Tue,  1 Jun 2021 16:26:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 01 Jun 2021 16:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=z3p
 9wZdY6J4Ledut1DFZvzOkjVElsNAh85BCgCImFtY=; b=ZDx9sTFI/am/XKgZg1l
 hpGG0qLpV/5XV/+aQq0v/LigudQOjOIgpoxAp2Yu3JioiPA9E3sUL3KfEIYGAzAa
 IERiMseeVh9UgdPeztvlVKTeCHJ14mu03k4/zQ+f+ZBtxhWYGozRhndmcQ9MjICx
 IOHqBu/I6C7iLAarXODU7bozPPsoiYKk1M5yJiI6Cn27NC3+/zxvC75FzDTkkAaK
 B8K3gcXPfUVZMkT0eRLbN6CTWph0o3x1qCUd8mIR/4I3djlNywEb/8LpLUYzMV0G
 aQNeX1tm5vdpdFKCSrOFB5YeG94Y2m77eDX0ksZ3+B8XdDxyA5wrYEZZ+bfsIrMN
 DBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=z3p9wZ
 dY6J4Ledut1DFZvzOkjVElsNAh85BCgCImFtY=; b=fnwVhT0cOswqvIku+glU8l
 3y0ru94ukf55WVs1JOe4r7Nydwou6zEuqC/Ru3QZfeBeg+T9iJqjE7QyifzVd+hZ
 C8sStIGg4VPPmj5GPNCKJRmB+TpllTmFR7aYNF/TRynfd/oy/mOqZs3X2NDaHySA
 dF575EJ2Jihj+5uyzCD8LfgFTHnDYf9amb1em86eF6yMVRnBWdCv0FI6aTZ2Y/zL
 bgMfa5Ifb0p4xqiUn0zdX1235SdSv1mFszrKTBoifPtdxn7Q5/NGpDUQS3xvuvsb
 FUy6048qM1/kPpLAO4lu5Zhf2pFaE/ux/i89kNbvyG5ahw4dVVRVn0Jd5s0mu2dA
 ==
X-ME-Sender: <xms:6Je2YG8-Vvc8mggU6EhPLaWTdlz1qngh8dWKdx-1vUUG7naMx97MQg>
 <xme:6Je2YGtrGuQ_cBErA9ozbDdIoQzsyIPitohJ1mdqwZQagyebxHguTtrwRUD2ij_tj
 cqJjYmn6uZ2ImAUXjY>
X-ME-Received: <xmr:6Je2YMA2xqNbTRwfiY5xcdwdFKPV6qLNEAZ6I_OaJhrZzWkeOqzdkDI1aEhu2lgFQOydz5_zLnnBTJogDHjp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelhedgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeegheejgfeutdffteegfeefheeileejtdefgffhgeeu
 hfduveejleefkeejgeeiueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigs
 sehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:6Je2YOc7eQ6lfaL4sRCI0im1s_tLeHsm7ngxR-Oy1aznrzubl8Egew>
 <xmx:6Je2YLPPp9yKqdxcTrhezSxmb36rDoGRtbWeVLcbFmdQ1xGHSL21EA>
 <xmx:6Je2YInd-OtFOwZhRWy-epQW_HvvFAf5oo28IZH_gJD_CZoEOEiQUA>
 <xmx:6Je2YNVrm4rvYELgImhIVSXAF2JdZBNKj3ifRRYvSJsDJUYrnS-RsA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 16:26:15 -0400 (EDT)
Date: Tue, 1 Jun 2021 16:26:13 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Request for debug-trigger repository
Message-ID: <20210601202613.7o3kplhw2z7mrdvw@thinkpad.fuzziesquirrel.com>
References: <fb9071bf-f2ad-417b-b9a6-d0baeed67e06@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fb9071bf-f2ad-417b-b9a6-d0baeed67e06@www.fastmail.com>
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

On Tue, May 25, 2021 at 09:03:31AM +0930, Andrew Jeffery wrote:
>Hi Brad,
>
>A recently merged design document[1] outlines the need for a daemon to
>translate in-band indications from the host that the BMC is
>unresponsive into recovery actions on the BMC.
>
>[1] https://github.com/openbmc/docs/blob/da726aad0d204a8c8a04d6230ea61aa15e357653/designs/bmc-service-failure-debug-and-recovery.md
>
>A tentative implementation of the daemon lives at:
>
>https://github.com/amboar/debug-trigger/
>
>With the design document accepted, this could live under the openbmc
>org. Can you make a repo for it?

done!

-brad
