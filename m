Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B7B29CDE9
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 06:11:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLcBD55hhzDqRN
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 16:11:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OC6Zm4U5; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLc9N224BzDqPQ;
 Wed, 28 Oct 2020 16:11:03 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id k9so3525186qki.6;
 Tue, 27 Oct 2020 22:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=04ThpYsSViFhWqOQvQSGIlYZRGcXGFtIhUlX8pfHTD8=;
 b=OC6Zm4U5t2xQjcut4yBwkeEk5KarEkjfCrPdUlu381Nv4vJI895Svp7x8sDb3IBxS3
 fPfhT1B7HGC5UpOKgQPbPKJ8OQ+Wh5ei1AjIXfyGnvpaGsc8RYdCba4m2e8dSOSNKG0r
 6IaEkkFLl4zzAivCnLsMl8DdDeZ7xDzu5G81g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=04ThpYsSViFhWqOQvQSGIlYZRGcXGFtIhUlX8pfHTD8=;
 b=CWE8isJlOv2r4IL03rBfneI8HIfLdLX6NhHiuQN8q2CWAjnNSwo+y1nH7pWH57Bgsg
 6rY9WNaqa5wJE8kf5+5+20zf+3m+MP0VyKQAZXzmz1DWChSzUC4s9J4RRlHnGVbT31kJ
 HcBrdofNSCczikSetims6eBl3vNLcqdHJKF3CzFgB4Xx2WRQE9U1cKC9ZG01XMsDf0su
 nrtD+3LKaeZ1t8qjqQImY/4DBx47TaUMeaBSSgswH5ddA1frH4+THGNI12y2TkNiFXNb
 wKyOPvpk9CdNimRCCAI+IbFEtEHAm2RDA3eSR867RSUHKAWxWeNzL+zR0udBSBktp7IF
 bE1w==
X-Gm-Message-State: AOAM533B7Ra629DqMjDS+UB5biIIZTCWkegK1kLsj5jgceyJS+4hflYb
 /5IOgl/JECwOeFsqRCcf6WQaCmjXhdoMNpfzHtfQqAl7rGY=
X-Google-Smtp-Source: ABdhPJyi2tYbl11+8oD/pTg7MqvJo0FJxH9J/m9YOi24yaf3RoUaPY8LWOMrUDpfxRRNH1Z9ZM9QvQ/K9quBWlRWBR8=
X-Received: by 2002:a05:620a:1303:: with SMTP id
 o3mr5853719qkj.66.1603861861220; 
 Tue, 27 Oct 2020 22:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-3-billy_tsai@aspeedtech.com>
 <CACPK8XdYvSmwdAkBzAO3kC8_PYa3CtPkNb0VxcOhmb2UYz5zDA@mail.gmail.com>
 <E0B8BD13-86F6-486E-95DF-1038D7F59A8B@aspeedtech.com>
In-Reply-To: <E0B8BD13-86F6-486E-95DF-1038D7F59A8B@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 05:10:49 +0000
Message-ID: <CACPK8Xeg_LRGv1EEm7cdDWK2xST0mBP=iG7=43UE5qmEMMDsHQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] Arm: dts: aspeed-g6: Add sgpio node
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 12 Oct 2020 at 04:56, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> Hi Joel,
>
> Thanks for the review.
>
> On 2020/10/12, 12:35 PM, Joel Stanley wrote:
>
>     > On Mon, 12 Oct 2020 at 03:32, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>     > >
>     > > This patch is used to add sgpiom and sgpios nodes and add compatible
>     > > string for sgpiom.
>     >
>     > You also need to add sgpios documentation to the bindings docs.
>     >
>     > Whenever you add new device tree bindings to the kernel tree you
>     > should add documentation for them.
>     >
>     > When preparing patches for submission, use scripts/checkpatch.pl to
>     > check for common issues. It will warn you if you are adding strings
>     > that are not documented.
>     >
>     > Cheers,
>     >
>     > Joel
>     >
>    Because the driver of sgpios doesn't be implemented, so I don't know how to describe it at sgpio-aspeed.txt.
>    Can I just add  compatible string " aspeed,ast2600-sgpios " to the document for bypassing the warning of checkpatch?

Ignore the sgpios issue for now; we don't have a driver for it so
there's no need to add strings. Drop that part from your dts patch.

>     > >
>     > >  - compatible : Should be one of
>     > > -  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
>     > > +  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio", "aspeed,ast2600-sgpiom"
>     >
>     > I think we should add sgpiom strings for the ast2500 (and ast2400?)
>     > too, as this is how they should have been named in the first place:
>     >
>    If I change the document whether I also need to send the patch for sgpio driver and g5/g4.dtsi?

For the sgpiom? We already have a driver for that.

As I said above, make this about fixing the sgpio master and put aside
the sgpio slave issue for now.

Cheers,

Joel

>     > >  - compatible : Should be one of
>     > >    "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
>     > >   "aspeed,ast2400-sgpiom", "aspeed,ast2500-sgpiom", "aspeed,ast2600-sgpiom"
