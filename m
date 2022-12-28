Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF4B6574D5
	for <lists+openbmc@lfdr.de>; Wed, 28 Dec 2022 10:42:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nhmlg1ws8z3c3N
	for <lists+openbmc@lfdr.de>; Wed, 28 Dec 2022 20:42:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rj3269mP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rj3269mP;
	dkim-atps=neutral
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nhml60T06z3bSl
	for <openbmc@lists.ozlabs.org>; Wed, 28 Dec 2022 20:42:08 +1100 (AEDT)
Received: by mail-vk1-xa2f.google.com with SMTP id z190so2986490vka.4
        for <openbmc@lists.ozlabs.org>; Wed, 28 Dec 2022 01:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fwLk0wjxGIvhAq7dgs3jTc6JAPT5yAloCtLTEegt4xo=;
        b=Rj3269mP+Zl4qhDW7MsDPLmDP6tF+49SIZwkN+VgicWg0Lh+MM6wfzfed8Yevd11Ca
         IXyS/nw13+lolANzO+oXGSYaN0xQEv2Mx1ioSVy5ptMu1e1Pbc+2VAThBj0lsbhse7Su
         fqfFjpkPCyS0FRZ3NorPCwDa1AVLENVVNGVkae8Dp32EJNnQKP5SZI+bVNX4IChMwlqX
         AzDABDnLY7gtuzKSCBNcJkBFSiTVnq/Yz3F0XqyXhoKzHzcQ9uOLLJeMh6pfHw5Hlpp0
         n2nSwjObsMi9NuCQDWCA/zsGxwsBswa1D2NdCFScnjJJurb3Si0pz9n+TNrrZFva3FoP
         tJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwLk0wjxGIvhAq7dgs3jTc6JAPT5yAloCtLTEegt4xo=;
        b=3MKEpDGJLeCQnTs5d6EbeCgeLytAs9OeH+W3bGqiVx9JYEiB929/iYoBhrb4Dx8Wkb
         y4FvSpmNsHmI/UoUqo9cnbiAMt50mTgyxZaZQLAh9eCyhi08xY8CUcKoEiBMLCYOmtRf
         12wshvtEi+iamRsJc0Xr7jKbO0qYd3wDZ3V6ay1KsFK7bW9gHMNiUVOAtzOusLJ5BhMg
         dw987xpB0ZgD0hIJBatLYf7GYghJeztC6a8U0d3XQngtAfM1wel+np2Af3JywWaMMW7h
         P3f/BdelM0osuysC1MESnNxYhg6cLlCzVreGTRQYTKMc2isfhhKrbmf1zW1CLehlVq/M
         yjow==
X-Gm-Message-State: AFqh2krvlEwRBee4PKPWGFg2aMr6bpWe3IZeIyoB1USh7LcsFfRHH4dy
	l9swe97rUc5RPO5gett3u/44hWSJyJBijvAM8Ec=
X-Google-Smtp-Source: AMrXdXuiO15bKKKO/sD+d/YsDkXXMmVgtIh2UUu6LekwHNnzWeW8s6XUBfaregIYgxtO4eVYcere42BjzWOrSO+I02A=
X-Received: by 2002:ac5:c382:0:b0:3bd:e0b8:e350 with SMTP id
 s2-20020ac5c382000000b003bde0b8e350mr2671281vkk.25.1672220525745; Wed, 28 Dec
 2022 01:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20221227095123.2447948-1-milkfafa@gmail.com> <20221227095123.2447948-3-milkfafa@gmail.com>
 <0a3ece05-c94f-3d7e-2f90-b72b777617e5@linaro.org>
In-Reply-To: <0a3ece05-c94f-3d7e-2f90-b72b777617e5@linaro.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Wed, 28 Dec 2022 17:41:54 +0800
Message-ID: <CADnNmFp-RD6-6PUOJzF4GNW4zBoD+Zk6v0dGnmofLBxMWMEaow@mail.gmail.com>
Subject: Re: [PATCH v10 2/7] media: dt-binding: nuvoton: Add NPCM VCD and ECE engine
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-media@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kflin@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Subject - it is "dt-bindings", not "dt-bindings".
>
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).

I'll correct it in the next patch. Thanks for the remind.

Regards,
Marvin
