Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D565CEBC53
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:21:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746tC0KsszF3L3
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:21:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746sR15mgzF6T9
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:20:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="DERJh02y"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4746sQ4Nl6z9sP4;
 Fri,  1 Nov 2019 14:20:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1572578458; bh=5+y+myB40B/gVKIONv1zcJaH3+86QEv/mVBM/ktHmqs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=DERJh02y43i+zYtjKzsc4Pown4i2zdPnBM5EZj5rFvP3X+bEU+cCYLRTLlDBobQ4m
 BdhMCnrgtxGGIKeL2Eb0BBVUTvCM3KzA8v8FoahCZQ13mGTKJhnwETZZ6GavVqZlmQ
 jtgITWcAZLkcpcrTQjsI5pczafvF5mvJX3KD8C45O/JrEO/rIt2BkxfUsLxfK2UCMA
 w0ZROIW+w/s27WWLPyCX5dEbxJATKDAVERuM2tdot+lQF+flnDWjyswGU/E4gC6N7J
 QxF9DgtqrEbyXmfwqSAANw/feahJmuGOAfvP7mBiEtbHcvSPq3L/lBoGSzntlCJvum
 1Wk9k/w7S740Q==
Message-ID: <876e577ef3516280334cd83b7ead45e49d2cd986.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 v2 6/8] fsi: aspeed: Fix link enable
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 01 Nov 2019 11:20:58 +0800
In-Reply-To: <20191031053625.422-7-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-7-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

> Link enable was saving the value of the write to result, which was
> not checked. It should either have been ignoring the result of the
> write, or erroring out if it failed. This chose to error out.

The fix looks good, but should we do this before the introduction of the
readl/writel changes?

Also, it looks like the previous code using both 'reg' and 'ret' as
variable names might be a path to future confusion, maybe we should
avoid that.

Cheers,


Jeremy

