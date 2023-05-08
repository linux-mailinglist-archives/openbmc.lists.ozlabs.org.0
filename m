Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB86FB886
	for <lists+openbmc@lfdr.de>; Mon,  8 May 2023 22:52:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFYQC2RNgz3cdV
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 06:52:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=4vdSUm/3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=4vdSUm/3;
	dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFYPZ5BdRz3cBL
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 06:52:01 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f19ab994ccso50654145e9.2
        for <openbmc@lists.ozlabs.org>; Mon, 08 May 2023 13:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683579115; x=1686171115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndVML2MU8/kZOtSTOEF30XRigfst+FRBwJk660ciKeA=;
        b=4vdSUm/3kstN4PFonywHn9QlbfV6NrQNMHuFl7OcLVOw1iR5mAoOR5orRJePfk3Qmv
         2ywKLjDMfJugollsl+HKAVOQeGSNvtr8EHJFBCgDh+grpBFTaN81yTRLuAwcLh0oI6ZN
         3UC4aaVxj5KoLwzc4v0vYif5oW9D55zdxW6v7C5G9tT4dKfDRxZj8heXYLXc9JgSTrMt
         l5FcMMC6nh/WumJcr/eJNAoSDL4xsm6N8SoTyrq0ZmHKmBw4yCNF3+0zsYo5lY9SknY4
         pwggw/OvxzWerTrGb9JJ6pUqVpbxhyGIwCgxRnJgYUgUHcQUw8rknLXT99GlR+ifYPhk
         zXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683579115; x=1686171115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndVML2MU8/kZOtSTOEF30XRigfst+FRBwJk660ciKeA=;
        b=Ydv3/z91SEM0VOKTxC2IN4WYUqLIkoyFUQbKXGeNFbbyAA1PaKEXQRY2T8+FsZptWf
         80I/KtNmxiput/7DqSGOkpybY5E8omSiKNrJ+inGSxmJB4mcD6vMFU1iGk/yQD1dKeA5
         MCjdXVLVPfQ+AKWnklbZsile/a8+rW4m1AtWg/2arOR0aiw+6waIjiCqPDKwUMHC8539
         IOdl1Bt+hk/+vN9ygayILG7VCFIuv8vADL5OeZe3j0nvXQVdC2WMJ3Uvux1L4aNdlpki
         iwiixjPJoyxTFekRfn60fR1Y0Ryw/J9YmHz3abr8bMfGIA9G7pKk6dBPgGCXFV7Qxy6f
         tOMA==
X-Gm-Message-State: AC+VfDz2m/MPfp0Q52E4g4VMVIU0tHbPP2iCqcZGDJvFGF0Qv1vUK7N4
	LmlxfG4HZZG9zq2kx7qM3bXCmUgCrsKoWG2XsfrfQA==
X-Google-Smtp-Source: ACHHUZ4NrK6sINxuSLvuQmibV6bAfiCsLNcgBtxHeMcveVA/3v0mYwk1S/dydAI3e+OiL+CH1d9/lRZrnMkpY8AQ0oU=
X-Received: by 2002:a05:6000:54d:b0:306:34ae:6a16 with SMTP id
 b13-20020a056000054d00b0030634ae6a16mr7850587wrf.35.1683579115382; Mon, 08
 May 2023 13:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <LV2PR12MB60140D575EA40854D74472F4CD719@LV2PR12MB6014.namprd12.prod.outlook.com>
In-Reply-To: <LV2PR12MB60140D575EA40854D74472F4CD719@LV2PR12MB6014.namprd12.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 8 May 2023 13:51:43 -0700
Message-ID: <CAH2-KxAVgJUC89mdLO4RnrQgAV-rVROrUHSDz=j-SzyVhTMKFA@mail.gmail.com>
Subject: Re: IPMI Sensor Name limitation of 16 bytes
To: Rohit Pai <ropai@nvidia.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 8, 2023 at 10:52=E2=80=AFAM Rohit Pai <ropai@nvidia.com> wrote:
>
> Would like to receive feedback about this solution and any alternative th=
at may exist to solve this problem. Any pointers on existing patch also wou=
ld be helpful.
>

Overall, I'm in support of this feature, and I think it would give us
a lot more flexibility in Redfish in the future.  It's one of the
design points that I really wasn't happy with in the original sensor
subsystem.

While I think most would directly take this feature, one thing to keep
in mind is that there were organizations that had the requirement to
be able to map IPMI names to Redfish names using a reasonable
algorithm.  Having this supported would break that requirement, but I
think that's something that an individual machine can figure out by
coming up with names less than 16 characters for platforms that have
this requirement.

One thing I would also very much caution against is reducing the
performance of SDR listing any more than it already is.  It's current
performance is at basically the bare minimum of where it should be, so
if making this change requires any additional dbus calls, that's going
to cause some problems.


One thing I had advocated for in the past is simply doing algorithmic
string reduction until it fits, using the most common transforms.

Power -> Pwr
Temperature -> Temp
Power Supply -> PSU

These are algorithms that humans already do today manually to get to
the 16 char length, so in theory you could do this transform without
any changes needed to the actual platform configs, and if someone
wanted to reverse the algorithm later and come up with the Redfish
string, they could.  Something you could consider, but there might be
simpler ideas that meet your goals.
