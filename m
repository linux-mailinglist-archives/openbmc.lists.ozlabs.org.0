Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268E793284F
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 16:25:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MGgMoA1z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNhF271Qlz3fTS
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 00:25:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MGgMoA1z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNhDT2sFLz3fTb
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2024 00:25:13 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6325b04c275so57212137b3.3
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721139910; x=1721744710; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Io8ocOM3/SFjPGKaudMWtakUYl1fpZ5VprgU1fxT8Ro=;
        b=MGgMoA1zR+YEKOioSJ9yrwtljRC+zz1uN3mQ/IVFlFtXfnUX5nAB5cncrn7PkbvqRC
         hRif+HTtc4Y/gknOtxGByrqTxufZzvR2wL8RvRa19xvLcJGa3YGHrc55cFIe8/aJwxpP
         9/H3ApzaJDIrFTIRiteeFs1vBXyZmsgaCYRv7BWuvgtr8DTxNZctf43t8XC29DnfGtFY
         gZ+pVbDyOTJhqX4XvRPUQwUNmLhUDshjQYE1iCi0gaVLQOs5yb5nwRVeSnrEir5ALWTD
         PvTGcx2buzpjDDZCMtYjKKwamUxAYqvBqIe//vllICUlIWJsNECMoP21NQ0uRJ4O+/MY
         4d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721139910; x=1721744710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Io8ocOM3/SFjPGKaudMWtakUYl1fpZ5VprgU1fxT8Ro=;
        b=aPBPimdO4drvX1kmtcq1rdoCQnymVguDM2CzszIU0y4agCFrr2d6KQF88vPmaVaBAZ
         wJ2W7oviyRrRTnhCQ0kzB6iMe5jIwJLwn5NpDdyLOO3skXUnzxcSizd684BRci4Vtu9M
         BorXj0hCpCXd8bfEjgVpVcYM4wrgp8l6HRDGNkiHoAcLN4qChtrc65dWuWa3KcapcFRE
         O9YjmE8ZUotJ2UdbIMjXoaNQMVLOmXcKbSJxvCZKU1KdE0cmSXl96frUQk0xD179quD7
         OaatynxkVwgq+HrbWVjM/xidkpTFdGy3Gp/XG7ATR2KIK+jLISVGEOx+JHQRRVEQxMQW
         vGIg==
X-Forwarded-Encrypted: i=1; AJvYcCVLhCxp/tXRezcfdSLH9akdof6fi/oauZoa8hHZ9FTPMObHNBjRr2mYaIiXdc3sHXwwhwAMARuiT+o10vOZdXcJDF0u46iTNh0=
X-Gm-Message-State: AOJu0Ywfipxth1EoIBlIqlhaF6pLAjdhs5wM8ipdeLSu7sm/8hba9AZh
	l9DfGOjxo6NjcUo830Gyk22VEQhcakFW3IYMMFKv+0J/QLtkRmOqRb/gbEVrmuThWWS4RWPRvnB
	j3tqMj/qXlZVqeAg2TDO+Y6w0QvU=
X-Google-Smtp-Source: AGHT+IG3Y418GEJOQa6ZtjMtK0nD0yDxVorgOSwIX1rqkQkDCzulW2MMqAdRjhVFhNSZf35ugKn5Papn4pfeHILmuF0=
X-Received: by 2002:a0d:da82:0:b0:62f:cb31:1be with SMTP id
 00721157ae682-66380f14787mr25593137b3.8.1721139910489; Tue, 16 Jul 2024
 07:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240711193749.2397471-1-tmaimon77@gmail.com> <CAOiHx=kr=_-ra392XH-vR2fG-E5ZVXAutU9OP6xQRrzXSu9ZWg@mail.gmail.com>
In-Reply-To: <CAOiHx=kr=_-ra392XH-vR2fG-E5ZVXAutU9OP6xQRrzXSu9ZWg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 17:24:58 +0300
Message-ID: <CAP6Zq1jmhr4SHDG9+p=64T0AxgRTK7ufgDG7acrg=R5NnEp6JQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] pinctrl: npcm8xx: pin configuration changes
To: Jonas Gorski <jonas.gorski@gmail.com>
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
Cc: benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonas,

Thanks for your comment, will be addressed in next version.

Thanks,

Tomer

On Sat, 13 Jul 2024 at 15:35, Jonas Gorski <jonas.gorski@gmail.com> wrote:
>
> Hi,
>
> On Fri, 12 Jul 2024 at 02:48, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > This patch set addresses various pin configuration changes for the
> > Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,
> > remove unused pins, and improve overall pin management.
> >
> > Tomer Maimon (7):
> >   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
> >   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
> >   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
> >   pinctrl: nuvoton: npcm8xx: remove unused smb4den pin, group, function
> >   pinctrl: nuvoton: npcm8xx: remove unused lpcclk pin, group, function
> >   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
> >   pinctrl: nuvoton: npcm8xx: modify pins flags
>
> You also need to update
> Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> for any changes that affect the device tree bindings (e.g.
> adding/removing functions/groups).
>
> Best Regards,
> Jonas
