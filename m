Return-Path: <openbmc+bounces-316-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A2AFCD66
	for <lists+openbmc@lfdr.de>; Tue,  8 Jul 2025 16:22:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bc3H33nchz3bjG;
	Wed,  9 Jul 2025 00:22:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::732"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751984575;
	cv=none; b=MD5adBJaLYwESHNaFTEuJeGZWzzIjbuBPomFa7gfmoNRqRC/eTFqid1Uv8O92VONiFNqGIMI6BbZBeVstH+z80mQ7Ny25LLGA9il+kfLlUkw9D8e3jn3UqCkBBIjHv/PoNWEY01ETZxucRN9yeA6deEqHbcVPQlhX7KIdhE3zdlJKljrnnqDxF41D5RkLjQREwJGHckxczSx0tpPq80oYCnrmxikC7s7FHJoCQOHo58DHcOjYnxzzpEHixi74Sr76y3TtE1uu4POKGMlXbduE53/IspKdBh4rsOgyg1pxAqJfH3cSfBOsijDiKVF6dbtpYTa6Syy2ODgduMKUvGW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751984575; c=relaxed/relaxed;
	bh=zEvuApsLPe/xiY8OtDcLAfUSjLo9Mz0iwjpgVuagV+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nw6rI8N/lUw+zEopW3+qm37qtTiwlVjNi5quV7ddBhtY5xuPcXgDdWmLXxGwYj5iwBkjj04Os9URqxXNOtaUAvNh5mlEBlVnBF2Z7FYp33tW+zCSt76+WI0k8WLZKRFYsQSA5UNshUZlUeBK5zJx1t9OKIle3QmQfWf9DgXEEL4x+ApbPi/adECxnLw/te4cuIelL7RpmOcBRLajWuP+iBZVMxQ5yZGPaXqIOo1mDvPyh+E3q3XTT/lTJN5/PHWIIgUflhyS/SYJN38n15XcmvOmnysZ7Ftpm4szNmxZgyTZ1k/Jvwon6psNNtweD44gaRdvi+GqvUGzD/TDa2MF+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QHKjM2ti; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QHKjM2ti;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bc3H20Wkvz3bby
	for <openbmc@lists.ozlabs.org>; Wed,  9 Jul 2025 00:22:52 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7d5bf3300e0so450220385a.0
        for <openbmc@lists.ozlabs.org>; Tue, 08 Jul 2025 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751984570; x=1752589370; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEvuApsLPe/xiY8OtDcLAfUSjLo9Mz0iwjpgVuagV+w=;
        b=QHKjM2tihJs5PrjqFSnB15gryp2wMrXWGrGnum9nZlxmNaJqA1jZRKIUjIDEotr5aN
         MTAfM8WQcna6SqAilxMmMlZpQ/UYGc+btw3iV7ejXHgFDIgD9rZHSV5UWU3MhDwz1Cri
         4BoQrSrXrzYlH6GYmjpvhCDa2fsYZlGLfq7o0oxhSrChgp0dm3Nbdsc4y4tcONhxJqci
         LpDxQoR4vuGflOypL2Jaryxs+HbkIxbWugnp1jF86cODAfaLmOajvS2B3r+xYOTlBLO5
         lUk7C+YJmEUdqUx5xFtgtXvwjEZQ+S8BeZpz/oz5c2VDKK775sJa1y07bc0JVYUxaKkk
         VNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984570; x=1752589370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEvuApsLPe/xiY8OtDcLAfUSjLo9Mz0iwjpgVuagV+w=;
        b=plMb5LvFaAT+JxngU77E/VppbNZmlnYYuaEtxuDCJrMaBumIfeX3ICdBblgSpPq5yE
         hqF1kCM0ryXEXeUKIUQjulgkt/aaQj4nF3UX3R23V1CjSwnJUyjGzndp5TTtde1NdbrN
         lm+p5CBSNPT31HTuqx+atzebEjtc12UJL4Ls0VdW09t1lvx7fwzVzWhmWfBLsG7yVlQ4
         QuSIrg1GnSR3azLYQAXPtaApnGtq79k1MybIy+8VlKvvuEhL9Jyis0upme/3ej68mCJq
         8IzryeAErKp1I2+TGYz2KgoNO5IY616XovpPg6a/+yK5E9GOojTKDPEdJtGbJG09qU6L
         bdKw==
X-Gm-Message-State: AOJu0YxV8IrjFq6xqP9cRaVAPleCv6F+q/YTPvWD8dYpwecCb0q8KYEK
	rfLjxcyyky1ZloSYQ8GxiX0gum2VR88FOKntFZS5E7n4ke4cWr5jvcx8O0Ar9gQCUJ2zYBXFeFT
	4ImH17Q01IXViXZS83+XcC3xRmpCmxvND0qsq
X-Gm-Gg: ASbGncsY7ppxFwThq4YGdr1UUXYXq8YdGNrWVtx/k32FYt7Q2cvysssEqoDBznDEEUg
	PZ7pDW6Hkry5STXPmuQXucfoXcpCG6sRWbHfa/K9PqWjkylnpvWUEgT8SKmsK4+hDns6ILbHl2G
	eLgZ/O9PQ4H7aDFCPsWzIeIzLvmLLAF42eyXvBUvX2FMc=
X-Google-Smtp-Source: AGHT+IHh84FQ9aIgLaT/RWx5ulTD9Qr+Amc9fCCeSm6fbBgISFW3CSlTaz+OFiDPq3By8mxICENd1wbWiSEqC8QH/ic=
X-Received: by 2002:a05:620a:462c:b0:7d4:2854:7960 with SMTP id
 af79cd13be357-7d5dcd3380fmr2704474385a.48.1751984569332; Tue, 08 Jul 2025
 07:22:49 -0700 (PDT)
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
References: <f4c1b19d-192f-476b-9a88-ee2b92028e66@oss.qualcomm.com>
In-Reply-To: <f4c1b19d-192f-476b-9a88-ee2b92028e66@oss.qualcomm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 8 Jul 2025 09:21:31 -0500
X-Gm-Features: Ac12FXw0kE4yCbbblUkSLHNBMk39uK3yayMDKPhebvuzN5_TBUJX3QYwiMcDcRI
Message-ID: <CALLMt=qCSYJPKssp9=HvEZzt-zjQMY-F-_j3ZVRDfb91_HMNvQ@mail.gmail.com>
Subject: Re: Qualcomm Schedule A update
To: Graeme Gregory <graeme.gregory@oss.qualcomm.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 4, 2025 at 12:02=E2=80=AFPM Graeme Gregory
<graeme.gregory@oss.qualcomm.com> wrote:
>
> Please find a Qualcomm Schedule A update attached.

Thanks for keeping this up to date. I've uploaded it to our project folder.

