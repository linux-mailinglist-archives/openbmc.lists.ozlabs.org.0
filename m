Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5426F3DB1
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 08:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9VvK5YGNz3bxL
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 16:45:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VB5bHCv6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VB5bHCv6;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9Vtl3zxCz30hh
	for <openbmc@lists.ozlabs.org>; Tue,  2 May 2023 16:44:46 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-958bb7731a9so687190866b.0
        for <openbmc@lists.ozlabs.org>; Mon, 01 May 2023 23:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1683009880; x=1685601880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ9qeF/VP2jKb32+N6ZIUn5RE3E3jKdxFmUNA6Un+ic=;
        b=VB5bHCv6girTIbfSK7SmK9dgy2Ilng03MogEmcZMFX7OqLmqr9T2/W3PpPYxVCPxn2
         otBUUrcZKg5rZfSl1rlNEDJrWzqfgT4HAVh8092wrzWyI/6A9oOjG3+KkmNvINnrRPSZ
         dPTkYexfW9xsiF66hVSdSVBZBP7Pp3+y67PE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683009880; x=1685601880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQ9qeF/VP2jKb32+N6ZIUn5RE3E3jKdxFmUNA6Un+ic=;
        b=VHSqUKSH4eQxYPKsnZ9CCJ3LUgxsoOsnWhHtGqp+SDwig6ULkSK2G/2aG80qP7ffu6
         K+vIjjSqPnkadDq4ed/gjfcy/F4cf4FpSsXlpwqMf5APMT/yrl3+vblIhgDK5RdNxDNc
         bT8alSSdsYqZUTHI37MPr1pu92J6ZToC7qx95lx67e9rQOv1UeEJWPdJB4AgAecFghQj
         hnAi1jxD5/3u06V75189bfu6FXmkLl0vPwzWLnEBZVRK5T7FwDjB8TgGBlLJoMTG6Y1v
         lysyamXjQ4gvKbGWGyHv27mHBsUbIZj8de7A035uG99MxRL3Zcgdn56BeCBvNqF4d8+F
         OhMw==
X-Gm-Message-State: AC+VfDy0885jgUtpVHavzdA4FHRu8KwWK8DECtc46wS9FXJlbbsFVPLA
	7Y4uFrHv7mnM0QOiT2ZSFrNn0hkjGZ5D3RRG9DY=
X-Google-Smtp-Source: ACHHUZ5zBHsYSPJh360cncD3PTkTb9wzOHfeqHgKZ9OnU8AindqPNBAeoS0kQeHQUEpfsIydKp5oqFxyvll/cMDzdd4=
X-Received: by 2002:a17:906:dc8c:b0:933:4d37:82b2 with SMTP id
 cs12-20020a170906dc8c00b009334d3782b2mr17988715ejc.57.1683009879595; Mon, 01
 May 2023 23:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <ZEwbPFW5p6jB0kLR@probook>
In-Reply-To: <ZEwbPFW5p6jB0kLR@probook>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 May 2023 06:44:26 +0000
Message-ID: <CACPK8XcONxSRa=5vq3uDxiAQww6ULVJr+OkQp3Q72MDLSJrBnQ@mail.gmail.com>
Subject: Re: Upstreaming Nuvoton EMC (100 Mbit Ethernet MAC Controller) support
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: Avi Fishman <avifishman70@gmail.com>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 28 Apr 2023 at 19:15, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> Hello Avi and others,
>
> in my ongoing project to support the Nuvoton WPCM450 BMC in mainline
> Linux, I have reached the point where the next useful step would be
> Ethernet support. The WPCM450 contains a Nuvoton EMC, which is also used
> in some older Winbond SoCs, and newer Nuvoton NPCM7xx BMCs.

That would be a great contribution.

I have a npcm750 eval board that I can test it on, please cc me when
you post the patches.

Cheers,

Joel
