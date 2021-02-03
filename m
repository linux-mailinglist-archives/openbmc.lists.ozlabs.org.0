Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B018D30D1D8
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 03:59:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmbr0WQszDwqD
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 13:59:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Gb6vF6OC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=i9b4aH3E; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVhvj0k4YzDqcY
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 11:12:32 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 92AE95C0219;
 Tue,  2 Feb 2021 19:12:26 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 02 Feb 2021 19:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=n3Jpv30wXeHEhJ9WckSU3BGDSlGaHEo
 ftD2etpNhPAY=; b=Gb6vF6OCdsxDKPHYARghvYRRflrdiURPQn1+MbMhYX9h0Nf
 KOGQV5PgwOQkLjtW9CEE5mqqAf42hO5+A4euZ72lAa++7sTAtKBAzItDeULUU4hJ
 jza00DG6/s8+oDWlLw0Y6vQE8RoB5BaKtYVMghv/BdMDzAwcpQOoLj1KdyWOduYw
 RAUgElXeWDuUl4ng/Jw+dTKA0WH3FwG5dpDmuOeVnP957pXxIJA7HDjMMJ9sMFJj
 ottLdFXfzaDvlNdKK15uw2NAs0dqsvbWO0hZFyjsf5yjjIRb4FbEHmRrO/nOuIDn
 aP8cekk+2BOtRjMKUcbvgXCf5/pYojtZ8q33j1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=n3Jpv3
 0wXeHEhJ9WckSU3BGDSlGaHEoftD2etpNhPAY=; b=i9b4aH3ElUOOlK8VTvbbv8
 GLTz3p1PdqG8+VI3dIyn1pz2/2ePtlaVKtbzdsQ09mbh74VGboIiFkmpZaUS3ZM+
 h+woo/jE3lxptWAxgb5Ju6yvj9IPMIzLaF7+dOzNJQXEuFFfr7f6z6EbOEMDESZj
 P3nNP5cuWEwbOUk5QlnRW3V4YCxIxgrr+v9Fbfh1YMde9uWRP6bpNLV5UD++MgMr
 b3g2QbzFm2/QcK0E5godMv3SY4JQf/zaq/ryQHJmjJI2WtcxSns++d1dozdLSCsM
 jJsmtOomiq4J0s4CzPoRv8twyHRXU1y7ytp1VTuGDQcYPhSJ9xuregF4FT4HMrUg
 ==
X-ME-Sender: <xms:aeoZYOW-R3CqVJql_grHZPMggvqc_UPOIjU4B7DekhavCRIgcUhTgA>
 <xme:aeoZYKkhIB0GDbv1m0s-9ab7GKn-0nuKe78KJtrmQdyLrKgTHxwxGXLFCmzYWIaW6
 UFnzGvvgWM8T0mgZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgedugddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeelkefgffekteejhfdtfffgveejvedvvdevgeduudffuddukefhhfekvefg
 iedtffenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:aeoZYCaDGNIucuAPzE9G4K3-CTPayfc4heYFmYNtH7FBpZXe2UNs0w>
 <xmx:aeoZYFVnL5qgbapJcVf_ixzacagL68QiHNxRm8ppjC-kgGLakup8ZQ>
 <xmx:aeoZYIkhpXGT2ewIHbGwJ8-1DZ_GHZUzBlaBSTP19dqk9dZogtGKHQ>
 <xmx:auoZYEso6iYExrN-WOPOCZzaZfjoNtTWlS1qtjtlt7Y6hBBb9dryPQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 43239A0005D; Tue,  2 Feb 2021 19:12:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <09f8bed7-e19e-4ce9-850f-ae870ae89937@www.fastmail.com>
In-Reply-To: <CACWQX83KhqORsx-Gm4CCEndADO-GEgNHtxPpHR2ptsgzmtU9xA@mail.gmail.com>
References: <31abd546-4538-ecf0-134e-b8e48e75b3ad@linux.intel.com>
 <CACWQX83KhqORsx-Gm4CCEndADO-GEgNHtxPpHR2ptsgzmtU9xA@mail.gmail.com>
Date: Wed, 03 Feb 2021 10:41:46 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ed Tanous" <ed@tanous.net>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Sensor Value PropertiesChanged Events
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 2 Feb 2021, at 11:56, Ed Tanous wrote:
> 
> The third one is a little more out there.  We could change the
> sensor.Value.Value property into an FD type, and point to a memmapped
> area of memory into which we write the current sensor value.  That
> way, the "sensor value" on dbus rarely changes, but you can always
> read the current state of the sensor with zero overhead or context
> switching to the sensor processes.  If this works, it has the
> potential to speed up most sensor polling operations by an order of
> magnitude, but seems hard to do, and has a lot of questions.  Does
> inotify work on mmaped files?  How do FD permissions work when sent
> over dbus?  How do you "lock" the memory region to write it (or do you
> not have to)?
> 

So... a little repo that I pushed recently might help out with this approach:

https://github.com/amboar/shmapper

It's a shared-memory implementation of the mapper daemon, but setting that 
aside for the moment, the implementation contains a shared library, libshmap, 
discussed in the README:

https://github.com/amboar/shmapper#libshmap

libshmap allows you to treat process-shared-memory like regular heap memory*, 
and also wraps up the pthread locking and condition signalling primitives in a 
way that they can be placed into the shared memory region without concern.

So in brief, you could implement your out-there idea on top of libshmap, and it 
has solutions for most of the questions you list there already:

* Permissions would be enforced by ownership of the sensor shared library 
(libraries?) built on top of libshmap.
* Locking the memory regions can be done with shmap_mutex or shmap_rwlock, and
* Notification can be done using shmap_mutex and shmap_condition

I've been thinking about how I could do condition notification over a 
file-descriptor so you could poll it for updates to the shared memory. I 
haven't got anything concrete yet, but that would provide async monitoring too.

Cheers,

Andrew
