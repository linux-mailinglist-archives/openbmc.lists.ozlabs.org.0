Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5521AB5FD
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 04:41:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492k503sXHzDrDF
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 12:41:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=eWqFmssY; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=f4RUCu6k; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492k2t3kPkzDr8H
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 12:39:49 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A9D435C00B5;
 Wed, 15 Apr 2020 22:39:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 15 Apr 2020 22:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=kJh7TIXz6Hk6enNrzMWb4K/nAAy3DaN
 CJC2uGSgO4Iw=; b=eWqFmssYyal3zEWycx3bdXVkNi4fJn8ToEqP/qyUTXI7YeU
 3zdKWJgKOqYvJp9CsVgRdkIUgYzULnydDV3rENWahDrf3mas60+dIWMJXaudHkPB
 mV/FIsoXgxPeNwCW18TS/Egqpq3Yy3XolmCbpop66sm0D6LzWAU6f6vRj/gerOSL
 /vzYt29rTFyMNrvQ89y7k83lvnAzkDSDA9yy1mJbeQzHu8nmHlZEGxh+PPK2CVOd
 Yg2EvUKnZYxOHi8YmpWpJB7BvBOH1VyKWT82P7ojxefKE6Hc0v+p4FKbbD5pV/tn
 FpiKAaAgydMOM05WhD4HiFwBQyFgsQum7ZhBSeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kJh7TI
 Xz6Hk6enNrzMWb4K/nAAy3DaNCJC2uGSgO4Iw=; b=f4RUCu6kyPRqw67qjDhf3v
 RDxj4FapEObiYNOyoBJUZoqBRNcgl6Kkf6tnYVYP2Sn3hGoxwXENNN08DBvxWZkc
 v01FxBmR431f6jWkJBBTpBuwtBvD3x77smnNgVw1BwdNc1rm44yv4Kav+JIb7om1
 jcU8TwCheUDkrAD4p6l6tbRwGGN1IfkJW875KaGGCarzRV8214PgLt3XcUlBGoPp
 89bs9RRPtFdTWJaUKXEVCssEsn59v43ltfFw6tg8sc8pSXpmjWYUXGwAEO2zIqsr
 JI67Ac1vzqbNfk2t7up2VqaShdsMQXHOrKvmKLtTUiuWzHZM13P4jD7Wrfy90A1g
 ==
X-ME-Sender: <xms:csWXXmq6ppUPTp44Gu_KqHQAp2Fe-zZVhH8ur4AM2C0kLTxOeDxFew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeggdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:csWXXoF3tdla4NPwm27gM5SfkoBoSI_EGLwXbH7lyFg__KLGPFKhDA>
 <xmx:csWXXn_hKBCHhb23voFcey5XPMxkR2WOiXYo1fg8OW3-JhfP9GQYyg>
 <xmx:csWXXpQKUhO5Eb-FVZH2uVpL3b_n8kI2r5uZ_HA-K1k8QOlyhD_Tzw>
 <xmx:csWXXnPW4cm9xSHEZReNbI-0xozHalcNFFuZKwAKo_QqlFaotj4VTw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DBF62E00B9; Wed, 15 Apr 2020 22:39:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1131-g3221b37-fmstable-20200415v1
Mime-Version: 1.0
Message-Id: <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
In-Reply-To: <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
Date: Thu, 16 Apr 2020 12:10:13 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Neeraj Ladkani" <neladk@microsoft.com>,
 "Vijay Khemka" <vijaykhemka@fb.com>,
 "James Feist" <james.feist@linux.intel.com>
Subject: Re: nvme sensors
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 16 Apr 2020, at 06:29, Neeraj Ladkani wrote:
> Thanks Vijay.  
> 
> Can anyone comment on MCTP feature completeness on OpenBMC?

What features are you looking for? Keen to see discussion about people's
MCTP needs.

Anyway, OpenBMC's MCTP support is in progress but fairly immature.
Part of the plan is to move MCTP support into the kernel. If you're making
use of MCTP then I'd like to hear your use-cases so I can make sure the
kernel interface meets everyone's requirements.

>  I reviewed 
>  libMCTP and some of bindings but its not clear who is using that?  

IBM is using libmctp in both BMC and host firmware, and Intel is working
on it for use in their BMCs (but not host firmware).

Andrew
