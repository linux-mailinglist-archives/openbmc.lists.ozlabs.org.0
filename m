Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC149705E6
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2024 10:55:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1kLs2Stbz3cG6
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2024 18:55:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725785712;
	cv=none; b=dMdAmVKdYuYMwupiqlRs4zFrR9fxi2urpbnjtFkzpQyXPTNCOubdjROt2vBE8iRajHqpyc8w2YumHa6wZS9Wk5oYPHA5ioOWfOwo5iG6R2lwdTABZqOGChtNABwdx2FT2IiSldb/AkbJstYoiY6jFj7FI885hUxhUaG5wGXQaplDZQqUne/1FfBg8/eeLndDke+Ax9/QfyuDMG56YsEBtX+OAuEXVIkw73UTEiYZFlcgg6kSLgCQqC8rb5we20nqZuCD/PlyGfbU51eRD2qeS8GJWEXkrHEij5Yg2l79de3/4QlUM4futNSYAHUxJgQ8H8os2iJfIoTSaSQfcA9THQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725785712; c=relaxed/relaxed;
	bh=Nq5WJ2pHAHyT2QwFtM7kzrtPjs0zR32si2qK77Z+LEw=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=f3Fx4rGG8mHuuKag6VjZGFZF2l8xDx74ye7hmAAtI9FQH7/tVjKcS0a9CaFraeWq1diT7fTTVPfzD+RB50WCJCl2cmdAYWMFQ2OWke6AXvam8qrW03yf9ZCsw1xnZpZSyYCrQjdScJ+r+u0FAVh/z1t9cb2vtP2SG34eeprJLaP0vwhLeG+7H/bWPwhSHL3pPSxAONTGsj9khi/rpduQgIZaruWC5ulFGRuueM2R6xy+3OikDGsDdNxrE1w62dzfA7phJ3wbVzTYEAJKH5DfgNboyYUe737EanQk6KcgRmY4F67Q7BYLsDrIKaS1Z+BvuS4Wuds/zhiKlmZnykvXLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NJAmnH4U; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NJAmnH4U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1kLl6fjHz2xfb
	for <openbmc@lists.ozlabs.org>; Sun,  8 Sep 2024 18:55:10 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so138696166b.1
        for <openbmc@lists.ozlabs.org>; Sun, 08 Sep 2024 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725785702; x=1726390502; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nq5WJ2pHAHyT2QwFtM7kzrtPjs0zR32si2qK77Z+LEw=;
        b=NJAmnH4U05HaB0yv16xfVcwmIhn3T8CZHEE3ps4xV2K47A/ufG/c7O+hcGoJnJ0hLT
         /favaSK1Jl2a2G5pfVFxSSd/XSUH/YtqWSByeFzlc94BR21oK5XKJy2VlOPT9DlTIM+9
         EAqcfkYRYZWVT6h7wM102rZA9uXFxxtdxXKUeOgArv+9sozSSaaMp9sJUUgYHGBo63yv
         fLkURaMhb6IyeXZVO2osshRWYai07j5qp7UqNSVrpZnRTD/xUlKwxncB7u3NVbHODkkg
         +OmHqO/gnieqUX852jYitjYrqr2Lu06m9Xvv/St7MnbvvouKj5DuILFqjUwz1CUCTpMy
         Hv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725785702; x=1726390502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq5WJ2pHAHyT2QwFtM7kzrtPjs0zR32si2qK77Z+LEw=;
        b=jF4ZpxRzgsa/ZAhwYcui4+WxDsEEcOCLVNSHpjinUZ+dwsknlZs1RkMW9ftaWdTXmL
         j/CZSCkvtGQS9UrFtKFLWc8AJM+BmxwaIrqQcdyz0j18+Q2/SXNyaqIokshfYzYBacZ8
         +xr+zGOqLa40ip5zALRVMRRZyU6XXBTYSSeH2G5tT+lZmkCIxNmGJN19A8lEaLGjJEd/
         HVZ74OKKm6YjRS2zqTGMCrBzE9N8S3O1ZrtVq7HFIuNogu0dwVrR7gOE5X4XNPfrkKzQ
         ADq6FY+z7/amlvPhSVpvkDhxATtLoD12u4jGug5vsAGkJdZw/iNNaY3NPn6tBRN1QVJo
         Ih4w==
X-Forwarded-Encrypted: i=1; AJvYcCUUcaKbET3RDJdZkR3wWn7S1AOQN3d2ozhnfjK9fuxU8I6MtnEzXiYG5zc28AU6vg4+vzs5IR7W@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSp6IMY4XPfaJmTtztTCeFMUIP5O6H53kLqBWJ9JVZzf+8Ka3E
	CnG/HhkN+8nQV7KDwtYGPUD1RlPjVTGoIJ4kRYqSDENtjUAcPYQOD+sa30jVnm57QrfNETB4le8
	oeqXF1cALPs8ri+zM/TzdVFwJyvU=
X-Google-Smtp-Source: AGHT+IGh/mOI9VQapbeOWVjXZtarUc22MPB8ax7nNK0XjS+Txuppy6n3+QBXGfNuyoB8Y/EZ24dbDWaIDHrHw4x8upI=
X-Received: by 2002:a17:907:7b95:b0:a72:5967:b34 with SMTP id
 a640c23a62f3a-a8a863f664amr914111866b.22.1725785701564; Sun, 08 Sep 2024
 01:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-7-kfting@nuvoton.com>
 <ZtIbM4NTbldBIDXf@smile.fi.intel.com> <CAHb3i=vWNmokQYyOZJOVeaJaT6XAroct2gZiJYPVQf6rHzR5LA@mail.gmail.com>
 <ZtWnPTSu1RKmIlhK@smile.fi.intel.com>
In-Reply-To: <ZtWnPTSu1RKmIlhK@smile.fi.intel.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 8 Sep 2024 11:54:50 +0300
Message-ID: <CAHb3i=uN5jtczEjHhzwL9E9c6d9rU-QZckhU79KzPuY5n81CyA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, linux-kernel@vger.kernel.org, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Tyrone Ting <warp5tw@gmail.com>, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy,

On Mon, Sep 2, 2024 at 3:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Sep 01, 2024 at 06:53:38PM +0300, Tali Perry wrote:
> > On Fri, Aug 30, 2024 at 10:19=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Aug 30, 2024 at 11:46:39AM +0800, Tyrone Ting wrote:
> > > > Modify i2c frequency from table parameters
> > > > for NPCM i2c modules.
> > > >
> > > > Supported frequencies are:
> > > >
> > > > 1. 100KHz
> > > > 2. 400KHz
> > > > 3. 1MHz
> > >
> > > There is no explanations "why". What's wrong with the calculations do=
ne in the
> > > current code?
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> > >
> > >
> > Hi Andy,
> >
> > The original equations were tested on a variety of chips and base clock=
s.
> > Since we added devices that use higher frequencies of the module we
> > saw that there is a mismatch between the equation and the actual
> > results on the bus itself, measured on scope.
> > So instead of using the equations we did an optimization per module
> > frequency, verified on a device.
> > Most of the work was focused on the rise time of the SCL and SDA,
> > which depends on external load of the bus and PU.
> > We needed to make sure that in all valid range of load the rise time
> > is compliant of the SMB spec timing requirements.
> >
> > This patch include the final values after extensive testing both at
> > Nuvoton as well as at customer sites.
>
> But:
> 1) why is it better than do calculations?
> 2) can it be problematic on theoretically different PCB design in the fut=
ure?
>
> P.S. If there is a good explanations to these and more, elaborate this in=
 the
> commit message.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks for your comments,

1) The equations were not accurate to begin with.
  They are an approximation of the ideal value.
  The ideal value is calculated per frequency of the core module.
2) As you wrote , different PCB designs, or specifically to this case
: the number and type of targets on the bus,
   impact the required values for the timing registers.
   Users can recalculate the numbers for each bus ( out of 24) and get
an even better optimization,
   but our users chose not to.
  Instead - we manually picked values per frequency that match the
entire valid range of targets (from 1 to max number).
  Then we check against the AMR described in SMB spec and make sure
that none of the values is exceeding.
  this process was led by the chip architect and included a lot of testing.

Do we need to add this entire description to the commit message? It
sounds a bit too detailed to me.

Thanks,
Tali Perry, Nuvoton
