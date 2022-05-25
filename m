Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C9E5342F7
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 20:27:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7fgf6jsfz3bl3
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 04:27:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=AHbpPNsa;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Lskaw4ZF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=AHbpPNsa; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Lskaw4ZF; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7fgD6K07z2yph
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 04:27:20 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D2E91320093D
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 14:27:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 25 May 2022 14:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1653503238; x=1653589638; bh=hGsBja+KqR
 vRkY7yUUuSYQ0XpOmtEsvSYtsPMrFTdpg=; b=AHbpPNsa68FcwkWDcsVDeDGl0m
 PyuqF2ekoD9BHNXH/sSoWgom/XI8vMnt/nMniBNKqtBGqnh9S4EVoRmujrVNSpux
 2TvoRCaM+FdlSOhxjfdHJbhkAAhKr5IYFkI+FgrCXRjsAIyGBkIOfted+iLcBCs3
 C+7nBvHDlzEUwMdmYkeA85Ud2LXuMqHURDiR9AJhMjop+01B93YM4h/p1K+EUxOB
 iXRrqukZ8OxabzfNSB+2RSXHZxgnfDUs2lgPJFXfT/APTyhyD6RqngPAqgI6EJR9
 JXZImaRSeS3FeDwKUoZ42fvBsRemMcUBywJ5JQn6FkMUfC39633M160w1t4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653503238; x=
 1653589638; bh=hGsBja+KqRvRkY7yUUuSYQ0XpOmtEsvSYtsPMrFTdpg=; b=L
 skaw4ZFj47dm/O+f9CKJczFU8cGwqsA/fx756TZEQo+CzSxgKGtH6TTQNnePjlS3
 y9ch9S8NUJgzmtyo6Uqjl6kRE2yeq84QQprsHiQNMTNBYMTXGO2MsgWMyVNZxXT7
 aX7hXBS72jZA2E415V1VnveOd1mumCaduP9cUg8ohCj+R6jRTd1sO+OOlqPOfO5r
 snAkojti8iNg/zAy6RWKogEAb/uHsSl5X/lfmHPgTY7kPgVO16MilGa1LbFK2Lmm
 WfeBcr/9NVmj/9TE4oj8OMagf84tWeNN02OmbXrjAI9Z3rqyiwKtwQb9ynHhHVhe
 CU2KYdrXk7Cfufv42FwDQ==
X-ME-Sender: <xms:BnWOYuwBB05EzBP51YvNkGjx0m0prL2HfAMdeSOuHZYMt1DRnIqG6Q>
 <xme:BnWOYqT1OzrtHdioqxvz5lm33OrUdG-RvSvfrIHJNwQuQLv7DlENkSY7B5Ug-sm4D
 DYoMWz88UomjbD9210>
X-ME-Received: <xmr:BnWOYgVHyUxgmWRxyJ6Mm0DQKuZ9Q4uLts-_8qFbcj_3xjtZ2si9Qisg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeehgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
 dtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiii
 ihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpedukedvuddvffevje
 fhveejieehhfdvvdffgffglefgkefgjeetiedvhfevuedtvdenucffohhmrghinhepohhp
 vghnsghmtgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:BnWOYkgnAZvM6rgLgFAxQ0uWPQRYqL7YAfLsw9esVLf9-QlO0JmOIg>
 <xmx:BnWOYgAubOvqQLjpOZ7PvU0KfXutzVxv8JPIjVLpeSZm3LPMFfVfmA>
 <xmx:BnWOYlIySld6nFg1EdJcapcMtx_DLn7s_Og4tkN_7cy10drlvBQSew>
 <xmx:BnWOYv-4w4vs8DTjHey3ZW8CqprK6zhxa_1e-a3EIQEt-p0UKaw4bg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 14:27:17 -0400 (EDT)
Date: Wed, 25 May 2022 14:27:16 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: coding style changes
Message-ID: <20220525182716.vko5itzuiw6datan@cheese>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

Hi all

I recently proposed a cpp coding style change.  I just wanted to signal 
boost a little - if you have concerns about the impact please drop a 
comment in the review here:

https://gerrit.openbmc.org/c/openbmc/docs/+/53744

If not, don't forget to update your clang-format to have the latest 
version.

Thanks!
Brad
