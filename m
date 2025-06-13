Return-Path: <openbmc+bounces-189-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F70AD80F6
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 04:26:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJNYs5D2fz2ySQ;
	Fri, 13 Jun 2025 12:26:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749781585;
	cv=none; b=VVl491en6qd3SsOOORKk6FZf9TOoP9TdA4mQI0jimSw6mDUw8gm0ODS7GoPYlW7wVf9EeT0IDa5hUDuj9/Ci6rfO5O5jaegjLPtdBBBAOd2yird3kvsiLCg2WP+WGwkjFJWTp2jk8CQL4X2J8/ITrU+squ7f4QJCZ+Mty6d2YhoSJ+HOMndgQjLwhAWbUOr1jRe+p+B5yV+ANr1dOJ6CyzEE47KOI2cKEM98WB84QeHrwn4oFkXdYB7N1uBMHxJuZDuF+gQN6Aunho1Xu58vnYm9iEt7J289CV04QVYS13kUTtsR9pDRB4JYGQywQwXv8Y3TFDHcoc3BnwVXA0rMKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749781585; c=relaxed/relaxed;
	bh=xLHonorKTCKXs1ikp7cWn5/J1/dRh42gn9VA3Kq5MxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xcoa2dVJGJyskNvnOb23I+0p4GClJoJhpOCme6pngS6RGdGfnpVPBK12wPsPbEllBhRh6TKZLR8izY/81GCRm9dsjrP/EHufCMU7VfzTxPNJ2NXwfzbEmzbiWxjhaZShPzZHoIeBOofHUusKp/J05FwRzbmh2Q9WcU7k5pH4MvKlwyNnQYJvde+TxnEgaNeLsul/Szhjg8a7N7UGFzg+VIxsZdTIp00a51IPoplt6M/Lad22nbfqCEkYO9eJBsT75+zqvWhZXnEQWbCbBVHAYCD4LQbmLwEx5upqJEib5y0dYUC0wUrAtPDHT4rDyYaIhcG2j5B1BS05V4/t/8L/Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hTN6C+Kh; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hTN6C+Kh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJNYs13vDz2xHp
	for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 12:26:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749781583;
	bh=xLHonorKTCKXs1ikp7cWn5/J1/dRh42gn9VA3Kq5MxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hTN6C+KhQtfWhCMjyBx6tHWd7BiD4ype3lldLXmgo5ieDZAGry0Hr7CRlSfD14/4n
	 Ll6JbaJk4Tce7g52FXEnu4d1MaGTATbCwDvrB7Cw+N6A+UJErG4+eI1fBrf8OkO03i
	 PZYr4axD8buJcpM+JGvHcG7qht3P3Omn10nBnr6wmAfmoGomJEpnueDm3aYGuTDiVJ
	 yVZizSGjbNrbAROq3sBLCPtMgduDOGWRnRwPgjuRu4us7D9oRJDIt2hym+oVmWSd0C
	 uv5AMq3qn8E2ttX0R+HaejI99xAVCciUvKRfjmAgVxQT0P1hnJ7XMyvlGE6XGHvwDO
	 SU8ELB71SRKAg==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 689F36445B;
	Fri, 13 Jun 2025 10:26:21 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250609203721.2852879-1-robh@kernel.org>
References: <20250609203721.2852879-1-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: nuvoton: npcm8xx: Drop the GIC
 "ppi-partitions" node
Message-Id: <174978158113.301145.12233806769903779055.b4-ty@codeconstruct.com.au>
Date: Fri, 13 Jun 2025 11:56:21 +0930
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 09 Jun 2025 15:37:20 -0500, Rob Herring (Arm) wrote:
> The Arm GIC "ppi-partitions" node is only relevant to GICv3 and makes no
> sense for GICv2 implementations which the GIC-400 is. PPIs in GICv2 have
> no CPU affinity.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


