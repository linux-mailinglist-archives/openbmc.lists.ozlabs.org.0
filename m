Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BF4A8B2D5
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 09:59:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcthH3mRdz3cPp
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 17:58:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744790332;
	cv=none; b=irzXjhWZq95jG9LucS4o+yeHUqaIzvFgAo7v2koxHK1+0UK90HGMxujZLMm6jRVBwDHKl27hN4zciyyCMxbUGJW0T7apsfMB48WZDidM9xXHogeu+wETW2gGcfpxDrdgsLYwsDWoueBQwUhHeW5xNG9RlCwKUHcHdn2T90vPCmy6S7JmM/+cfl65KVVY35nAjrMmaQv1+04mEbv+K6CSF7p8el4vz56uvJaN3CfVK3Z79jXORRU2zdJMpzbn5ZBDPM4QAE1E+R5PaHsLDXlRO1qnobFPD63cWSWn/gnwkiwkna9zh47KFAWhesbw51oZgetprEsQcDVVa/+FSRwhng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744790332; c=relaxed/relaxed;
	bh=xoWHXtften/lUbiJBml2hBCsuMZ21wIlk4QxBfXkS3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lmz8tvsL5n9PBP3cSbL4i5oFSqI58DGNYUQqpDQqZ3cYigk7M5MHhpMeiM92zrjcPotj6FzCMWDjnrDeXZ75jrI2ZyIvsAnsrC/NQFkqjy4JmhXqFlZ5QHrkFpAYgJC1nypF2Eyw7cxLdE3HSTTIJKBmMfi0EkAfIwQ40l/d8znq6vXFoPFelbU6Tu5CsQLnyWPe/4YmTbskITOUyeinn8mgb/oxzozPj70dsBwzmMNTxM+Mg6qcMwTocVQznX3ceV8K0//E2bnSkoIgs87YO6Y9cI6D+ms/vMvEeS0oBf0iUsvnCeGez00F4/DqmwrOiKPGt68yRHcOJK+04/9Whw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=JbKawVCg; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=JbKawVCg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcthB3m1xz2xqG
	for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 17:58:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xoWHXtften/lUbiJBml2hBCsuMZ21wIlk4QxBfXkS3s=; b=JbKawVCgPm2re7jfhUtUt73G74
	tXPzSu7vBAi/lpfKvoTqvBuTnY76PG1u0KigAwwwYbd0M6m7/KecLK1/21GlLJOIbiBP3Y2IYTMoI
	qoV94/bRmruE7Y9qoSbJ7VELrIIWWknHuIITaWnzbEqI34drIGV7sk0QkU8FDF3gHKGkQ/DGPcD51
	YGNqiadPiGl73aueuB3ZJiIVR+TUxW1iYKDc125n1OjsVhX305RI6P3fVsh3Y9dUbPdNNIurCtSIV
	LhMHUTzGtVur/QSSCecJSnC0ENsWkqHZ9z3cPrhtjqATW0tv5gc+QPampD0aZ0jY6O3uFqeZ3tqIU
	rnJC7fzw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u4xf2-00G7tZ-2s;
	Wed, 16 Apr 2025 15:58:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Apr 2025 15:58:20 +0800
Date: Wed, 16 Apr 2025 15:58:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 0/3] Use a local device pointer for hwrng drivers
 instead of casting constantly
Message-ID: <Z_9jHLmgaG7wjAhT@gondor.apana.org.au>
References: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, openbmc@lists.ozlabs.org, Sean Wang <sean.wang@mediatek.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Tali Perry <tali.perry1@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, linux-crypto@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 10, 2025 at 06:22:36PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> Clean up random number reading by storing struct device pointer to device
> context struct. The changes are very similar in all three drivers.
> 
> since v2:
> 
> - Add a struct device pointer field to device context structs, don't use
>   struct hwrgn priv field for the purpose anymore.
> 
> Sakari Ailus (3):
>   hwrng: atmel - Add struct device pointer to device context struct
>   hwrng: mtk - Add struct device pointer to device context struct
>   hwrng: npcm - Add struct device pointer to device context struct
> 
>  drivers/char/hw_random/atmel-rng.c | 11 ++++++-----
>  drivers/char/hw_random/mtk-rng.c   |  9 +++++----
>  drivers/char/hw_random/npcm-rng.c  |  9 +++++----
>  3 files changed, 16 insertions(+), 13 deletions(-)
> 
> -- 
> 2.39.5

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
