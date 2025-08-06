Return-Path: <openbmc+bounces-417-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D277B1CC74
	for <lists+openbmc@lfdr.de>; Wed,  6 Aug 2025 21:22:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4by0YB0K8Gz3bpS;
	Thu,  7 Aug 2025 05:22:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754508142;
	cv=none; b=ZqtruueD5ikUmYJtbLMa0bHcLCjtBik1Azj19G06ESLu+UPba7dGUiDsjfgnQNtNDEQXXJ1kfSgwOCWbw5sHAjtKC4Ta/NUvwpmbFdRiYKBng5ShTixvrvi4l9lddtiM2WIwapC/hKQ7OjjK/niefYkuBiVEFusak4ueYnC1OgVCoB6g9ZrjX0Bs0zm6eAvx5vNUFGv/Ea7VRrh6OylXj73czcF0AlsDVD7jUCjAE/3helx7pURpHMluTHnGcmk34DYfzahjOG4DxF494asF4Ka4gTneqZ5EZQ1q1Jt7Hz/eCnGOj5TcfiiYbZEWoBvAhmhrkvCXPRrjpPMvRVbNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754508142; c=relaxed/relaxed;
	bh=aHwWOfdx8CsEHP3Q91z4HzbzXequ95KKFtyCzmohlyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2GtOoDSrPKAWIEJBgn99TXQe3jFaSsT5LjYb9gV2Kejlswky2U0a//bbPRK9vyxX26aRnoJvgIBXrbDpk1lNOEJduOqwVDuy4Wgk66fteo/3S1vwZn0kft+AqZA9CSKL+knaf7Cmq9w//hLApTEVcMdvwCw4BGGn1yYvDuemwCEMMzofr/3+d/TtiHbyX59Yb3r8Zs3qHTYrYAg+k3FXImxPfpKuRYOH9f08y7lFVXuet0majlwFRH4PzBTE2zy7Z95o8CzMNwwpFtla/jrodVXvAglcrv1Mwwumv2m/3NfO5/nkjTVr9zt3zY/yLiyPQQ49lk/jtzkE53s/G1nqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JRN0Um+B; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JRN0Um+B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4by0Y60mdBz3bmC
	for <openbmc@lists.ozlabs.org>; Thu,  7 Aug 2025 05:22:17 +1000 (AEST)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4fc2132cc97so891908137.1
        for <openbmc@lists.ozlabs.org>; Wed, 06 Aug 2025 12:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754508135; x=1755112935; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHwWOfdx8CsEHP3Q91z4HzbzXequ95KKFtyCzmohlyc=;
        b=JRN0Um+BzWBu0chr6QdnfV72XQ8RVRds2UxD10DkR+qc4Kr95qYW+dUxSfWquexFsv
         9HJFmRTCOtplgQ42n4YrJma8l8sXHaTstASgJnmH2/YxBC0HQHx4JpMIjKyywonJnSes
         jH8hWr/80qE52i/D+vj1xSsWdiLQs6v9pVLZ9VhTEojspe0H/4iPapY3Ge1PoHYWmUeT
         N4cJ/dnFCdIJrsDwSrkR5DXiPL2M8spZjf5+KPOt+dQJY21GtdGRw0yOQtKYn+lWBwSb
         rlP9pU9woz/sma1TV/aXsejOHGOInm0krgRafFpxDOwBnVpMVIhr8ocK1vF950vwy6kV
         uTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754508135; x=1755112935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHwWOfdx8CsEHP3Q91z4HzbzXequ95KKFtyCzmohlyc=;
        b=fyKryZwXInXKJS7tRrXaqqotRLzHs4PlZm7mwnHpAWJvZ8xN1Kzz1Tjlp6+b+IREbq
         dHP6DGKiUgBe9UfYvuq0x1aGpDVrp9povUk3ZXwaJsRkjD2n0cuok7Xi9I7XZaHYVLO6
         DKoHJFFwvDXCGOuQrb/M+/KLGkjVePVzE48YMC3F5JZYHKGDHZkRejXy4L1BzO5dlnXX
         WYok6XWpqMpE5k0mPrtkAhSaTbIH3YpZ+yZo0IJpgmbvdV3L4lknTxhHazLTd7fD9P4x
         xG2FX5jnxZhJO08LMj7SeCepxT59lFZqqq1070dXtYed81R89bv9aEy4B3vSN/dzCAUN
         GAXw==
X-Gm-Message-State: AOJu0Yy195gnaZjXRakX9shK9gpjHJqPGEaa3iGAFWpTFhXdewYIyM41
	fReok6eLEny+g0b/dgKJt4xZymzJgwq0k8fDaU+EzV23yGCqE9fu1vRMyuGwSr7RZW0EnRT6Fu5
	uxjDOTIGZP8EKWA9IIVHoIdsw0WOYLbmTnZgj
X-Gm-Gg: ASbGncvBGRusHEguQXAZWZmO/kXOoM5Jxd6jvmcgofMiT+JoAsJ75mm9aREhOZ16fX1
	QVnXTrWcluiuOdUtbQCjvd+NLiVuwpOOtR6bq+ue+6f8+fQQBDzSqAgSGN3loQf5fhiy1OYb1/f
	Vv2bdhm3jvGhBdZToVw0QuKJwXkSAHhEzGUticvrGThZXOJw9s0MsPy4NIIiSDdfxmD1VBqZliR
	BZFv7vt
X-Google-Smtp-Source: AGHT+IGqQgPvTXlUyq6fZi1Np7AXZU+1EhTmhvgrQ27k1ntdj+uVtTAjQh0Wwcx8ybnHOx/yGiiCY8xNCYUrdNlxuHA=
X-Received: by 2002:a05:6102:8081:b0:4f3:2f5f:c2e8 with SMTP id
 ada2fe7eead31-5049467ea09mr456866137.1.1754508135347; Wed, 06 Aug 2025
 12:22:15 -0700 (PDT)
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
References: <eff663ee55f2614dde750f5f0669ec876f107c0d.camel@codeconstruct.com.au>
In-Reply-To: <eff663ee55f2614dde750f5f0669ec876f107c0d.camel@codeconstruct.com.au>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 6 Aug 2025 14:21:58 -0500
X-Gm-Features: Ac12FXxbqGV0QqJMivjT2IG1UAApjTahRJynkD4NIjbDYO9Waiw_SX5HIZz030g
Message-ID: <CALLMt=rt8Ngv2sRKOeQ-Gm=cccaw-d3j0WahqBXyQydhqC15nQ@mail.gmail.com>
Subject: Re: Proposed deprecation of device-tree-gpio-naming.md
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openbmc <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 5, 2025 at 6:54=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hello,
>
> In the comment thread at [1] I've proposed deprecating the directions
> in device-tree-gpio-naming.md[2] for the purpose of describing GPIOs in
> devicetrees. Devicetrees represent the hardware, and from experience
> over time I think it's best that they reflect the information from the
> schematics without influence from software implementation choices.

Yeah agree, it seemed like a good idea at the time but there has been a
lot of friction with this design over time. I know some reviews have simply
been abandoned due to the frustrations of coming up with an agreed to
gpio name. And other reviews have taken an excessive amount of time
to get through.

> However, perhaps it's still a reasonable set of suggestions for
> consumption of pins with the translation from net names done by the
> applications themselves?

If we all agree, I could do one final update to the doc stating it's
been deprecated but feel free to use the existing recommendations
when creating a new system if it makes sense. And another note
indicating some OpenBMC repos may require some work to support
a new GPIO name.

