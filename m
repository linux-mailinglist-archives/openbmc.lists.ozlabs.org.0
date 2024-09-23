Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A9D97E4AF
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2024 03:52:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBmFt41hpz3bxZ
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2024 11:52:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727056335;
	cv=none; b=CTvdkYjstGu3ywDu5U2uEYedWGdm4Yg9Vt4UaeU5/vVVnzGS8wIsl3B5MqE2wnu7LkiVInFTdMsdRp1ILa2zy/xnfFVLWXgOsPVUmOUnMek2IymVJrxpZEFyLlOfckBUZu19OvT2BkK7ONkvA6Fl+V87BKMG6XXcrSEyg9FInz57KW49XgRvDX6dQm3htJp/MCzlaAc0WiAjpppt31gWCVQC6DTVxQKB+nvjDbXX++yWajh9C30mGJaNAKSOYCM9FyE3dX4olioMbU/1SujANdv1Ww6gFXAkzDqACnifg8zQq/E8fRf44wAU2uWUVGwktwcxTR86lLw7/eAg2VEZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727056335; c=relaxed/relaxed;
	bh=sWMVVxxW+AfDBr5LSOb/cH6eDOfidObguR+oCv5UphQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OiOhLiFuO+A/aCQxcwHn5xcu3x427rbEMPGoOdDMjJxKDESZrQxI7sJsojpTDe1//V0V+iqh+F5F9Wr37StfCuKzf9cZkPXoxzGPfxTGkARmIoineikLJN2MsRnV+OlqsQ086V3P/zhchrEiygoeKuldJO39d7V6CROF1yq1c7VM3mR8+KM88drVmQ+dxaDOpMEopIFWAKzzJT57IjziS9WQAPtA5coDzrqhLxB3TYZfAo5SVo+2TV21NrU8jRP0rtQtlEA59gajRTYLKQKoJMnHRpA+9D2NmOray8vJpqRwoDQBOZWBMtNLFMwRegVptLDUlDjCGOuoZHIvbf64oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ki5uQxBp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ki5uQxBp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBmFp1zlvz2xYk
	for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2024 11:52:13 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so614520566b.1
        for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2024 18:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727056326; x=1727661126; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWMVVxxW+AfDBr5LSOb/cH6eDOfidObguR+oCv5UphQ=;
        b=Ki5uQxBpnlJW/avFKltloV8y3wOY8Vv3DjX2CSY4R6KKR9iImd4DtVrXe8rcv/0WL/
         HyVw0yV+D+42CwRVk8PKKgoNFOw4qkY+7W2G4teBXdieWE7wWWwu7YmRSpLz+HTEGhVr
         +bFoCEXnz64wm23DSHslN1wwtNW5cP4hT+1RaCMvGMjweRZX8EFFrjoBabgxEvLHg9eA
         0QLP1jEf482Qf7tGK4UXy9gjLd/Vz1iAwGC0ajl1SJgk/e9hLwp1n5zO3xIOOzzxAH7L
         txdGaknNQJJS2KD+kytJCBxXtN29faCWcOUUJIo5wEDI+cCbR7CKy38lQzPdDFaA5Fsk
         WflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727056326; x=1727661126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWMVVxxW+AfDBr5LSOb/cH6eDOfidObguR+oCv5UphQ=;
        b=WFuvCdTmp5j56C/W4HZ0gBv7VSnf65reL0OiZr2r/q56B7ACG6jgm4E9+cv4nree3R
         fEZwzsa6Qh84vJDfpCe/eOtCxe5MqIUjn3VDwjsGpzYeiRtAPsAbL/97V85400EylKDN
         1K4uOQ5p0aNc55RYrftwVpwsxaywhbmAWfLyAW1iPy6OECPd+aYzeJPkWOVePu2jOncm
         gKpVEhsOJaE9z9Y4RbmEy9HvCKeSZiAgu/QI28y++6w+SmxxAWVimkmO/1IT1qWcUwcQ
         w2jGsNzu0xHUadwEx4xoNF+LphsTqXPd/KQTrE3ljSGGOLgmF0tTJd6ADX0Z/xKmOv/i
         bNHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMmTKrA6O6M1Dw+kweuaSDaMdpgMMsqzbtipiA0DJOaCVnFshLKU6eceoHLltt65vmTuK336WD@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxzBjhPUXzpByoJ+FyHFwNoyfrq9H9Lp9N8RgomVgxeGyWQqq+7
	XN9/m3kHARKqw7cIhDHAE1bIysqH1BRdiUpYka/de6C0SSmS6bIbles/RiUzimAEpl7qzWhwVUR
	m9BcTu8Vhv1+iE2ViC1P8DeEKtw==
X-Google-Smtp-Source: AGHT+IFFETaOQGu652OB7nrGXOP/MzYyqIndUDFmdQaGb9RRqPWu8MVcTogmukY38ENE6g3voRpeLnI43t2ioo+hnB8=
X-Received: by 2002:a17:907:d3dc:b0:a7d:e956:ad51 with SMTP id
 a640c23a62f3a-a90d4ffe2a3mr912415966b.21.1727056326270; Sun, 22 Sep 2024
 18:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240920101820.44850-1-kfting@nuvoton.com> <20240920101820.44850-2-kfting@nuvoton.com>
 <Zu2HGte_05AA6yky@smile.fi.intel.com>
In-Reply-To: <Zu2HGte_05AA6yky@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 23 Sep 2024 09:51:54 +0800
Message-ID: <CACD3sJYqWz3y2EZ1N3SqboNz20gdjZRaLz5c49u2bfztoVsudQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] i2c: npcm: correct the read/write operation procedure
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:30=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Sep 20, 2024 at 06:18:15PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > From: Tyrone Ting <kfting@nuvoton.com>
>
> Something wrong with your email setup. This patch may not be applied in t=
his form.
>
> But before (re-)sending, wait for others to comment (up to 1 week).
>

I'll remove the "--from" parameter to git send-email command in next patch =
set.

> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
