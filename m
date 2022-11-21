Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3641631895
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 03:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFrh73nK5z3cK8
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 13:20:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=kfinrTjU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=kfinrTjU;
	dkim-atps=neutral
X-Greylist: delayed 439 seconds by postgrey-1.36 at boromir; Mon, 21 Nov 2022 13:19:37 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFrgY1QXHz300l
	for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2022 13:19:37 +1100 (AEDT)
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6589520031;
	Mon, 21 Nov 2022 10:12:13 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1668996734;
	bh=NFuosOkAsLzHpouN5WFfQLoNSrg55W6aS3dHRMgyGgs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kfinrTjUdFEM0fhG7TXAEShHI6afo6l6S9W2XWZE6A4NyvdDoinzU/cqdn2iZXn1Q
	 Q0b1wAs8y324F7X9kd+FV7ge74fswSMfnKMnBrrQtEZzntcnPMip66wSLUSr64msdQ
	 +B5pSkUQnAVXqhQSNZYFJGdiZ/udfZccXN46682Zlx9Li9LPs3sY2a6EiiVgtzpvwm
	 vygw0kLG2FJwxhUxkwa+z4M0OLo4dRLZf8isxgXFHXUK4ymhhnDxTmVkPphj161b+C
	 HQQdTMXKTAbMubkSekhwBvGYSDUofA41wDPp9xOPlEfaeYenFpdb0M/3lZKhA8jK+D
	 wVbh1BehZyFtg==
Message-ID: <da6363c6ae07bd283c4259cf73d5a8c7968e2e91.camel@codeconstruct.com.au>
Subject: Re: Porting a device using MCTP over SMBUS
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Gyeongtaek Lee <gt82.lee@samsung.com>, openbmc@lists.ozlabs.org
Date: Mon, 21 Nov 2022 10:12:12 +0800
In-Reply-To: <000001d8ef53$2f4b7cf0$8de276d0$@samsung.com>
References: 	<CGME20221103070916epcas2p40d1ad61e3a132a4b07fb154b281a8286@epcas2p4.samsung.com>
	 <000001d8ef53$2f4b7cf0$8de276d0$@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0-2 
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
Cc: jaeheon.ma@samsung.com, jungsoo0.kim@samsung.com, bj20.kim@samsung.com, kavin.lee@samsung.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Gyeongtaek,

> I had a couple of questions on implementing a service that
> communicate with a device using MCTP over SMBUS.
>
> It would be appreciated if anyone give me some clarification.
>=20
> In my observation, there is already libmctp package which is an
> implementation of=C2=A0 MCTP.
> However, libmctp doesn't have a binding for SMBUS.

We're moving to an in-kernel MCTP stack, rather than using libmctp in
the OpenBMC system. With the kernel stack, there is a MCTP-over-SMBus
driver available.

I have some background information on the kernel MCTP support here:

  https://codeconstruct.com.au/docs/mctp-on-linux-introduction/

For some background on the OpenBMC-specific uses of the MCTP stack, we
have this:

  https://github.com/openbmc/docs/blob/master/designs/mctp/mctp.md

and, in case you're looking at NVMe-MI support:

  https://codeconstruct.com.au/docs/nvme-mi-with-libnvme/
  https://codeconstruct.com.au/docs/nvme-mi-firmware-update/

Cheers,


Jeremy

