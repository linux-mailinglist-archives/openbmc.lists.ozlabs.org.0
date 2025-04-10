Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F83A83C24
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 10:11:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYCFM00Vqz3cVj
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 18:11:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744272675;
	cv=none; b=KRvfDo+ggYRNAIq1UO6jZonzKMGlKcH7WSV0Yb9VqsGpMTs3dDZBRDT+uZFN8dZ0IG9RSbZF1CaYRujDSPWqww35MQY0SOgUc61r91ow0N8y5uRGEQF1oEXNqSkoTaVumVh4SjuAf0VT1SeNz2ji/Smb1DI4Car4cDvenY/PVEq26nbvPLFv5SuTYHZBvzdHM8DkNx2HbZur3NltX0Otx/bOEf3ON3khWnKUL/oxqbp/SFagpC5nc/KBy7CB5cPndiHIj6f+Wf8GlF0OKrxcsCopwGYycDe0adrXsR20cLqZ9vfC0PRNUxbHqPNPDgSRxWOQFkkQ+bCpxqjAMVOYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744272675; c=relaxed/relaxed;
	bh=+PIpMAWLwgP8XaU0st9wLlONfCFrdoYGt6FMJeS8v+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCFhYt/M0+VNkJcuResgXrRjuVbtgGJ8/mnRo1+x4aujE68NzzNCfDz5BZKi3cwDIj7SNoSK1mZ+7yr1+926zy310PF7+EP9JzsYPeWKAC7tQovn/i9GrppRqsffd+n6RvnBKbzKxnvKI318QO6B4cg6krSR3y5zCbi34NnKRuwbkq8xnfxwfCSACGLf54ZRyrTEy/vrV4ta0y+vvUvAr+elDDviY/PxsrHC7LP8hpZ16u4RHOCRWXRrBNL8oVlIUqxILSQ7YxI0N6BxvQZvfnl7NsFktKpSc0wO7cG8h0/rURme8BsnxK36Il3vdnkP0sEb/9EtnpUh5+P33ai0Tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=gCiNLKM6; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=gCiNLKM6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 1668 seconds by postgrey-1.37 at boromir; Thu, 10 Apr 2025 18:11:12 AEST
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYCFD4cphz2ydx
	for <openbmc@lists.ozlabs.org>; Thu, 10 Apr 2025 18:11:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+PIpMAWLwgP8XaU0st9wLlONfCFrdoYGt6FMJeS8v+4=; b=gCiNLKM6JXpltYkDzBoePum/5Q
	NNGKz53YHexTDwmBP3666sm6fjXb7mODxZKmzdrXB7rh3fCSavsI0pYGHqhPqY7xXthP+3K8YonYC
	nP2x0M+dr3sZkvrOaThucm4eTUHWdSJbqslO6Z2WHKonn/LetaCUfBQ3hL8du9vCbW8xrhd37nzQ6
	cUo18LZ4GB00oKVkNcsYAdmHICRPYg2AVp2lP/J7OjC7u80aIkbByWMGvTfTt1QlLSlHficnm+5uq
	KL+PWNnO6m/C5QI+XL969S3tSXhMTbuMNEQGLbeQTVMoJKlS7O8X0Dhby3k+py86iKTYR3YgFhrVE
	gczaKq4g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u2mYn-00ESnF-35;
	Thu, 10 Apr 2025 15:42:55 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 10 Apr 2025 15:42:53 +0800
Date: Thu, 10 Apr 2025 15:42:53 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/3] hwrng: atmel - Add a local variable for struct
 device pointer
Message-ID: <Z_d2fcuWPiel_OnT@gondor.apana.org.au>
References: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
 <20250410070623.3676647-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410070623.3676647-2-sakari.ailus@linux.intel.com>
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

On Thu, Apr 10, 2025 at 10:06:21AM +0300, Sakari Ailus wrote:
> Add a local variable for a struct device pointer instead of obtaining the
> hwrng priv field and casting it as a struct device pointer whenever it's
> needed.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/char/hw_random/atmel-rng.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
> index 143406bc6939..5192c39ebaeb 100644
> --- a/drivers/char/hw_random/atmel-rng.c
> +++ b/drivers/char/hw_random/atmel-rng.c
> @@ -56,12 +56,13 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
>  			   bool wait)
>  {
>  	struct atmel_trng *trng = container_of(rng, struct atmel_trng, rng);
> +	struct device *dev = (struct device *)trng->rng.priv;

Please stop using the priv field and instead add a struct device
pointer to struct atmel_trng.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
