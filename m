Return-Path: <openbmc+bounces-318-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF22AFF1FE
	for <lists+openbmc@lfdr.de>; Wed,  9 Jul 2025 21:45:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bcpNt2fMmz30T9;
	Thu, 10 Jul 2025 05:45:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752090334;
	cv=none; b=ADzjUVe7wmXV1ETz+V/vL6uyUNgTPfAEgWPjYOU3gSEArLWE6DiDwO5zzghKvgLroWbaOp3KlkDhwzBKEwPrH3d8ySjucjsIRBF4JmP2SzvlBFamivo3O2BMLAaqOJmKDMXAnFgVnf48TZnp7SFajZ1bv0WpPPPmG7ncpA/YDYyafNHwVUYw1FktLo9Pkr/umOSXcFeWeNwBQwzu8nmR/EiLkOa5D98icty5fBHvcrwPWa7VqI1UrxoWPLAiWB5zsSdlUdkPVpJpzYsuns2N88LB3DG2QA83jx32rzpkW5ENma2BLjRv+xy8Gtt/920s/Yw6sNbZZ930ZKmOHdP9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752090334; c=relaxed/relaxed;
	bh=o7jknT1ShhZr8dLsk1+HNYivNrqJGA6/So51A1y+WgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLzTNDVeWFaakkoFYCCGcoVot2SXNsOTKzeIx1aXLWA0h6ahBqoN/u+gZQ0lqnm+qZcz/IHi3xKznrDCgcS4ZfekaHB3MHvFpWL2NGBs9Mh3VFMInB6vwJtUPP6S5F6xZOGPUquLNA7Q9Xrds80fNirJibSd6dmx+jCn6b+eg67J3TsjNgckeq8SmoAykR2Z/BmerDUPt+F5IQHgCZ/G96SUc0H+f0MfaBmYWMTRS7fOj/V9c1WEHBc/rJWlDgI05wOFf3Tx24+WBEfdQ87hyLAhTN7dtOqHVoprKm+XGSfQHWDZ5o/YZr0/LUW6jJX5IMLYtX8RZYmFQJfJixSsVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net; dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=YG+y1IBW; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org) smtp.mailfrom=tanous.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=YG+y1IBW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bcpNr3BPZz2xlK
	for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 05:45:30 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b34a8f69862so322747a12.2
        for <openbmc@lists.ozlabs.org>; Wed, 09 Jul 2025 12:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1752090327; x=1752695127; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7jknT1ShhZr8dLsk1+HNYivNrqJGA6/So51A1y+WgE=;
        b=YG+y1IBWARYAbfv5j4z9AXilbFQvRHSkwijtt4jlmfqt29HXrtqnvVDRjPQeqLtADu
         lD5UJRwaX6XEm3Rrstj3n0cpSSZprRHTe6YduFum/F5fYmcpKVDUHGdin7iWHwQ0XaO5
         dtg6zwKuR8dYVHFPElg6S3SXiQ2niRVFeuZ5z8EOebrub6u54+gApLtN9q/hmHWrFD5y
         AelCFSX2Ywe+iGJ9tt2EX1RFyHQSAYOhLTA32pl0O+bauAmkv1gjRiZX9Wnm/HBAjuJ3
         H4y6OA6Y05aN4wiHfjwNhViYvJ9M4cqqsVb4bZRQbpkO/3CdAO157HiAh+3/ZaTzvLeg
         EjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752090327; x=1752695127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7jknT1ShhZr8dLsk1+HNYivNrqJGA6/So51A1y+WgE=;
        b=hAudQIBaKGvoY+ihdTDQK4OmOtXvZ5gpkTnuzHB3rutyF2yrT/S9TGf+WXZgys4bge
         63QqlanhsH3641lJtSBTz3T/hcwNAqCEoqlVQ+CHn0i6RSbR3yHp39yvUXiNvr/IaoUp
         InJj3V+zn4mIrN3QDGlKO4FWNCNltOc3SQath+9dLNzsngE5KCtK3T0IClZTfYAUe5WK
         XQ8IyAgMzSCT3VVun5XpZg35QR8jgE+0z9P+7Of2LvsHwx+EbP8jIXCGaZd7OSXD4ebS
         cUXX/0hbsgDICnvBCVB0QPYGYSEjba9fD++U5m7kgm/rDbMHV8+yZAbU3snbGEjLD9QM
         pltQ==
X-Gm-Message-State: AOJu0YyuV2xcJYcxpjV6DEP97twws8OnEvAOMqtVw3EqfNxR/GRe9Car
	XlN2V4CMxv3fxMVIFaax/Mqj2c6+LgJlo9maT2wP7fz4ir9c+j5XaG3t3D4LO+X5XQWpAP1cfHA
	5t8bLmt6GsiVnIDUdZ+zeus9y7lmCm+MgGBEeRgpXWw==
X-Gm-Gg: ASbGnctouDBSlQfg9qajtNVYmX9R9GvMqm3W0qLcaEjiNgH1jgT3QGhFKGxK2Y9spbB
	kGWM66mwb9XoYuJ68SWT6nVKygeCEmBcYxDOGZ1GYc5Yk7bcTCoXuqFzg34vN4a8iqd/7PGxVAM
	2NdYbDwF0M+hvzZLzAtz0WGXHVn/jfhc5Pyj90Kp2mDQW+
X-Google-Smtp-Source: AGHT+IEAwV0F+1+Hl41Bc4aI5dXqVLbNYC5Rz2cVkptR9M+kRF+JQDqevHC5BjR/a21JAZHfk8EXA6stimqhGw8C2V0=
X-Received: by 2002:a17:90b:534c:b0:31c:15da:2175 with SMTP id
 98e67ed59e1d1-31c2fd768dfmr5936852a91.9.1752090327471; Wed, 09 Jul 2025
 12:45:27 -0700 (PDT)
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
References: <aG50XyECFuxmDkXB@heinlein>
In-Reply-To: <aG50XyECFuxmDkXB@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 9 Jul 2025 12:45:16 -0700
X-Gm-Features: Ac12FXwZ2RScixsjuv9hduFBOFSi1iX_4q3GgQAfL4C923Pn0x6uweh0WfHXoDg
Message-ID: <CACWQX82NwVjw=kb5VvMgLawkxWCNfQ0VoDaDdrUu9dRFQvC25w@mail.gmail.com>
Subject: Re: Deprecate phosphor-hostlogger?
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 9, 2025 at 7:01=E2=80=AFAM Patrick Williams <patrick@stwcx.xyz>=
 wrote:
>
> Hello,
>
> Does anyone have opinions on if we deprecate phosphor-hostlogger?
>
> I ended up becoming the "maintainer" of it due to the original maintainer=
s
> no longer being able to contribute to OpenBMC.  I've read through the
> README and it is very much not clear to me what advantages it has over
> using the similar functionality contained in obmc-console directly.
> There is some mention of rsyslog and logrotate integration, but
> obmc-console already supports a logrotate-like functionality, and I
> think rsyslog could be easily configured to pick up the log files
> created by obmc-console, if someone were so inclined.
>
> It appears to only be used by the following meta layers:
>
>     * meta-amd
>     * meta-ampere
>     * meta-bytedance
>     * meta-quanta / s6q
>     * meta-tyan
>     * meta-yadro
>
> It seems that this repository also incurred some bmcweb support that is
> enabled for most systems (by default), even though they do not have the
> corresponding daemon.
>
> Can any of the system owners above comment as to what functionality they
> are gaining by using phosphor-hostlogger over using obmc-console
> directly?  Is this some functionality missing from obmc-console or is it
> just a relationship between host logging, bmcweb and rsyslog that we
> need to add?
>
> --
> Patrick Williams

I'm not aware of any bmcweb users. Since the feature was merged it has
been relatively quiet in terms of additions/bug fixes.  I'm in support
of removing/deprecating it.

-Ed

