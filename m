Return-Path: <openbmc+bounces-238-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F4DADE153
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 04:51:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMStx32HFz30T3;
	Wed, 18 Jun 2025 12:51:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750215113;
	cv=none; b=eB5wxTttHtMSWZQP0V+IfD/g/kS3dUfkyge/rhCKm7NC7itSTw9u5tDeti9fZmTKHdcREWey+RsQhI93rM4esdrUtpGCntOy2nOI/X5nmq7cKP1+r8xvNct5M7agvE1bqEkrA98zSknJ14ooRa/4a5oqxOom0z0jV79dFlJO/GpyA/pFb+v59PdZBr3Bqkr7VGglIqEmtrCgd/tMFDCT5yilkLt8ygq6Zapj/tLb7PBFJgRIMBbKFpgjro6wOZeJq4enIzs6GOJgjRfX2ntRywizp0KA5RtHwGUJ2WAHxD1cVGPt65OcR2BSb2FDOHst1tZ2TN1M+1l/XbCji6fDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750215113; c=relaxed/relaxed;
	bh=D1AwwVl5J34oJoBmS9eZWUT+dg5sJUr6+s7pSO+AbC4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jyq3fLU2s7wgEjvGv05KCE18Y4oWcOsxkiSjgOuCUFGzsBjrp3purC02zTrgtanW/kng+haICCFriAL0weqcujmbu/+l12/VXQzSSlmfEidB/7Bw+bl+W0j6rR0pqdu1s0/lW3CKyn+pwtVL8ukXt7tGYPWm19BaKVYW3YPMsIOQMp5ZykeLEGuiZMQ8wxPQd/FgcQBVlP3/A6/h7rvaYVsYOXDBt1BowijJHhPg64Jyg0l+K387YZg/87JuXtte20EKU+kIBC4M9KR8RZVI5SOLBc/QuvSKvZVq8Ms+lL8IPvZeLtsZ+GYiKXNUv/r1es8vrYDBazKc3xTpoq94Cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VHF/CZyz; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VHF/CZyz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMStw6SMdz30RJ;
	Wed, 18 Jun 2025 12:51:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750215112;
	bh=D1AwwVl5J34oJoBmS9eZWUT+dg5sJUr6+s7pSO+AbC4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=VHF/CZyzUlu1fWRJQyr6aBvgr+jSpBFyJ6XNTq/nNjBJSHXOnL9vcWJBoeuYLAsed
	 e8VqQeS8Y3yPl2+PHmPu5a58y3mtZ//ultIggqnNgLlp8x3HDLwbwPYKNpJbRnrdVL
	 oAo8rTJlt16aqFsXrqau31rwx9KDX9Lc/ji+0BkZB6Ak7ggCx6Q4CVVNOID99L38B3
	 Ud92uuywCuBgjB+zf5CVuCRaBZb0h0DK9+9KaTVQONynupPDFDJYDMay3oS21v9Cd5
	 3KFEMFLu+ktnLxwrtJpDaU9B1Zy91QEDqb6kNXrM/MImnxeeVdxQbjiQxl54I3ca64
	 fpRkdJlMCs0nQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 91D13640A0;
	Wed, 18 Jun 2025 10:51:51 +0800 (AWST)
Message-ID: <eaba29c18db8883f88e5e105f905a735a0087a3d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 6/8] mmc: sdhci-of-aspeed: Add output timing phase tuning
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:21:51 +0930
In-Reply-To: <20250615035803.3752235-7-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-7-cool_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 2025-06-15 at 11:58 +0800, Cool Lee wrote:
> Enhance auto tuning with input and output calibration.
>=20

Might be best to squash this into the patch with input phase tuning?
Why split it?

Andrew


