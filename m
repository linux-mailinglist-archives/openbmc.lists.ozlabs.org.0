Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDFA35679
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 07:56:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JdM76SrtzDqWd
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 15:56:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="XXZsjiJ6"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JdLK3v1pzDqT6
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 15:55:20 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id c70so4425486qkg.7
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2019 22:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=llJZIKb+oLDVaFmJc+KLIfBIeslW5YaU+W9qr8lfrMg=;
 b=XXZsjiJ6Z0E9n3Cck5eY2fhi5I7QXZWPPW3+k5u1OzoT2DChGXXzsVrKp1XZpPD1GX
 yHEe6uRUF0+gY4XI2cLix7hPvlveudcMnPYjxAgD5BdUQhox9+CXM5pJINOCdPiKP5kW
 kr2m4F3lioC4L5Y1KC2gXPfyeLPR4Vk7nz6Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=llJZIKb+oLDVaFmJc+KLIfBIeslW5YaU+W9qr8lfrMg=;
 b=sRPntnhroPdufJ0feES0gGKYWKXXdjjvLFiMY3H1BidQcjQc8TbPD9AXgzZYcT3dLv
 gh2gbqi9GtnhE7ipgWlexjjc2fdiFxBs4B3l450Zy9yR91iAs254rxIoaPgBcvIysqBj
 3REfvmuGfXRKL3yKI7DFUbxUwSuQ0sRwfD2fdjjx/nf0DpzsbVPeFK2RU937jqxmRqqA
 H8EPHKxLmAwTCc8+tJTLBVowu/HDlPothoS1Zxhsf5swHAbjQstDza7rt5Z/7k7DXHwf
 OP58tWKqnJxClGMSXKgIKVasNnm9dFaDOm0yehlpjubLpizMVxjtnZG+07qtVYtZe29x
 1xsQ==
X-Gm-Message-State: APjAAAXXF3wT7HcGqE8EFJkBZV/giiNRp7aufaqyrnIP0yKtmIhaEE4d
 ztE/KS8Wu9GqwpTnTB7IGaI59Hi/T1Q1Nxsb9Pw=
X-Google-Smtp-Source: APXvYqzqYLMQ96Wn0vy1h0iS4EPqAe22rfbk77VY0AekbqcNsAed4GcHIJDz1H/PeGGXMGvPrtPrV1k73+RPUnJ0NQw=
X-Received: by 2002:a37:a10b:: with SMTP id k11mr32021240qke.76.1559714116820; 
 Tue, 04 Jun 2019 22:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190523105448.26300-1-ghung.quanta@gmail.com>
 <CACPK8XfMYOZkrfRcMgnwQ_JMLpqMRh-2har+=wrrL893+6qG=Q@mail.gmail.com>
 <361582a466b54d868950bef3b3b08236@quantatw.com>
In-Reply-To: <361582a466b54d868950bef3b3b08236@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Jun 2019 05:55:05 +0000
Message-ID: <CACPK8Xe5=R4n76oKCs1D=V5uqhEaKyQ4-qRdMiGT=rKK0ZaekQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v1 1/2] edac: npcm: Add Nuvoton NPCM7xx EDAC driver
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 George Hung <ghung.quanta@gmail.com>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>,
 "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 4 Jun 2019 at 08:19, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) <Geo=
rge.Hung@quantatw.com> wrote:
> > > Add support for the Nuvoton NPCM7xx SoC EDAC driver
> >
> > I would like an ack or review from someone familiar with the Nuvoton sy=
stem.
> > I can then include it in dev-5.1.
>
> I have already found the Nuvoton contributor to review my patch.
>
> https://lists.ozlabs.org/pipermail/openbmc/2019-May/016427.html

Cool. I did not recieve this email due to a glitch, but I see it in
patchwork. I've now merged the EDAC driver to dev-5.1.

You might need to resend the upstream patches to the correct
maintainers so they can get merged for 5.3.

Cheers,

Joel
