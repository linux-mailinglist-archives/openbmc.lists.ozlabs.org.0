Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBE68B6775
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 03:29:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D0EyxTPc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT2gQ6qwbz3cfn
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 11:29:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D0EyxTPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT2fP6mjyz3cVP;
	Tue, 30 Apr 2024 11:29:01 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 51C2F200EF;
	Tue, 30 Apr 2024 09:28:58 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714440540;
	bh=Q6Ex8FW3hDftsHNtIMRsxpmNZfxAv4l73py6egD+IxQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D0EyxTPcMwYBqFmz2Na1yMb6CPy0gJyty1jVgNaxNK4sZYjbXYIlVZzUBvL0liit0
	 zHKQqPEpsninhnbtHGOQ8ETWfYMDC75bgdR4w6c/d40OZrE6FpqGENUvtXMGjDUI1Q
	 Rhut/Y4vLCCpN6TKeNxSbgGVKcTIxAlo+kw5H0imVDaZ1V0ymsXK83trB/o7A+glg7
	 EpYIt005boD7lD4PERpXCG5lkJ0K4uPTo8h0qZH5rqfinNS6Dnb3gEOBPVksPEtAq2
	 x5DRBmH2N0Pscp9pxblydCV8YTzXvRO7C1LhyqTkfrXUlHJWAluu8Hk1G3uItdcyAN
	 w65Ra0rzbQuSw==
Message-ID: <6b69a2bbfa713374e0bbd9f306ee554ee99f70d3.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kelly Hung <ppighouse@gmail.com>, robh+dt@kernel.org
Date: Tue, 30 Apr 2024 10:58:57 +0930
In-Reply-To: <20240326103549.2413515-2-Kelly_Hung@asus.com>
References: <20240326103549.2413515-1-Kelly_Hung@asus.com>
	 <20240326103549.2413515-2-Kelly_Hung@asus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kelly_hung@asus.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-03-26 at 18:35 +0800, Kelly Hung wrote:
> Document the new compatibles used on ASUS X4TF.
>=20
> Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>

In addition to the concerns of others, your author email is not the
same as your SoB email. checkpatch warns:

```
WARNING: From:/Signed-off-by: email address mismatch: 'From: Kelly Hung
<ppighouse@gmail.com>' !=3D 'Signed-off-by: Kelly Hung
<Kelly_Hung@asus.com>'

total: 0 errors, 1 warnings, 7 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-
inplace.

Commit bb035db4c70a ("dt-bindings: arm: aspeed: add ASUS X4TF board")
has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.
```

Please fix this issue for both patches in the series and resend.

Thanks,

Andrew
