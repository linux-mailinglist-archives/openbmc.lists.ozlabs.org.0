Return-Path: <openbmc+bounces-213-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63428AD9923
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:42:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJyB307vcz30Tf;
	Sat, 14 Jun 2025 10:41:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749833521;
	cv=none; b=Osj2E0DmvGrsFgC5NZMcwyEPM5izV6a98pVXV1zwMTEsT9LH9h8d96hS6Mo5E5vFxq8/oqzdBPo77nQjWS+B58ICQy+4QgJjO7HNdaBK/lLUXL6/5X6EFuGz046YLqW4A2mvKBTEATO1ZW0oYQhDm4Re6RL6SsQg1ylpoFje1f0RpeB+7VDyBumomQUT+J7vRiOKpiVppIWafobzzzjVNOZjERaP6SILO7sAfnTRJ/bnjBKEhMNdBj5AiKuX21RbQ1aj/7MZWhy9aDxxGMNYXKzeu3XV+Sj/ds6Bh/X91566WB9D5N5RFKtlCzff2AlVljLhO4gNhAMahlItihwUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749833521; c=relaxed/relaxed;
	bh=UOl7Gl38FugZBnNlkUXiA3CUTrFhIqj6NSPsNIe/ATQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUXcvGH+es4NwCz1MiBIEUnNVZBfXOcsNKiJgl7jgWEfVbBq+oS/tobFUtqJn1vDYRKtgmuTK0Oh0NUIREvFfe6P35z5GxMrN++bG7Vpjr7X7HQ/aE+glZ8eEyHUP7TtiMgipOaij3MD9OlPJzQENWzOkpv8vj4zGv29dx/U0ZWleR0HAhnoVxAzid463wyADJ66oPfpBH74ysTOfMVJ9BNBiXGUcmKMkVe18EqrBmcg5+uF4ME+1JCg1NsUmI1LX8Tq1y/c7s1/4swolLADIKFjqInjM1uuoug8X4QN95yC8bDhQ3G3mM7h5hfhkpl/lgtLceHMzjVnMRvXdUCLyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Qi3vQDs6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=kasunath@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Qi3vQDs6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=kasunath@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJlmZ6Dhzz2xKN
	for <openbmc@lists.ozlabs.org>; Sat, 14 Jun 2025 02:51:57 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-453200cd31cso975e9.1
        for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749833513; x=1750438313; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UOl7Gl38FugZBnNlkUXiA3CUTrFhIqj6NSPsNIe/ATQ=;
        b=Qi3vQDs6d5CICq6//UQPAl3saqzk+0LVBaHoq3AiBKDObz6lZmQPpJaMlaKYMsBeK3
         N1Z5+ZtDc97TFpNaS2VRJrGqKzELA5+WgNlUm1sDrqNHAUQ23VzZVojarlH7auoXEtCv
         Jx5ag4ksLyq4A4+DcAnt8FGeF6wQxqYOV9hHKKrMW53KPbexfwK2ozWSy4l0KWJ25u/l
         t0y2IO2ZKE/4t229+Q8tikGPe9IPoq1UsSoGPgLyU9R9XUAvgsUY/eV6Qn7Jx40VT1K9
         WZsp7dTgY+XAyg+ri9AeSgyih1HQ+8RAM05K4ZCvqwtqDwdU+N7+3mR4nD5ay46YuT75
         7IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749833513; x=1750438313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOl7Gl38FugZBnNlkUXiA3CUTrFhIqj6NSPsNIe/ATQ=;
        b=FncFasI8npiRJOgnHXwBJPLmbOvfaT73GyLdNRcvsN2r1q2yPBXrshS1SGu2fI7GXn
         4Ba9euuGeC1VZ4vRmZd3YE3NhfdtWKVjbT9BOzMBhho4rK1BTBD1jHssFuJc5RxrdYwp
         maRnwGjU2IVlnTUuIQ/vCuwK2arY17mLg8HpMrk7WwfCsyKZJm6armbXmanUCoHNhzsD
         iPyVu2cXY9/+3dRW5fHTTvWzaf/CoLdl8r242oeFMg2g1xS/n1f1ePSYVo3Cj+oDfJSH
         9mVHoQ1cWweI5YHZbTHtLu7FEGPpqd9VHR3i59R+aAepRJCqffmThWW6S9PnDYPk+VBU
         6U7w==
X-Forwarded-Encrypted: i=1; AJvYcCXWd19WN5yZomVGeQ5r3emA6OEkrlg0SSlP3EZO6w/HQ6fv3h+yFWJ5BQkMQnsqswTgq9L9O9gw@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNqtiRskLoA38U/ZLjcuIIKDZWA7RInBqW0bSNjF+6rv6sL3BT
	5TIIkM2Rlhw9uv5J66CsYR2gIahgQ3+dtP64bSQ60zmphjXWZW05Z2klfWJU8nY88HXxdcNwHK+
	1Hrk7CRkTgR2e4mV7mLm8aStx8uYk3kPUqgI4CO/6
X-Gm-Gg: ASbGncuJHBDhQ/w8mWtJfbRs595YKqWYY95jr4O3xUKC0TdP7NWQq2m462fuJ4KP2aS
	VZcseVQZ9dYXOvrE/fWx3eCMfL8laRV1mWdMdpkAovLNJO6iAJZ5Bf5f4XaZXWI+YtB16P4zvJz
	ygP1Kntd52glY8n1Kg8FsXIrsY4QWGVm4/6Q5n9yCQSLb8dVEKRzVTmP/ryabz/tSSSTf++k0e0
	7wq
X-Google-Smtp-Source: AGHT+IGoK998D7fmDQo+oAtUUPx9Oulbz+TXFM33qAKzG3/zkQ+ILqBbOsos/3QCwa4Uo/bqEg4JqN+ko1zD70rSi+Y=
X-Received: by 2002:a05:600c:358b:b0:439:8f59:2c56 with SMTP id
 5b1f17b1804b1-45334f120abmr2393365e9.2.1749833510468; Fri, 13 Jun 2025
 09:51:50 -0700 (PDT)
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
References: <CAN+wxKJMxxnm2egxVFpxhe2Z96ZTdZ2ADCbVOc-_iq-5u77V5Q@mail.gmail.com>
In-Reply-To: <CAN+wxKJMxxnm2egxVFpxhe2Z96ZTdZ2ADCbVOc-_iq-5u77V5Q@mail.gmail.com>
From: Kasun Athukorala <kasunath@google.com>
Date: Fri, 13 Jun 2025 09:51:27 -0700
X-Gm-Features: AX0GCFs42Zdujij0pYvVDLTwR9NccVn2bQye_gFzXrqTwaqwl8HgLodJzZkUVj4
Message-ID: <CAHK_2H134KsAsZZYw+QiyH=eCXV=_fiQTi-MOrGKW4+aRsVy-g@mail.gmail.com>
Subject: Re: Query regarding Libbej openbmc Library
To: Sneha Bansal <bsneha309@gmail.com>
Cc: Brandon Kim <brandonkim@google.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d34b40063776dcc6"
X-Spam-Status: No, score=-16.2 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000d34b40063776dcc6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sneha,

Sure, happy to help. Let me know the issues you are facing and the
corresponding code you are using.

Thank you,
Kasun.


On Fri, Jun 13, 2025 at 8:22=E2=80=AFAM Sneha Bansal <bsneha309@gmail.com> =
wrote:

> Hi kasunath,
> This is sneha here, i have some queries regarding libbej library and i
> will be highly obliged to you if you can help me out with it. I was passi=
ng
> the transfer handles got from GetSchemaDictionary to RDEMulitipartRecieve
> and then using the bej data as schema dictionary which i further passed i=
t
> on to the libbej library for decoding and encoding. But when i passed on
> the RDEOperationInit data as encodedPLDMBlock, i was facing some issues.
> Can we connect so that i can resolve few of my queries?
>
> Thanks and regards
> Sneha
>

--000000000000d34b40063776dcc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Sneha,<div><br></div><div>Sure, happy to help. Let=
 me know the=C2=A0issues you are facing and the corresponding=C2=A0code you=
 are using.</div><div><br></div><div>Thank you,</div><div>Kasun.</div><div>=
<br></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 13, 2025 at 8:22=E2=80=AFAM Sne=
ha Bansal &lt;<a href=3D"mailto:bsneha309@gmail.com">bsneha309@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"auto">Hi kasunath,<div dir=3D"auto">This is sneha here, i have som=
e queries regarding libbej library and i will be highly obliged to you if y=
ou can help me out with it. I was passing the transfer handles got from Get=
SchemaDictionary to RDEMulitipartRecieve and then using the bej data as sch=
ema dictionary which i further passed it on to the libbej library for decod=
ing and encoding. But when i passed on the RDEOperationInit data as encoded=
PLDMBlock, i was facing some issues.</div><div dir=3D"auto">Can we connect =
so that i can resolve few of my queries?</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Thanks and regards=C2=A0</div><div dir=3D"auto">Sneha</div=
></div>
</blockquote></div>

--000000000000d34b40063776dcc6--

