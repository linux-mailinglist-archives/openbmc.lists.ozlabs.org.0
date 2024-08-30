Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB97966CD0
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2024 01:15:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwYs33yBFz3bbT
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2024 09:15:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2605:2700:0:5::4713:9cab"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725059700;
	cv=none; b=J+pjhNuz5V5F3McAXklE5KHw+0nsaXNt+ohkjTES14FYR8oLrhHmXTyrkLOhrn/WN/XdJiflLPltPjFcK/uaLGfwZ3ge2bJMnSSjATFSgUMwMNfwYzwix461lhKoYyS8BzQ8FecLs8X8Jh9z6Laehix0fZKgQ7l/RA5/PcAQG+x+PZ7j7aCD6f2c4MLwUM2Tz7X2XoGJP2AbjvI/os+XSIrEf7mMRvBKKmVczum1ACNeWSYOc2+aCKB6Nu2un37QtEaDS3qnGvPlbX9Kh3KJdVWV02myWccvdz8Z9v/a+D4ZTBFyby6EWuB4s4i2pT+937NuqctlPoBgjhZf0CUj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725059700; c=relaxed/relaxed;
	bh=GawH5IJO9ygSapEss62mKOurTOSD4UNeDcmJoXI5BQE=;
	h=X-Greylist:Received:DKIM-Signature:Date:From:To:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition; b=fgRhWgEYtFuHGs6E9NPkqbPbM2L4CMyIzLHnanq2Sdrpf9eEwGoXTyy8ltl1m4+G2CymcdYSPQhAw6GVSj26GlDiw0nTqjvge3yrflg6SqEWqtouhO3ZqxB0WEflh4jYf8jtetgU/T/MaaJZmCBIEMdeIulXmObTsce5nHjePs1fbLcJOQbChb8b2CnPCV483Bv65yp1THwBA+wkRLheb66lmLB2zY+AWynwWgCOUAtSgt6VkqJFzuUEIqEv5LpyNpiXUulSyKIBd7zDtw2Ox06lk4CkUSQOnssCcA937IRcUnEXhruban+g+iVoO+jsOldpj0NIiXt8gT7PtlD2FQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net; dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=AelYdojF; dkim-atps=neutral; spf=pass (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org) smtp.mailfrom=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=AelYdojF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 342 seconds by postgrey-1.37 at boromir; Sat, 31 Aug 2024 09:14:59 AEST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwYrz6L2dz3009
	for <openbmc@lists.ozlabs.org>; Sat, 31 Aug 2024 09:14:59 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e47:9700::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 4561F13B
	for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2024 16:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1725059352;
	bh=GawH5IJO9ygSapEss62mKOurTOSD4UNeDcmJoXI5BQE=;
	h=Date:From:To:Subject:From;
	b=AelYdojFNOZ9muJbVGgfiWTZtRZ7GgFcbUE5IIfMqx/74An+eSsRHVLNUf/5uHPqc
	 80oU6FY6LVIy1O1kpOHfa2vCVgTqaoPVBv6heXCAtH/h7qiyop312O/rGaKR7RR5ae
	 aMejfBPOfoxNLFS/cz9HcVrqxz1toWyzoiEyv8Cw=
Date: Fri, 30 Aug 2024 16:09:10 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: Moving on
Message-ID: <adf4ad27-a203-4381-bf3a-0286f75e8097@hatter.bewilderbeest.net>
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

Hi all,

I'm not sure if it's been all that noticeable, but I've been kind of
quiet on the OpenBMC front lately.  A pair of not-entirely-unrelated
points regarding that: (a) Equinix has decided to suspend development
work on OpenBMC, and (b) I've accepted an offer elsewhere (unrelated
to OpenBMC) and will be moving on from the company in two weeks.

I'll thus be stepping down from the TOF (due to inactivity I'm not
even eligible to run for the next term anyway) and relinquishing
maintainership of the small handful of things I'm currently listed in
OWNERS files for.

obmc-ikvm has two other owners listed (Eddie and Jae), though I don't
think I've seen much activity from either of them on it in a while, so
it may be in need of a new maintainer?

meta-delta I think may have one or two other commercial users out
there somewhere but I don't know of anyone who would take over
maintainership, so I expect it will be effectively orphaned.

meta-asrock sees sporadic interest and occasional activity from
hobbyists, and I could perhaps remain as a maintainer or reviewer in a
hobbyist capacity myself.

Unfortunately I assume this means my grand (if lately rather idle)
plans for omnisensor won't really go anywhere, unless someone else
feels like picking it up and running with it (if so I'd be happy to
help however I can).

To the best of my knowledge there are currently no plans to
discontinue the Equinix-sponsored CI servers, so they will remain
available for the foreseeable future.  Any questions regarding them
should be directed Ed Vielmetti (evielmetti@equinix.com).

It's been good working with you all -- though while I won't be
actively working on the project anymore, I'll probably still lurk on
discord and perhaps pipe up from time to time, for what it's worth.


Thanks,
Zev

