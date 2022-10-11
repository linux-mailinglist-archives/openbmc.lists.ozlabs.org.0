Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1495FA9C7
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 03:16:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmdCf2TFfz3c4W
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 12:16:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YErfDIEt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YErfDIEt;
	dkim-atps=neutral
X-Greylist: delayed 561 seconds by postgrey-1.36 at boromir; Tue, 11 Oct 2022 12:15:57 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmdC2000nz2y34
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 12:15:57 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A53452005F;
	Tue, 11 Oct 2022 09:06:32 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1665450393;
	bh=HpFxXxp8jqTh37y8yEVjJhMl0O/hVscfxsQIE+TwsCs=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=YErfDIEtG+Ry0e2pfWT8sZEjyyrCla3hTFLtMPmAthK45spP8ycucNAbvHXiKCazn
	 6D3TwgNXARy7vSR6qBqro4NGtk5WdD6MimKnXo5ZqGVArqTA1jgYf6xuvybZ96dZ0I
	 q8UP69/2s8IQ/wV0GH3wq3/W6gu/wcCSrwDzDe999dKDBmu2S0hSjt/lDjCcCpRfm9
	 29g3GXFnMlP7A2rIQyfz90ELDH3xkbsolswo2MTxcv7eOcba+N3Sl89mCw98xYxXPH
	 nLdGt6oWncf/f5uBYwcaYeH0AO/o7gYl10rdOotPN8L/bZO7RljQZAFljK9Ow1ydoc
	 N+kPLhtljjjOw==
Message-ID: <c259d074d0e5dae670bfe18155a23db600796afd.camel@codeconstruct.com.au>
Subject: Re: Unable to connect to a BMC Serial Console
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Shubhabrata Bose <shubhabrata.bose@tcs.com>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Tue, 11 Oct 2022 09:06:31 +0800
In-Reply-To: <BM1PR01MB24678016E23DB9B97349C7A185209@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
References: 	<BM1PR01MB24678016E23DB9B97349C7A185209@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.3-2 
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

Hi Shubh,

> TCS Confidential

Really? :)

> I am new to OpenBMC and I need some help about how to access the BMC
> console which I am not able to, after many tries.

Just to confirm - you're referring to the console for the BMC system
itself, right? As distinct from the host serial.

> Currently, I have connected my Host Server (i.e., Thinkstation P510 =E2=
=80=93
> Intel X86-64 CPU installed with OS: Ubuntu 18.04)
> with Intel Server Board S2600GZ (OS :Ubuntu 14) which has a BMC chip
> using aUSB-TTL Serial console cable=20
> (=E2=80=9Cxcluma Usb To Ttl Serial Cable Debugger For Raspberry Pi Beagle=
bone
> Cubietruck=E2=80=9D.)
> The minicom is not showing me any prompt & it=E2=80=99s paused; nothing i=
s
> going ahead.

A few things to check:

 - Where have you attached to the TTL signals? Are you sure that's a=C2=A0
   BMC serial port?
 - What are you expecting to see there? The BMC might only be=C2=A0
   outputting console data during boot.
 - Are you using the correct baud rate? (since there should be=C2=A0
   activity=C2=A0on the TX line during boot, you can use this to find the=
=C2=A0
   TX=C2=A0line and set your baud rate)

I'm not familiar with the S2600GZ, but I have done a bit of OpenBMC
development using a S2600STB platform, which may be similar. In that
case, slides 25 and 28 of this might help:

http://jk.ozlabs.org/docs/lca2021/lca2021%20-%20Server%20platforms%20-%20Je=
remy%20Kerr.pdf

Otherwise, maybe Intel folks here can provide better connection details
for the GZ.

Cheers,


Jeremy

