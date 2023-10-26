Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE84D7D7AC4
	for <lists+openbmc@lfdr.de>; Thu, 26 Oct 2023 04:16:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bAqs+LDJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SG8Y74Gw0z3bV7
	for <lists+openbmc@lfdr.de>; Thu, 26 Oct 2023 13:16:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bAqs+LDJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SG8XV3hH2z2xdV
	for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2023 13:15:36 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c50cf61f6dso5787231fa.2
        for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2023 19:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1698286529; x=1698891329; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=usNUlAmYMwIKYCQF+Z6iC/wBwmcnrqpO4e78KUuoiUY=;
        b=bAqs+LDJh83eRAcPt+om0fKVJTrKmTUyFAOJ8rOgJ8SigHplhHu6WskCkSeZSReocK
         +vm8PynlJmNeRauxZMEzxbtaaIJHD3rtyzjetnpRs7qSuI9i8ZGsp8u3C9ntzhmCpC6R
         90G4IHR+DVYYzqVZZXp7hz1fJMDLRJ+D24OTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698286529; x=1698891329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usNUlAmYMwIKYCQF+Z6iC/wBwmcnrqpO4e78KUuoiUY=;
        b=nDLDYLUevxLgQPh5VW7Zm2UJnOemhu2Bwxgvpwd/vb29QKKnl174JkSA9TCj53gsJK
         nw18KJirguRWgzh7OUJJ3mIe76fRCWxEvK8ZswdScMgvDLxntDq0zg4djxATurno6qVS
         WOgtD5wYmyykY7VuQZvsxliT4uZ8O+HfBQEA+vZlKzUzRaXpbxJM3Ou69XBBMxIo1Dnw
         gJPRfcAGzs/99zH1X0wFuxuDMR8dWNauVjUixL+RlscAScGlhGbCp8gRjvyPdldb0K7M
         NWTfTTtx6qbbAUAq0Lk1SduI7uwcN10B/Xn+oyLiM2NnzCcd/fu3r4lGot/5Az6p83dr
         MkFg==
X-Gm-Message-State: AOJu0YzPztxK3X0ALui1ZTHVb5ivgcy0AkNoNhlEj4hV4rVvEj2+SkxZ
	R3bITrtRipVXp2sKQnL1/viAC/hTXwleKuFPgxs=
X-Google-Smtp-Source: AGHT+IF9v7WKvkZX6zgQCbAn203sNgtUDFFmKIMZnLXG6WCj5+0f1gelzEhR8dfeV/P3oHX0wrNmRUVw6yN64X7BkDo=
X-Received: by 2002:a19:5f1c:0:b0:507:a00a:262b with SMTP id
 t28-20020a195f1c000000b00507a00a262bmr11212639lfb.68.1698286528808; Wed, 25
 Oct 2023 19:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <fc831d1a-2d4a-02fb-89c4-f05543159b9b@linux.ibm.com>
In-Reply-To: <fc831d1a-2d4a-02fb-89c4-f05543159b9b@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Oct 2023 12:45:17 +1030
Message-ID: <CACPK8XeYAR=H-B8zKH+2D=VVaKPowFAyoJsC9FAPEmWsNqay0Q@mail.gmail.com>
Subject: Re: QEMU command line for running evb-npcm845 image
To: Stefan Berger <stefanb@linux.ibm.com>
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
Cc: kwliu@nuvoton.com, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 20 Oct 2023 at 05:33, Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> Hi!
>
>    I am assuming that running the 64MB image with qemu-system-aarch64 is
> possible somehow, but I wasn't able to run it:
>
> $ /usr/local/bin/qemu-system-aarch64 --version
>
> QEMU emulator version 8.1.2 (v8.1.2)
> Copyright (c) 2003-2023 Fabrice Bellard and the QEMU Project developers
>
>
> I get now output with the following line where I am pasisng size=32M for
> the image, which is probably wrong anyway:
>
> $ /usr/local/bin/qemu-system-aarch64   -machine npcm750-evb -nographic

This is the npcm750 (a 32 bit arm machine), but you're trying to run
the npcm850 image. That won't work.

AFAIK there's no modelling underway for the arm64 machine.

Cheers,

joel
