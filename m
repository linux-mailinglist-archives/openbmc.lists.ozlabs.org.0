Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537C74CB0D
	for <lists+openbmc@lfdr.de>; Mon, 10 Jul 2023 06:11:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WVcMMJs+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzrCS24b8z3bnf
	for <lists+openbmc@lfdr.de>; Mon, 10 Jul 2023 14:11:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WVcMMJs+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzrBr725vz2yD6
	for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2023 14:10:27 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-765a4ff26cdso365807885a.0
        for <openbmc@lists.ozlabs.org>; Sun, 09 Jul 2023 21:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1688962224; x=1691554224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vu4bncGOf2r6gd15mbRNPHremZRClw1+YV4cm/wM0VQ=;
        b=WVcMMJs+v+tpdeF9p7tXdE9LaIFbWDFi+CXi3ggfnB2+zrGCebBTWg38E5lh2O+ZEr
         6z2bF0ADhJEvj1hjakub1/vcROyiv4/bvxRgm8fybOaZjQFiFOmSUTUZluFrsIIIxCG/
         gh+qnorm300TV0ha22wSq26boBH/4LXrEQsic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688962224; x=1691554224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu4bncGOf2r6gd15mbRNPHremZRClw1+YV4cm/wM0VQ=;
        b=bVZlI3QADmoaVMdZGp0Iwl/GaSlvGMZlO8w9nGycuQXUh8164iXyS27YSRiRYLbk1u
         PjvpO/34XRXiVqp4qMve4FlaE+vuGcEMkoMMq7LtHS6lpZkKAmO5n0yL2lV7o/0uOodH
         Md8JN9pcyPEijNfZ91kBtFY5KQR6LJxTQwlCLlm9Hs+zkRFIqI5fwQhAzfd6d6QhhR0U
         Rcjuh9ViSJMYvI2LriOcjDkUPD5dQDAlRRJlTQdOBvxJtPOISK/Ujm13npXjm9R/l+hA
         9FqiVNNzhqFuM6v479qRgb5eSSy5Vlq2vdI2r7A8jmZRYiqT3SoPYusy54XYrLTOtwms
         cSWQ==
X-Gm-Message-State: ABy/qLYW1wM50AExzzvbzi7wzEm2LnfMvVC7//CxSZBmrTqBPhmfd722
	SysjgiI1qWErHUIZ9RTAz/XLvDhHKikKY1iGuWk=
X-Google-Smtp-Source: APBJJlGQfmtu0lMtuLjMZdR2ztLFif5bPxPPVuptO+gfB1TfmddLG14AYhGhVMkUtL0gMN+mSOIOeAHptrwFl6VYkBs=
X-Received: by 2002:a05:622a:1116:b0:400:ab8e:5f82 with SMTP id
 e22-20020a05622a111600b00400ab8e5f82mr14507393qty.52.1688962224109; Sun, 09
 Jul 2023 21:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhrGTy3_0AsLC24LY9rsMmB6MOvOayG=jT2gRZwceLes0Ogwg@mail.gmail.com>
In-Reply-To: <CAFhrGTy3_0AsLC24LY9rsMmB6MOvOayG=jT2gRZwceLes0Ogwg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Jul 2023 04:10:10 +0000
Message-ID: <CACPK8XcGwTBa1DGuzH5Ux7N-Mbuj4bPcWG25=LCCX=26VGOZ8A@mail.gmail.com>
Subject: Re: Configuring aspeed to use P2A Bridge
To: Adrien Zinger <zinger.ad@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 7 Jul 2023 at 07:13, Adrien Zinger <zinger.ad@gmail.com> wrote:
>
> Hello,
>
> I'm working with an ast2500 and I'm unsure about the required configurati=
on to expose it as a graphic card.  I hope you can help me.
>
> Basically, I changed the device tree to enable the p2a and gfx. I have us=
ed two memory regions in the reserved-memory section for them (I don't know=
 if there are any specific regions to choose). Do you know if some specific=
 modifications here are mandatory ?

P2A is not required for graphics output.

GFX is the internal display device in the BMC. You can use it if you
want to show some output when the host is powered off, for example.

Using the BMC as a PCIe graphics device for the host is unrelated to
these two functions. We often refer to this as the "VGA" device.

I don't know what config you will need to change to get this working, sorry=
.

> I also heard about a possible configuration to open some windows and show=
 up the ast2500 as a graphic card. I'm actively looking for which register =
to modify, do you have any advice ?
>
> Thank you in advance for your help. Sorry if I'm using the wrong mailing =
list.
