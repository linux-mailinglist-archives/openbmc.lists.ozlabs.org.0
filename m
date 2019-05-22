Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFA25DAE
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 07:38:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4581dR2xsXzDqLZ
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 15:38:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="lHTRhe6r"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4581cs3KvhzDqK1
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 15:38:04 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id i26so916991qtr.10
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 22:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iYNavx0b8gF7mqLp0VMgdrh2/v0zpQv+BB44P4vrjlw=;
 b=lHTRhe6r03cq8D2JO8oCTDOU0NOFJAMRChGTCWEC4qBkBdjUWA8GchRExXTqhtnWJG
 uBiuJY4ECn8DPP9oN/d1+wcgPoohGUQeRrKGisk7sxGPccSUXRH59OBzFH4VC5O5yrON
 YKNrDXEbtII1apIZizBoHf9gnHJK7i50l3xdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iYNavx0b8gF7mqLp0VMgdrh2/v0zpQv+BB44P4vrjlw=;
 b=bcXHrRs9P/C3VNclEEW0mmqGganXxqXGcziosiUb1La+ADS3OTxwjwkicfPPNbOmG/
 6yEiMPOKUue2LrTTzKdNcTiBzZacM6gIebL7YOPONux3V94HWFKAuVxzBQFErhme9726
 TUeH1ov0Hil/wA89vt13e5Lj7wGLC9F839pElWpOPairAwHXU40P6Sp5D2S+OBdoJlFR
 vBjiyopLJJ6w9JK2DXZqU2udcdYatALthmJihoFfn/30UaKgyhkVlagdmmj6l+F+s5dh
 AuQTbyj8nIlll/zmX0i+lz9ZnupipoeBQC6UU5GCQZWxxAvbrrfXScMIvLxu/A/jiZgz
 7nDQ==
X-Gm-Message-State: APjAAAWBf7mWGSUj3TNB1qUdTPOjRnPO3/G2Lu65sx21TVWDH47vFXST
 0Ohpinnh+Ruc05lJK0joyjKvknf7aDvkDACqMgg=
X-Google-Smtp-Source: APXvYqxSBUs2v2qXedjlPQhfCEDJ6o/fR2lBdXSHaxzK5Pv19BYTcXEl4yQkyQrdDBDRM6Cg2XlMdIrdmoRKZu41VKU=
X-Received: by 2002:ac8:460c:: with SMTP id p12mr70136172qtn.255.1558503482425; 
 Tue, 21 May 2019 22:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190516161148.31062-1-clg@kaod.org>
 <005d7fc6-ce77-4209-b37e-5aaefb066ebf@www.fastmail.com>
 <f1bb8a3f-7e98-7b13-2ccc-1b58262e9bde@kaod.org>
 <10007aac-28a5-47d7-be66-a8f9cd4941b1@www.fastmail.com>
In-Reply-To: <10007aac-28a5-47d7-be66-a8f9cd4941b1@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 May 2019 05:37:50 +0000
Message-ID: <CACPK8Xe4b9MvdendfEbN3LAxaaSC0V6V56FzvuFPpPruCXqQXw@mail.gmail.com>
Subject: Re: [PATCH qemu] aspeed: add support for a witherspoon-bmc board with
 128MB flash chip
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 20 May 2019 at 00:56, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 17 May 2019, at 15:56, C=C3=A9dric Le Goater wrote:
> > On 5/17/19 1:00 AM, Andrew Jeffery wrote:
> > >
> > >
> > > On Fri, 17 May 2019, at 01:42, C=C3=A9dric Le Goater wrote:
> > >> Some Witherspoon boards are shipped with a mt25ql01g flash chip
> > >> holding the BMC firmware.
> > >>
> > >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > >
> > > "witherspoon128-bmc" is not very creative, but I can't blame you for =
that :D
> >
> > he.
> >
> > Should we introduce a machine option to set the model name of the
> > FMC flash chip ? I think I tried that in the past but at the block
> > level and mainline did not like it. But we could try at the machine
> > level.
> >
> > Anyhow, it's a good way to debug flash issues on real HW.
>
> Eh. I'm not fussed by a new machine. I wouldn't do anything for the momen=
t.

We could instead add a swift machine with the 128MB NOR. When we get a
model for the SD/MMC it would use that too.

Cheers,

Joel
