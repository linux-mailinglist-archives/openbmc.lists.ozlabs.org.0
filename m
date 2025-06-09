Return-Path: <openbmc+bounces-133-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDFAAD248E
	for <lists+openbmc@lfdr.de>; Mon,  9 Jun 2025 19:02:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGJBD1plLz2xHv;
	Tue, 10 Jun 2025 03:02:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749488532;
	cv=none; b=Lk/qVMaKakwAhFOFJdg/OBszMwCQL9NRnrf0QnBALe5SaXfyYiLW0rpocM1hqqAfq7SyWY4PohnsLM/uZG3btfchcxUS6jBIFui3yIr9nTo0hcYT6om59c8JYWphsAYOZhT1nrtaANjibeKY1bKdOZn9Qtn6sEKQs72DHQKq/VkkaZfXw02tvftWKzy3rbzPX8f1sUZebjbAUUw1NVpKuZ1TB9nhTrGkKS42uxkfJSOX/QEAcGXNYbODTTOw0h3NV2hvygAoNPijpmtG6GqCi/TZsUKSNvyJ/WTKeoRUrN3mTEup5wjA6Fs37uUIQ/mZmbUkATZdbskUOTEXj3uVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749488532; c=relaxed/relaxed;
	bh=Rn384Kanx3rnEjkE+Hne1J+1cAHFfRfQsUh6GjBJnv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbS7kaUKYqe9VP722lPjeEMpaJ7law6CC+/jfkmSc9TBfTQ/RlJpIeQ86WixEALJvBB0J7HFcnUyVFRaiyekLXk+yolezUO6r+1vm150k7ma9KiJ/jH+p8KdVA08PCLMVjgrPoH8Mvy2xROwVz2vR0eINlGRbnRZgeGCEEiElFMKOK41Sbkel61102gGgVhHjqG3K/sFAx0701yG838qhwWY9CJAOwAJmYAhe12qzK8zBEZubX8Yi3MKX07sH12JUzBgyo2ylXkS2SsmfsUx6TW+e6l7zzvjNa42jzUXLXYg/I6eM2E6m3HD/kmuEkgdQQU/P6N3vl1vHiV5Bt+iwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tMPa0Yf7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=brandonkim@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tMPa0Yf7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=brandonkim@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGJBB39gJz2xCd
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 03:02:09 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2357c61cda7so6005ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 09 Jun 2025 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749488526; x=1750093326; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn384Kanx3rnEjkE+Hne1J+1cAHFfRfQsUh6GjBJnv8=;
        b=tMPa0Yf7PLYrrIZ1BUmpDvtgagwKSTLvBP7thvu+SZ/IODIr/UxOwTXIkjgX/NJIin
         dsf595kpzIlhpi70aL9/PzzS0nq7PAUNLL10PxYrglmxoX2yp12XIZeZPeJehZ+c7U3Z
         eAjvOQQT8dY1hQhtMmuDJeNjHKG3ZGp0z4Fu92gtbQ1HUOjdrkh2kM8ghcItYovrT5Qx
         JnPJ6qjJbijI4mgnh8DZtEWJHYmMFP/NqAGUydlXi8ioFS/2E9+7Mxvnv+ySIH8U4UJ9
         QAKdL93MYMx2OQGTM57EeNDNBCDO8LFTtNmzArpThMpwWvS+U9K5dMpv32IcnAA2KNtE
         4GeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749488526; x=1750093326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rn384Kanx3rnEjkE+Hne1J+1cAHFfRfQsUh6GjBJnv8=;
        b=WXVyiYr9LH774wg/CYoIIpHstNoJld9OlMUp/0iW829WxH1xtCIhfcT5ZzjEfNhs2E
         NhzwrkhVh4bqNZM2kCYglDSkvHOGZSAvhUftHYNQu0dVadN2Gdj4kDJU74s6jTPOrD79
         oBYA1MeIGnvfao9X0EiKHoZcJvyWLqJsnNODGeV+82G1lEm6khviJGLY8ZbYQ/b0lIAj
         D4o5U2i1vNptzAwRzmf648DEJSM3S7TE3kMx4TsrosRi6hyMBbYuXsTicsthmfmPUQlJ
         IIKanxHvB6L2zwWqex5P5XxO6aM9isNPAUu6gR941RtFc4M3clucbOypjz/m9lmxfiv2
         vhBw==
X-Gm-Message-State: AOJu0Yy8AWyvMOyJZfXSGFTmcqK0jswnvrJJ+H88Oe5LfQOexQBaPrHN
	LdLwVQ/9JB1m+Y3F1AjHPHDAvJxOKDy5JLkMiCrXdcNAmmRQDUzXk/VvgWSC9qXKokaJ9KaI6Lc
	GZFAffz0wD52KttZ+iuhogmPleoJ7KkF/XRjSjTww
X-Gm-Gg: ASbGncsuFM3PIsRyQC1C6H4Md0k3RKGH/Swy3krCIFEZxJTFeOFE5zVnh/v4ka8Q7wl
	s8Aw1z9wuLt93EQAC+2gGuNJ+1gnnS23gL5qlO08X8GRz/bcSoJa9JQ2s2clv1LF9j7zu4r9pAy
	mFda2zLxH8nv5JY+ALEkGtdEzAAAlosxyZnCP3HnYi5bM2oLE6poifPwIqlihGndm8aI7C5v6NR
	uNUIFtTzfbS
X-Google-Smtp-Source: AGHT+IFwMreF5gOXTwfnqxQw1fWGHc9qth0JIvSWOBqUcsRtVQbT37LVIfVzTFWLFOiOTFWyI2eRCxaRC5x/tg2D5j4=
X-Received: by 2002:a17:902:f683:b0:235:e1d6:5339 with SMTP id
 d9443c01a7336-236120204a6mr5187255ad.26.1749488524380; Mon, 09 Jun 2025
 10:02:04 -0700 (PDT)
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
References: <CAN+wxKK1vwqhCRQ56km1UH6Oi79DAcVeA7t45MWH=7P8nGbOBA@mail.gmail.com>
In-Reply-To: <CAN+wxKK1vwqhCRQ56km1UH6Oi79DAcVeA7t45MWH=7P8nGbOBA@mail.gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Mon, 9 Jun 2025 10:01:53 -0700
X-Gm-Features: AX0GCFsW9JyMbBWs69SsCe4GKcGXbIGxTD-a7HdGuI6MszwOk4s9m1-JqR8YU2k
Message-ID: <CALGRKGNKBxvdTwjz3X+EPNND2Swm-xjNOMe3B0G5eAT_kwQCKw@mail.gmail.com>
Subject: Re: Query regarding libbej library
To: Sneha Bansal <bsneha309@gmail.com>, Kasun Athukorala <kasunath@google.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000094e980637268aa7"
X-Spam-Status: No, score=-16.2 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000094e980637268aa7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Kasun Athukorala <kasunath@google.com> worked on libbej - perhaps he'll be
able to help out.

On Fri, Jun 6, 2025 at 7:02=E2=80=AFPM Sneha Bansal <bsneha309@gmail.com> w=
rote:

> Hi this is sneha here, I was  integrating libbej library in my codebase
> but was facing some issues. I have few queries regarding the library. Can
> you please help me out regarding this? So that i can clear my doubt and
> perform the integration successfully.
>
> Thanks and Regards
> Sneha Bansal
>

--000000000000094e980637268aa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=
=3D"mailto:kasunath@google.com" tabindex=3D"-1">@Kasun Athukorala</a>=C2=A0=
worked on libbej - perhaps he&#39;ll be able to help out.<br></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, Jun 6, 2025 at 7:02=E2=80=AFPM Sneha Bansal &lt;<a href=3D"=
mailto:bsneha309@gmail.com">bsneha309@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Hi this is=
 sneha here, I was=C2=A0 integrating libbej library in my codebase but was =
facing some issues. I have few queries regarding the library. Can you pleas=
e help me out regarding=C2=A0this? So that i can clear my doubt and perform=
 the integration successfully.=C2=A0<div dir=3D"auto"><br></div><div dir=3D=
"auto">Thanks and Regards</div><div dir=3D"auto">Sneha Bansal=C2=A0</div></=
div>
</blockquote></div>

--000000000000094e980637268aa7--

