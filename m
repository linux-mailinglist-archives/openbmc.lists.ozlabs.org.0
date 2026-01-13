Return-Path: <openbmc+bounces-1182-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D0D1B4EB
	for <lists+openbmc@lfdr.de>; Tue, 13 Jan 2026 21:56:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drM3l2nT4z2xWJ;
	Wed, 14 Jan 2026 07:56:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768337779;
	cv=none; b=Ge5uwrRVtH94/D24uOqjoeHS+dGJeHujfn6QDvgF3XlJKx1mutFIW5KhaX6kY//Ke4wSyscr8n0VvIX1nuK37W/4yA8n9B27BIfONa/DROOY6cJimKcBuyD3VNM+QDkt+nJoRm70zqPK4G0zaq2RIc2fouvlsKCyvYWRziOAmelizimNNzxSQMT6Nl1EgFRj+OaSc5+BtxW+nNdeI66UjlUARYdoADaFaDs7HxGo+CqpM/HrJnPpDCnqWEQkaFuoLwwK5sSO/jW0YpJbBMTv9fZgtmr/0rNdtsHb8ZmbwZV3VudTQvZQ9cRLLa98Beg5uge2gLW1/S33Zdvph3mruA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768337779; c=relaxed/relaxed;
	bh=5pHsVJecFD4YbT0rXEDVv0Au939ch3w9H6zdTMjQty8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AcYUP/rxeDKeYO+ETdM/kbf4l55E7CgwiI/gjTeSr3LHLb/zenJ5H6sVzFIeCJ2nV3qUbr7fdVVhozwJEPJaFf6eNe79kqmMbm5QRcNXdD+bnOKegVTh8Q8dD0eXnFMowNwdvwmhzLaCH8tJ06O89Fir8yh5hDhdW88XWAvH3zhBjroEWdp2URHnoRKCuajGafsVbCVC465uAl8EPsD4D7dbM51EDojup4hrgsRGS/s7zdChm8MQi0xaP/FiuJJ1shWd0588YEvTwCW35kgSxoicdm480XZggMYXEPfZDZmA/eWmWGYW8zcXlKE8h6HJPWqwWTCqaRdhIfUkHTRYTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nb/tU+Cz; dkim-atps=neutral; spf=pass (client-ip=209.85.167.42; helo=mail-lf1-f42.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nb/tU+Cz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.42; helo=mail-lf1-f42.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drM3j54gTz2xQs
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 07:56:17 +1100 (AEDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b7bb3b913so263670e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 13 Jan 2026 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768337713; x=1768942513; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5pHsVJecFD4YbT0rXEDVv0Au939ch3w9H6zdTMjQty8=;
        b=nb/tU+CzTYqH/wX7LzAlVBzccc5U627Kv5ofhc4xRzJxt3+0V8IvbzxhiA4ntnqV5f
         8ae3zCKoRhX1+hROK1JIHvzIAi+NRtjmdZjReY6iz34I4p7m5eXzTZkNiqg2vLp+JCq2
         iNxMCUYx8DS2Wc6X7JQ1ouSmKIupHY7VN/036pgCZvinroQaKSKfppKvpBA/SCkah6ns
         8eQbwVLWOn4P7iX2oILpmpJ+mkkFShMqales3WVj6YlWWLUgJFeD/4BMeH9q0t3fLytK
         jZTGUi8lCuQfmlCKfmhgx6R5lJZXnMPwpOZ6vrZGI43WNYAiubbBaPOGxoFUISRZmB9+
         4wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768337713; x=1768942513;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pHsVJecFD4YbT0rXEDVv0Au939ch3w9H6zdTMjQty8=;
        b=byHk7f4bbZsNXBdZlUZ4kO7bjrzawcEmU2D71BGBIEBuDi3Di1cVW5IFK7RcwZePBi
         fdnpFw1Joao7KXY1wUP+eLqUkFehy2FuY5LeuD5loLAoc3xUA/oVBKCxvBfbQ6ZaZ8yW
         l4bn0WuVqZ2X+Lxr+PB4aEM/YbrsaWOgBwYUp8u5kxy3Q0shVoa/2E9TBCoUBirJaNf4
         83tkxgCXEIGj0FphnvvEE3+J1M+jj/fY7K1cW7fU0zLJwWPTuqWsg3C8gE9ocLKC/EdI
         jshVAnRGTSpd3dTGVdOwZSv4j6wNbB7uojLIAGp2j5Yb7PRcWNIcT5oEZ+sH2Kh/SXYl
         /f/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXg6GDXgy6gJy3GWgdlNRsf/jQhKq26ZhvbOVC2jefkBaFYhzJPCONPFwqTGLT5ID2B5S3zwTbQ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywbnn5scI279cSV9ny5kVi6KUaA4QBIrC/ch68F4fF4hIpxQ+xa
	z7G3p5vAq7/kjZnoZ3YRujvl8mb12b4YBWYSkgDhp/Auqj7jLx6LsACC
X-Gm-Gg: AY/fxX689hUoAWRxnl6pNNYEtsd3/GnqoIcmffuDoEA4z31cGYwRxsAS6LURJtV/h9k
	Mbv/tIHI7kz/bhiiTEA7V4FAcQXS4a4PEUDa7Jr6EOBhC97yKDx0mN+nicJi+SHL3JWV8ARuSPN
	0rTt1dutByjgo7G7p5+WLIJwCzNG05/+y8i0QZ4y4OQDSCTr6GbdIqZseFeCdjhN/eSnPwHq6g0
	4SjldbRMX9hNJsZMKVrW/H6RSgB/wO9wGoazDeuNRu2n2MJVZVujgJ6a3KfFPXWqJhoeFexBb1o
	KIy3HkTW1bQXgSD9+NfS/scgswMLs44pyL9PE8BzFKebOmP0A7BS9E7LnwudTkxKANS7XXen4ls
	+FheTPpW+JVCeDAGWwBEAwbn863qJ/iDacUtG+JtJ7nKkXSq3Jfe0YhXzlTTS4hCTM3BlkuUDKW
	AcApXwezAN6CJn
X-Received: by 2002:a05:6512:1328:b0:59b:92a2:19b8 with SMTP id 2adb3069b0e04-59b99435132mr1389992e87.25.1768337712576;
        Tue, 13 Jan 2026 12:55:12 -0800 (PST)
Received: from [192.168.1.161] ([81.200.11.23])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382fd34bc69sm37649391fa.19.2026.01.13.12.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:55:10 -0800 (PST)
Message-ID: <c0fb8ab537cc9b234bf0afd4289c0e72a7e5ca04.camel@gmail.com>
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Marc Olberding
	 <molberding@nvidia.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com
Date: Tue, 13 Jan 2026 23:55:06 +0300
In-Reply-To: <324c2abf90b0c1712b2407b9a9b6f80ae590cb4c.camel@codeconstruct.com.au>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
		 <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
		 <CAKkNK0JOPAyw8HA0XnD836d115p5YBbo=uBD9eXXvByzCv92Yg@mail.gmail.com>
		 <aVxRrM14yN3YZ6Xo@molberding.nvidia.com>
		 <CAKkNK0JGjmurZQ4C5jnOBGAig3n24xr4FAxHpyvqWyTTTHW8eg@mail.gmail.com>
	 <324c2abf90b0c1712b2407b9a9b6f80ae590cb4c.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2026-01-12 at 11:42 +1030, Andrew Jeffery wrote:
> On Tue, 2026-01-06 at 17:52 +0300, Ivan Mikhaylov wrote:
> > On Tue, Jan 6, 2026 at 3:05=E2=80=AFAM Marc Olberding
> > <molberding@nvidia.com> wrote:
> > >=20
> > > On Sat, Jan 03, 2026 at 12:24:07AM +0300, =D0=98=D0=B2=D0=B0=D0=BD =
=D0=9C=D0=B8=D1=85=D0=B0=D0=B9=D0=BB=D0=BE=D0=B2 wrote:
> > > > On Wed, Dec 3, 2025 at 2:53=E2=80=AFAM Marc Olberding
> > > > <molberding@nvidia.com> wrote:
> > > > >=20
> > > > > Adds support for disabling the ast2600 FMC_WDT2 through
> > > > > a device tree entry in the fmc node.
> > > > > Set `aspeed,watchdog-disable` in your device tree to have
> > > > > the driver disable it.
> > > >=20
> > > > Marc, FMC_WDT2 doesn't disable watchdog, it controls ABR mode.
> > > > Watchdog with or without ABR still in operational mode.
> > > > So, maybe aspeed,abr-disable?
> > > >=20
> > > > Below namings probably should be corrected.
> > > We aren't disabling ABR mode with this change, right? That's only
> > > done through hardware straps or OTP changes. All this is doing is
> > > clearing bit 0
> > > of FMC64, which per the datasheet disables the watchdog. The idea
> > > here is
> > > to just allow boot to progress normally, without the watchdog.
> > > For ping pong update,
> > > userspace can flash the alternative SPI and re-enable the
> > > watchdog timer on complete,
> > > and the BMC will boot from the new image upon reset. Let me know
> > > if I'm misunderstanding
> > > your comment.
> > >=20
> >=20
> > Marc, when you clrbits_le on FMC64/FMC_WDT2, then you disable ABR
> > mode, I
> > assume you can check it with evb board or ast2600-a3 to prove. On
> > my board
> > ast2600-a3 it works in that way I described with enabled OTP strap
> > for ABR.
>=20
> Can you elaborate on the sequences involved?

Andrew, same as in this patch but with mw in u-boot run script=C2=A0with
enabled OTP strap for ABR.

> The reset definitions for the FMC suggest it's affected by an ARM
> reset, which should in-turn reinitialise FMC_WDT2 and follow the boot
> flow to enable the ABR again. In my understanding disabling it in
> firmware shouldn't prevent ABR operations subsequent to future
> resets?

As I know, yes.

>=20
> Further, the aspeed,watchdog-disable property is to be taken in the
> context of the node with the FMC compatible string, referring to the
> FMC's watchdog and not the (separate) SoC watchdogs. However the FMC
> does have multiple watchdogs, one for address mode detection and the
> other for ABR. So maybe the name of the property could be improved in
> that regard. I think it's still reasonable to have watchdog in the
> name. My immediate reaction is that "aspeed,abr-disable" overstates
> its
> behaviour. How about "aspeed,abr-watchdog-disable"? Previous
> suggestions were "fmc-wdt2-disable", and the current
> "aspeed,watchdog-
> disable"
>=20

I like both of these: "aspeed,abr-watchdog-disable", "aspeed,fmc-wdt2-
disable".

> >=20
> > Also description of it in 14.2.2 Alternative Boot Recovery
> > Function.
>=20
> The second bullet in that section says:
>=20
> =C2=A0=C2=A0 When the firmware booting successfully, it should disable FM=
C_WDT2
> =C2=A0=C2=A0 to stop booting switch
>=20
> This is what Marc is trying to achieve by providing the property.
> Other
> platforms may want to make the choice elsewhere.
>=20
> Andrew

I'm not saying that is Marc is doing something wrong about it, I just
want to say that need to distinguish WDT2 and FMC_WDT2 because it
puzzles when you reading the code in which you see something like:

/* FMC_WDT2 ... */
#define WDT2_ENABLE ...

I'd be use exactly what it should be:
/* FMC_WDT2 ... */
#define FMC_WDT2_ENABLE ...

and everything else which relates to FMC_WDT2.

Thanks.

