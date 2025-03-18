Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91993A6654F
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 02:41:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGvgs73Mtz3c86
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 12:41:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742262070;
	cv=none; b=Gq8/JH0DjPaHoFFE7K/l5PME+bEey8kuRApFJsA2fScaXNShTvwtXd4bwjms3MxOkPH2Hsx9Q5WD2A3Ri+LgXLjrFJPbHcXv3ItQutMXl27Kuewu7Jl/w5o+1CgbTf/TkTtkBU8XKcdGW6qAqFpfN9DRwGFEm1BkFh+Ape+rxXe6mHjb/2L2rG8kftML54tK7CY9Eh8uH4s/m6VVcNDTT5g4GwmExbvkraH83VFZMucm/jUR2JbEhl4PRU6A7NZ5BbXTWgDiQaRWXCWJA0nZBapQl6AEu/Y2d6zPqjuCUalY/dbT7FWMV5IPdhGR8Q9HUmTkmk/4Imy9/pfBrAdIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742262070; c=relaxed/relaxed;
	bh=C3iS+bKHIqFbbxV+xUKgj3w8rDov70a93iZSUrHrWyI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OO7bDVJeS1B2yK25TEwC6I1y4iPn5cCuL4D4Wgs6nlGqcC6CZUzB5NlGziTBKrAPEIelDLz9gtyRDTORP/QvVuSeAGBfQWTJI169ox8mLyMIoieosIVk/+B8rP4t+qjQQtAgErnbzSQOdJ9pqXXu+7heRfpYwVYoVJAS9ARklkoLIHpLhjon3gpsulwp7Mlpc6mGMm9hWCv+cdmRB1/36rs3p7NPnRp//j76SR22qOuad3+XZPQvfU/h7e2HVxR1bZHvATNho1ST4rLt2VFeiiD8/cT5XF/VXBS6odlmqQsT6UAvWhB2fh8PKaV6iFZ9GTTg+r4usaqO9o4eCHthJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=E8pnouG/; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=E8pnouG/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGvgl3YCbz2ybR
	for <openbmc@lists.ozlabs.org>; Tue, 18 Mar 2025 12:41:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742262066;
	bh=C3iS+bKHIqFbbxV+xUKgj3w8rDov70a93iZSUrHrWyI=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=E8pnouG/vXRIZkM5NHy1MPTVVrYqeZmhl+vYtAIlz56LqrJ2cZ3YOJj826vspFIW3
	 8PYQBYltcWuPAseKuojFgPe0zbm7gL23e0yJzQo7VY/ESn25Le6SjOZeJ/6E/M4GiA
	 p9Ta9wDg/yjhAoDiPDZVd+4afcyDcpJupTxGbSRNg2ERLiCgPvnoe2AOS0xqBb7+XG
	 IhYA7i4Mban5JeXN4SGrE7AYF44YCH/J5J13xI+855BiMdzqUDgBRtymfaCn/1vPHc
	 w0vGQdQYSlt5gsXLJHKFCKrLV6mrLnYkaPRfu6/IN0Ds8niv10qUxB/xDRpSxCY2pd
	 vjaD6fLMy80Yg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A899E77BB4;
	Tue, 18 Mar 2025 09:41:06 +0800 (AWST)
Message-ID: <cb64adb4f3757178e4e85a106672c1a3b637d90d.camel@codeconstruct.com.au>
Subject: Re: [linux,dev-6.6 0/4] Align Meta(Facebook) Harma BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Tue, 18 Mar 2025 12:11:05 +1030
In-Reply-To: <20250312101250.3238182-1-peteryin.openbmc@gmail.com>
References: <20250312101250.3238182-1-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

On Wed, 2025-03-12 at 18:12 +0800, Peter Yin wrote:
> Summary:
> Align linux device tree entry related to Meta(Facebook) Harma
> specific devices connected to BMC(AST2600) SoC.
>=20
> Link:
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspee
> d/aspeed-bmc-facebook-harma.dts
>=20
> Peter Yin (4):
> =C2=A0 ARM: dts: aspeed: Harma: Revise node name
> =C2=A0 ARM: dts: aspeed: Harma: Add retimer device
> =C2=A0 ARM: dts: aspeed: Harma: Modify GPIO line name
> =C2=A0 ARM: dts: aspeed: Harma: update sgpio line name


Hmm, I'm trying and failing to remember why these weren't picked up in
dev-6.6. Do you recall?

Andrew
