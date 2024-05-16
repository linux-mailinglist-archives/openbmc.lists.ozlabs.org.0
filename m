Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0144F8C6FC8
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2024 03:01:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=API0qq69;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfsGq0049z3dSW
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2024 11:01:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=API0qq69;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfsGD5zTDz3cZR
	for <openbmc@lists.ozlabs.org>; Thu, 16 May 2024 11:00:36 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F05F8200DD;
	Thu, 16 May 2024 09:00:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1715821233;
	bh=r2QPnjMO7Uj6aWDkQxZYgRURRJZK23gZfES0TCn8APc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=API0qq69dJkP9lwGmeD3MxVW1GIuRQPKOS6wYJ9fvjs5ilAxIdwOmxK7lreNDIKcu
	 3p9nGIHG/Iyhy9C+zG6P8IF2jdB3wu13HlNsSvjUDF+pGxLZw0LsbeymJyDDueAoYR
	 +SZkpirW/8YjGF9jDyoFRu9Z/92QYBgEM+NvCKc1p/v3PZCqDsKYgLFUlSldpzZ8+O
	 LwuC0lST5QQG+EXxvOswfljOCgO0/XDJCqZBhylFdcXmcmeIlTyETF0QAb3aAzKUPT
	 RnlhCncodR1Kgb8bwlkQbvqrz80JXKKZ4ry5qAffN9cFjmYKtifiAYpgFbXGtf7pXM
	 200jksSKKA9bg==
Message-ID: <ff7a6703c15a93f5f776caa836f0d0ccf870415b.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/1] ARM: dts:
 Aspeed: Add Facebook common dts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>
Date: Thu, 16 May 2024 10:30:30 +0930
In-Reply-To: <CAPSyxFQ0DWMMAV87NUW-wmt8hudeK2PSDdgWCuiTbthDwAd=vw@mail.gmail.com>
References: <20240513144917.952612-1-peteryin.openbmc@gmail.com>
	 <fe42afa01a7980d8934f437fbb01e2b27d46d7d9.camel@codeconstruct.com.au>
	 <CAPSyxFQ0DWMMAV87NUW-wmt8hudeK2PSDdgWCuiTbthDwAd=vw@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-05-15 at 17:41 +0800, Peter Yin wrote:
> Hi Andrew,
>      Thank you for your reply, Do you mean something like this?
> compatible =3D "facebook,harma-bmc", "facebook,minerva-bmc", "aspeed,ast2=
600";
>=20

Right. It removes the nebulous "common" concept that might be upset by
future changes.

Andrew
