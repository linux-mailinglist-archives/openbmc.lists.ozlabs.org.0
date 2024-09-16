Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4D19799CE
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 03:37:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6SFs4JHZz3c9w
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 11:37:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726450637;
	cv=none; b=dLT9bPeES2r4r0rxg5bzcoPl6yKpv87R+Cy05fCz47pQ6yd3aaEA/fWfFYFRQJUSIzIGo/RtYEnfnPIPFBjIclFAUTLVN0dmEZwJ0PkB2AQwOry6iNyCQ21V0oV0W9BP7sY3fHCoifFCTe43+K3dMvI/xJy9WPWcmWBezyfQTOqNW411dm39vCDGbspIrU2XvyaTvn29frJzDZgGTQ7cBdTifzDO4Jj7KcT5+MYoGor/aTEb3P9R1ZW+mn5SAxxEVJ7mjRki4+iOiD8t0IbLcWDj0003JbI3QwBaQDcvET7F6RT3k/bcKPbZMsYg2S+REVPy5XNVJwi6dF/FIOG33w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726450637; c=relaxed/relaxed;
	bh=FsLTyLRFsCmL1kp1O4cxcOiHcUnnn2FsIW0sJKScEbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtGyONYiMaz9jXmR0SVAMi58cq4JG5a732dLnc41PygHVuQS/alj/oavw1LI2m/H2WHCb6WSjzcZhFNgNuQm+YbSlxjY56ReDhfJ9FIfsWer2alhD93pYBxgG/mCTVu4pjio6x+JzX2pCwygT6EuH7mcsqanLEraumV+s/FevwkbGB/3YnnuoOtZr+p9aE3D2+K5pI0RMxF3cPDj11sJWHe2Y26DaeBlYiXCU30LObKEJE0TlpEpkqimD7eVenhJaIPsemxglt0jUzThvPFqmcg0AuNo1PGOgX1M8iWcItJWJWw18ywzVr7nNhRvuy4YII9+GuD0HsIw9eoRrNeUVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TFURJ9sW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TFURJ9sW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6SFn1zsnz2xcq
	for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2024 11:37:17 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so35902785e9.3
        for <openbmc@lists.ozlabs.org>; Sun, 15 Sep 2024 18:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726450633; x=1727055433; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsLTyLRFsCmL1kp1O4cxcOiHcUnnn2FsIW0sJKScEbk=;
        b=TFURJ9sWAi2oaeXeFYs3bwX3w6BkdGlgJYmW5IpDZqD1Hk0+Nu5LmPsJ97mEKmOWkD
         uRLPFmOrnSda0jtVCJ2d6TCUFpVn+DrWzZUblr4sNS+6SX1r5uuwbWTinHFkaQ6mULuE
         aTq/wMIVaiRpe8twBRKXQcNELwy5b61mXndxJw82NuBUtbBAbw7DDb9RCCAAuVDwVrlW
         WN26YmgRYg1pzVTw34U33a/g/tHSIYRmxuDzCtti265NaoaRpXdTDd3ToVTZGbEFdAxq
         LFOMtpJ3D/V6Q6XX+ImBENAm/ugleNPz6/7VqSvCWl3aD2zum6SHk0PzYFrTXDrFKpgK
         vR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726450633; x=1727055433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsLTyLRFsCmL1kp1O4cxcOiHcUnnn2FsIW0sJKScEbk=;
        b=fmEU7WM3C8LxAYABWNp5ykLQsyVjM9LE117W5ERmMjcXU9qlEXXrHzEFiwYVAT1Bao
         9hdBVkTdgRWib6UKC1KoZgdrxizpSy4DesydDJNVs5LsvkDyUlxzPdzB9GuG+rwUNdRu
         yxaeMygMSWVP8unYWPfOJzS5Aou9pwFCLMCBHh2vBi+Cx0MJvKTvlFb7NEiSBfndYaeu
         yIVqeLkWjVW+doJDaL96PUTbHPZ66QFV4ZioiUKelA82FZgwfi4NTjexFysB2i/tNdK2
         4hyEy1p3hUgnlIHT7soeY4mNlUd4MHeIgvw3DG7/2aGe/m1BDpdEmgdHeRSRP88oOaYN
         7aXw==
X-Forwarded-Encrypted: i=1; AJvYcCWkT5NWVYZLGvmhwtZLunUOGwm3ISMGvtBldR7Ya98cyiv04bTTE2FKANkcj0uzONQxcnJNBPDv@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgF/HrvXQEZ9MqbbWrqXBxyirCreA+adf4TcY47l35o/bR2a/I
	vBqg1tpMWZbHob1Dqe1kLaImo18oyw/dJNv9m98CD02WyyhKV86zAWLWCXD2BdwlbJB945bACFQ
	fLPDgRqtC4FtB/yk69EH6J+3M/Q==
X-Google-Smtp-Source: AGHT+IFEzGlESH/8xUrK4RFZlGDsJIWxG2IOs8SWRiKC0UD1JGyzKSY5sm4jlfIeH0FDTsNo6bUukdbk7KgUfeHWVno=
X-Received: by 2002:adf:c651:0:b0:374:c847:831 with SMTP id
 ffacd0b85a97d-378d6243cdemr8132993f8f.55.1726450633211; Sun, 15 Sep 2024
 18:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240913101445.16513-1-kfting@nuvoton.com> <ZuQUOw5Y2hZgGyFJ@smile.fi.intel.com>
In-Reply-To: <ZuQUOw5Y2hZgGyFJ@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 Sep 2024 09:37:01 +0800
Message-ID: <CACD3sJb43CYb3m8H44EuiQH8yw8TsDZSnd=5wZ2rYaNbVKD_wQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] i2c: npcm: Bug fixes read/write operation, checkpatch
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:30=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Sep 13, 2024 at 06:14:40PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This patchset includes the following fixes:
> >
> > - Enable the target functionality in the interrupt handling routine
> >   when the i2c transfer is about to finish.
> > - Correct the read/write operation procedure.
> > - Introduce a software flag to handle the bus error (BER) condition
> >   which is not caused by the i2c transfer.
> > - Modify timeout calculation.
> > - Assign the client address earlier logically.
> > - Use an i2c frequency table for the frequency parameters assignment.
> > - Coding style fix.
> >
> > The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>
> Somehow your 6th patch becomes independent from the email thread.
> (Initially I thought it was a separate fix)
>
> Please, check what's going on with email settings on your side.
>
Understood. I'll check it.

> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
