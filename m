Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17414930C23
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 01:10:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fa9NtToP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMgzp6yhBz3cVD
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 09:10:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fa9NtToP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=jonas.gorski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLnxj2pYBz30Wb
	for <openbmc@lists.ozlabs.org>; Sat, 13 Jul 2024 22:35:51 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-65f7e5a8567so5115787b3.1
        for <openbmc@lists.ozlabs.org>; Sat, 13 Jul 2024 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720874148; x=1721478948; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=owkShcGocUOtbv22a0hw2ZQ7UgHf40jkC06XKxO56x8=;
        b=Fa9NtToPq+um5F2G1v8ocN2upft9dsIlc3WeOx8EWnEILEl1wSs6uK3bwPOdiPdaxe
         L7WS2Th3J5ZgdNOTcRibLFKxPUAdTrzSp5d2EWQIZVTCkd6oQSH58PyjnRWVP9G46z+T
         b5hDdDtzfsmRBLWOYrYjWV4bswxqszEbLSaDGbrrrBdQgqAv/7vOjAaaTIb7pi7hJus+
         4EyjOkBTVEpjsuTO2jyHkYaMcxDdaWWomRsA6RbdseLYOlBQ7vmebj3+48fVSD1e+Aor
         imC2TGWrQhcsvLwYSGzaaiuoTTVAwEPxV6kI/VwPi7rZ7GVMwsQJddvZgEkmf4OwP23Q
         CQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720874148; x=1721478948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owkShcGocUOtbv22a0hw2ZQ7UgHf40jkC06XKxO56x8=;
        b=Gr08r13QypDLy5ScLBx6qyXQzxmEHwbJ5eBsyBzQ7V1I6eFn3/FHppGF3jdKkQkKem
         wPQK1moBfnPiktx+s8PMmyy/V1YJ8dXcrxa9f0bm/s2Njrw9SijEk631Y2vztDF7Qh4L
         tGIAAK6y1LT4qa/tNzAxslmyuiHgEVuV4d/1xyS532dEY4E0bNAq44JvzEiT/G/Iv6gs
         4yGWajNXQpJ6qNHjo3pCepv7aRbfIu50fuwty36E0kQmxdEnzXAVzZo1YLD3xyuZNgTY
         rkJXtShznk8lRoIVYwLoGmGVxfAs/8XL4VVLzb0BWBRSdufSwXvyPxJJ2uUzRuwNCuSS
         IOpw==
X-Forwarded-Encrypted: i=1; AJvYcCUiC8cPj08v96LxpGYkeJVDTb+pYybaoylWiuwMJ30vIutAM3sOdc4Gw86aVBF4y+Y8xhaI0Dtv+SvKP9swBj/OHsIgTUoyvzg=
X-Gm-Message-State: AOJu0YzT10kyvUU7xX8s55NmeS0Mr1m22MQ2N0IYwkcj13h93+J0tIbq
	N71GnYEhZ21VLw2DUumzBVj37Gi89AtWPPjHORJLnPqyj7iJ5DwVkV+Rva6KqhhTiU2IKY5VsTF
	kW+OF9PTIL/VcJL0csdfmqffAK9c=
X-Google-Smtp-Source: AGHT+IFxVjFQgnzk7U8EbynbAHgLidXGTg+dCuDEWyhjzb0s5oKcsQWA8qjq4FBXiKSC/kd0jB508Atnx1GMKhgcc2I=
X-Received: by 2002:a81:8d4b:0:b0:63b:d711:e722 with SMTP id
 00721157ae682-658ee7905a8mr168875407b3.1.1720874148479; Sat, 13 Jul 2024
 05:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240711193749.2397471-1-tmaimon77@gmail.com>
In-Reply-To: <20240711193749.2397471-1-tmaimon77@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 13 Jul 2024 14:35:37 +0200
Message-ID: <CAOiHx=kr=_-ra392XH-vR2fG-E5ZVXAutU9OP6xQRrzXSu9ZWg@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] pinctrl: npcm8xx: pin configuration changes
To: Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 15 Jul 2024 09:10:21 +1000
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
Cc: benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, 12 Jul 2024 at 02:48, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> This patch set addresses various pin configuration changes for the
> Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,
> remove unused pins, and improve overall pin management.
>
> Tomer Maimon (7):
>   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
>   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
>   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
>   pinctrl: nuvoton: npcm8xx: remove unused smb4den pin, group, function
>   pinctrl: nuvoton: npcm8xx: remove unused lpcclk pin, group, function
>   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
>   pinctrl: nuvoton: npcm8xx: modify pins flags

You also need to update
Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
for any changes that affect the device tree bindings (e.g.
adding/removing functions/groups).

Best Regards,
Jonas
