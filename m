Return-Path: <openbmc+bounces-386-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D6DB0BB69
	for <lists+openbmc@lfdr.de>; Mon, 21 Jul 2025 05:30:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4blmBZ0XQhz2yfx;
	Mon, 21 Jul 2025 13:30:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753068645;
	cv=none; b=Bo5tdcDpecArlwtE5JdUjqyRlhIO7ttbN/7Hk00KccsUD5oSZNMYalIhxjsgbblQd6af0iaxGve2SKfleNaID9Si6YF5pHI45zAjHHmAsDOCIllKEAEyi3apw5pZVFa7zy8e54QRUaHdzTGEXN13hWnemvUKrLMCWgU1kkbbZKslw5CRDyZNI9wMnYxFyQds2Oe6jSV40K8mfEfbEEVDUaMurvqw4mOMkWfQM/J6dJJrhsAd6RQtEzFZbZrkuArFLm4FSR8h7dV+0gMe5lJ3BEluUXscByJ0gIoBmE3rYqQoUYa6eX2mdiVIiI+H7hC4fyfPThv/eV41sCDTL92AXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753068645; c=relaxed/relaxed;
	bh=VuSv0/XI/eD9FBwiYcZx/CO4wUCjzxcc9XNCARjCC6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E+C2BtRGKff+uZleaiWbbG9VK+hK+p9qJMr2o6iOUQMuHWYURJmcWCVq5OEhPCm2NNe3W8tkou21mRPdzo6BI68vZNphHD2yll2FSZ2JI0W5hQXTO5ltQfdZcQgYXysc69LOfW4PlXaod0Yog+/o6hAb97xrt+f+25ksQC5CKMjbgMrMnM7MATjfS9i2RQSc2P3LY4+AGQtFsNt0AD0Pk+EHc1+++tzDWCHE5SybaBr9BdnoN/1ekVyMGIvpMIqJ9ZtSxSOxf2mgWRay0AuTy7zxjrEDWhV6uDSSgiPJIMHtQS0Nd7QTGUv6ZilEHPabduzOz7wteqPfyQZiyALoLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DSouQuv2; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DSouQuv2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4blmBY4QyWz2yFQ;
	Mon, 21 Jul 2025 13:30:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753068643;
	bh=VuSv0/XI/eD9FBwiYcZx/CO4wUCjzxcc9XNCARjCC6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DSouQuv27SyZh06F/ZYCO5G2WVwWjFsbsiPNoh8HGk2orE/qR23g8EAU3fUkCjLdI
	 Hvov4ZxhWauWqgDW3oCIhchw8bcj9v25Wa4DamYtaujlrup7qb3QyPtxBT4Iprj9i7
	 nYn79yWqv3jyNZmafxAKheJxGe1dWshVlktl8A1ggstKyM+5u/+xVTxsAwps4IdDvl
	 raOGV/8/KgVBZZ1lRN1R9Y/cCnztogEvWJoc9FHXrdY9GazNPygU+7x27jCH9XaNqz
	 DXhpNFACCQ9/qyy7x5S00fMncpFT8oT3UmakjPM1ajuALpk0qZs9e7b5C/1UrYl7Yg
	 od/N8MsWOdjoA==
Received: from [127.0.1.1] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9F6F4640A2;
	Mon, 21 Jul 2025 11:30:41 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 openbmc@lists.ozlabs.org, Willie Thai <wthai@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Deepak Kodihalli <dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>, 
 Leo Huang <leohu@nvidia.com>
In-Reply-To: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
References: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
Subject: Re: [PATCH v3 0/4] ARM: dts: aspeed: nvidia: Update DTS to support
 GB200NVL hardware
Message-Id: <175306864149.1300934.10142311415731184566.b4-ty@codeconstruct.com.au>
Date: Mon, 21 Jul 2025 13:00:41 +0930
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

On Thu, 17 Jul 2025 09:52:09 +0000, Willie Thai wrote:
> Update the DTS file for the GB200NVL hardware change.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


