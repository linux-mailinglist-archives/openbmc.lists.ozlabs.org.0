Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC0B9C49F4
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2024 00:44:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnR3j60sHz3bgx
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2024 10:44:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731368686;
	cv=none; b=JsD7UOErK2Otdt8Ip3kDeRxjzuYx3f46amOMMxkZPJ8UdsPDvF98XK1vz/5wzq6nhniZzuq9REz2vOYJhW+h1bJylEH+WqFauaepUSpUx6N5LRcCmMOSJXEkyXV7+obzDxR9MGCKL6VK8BqKgIdvQdRoM6PB0Jx4hGKda32nGTCVMfBUHKpU2DzihCKxgs6yEzkG9YLcDg6uoMvAHgLJ3x0woJakorjUZaTx1VtU3GkCtHZrVShJqNqRoIv8ocSY24YdK7FYfmssImUGl5XmEaRg4UV9XC86k7ZL3rSCtZUaI+pVD08Qjx8WhmRslBrU25qHhRHp0zWU/uaZnEw0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731368686; c=relaxed/relaxed;
	bh=HNS2E7az+Jaci4XovebpTPUnBWAIfINok64yMQczmas=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f72/EFlf7CHQoxMLLuUz17p1iWCcXgJ4f2zeGz2Zce42rpMzPqKd7FJ2/7cacU2T5skupX9uBX6KFp6JExOwsdwn+sL0hL+l0wveyK6IGx2V8YL9Z8BZD1/F/kUsEuKFW4QgE+VuUJ5EthNXnlpZJ88VBsJS+vkrQ2PE8sl2UIvITVP9tn0rab1YiEt5oBqKccdDnvwOse8c1X504P2EhDUXe1d+9U3q7+9+i+2HsZ3MPEdFGFwiSV5dDhyrOdJ842Y3vtgfBd1tjONdJJtAu1ZmOmZf4B38LnUd/z3vew6nBu6jCNV2R0nzVVuam0CCrLggps5hBbyUAmMy1Hr/tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fagZ1Uyq; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fagZ1Uyq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnR3d3c33z2y1W;
	Tue, 12 Nov 2024 10:44:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731368682;
	bh=HNS2E7az+Jaci4XovebpTPUnBWAIfINok64yMQczmas=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fagZ1UyqZw1/N50if/vQZLtnLaK3ln1MmlUv3Doq0riO2D2dQX5OxebOos98QQNHD
	 rvj5ZSDctgCE+W+cV4p2XSF04Eq28eVLhoqXjEH7mTpEnr04daecKMy+pkxKl4ciEF
	 tSeUrCkLxTdB26geLvM2hAx4DQrkgYyjp8iLyyRRvlcUrpoga3WClJd8WukQRntxHq
	 4gPqsSMAA7MJKszP7C+a+RH1KT0KyWbAWn4+Z7/5d1ihB25g6YWa6BZ4KxPQhs2KLI
	 FJwQAF8wkZD7J6WUyKAZhUFb9Yme3nUUm0jlD+mEKtrWe4zN1jioQt/zVcb6n0N0rP
	 J4pKkogAUYTxQ==
Received: from [192.168.68.112] (ppp118-210-164-236.adl-adc-lon-bras34.tpg.internode.on.net [118.210.164.236])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 61E676616C;
	Tue, 12 Nov 2024 07:44:41 +0800 (AWST)
Message-ID: <e6cdf774e4a5a59fbce798b05e6f57b11c62f56f.camel@codeconstruct.com.au>
Subject: Re: Pruning obsolete BMC devicetrees
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andrew Geissler <geissonator@gmail.com>, openbmc
 <openbmc@lists.ozlabs.org>,  Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Nov 2024 10:14:38 +1030
In-Reply-To: <c96c7e05-31ca-4145-a8ed-d74a32770011@gmail.com>
References: 	<b386a9e98412b06b6186ee5dea81ac6a69bc4f8b.camel@codeconstruct.com.au>
	 <c96c7e05-31ca-4145-a8ed-d74a32770011@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello!

On Mon, 2024-11-11 at 11:25 -0600, Andrew Geissler wrote:
>=20
> On 11/10/2024 10:49 PM, Andrew Jeffery wrote:
> > Hi all, We now have quite a collection of BMC-related devicetrees=20
> > upstream. There's interest in whether we can prune some of them
> > out.
> Thanks for doing this AndrewJ, it's always good to keep things
> cleaned up.
>=20
> > 2018-06-22 876c5d891c9d7442d2734871317bc6480cd9f80e:=20
> > aspeed-bmc-opp-palmetto.dts=20
> I think we're ready to call it good on Palmetto and remove it. I'd
> like=20
> to also remove it from our CI job.

Hmm, so unfortunately for Palmetto it's one of the primary ways to test
AST2400 stuff. Even if we retire it from OpenBMC CI it still has its
imprint in other open source projects such as QEMU. The AST2400 is
still used in some other products such as the Delta AHE50DC; it's
useful to keep things around that can exercise it.

>=20
> > 2019-12-03 53820e00aaa173db268e0288d0407806539b4c3e:=20
> > aspeed-bmc-opp-swift.dts
> Swift can also be removed.

Ack.

> > 2020-03-06 fa09a28ca3e966582d6d92ef1536de360c8b194b:=20
> > aspeed-bmc-opp-zaius.dts
> Unless someone from google disagrees, I would like to also remove
> Zaius=20
> from CI.

I'll wait for some other confirmation on this one.

>=20
> > 2024-08-02 1c8b6faf882de15fd62094e08b2ca5bf7870b767:=20
> > aspeed-bmc-opp-tacoma.dts
> Tacoma can also be removed.

Ack.

Thanks for the response!

Andrew
