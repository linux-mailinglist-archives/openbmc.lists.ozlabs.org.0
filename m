Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE481AA44
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 23:58:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LTJ2rvGT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwTWL5s73z3c3H
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 09:58:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LTJ2rvGT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwTVm6K0yz2xXP
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 09:58:08 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-80-147.adl-adc-lon-bras32.tpg.internode.on.net [118.210.80.147])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7B52A2003C;
	Thu, 21 Dec 2023 06:58:07 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1703113088;
	bh=bDOIRts3BNpT1pwhLWWEIhURZ9fAIfB9n6288bsYkYE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LTJ2rvGTdCit0tu8KVxsNvgYPSUK8pEGl46v0Leo7yOrwAXY6Be/ZFE8O6/q6aBlM
	 OY2kUAlmxDsi2QqoGHTkb8gf9SlfO86xDYMLxIzrXW7UFFSGvP5x2VKQZAFV0oJXM6
	 MmZzKSFeQj4aBbTUzP+XYvLokpxGsN0lbHf+vwtaIUymiiqojLYbLkKzjinIvIV/qE
	 OhxIw941T07pLTpd0Tl2HhO7RLM0HRlTw3U0kCRC/Vbj/+oO+nlZwi7vWCqAjtN9od
	 LnZDXLcpADhmr9nm8Q0uYEZ5DN0dqDPckbcGAaL/hFFb+5GOcW5aKVsG5z4NfWrtqA
	 jnc7H62I5EBYw==
Message-ID: <508682f0a990cbc8f34121d8b891c1ee9f934dd7.camel@codeconstruct.com.au>
Subject: Re: openbmc/telemetry: First complaint of unresponsiveness
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, "Ambrozewicz, Adrian"
	 <adrian.ambrozewicz@linux.intel.com>
Date: Thu, 21 Dec 2023 09:28:06 +1030
In-Reply-To: <ZYMc0jRDhpuaP_KR@heinlein.vulture-banana.ts.net>
References: 	<47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
	 <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
	 <ZYMGqtn9XVgjkBj8@heinlein.vulture-banana.ts.net>
	 <fcd703f2-b05b-4c21-9d66-6506b7aafa01@linux.intel.com>
	 <ZYMc0jRDhpuaP_KR@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
Cc: cezary.zwolak@intel.com, openbmc@lists.ozlabs.org, liuxiwei@ieisystem.com, jozef.wludzik@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2023-12-20 at 10:56 -0600, Patrick Williams wrote:
> My gripe is that you should not be holding up the open-source project for
> your own unpublished, undocumented, non-aligned tests.

My understanding is now that Adrian is aware of the patches he is doing
some of his own testing to build confidence in merging them. *That*
latency should probably be measured from around the time I sent the
initial email, as I suspect that's when he became aware of the patches.
So far that's a few days, which isn't unreasonable to me. As a
contributor I sympathise with measuring from when you pushed the
patches for review, and that this seems like yet more delay, but
hopefully we can separate out the events here.

I'd be more concerned about a knee-jerk merge due to getting a mildly
stern email and having the merge breaking things. The fact that he's
testing them to build his confidence seems like reasonable maintainer
practice to me. The fact that it's felt that tests are required in
addition to the automated testing is a concern, but I wouldn't yet
class this effort as "holding things up" in a tar-pit sense.

Andrew
