Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D96744F8C
	for <lists+openbmc@lfdr.de>; Sun,  2 Jul 2023 20:01:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gp/DmLET;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvH1S6pTLz3bcH
	for <lists+openbmc@lfdr.de>; Mon,  3 Jul 2023 04:01:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gp/DmLET;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvH0q14Wnz2xr6
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2023 04:00:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E4BE60AE7;
	Sun,  2 Jul 2023 18:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB4BC433C8;
	Sun,  2 Jul 2023 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688320853;
	bh=nWMdhewcCr8kQfyliUKrjdyX4Mmui4mMV+udnfn61KU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gp/DmLETcmltx+eHfYPwXene/OAtWBThoccSUaekHH7XuEn+yOr2KB4VztuLHTuQh
	 eRwOz0D6wWtdEWG6TxlIcyHxCC6+s5ugEQbT/3dE5iElaqGiYH/SnLrO/ZZmbaSM1r
	 cgl0di7Hv8Q6t8O1ST/JmYx3Fr94+wsfBh3FcdHMxjAZjR+UpFU2Xe7aS33DRQEXN8
	 fBbEBjJS1QjLHiuYLwdGc/BdhGc2QRSq8i1xrGfWP2LajddBCQbtzejGhp2B/QCWxN
	 A24NxxD3tVClvWf1hPS9v7JKhjObFg5azGhU4AM+PkSuiZNKJfldWq3ShoYJ4V54ke
	 usbgLoX1QSvoA==
Message-ID: <c7ef44dd-419c-cb52-d9ce-734b578b27a9@kernel.org>
Date: Sun, 2 Jul 2023 20:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH linux dev-6.1 v1 1/2] dt-bindings: Add bindings for
 peci-npcm
To: Tomer Maimon <tmaimon77@gmail.com>
References: <20230628090404.234965-1-tmaimon77@gmail.com>
 <20230628090404.234965-2-tmaimon77@gmail.com>
 <815354f2-1503-4455-1e54-41978216d777@kernel.org>
 <CAP6Zq1gvAsTuyf9u0NNg7w-VcJ-EKmRnap9+=pxB2jm0ViZmTA@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CAP6Zq1gvAsTuyf9u0NNg7w-VcJ-EKmRnap9+=pxB2jm0ViZmTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, kfting <warp5tw@gmail.com>, Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 02/07/2023 16:14, Tomer Maimon wrote:
> Hi Krzysztof,
> 
> This patch sends to the OpenBMC Linux kernel and not to the Linux
> kernel vanilla upstream, this is why I added in the message dev-6.1
> and only send it to the OpenBMC mail list, please ignore it.
> https://github.com/openbmc/linux
> 

Sure, no problem. Sorry for the noise.

Best regards,
Krzysztof

