Return-Path: <openbmc+bounces-205-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BE5AD8960
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 12:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJb6b4S2Fz2yfx;
	Fri, 13 Jun 2025 20:21:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::92b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749810119;
	cv=none; b=KkSolFl+KQnKm6LRoRaTgQmE/vZ8f/BFZxsPWzqnT4Wx33UfIIo4acWOARHBiGdU/QxLEnwVYaHZ3NudyF29FTw/ZtXDPwrjZnmsog8QdGmXsvWqSIsXgvNM5fi81OTgaQ9k6HAtX6Ns2Jv0X71W5Zeo4Tix9YNwQ7E2Zuukw+ZjGAd8tWj/706KnNGthE4RCEzeyQZ+OhMIsXPcFRTNxVBjaQxExPWbU2gOoeTPabK6/PqdAI1EluljZtgy+rbz+Y5ja10mfpJVb6o2kRzT6oqv9O5GBevHkQlT/yXAU7kX54WEFJ5Y+eC/G3HY7vgcVIbm8cl3YXtteax9mfQqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749810119; c=relaxed/relaxed;
	bh=q97amkqbv8ZyEeF0YwMi9vkf9DpRMWevNWxGC3Gg4S8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dg9jAGr41DPiWAZ8FRekbwoi5oJ6bMcXptg4uHVgRdbHt3AG4L70nfcX9tCljPPP+UgppduK49+IiSS0OHxf4RbV9fY1yUFdsOq8QJevZwX63o9/LyS+h01JouirLsa0EJkPLggGuiSu2JMeFOpZm/bH0GjbfdwYBUCMq+hOytXMAlbpjZ6yhT0FOaHVRH/ebKFJVtgT6623uWBYy/XrcufGAie2Np5Ts4b5x98LeM4puJq4eyuHkKrsEHCViID89kMkagon30oLzIHM+HZaWUikn+ym96WFb86ihIMOBGcD5mrDwkuR7RulANndyeW+JqyavOW5M1sxGOa20JM6Ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eQGbmPkM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::92b; helo=mail-ua1-x92b.google.com; envelope-from=yang.zhang.wz@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eQGbmPkM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92b; helo=mail-ua1-x92b.google.com; envelope-from=yang.zhang.wz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJb6Z5tGGz2yMF
	for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 20:21:58 +1000 (AEST)
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-87ed98a23easo492839241.0
        for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749810116; x=1750414916; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q97amkqbv8ZyEeF0YwMi9vkf9DpRMWevNWxGC3Gg4S8=;
        b=eQGbmPkMjYrDdsBCS/Lo5G+jRHde2L9YR/J3O0BsAJh/kYwKKDYEqHggSdsNyV1b8s
         2jxlMhQCKkvSud4Vdr7KGwne6JEMGvwnKOlMlRKyH0W8NkgFLVoUVYuDrOw3aZkXzFoO
         CcLuK+jm5s9FKaK6gFZAYbQKmh2VtRRSzk13VZSGbkWsa/W3v5G8ekjSJZ9JHgmlzswk
         WnqtBSilpd5mTrY/2eFStokyWAW0txSUwu3973x2kWq5c0j9lwEeVCzB3DrRY63dgbFb
         WhXALVYJKmmRFScKf3Pas6v5rxCYOjoq+x6S0ReSif+HL/xsuiUYdpiQY2t0NSlKH8aE
         1wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810116; x=1750414916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q97amkqbv8ZyEeF0YwMi9vkf9DpRMWevNWxGC3Gg4S8=;
        b=a/WZRk779UdommK9ViuMZid9OQbJaDUoE9pMhBf/CMH0kV/yv7rb66uzq/iQ2cRf1t
         gipnLo3C/NC0VPCYfeYIzp/bLt5bbgl+ZxBcWInsJsQi6zYhUI6J0mPlEn94XP7G33Ab
         N9kdVOeSsKTy0Xb6Xr5YfOx3TX5F7wfRakXCl0r4CesLbo/IuqJtJ6hP3FNzWG5muwAW
         qelI9G6u2e+SCQpPNqieKluivn9os+hNwj/rxKUw6AhdkVdoTntz/ZQt7iI65fhz+POJ
         iHkRE6RK4RzOxRMXEdjb33Ei1u0QofIosGUokY5/Bz59pC2KtXdeiiIItwLIJuh54gim
         NDSQ==
X-Gm-Message-State: AOJu0YweCE3/Dc4mlh67tAZ61xpEgE/TSLMbG11HV8tZMSBb/GmtrF+c
	EJLDI7OkNqXcBp0v2Sl1BIBUGmi6a6g/KSIhRYrSOMH4GlAU/D1ExulLhZpWpOmGg7shedackof
	lWgwYwAPqOPCvwZtrrVLrVJIhMBtPyTGAcYKW
X-Gm-Gg: ASbGncubn4SFuqKfGGvgFfWSjvwWGMUkt1jfGdqsn+BRh+PLLY2QB7aMoVSYERmGm3A
	zIB5Uy6b21VNDLbhcl8GbP+I3zWFOX4j3NsKLS88TjF2rMH8ijct3UzpGTaL+EbCpGYNRDOMzHE
	oHIT997biLwsF1u8Z1mOEj5ALY3iV2QgLP2kB1Brs03aM=
X-Google-Smtp-Source: AGHT+IH9egfv2SQdqWcJ4n4S/hCrJ8d8EwuaTpxG1voAkFE4lJ5JWMGQSToZCUNWD32R3LtxSQ6k5/zWKio3/vn22p4=
X-Received: by 2002:a05:6102:5717:b0:4e7:bf03:cd6f with SMTP id
 ada2fe7eead31-4e7e389207amr1737266137.2.1749810116025; Fri, 13 Jun 2025
 03:21:56 -0700 (PDT)
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
References: <CA+3C=r_DV5kLivbMY-5ALh55ySzdzm6Ss-5Eif9YU27Qn8-mxQ@mail.gmail.com>
In-Reply-To: <CA+3C=r_DV5kLivbMY-5ALh55ySzdzm6Ss-5Eif9YU27Qn8-mxQ@mail.gmail.com>
From: Yang Zhang <yang.zhang.wz@gmail.com>
Date: Fri, 13 Jun 2025 18:21:45 +0800
X-Gm-Features: AX0GCFtiRMKjVn8VmeowuJGh_iWg2tjL3S9EEowh_CRS-U9omsrlgMv4na0MhaI
Message-ID: <CA+3C=r-JOhLJOKQtAFNrMapqwXd6VV13nBGMJ6hCwudOgish1Q@mail.gmail.com>
Subject: Re: How to enable SOL
To: openbmc@lists.ozlabs.org
Cc: Jian Zhang <zhangjian.3032@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I found the reason. The default console ID used by sol activate is
"default". After changing the ID in server.ttyS2.conf to "default", I
can see the host's output via sol activate.

On Fri, Jun 13, 2025 at 4:36=E2=80=AFPM Yang Zhang <yang.zhang.wz@gmail.com=
> wrote:
>
> Hi All,
>
> I am trying to set up SOL on my platform. On my platform, ttyS2 is
> connected to the host.
> I can use ssh -p 2202 localhost to see the output from the host, but
> when I run ipmitool sol activate, it shows nothing except the
> following:
>
> ipmitool -I lanplus -C 17 -H 192.168.10.178 -U root -P 0penBmc sol activa=
te
> [SOL Session operational.  Use ~? for help]
>
> I guess the reason is that I haven=E2=80=99t bound SOL to ttyS2, and I do=
n=E2=80=99t
> know how to do this. Are there any settings to bind SOL to ttyS2?
>
> Or maybe there are other configurations I need to add?
>
> Here is the config I used:
> obmc-console_%.bbappend:
> FILESEXTRAPATHS:append :=3D "${THISDIR}/${PN}:"
> RDEPENDS:${PN} +=3D "bash"
>
> # Declare port specific config files
> OBMC_CONSOLE_TTYS =3D "ttyS0 ttyS2"
> CONSOLE_CLIENT =3D "2200 2202 "
>
> SRC_URI +=3D " \
>              ${@compose_list(d, 'CONSOLE_SERVER_CONF_FMT',
> 'OBMC_CONSOLE_TTYS')} \
>              ${@compose_list(d, 'CONSOLE_CLIENT_CONF_FMT', 'CONSOLE_CLIEN=
T')} \
>            "
>
> SYSTEMD_SERVICE:${PN}:append =3D " \
>                                 ${@compose_list(d,
> 'CONSOLE_CLIENT_SERVICE_FMT', 'CONSOLE_CLIENT')} \
>                                "
>
> do_install:append() {
>     # Install the console client configurations
>     install -m 0644 ${UNPACKDIR}/client.*.conf ${D}${sysconfdir}/${BPN}/
> }
>
> $ cat server.ttyS0.conf
> # console-id is default to obmc-console
> local-tty =3D ttyS0
> local-tty-baud =3D 115200
>
> $ cat client.2200.conf
> # console-id is default to obmc-console
>
> $ cat server.ttyS2.conf
> local-tty =3D ttyS2
> local-tty-baud =3D 115200
> console-id =3D ttyS2
>
> $ cat client.2202.conf
> console-id =3D ttyS2
>
>
> --
> best regards
> yang



--=20
best regards
yang

