Return-Path: <openbmc+bounces-423-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BE4B1F7F4
	for <lists+openbmc@lfdr.de>; Sun, 10 Aug 2025 03:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c00j753c7z3bkP;
	Sun, 10 Aug 2025 11:36:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754638098;
	cv=none; b=V/K84AZf/gMpewgtfLhSqL5rMI2MtcwMCx4E0RwNctoOJfLOS+5Yp2LYSiSoCQyVinU3YeZfa4kkHGVKFm7KLEWbrgmnUYxWMTx0wt/t5VRHom114tygAZpGz7wXF4KStJWVD+AxaZi1/iyLR4WAOzg40C0ZIjSY2RqliNuNSqSSIutBzxhMUngBBx3aF7xUvecLibm36wmzvZ12ZIiSgCJqr8yNoeZkWaj765p1qACAxz9QmvDQgu1pxQxu2Pf94Ee8d27D7x8qjEGiTVnKrR+zAvk6UIUeiO32sDjEYKCLbH9TFKIrkjody43YgMYU8Mem2UeZO1INnNcFjzWi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754638098; c=relaxed/relaxed;
	bh=YG5oBpZQNHicHVtRSDqKiatDgL0odbqMPsXJhDTsj30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+17D3UxawCalmc+yzbkMNqUAVStyaqDHhpyMbNwpYgJftKPQCOOcna0A+eklD4Gn4o/1NvDqRUgNHndCRq0c1xk+PyCqATZLVH+baopOr3IJuzeFsWwTvkZaQXqK6q5oDLfTDufyP0plA2wZCpdRbo6s4N3O0iRS11VHFtxztMqmm35fYzWHKwylY96RnxpawRwsOh0DE5tUwlHhP6UX4S2lH632lY5owkAZ1Qwy0mxsl8dxrTHyxThrCT+D98usK/QAHYQDfzGSfjXgr1MDJG4PYeXpECH9oZ9UjnK1wq1P5J9Vm4gYWGEUmUIcPZxqSTZED2mObYfCaSYZN3F5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rerirf3j; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rerirf3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bywcK2S7jz3cRD
	for <openbmc@lists.ozlabs.org>; Fri,  8 Aug 2025 17:28:17 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-af91a6b7a06so323162766b.2
        for <openbmc@lists.ozlabs.org>; Fri, 08 Aug 2025 00:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754638094; x=1755242894; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG5oBpZQNHicHVtRSDqKiatDgL0odbqMPsXJhDTsj30=;
        b=Rerirf3jNhxjDpqvx3CY0Lzh1qNTQp89RDK0D9nLRGRGzTlWf2Iv+V7UC3AoLd74QJ
         WgKCOtqjU5FGQW1JmET086Ykh3Ent1lsBpagyBFjea8zyUQlsDWFJeNsWGo2kJeED05R
         oVwx8JaixX6PTkzpFREbcCUQjgqA1JjpdgRpguR4XZyIWUkzlKv42Fv7hN7pf12q1g2R
         DVND+EM2UrLECR9GlTEBMLUl0uy+b7EYxlItr/fwqesQPeeXD+zbGOgADcFqFe9rN0GP
         vnugzeOLzUhPQrZNGZBAMIUeHcRT1E6Fv5uIGUmnvHmOdhzmZeOywErIOsFmGVjoUg9l
         x8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754638094; x=1755242894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YG5oBpZQNHicHVtRSDqKiatDgL0odbqMPsXJhDTsj30=;
        b=W53oWoiSY/VArUHg/gp5KYMixmm/0JhgppxZf64wHbTegY1uFmNgEpwgf3o1ytsx2b
         W1necjzjnAwTet1Z0klAlUJr1KM4aOkc07pqQeiOBzn9G6MoZdRi58Vz8Ttb4CshYeAG
         uc0xJnR8OZcQmMLhHi2jEAU0sIRzRG0n+ah3iwD0kZekk4rDx2a4S7mt2qQNOJISmlfB
         MNYpsbbDGVpnQlO67Q265AT/knXDGMQ6T57si7jmVpsilNH01DB1jXgBpC4+JLSt8+UO
         qLZKt/qSSe3z6maztLPF0WhOwxwe5d1m+I+YK4JTn0bb4aF2tzci1ygb7D1J0AvN9lq2
         Hnqw==
X-Gm-Message-State: AOJu0YxwXpnKxMu+noRNz8iuKve00X/TBK4ikNUzoSAKGyZWVRXlt2m3
	yoJqirZO3fN/Gf9zFTHpKNI2zp8YIILiLBQg9hJaYndF/6C0NclqBMx2AHY9wbKeu1+EwVFt62n
	yjpQAmJgFFQu18LLrJyU1e1Br+JQRVETDd9FQ
X-Gm-Gg: ASbGncuWNjfwd26kQq69xHnPzJrrYEOmf1G4NNgIXf1NNRqBkv7JmpkG3INHnJJQQ7E
	euBQ8ANaiofdrFB255nUsWqU2xKiuMJL4bHbf5Deqsl6lVWDpQxL8mnlrTcLs19iHaRKXGgvTcT
	TBmwNrzyLqt59vz95MsXVYo4uOvztQHo4b2a1KzMEdi49BSpxyVNaLzygXmt+8XxPkdJLtFNTOJ
	M9aVWQ+oZNVZODM+5o=
X-Google-Smtp-Source: AGHT+IFbQ/PRqe+4jpvZjtpFtBYY63GzVbJvU8XFppY/fJyEJ6mOVrySsOXauYkoCQETR1vge7Z+AyMoOlOCfmftIvw=
X-Received: by 2002:a17:907:6d19:b0:af6:ecd1:4fd4 with SMTP id
 a640c23a62f3a-af9c63691e6mr161325966b.21.1754638093812; Fri, 08 Aug 2025
 00:28:13 -0700 (PDT)
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
References: <20250806121232.2331329-1-fredchen.openbmc@gmail.com> <b3c77e888624c2e1b2a6a6fc52d27d73e494b55d.camel@codeconstruct.com.au>
In-Reply-To: <b3c77e888624c2e1b2a6a6fc52d27d73e494b55d.camel@codeconstruct.com.au>
From: Fred Chen <fredchen.openbmc@gmail.com>
Date: Fri, 8 Aug 2025 15:28:02 +0800
X-Gm-Features: Ac12FXxQEimPFysXFa-Ul_s8YKWJq8J5T8cICohU5oUniXK1BXT-Z_tm-RJeMKk
Message-ID: <CABOy658yqYX9V+k=koX0VYLxhE1v=HGmun+NPqgtJ+HtKoRvXA@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.6 1/2] hwmon: Add driver for MPS MPQ8785
 Synchronous Step-Down Converter
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2025=E5=B9=B48=E6=9C=
=888=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:35=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Wed, 2025-08-06 at 20:12 +0800, Fred Chen wrote:
> > From: Charles Hsu <ythsu0511@gmail.com>
> >
> > Add support for mpq8785 device from Monolithic Power Systems, Inc.
> > (MPS) vendor. This is synchronous step-down controller.
> >
> > Signed-off-by: Charles Hsu <ythsu0511@gmail.com>
> > Link: https://lore.kernel.org/r/20240131074822.2962078-2-ythsu0511@gmai=
l.com
> > [groeck: probe_new --> probe; add MODULE_IMPORT_NS(PMBUS)]
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > (cherry picked from commit f20b4a931130cb574c40563cfda0fc2cb944b4df)
>
> I'm not sure what you did here with the backported patches, because
> trying to apply this series from the list lead to conflicts. However,
> on the basis that there was no discussion of conflicts, I cherry-picked
> back the changes as indicated by the commit IDs, which applied
> successfully (though with auto-merge results).
>
> Possibly it's differences in the tooling for patches vs existing
> commits, but some discussion of your experiences would be helpful.
>
> Did you try to apply your own series before sending it to the list?
>
> Andrew

Hi Andrew,

Thanks for pointing this out.

I realized I was using the wrong Linux 6.6 tree when testing =E2=80=94 I us=
ed
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
(branch: linux-6.6.y) instead of the OpenBMC Linux kernel. That tree=E2=80=
=99s
index.rst doesn=E2=80=99t include mp5990, which caused the conflict. I=E2=
=80=99ll use
the OpenBMC Linux kernel for patch preparation next time to avoid this
issue.

Fred

