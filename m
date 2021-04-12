Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F635B8D3
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 05:12:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJYhB1jn2z30CL
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 13:12:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=KvkuJbdZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MKHXBKUg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=KvkuJbdZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=MKHXBKUg; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJYgt0dD7z2xZK
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 13:12:25 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 433AD1555;
 Sun, 11 Apr 2021 23:12:23 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 11 Apr 2021 23:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=SBzFN
 Aaqzkwa9MXGvInlzlpTeMmFc7nTS7+JcTcpFzE=; b=KvkuJbdZ+Vsx5I/4XPVGH
 l1TgWvBROxsC42+07LfHJFwXluTcWx43ggrd+dSzO/L9qT3zq6wvxZVrOAZ/uMUQ
 p3716P6c6z59i0xGT/bbOnvyGbb1Ugt2PU7D/yecWVy7d+tAG5afvnm6RjW9WhYS
 8M3naRuBlWHQPwGxNqxjEbFBamrVjslHA6D2X7Ln7QQGsJ/QfDzztK6g+AEK4kor
 pTcaDiXB+9LtxD9uDFaeLUtwDseWwmNVWRrAjXFkPUnCW+QY+8+47jBMDrc+XHxN
 9/XslJtNy8zEaYX1SqhK7ESjQCtI+sm3yBheelVilDmY/8/AaODAixB3KpULbaTU
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=SBzFNAaqzkwa9MXGvInlzlpTeMmFc7nTS7+JcTcpF
 zE=; b=MKHXBKUgOHakPHXnnCLL3RgLf+tJhDe9PZT3AM+YCh0CvR5AUzub+9s+q
 NIRixr79p9mSizpVkuno0+27rnst8kd+Bt1+oAxRzNTkdIrblJGZM1S0PuhoKbux
 vaIwR5MiOx+4XmP0QxoVHj+Y1DIyGnEoUnfpDCb+3m92Ihv3+jW5KYPbxQU3kcfj
 tog4edWJggWjm7LuPT6hp7TTucGe5zXpq7OKoXgThf7OQiGqbDyTJEb/3RkEJS1g
 ZIz6FyNK1dZJGjj4YG4wyl8m3A2C+4Dav7idVrq39Y0ygbKkluMjtq4qREjhWGgc
 U6XSceQcFaAQvAZ35z7oMpUfIl03Q==
X-ME-Sender: <xms:lrpzYL7CganjpOooq70R1y5CJCr2mV-yWSG_X8kwbcAgtQa6HqTCtg>
 <xme:lrpzYA67VFQFw3RBi1NrKJ5kPbMX8sn3zXpDRxA968mBvCrIpm9gVpLE6k1wmGhyU
 LBNZCHeqCojigxN9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekiedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeefgedtgeegfeegffehtedvffdtleelkeduvdejfedtteeiueeffeek
 jeeikeffteenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsrhgvnhgurghnghhrvg
 hgghdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:lrpzYCeRapTvhmWbTh8JBao_5ErkmYnVU0GJvoroYGmlTEY7ZMDJCA>
 <xmx:lrpzYMJDoNZJDXVhWJbBngcXcKaG9psTTf6qo3u-XNbRkcp-yefd4A>
 <xmx:lrpzYPLpOE7-6Lh519_rmo_pR6fcMmAiQ7ADulx6QMtectA8aHJKyg>
 <xmx:lrpzYBwM1K2KP0DmYUU_T7kFKr9Oqy2DGytZYktDtI8FTyQOTHIxPQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 83984A00079; Sun, 11 Apr 2021 23:12:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <62029935-7fca-4599-b540-8914c3da3652@www.fastmail.com>
In-Reply-To: <3A131195-2BD0-4336-9B76-738DA4F513CC@gmail.com>
References: <CAJOps0ubONA_FCO+n9Gu_OfBBYuY9RhQw-AaELfyLRJjA+e8PQ@mail.gmail.com>
 <3A131195-2BD0-4336-9B76-738DA4F513CC@gmail.com>
Date: Mon, 12 Apr 2021 12:42:01 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Geissler" <geissonator@gmail.com>, "Sui Chen" <suichen@google.com>
Subject: Re: Thoughts on performance profiling and tools for OpenBMC
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 25 Mar 2021, at 10:58, Andrew Geissler wrote:
>=20
>=20
> > On Mar 22, 2021, at 5:05 PM, Sui Chen <suichen@google.com> wrote:
> >=20
> <snip>
> >=20
> > [ Proposed Design ]
> >=20
> > 1. Continue the previous effort [7] on a sensor-reading performance
> > benchmark for the BMC. This will naturally lead to investigation int=
o
> > the lower levels such as I2C and async processing.
> >=20
> > 2. Try the community=E2=80=99s ideas on performance optimization in =
benchmarks
> > and measure performance difference. If an optimization generates
> > performance gain, attempt to land it in OpenBMC code.
> >=20
> > 3. Distill ideas and observations into performance tools. For exampl=
e,
> > enhance or expand the existing DBus visualizer tool [8].
> >=20
> > 4. Repeat the process in other areas of BMC performance, such as web=

> > request processing.
>=20
> I had to workaround a lot of performance issues in our first AST2500=20=

> based systems. A lot of the issues were early in the boot of the BMC
> when systemd was starting up all of the different services in parallel=

> and things like mapper were introspecting all new D-Bus objects=20
> showing up on the bus.
>=20
> Moving from python to c++ applications helped a lot. Changing=20
> application nice levels was not helpful (too many d-bus commands
> between apps so if one had a higher priority like mapper it would
> timeout waiting for lower priority apps).
>=20
> AndrewJ and I tried to track some of the issues and tools out on
> this wiki:
> https://github.com/openbmc/openbmc/wiki/Performance-Profiling-in-OpenB=
MC

Some rambling thoughts:

The wiki page makes a start on this, but I suspect what could be helpful=

is a list of tools for capturing and inspecting behaviour at different
levels of the stack. Cribbing from the wiki page a bit:

# Application- and Kernel- Level behaviour
* `strace`
* `perf probe` / `perf record -e ...` (tracepoints, kprobes, uprobes))
* `perf record`: Hot-spot analysis
* Flamegraphs[1]: More hot-spot analysis

[1] http://www.brendangregg.com/flamegraphs.html

# Scheduler behaviour
* `perf sched record`
* `perf timechart`

# Service behaviour
* `systemd-analyze`
* `systemd-bootchart`

# D-Bus behaviour
* `busctl capture`
* `wireshark`
* `dbus-pcap`

`perf timechart` a great place to start when you fail to meet timing
requirements in a complex system (state).

I'm not sure much of this could be integrated into e.g. the visualiser
tool, but I think making OpenBMC easy to instrument is a step in the
right direction.

Andrew
