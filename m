Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AADB9706C8
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2024 12:58:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1n5M4N16z3cGf
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2024 20:58:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725793125;
	cv=none; b=FRQQaOTlzNLpfuaabLBAnmWEkM0QDOQZcJQAgxs1ijGn/0G+XBD80jfWe6rbgqnrkk5QPQyrN7CZad6/iwFD+LXtvHOgejbMlh3N24Ab3J5pwdwpDvgOpDNqlFno21HTxwxcv89ZvW1W84mKgCQJdfRX9SxL4EaIW4yjTpP0OEZ39XHCH2ZmL4zb9AVHbpr6J9mXTfpoT31LWSXCu45jmEPvuIdk9WmspAXP+O8i9+t5phjtpl6htV4V19di2U0FvZv6rK4cDq6KF7ZNrHe+EVH/4ubJYja3XQUi8aHOKE2L4cHCgjzmHzvnxw8q4U8d0b/Q16lkY13SARVs6xvvjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725793125; c=relaxed/relaxed;
	bh=P7fqY6U/cxvjBE+lCHhb79+U+IBZZTdEO1cL6Ww0FMI=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=fn6nrq2oAziFpaoNVpUBVdyz9awOVv2Bv0G0SUIygd0f76gcJKpGfA3zFD+GFYPLAfLaCfMA8S+QX1/hewKxRQtHwXzwPIEp1Q9FI2oIvghIKTJ99Z+mc8+GzcHdTlYcWejEMKOpmR8j3RdecxidxDVPbRYIcEMgP+IXu1FHHIIleEn2ph6iG+j1y8+5zEGAYbaCZ2J5hUhRNrdP3IY/FYLWGtKgqQTz4W9wswHA23yECgoIVvKS5j7pbhHhY6OTucT1E+q7H+6XrI1VUFvm0OaE7elacdVsggWgIjD9yTCrS8hrgkqKiEncxKtpTxlh/e8KV2Gv8fRBqoHaWbYVCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VfiFq5uh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VfiFq5uh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1n5J31k4z2xfT
	for <openbmc@lists.ozlabs.org>; Sun,  8 Sep 2024 20:58:43 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5c25f01879fso4236068a12.1
        for <openbmc@lists.ozlabs.org>; Sun, 08 Sep 2024 03:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725793121; x=1726397921; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7fqY6U/cxvjBE+lCHhb79+U+IBZZTdEO1cL6Ww0FMI=;
        b=VfiFq5uhjDiIWlANeTi1Pv4cCBMrT0oUB/hAToa4ZuTJrOv0h6FuZ3d4JDPsyKwqbY
         TRoDCgFDQiPSnCH65Z7ervl9Ui+DCTlXBhxuw+ZJnqN4qRK6yxE8QIES6wWwmvRvPrsK
         7/Oo6HpEqswlZVThEbCeksweGzl0fKSUb0g+qk1G66NQc6jlgPEngu9R4oReKsGS1PIX
         Rb0/rVjetp0Cy7d76qWGMJD1sDNXFwL2JqmXsHoNwGX9n0fA9NAJqFPe6FjhazPiUJl+
         dF3ZR6aL4engzG8xkkX58yOPBINaZ57O0wp8DOMILlWXIqFfeMUS6qkTEuA4t3IMk40B
         +D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725793121; x=1726397921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7fqY6U/cxvjBE+lCHhb79+U+IBZZTdEO1cL6Ww0FMI=;
        b=IlZPWM8A+Lcpo7lno57MJzoALksP5IT3EA93d3Odr4EDhuk2xlfuQOMYcYITXCoax+
         MvrWw+JPhTVmxxaEaVZbMxu4Vg/d1/Y+YQla0cVT3CnAkntE70/+9h4iZxJ3/Xx+zjlH
         10Lj8SmtPbD6aagmMokHfTm/iWTlGiVswUXZvCMPGa9K9hl+XRk2+/K6yaVDniBDuLDp
         sWWdxu6FeXMGHFhvgKZIs+P1uzZ91Tn0zPr3Tr5pI06Y2UiyKz1yHBQM7MpuV9bAUb94
         gUrdqUOcfazrCRdNmFgOluzDmPuyNjjSyKC46715z2M+FLE/Tbd6hEPZjqWQsngv9yet
         Nv2w==
X-Forwarded-Encrypted: i=1; AJvYcCXRurcgp2K2hah/EuJGBSyUAtQpmCCU8rWH9E6hpDcZ/XKjOYKxVRfowBI4ahE0aBesBo6i5/PU@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxNHjhRuVFA8Mev6hhE3TR/XrctKPoGHX3M7mJ9KUICSdeOj27
	ACSWOU+UWzY8NSUi2FZFL+1nLTqIT5IeHq2L8deOW9pM15ZRbVjDJxLDcOp2a7CrnS5n2YEgZXo
	8PDcf5Me+aixJHO4CDz1jAP5oZLo=
X-Google-Smtp-Source: AGHT+IEZR3MHhdgXo7TUrROfd6+7Y0uP1oucdSzBfzf0VIGBOcB42Mz+Nh2eAOCNe7YZNFcBag+BYm/nI04DNY+iS8o=
X-Received: by 2002:a05:6402:50c6:b0:5c0:9fca:9352 with SMTP id
 4fb4d7f45d1cf-5c3dc7e4a2cmr3709906a12.36.1725793120594; Sun, 08 Sep 2024
 03:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com>
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 8 Sep 2024 13:58:29 +0300
Message-ID: <CAHb3i=tt8hy==3BftYNGjgG_4MNLtRzQ64eyR7Qxw7jtg3aiRA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] i2c: npcm: Bug fixes read/write operation, checkpatch
To: Tyrone Ting <warp5tw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, tmaimon77@gmail.com, linux-kernel@vger.kernel.org, JJLIU0@nuvoton.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

On Fri, Aug 30, 2024 at 6:48=E2=80=AFAM Tyrone Ting <warp5tw@gmail.com> wro=
te:
>
> This patchset includes the following fixes:
>
> - Restore the npcm_i2caddr array length to fix the smatch warning.
> - Enable the target functionality in the interrupt handling routine
>   when the i2c transfer is about to finish.
> - Correct the read/write operation procedure.
> - Introduce a software flag to handle the bus error (BER) condition
>   which is not caused by the i2c transfer.
> - Modify timeout calculation.
> - Assign the client address earlier logically.
> - Use an i2c frequency table for the frequency parameters assignment.
> - Coding style fix.
>
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>
> Addressed comments from:
> - kernel test robot : https://lore.kernel.org/oe-kbuild-all/
>   202408080319.de2B6PgU-lkp@intel.com/
> - Dan Carpenter : https://lore.kernel.org/all/202408130818
>   .FgDP5uNm-lkp@intel.com/
> - Andrew Jeffery : https://lore.kernel.org/lkml/
>   20240807100244.16872-7-kfting@nuvoton.com/T/
>   #m3ed3351bf59675bfe0de89c75aae1fb26cad5567
>
> Changes since version 1:
> - Restore the npcm_i2caddr array length to fix the smatch warning.
> - Remove unused variables.
> - Handle the condition where scl_table_cnt reaches to the maximum value.
> - Fix the checkpatch warning.
>
> Charles Boyer (1):
>   i2c: npcm: Enable slave in eob interrupt
>
> Tyrone Ting (6):
>   i2c: npcm: restore slave addresses array length
>   i2c: npcm: correct the read/write operation procedure
>   i2c: npcm: use a software flag to indicate a BER condition
>   i2c: npcm: Modify timeout evaluation mechanism
>   i2c: npcm: Modify the client address assignment
>   i2c: npcm: use i2c frequency table
>
>  drivers/i2c/busses/i2c-npcm7xx.c | 276 +++++++++++++++++++------------
>  1 file changed, 172 insertions(+), 104 deletions(-)
>
>
> base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
> --
> 2.34.1
>
