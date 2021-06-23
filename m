Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0512A3B1157
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 03:29:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8lzL5FL5z306G
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 11:29:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=h6HtKeuu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=h6HtKeuu; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8lz40RyWz2yYG;
 Wed, 23 Jun 2021 11:28:46 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id q64so1137232qke.7;
 Tue, 22 Jun 2021 18:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YihVgOY8TwEPpiOkTOB6VSMy81BFPn0G4/r4cZlKARU=;
 b=h6HtKeuuzbR1C3owcO0xFjKJVscG5emqOGf4jaME34Ox5Z0z+XunBQAaDz6fX8+mJi
 DOBJtXzbSWp1AtJ5hFyHmlDHda8b6soWie5BzE+AS8s04xWIKCz2RT63aMSRaGlngYyy
 tiWQL68T9VN7xibaJfPK6E2gMgFMq7azN2v6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YihVgOY8TwEPpiOkTOB6VSMy81BFPn0G4/r4cZlKARU=;
 b=JfuZavEPaykm7bqt57sB4+h6U18vS+j7EB73EAkI9WVenSCHTaDEXbSE+Y/qhFJHDJ
 ahbuk81T6oMalWVsikbpooOorH/TOBCbwKm/3D9NaxEURQoRisFC+Llk0KPhhrV1GBFf
 q75LVTBgWFdTkiLYAwXrvW804NbSHjbmddDwKYXySY30jcuTiFXSHgm5Jh3N070xEXT3
 jbccUM1tJd9K8DGygGjl+E6wtgs6MlFcAvJQ18AmQdDm/AtPtFD3IejOO5nM962V//eD
 X2ppE3zviTgy8SpjPC7bHmOfQWd4bHD5r78JWYnGPqkFHmH0A5TD7JdHsqrRKV7fQN54
 qQ2Q==
X-Gm-Message-State: AOAM533krEwOvg6axpHBeZNxqkSSFuy9Wke+eU/sS9WWYbi4gxJEQAXx
 KyBjW3odEt/pAPfbT+AmoogjXbjxy0bmwxHKQu4=
X-Google-Smtp-Source: ABdhPJzDrhHRH/hrTsdTFqtUtm6tkSuJO4U72qCDdtebzW4JQuqQtn8OEgyTD9raPW913ddKGNN+uwWgsRw+3kNWXa4=
X-Received: by 2002:ae9:f401:: with SMTP id y1mr7329348qkl.273.1624411721580; 
 Tue, 22 Jun 2021 18:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210610202940.3650554-1-bjwyman@gmail.com>
 <d0e66d10765ae85b1bd939ddacc7f7d861190196.camel@linux.ibm.com>
In-Reply-To: <d0e66d10765ae85b1bd939ddacc7f7d861190196.camel@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Jun 2021 01:28:29 +0000
Message-ID: <CACPK8XcvJZYex4crPDz-uSpqLymA2=SseyO+fK1_qCnopRffFA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Everest PSU #3 address change
To: Eddie James <eajames@linux.ibm.com>
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
Cc: Brandon Wyman <bjwyman@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 21 Jun 2021 at 19:09, Eddie James <eajames@linux.ibm.com> wrote:
>
> On Thu, 2021-06-10 at 20:29 +0000, Brandon Wyman wrote:
> > From: "B. J. Wyman" <bjwyman@gmail.com>
> >
> > The third power supply had an I2C address conflict with another
> > device
> > in the system. The device will have the address changed from 6Ah to
> > 6Dh.
>
> Thanks Brandon.
>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>

I've applied this to dev-5.10.

I'll try to remember to get the change upstream too.

>
> >
> > Signed-off-by: B. J. Wyman <bjwyman@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> > b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> > index 3295c8c7c05c..480cb6604c7d 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> > @@ -536,9 +536,9 @@ power-supply@69 {
> >               reg = <0x69>;
> >       };
> >
> > -     power-supply@6a {
> > +     power-supply@6d {
> >               compatible = "ibm,cffps";
> > -             reg = <0x6a>;
> > +             reg = <0x6d>;
> >       };
> >
> >       power-supply@6b {
>
