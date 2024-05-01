Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 654228B921B
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 01:16:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=cfBYHfFj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVCcG3BM8z3cXv
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 09:16:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=cfBYHfFj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVCbf4dNtz3cRK
	for <openbmc@lists.ozlabs.org>; Thu,  2 May 2024 09:15:42 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 36D3A1E4;
	Wed,  1 May 2024 16:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1714605337;
	bh=LA75uaniDW9QbvPNlFYPb/h62PSnV3LT98zz/24EjcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfBYHfFjUj9spCXIvTPWoe0grN9GBk4zZD9EBNPT87kJNyFwebFs8KOjPnsicacQr
	 3gKXWVTe/LlFNeucZ4NxYj9sGXdQ6ORmlSWWuH+Q8qoCq/4fkVB1dnYiEjfLgPkRok
	 PV+61sd320i63fCX0lJIFAdzcI561zcirWD1SKvo=
Date: Wed, 1 May 2024 16:15:35 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add ASRock SPC621D8HM3 BMC
Message-ID: <561b69da-f4e4-49df-ac3e-db0003d549e0@hatter.bewilderbeest.net>
References: <20231120121954.19926-4-zev@bewilderbeest.net>
 <20231120121954.19926-6-zev@bewilderbeest.net>
 <CACPK8Xf6vRKJZHuovMXd2h=nnuKW4m5mcRrfZaTsY987Ai6huQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8Xf6vRKJZHuovMXd2h=nnuKW4m5mcRrfZaTsY987Ai6huQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2024 at 06:23:27PM PDT, Joel Stanley wrote:
>Hi Zev,
>
>On Mon, 20 Nov 2023 at 22:50, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> This is a Xeon board broadly similar (aside from CPU vendor) to the
>> already-support romed8hm3 (half-width, single-socket, ast2500).  It
>> doesn't require anything terribly special for OpenBMC support, so this
>> device-tree should provide everything necessary for basic
>> functionality with it.
>
>We've had these in the aspeed tree for a while, but as I was on leave
>there was no pull request. I'm just putting one together now and
>noticed some unusual looking device tree compatibles:
>
>WARNING: DT compatible string "renesas,isl69269" appears un-documented
>-- check ./Documentation/devicetree/bindings/
>#220: FILE: arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts:181:
>+        compatible = "renesas,isl69269", "isl69269";
>
>WARNING: DT compatible string "isl69269" appears un-documented --
>check ./Documentation/devicetree/bindings/
>#220: FILE: arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts:181:
>+        compatible = "renesas,isl69269", "isl69269";
>
>WARNING: DT compatible string "st,24c128" appears un-documented --
>check ./Documentation/devicetree/bindings/
>#230: FILE: arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts:191:
>+        compatible = "st,24c128", "atmel,24c128";
>
>
>Can you update the patch to be checkpatch clean when applied to v6.9?
>
>Cheers,
>
>Joel

Hi Joel,

After looking at it a bit, I *think* the third warning above (st,24c128) 
is a false positive due to the checkpatch script's ad-hoc grep of the DT 
binding files not picking up on the regex-based compatible definition in 
Documentation/devicetree/bindings/eeprom/at24.yaml -- AFAICT, the 
compatible strings match what's described in the comment in that file 
(and the actual regex itself I believe).

The isl69269 warnings are certainly legitimate though; I'll submit a v3 
with that added to trivial-devices.yml.


Thanks,
Zev

