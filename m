Return-Path: <openbmc+bounces-712-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9023BB1B3F
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 22:49:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccRqr0WFrz2yrT;
	Thu,  2 Oct 2025 06:49:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759351767;
	cv=none; b=nRY40VDj3J3K1/O/VYJAr4EB8z8Wlh7GEj3RoTQdOqcDQ5H2T5cUZWcVr/wHxXmISv18MEsdMmwaWCOhDY0Po47VCDP6lr8uYyfx4I39EnEI7JeV02K5ufmHthIuE5ethY2BrbXfJQgUh7kVjlVt1zL1Shm952ahIXrh1D4mt6uSN/EY/I/lXt0MSq3e+kqRNx4kmRDBjS7fiNkhj6MG87hno/ww5246VVtuGsAKbq9GGRhWmaABF/bqicixVm488G0c54hJ1t8CphFXeUaJ5EkXg/HM1aAhf9LrUOKZnlZ8P5F6q1bV29p/nlhjBNIQi73KRBavMQCq/SiC+Jfuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759351767; c=relaxed/relaxed;
	bh=n+o8PLio6vDvYxpdxPLGIU/V2XfOIfVI/wWgNbPYHKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsuLa8MIN491VyEvX8W2+9Awb8Bys+jiCWYvBHrfFEq60FtSxRsa4IReW6sww5Qa0paIuFemEsc8Fwg4PwImvUfZaM2LDVrtbVPlZUXlTQ9e+kgJ1p6hZIFDHkRe+ElscqAgfZT92V3AdMZb2KhwzQZK7UfJGdcJYvjko54iLP8LXyXOf/WWxYHxCyBMt3VJnSPj3BdY8gTnAfre6a3mF0cVlVaBcz/oIndxFAectGb7Upmsvqqq+aax7i49FusvaD679gOPUbboXD03IYzCzEpRUg1Ha1fH/VvDbLZSX+VWlobmVMMpluBcgYGltUPY98X2ii/5XU87O7yAHr1xag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IzJuIwTV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IzJuIwTV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccRqp3TLWz2yN1
	for <openbmc@lists.ozlabs.org>; Thu,  2 Oct 2025 06:49:25 +1000 (AEST)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-59f64abbb61so164475137.3
        for <openbmc@lists.ozlabs.org>; Wed, 01 Oct 2025 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759351763; x=1759956563; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+o8PLio6vDvYxpdxPLGIU/V2XfOIfVI/wWgNbPYHKY=;
        b=IzJuIwTVuzsl005hv3nijBiAqoUPuhD+/Nr1cm2ZrYWQ5s3P6voiZvCtKYsEDWZcNk
         /SflG0hAVsAemkSzSGZOygquqzssAbuxaFfDr0iki7/n4LwqiBbdlmt5BYkabC0uznLd
         BIBs6h6I5kUVJlaLPZFwY91qsFr9+1TRCyMm9Qw65IznzFJu2XeYkSzLUzjEnG6Sl3jQ
         Z1ohWoy8N6g7rlQvTu7RE33CTtlAzSWXDpPcMK6S6CtNBNFKpQMkd1U7eE5QvdIWZ0Ur
         iCjOPRdDI5sVMTCtxQ2DZbnBFhFDCCI6wIMkTxvb0HOyAtM8O5eWSSmY7qoplV6NJlOG
         f0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759351763; x=1759956563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+o8PLio6vDvYxpdxPLGIU/V2XfOIfVI/wWgNbPYHKY=;
        b=BzlubOPl+5JsGq8dX3PUz0jtvfnYvOLw5NBu1mOgaOI93SajfnjFVkyn0K+9SJKTP5
         7csHeAwa3toVfgfVQqvnE+yg50HK4SfiHFUV12MT+C6pLJRt1hqN7UFKy316mVTRDEQ2
         XYNGlNFZWkKfNR1lVi+H2YMvk2sIEDDwF/Ke6xjrHP7Cb8E/ZjHyM7i2yTbOXwHt4hu3
         aj2SUIKExAQa/oyLwH1bqeDxrxVyCLLxLV6ppydCGF3XwE1gwVMYoqzjJVgoGVioQM68
         3MUulJizjW0m7Ieyk5yQ6TWsgyRuiuamR7p9cvSXdaetIo7HvLA7aQcunUC6+bO3Jj4M
         +3Zw==
X-Gm-Message-State: AOJu0YxMh0O5Rrz3Sm8anKB/CzljFGJoBSTZr20Q8MsgOFxsNPSn0Ckw
	Ja/vJwntCONxadouPRI1Bv6GALwL1JYTnLSmCkg1vqFyzl/hlR23HoU/r5+Q7Lof8iefER812oD
	cuzlZQyW8OYvs3VoEYIba7DU1bccorHY=
X-Gm-Gg: ASbGncuxGmCYXVEdw5NeWLB+asFoQuksuJa1HsPcHdEObVuAsp+9aN3MuiEDNUxppX4
	71KPZNIFdwwtMfY+9aqEv2a3GOVUE6FLlm5yS7sT2KWsTSb/QWoDFB2V5KFvzu7waLw69EB3/yc
	35z+wIKiJ0sVrwcFS1IzKo2qr9heBvWBxFSWna6zuNCZS6ZsAvpVjz6eGmVYa40cx5QKjCJK9Vu
	L7sIhGVeCDr5cBEOjQG+okMo0oA
X-Google-Smtp-Source: AGHT+IGCxXxhDg0lH1XQ8Sth2rxU8/wE9pX8NkBKqKy/bN0TRIdE2Aa/etSsZsBH8L4PlYC3HT7Ahw/ThkTKiIQAW5c=
X-Received: by 2002:a05:6102:d93:b0:527:8b63:78e1 with SMTP id
 ada2fe7eead31-5d3fe4ecd1amr2300151137.1.1759351763139; Wed, 01 Oct 2025
 13:49:23 -0700 (PDT)
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
References: <CAFme=r=6AbKYkFMUKA1Xwpt_b_4QFVkAb=+d03jHVfYX_5QaXg@mail.gmail.com>
In-Reply-To: <CAFme=r=6AbKYkFMUKA1Xwpt_b_4QFVkAb=+d03jHVfYX_5QaXg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 1 Oct 2025 15:49:05 -0500
X-Gm-Features: AS18NWC4eRJAo-s0U0qp8KI0Z0jo8KPGsRAjZhAzRDzSOXBWz6b6iDLnqbnoqZc
Message-ID: <CALLMt=pk4Z4Q4UV1snL-T3ySXsp0ePXQTHYt5kPyxeALx5WTjQ@mail.gmail.com>
Subject: Re: Resending (plain text): [DISCUSSION] Policy for handling
 ObjectMapper stop: reboot BMC and refuse manual stop
To: Eric Yang <eric.yang.wiwynn@gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 1, 2025 at 6:21=E2=80=AFAM Eric Yang <eric.yang.wiwynn@gmail.co=
m> wrote:

> Questions for the community:
> - Placement: Should this live as a default in phosphor-objmgr, or be a
> policy in meta-phosphor?

I'd be ok if it was a configurable policy. I don't think we'd enable
this on our systems. The issue is very rare but
I have seen it a few times and being able to ssh in and debug it was
very useful. Mapper is d-bus activated
so for better or worse it's going to just be restarted forever.

> - Safeguards: Any concerns about reboot loops if ObjectMapper cannot star=
t?

Yes, this is my biggest concern. If something bad happens and a reboot
does not recover, there is no way
to debug this issue other than hoping an AC cycle fixes it. The only
thing we let automatically reboot
our systems is a kernel panic. The ramoops feature is utilized to
ensure we get debug data (and an
error log) when this occurs.

> - Reboot reason visibility: Should we emit an event log indicating
> that the BMC rebooted due to ObjectMapper stopping?

Yes, I think a log and a BMC dump after the reboot to at least get the
journal would be needed.

I also struggle with where we draw the line once we start automatic
reboots. What if
phosphor-logigng fails and nothing can log an error? What if bmcweb
crashes and there is no
external interface into the BMC?

>
> Best Regards,
> Eric Yang
>

