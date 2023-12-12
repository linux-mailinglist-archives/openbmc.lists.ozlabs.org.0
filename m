Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E9980E382
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 06:02:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lgoJA7Pm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq61q3xvfz30fp
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 16:02:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lgoJA7Pm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq6181pfDz2ygY;
	Tue, 12 Dec 2023 16:02:19 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-187-191.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.191])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2CE0A20174;
	Tue, 12 Dec 2023 13:02:10 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1702357334;
	bh=0JEzWpk4MDY+4Qk2dR6y4bAMD86j0zFUEcjMhDT332Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lgoJA7PmVBvR5AKglnaYAriJaabfIuzhglD3ToN4ObIUrKizYa2IYtQIVYhl7kuwH
	 RdjqjlDjLTr4+glfyW/g1DbmQY8HjjE7tSq92XW0ieGsYz618SZHefj3jwd14qq7Tw
	 adtG4cvXeJKo6rdiBv1O1xq6JiM8VKkSJRFxtq7nkUk/bx7ej/dV1gFnyl9zqzTEKL
	 NMOihBAHpihBg/+7Umfre73a4+lkiHnP3uVw1A+bshV37EuhapBZpTQw17npLf3dS+
	 /7wsS02MyVjpQAZWH+i104dTJp3hDl4JzsuP/xhBlUM9QH5qAsZdXKq3QE655ymHBx
	 E4CIH3aX7Aw1g==
Message-ID: <c11d2365e67299dcc5ff7319a1856dbaa985d61e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 0/2] i2c: aspeed: Late ack Tx done irqs and handle
 coalesced start with stop conditions
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, Quan Nguyen <quan@os.amperecomputing.com>
Date: Tue, 12 Dec 2023 15:32:09 +1030
In-Reply-To: <CACPK8Xc6-M9fsx3AUPobzvG6sjCrr8Sj5B3Q4Onp5wGvMm_BrA@mail.gmail.com>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
	 <CACPK8Xc6-M9fsx3AUPobzvG6sjCrr8Sj5B3Q4Onp5wGvMm_BrA@mail.gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, linux-i2c@vger.kernel.org, Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2023-12-12 at 13:09 +1030, Joel Stanley wrote:
> On Mon, 11 Dec 2023 at 20:52, Quan Nguyen <quan@os.amperecomputing.com> w=
rote:
> >=20
> > This series consists of two patches to handle the below issues observed
> > when testing with slave mode:
> >   + The coalesced stop condition with the start conditions
> >   + Early ack'ed of Tx done (ACK and NAK) causing "Unexpected Ack on
> >   read request".
>=20
> Looks good. I've reached out to a few people who use slave mode to ask
> for review and testing on hardware. As long as they don't come back
> with issues, we should get this merged and backported to stable.
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>

I've dropped a build with the patches onto an AST2600 EVB and lightly
exercised the affected paths using NVMe-MI over MCTP to a Micron 7450.

Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Andrew

