Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C5D3DE4ED
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 06:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gf1ZN2xx4z30JT
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 14:08:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=gByiDSSS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YyvyO9HZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=gByiDSSS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=YyvyO9HZ; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gf1Z56QnHz2yMF
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 14:08:13 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id BB6693200916;
 Tue,  3 Aug 2021 00:08:11 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 03 Aug 2021 00:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ARLvGjcqDBY4rVetsxm8LnceoUC4XY1
 vx8e/eYqyVn4=; b=gByiDSSS+O3S7KgEbZuyclpU4kA0cUdwoIPLt+3SzZAkEj6
 OdMNbZDc804CzkncwplYnr5Nxf9zrG8rIemBheHpr4AFuL+iNkVmz+6uOTx+qmkV
 z35VK2Iic+1Ek0XcXNo2dL4h/F0amJ2M/NE8LSWQBHmW3VcmhH+COCbaa3aj/g2c
 mIpqbWO18oTc/rxOxW3AuAw3T5WVBFx/Pmm6mbjAJS+TJfooLs97t6BAZPn8pden
 0w1UBdg/DZ8nqyEoQ9tGftbGKj+flJfwQG3iwYQk7mPRBecaa6gm7bz+kGYnSFNS
 TuRWjl7CA7Vv83ls2LOFO8nkkdhncQT81ozFBqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ARLvGj
 cqDBY4rVetsxm8LnceoUC4XY1vx8e/eYqyVn4=; b=YyvyO9HZ1PvzYHcY6Rpk9w
 FWWQX84OKr0b294tyWwDOgipnQCo93BRMeWKR2IOdLAFo44LbZp/f1X1Q/nOBNrA
 nq5dMq30Qo8yAGw8g4uWHtKu7l72pNLDCw7DtzHjN0CK9j729FxQJoAjLgmngl9b
 BGlEArPzkG+UZMSS1+HxJShMnaMStRMNvM9SKNsoynVNSC6P5Li4LQe3GanBlxoP
 6f50zAV//L4TEvgZ8Sxes+6fbkSuUnKZwjxe4ch/96voFPbVsuHF9bV9zu7kLMDu
 ZY58E6hvO1fq/9oM9xUwl2iuinC2iTDgtgROH1sPKjUgUmVbKxPCCuxqFPibGcwA
 ==
X-ME-Sender: <xms:K8EIYeXJFPKpdpOn_bkF1lO0xUsBRCzcbLGSYJgVMDBobSwliA3CYw>
 <xme:K8EIYanQT70MW7Jjm__wgSmkvdLLiXpcNkEEaBZq1MxQgJW5YkTWAm_tTa9VPcMzr
 0GVABSXCEmGjZMO0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieefgdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:K8EIYSYGoDFFeKr_ltFAGCPVbZsz1NrjqaJON-1a3FxNxBrdkORSGw>
 <xmx:K8EIYVUulMrIjR2dGIWkWWJtbmb2Ob9KmBae-FjCkWvPxQ_rVDLVvQ>
 <xmx:K8EIYYncVwuOz55uc_8pHuPZdVkzIA66DFwHYm3067fL5giaNi-HIg>
 <xmx:K8EIYaQPFImP2LpJ9bvo0dAypwoES9rwu-9bwrxj6nZhxQ8gpjPKog>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 345C2AC0DD0; Tue,  3 Aug 2021 00:08:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-548-g3a0b1fef7b-fm-20210802.001-g3a0b1fef
Mime-Version: 1.0
Message-Id: <6b61e17a-56f6-41cd-b81f-78637c466999@www.fastmail.com>
In-Reply-To: <YQiNg9cxRgNe4sFV@heinlein>
References: <YQBrbuQFz4JihBAE@heinlein>
 <41a334dd-56c4-44d0-b8f4-7ecdf5bfa5de@www.fastmail.com>
 <YQD4TWus75QQjH3U@heinlein>
 <e1b41c2e-bcad-4282-a3b9-8f5344cab056@www.fastmail.com>
 <YQIYE4yH7IcGIrjd@heinlein> <YQiNg9cxRgNe4sFV@heinlein>
Date: Tue, 03 Aug 2021 13:37:50 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: `phosphor-logging` APIs (RFC)
Content-Type: text/plain
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



On Tue, 3 Aug 2021, at 09:57, Patrick Williams wrote:
> On Wed, Jul 28, 2021 at 09:53:07PM -0500, Patrick Williams wrote:
> > 
> >   error("Hit {ERROR} during {STAGE}.", "ERROR", "bad foobar", "STAGE",
> >         "baz-grae", "EXTRA", 123);
> > 
> 
> I have implemented this formatting handling, since more people seemed to want
> it, and also added compile-time confirmation that the keys match
> systemd-journald requirements.  Patch sequence is all updated to resolve any
> outstanding review comments.
> 

Thanks! The updated documentation gets a +1 from me.

Andrew
