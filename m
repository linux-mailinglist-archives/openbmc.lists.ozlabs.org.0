Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EABA89706B5
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2024 12:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1msB4Q5Zz3cG8
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2024 20:48:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725792492;
	cv=none; b=J3f9EkULCVoxYEv80X99azZoRssf0oFRZ+rlahVqTaw1C29fMwBFPewWo0D5oJxpKVMXR+a+EAqAINpNKECNkXLB7m8Yfnd5sXm/jndfecgw11i07TyYyIWWZCV8HpPFELNqzTw3kWQBjdZP+OjESvpLVLFXsvOoyA/qQVBRhjtD83ymAgCf5Uy4PwiKp4ZWC1pE0XseivxByzU+5uJsqe7mbM0+nhrqb2djJ948LBsX7BOYtbgQR1p0/NuhjQ7XR/jYZ87Wcw4bQZWWXorxMxg6WC3sF0nHRDjSs+wUVP4gqXEE7QKGfG1uPWBOJvILATqNMr1oTumjsVZVVkrxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725792492; c=relaxed/relaxed;
	bh=NMML0K5lNKFbCf6flKYuyjLpkFnoliipCnmTYS8DTaY=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=P7a2JcEyqFcJcjp+sAzOx7NEfftFiPavLNQoVV7Z7Iy6Bnynk0WzjDjsReo4i0TQPSNpJJQd/1vMa5ArwiM1JItRI8PPgyxjliPDdBW+K5krB9eUXv7pE/5U7YxRNNt4BWptZUfsd6Vw/BJR9JA1xkHPi26q/eC1JJb93s80hOv4BXnQ/PE+ZDl1t+pw9ycuXmdIcnaSOxcr3g8NNsP2CrUicFtUB7oss/Fj1ONzUMHSgW4vZqVRPdlWaNtgcroScNe2fOmIuMAxdWiLai2VaaiN8UVQOZJFtjU4Uty08iLCWCX/ncsU2358GMrb3tZsFsOfq/bJbU4pZ4R2HdJllg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U740x9Ko; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U740x9Ko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1ms75hkkz2xcs
	for <openbmc@lists.ozlabs.org>; Sun,  8 Sep 2024 20:48:10 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5c255e3c327so3621759a12.1
        for <openbmc@lists.ozlabs.org>; Sun, 08 Sep 2024 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725792486; x=1726397286; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMML0K5lNKFbCf6flKYuyjLpkFnoliipCnmTYS8DTaY=;
        b=U740x9Ko+v6lK8d/ccSu7FG6+J7jHoISrI4hipeD5GVgTDc+c3N17cJsZP2SdDucpy
         5/Yn/NJXHsIknEMWGo2oh8g/uNZXrHf2xtk5ZwnhWTXm9BPwyyJGHydGmvQb6ocRJRWk
         B7Vo7ohJH1L8oDBoKICfmTegzTB4JspMGzlrRPp7MxvHdMMLmuy40s0S0XtqEilpI5WQ
         6kw06opNdjRdLkDXfwvJSO5F6UIYcd/4KNNIkB4gRYxi5WYQ8F6PuE1c+YqortJ2tEBR
         GJ0WMq8QhldTBfKmzPYjN3DdkapIMKcEeij1VobCLoyeRvtOUZa+nIRkN0+lkH8E7Jpr
         EpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725792486; x=1726397286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMML0K5lNKFbCf6flKYuyjLpkFnoliipCnmTYS8DTaY=;
        b=d13MVwKS3DltI8RNwDJjI7jpIwAVilQwWGxJae1hOlG/W5Oy5B5VYmh1p2+pGNvoIf
         8xOCsn4DnGWX9turDxaswGW5P638Eu9yy3dZ7KsZcod7X6yd/n08PTnRJluwN2YJp9EF
         OWG3O7mbMQURSvn9DAtRqGseXfDt7/j21FtBxwmvRK97oU1QvQoVrEGm8HwhJuyz+ui9
         X73PUVn8EeGMeUE3Dwg8hX1hNA3bgjgVCk5SVkOfefDFQPpIW2DrekcGc0Y3KyV4xPkd
         YVc+GbIB1zVggTsCCF00pmUUDLXVtLliow9LFx1keANsFBoLD0a/r/URXsMZF3Fbszls
         2bSA==
X-Forwarded-Encrypted: i=1; AJvYcCXA5Yp7gUYpGASv+FJAGJYQTBIuDz6twW1E61qrYhQiOdXqyJNj4ypjyfLqqWm/SWyKm1O3OkHU@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBjUSGCSW/yhzkoKwAtzdM8Ai08dvHkaGMZO/JgcIHirQs5tuT
	R5dKtIvpBKbN8vl2VAoLCZKTQUtrh2E1h10PnyrWKQtB4FtzU9ccu4cGcKUvuBqTH2v2umVe8ZL
	Vr2yDLD5KPYm57dmCuLWga9thiLA=
X-Google-Smtp-Source: AGHT+IHvdt35a1Sb9j5VA1uW+AQ9HLQkn8DAn8JPS0ljn6ntkvFJmzdlfn2w4O5PEkP/4iO5AeZfM68ifOlGVGZioOw=
X-Received: by 2002:a05:6402:2110:b0:5c2:2b1d:31e6 with SMTP id
 4fb4d7f45d1cf-5c3dc7c3e8emr4894088a12.29.1725792485533; Sun, 08 Sep 2024
 03:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-5-kfting@nuvoton.com>
 <stnyjmnqdobzq2f2ntq32tu4kq6ohsxyevjn5rgz3uu2qncuzl@nt4ifscgokgj>
In-Reply-To: <stnyjmnqdobzq2f2ntq32tu4kq6ohsxyevjn5rgz3uu2qncuzl@nt4ifscgokgj>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 8 Sep 2024 13:47:54 +0300
Message-ID: <CAHb3i=vSUqbsoRhnnyMOoteKP3GCoXmCd+UKQSN_QWqkRweuiA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] i2c: npcm: Modify timeout evaluation mechanism
To: Andi Shyti <andi.shyti@kernel.org>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Tyrone Ting <warp5tw@gmail.com>, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi,

On Fri, Sep 6, 2024 at 12:39=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Tyrone,
>
> On Fri, Aug 30, 2024 at 11:46:37AM GMT, Tyrone Ting wrote:
> > Increase the timeout and treat it as the total timeout, including retri=
es.
> > The total timeout is 2 seconds now.
>
> Why?

The users want to connect a lot of masters on the same bus.
This timeout is used to determine the time it takes to take bus ownership.
The transactions are very long, so waiting 35ms is not enough.

>
> > The i2c core layer will have chances to retry to call the i2c driver
> > transfer function if the i2c driver reports that the bus is busy and
> > returns EAGAIN.
> >
> > Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_=
slave")
>
> What is the bug you are fixing?
>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Still... can someone from the nuvoton supporters/reviewers check
> this patch?
>
> Thanks,
> Andi

Thanks,
Tali Perry,
Nuvoton Technologies.
