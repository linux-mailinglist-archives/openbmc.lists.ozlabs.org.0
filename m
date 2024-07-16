Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9F5931F4C
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 05:35:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZOPmZOOY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNPpf1Dldz3cVm
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 13:35:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZOPmZOOY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNPp72Gnpz301T
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 13:34:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721100894;
	bh=WqIvTsYdoV1RkCJbQkmdFSKNJ/b1hiXFZWzrZH2HZ4M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZOPmZOOYrxnf2eN8z9O/dYo5R6Mf5eCKfXcsGO2CyaQU8mjDKI0AE5mdmGHQHK77u
	 g9Oue0m47VdDCVqDi/7hiA+cVpgxjpeLrdiQ5Qai19JEJsT6VypvPl6B9TJcvJLjrc
	 r3ccT2/vEKgHT5xZt9wZ9c8E/CJ6t0Tr/ea6d6C5lS54A1QNxQPXO0f5R54wm+C0bI
	 oCf7F8KqZE4ikZ3LWNm9q7F68SfqpALXr4RG5SO69mrfsnEW7pw+K5eP06MW2pQJKd
	 FZMxjTqYtWo+1hrLJbXTi9LGjzJRx9DZKR8xlLmBT/2CzB/JT2UO/SjzLsxFkgq6zP
	 SCVhffGA3HlHQ==
Received: from [192.168.2.243] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B4ACE65555;
	Tue, 16 Jul 2024 11:34:54 +0800 (AWST)
Message-ID: <0cd404956b827b5ac5407b8de7866a221ea0700c.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1] usb: chipidea: udc: enforce write to the
 memory.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 16 Jul 2024 11:34:54 +0800
In-Reply-To: <20240710124157.2106609-1-tmaimon77@gmail.com>
References: <20240710124157.2106609-1-tmaimon77@gmail.com>
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-07-10 at 15:41 +0300, Tomer Maimon wrote:
> In the prime endpoint function, we need to read from qh.ptr->td.token
> to ensure that the previous write to it has indeed been committed
> to memory.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/usb/chipidea/udc.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

What's the state of this patch with respect to upstream? Is this
something specific to the openbmc/linux dev-6.6 tree, or is there an
upstream equivalent? If the latter, can you please link to the relevant
patch?

Andrew
