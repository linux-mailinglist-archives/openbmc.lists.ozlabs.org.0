Return-Path: <openbmc+bounces-445-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151F8B25AC4
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 07:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2YV66WWTz30T9;
	Thu, 14 Aug 2025 15:20:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755148830;
	cv=none; b=XmzLMgnvIPhoxLRuh7hTVZ8tC2EARrwaZ6a5YTKJt1Pi/r9e9LfVh9dfxn6FOwZ+JXc7ZFBVJkngqK15AL0/v+TksTXxeaOFDCYaNE5xgVsvDYjwj0gco0dPJ9UKbAI5z9zxAHPK+YQWu0OHuFDjDY6xVJNFqF14RvEKhBY9MNn7ziFtMqrAigJU6oQw1PAGnx3d/Pl2X7Z81qv1yizGxaenf6+1sDyNi32bknhd1OkcBHeYOxz2/V6mbVHjohyfnDtjNldT8zJ9AU7ruIyZ9k6mlkyixiAsx4xuDNgY+XNlehOaFbvi2msakv4T1jfhD5vcB4ingM5E/896WSflRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755148830; c=relaxed/relaxed;
	bh=oZfoQz/W2aRFTPgiaWRMRaMlJ4wLdwL9RZ4w/CzOD3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGtFBDkuFjSggkaq7yCrr5a7gbsU774ov/i8d8lfZUY3zty5Lyc40wjSk6BGvQujMTn5PDysW6c8L5vfD3i39gBUoxA3vBN+XmF7/4oiSAExGCQ2eTooZ2I/itxwSoJe9CdFWgn90nBGpxE6RfCLDroTE3TiS86zlMi//CCrY8DoCMjxcCD75e/zrBRzRXpGzOhBVMUqQK16nSGs+Zh0FeliJnhgEmvQFxh1GGV0fMwv1YN62SSTdlK7/HWUYUrtB8C11PaBTwuloacw44qqkvtZd5x1H+jy5qrOJsQ+XWSTrb27M1ZtNt6yXts6mSUjoSViULlCLhfxGrR6Iq5xQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 528 seconds by postgrey-1.37 at boromir; Thu, 14 Aug 2025 15:20:29 AEST
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2YV54ZXWz2yhX
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 15:20:29 +1000 (AEST)
Received: from [192.168.0.192] (ip5f5af7f5.dynamic.kabel-deutschland.de [95.90.247.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id CC32E61E647BA;
	Thu, 14 Aug 2025 07:11:03 +0200 (CEST)
Message-ID: <be90ba43-316b-45fa-963d-7faa14b2cb4b@molgen.mpg.de>
Date: Thu, 14 Aug 2025 07:11:03 +0200
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
Subject: Re: [PATCH 11/21] peci: remove unneeded 'fast_io' parameter in
 regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>, openbmc@lists.ozlabs.org
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-12-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250813161517.4746-12-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear Wolfram,


Thank you for the patch.

Am 13.08.25 um 18:14 schrieb Wolfram Sang:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
> 
>   drivers/peci/controller/peci-npcm.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/peci/controller/peci-npcm.c b/drivers/peci/controller/peci-npcm.c
> index c77591ca583d..931868991241 100644
> --- a/drivers/peci/controller/peci-npcm.c
> +++ b/drivers/peci/controller/peci-npcm.c
> @@ -221,7 +221,6 @@ static const struct regmap_config npcm_peci_regmap_config = {
>   	.reg_bits = 8,
>   	.val_bits = 8,
>   	.max_register = NPCM_PECI_MAX_REG,
> -	.fast_io = true,
>   };
>   
>   static const struct peci_controller_ops npcm_ops = {

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

