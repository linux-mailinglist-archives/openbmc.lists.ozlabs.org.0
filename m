Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FBB9C8355
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 07:49:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XprNK3XT8z3bmY
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 17:49:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731566942;
	cv=none; b=BPpzA7TX8PQZI9WNVfoC0zzrnm288SOBxLg0neu4fyN9RyGjhrpjTDGpJWiJC82QnjYjaspR0Eu9DYPtVbsX76smTE/4eLKGwtWRcYg0WitBlUpwgprlig3V5xpWl+I7Fy5sEldhqksCDCish3qTpKb7DlPyZRe8TfdpsiqwjDMXqkYvlYOCzgiLjtxiAjPrCKRI3+706mejRU8RnKV1rafzx8VmdwX/SdxitVDUidxkV8ue52hWSqg2dNfvdSAgzYD8Jb5krzsUufDym0d2heugZ+TmsIMvK1mV2vDOPaQcB7HBBZJG33CITHdZlz/k79r0X47gyYD3Vx2xv4RMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731566942; c=relaxed/relaxed;
	bh=l3pxRJEbk5I8ElPJ0O4bm9PCHLIuDvWhbnu7via+PTg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ix9HUygtDRTzL3ARTF4d2Rg1ItpUWDijxAes6uDF6uLfTKBLZwailrQbU9imt2TAN1oEKyftB1VLFHCDqxnPFM9VC2MtxwioFxC1mtkSKxI957AjO9S3ACSjkyqyOPR03womZfFBrLL5INlS+2KirAaBjT1sShdn2FunwWNDP3/bVIrJBaezcw7EHWslR4hgiMGpfXa2m9TDtJlLO0ayu7vHaPqBdSiHT0cTPUHA2PGx5TiGX9ShYouhh3NximJLPdcDqXdiPE0KKMuctx0DGDMH6j3N8reCJEVq5m+i2sVvaJ+7PxYPITj2nITUHzAoJ3KYqB55TsSsq7eJ7q1VxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hXKtTdUZ; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hXKtTdUZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XprND5rzXz2yWK
	for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2024 17:49:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731566939;
	bh=l3pxRJEbk5I8ElPJ0O4bm9PCHLIuDvWhbnu7via+PTg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hXKtTdUZWdtvVoARYGY0z4X5BhBaa1m7gSu2BuHL/YfXE4mAZNPHgi68MQPTgU+n4
	 EIAJzb49mfBOZSz99mpl7lq8iMrSFfF7WH7BeVmV5kwoKNNHHSWP6iMN1mLM8E69jW
	 6cLZ4rL60jmO+UBllKClkXZHKf9Vtn+EJ4Kroz5lK7+A/QIxjG79q+3ROgE5cgd4g+
	 WzqEvBOXy1JDUaYbvnhZxyed/IOsfnc2YhQ8qlly0Q8mjWPdQ24L1W6a1d1Ao+Y2/b
	 /+TmptzT1Qla3wbdIsTpimhBxyAJz2WquN809zvCiLNNdPOuP7zttYaFXzUKglA5kY
	 /TImNCLqxcafA==
Received: from [172.16.160.229] (static-98.141.255.49.in-addr.VOCUS.net.au [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9A08966801;
	Thu, 14 Nov 2024 14:48:57 +0800 (AWST)
Message-ID: <42761fa6276dcfc64f961d25ff7a46b764d35851.camel@codeconstruct.com.au>
Subject: Re: [PATCH net-next] mctp i2c: notify user space on TX failure
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Jakub Kicinski <kuba@kernel.org>
Date: Thu, 14 Nov 2024 14:48:57 +0800
In-Reply-To: <20241113191909.10cf495e@kernel.org>
References: <20241108094206.2808293-1-zhangjian.3032@bytedance.com>
	 <20241113190920.0ceaddf2@kernel.org>
	 <da9b94909dcda3f0f7e48865e63d118c3be09a8d.camel@codeconstruct.com.au>
	 <20241113191909.10cf495e@kernel.org>
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Eric Dumazet <edumazet@google.com>, open list <linux-kernel@vger.kernel.org>, Jian Zhang <zhangjian.3032@bytedance.com>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jakub,


> routing isn't really my forte, TBH, what eats the error so that it
> doesn't come out of mctp_local_output() ? Do you use qdiscs on top
> of the MCTP devices?

There are no qdiscs involved at this stage, as we need to preserve
packet ordering in most cases. The route output functions will end up
in a dev_queue_xmit, so any tx error would have been decoupled from the
route output at that stage.

I'm happy to do the exploring myself if you don't have strong opinions
on an implementation.

Cheers,


Jeremy

