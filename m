Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE3175FA03
	for <lists+openbmc@lfdr.de>; Mon, 24 Jul 2023 16:39:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hN+++GJp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8jTg5D6kz3039
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 00:39:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hN+++GJp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=wclc=dk=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8jT40dYHz2xFl
	for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2023 00:38:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71E4861189;
	Mon, 24 Jul 2023 14:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A3BC433C9;
	Mon, 24 Jul 2023 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690209508;
	bh=q5XSmErCVSZxyDmcAFCkhWahZ0qklghV8X9OwziX6tY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hN+++GJpYAuwQ2ni6SN01594EvsSbS2eKPy2ZLIHAWrQtA9r7gGCHL3GNfeUOnowP
	 Q0pvhNdjyGJjblSdVsglbRahuJxMeh1HyP0cTZJPhGWtSaTTUEN9k60clAQlrKM/a1
	 UhYp1iXMUmIZ8ZNQjCo4k0u26tdoLS5fRjGyoGvWhilNc65NxbFryrR3T6dLmldAwL
	 rEx6DXQJjmSio8l3H6mlTt9XnG7K85oyTRofm6m69wfzKb3Jyyz+prtsGd1XQtndqY
	 +E3BV2+PkZUXnHxmoo/sTCgNjnbMqDwRd7sOAELhNp51Kq5U9Eyi1tDSRXd8N8LuGo
	 cmg7xSiLsXTxA==
Received: (nullmailer pid 3442213 invoked by uid 1000);
	Mon, 24 Jul 2023 14:38:26 -0000
Date: Mon, 24 Jul 2023 08:38:26 -0600
From: Rob Herring <robh@kernel.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add bindings for peci-npcm
Message-ID: <20230724143826.GA3433528-robh@kernel.org>
References: <20230719220853.1029316-1-iwona.winiarska@intel.com>
 <20230719220853.1029316-2-iwona.winiarska@intel.com>
 <69fa21b4-3197-d5f1-f300-d070cf5e7fda@linaro.org>
 <6ce71c01371aefa818375d6e07b3efb8e747c86a.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ce71c01371aefa818375d6e07b3efb8e747c86a.camel@intel.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "Fair, Benjamin" <benjaminfair@google.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "venture@google.com" <venture@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, "warp5tw@gmail.com" <warp5tw@gmail.com>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 20, 2023 at 08:03:28AM +0000, Winiarska, Iwona wrote:
> On Thu, 2023-07-20 at 08:18 +0200, Krzysztof Kozlowski wrote:
> > On 20/07/2023 00:08, Iwona Winiarska wrote:
> > > From: Tomer Maimon <tmaimon77@gmail.com>
> > > 
> > > Add device tree bindings for the peci-npcm controller driver.
> > > 
> > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > Signed-off-by: Tyrone Ting <warp5tw@gmail.com>
> > > Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> > > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> > > ---
> > 
> > No changes from previous versions? Nothing improved?
> 
> This is the first submission.

13th by my count.

https://lore.kernel.org/all/20230616193450.413366-2-iwona.winiarska@intel.com/
https://lore.kernel.org/all/20191211194624.2872-8-jae.hyun.yoo@linux.intel.com/
