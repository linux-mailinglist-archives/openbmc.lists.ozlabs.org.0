Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222C24289D
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 13:27:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRS9X4dKxzDqbt
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 21:27:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=M5msq1YQ; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRS8d1bhzzDqc4
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 21:26:57 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id p24so1804773ejf.13
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 04:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bPjod+rsspzup05RQS5Ux7tJj44MQjE+wvqYWUjtKxk=;
 b=M5msq1YQsMmVi5IZp+mjFy8YexGv/9NNEskz+tqG0x/oBcIXD8IUbLymgscyuom/TL
 I6FnquhxdHswKab1RGIMzJ7zDRMTo27dhfK4H7oGBTZ/tfxWnL6HTfxTuaWR6IlQMdCN
 ZrEWHRubnnT6trldsawURshMdKmNmbo96zxzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bPjod+rsspzup05RQS5Ux7tJj44MQjE+wvqYWUjtKxk=;
 b=XgPGBOnfb+nAj0X1HjLRcrVfKvhcDFU9uEN7PysdBRyxN7i5LfbbQ+WTiGVFq4ITK/
 FugHeAnFRvBpA1WrLjlLdF/W3mcYxdluRE1oFSGfIBlLOxFJt1T0QUbaOdgpyV0c4I10
 OxPT3TB4NOMtWs3zrHcDdrys1cP8eUEeTO14PPOABifGsPsSljn7SD8rpXJ9Amqpobb3
 GR9ktc1UoM4y8FaTcgQQ4gcKh8cFYRjPuHJavy6V1LfcmkeEarYEwuP9/qVGTshSbj/4
 H1FECk44LDmsIVVNGYNH174iQdik4hCZufogniNIFvCv5lU26y8ifARFvg+nGYPlq8qN
 RG9g==
X-Gm-Message-State: AOAM531J4l+UXUdIVGzF5+pEBco6VvfiPe2oY3AkMVhm/+CZb/9voYlk
 +ZoWVOU8hzqQgDFOL/fiT4Mo5L3uiCCO2hRXnv4=
X-Google-Smtp-Source: ABdhPJyzEOByR87lTPp+GshJ7tAjwUik056+XitRz76e6SvL2OA8vOtYnFP7NxWCs3Au5Rlmqv3+rStjv7YJ8DGfsnI=
X-Received: by 2002:a17:906:7790:: with SMTP id
 s16mr32736121ejm.254.1597231612364; 
 Wed, 12 Aug 2020 04:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200812035847.2352277-1-joel@jms.id.au>
 <5735dbed-c339-ee03-d273-f1a130b21344@kaod.org>
In-Reply-To: <5735dbed-c339-ee03-d273-f1a130b21344@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Aug 2020 11:26:39 +0000
Message-ID: <CACPK8Xcryjj3RVgrYtXQSVGxW0x1t2f9k8mkFNpnLVMsNZWFWA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] mtd: spi-nor: sfdp: Revert "default to
 addr_width of 3 for configurable widths"
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 12 Aug 2020 at 07:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 8/12/20 5:58 AM, Joel Stanley wrote:
> > This reverts commit f9acd7fa80be6ee14aecdc54429f2a48e56224e8 which
> > breaks mounting of UBI volumes with the aspeed-smc driver:
> >
> >  ubi0: default fastmap pool size: 25
> >  ubi0: default fastmap WL pool size: 12
> >  ubi0: attaching mtd3
> >  ubi0: scanning is finished
> >  ubi0 error: ubi_read_volume_table: the layout volume was not found
> >  ubi0 error: ubi_attach_mtd_dev: failed to attach mtd3, error -22
> >
> > Found by bisecting between v5.7 and v5.8.
> >
> > Fixes: f9acd7fa80be ("mtd: spi-nor: sfdp: default to addr_width of 3 fo=
r configurable widths")
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > This identifies why we are seeing SPI NOR failures on v5.8. There is
> > potentially a fix that needs to be made in the aspeed-smc driver instea=
d
> > of reverting the core spi-nor change.
>
>
> May be we should introduce a 'post_bfpt_fixups' handler for the mx66l1g45=
g
> instead.

I don't think that will cover it on it's own. This caused a ubi
failure on a system that has mx25l25635e parts.

>
> C.
>
>
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  drivers/mtd/spi-nor/sfdp.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> > index 55c0c508464b..9db07182e9c8 100644
> > --- a/drivers/mtd/spi-nor/sfdp.c
> > +++ b/drivers/mtd/spi-nor/sfdp.c
> > @@ -456,7 +456,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >       /* Number of address bytes. */
> >       switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MA=
SK) {
> >       case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
> > -     case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
> >               nor->addr_width =3D 3;
> >               break;
> >
> >
>
