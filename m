Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7255330D12A
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 03:00:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVlJ82pyDzDrYZ
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 13:00:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=Bd2Hu3EC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=W5h5jNGg; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVR7774JDzDq8t
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 00:51:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2BAAB456;
 Tue,  2 Feb 2021 08:51:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Feb 2021 08:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:content-transfer-encoding
 :in-reply-to; s=fm1; bh=irHnFJHqYxTS/8ThJEVfN0t2V0Jd3FHBvqPW9kVN
 YeU=; b=Bd2Hu3EC5ACm/9tC2u8Su4mp2gmjbinG96bdnNt0mfKP6k3Avj89wZ6I
 6/WaRoGktT1rE0hhxwby9uAs8X/OdqDaIik9tuF795qOcRjEZ2vY0jO6+zLtDzV/
 +ZhWwztdyNZ3X32JNaL6EXYo7K6bBQvKcRYLdBfQZv7PrfmW4th4yQ3h7Ysj4HzP
 9u04nIwjJgZcTO4cFB+j3XG4K2kJfSEDwcBs8z1Ruurin+5tPt4y/EbWD17WR5Iq
 oSfxc+4iJ7xP3YeqbJH8OTvEtnAB8BhhytI0ZiItYjEXUByr/1BfQsw7QJoFYdsb
 fMhvOCk6dMKv50V49Wb28o2fB5bU1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=irHnFJHqYxTS/8ThJEVfN0t2V0Jd3FHBvqPW9kVNY
 eU=; b=W5h5jNGge63s2Ifnow7LaqW/OaDFLjcI4WTkqwFlaFcyKdLryPf277NAX
 QBjvKUsb/3oHSzu6Jq0VjHX1hgt7JVR5DCPxEItzZFNC3ZfUPz4PlWTP+UueJouc
 xiwSMD0GE9f/Jl+o1IyZotdJd1c4OKt2J6BexXE6/GER5FhyLK6zWmfY1h9rIYuN
 sp5dfSXcH7fqi/PyfUgLNwl2dGRls9M+kFumza3kz5KY+LaOWn5p/zsOa66MPxYb
 +MZOimFcCX3E03wXbZHoj5ArYunHXduHb3Aln338mspEiVf8G34Ae7/dP34Epj8j
 dIi67Z4ZuPOMUVfGQB7WLd5tBi9cg==
X-ME-Sender: <xms:3FgZYDBiqeHX8W65cZeS9FQLn81FwK_fpeauTIUUPouin-tjYZ8IBg>
 <xme:3FgZYJgKjK-HvW5xE8Vevx2roHHUlUkuJcWN903c-T6UdbOvN7VJ7HG-zoP08F9VN
 8LuRPZJhISiJIwVjt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgedtgdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepvdffveetueejheehvdfggfehleejhffffeeijeffgefg
 udekhfevtdegjedvgeehnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:3FgZYOlqpRuOJpoQNi690bKdBlsZl10NbTM6YJ_UTriZpZtzPlAr8A>
 <xmx:3FgZYFxHK0XvQAITcq-znyZ3LimqI3czZkQBKuj9J32XOSRpn08bkw>
 <xmx:3FgZYITOnSJKUWFFwzJIizDeWz5s2R7u8ZKcGX6VzYm9S7CL5NH6aA>
 <xmx:3FgZYB6cs6C8l7W9LkaECP8Z8Q293ZWRhptT1M-GxrbKGjeh9DlIoA>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 052231080057;
 Tue,  2 Feb 2021 08:51:23 -0500 (EST)
Date: Tue, 2 Feb 2021 08:51:22 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: snowyang <SnowYang@linux.alibaba.com>
Subject: Re: Change in ...meta-alibaba[master]: thor: initial machine creation
Message-ID: <20210202135122.kbvdfnq6ed2onuhi@thinkpad.fuzziesquirrel.com>
References: <gerrit.1605682495000.I03f07f9e29b4ec19b5b169f14489e8d7ed786600@gerrit.openbmc-project.xyz>
 <4ufnKrB2SUu3u1SbJu709Q@ismtpd0004p1sjc2.sendgrid.net>
 <94c8af34-dcae-e33d-a0f0-a5540ef518fd@linux.alibaba.com>
 <YAneI7zHQx217lmu@heinlein>
 <5841da60f00cade13d87d5b8795f8a25021c2e44.camel@fuzziesquirrel.com>
 <f8678061-4662-4445-a4d0-016040f00979@linux.alibaba.com>
 <0008fa42-2a5c-b092-8da6-7eaa91e775f7@linux.alibaba.com>
 <0FC93EA6-AE09-46A6-9BF2-36471B85755B@fuzziesquirrel.com>
 <fe3fef11-56c7-85a4-b3fc-35ab29e99f60@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe3fef11-56c7-85a4-b3fc-35ab29e99f60@linux.alibaba.com>
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

On Tue, Feb 02, 2021 at 09:43:05PM +0800, snowyang wrote:
>
>    Thank you very much. I have just tried to push the code to 
>openbmc/openbmc with the name of moyan-yyb, and i found there are too 
>many branchs and  i don't know which one i should choose(Or maybe 
>should i create a new branch used to save the code?).Then i try to 
>push it to the branch of master 

^ this is the correct branch.

Hi - can you share the command you used to push?  It should look 
approximately like:
   git push <gerrit-remote> HEAD:refs/for/master

It should _not_ look like this:
   git push <gerrit-remote> HEAD:master

thx - brad
