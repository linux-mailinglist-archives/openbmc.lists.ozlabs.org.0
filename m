Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FA21137AC
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 23:36:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47StxZ0LMNzDqNL
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 09:36:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="S/37aIuS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IOo6wr1H"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Sts95XL9zDqDl
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 09:32:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AC6A522682;
 Wed,  4 Dec 2019 17:32:41 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 04 Dec 2019 17:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=o+tJzAsZQVDgs/RBAR5T0ZMhdu5MIom
 4KAloGrmatzk=; b=S/37aIuSYB5dWqgCmtGyuWBOz2GwNSv0HGCwwYZPRJM8f3q
 SSJfujFP2ZAwfLKHit7+tWCEQBd2dCLdcIccEP7hl+UZoan/GXvNqLXkYoboSD7p
 jJGvbKkAJKZpMqcxap9uhY+8sd/igC+adcaICkJvfKXu/9MvBrEM/Xm0/mu/d+pb
 UFcFplaqUuzEL5vLA6uAOfOTMKSdo2uZs7zAQu1/lyLgBh+1rfe9KYGsXqHz3zq2
 i6GaE8+ayFXczESarkwA515TwImyRYnVuEUPS3bR6GTtXUI+aOOwCElYoyrWueSI
 DIiB44ylMy6H7X0G9h2E+gRtxtTnDrlTsmKXs9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=o+tJzA
 sZQVDgs/RBAR5T0ZMhdu5MIom4KAloGrmatzk=; b=IOo6wr1H/O+qPbbBW9xMg6
 7MF8d0lxTZezDHxAj/dV8r2+0maNBFCt++Zkh2WWb4zZzG8nwi8uHRtwLdkxh6kQ
 eq7KBp9DYpQ/Pw+DUxpTPzGK/q2IZyx5P3YZ4HVeXY9+ekxl0OBbBZeeh6VYvVDh
 zQPHQ0mAlnHpIM7SbmSLOIXTFnrbdvgAkyBFOWtxOrqUTa72BGXtA5tJjM/OqYXb
 tLoE7e+vl/xzdo60OIVPMlsOY4YnL8YC7i4Wxj5U8eQgxfkTtp+kA3ocZCmIxODE
 bt2DrZYvs+hXYNgyGbaUFP0EQTnpkia033lZrXZhaVJWrJL9h0QbbzNk3WAYDSCQ
 ==
X-ME-Sender: <xms:CTToXTwYWlD7fUejoU-94BV2qgaVY_bkSA2XrXu6rrKcC_OSHxDgUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejledgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:CTToXUu9Xo6BP9DULk0rJcAAz0vEQkuvLviFczdIc9MIUc851ZHbeA>
 <xmx:CTToXeJVbhcY-5hWH88tt9oV__cX-Al6kSCXkAtzQ3ZS16Is5a1aUQ>
 <xmx:CTToXY3y5p9Bl7hBQHomlpH7F03hYkk0rVu935dExfi8t0xnacuv5A>
 <xmx:CTToXbzBI1m6_mQ46XLAfDgQzrOmhJg_pov8GF0oQgdQnT4VxmBFvw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5A4E7E00A2; Wed,  4 Dec 2019 17:32:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-612-g13027cc-fmstable-20191203v1
Mime-Version: 1.0
Message-Id: <1fdc7be1-71f7-4926-83aa-a531de6d5b81@www.fastmail.com>
In-Reply-To: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
References: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
Date: Thu, 05 Dec 2019 09:03:36 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Kurt Taylor" <kurt.r.taylor@gmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Project metrics
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 5 Dec 2019, at 05:14, Kurt Taylor wrote:
> All, I just posted the project merge metrics for September and
> October. I will be updating the company/developer lists for November
> and posting those shortly. Enjoy.
> 
> https://github.com/openbmc/openbmc/wiki/Project-Metrics
> 
> NOTE: these metrics should be used *very carefully*. They do not
> represent the total contributions to the project. We value
> contributions many that do not show up in these charts, including
> reviews, mail list involvement, IRC involvement, etc.

Given all the caveats and the lopsided view the graphs display, what
are we trying to achieve by graphing the metric of commits per company?

It's also not clear to me what the inputs to these graphs are, for instance
whether changes to Linux, u-boot, qemu or other major projects that we
consume and contribute to are included or whether it's just repositories
under the openbmc org on github. If we're excluding upstream projects,
why?

Where are the scripts to reproduce the graphs? Can you contribute them
to openbmc-tools?

Andrew
