Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFEE2EACF2
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 15:07:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9DpC2ZfKzDqjv
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 01:07:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=C8i6D3Np; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=JblJYale; 
 dkim-atps=neutral
X-Greylist: delayed 396 seconds by postgrey-1.36 at bilbo;
 Wed, 06 Jan 2021 01:01:00 AEDT
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9Dg02MXpzDqfq
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 01:00:59 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id DD855880;
 Tue,  5 Jan 2021 08:54:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 05 Jan 2021 08:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=TOsXlPuml4E6KenI7Hvm4drl5N
 NPUnbNQ2g+KlEdNJA=; b=C8i6D3NpEhaKdP8kGOwukJxpenytK60DUnRnjIcPbb
 4/we877aT+Z5QFAwNDFNW3LMPm3sH9hGu4QVZMnpzpsksKRc2x63k6oj39N0KR1T
 0vg8TLK+GOPM7nAz37DVlq48QvOW1X7IbcEQzgE3OUpMMnVs4nChdQR+6yt7ehF8
 WWwexPt5RqRhJj2HdVkCLTkZjkQWlvbsWUqBLaEKYpxkKkRbbNyousWar8RtNa38
 +ym/RTHfxeu1GaCX3jNhgeUfvs31k7VsaeSSZRdT+nap/osL8FmNer0oWSxINdAB
 eGyOr9+EbPHTNNNf7H8mPLwqzgz5Ib4R30fSPM79sicg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=TOsXlPuml4E6KenI7Hvm4drl5NNPUnbNQ2g+KlEdN
 JA=; b=JblJYalexDVBLI3Hz+BX0vR/B3KayYZF1Lj2RFUHz2QNRdFcIrqPZmCk5
 ICDmHt035Z9ZApRm7hj4J+03pr54IAEe2WhWVXGjzV7RZl/Z2nD0VR2Y68aODbup
 XLxousl3fTNXO1KxxiiVuecWJbaalWIshg7xRggj97fr4K2ZUzlwvAHZn1ibAva8
 rbuNjEYNPR8rez38HSG3UJyJd/6ypQQUD8lnl87pVDSWK5nh4CH+DAcvQd/U9uN/
 DIQbANMOFVgiCNPIqzwalluWpjRDQeByA65WGWuc+yl+Vae3Wf072i8GTRShEp63
 sRjmJLLaDbTz/M4zsCffRoN7gHAOw==
X-ME-Sender: <xms:hm_0X6y20YPyMyF4p-DfhtII4P4oDl7OdDnhTT9a1chOTpKZQxpczQ>
 <xme:hm_0X-dfa9t5Ks0liqwNThEpevmOnyA3hFexWeyLalC1QIb7g-pq8FNXWkxbO9gmo
 M331MYIq22Q2GsC2rs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefjedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpedujeefteekgeeigfegtedtgfejleeluedthefhtefh
 tedufeekueeiieeffefgteenucfkphepudejfedrudeijedrfedurdduleejnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigs
 sehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:hm_0X34hUClneqYVAp9oSUNufuzztqyKdI2VJS9d1oz2Q8eFxwEPtw>
 <xmx:hm_0X7L81RshVowWChyx7a-LmOU3Os8nBPtd87LjtpCcj8lB7If-Rg>
 <xmx:hm_0X3zHimIUIJLaMYctD7i-cNgFmCcX-LlPk-FKDq1YZEcKW-lPJw>
 <xmx:hm_0X2lRSo9Uukq2Lg2MEeo8iiQiU83agsVCsnGIp6S1xF5gRH8Qj--7--A>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 14884240057;
 Tue,  5 Jan 2021 08:54:10 -0500 (EST)
Message-ID: <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
Subject: Re: create meta-ampere folder in openbmc repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Thang Q. Nguyen" <thang@os.amperecomputing.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Tue, 05 Jan 2021 07:54:05 -0600
In-Reply-To: <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Lancelot.Kao@fii-usa.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2021-01-05 at 08:48 +0700, Thang Q. Nguyen wrote:
> Hi Brad,
> 
> Just a reminder. Have you got any chance to check our meta-ampere?

Hello Thang

Apologies for the lack of responsiveness.  This is definitely on my todo
list, along with the request from Fii.

thx - brad

