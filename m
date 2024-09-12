Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A792975F52
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 04:55:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X429z2ct4z3c89
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 12:55:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726109731;
	cv=none; b=EZusPWW7zPZTsqJd+EEVI7Z6OO/XVGe4XVxVQcoZpXUZwSAsZcufRhF9omCxG1eAwyODiOBDKuSiu6RNiOGqk69fQ4mw+On6uRt6yLDZjgO/0I2dAjTQOSofamSYhJdgNoUUqdjBOgwHwBuQiRgaRelCjg3vw82fF1n9CaFSGBNZQVaK83OqxqZHfh9W8MGzBEdfISkY/HWfzBdp5aoKajWrucWULq1/FRYomsACFygjQKz9BgTakh5d+rkAfCfJT+jZW7NzJhMkonYJ5Wpfhcl+5Q0HWu/IZr8BC718d0/pGIdfqxCBm7aQemmhObax4LYXRd9mXHRwfEU2I8T0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726109731; c=relaxed/relaxed;
	bh=al0zt2bfLqlCCxYcPYUdcYnrKdSY44yAh+o6taRnru0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ewdhrFtwYA0MCQ0UiVuApX5NCzuwCu6V2HyIZswPTl6ExP0XdzDuBIkJ4Q+6TOFNpii8gYwR6PXgWgCr34DVfERHpQyoOH2SlHC8Uj8OWCBhMpocEoCy+KAoYIMO/rXh0HUBuUqRSYHqwU4RvE+46EVO2BqSSNmnjZCvmf0FzRFSu53jknInD46oBvSW4pptuUp9hrZWIl7TjJUFHVeawuYzZnyalX5c16enBzuaa+4KId/oNuyr79+cc2hq/sw/AbolOyNToqnWWyee85gKUWScNMmIOkmoYzrpG3uKCDFTMOH1y4PQLshkyE2OWs3xTXwSZIz3dlqHN35BmzD01A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L4Sdlhgy; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L4Sdlhgy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X429v5RWPz2xy7
	for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2024 12:55:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726109731;
	bh=al0zt2bfLqlCCxYcPYUdcYnrKdSY44yAh+o6taRnru0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L4SdlhgyFYEoCFm++9mX1Jrl5YnTTrYLb+x4WYHtydeLN3QZSti42UWDmXZYFMdRe
	 UItvhzmeOjw+twGrxD3i2LhD/zdLu8QWYcPR9OjXeqaDcdjJg+Nr5bqdzk2UVxMloG
	 CopvqjSZBxq6gaZe7izwlnNJxAek9nlhi4HOPgz+NGwvOQMZt3u4VhXM/qY4c824Lx
	 32dii/MFMAkFzdStS1uRppEC+V5GotW4lIT2+7of39VEbCp02NLtdlcgqqhc/XTx9y
	 P8XuNkWnzrYlVYOJQ55bUctT9LhHkKC+R3bzIWmQtccBp9fSXv4wTg3MVss3+x+hDR
	 JTAuovdiVjj+Q==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F26AA650D6;
	Thu, 12 Sep 2024 10:55:30 +0800 (AWST)
Message-ID: <14e1a0f581417d4228aea8c2569598d42b4bd334.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Harma: revise sgpio line name
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>
Date: Thu, 12 Sep 2024 12:25:30 +0930
In-Reply-To: <20240909080459.3457853-3-peteryin.openbmc@gmail.com>
References: <20240909080459.3457853-1-peteryin.openbmc@gmail.com>
	 <20240909080459.3457853-3-peteryin.openbmc@gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-09-09 at 16:04 +0800, Peter Yin wrote:
> power-card-enable
> power-fault-n
> power-hsc-good
> power-chassis-good
>=20
> asic0-card-type-detection0-n
> asic0-card-type-detection1-n
> asic0-card-type-detection2-n
> presence-cmm
>=20
> uart-switch-button
> uart-switch-lsb
> uart-switch-msb
>=20
> reset-control-cmos-clear
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>

This patch does not cleanly apply to openbmc/linux dev-6.6. If you need
it backported can you please sort out either the dependencies or the
conflicts and send an explicit backport series to
openbmc@lists.ozlabs.org ?

Andrew

