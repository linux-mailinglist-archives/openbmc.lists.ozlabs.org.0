Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B3505237
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 14:43:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khmn80SW4z3bY5
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 22:43:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=FHKpHSJn;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Zn3LEXlF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=FHKpHSJn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Zn3LEXlF; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khmmm3Kn2z2yXf
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 22:42:48 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F9D85C00F0;
 Mon, 18 Apr 2022 08:42:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 18 Apr 2022 08:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1650285766; x=
 1650372166; bh=StnDeGoLeFR7QYEZ0FMBtDPWKnK2YMvioXJLnshzfSk=; b=F
 HKpHSJnBSAqCYeFCTSPvHmExivqIW/UW0r57c9kCthX8j4PHSya/PZkLKuhhavDL
 ErLKqHIuXq7AefEeUzTvd61Y8CR2lPV36U/11GCZIvEXXJ8WBZL/A1REPjnHb8h4
 HQeqZqJdpddoAuYlZtbk3HcElKYkrYzx/Os8irLT5lu/J/1UJsZa/kT7JUf7fdx3
 cTRwYFjHKbnol9ggd9ht6SGIXAqNODr3qluFBpQpEhDMGizjY1WyAjqKaXfWYPLS
 Z19hsJlBizpsqCQ9RNVsVLY+Ch6FmAPYyCYFF+hzqkoGdbA/6NPh6NTMS4YgYWwR
 NTxQ/S8s/jqj2Dt2+WH9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650285766; x=
 1650372166; bh=StnDeGoLeFR7QYEZ0FMBtDPWKnK2YMvioXJLnshzfSk=; b=Z
 n3LEXlFi4JVOCAy2msgEh14SnK1YD+lI98CODka2pbIA96ykz5rlogwMdSUg6XoR
 6rjIhgi+9rAqZ5KowAH9L348vKNLfY90j9B/jHcllRN04hIp8qBC+5Vn+HGEO8W/
 NcQuTaqxOy7pwwdM+Wnadcd104yaDRrjMiPyzvxLa1zIAAWi4h9qtxhBgUxSWl7l
 Mob+iiPhuGIo6HIDIaj8npJQ/d/SI0v19mpfrVDyDNSMvTb9wpMxQRuspQ2KFSR/
 GE6/iOtZoWIsjM9XAE/m2rGfHRun307aOvmSf6czS7HyGmxlUnN0TMOdvHMmZFSQ
 rGkKXlDtuBbdrRVc+sZDw==
X-ME-Sender: <xms:xlxdYskYoUKWT3E3B4Ei2pZMNVfaAC1AAj_IzhFMYC0EW31djqGz8w>
 <xme:xlxdYr0_HorwE9orVWqmcaYa9rhwVB36pmmeQPN9L2-Wu9uTi40DseFm2katfe80N
 Kp6P0dicv266GiQOV0>
X-ME-Received: <xmr:xlxdYqpJwZvPAsKFgqrMn6d2yek44Crrdo6yOIc2IVsA0i3xse3P3Mm7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtuddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhu
 iiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeeffffhfeehge
 dutddvtdeuiefhudeifeekfeeifeekfedufeeuvedulefgkefffeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuii
 iiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:xlxdYomFFpOJR8ny-uscyV6He8dmg_KQo13ZBtbA6FpunqRvM5R7IA>
 <xmx:xlxdYq21HwF2QeWmNwLwRGLARrJq9_XTmAsKIpyRXtoX9UEblCacgA>
 <xmx:xlxdYvtkHPofJq7kw-2OwZ-yAMm158vG5KBdzJ4QltjPTZNLLTmdug>
 <xmx:xlxdYoDruEiXYxbYpVkyJSXObNZ8MOt_Uxy4arJ0bfnDVlHSeVeawg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Apr 2022 08:42:46 -0400 (EDT)
Date: Mon, 18 Apr 2022 08:42:44 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Puzikov.Aleksandr@depo.ru
Subject: Re: FW: =?utf-8?B?0J7QsdC90L7QstC70LXQvdC40LU=?= CCLA OpenBMC
Message-ID: <20220418124244.kkjdo2n636budtbi@cheese>
References: <b4adf1e1-f8b6-46b5-937c-b36ebb5efd28@MCLUST1.depo.local>
 <44a80cc97896382e4359ec9a9a9b065843cb584e.camel@depo.ru>
 <79100b6747764bc6b4ba6fff8ec7cdcf@depo.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <79100b6747764bc6b4ba6fff8ec7cdcf@depo.ru>
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
Cc: Nazarov.Vladimir@depo.ru, openbmc@lists.ozlabs.org, Shahov.Dmitry@depo.ru
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 14, 2022 at 12:21:20PM +0000, Puzikov.Aleksandr@depo.ru wrote:
>Hi, we are updating the app A, please, check and confirm.

Hi Aleksandr, CCLA update accepted.

Thanks,
Brad
