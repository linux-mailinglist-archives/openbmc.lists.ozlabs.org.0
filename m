Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D48F0A79B9D
	for <lists+openbmc@lfdr.de>; Thu,  3 Apr 2025 07:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZSrZs3Tvmz3c9j
	for <lists+openbmc@lfdr.de>; Thu,  3 Apr 2025 16:56:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743659778;
	cv=none; b=bL7CO+3UTwqJhexRN1ydbfRAOLC/BPMUWWGWLHLMnVpW2Yn96NcWcPRYkctgr57junT1veQmirbDy0aucQGLfxIZ1+hqgqhaXs2GbvHrb4xdNN72k3I5JkMRx0Xsh+EdMzNaw5dSsr3gdaV7oIqP/f9WYi6EPGwEFNe2NhDrbT4MFgzpDLH9mn1l23zyw2P2H+0yrqk9pEq9izZqCRJe6BG0eCWgH6x47dU3hqESXDbqAfCfSV+hz/n+YS2b7TOJ3lMh6gBegE+mREa0Jad5faz7SAsy8v6uujF+p451xN0bgbASHJ7FR+/0tTXfaH6dSbgyFa8IeWTSmRxU3sxlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743659778; c=relaxed/relaxed;
	bh=e+hB6TfsNEWsOBfPe7+0Du59DxYe84XYO03aEf1oq2w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nJWtwA8+CNz62UC9qxUBCW4d3jDDJz5NkZMJElSvrc0krVGKHrErPD/rZTut++hHL3mhMvY4gNE7MwGTJnJ3f0uLpYUi3Irh+rT0c5HrJqE/h2MVWjH+s7nPp+7gF2zKl91mDuUNFHgpjJDsUKaF5j0tvJtqzRKN/2K4B3D2kADVFr1MmEvFtoHAeTFw1GyZ5+3nbL/nVcdDTJNzSaWu3B7S0+fTkFVYEbS6crx3o+v9Z+kEmVww7owTDBusL16EdwR0ATvDFw0GNiazgYn8KZpmFrdvUwkEntapmJMn0QBWAZmFBKEOOycheYyb7jIB88NvQLQWCfO54Urbcl0msg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YeCqwMTk; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YeCqwMTk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZSrZn20wLz2xQ5;
	Thu,  3 Apr 2025 16:56:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743659775;
	bh=e+hB6TfsNEWsOBfPe7+0Du59DxYe84XYO03aEf1oq2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YeCqwMTkAaEXEzG3fK/V5nJFzmxl3eQwO96YkjdDajs7/4XBWpWWkpkVQreFkpou1
	 nVMQFT9n7e2USYGg8wPzyjE3Z6I+DQ67V6uubhy/NZ1HPGIEvUJ3e2trugUKOj0z+J
	 SbR4yaIks8jZJI7qZ4qENCQG1aLlcO/Jug21dgd/emU8StBtjUuCeRcj6N38rqK4EQ
	 7BOPvqng/pk6T5qmR3zdUTwCuSdj330tEgtjfGzM/ajK02F+g615g7YpTVMG3jP9Sd
	 HB40N5nrMRjJM21CtMtB0gdfFlpL7fYPvP13O0kKRL8B4X/aILvW8g+iqpeJG+yzm+
	 GofwYelTCS5NQ==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60B3C7B352;
	Thu,  3 Apr 2025 13:56:12 +0800 (AWST)
Message-ID: <ca1f5dc3d0dd53dfe6abd9d6bea98838980f0840.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Nvidia's GB200NVL
 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Willie Thai <wthai@nvidia.com>, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Thu, 03 Apr 2025 16:26:11 +1030
In-Reply-To: <f563b33e-f552-4a3c-bb45-6b7add876fdd@kernel.org>
References: <20250401153955.314860-1-wthai@nvidia.com>
	 <20250401153955.314860-2-wthai@nvidia.com>
	 <f563b33e-f552-4a3c-bb45-6b7add876fdd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
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
Cc: tingkaic@nvidia.com, dkodihalli@nvidia.com, leohu@nvidia.com, Mars Yang <maryang@nvidia.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2025-04-01 at 17:51 +0200, Krzysztof Kozlowski wrote:
> On 01/04/2025 17:39, Willie Thai wrote:
> > Add Nvidia's=C2=A0 GB200NVL BMC board compatible.
> >=20
> > Co-developed-by: Mars Yang <maryang@nvidia.com>
> > Signed-off-by: Mars Yang <maryang@nvidia.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20
> Why are you faking tags/email addresses? Read carefully submitting
> patches. I really suggest using b4 instead of manually editing
> things.
> And if you decide for manual way, you must never, *never* edit
> people's
> tag. You can only copy and paste it.

I've applied the series, fixing the tag in the process, along with the
line-wrapping of the commit message in the second patch.

Willie: scripts/checkpatch.pl warns of some of these things. Please
make sure to use it in the future, or if you adopt b4 as Krzysztof
suggests, use `b4 prep --check`.

Andrew
