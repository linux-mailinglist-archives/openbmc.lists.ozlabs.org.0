Return-Path: <openbmc+bounces-743-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F8BDF534
	for <lists+openbmc@lfdr.de>; Wed, 15 Oct 2025 17:22:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmvvp0MtTz3dLK;
	Thu, 16 Oct 2025 02:22:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760541733;
	cv=none; b=fOuXHgM7HmxVmLkRpU6NCQFpdS3XqPG0voP+cQBGa0SHjd72WqP17PmQO86bqPGjxt9d8GnB+xtpTodcBaS2rBkooXZbY2y7cOt9wF43U8+kUJjiTEVTEShmnllnd5qlMzRhq9GctIDERWNZUWUPu8bwOg7upxbvYQx7FWcu0Cf1M1BEaU9sreOpK+U1R9qRCdiTt/cDnmpHKQoeFhgati9oxXM94vQ0tUSTEyZd6A/SosrNU/kQ+M/eJaGGkT5EhBhuNPpVyYqhv+ghcbzOXd2dHnDHLUIImMtpgMs6EP/ybkphhVhMYn8muS5g/X9tuP8KNvgEGteOJUmHlBNO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760541733; c=relaxed/relaxed;
	bh=636adyeToaR0IrFL5S6oT1KPvfw3jZEtxzOyvHGbpqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+u4qjCXt4IROf7fDNWLDal/YiBs96ob4t7aTeQMTUbaLyvuYcEYJ6BY0laS2p+s26INdAM61j6ffrDGjJCQydVuM+9sT1vvpis6hmtvGOH90Y4mrll8OYs1cUCKF8f9zL3H8mZORUDKIE6xQi/yDCmzPryLeg2o4+BkaYYldyviLpGBWTqg1A7F/Ck44IEBP2Un+VX1aWyCZR6tFDZnJEhmuLJjF+rYKYr8mItUZc83OGSbXlD2bSPk0oWZ1/5LztA2NSDmytzCoEmULO9cNBEj6sRPcPLPQKbBZCw05yn9vPEDTPvFGnQCXaOaqErnlh15DeuRjSuik16VahcDew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XtSsjZhS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XtSsjZhS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmvvl6X5Fz3dBZ
	for <openbmc@lists.ozlabs.org>; Thu, 16 Oct 2025 02:22:10 +1100 (AEDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-5a265e0ec25so4605165137.1
        for <openbmc@lists.ozlabs.org>; Wed, 15 Oct 2025 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760541727; x=1761146527; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=636adyeToaR0IrFL5S6oT1KPvfw3jZEtxzOyvHGbpqY=;
        b=XtSsjZhSw45hcw9vfdWQs0AehJZCjIH3nTsEibrromQ9VaBMal7Fge9UA809/4gSaS
         H71ZOFCGd5bRpYTy5IV9h5pkJ1MeqWqnroCaI/6CBWYRRyPeeWs0bQpU7yXcwJrhzpA0
         z7plkzyHVZU0+Z58J221eyULETPrkuRJkq8r3LLPyoGfv4ZgFYFE1lvctE0eNsxvVJ9P
         nWSFtrdYk8lPuQbgldwTQznIEsodX5irK6l+aAt/JCONcCnQ74kI5IvxJdvokxfvWlfg
         XCD3L12Fi0ZUih14WBv6tsePKKRCN+kZMPNqPlHzgpQNb5NFX4IzcL9ev0oSPYInYfZm
         BQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760541727; x=1761146527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=636adyeToaR0IrFL5S6oT1KPvfw3jZEtxzOyvHGbpqY=;
        b=OBn/srg6u1x1cbYDj3v0f/jX1+HsISmz5wLnU9m5e+MxfWTx9Cg7IWHYBUOSM+PbzS
         NTJTUjd5XxalmkRHgve+gdB1ZFEFIm6cUxRcf6iT4LL5yb/ZMrwgrtBWPZOBqh9kQPjS
         2KzD9fN1Fa18qk5N2JqkGa+bIGQUGsBPMGh8FTPqQOBB0ZwW8lTbrJ5QOwKBup0pMs2p
         iJLdTIPOzJgrBq9hOkAgrgKe4vdGGJkuHws2IScS78MCVhaF69i4tNeUQFuxnn8Kzlhx
         F792vLIAG+RspMKmK8GwNqKVEulf4hk3Qo4psooWEora+VRTSKhGK3tL0hXK/ay4KOaj
         cSpw==
X-Gm-Message-State: AOJu0YxfcXo9KXLfTNnuPbwwXTUmaUpPF63JzmhkO08B2tQvzBP7RF1O
	Rj/GFuWm5wmFFRldClfYog5ZvXCsP9+16mDLd9HzPHXeDg15b+ahLpJdxcfvgu68iWISyOn4lZz
	gp8gPUngfhIMR8ZHkVnNAD6rJ4s7Aebg=
X-Gm-Gg: ASbGncst/XxPCQFQYUZ5oaMB6PoDgZBSwikSqBPexXblYQ/c3onFAURwz7Z4llBDC0G
	9JDaIWTdhboAGLywBPqgt/wJzVd0o3ltBcKJQ3zU/UCZp8OaXfaM2pRBfIHF6hlDdOFIFLhizLB
	n1zz6+wG2Epb7Flib6d0mOxTHKAsZrBadsEj/+i9Fnmor0sZKBu7E1dy2tV2U3bmZs9rt9FU1QE
	JWuU7WsWPQZg6UxoZKlUAauHCPt8QuKbqugLA==
X-Google-Smtp-Source: AGHT+IFZqHCbTNumi7sNRaA9rmnpfUJ1gCMjKmnMvYHYxysZm/zuOGVXKmA0SLOP7NmibRcPd/4Hpl/Xf+EiDA+IM7o=
X-Received: by 2002:a05:6102:f8b:b0:534:cfe0:f86c with SMTP id
 ada2fe7eead31-5d5e22b27f4mr10637674137.15.1760541726588; Wed, 15 Oct 2025
 08:22:06 -0700 (PDT)
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
References: <CYXPR12MB93185FD460BF55DC0279B0B796EEA@CYXPR12MB9318.namprd12.prod.outlook.com>
In-Reply-To: <CYXPR12MB93185FD460BF55DC0279B0B796EEA@CYXPR12MB9318.namprd12.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 15 Oct 2025 10:21:50 -0500
X-Gm-Features: AS18NWBDCxtiVPbxKnGdrV-0r2Z0Nuf2ZjF8knS-m_9xSWfoWBFDldpwKYX7Pu8
Message-ID: <CALLMt=rS95P+8JrO0H54Ty3BqjOEkj=ScrwzYtxBH1gFKaP6FQ@mail.gmail.com>
Subject: Re: updated Schedule A of CCLA from AMD
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 9, 2025 at 12:08=E2=80=AFPM Venkatesh, Supreeth
<Supreeth.Venkatesh@amd.com> wrote:
>
> Please find updated Schedule A of CCLA from AMD attached.
>

Thanks for keeping your CLA up to date. I've uploaded it to the
projects google drive. Supreeth feel free to add anyone new (or remove
anyone if needed) from the CI list up at
https://gerrit.openbmc.org/admin/groups/b6f229c0f3e9a11b814e6ccf56281d4064d=
4da4e,members

Andrew

