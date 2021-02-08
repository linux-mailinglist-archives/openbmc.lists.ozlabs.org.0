Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AE0313578
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 15:46:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ83r18SjzDrdp
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 01:46:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=EH2a9396; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=T4pA+XhP; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ8213KfqzDrTg
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 01:44:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CAB855C00CA;
 Mon,  8 Feb 2021 09:44:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 09:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:content-transfer-encoding
 :in-reply-to; s=fm1; bh=FBBzCRxOC43QUl2Wxe7slWO+9ncMjqFDtn1BO2UW
 1iQ=; b=EH2a9396Goj0ApctRrRPvwHVrmt+4+MmKDmiAFR+cTgLMuTSFaXWH6XQ
 69WdPfepKkopHkPHgGdIhsRoKdRlOxrntH6/m2HKK45NibYHrYfZ4cgieiRgweMK
 usx7w87zVubdUUSQQ4S2KalqrbZL1g34imE1O4Xtv9auezoL8gvt6tme2YWApusd
 in2O1oKQdZmhnnMkmAmtyj1XW+p/l1dnxjclThKw1vyDEpjUsZpTRjIXZZkxHEmm
 ImHmfgRXbSpXlimMFrwsSkpr9nDDngfQOVTBh3hzjd4N4fKan9Tz+XfLE9DcdGpe
 NX/DkKfIbx2INg2fuS1XVr4Dt+iLsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=FBBzCRxOC43QUl2Wxe7slWO+9ncMjqFDtn1BO2UW1
 iQ=; b=T4pA+XhPF0z7oxluN92btkhtKDvSOfluw2vx/njyn4vPMDKLEY10ixzEL
 +Myft0HxpFQpQLAGoqswTHNbc9rt+NL9rPLnOLFcTia/dL8SN8weFXfXrnnhriIK
 1J+3EfOp9oII82I4dtRZGxn8RVxeB0eMt45GRbPEe/SLN02xSkY2jP3fsQog09vl
 GAJkq3wj9EskE0Be5mrtqNz7Dt98iQRBREmYPBmEK/QBf7pZiQq6l8PsSr8sSBHu
 gjGzmV5bdbBBNOYFAZxEdmk7EBMkdsm5FHRmwfZP/MvggcxCG9DFuium7jhvCnNR
 OLoBuhJ6A0rou8HjzapqSgL+ThcnA==
X-ME-Sender: <xms:YE4hYEru-2F65uX-BTie4moDnccY6Rw6X4j5b-FBkDzQ0EwZGcGcNg>
 <xme:YE4hYKlyCFHdIanQ30gmz9rgxGofquyVF3nFPst3-lI3hvLFWP0-nFCaEAGYqSp3N
 gmX6f7_lQN_ozOjaqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtugfgjgesthekre
 dttddtudenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhu
 iiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpedvffevteeuje
 ehhedvgffgheeljefhffefieejffeggfdukefhvedtgeejvdegheenucfkphepudejfedr
 udeijedrfedurdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:YE4hYGGdjfrjaNl2-W9i0bK4IQ0xRFDpKm5h2X-1k7qhT7jq14hxKw>
 <xmx:YE4hYDoVyN6WUSkg1DlIF_E6my-js4iWzdC3WhSRGwx4-_QRS77vvw>
 <xmx:YE4hYC4vuorIt_FLsgTuSJ-rj1wUJu1fKSTu8P7Jc7Q66FH9VRQgeg>
 <xmx:YE4hYJzcXxzDMTxsy1BrVXi0VuXQMRMl5rgd3qXwKrjNbni6N7sw0g>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 02C68240062;
 Mon,  8 Feb 2021 09:44:47 -0500 (EST)
Date: Mon, 8 Feb 2021 09:44:46 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: snowyang <SnowYang@linux.alibaba.com>
Subject: Re: Change in ...meta-alibaba[master]: thor: initial machine creation
Message-ID: <20210208144446.l454phquipyvi7ur@thinkpad.fuzziesquirrel.com>
References: <4ufnKrB2SUu3u1SbJu709Q@ismtpd0004p1sjc2.sendgrid.net>
 <94c8af34-dcae-e33d-a0f0-a5540ef518fd@linux.alibaba.com>
 <YAneI7zHQx217lmu@heinlein>
 <5841da60f00cade13d87d5b8795f8a25021c2e44.camel@fuzziesquirrel.com>
 <f8678061-4662-4445-a4d0-016040f00979@linux.alibaba.com>
 <0008fa42-2a5c-b092-8da6-7eaa91e775f7@linux.alibaba.com>
 <0FC93EA6-AE09-46A6-9BF2-36471B85755B@fuzziesquirrel.com>
 <fe3fef11-56c7-85a4-b3fc-35ab29e99f60@linux.alibaba.com>
 <20210202135122.kbvdfnq6ed2onuhi@thinkpad.fuzziesquirrel.com>
 <e7991363-133b-0ae5-9bb1-fd48719738d9@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7991363-133b-0ae5-9bb1-fd48719738d9@linux.alibaba.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Feb 06, 2021 at 09:16:29PM +0800, snowyang wrote:
>
>Hi Brad,
>
>    I have push the code to openbmc/openbmc, but it built faild. 
>while  i read the log ,it show me that the building project is 
>Romulus,i think it 's wrong, and how to change the configrature to 
>build the machine of thor which created by alibab?

This is an intermittant bug in the os-release recipe that we haven't 
been able to track down.  You can ignore this failure.  I'll remove the 
verified -1.

-brad
