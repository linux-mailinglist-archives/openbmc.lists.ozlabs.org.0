Return-Path: <openbmc+bounces-422-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F5B1E0A3
	for <lists+openbmc@lfdr.de>; Fri,  8 Aug 2025 04:35:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byp6T1H8xz30WY;
	Fri,  8 Aug 2025 12:35:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754620529;
	cv=none; b=d4D9VRksCrcq+lHw4NGzjFxT5iGW6B3H4F8Ta25fyEh6+BUlEHXd7L/xYRZWg0CeGaRO+Ji0rKhzksuFX7oNLJaIDoN96153LZ3J39Xz4MrOBRV30DkIOIttwRXL1uSMdSLyOaP4iSs9VpQCr+F4U/ythvcH4pNL9s+zm06NYTnFxzFlk+sScoE/TOMGL7UehWNnc+ET3Zjvwhbhot9pn7qfXhmCFtLxa++KsrrMYafUsJ2lp86jzTlEQSxty4mzF/1d4XCr4GkfiIZrt4cMTGBUOZ0A7sJ9GSD0XvSeslswSkxFOQibGNTAKOqNiIZxrizTfFi8QPJOfSyW68qg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754620529; c=relaxed/relaxed;
	bh=K5ZhFWbTFPcYH8DJuX/GWWs0wxGOz+UdsNtJa0l6IfM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hBpLw24dFMkQMalZjnWjgl+Ip40lSq0+WqVgExdo3sHHHmD2NUs616pFGwXuuhWcVXjaANnCSTUsueWcpWtqtm0MASOWBYKYWaJCh2iFMCipBMME0YhM4KoT5rM9GxBe6CXGJ8DL5VbI7ZNKbaD2Srqs1LnSpPV98pjexuFaaClmy/s1kr99gwmWhmHAQdg/Jh65LScrpDlRD0LlkY27XXbUIoKr0+z9qYcILt7QjYBZRgjN03OtXx3wiwE2Vw2lzPFtdTe17hD64W0ixpwzq7CGARNweDrLClPjQDDUr2geowPh8UQuIMp6tvDth/G3PrE/ysTEYIeGbTdVeeQRPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=d0cwfPRK; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=d0cwfPRK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byp6S4gq9z2xcC
	for <openbmc@lists.ozlabs.org>; Fri,  8 Aug 2025 12:35:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754620528;
	bh=K5ZhFWbTFPcYH8DJuX/GWWs0wxGOz+UdsNtJa0l6IfM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=d0cwfPRKZkSPBB2qTNwKn0c7Fe1FW1yt2whzcz5lfrDnlR8P/5/LBsYLkydY2BcFQ
	 ngpSbp6WFq9B+IeDPocGUIwnRHMDH2HaSe77kpM0zl+TAkYsn+r/1/0kQSuT1x2xOC
	 +Jvbd0mpXLM0jamSYRtkLXyZiLK1chzOtHgHutTfEAZ/QNYYBapFDhB88KZ+02qaB1
	 U61PfJZ9duou/Jh8BXq/R1R0z6bVgeJklAOuezIfboF+zs660WvXeGhSx5Yanhn3dY
	 C6Kdyhl0miqQ3lNJlkl74HMvU7dMLFY62CSnLJR1LRaaZ1YiuA25K1KeysOPoODtJR
	 fb2aHIVAXB3KA==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C82246AF39;
	Fri,  8 Aug 2025 10:35:27 +0800 (AWST)
Message-ID: <b3c77e888624c2e1b2a6a6fc52d27d73e494b55d.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 1/2] hwmon: Add driver for MPS MPQ8785
 Synchronous Step-Down Converter
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Fred Chen <fredchen.openbmc@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Fri, 08 Aug 2025 12:05:27 +0930
In-Reply-To: <20250806121232.2331329-1-fredchen.openbmc@gmail.com>
References: <20250806121232.2331329-1-fredchen.openbmc@gmail.com>
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

On Wed, 2025-08-06 at 20:12 +0800, Fred Chen wrote:
> From: Charles Hsu <ythsu0511@gmail.com>
>=20
> Add support for mpq8785 device from Monolithic Power Systems, Inc.
> (MPS) vendor. This is synchronous step-down controller.
>=20
> Signed-off-by: Charles Hsu <ythsu0511@gmail.com>
> Link: https://lore.kernel.org/r/20240131074822.2962078-2-ythsu0511@gmail.=
com
> [groeck: probe_new --> probe; add MODULE_IMPORT_NS(PMBUS)]
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> (cherry picked from commit f20b4a931130cb574c40563cfda0fc2cb944b4df)

I'm not sure what you did here with the backported patches, because
trying to apply this series from the list lead to conflicts. However,
on the basis that there was no discussion of conflicts, I cherry-picked
back the changes as indicated by the commit IDs, which applied
successfully (though with auto-merge results).

Possibly it's differences in the tooling for patches vs existing
commits, but some discussion of your experiences would be helpful.

Did you try to apply your own series before sending it to the list?

Andrew

