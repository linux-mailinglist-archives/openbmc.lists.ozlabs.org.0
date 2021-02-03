Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DE430D1DD
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 04:05:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmlm0hH7zDwrv
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 14:05:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=l4kYf0Eb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NRQ3npyb; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVkbz2xt7zDwlP
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 12:29:02 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E09D55C02F4;
 Tue,  2 Feb 2021 20:28:57 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 02 Feb 2021 20:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=KpfAptRPHSxLyyo5+H7L9HQxTktAKXu
 s0VsKpIuoEWg=; b=l4kYf0EbPQ7Qrr0oSjN0d+w3TCAb6gWcR0m4UJz/KtqIFHA
 Gbg9tjn+KP3ZuWBizAPvkW4JV5knc1g6ec/vSg4WCSNMK/jtZY86dhkcVL7FseSr
 iblKDFmrv5BTmzctRDvCkHI1DSVyszsJxWD+ug1+dR9k5/TNKJCT1H68mZK5LQ0q
 NGH7TjDXQtDaVzQbvPh7116BAJBYqekNSFp6GNeP4I9lSXZ5oKkltWIm+pvtD+kw
 POCYLBADIztMR64/tm8zFUdlZm7Rr2Xz5NTRWitpvTd/b+2jSs3+NqBoMGleZgAb
 m916Tge9ZU304JeV6fwxdXK+HaYd4YANlQduNVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KpfApt
 RPHSxLyyo5+H7L9HQxTktAKXus0VsKpIuoEWg=; b=NRQ3npybBKAIWV5Y/GLX2Q
 da0pF5R288s4aP6W7yGmP89z0gbLXcCeNlyROiD/IasvUtn94LIGWU4y/teBKwWF
 GKCCNRxK4xZQ6mKPgXM4+gFLt3H99Be3HHpEawe1RgSqJg19pn0Rwlghf2LaGdU6
 QKK8i8jtiekxZruufYQ9bA3OYpzn708QDdFviJ/vOBbfSFh7TkYoN1hSFadzI/qo
 BTGWDd9jTB8ZvD5LZL/Xr+ybAqqhFzykkE7ts6cV2TzrZqU6etDtwEgZHU2mZ0Ro
 p7VE+rpbdm/6GU1MK3Srqj76zG8HLr+VBs2Vh8CNXYccJxQDa3nqvhFuyijCjBkw
 ==
X-ME-Sender: <xms:V_wZYMAQ9f0nIazXq-8XBzKVMV-vv4D_PsGTmpxHnt0hJv_xNLfjEg>
 <xme:V_wZYOi9WofUxhe7xMbX1AMIOgW0yNCs7VFMsD0OToRsIjWsTnkUHmGfFn3fUyYV0
 lEGKQBP7QEHRZN6kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgedugdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeelkefgffekteejhfdtfffgveejvedvvdevgeduudffuddukefhhfekvefg
 iedtffenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:V_wZYPmjgWE1DH8R5_oKFCIr3fQEwCqkEpbUOPE84dGbTlQO9NzhtQ>
 <xmx:V_wZYCzz81k6lOE27UUMpXLMaTy5WNxCsz-5UNYf122crtS4Bmf4GQ>
 <xmx:V_wZYBTWKwqsZ7SOreahjQMgrmnZiR6pc1fmGskp65wz_VYhwcdwuw>
 <xmx:WfwZYAK4LbFeN6sjkDOOP5tkioJ3v9ZDmSIEOHlKRG_MY7A_qn4vKw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CC6FDA0005D; Tue,  2 Feb 2021 20:28:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <950891ca-6e32-42ed-8c84-b08740ef14a8@www.fastmail.com>
In-Reply-To: <09f8bed7-e19e-4ce9-850f-ae870ae89937@www.fastmail.com>
References: <31abd546-4538-ecf0-134e-b8e48e75b3ad@linux.intel.com>
 <CACWQX83KhqORsx-Gm4CCEndADO-GEgNHtxPpHR2ptsgzmtU9xA@mail.gmail.com>
 <09f8bed7-e19e-4ce9-850f-ae870ae89937@www.fastmail.com>
Date: Wed, 03 Feb 2021 11:58:26 +1030
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



On Wed, 3 Feb 2021, at 10:41, Andrew Jeffery wrote:
> 
> 
> On Tue, 2 Feb 2021, at 11:56, Ed Tanous wrote:
> > 
> > The third one is a little more out there.  We could change the
> > sensor.Value.Value property into an FD type, and point to a memmapped
> > area of memory into which we write the current sensor value.  That
> > way, the "sensor value" on dbus rarely changes, but you can always
> > read the current state of the sensor with zero overhead or context
> > switching to the sensor processes.  If this works, it has the
> > potential to speed up most sensor polling operations by an order of
> > magnitude, but seems hard to do, and has a lot of questions.  Does
> > inotify work on mmaped files?  How do FD permissions work when sent
> > over dbus?  How do you "lock" the memory region to write it (or do you
> > not have to)?
> > 
> 
> So... a little repo that I pushed recently might help out with this approach:
> 
> https://github.com/amboar/shmapper
> 
> It's a shared-memory implementation of the mapper daemon, but setting that 
> aside for the moment, the implementation contains a shared library, libshmap, 
> discussed in the README:
> 
> https://github.com/amboar/shmapper#libshmap
> 
> libshmap allows you to treat process-shared-memory like regular heap memory*, 
> and also wraps up the pthread locking and condition signalling primitives in a 
> way that they can be placed into the shared memory region without concern.
> 
> So in brief, you could implement your out-there idea on top of libshmap, and it 
> has solutions for most of the questions you list there already:
> 
> * Permissions would be enforced by ownership of the sensor shared library 
> (libraries?) built on top of libshmap.

Alternatively, set permissions on the sem or shm files (currently libshmap just 
sets them to 0660), or given that you're probably going to wrap access up in an 
API anyway, split the producer and consumer APIs and have the consumer API only 
expose const values.

Anyway, interested in your thoughts.

Andrew
