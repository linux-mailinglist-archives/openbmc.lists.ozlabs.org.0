Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E004054C167
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 07:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNF4W5Wcfz3c7P
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 15:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mLAo8J3Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mLAo8J3Z;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNF482L08z3bnr
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2022 15:59:02 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id h5so13915902wrb.0
        for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2022 22:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G6awAmusFetGYRJytf/eMOr2lEzaAumiZBrndz+RrRw=;
        b=mLAo8J3ZYAKNp5Vw61pbK5CnPHi/TcAi3LdnTP2i57jVaqV5pQjrXpU9TN3TXSAaxc
         bgg09NzvMrpq7b7b9UHgYJ1Gn+1OrYSgDpNtxUTO26z/FokRZHWV1bQpZrH9ZgQ9OdY1
         VhCO+KiLGAeUy3A8VYjmC0o9mDSvwGDYoU05Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G6awAmusFetGYRJytf/eMOr2lEzaAumiZBrndz+RrRw=;
        b=KXJxXg4k9jTZBFeh9ZAvu13sDlbG3iITIs8DY/EgLzxf1KibY8u5we8wFNMl3ns/kq
         YtY2Ev/0xVYYwN4NoT25P0K1tRcJs7UCBSCUDus8NyfMknTG/lALtL0q3e7n3efM6+1M
         xv85JU44ZE5/Z93piiFZuDJPygyGTp9keMQ0aOgFc9pYfaQk0zcW7np7Zjlnm44yDY7H
         v/a/VsQ7sAVy/4J9VJgwbNOOncRIS0leYacl+0PGbFi+YK3sKC5nZYyUB9WI7Aqm/XMn
         vivjAIhneOAefEa/x7ZQJiQqrULdQmohIJnq0AYcAAIsVlF/Hr0ywWfQJgvL2PnN7p2F
         D9xw==
X-Gm-Message-State: AJIora9IaTTKF/DgLeh90WwG+uCpi98XxANRJ/9PIjNk7eFU2nraeqyf
	4rKZaFozunPfJoXJKmuOcoUubAACwTaHU9l6nCU=
X-Google-Smtp-Source: AGRyM1seZ9SObrS03tKaBKbMAkbaYeDzLECiwcJO6XxxeZDC293S19k4hGjRD8XQ73Si3n2BEsPRZ7a5wJoTgNvW2Sk=
X-Received: by 2002:a5d:6510:0:b0:216:f04d:3c50 with SMTP id
 x16-20020a5d6510000000b00216f04d3c50mr7972615wru.628.1655272734534; Tue, 14
 Jun 2022 22:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220610080059.2333501-1-joel@jms.id.au> <20220610080059.2333501-5-joel@jms.id.au>
 <6c3afc64-f046-6708-1248-980202cedff1@kaod.org>
In-Reply-To: <6c3afc64-f046-6708-1248-980202cedff1@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 15 Jun 2022 05:58:42 +0000
Message-ID: <CACPK8Xfpcn7p55ygtszEwbOzGRxMjX3cOzQgwJhgout5gd3pGA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 4/4] config: aspeed: Enable
 NCSI support
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 at 09:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 6/10/22 10:00, Joel Stanley wrote:
> > Now that NCSI can be enabled without breaking non-NCSI systems, enable
> > it in all defconfigs.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> You should add :
>
> CONFIG_CMD_NCSI=3Dy

Was this required, or just something that helps for testing?

Note that you can trigger the same code to run by using any network
command, such as 'dhcp', 'tftp' or 'ping'.

>
> C.
>
> > ---
> >   configs/ast2600-pfr_defconfig            | 1 +
> >   configs/ast2600_openbmc_defconfig        | 1 +
> >   configs/evb-ast2400_defconfig            | 1 +
> >   configs/evb-ast2500-spl_defconfig        | 1 +
> >   configs/evb-ast2500_defconfig            | 1 +
> >   configs/evb-ast2600-cot_defconfig        | 1 +
> >   configs/evb-ast2600_defconfig            | 1 +
> >   configs/evb-ast2600a0-cot_defconfig      | 1 +
> >   configs/evb-ast2600a0-spl_defconfig      | 1 +
> >   configs/evb-ast2600a0_defconfig          | 1 +
> >   configs/evb-ast2600a1-cot_defconfig      | 1 +
> >   configs/evb-ast2600a1-ecc_defconfig      | 1 +
> >   configs/evb-ast2600a1-emmc-cot_defconfig | 1 +
> >   configs/evb-ast2600a1-emmc_defconfig     | 1 +
> >   configs/evb-ast2600a1-spl-ecc_defconfig  | 1 +
> >   configs/evb-ast2600a1-spl_defconfig      | 1 +
> >   configs/evb-ast2600a1_defconfig          | 1 +
> >   17 files changed, 17 insertions(+)
> >
> > diff --git a/configs/ast2600-pfr_defconfig b/configs/ast2600-pfr_defcon=
fig
> > index 398e55d0f3d4..dbe87e35a635 100644
> > --- a/configs/ast2600-pfr_defconfig
> > +++ b/configs/ast2600-pfr_defconfig
> > @@ -120,6 +120,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/ast2600_openbmc_defconfig b/configs/ast2600_openbm=
c_defconfig
> > index de8fca770674..4565c2953460 100644
> > --- a/configs/ast2600_openbmc_defconfig
> > +++ b/configs/ast2600_openbmc_defconfig
> > @@ -116,6 +116,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2400_defconfig b/configs/evb-ast2400_defcon=
fig
> > index f92dbfd668cd..46f9a9467929 100644
> > --- a/configs/evb-ast2400_defconfig
> > +++ b/configs/evb-ast2400_defconfig
> > @@ -56,6 +56,7 @@ CONFIG_SPI_FLASH_SPANSION=3Dy
> >   CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2500-spl_defconfig b/configs/evb-ast2500-sp=
l_defconfig
> > index 0f6780b5e4e8..3467ae6cda2d 100644
> > --- a/configs/evb-ast2500-spl_defconfig
> > +++ b/configs/evb-ast2500-spl_defconfig
> > @@ -70,6 +70,7 @@ CONFIG_SPI_FLASH_MACRONIX=3Dy
> >   CONFIG_SPI_FLASH_SPANSION=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defcon=
fig
> > index 91921cf76e62..d692a0811109 100644
> > --- a/configs/evb-ast2500_defconfig
> > +++ b/configs/evb-ast2500_defconfig
> > @@ -57,6 +57,7 @@ CONFIG_SPI_FLASH_SPANSION=3Dy
> >   CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600-cot_defconfig b/configs/evb-ast2600-co=
t_defconfig
> > index b656e528c855..06fc84b139a4 100644
> > --- a/configs/evb-ast2600-cot_defconfig
> > +++ b/configs/evb-ast2600-cot_defconfig
> > @@ -105,6 +105,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600_defconfig b/configs/evb-ast2600_defcon=
fig
> > index 3e302e51ef2f..d0d867adb0e8 100644
> > --- a/configs/evb-ast2600_defconfig
> > +++ b/configs/evb-ast2600_defconfig
> > @@ -75,6 +75,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600a0-cot_defconfig b/configs/evb-ast2600a=
0-cot_defconfig
> > index 1a377736ea4a..826e7b34e22a 100644
> > --- a/configs/evb-ast2600a0-cot_defconfig
> > +++ b/configs/evb-ast2600a0-cot_defconfig
> > @@ -91,6 +91,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600a0-spl_defconfig b/configs/evb-ast2600a=
0-spl_defconfig
> > index 69548bcddeda..a88a14411f7b 100644
> > --- a/configs/evb-ast2600a0-spl_defconfig
> > +++ b/configs/evb-ast2600a0-spl_defconfig
> > @@ -92,6 +92,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600a0_defconfig b/configs/evb-ast2600a0_de=
fconfig
> > index 51cf6ac3ca35..358c31511297 100644
> > --- a/configs/evb-ast2600a0_defconfig
> > +++ b/configs/evb-ast2600a0_defconfig
> > @@ -69,6 +69,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600a1-cot_defconfig b/configs/evb-ast2600a=
1-cot_defconfig
> > index b656e528c855..06fc84b139a4 100644
> > --- a/configs/evb-ast2600a1-cot_defconfig
> > +++ b/configs/evb-ast2600a1-cot_defconfig
> > @@ -105,6 +105,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600a1-ecc_defconfig b/configs/evb-ast2600a=
1-ecc_defconfig
> > index c637bac65472..cda88addfa43 100644
> > --- a/configs/evb-ast2600a1-ecc_defconfig
> > +++ b/configs/evb-ast2600a1-ecc_defconfig
> > @@ -70,6 +70,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600a1-emmc-cot_defconfig b/configs/evb-ast=
2600a1-emmc-cot_defconfig
> > index 68ac56cf170c..552bb6b104a3 100644
> > --- a/configs/evb-ast2600a1-emmc-cot_defconfig
> > +++ b/configs/evb-ast2600a1-emmc-cot_defconfig
> > @@ -101,6 +101,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600a1-emmc_defconfig b/configs/evb-ast2600=
a1-emmc_defconfig
> > index ce3bd5e07dba..b7e4e9df9646 100644
> > --- a/configs/evb-ast2600a1-emmc_defconfig
> > +++ b/configs/evb-ast2600a1-emmc_defconfig
> > @@ -102,6 +102,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600a1-spl-ecc_defconfig b/configs/evb-ast2=
600a1-spl-ecc_defconfig
> > index 245dee329eb7..530199913d28 100644
> > --- a/configs/evb-ast2600a1-spl-ecc_defconfig
> > +++ b/configs/evb-ast2600a1-spl-ecc_defconfig
> > @@ -119,6 +119,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600a1-spl_defconfig b/configs/evb-ast2600a=
1-spl_defconfig
> > index be6a1d8a2328..4be5b6c95b41 100644
> > --- a/configs/evb-ast2600a1-spl_defconfig
> > +++ b/configs/evb-ast2600a1-spl_defconfig
> > @@ -119,6 +119,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
> > diff --git a/configs/evb-ast2600a1_defconfig b/configs/evb-ast2600a1_de=
fconfig
> > index 68ff5547b789..c0db1d56db26 100644
> > --- a/configs/evb-ast2600a1_defconfig
> > +++ b/configs/evb-ast2600a1_defconfig
> > @@ -73,6 +73,7 @@ CONFIG_SPI_FLASH_STMICRO=3Dy
> >   CONFIG_SPI_FLASH_WINBOND=3Dy
> >   CONFIG_PHY_BROADCOM=3Dy
> >   CONFIG_PHY_REALTEK=3Dy
> > +CONFIG_PHY_NCSI=3Dy
> >   CONFIG_DM_ETH=3Dy
> >   CONFIG_PHY_GIGE=3Dy
> >   CONFIG_FTGMAC100=3Dy
>
