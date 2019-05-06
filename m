Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D11A143C6
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 05:32:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44y7Zz2MvqzDqLB
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 13:32:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BZsz/LYn"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hDQ9kcuD"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44y7Z74YnRzDqF1
 for <openbmc@lists.ozlabs.org>; Mon,  6 May 2019 13:31:27 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1EFDA262E5;
 Sun,  5 May 2019 23:31:25 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 05 May 2019 23:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=eP7w0bBWtvFNW4cz5EiFgKcumsJW3Qk
 cSI0PQV1LhSc=; b=BZsz/LYn9cWRtncXIzDHzux4VKfbRRo0k7kgafEtWeS//jr
 YhsC5S8kMh/Hm4RzQ5Otw+sZPb+op3TOd45luN0tOGzR+J/d0swuCvAukBccBeDE
 StZy03tIqGjHf9qVQT171p3O8NZlx9j66DayarCB2UQ9FVky3r8rpe7bQiReGEA3
 Vsk9y1Y1oqaM/OPMCVWQE8rQN4Du03qMSUFdfJvaZqOv3UXqabW6wuOtrh9KdJ+T
 c4PZA2jAXT8rUrLw0kVzRThycHpHeGy5IvYnh3vMkWwnZhYb3Op1U8Nx+xTkJTKl
 zsv8JiY5sxJ1A5P/wqm0JIou/f4S+IjVuGojfyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eP7w0b
 BWtvFNW4cz5EiFgKcumsJW3QkcSI0PQV1LhSc=; b=hDQ9kcuDjRNp+N0y+tNmi4
 /MnCH4AMJuM9soN5UXAMrAZRPXdU3XIwkEiioBeoRKoazM9NiIKDLjbhKf2YFtJw
 zA3sLhTfO4daLBDEnUEIeFs1ECrlzRtHvfbc1YPrDe9V69NwZMfD/F0zQWZAtv0l
 CigQEHhZM3byCo0j1LFO3QyY+ccy8b24iW6f1hloeGndof2qwoHqsbZzGEwoTKDt
 58RErrQibut/tvBRnUPZLBHlecsFRm7EM2+wBjYR+xk4qvmlbdZeYNM5my/MxDxP
 7yO5t8lVdYoS5muanF5/YjiruA7AEYodd7UfCTvryqYEsR0xlUe1SwH+L2UCxQuQ
 ==
X-ME-Sender: <xms:jKrPXG9dahcbw2cvi0qr88QQobJ1EuPuk9i3MXAfUr1jpcXwUET2Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeeigdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepfihoohhlvggughgvrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:jKrPXEY7-2fjpz3YDnEuNkAIp6u6kvjh100CLXdLal1OJdi_so_2ow>
 <xmx:jKrPXGe3HBY4zxa4iVg5z4dGcFKYqgBMNpkBX4P8aKX09C6s1eDKIA>
 <xmx:jKrPXGrCvqVxjkBiS0f6ap8TvkcO2KcDS5JdKMZaqyIZcdRVNCMUwQ>
 <xmx:jarPXODHE48aLgleABOWA7S1fDZPxwZz-Lw5I_gkK0yZYoEn5LovCQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 81BD97C7F9; Sun,  5 May 2019 23:31:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <8b3e70c9-f182-44cd-997e-5d07b26d76a3@www.fastmail.com>
In-Reply-To: <CAO=notyajN+Sft6MNBku81Kiovagfo7B_Pzm4bqf1NsLtAOX7A@mail.gmail.com>
References: <CAO=notyajN+Sft6MNBku81Kiovagfo7B_Pzm4bqf1NsLtAOX7A@mail.gmail.com>
Date: Sun, 05 May 2019 23:31:24 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Venture" <venture@google.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: pci util cpp library
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



On Sat, 4 May 2019, at 02:28, Patrick Venture wrote:
> Does anyone have a favorite CPP library for talking to PCI?  I don't
> think parsing lspci output is as clean.

This feels a lot like the X-Y problem:

https://mywiki.wooledge.org/XyProblem

What are you actually trying to do?

Maybe poking at sysfs directly might help?

Andrew

> 
> Patrick
>
