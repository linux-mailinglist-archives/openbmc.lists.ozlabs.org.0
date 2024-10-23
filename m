Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0EC9AD892
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2024 01:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYlvz6tDJz3c5J
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2024 10:42:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729726956;
	cv=none; b=K8nimaevVwIWQBsAN/fPfTtR0kDRc7b7p056iGPpyJzQVWuq98oOSOe5qv/JClF1Wq+aRXS2cV0ynd1687eDAiOE+4x76rJ10PvLGyeu8yI7pq9yG/R8u0ZnaWQNi0X9vxvLVAKf6dPuQCsLmvVijtCNBuBbx+jCTGj12K9ptWKrGixVlRPozzQCpzUkooDVotpwLQtstPjaJizHGsrt3IMVsxdN+CHZdStkazCXtX+AqZWz5YIVGwFrnhkrA96CQgTwzswLEQyvAGpCXnHo2x8gPeiH3g59zqcq5NlduFKOmOdKN581LTDQVCNF5B3Yjw5QKJFKlf2PO3hkqKOFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729726956; c=relaxed/relaxed;
	bh=BI6v3yvMOxexD3sSG5ohKly6PqVC6npk+POPlf5PUAE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gXXUXjAsQFDX0BqHMEJJZikdr+LAECSvzmP3aHsvx97L6Xox1elFkMYkEQh81cQ8T1N24glkJe/ycy/GT7c8xUyJn7Y9R8wWFqCyddWjUsNep5eL3Lucq2L6O280VfXlRQ3Cyev1BTVbkTngmUG6k6PqdOFDsdvP3CHE5zp+xkFyaEpgVKn3mnf9oJKahx45QYetF1CnDAxFVr276wMiD77E5iuTyMIEjx5cCLHt2VtfFdh5XjzovGEpU/hB//EITWHMep+WLPMtdXrvB3hfQVKIvxP78ypjFrc+gVNgo53Zo19wQQxAuPwDVNHT5vVIsN/svaP5KPdnb7uZmghCVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C6TuwGi+; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C6TuwGi+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYlvv1pMhz2y8d;
	Thu, 24 Oct 2024 10:42:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729726953;
	bh=BI6v3yvMOxexD3sSG5ohKly6PqVC6npk+POPlf5PUAE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=C6TuwGi+JuUDnThIMHcYfPM5VI3p40hN4IiRDyJfTzJUfUIeZt8tfLzWKK1QgMuD9
	 IdW88uxyoXan2U6yyhOcT+smXUXf7+v2s47kGuJ97r0Tn6zZFuLTGk7q5lqEZBaWdg
	 FGSUsg7UIHHz6cg4CvwE5q9KpIXPB8yKvzrSpf4XkNpSI1ToYFBQKyXF/f0Oss4rED
	 cxEO9uBgfoncQ9IRHEHCsoanag4T8x9/f9dovX7tcLULAphXD4Cp51ozAe59apxXPj
	 p5gHEc+LRApwAPvxJGx15Bl7kVrBAnErvsQh8q+VRMC0+iKP0olsOLHZY0xO8YrQOB
	 IGuOD3gCaJr3A==
Received: from [192.168.68.112] (ppp118-210-190-208.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.208])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 030B16494E;
	Thu, 24 Oct 2024 07:42:31 +0800 (AWST)
Message-ID: <f60e70982efbc3d1ea3379b0036b25c74f953411.camel@codeconstruct.com.au>
Subject: Re: [PATCH] pinctrl: aspeed-g6: Support drive-strength for GPIOF/G
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	joel@jms.id.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2024 10:12:16 +1030
In-Reply-To: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
References: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-10-23 at 18:44 +0800, Billy Tsai wrote:
> Add drive strength configuration support for GPIO F and G groups.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

