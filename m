Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8C25B24
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 02:25:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457thg0XwnzDqNH
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 10:25:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=bjwyman@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fsIHPyKK"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457thB3fwdzDqHh;
 Wed, 22 May 2019 10:25:30 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id i8so459495oth.10;
 Tue, 21 May 2019 17:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DwuJyZwaLvIDDxBhFBO0BshBXhlB5W5Q6pBRdl13oo4=;
 b=fsIHPyKKJzzd89IIIzBR6lHbC0kK7Qid9B6DvAXM7RvcrRSbDFi91J194U/Nc8WZ0V
 d0oTnkm0zJZ5gyIJhZzUp8HEX4zkzBmKYlfEf5EQjtX3cT9rinfqyTDnhSQECj+9RY7B
 u39kPXaD6a+QA61YTABGllkOrBtx/oqVpojSzi2Ev7LzJwiKyWb9vtlgbpKwcHjuG760
 p3R10AiyQDGhOoPpcZ2bPMj22L72DSqzdPjs0xqEqXe1n2qgUkPCSVMV4y/PNk171CPo
 QSof6bPble8S/dWYawkTI3k+o0yES1/czPNof5hr73twEovgsQ0pIYDnARsO7s8ZxRI+
 P2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DwuJyZwaLvIDDxBhFBO0BshBXhlB5W5Q6pBRdl13oo4=;
 b=mITNS0eIts0I6Dx1rjiuzBArtZsdaYm7X/of+9i+dm2Tca4J7zIMy9Jt2t/H3MBLFy
 s+MzVxxib6u31SiohvtLPOfqGsuOL5IJOeGX7wrnt3lW+vJU9MYNrAiVYVn/f6E3MNxr
 SBT0Z4UOYc0vRUE+8ocaKelomWda1KrBhcCgULOIGkM7i2UHifYHglKbzCzVrq2nHWID
 0UJreyuxA2aWTe+OvZb7536/nsyiw26EObQ+zNcRufQT7KEqHkAJ4dUrBpdern4lLmu9
 +6TVN2/SIjg8XdCzhy2wdESpfn8UWr8idks6jviBGoWXjm4x1+E8bKvMhwkNS2aURAqk
 vSMQ==
X-Gm-Message-State: APjAAAXhJZxdDprbDW4MmnRAAnRE6yvyDxvf92wTVF+L548mHSpksOTj
 9LpnG8o1AmuIdthgw6VTbtpvUe0SRnlwYw1Yb3E=
X-Google-Smtp-Source: APXvYqwCqKlOgF7iNDiLVugzRv9gODZgkQSdqRdgIGpWjdgdzbAjWKMvBoIgJx5F7D98JarwC2DDhrBAMP5HMqN0ovw=
X-Received: by 2002:a05:6830:1551:: with SMTP id
 l17mr17153320otp.187.1558484726828; 
 Tue, 21 May 2019 17:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <1558383435-38811-1-git-send-email-anoo@linux.ibm.com>
 <CAK_vbW2474g00xqoNU-Qd5DJ31mk5vcQvcr1GKxL8mGZ-Dqxfw@mail.gmail.com>
In-Reply-To: <CAK_vbW2474g00xqoNU-Qd5DJ31mk5vcQvcr1GKxL8mGZ-Dqxfw@mail.gmail.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Tue, 21 May 2019 19:25:16 -0500
Message-ID: <CAK_vbW1fodzoYBAtqFg9w3i+kK5W3Yt4GczxukSfMHN80rku9Q@mail.gmail.com>
Subject: Re: [PATCH dev-5.1] ARM: dts: aspeed: swift: Add pca9539 devices
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 7:23 PM Brandon Wyman <bjwyman@gmail.com> wrote:
>
> On Mon, May 20, 2019 at 3:17 PM Adriana Kobylak <anoo@linux.ibm.com> wrote:
> >
> > From: Adriana Kobylak <anoo@us.ibm.com>
> >
> > Add the pca9539 devices to the Swift device tree.
> >
> > Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

Reviewed-by: Brandon Wyman <bjwyman@gmail.com>

> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 146 +++++++++++++++++++++++++++++
> >  1 file changed, 146 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> > index 9610637..270c923 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> > @@ -732,6 +732,79 @@
> >                 compatible = "infineon,ir35221";
> >                 reg = <0x72>;
> >         };
> > +
> > +       pca2: pca9539@74 {
> > +               compatible = "nxp,pca9539";
> > +               reg = <0x74>;
>
> This looks like the right bus, address, and chip/compatible type, but
> what follows after I am not 100% certain on. I do not know the
> specifics of how to indicate these are input GPIO pins.
>
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +               };
> > +
> > +               gpio@8 {
> > +                       reg = <8>;
> > +               };
> > +
> > +               gpio@9 {
> > +                       reg = <9>;
> > +               };
> > +
> > +               gpio@10 {
> > +                       reg = <10>;
> > +               };
> > +
> > +               gpio@11 {
> > +                       reg = <11>;
> > +               };
> > +
> > +               gpio@12 {
> > +                       reg = <12>;
> > +               };
> > +
> > +               gpio@13 {
> > +                       reg = <13>;
> > +               };
> > +
> > +               gpio@14 {
> > +                       reg = <14>;
> > +               };
> > +
> > +               gpio@15 {
> > +                       reg = <15>;
> > +               };
> > +       };
> >  };
> >
> >  &i2c10 {
> > @@ -756,6 +829,79 @@
> >                 compatible = "infineon,ir35221";
> >                 reg = <0x72>;
> >         };
> > +
> > +       pca3: pca9539@74 {
> > +               compatible = "nxp,pca9539";
> > +               reg = <0x74>;
>
> This looks like the correct bus, address, and type as well, but again,
> not sure on how to make sure they are GPIO input pins.
>
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +               };
> > +
> > +               gpio@8 {
> > +                       reg = <8>;
> > +               };
> > +
> > +               gpio@9 {
> > +                       reg = <9>;
> > +               };
> > +
> > +               gpio@10 {
> > +                       reg = <10>;
> > +               };
> > +
> > +               gpio@11 {
> > +                       reg = <11>;
> > +               };
> > +
> > +               gpio@12 {
> > +                       reg = <12>;
> > +               };
> > +
> > +               gpio@13 {
> > +                       reg = <13>;
> > +               };
> > +
> > +               gpio@14 {
> > +                       reg = <14>;
> > +               };
> > +
> > +               gpio@15 {
> > +                       reg = <15>;
> > +               };
> > +       };
> >  };
> >
> >  &i2c11 {
> > --
> > 1.8.3.1
> >
