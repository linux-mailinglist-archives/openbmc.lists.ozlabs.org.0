Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344225A415
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 05:38:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh8mB1dhnzDqLh
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 13:38:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh8lM6pqWzDqL9
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 13:37:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=KjVSIlYj; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bh8lM3T1qz9sSJ;
 Wed,  2 Sep 2020 13:37:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1599017855; bh=cWyGWLvTSzzsGu81P+n7f3kI1Zi7owmkpVNxgNkcCcc=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=KjVSIlYjRZ+bHmhqbdBWIOvOCs5tcacDmPFXo71aG4E3YvDFpsanYBNISyOuPZ3AW
 gK58+GJwdY+hNTLpNxliAi5V5L6Ff/ORSfHcxtOhcokIMimoUb5CwhSrSi/W3aHzyl
 ANOF2I1A/XUyNk4Vnwulov+ZGYPuq2Qh+1Pk57uZXB2QgZljjFTRDvv+E4uw/5AIZ5
 a5INp0qcXBiVjaT85tPVQhwMX3G6/xUQI3t/kJ54tLbd7CwnShfxVQ6HO3VC8BeamZ
 xi6BFn/fd3WduO/2EN87NbMxfu7l7K4XWRf+1wLeKCUxAl4AKFaXx/d5tA0XlqcoIQ
 l0+PbzFvH4Rqw==
Message-ID: <049b5e60f57090d609eaf97e6c04b9bf3b1c0a9e.camel@ozlabs.org>
Subject: Re: eSPI in the OpenBMC
From: Jeremy Kerr <jk@ozlabs.org>
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Wed, 02 Sep 2020 11:37:31 +0800
In-Reply-To: <SN6PR17MB2558E77674E7ABC72B0970D8965F0@SN6PR17MB2558.namprd17.prod.outlook.com>
References: <SN6PR17MB2558E77674E7ABC72B0970D8965F0@SN6PR17MB2558.namprd17.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mahesh,

> Do we have the eSPI support in the BMC kernel? We are using
> ASPEED2500 as the BMC.  How do I check?  On the web I found a
> discussion in the year 2018 on the eSPI patch, but I could not find
> the final decision on whether it is included in the OpenBMC or not.
>  I am using the master branch a month old.  Could not find any traces
> of aspeed/espi related source code/patch.

As you've probably seen, there is a prototype driver for the ast2500
eSPI controller around, but it hasn't made it upstream:

https://lists.ozlabs.org/pipermail/openbmc/2018-February/010937.html  

In its current state, this seems to work for me, when communicating
with an Intel C6xx PCH. However, there were a few bits of feedback from
the last review, I assume they'd need to be addressed before
upstreaming.

Cheers,


Jeremy

