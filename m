Return-Path: <openbmc+bounces-715-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7EFBB683E
	for <lists+openbmc@lfdr.de>; Fri, 03 Oct 2025 13:08:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdQr86VKGz3cZH;
	Fri,  3 Oct 2025 21:08:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759489688;
	cv=none; b=ThCCJ75UYWeyHFqJHyC212Rewwk0ps78PajD7fG51KYRKGwWrx7sdS+LzLK/JGwTqjmBOSkJxII+2xehM5P/xh4g5jcTWCWtR6EgTkXh9bpnHKVQZLD1fM9U32IxuPqp4AqLDczjF8DLRRnGY8qeN0rRRkYCVeWt+C3IGKPvUCx701mCkvn+GyOsTvN1fin/lJbUt3+RYeelOV1fnFUhvaWB6qZy495jXdei4CkWtAGhXy4rKBH/1hdM+3NYQ7iw2JMR8CGIAs1QWsUzWQkUD442YrctxnzwZG6LW/tv03AbAVHm2kXoaTpgGsMzy9VoKXyeYC29deE0M99kZf8DaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759489688; c=relaxed/relaxed;
	bh=FylyMm4BGg7ZjMaTFlgpT5HAD/Jjyfo/5AEyhQXYFjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=As+cb6Qs9hSxcvUAnSQHcXvAQmiZFuKIgv7+9QOnWIyr5HUplh5ORoJ0UcxVOZx4XcS+6QkHizBgA6AQZyNmI6D1T5+rR6ZhWXcKHWzh9zO9qIXcmayDMruApSEaZOF+UQJjpkiMS63XgDuk07+8HxB8YPYUh9l+E00/RwE2/T8fpyGRt14f3toIj0rM/4WWDy73cghqu64+QqUUJ+vbC/m45yrvmSJuYJId17WZvlng7EmGYu/eXHGxpaxDKxVOJX84k33d16TTzTiHcrozaHmCiFYvFS5edxUyXwCpfu0vOUIHhFyjEpWXB25rnuLB4SnOyR+Rh0QQhLfNzAt38A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OMFDQU7B; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=eric.yang.wiwynn@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OMFDQU7B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=eric.yang.wiwynn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdQr70v1Tz3cYN
	for <openbmc@lists.ozlabs.org>; Fri,  3 Oct 2025 21:08:06 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso3766831a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 03 Oct 2025 04:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759489681; x=1760094481; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FylyMm4BGg7ZjMaTFlgpT5HAD/Jjyfo/5AEyhQXYFjs=;
        b=OMFDQU7BMqFgSisrh/phGjnw82ImvWa6Ec1eZjrCUTwrj0xLGkOISQK2danAZbaN6v
         /a5URG9AhOaxT+wIZ76nkBpgQo3aeFVwzOiiCHrHBc23oFHaYzM9xDWfRF8lZMvChIFb
         LHGyLThgXdcbwZRkpI0VV9B+W/3ttleYI5zkaNIfWzCVveyLimOhl+6nxF0DK/llsP58
         SR/qWzgFzq8A84vQzAPRgbWpA43xOr8ew+lMbhylNciOTmImIHMGqUETkaRAA4Pbx+9K
         FOWLM55Uey0D78X2ANzr6RVvdgQCTfeqY4XRDXK/UDgDxDfl7DCoRTRrC0ZiRrOX72bE
         0tcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759489681; x=1760094481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FylyMm4BGg7ZjMaTFlgpT5HAD/Jjyfo/5AEyhQXYFjs=;
        b=K4yFf8VjNda9PCRAVnwbpe3+S4jFxJL6RmWevFaohoigFRgm9E2zR9D+Jq50vWbPH5
         seDZQ7X/3qTstFbjhW9OpHyj+cfQdeBS+QWODzUGQ8aPsH/8zUCTosOmzRzJ+fTGnVer
         ehR6Jj8tSnyKTBeGAB/XkvDOum4C7dA0NbxXQ0zCzlGYVBptUnHp2fRBc1tOqMjXYgUF
         VBL1vEPDPYtVZlZtgMDIkVxI3/okoNgohaumOSSH340+1hr6lVRdbR7dQePgOM2W8BOf
         EgNIaRMF5GdTbq8dtNn60JwL+3duqH0ToaMDJsMPCvh2vsfEWRTK0o0PWhb0hncBdVd2
         647A==
X-Forwarded-Encrypted: i=1; AJvYcCU/PxjXfx4kA3wPFiD0g+RcAX0UfGvfGmiCVz8MdlF2uc74p8m+rkoGWhpifk8KfjkFm5qwa9Zw@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxXYU/Ix6c9Cc/OhA20d8L9Fb4GBreAa0xOlA3v3kXzSDWaLWRw
	+Zp+rnOcjeGZobrDTLRHtCktgDW2tp2grojRfohAYekw/9Z1R29zuVZ/rNN5UqB9ByHxqcwDNLa
	eI1U6MhSMvb+XQWu1PuIolKUHJoD8LBQ=
X-Gm-Gg: ASbGncvXFJ1MnslFoYQ0dACrwPRsbdcrMAPtWWPMIxOZmQwHUW9aitXNisKYPHY6DQY
	I5p7qhbIXved5rszdloLxCwwCHb5xFs58fl6dH1dGB2Xte7M8MzVFWpeZzv2rvGlgxXknHusgaa
	rhFOlPXBkt6VIiZqXrKU8CFygF1Dk/xzCKSKWtcr4BWnmTGLaVaZ7LySuiDTEgqb8mVJ2gQycGt
	FCWkIx0LGHNaB/oWNw+e1HdSDcNOYAx+1BximfxCPm5P8uh04QKr8Naj8GhdXiOXuWNFwq0nO7o
X-Google-Smtp-Source: AGHT+IG5tA/Zxf0nRM6jycOjNwmSR+GR/W5bkfEHaKvxl5wiWe1M25iq9IuRnaww0ffdME77HvEFIIx1xmiWQeRAis8=
X-Received: by 2002:a05:6402:42d6:b0:62f:5992:a64a with SMTP id
 4fb4d7f45d1cf-639348f1287mr2822098a12.13.1759489681463; Fri, 03 Oct 2025
 04:08:01 -0700 (PDT)
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
 <CALLMt=pk4Z4Q4UV1snL-T3ySXsp0ePXQTHYt5kPyxeALx5WTjQ@mail.gmail.com> <aN3jyZP-G1edHSYt@heinlein>
In-Reply-To: <aN3jyZP-G1edHSYt@heinlein>
From: Eric Yang <eric.yang.wiwynn@gmail.com>
Date: Fri, 3 Oct 2025 19:07:49 +0800
X-Gm-Features: AS18NWDbmUamehCrh4lNT3FMknj8Bx3aQ-unBi8nnjWAXLCqAUlrVRL9fs2HnJA
Message-ID: <CAFme=r=CuYS08J+9gfoF_7FzybvnNB0m=Cbo=0OjApjZcOxRrQ@mail.gmail.com>
Subject: Re: Resending (plain text): [DISCUSSION] Policy for handling
 ObjectMapper stop: reboot BMC and refuse manual stop
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Andrew Geissler <geissonator@gmail.com>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Apologies for missing Reply-All earlier =E2=80=94 resending.

> Hmm.  Don't we already have phosphor-systemd-target-monitor that
> identifies critical services, collects a BMC crashdump if they fail, and
> then enters a "Quiesced" state?  If someone wants the BMC to restart, as
> optional policy, can't they just insert that as a dependency on the
> Quiesced target?

I=E2=80=99ll look into phosphor-systemd-target-monitor and work on marking
ObjectMapper as a critical unit so that failures trigger a BMC dump
and a transition to obmc-quiesce.target. It looks like both the
optional reboot tied to Quiesced and the manual-stop blocking policy
belong in meta-phosphor.

> I don't want to see a one-off event for "object manager crashed".  I
> think that it would be more reasonable to have an event for "BMC went
> into Quiesced state" and the reason why, which isn't really interesting
> for anyone except BMC developers, can be figured out from the
> corresponding BMC crashdump.

Understood. I=E2=80=99ll check whether we already emit an event when the BM=
C
enters Quiesced and whether it can capture a coredump-derived cause;
if not, I=E2=80=99ll try to add one.

Best regards,
Eric Yang

