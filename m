Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3447A810D95
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 10:45:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lBGqeIHv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqrF16jbgz3bx2
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 20:45:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lBGqeIHv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqrDQ5TnWz30gL
	for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 20:44:37 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dbc666461daso3999922276.0
        for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702460672; x=1703065472; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ASYoeG+9AFvYeeDJHcee3eBqiXqRIFwrkc299zj/Pws=;
        b=lBGqeIHvuJfoZVOlBf/tiR+2kMdNBXv33H0DBvzGMSsTbKpzLZBtzLpwZqD8q/MPlY
         erlVUwQ5XfiwGQFsynRMUBiy0Is0uxczaK2Cyo7i/isb5VCWNc9fWtvY9exov2eP6hgz
         cL/gqWjhk7zOeNMU/6mg/+mvG4Kb87No+QIs/qGMNa1d9X11BSKjC9A2vEIJUVvRrGYi
         wckn72Nw884aOgIyifaTz8VX7jEBC7JYTN4hif4FFz2K2F4RbLC88cqg2Q5Gd3W7SMrz
         YGFmMYJGG6r4VttSN9w6Qu9OXAoAq4ZClObTJiVPqHeKmYlrBYELT1nPbKW72s9fi+D0
         ok+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702460672; x=1703065472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASYoeG+9AFvYeeDJHcee3eBqiXqRIFwrkc299zj/Pws=;
        b=HXEFQw4UE4hA5SKQk1rqmXruHUXnasQH4SgVKi9HZ41jNnLOQWLhf5oJbM0k7Y+anP
         0q8ECWMjpomMEb534PWYhQTV+T5Ig/fVAktoqcgC4h+PJCb0N79EiSFrQSHtehlj76rD
         kUxoBQzaIg0ipm+I1OlSfbOAnbRf8nZAnAEfDmrIPJreTyKkreZWjIk8G0lC4ek7rmZq
         h8JUA+dwDPJ0bBL7S0FXEQh1FGUxgNSU5kn17C2C5BnDExH3/nP8LSgYHQkbB+0rt5ux
         c2gRXL1R6jYDshYrSEbHKes3KhmYcy/dvUlhj/omqzeYRTzWeE3v1VkPjWoWnLkzvR6B
         vlLA==
X-Gm-Message-State: AOJu0Yz+XmbL8+No8XY169/JjV+XMCGoXnSppMyBYnI8sgLTJ8D7VQSD
	9CW/IWOA3QPd5PjwuhyHy+kEygP9q/MsHv3ZVBE=
X-Google-Smtp-Source: AGHT+IFReZMPdh5wXkNk5emmDJZPdiX21eGS/QS6mi/SzTILCLuAo7qMjKxWOkz2Q1T/74u/1LVTt+yT2DQIlorAmDI=
X-Received: by 2002:a05:6902:1b83:b0:db5:4589:6b61 with SMTP id
 ei3-20020a0569021b8300b00db545896b61mr6408136ybb.18.1702460672466; Wed, 13
 Dec 2023 01:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20231212100703.3374555-1-tmaimon77@gmail.com> <3cb1647d-c58e-4040-9e3a-61965e6a08ac@linaro.org>
In-Reply-To: <3cb1647d-c58e-4040-9e3a-61965e6a08ac@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 13 Dec 2023 11:44:21 +0200
Message-ID: <CAP6Zq1j2O_Y7oApBp2dJJzEmrtO2fYzc8xKA9Jsr3BTimLfmMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] soc: add NPCM BPC driver support
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
Cc: pmenzel@molgen.mpg.de, conor+dt@kernel.org, benjaminfair@google.com, arnd@arndb.de, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your comment

On Wed, 13 Dec 2023 at 08:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/12/2023 11:07, Tomer Maimon wrote:
> > This patch set adds BIOS Post code (BPC) support for the Nuvoton
> > NPCM Baseboard Management Controller (BMC).
> >
> > Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable
> > I/O addresses written by the host on the bus, the capture data
> > stored in 128-word FIFO.
> >
> > NPCM BPC can support capture double words.
> >
> > The NPCM BPC driver tested on NPCM750 Olympus board.
>
> Where is the changelog?
Sorry i forgot to add the change log, I will do it in version 3
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
