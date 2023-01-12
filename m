Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA998666A1C
	for <lists+openbmc@lfdr.de>; Thu, 12 Jan 2023 05:17:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsrqB5Xgmz3cH1
	for <lists+openbmc@lfdr.de>; Thu, 12 Jan 2023 15:17:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=E3kQ3Kt6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=E3kQ3Kt6;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nsrpb5CCjz3c3m
	for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2023 15:16:39 +1100 (AEDT)
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D7AFB20034;
	Thu, 12 Jan 2023 12:16:35 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1673496997;
	bh=L7UJ5ejhOqh4R6a4tx86Zf5iKiLl+n+4tsy+BXPUFdo=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=E3kQ3Kt6pf7oe4GJ+lMrNbOGIXO8RT0RYTDgcVnkNMMkPXP+8Lcn+sVmOb8ZzdjcR
	 0TZrVBeIv1+ax7AzaZT7GQnXaIWMVEL1Oaz42zcPEChT+FZ2oxz+zxoj3Gx/2lIe0T
	 pEi4EhYNI8lbIOTG5ajnfgXsIjGMPGRvZh5u2oucLrgTNmbyHaO99vLr3JCO+0Iha9
	 Rdk9URa8p/BToC+6tG0lG6ELH0EV+I4n+fUOvkg2XRjMiIDjraIytaAR3ijhjLepnN
	 rghnFgG25pqIdz4gb/mPsreY0ynO0ttNXWkzmNqBXpiQGCyMvrllAEU8QQVaj1PShK
	 Jj7jUszuZOZzA==
Message-ID: <d6185ebc5c96f2e7156b252f0e4876dbf45ab132.camel@codeconstruct.com.au>
Subject: Re: dbus-sensors, present and future
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org
Date: Thu, 12 Jan 2023 12:16:35 +0800
In-Reply-To: <Y79U52toP0+Y4edh@hatter.bewilderbeest.net>
References: <Y79U52toP0+Y4edh@hatter.bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2-1 
MIME-Version: 1.0
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

Hi Zev,

With a large caveat of not having scoured through the omnisensor repo
much yet: I'm love this approach; the arguments I think are well
justified. From what I've seen of the example so far, it seems quite neat.

One other consideration that I care about is what should be included in
the sensors implementation; there is some functionality there that goes
beyond the scope of a simple sensor implementation, and is more around a
subsystem-specific service that *happens* to also expose sensors. We may
want to craft some guidelines around that.

But yep, looks great! Once I have some spare cycles, I'd be keen to
check this out further.

Cheers,


Jeremy
