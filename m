Return-Path: <openbmc+bounces-767-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C0BBEEA57
	for <lists+openbmc@lfdr.de>; Sun, 19 Oct 2025 18:52:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqPk3076Dz2xxS;
	Mon, 20 Oct 2025 03:52:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760892746;
	cv=none; b=hishyq4KZ66muRHzxEvP4vFT6cyg2eABoA160oAqymYteDZDSTsfojptBG1QPHmk90kU/zCu6yIDQUcP/QWvJtKAAo5auiVaa0cdKfACedPoVNnGYERSvKKg3PsAP/a8VKWGjqdQzKYpjr9peLYQTncHmWOFf+fh+Sd4onPrDqc2ztR9K+KKFAe20nffPnyKliJvC0HqNorQOI7NciXgpJvcRVqhhfTa/aDM182kZmE+9wthtn7XJB63XL813Kxbk8w1FfDEfLWEfVo2RxPJ1kAqJdLCudo3jRAARb7VPOIL40Q9tG13BAghwRCN/1pAloRfKTsYhw2ZZPgWAWfNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760892746; c=relaxed/relaxed;
	bh=22maNjAT/7AfzrKff6qP+5jj+65TOlCXTwGtgzzIqNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mFZT0bpNkKinUOQcT6hCdGFZxmaKdZPUlRyzpJA2NhEhNv/vaGOzElz7gWyRLuadxutmh4HKE9S80Nn1gKNBKuxoGMedBh5D7nTiddb3v1I3LfXlCkywReXS2J04qwM1eOoHQCEUwYfG2/M8JKJw0zt7TNqTkPE4CXRh3YNDxnv6Z3p5qFUik+y4GOs6H15Fbr2HeKrVuZ8nMrYb9BZ17bwNozO5PQiwW6w8T4EnUX9HQQ8Q18gH8vaZAKl8pKmytudIdeh2LNOGrPLfvHUg6ktcYfsTAWERe0it5P7jF136ozXwiiYnwBRnq2LbZqx1aaEs/zPSYT3WmBEAPjiyLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cBO8wUWY; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cBO8wUWY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqPk170rPz2xR2
	for <openbmc@lists.ozlabs.org>; Mon, 20 Oct 2025 03:52:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2569261186;
	Sun, 19 Oct 2025 16:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B10C4CEE7;
	Sun, 19 Oct 2025 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760892742;
	bh=iC2JnoyFPZTH+6RHQk2aI6S4dkacuBcn+z3P0Tadx+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cBO8wUWYwkzmQNPxSyIko83RDdfnZRaYxhNHxRc4fJsO5LUrLNi8FrBKP6+08Nii9
	 ULYt7ZxrNMcQE2xR23Vv1hObiLPaq5+9pXrfYRPiVZYYMTKKpiYBqDpFV78/ibB1rV
	 VLZ908tqiYzVNjW72CODDbIe2IomQgAOnz3KXtp5Lut995d/J9qkyQSXUZKShKzpo3
	 ZZlMVpm//FQwwYsWFtHbe6Bk/wHGUwNI15+SFlhRuqpFsOyEuJkwhmlojMpKI7hEx7
	 kVq10mTCGALfO7T6+xwUpCo31Y2F+YbDCOoMUxhFvALWJKJWb7uZ3gOgb7GqV3ZvDJ
	 Jk7xvXLeDtlkg==
Message-ID: <9b2be593-8fc6-4089-bbb2-b8c496b1b2a4@kernel.org>
Date: Sun, 19 Oct 2025 18:52:18 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: nuvoton: fix warning and nodes order
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250925200625.573902-1-tmaimon77@gmail.com>
 <20250925200625.573902-2-tmaimon77@gmail.com>
 <cc23d41d-6a5e-44d7-ad4b-1b39566dbce8@kernel.org>
 <CAP6Zq1i7repVa1oAVpyZxWw12-dv0MrVbkfXoqCKga+rp7=8LQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAP6Zq1i7repVa1oAVpyZxWw12-dv0MrVbkfXoqCKga+rp7=8LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 19/10/2025 16:30, Tomer Maimon wrote:
> Hi Krzysztof,
> 
> Thanks for your comments
> 
> On Sun, 19 Oct 2025 at 13:35, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 25/09/2025 22:06, Tomer Maimon wrote:
>>> Fix the warning in the gcr and timer nodes, and modify nodes order by
>>
>> What warning?
> This warning that I got from Andrew mail
> [I] 0 andrew@heihei ~/s/k/l/o/build.arm64.default ((00e2ab2e))> make
> CHECK_DTBS=y nuvoton/nuvoton-npcm845-evb.dtb
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   DTC [C] arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb
> /home/andrew/src/
> kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb:
> / (nuvoton,npcm845-evb): memory@0: 'device_type' is a required property
>         from schema $id: http://devicetree.org/schemas/memory.yaml#


Commit msg should explain that. See git history how to add such
information to the commit msg.

Anyway, all other comments stay valid and I expect improved/different fixes.

You don't sprinkle random compatibles because someone or something told
you, right?

Best regards,
Krzysztof

