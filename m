Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD3F70513D
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 16:51:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLK1q2WN6z3f6h
	for <lists+openbmc@lfdr.de>; Wed, 17 May 2023 00:51:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Rrm7ARF+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Rrm7ARF+;
	dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLK1D2YNFz3f5V
	for <openbmc@lists.ozlabs.org>; Wed, 17 May 2023 00:50:53 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f4449fa085so51228535e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 07:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684248649; x=1686840649;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vi+6HiC1ygZzbI9/qGin5aPnGvztVjO2vZKJU6r6EP8=;
        b=Rrm7ARF+RT3IuTDFeOQsnLh0f7MLsdVD7GLdgrZ8FT9d22wzmgPBe2TNKYYbZCKB1O
         UVIkiijcIXG+WqHmrHfo8FG60jsii27rwQh/wNJjgNe9Pv7VcCaLyhh2P3ZpO/ePbDoB
         lPdIIw4Vh9XG/xq4V0veMOdiR/O8RYC4eT4GAmOGckjD1dnLVA11WQfWknM6UZoUQGtJ
         drfnNmhdQ8vHfGoEMsI6zdQ14YC9LT+N+3Eo9zzGT2n9RTD6mx9z0y+dOtYe8YIvR/kB
         zUUcfn5yKY9b3e7HQdvfik1gkCix0Efy2fdoOdXv03DVAsKfCKqQaw09dZEzN1pRNOAl
         IrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684248649; x=1686840649;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vi+6HiC1ygZzbI9/qGin5aPnGvztVjO2vZKJU6r6EP8=;
        b=HusMFtIlQVf+GtNKZdGjDJl2ecz5T15RasMnnP35Rtdcldj8/fH76seQ4+iYykIYya
         f9S4rIAt5H9J817BWWAnqTw+wMhJBIJCk/a0AGboxWALO0PlEow7YgFWOZHWx2d/OfkL
         1FosViX4lFjTl9sRasR71GkqRyVne5dhp6HtS40odpJeXYNchnc5Mo1jLEO4KczCgoiH
         MWeWgIYB0GZHDos3aAS0p7Nl++3ztdd2UsdrPwaf7IJkhSP7WSYVVR9Lx5K8gonm+bo5
         hXQg3kUxmLZ9/Om4Ntux1UqdVKQNWlxjYehxFdVdVPI4PvHqkOHT4uheURsQzf7xVRJs
         Z6Dw==
X-Gm-Message-State: AC+VfDwijpoejeud1vIVPI1jO+a2jd89j0GeCbWPytpp8tDyxz9HmliM
	UWyJlwGCYzVy29ZuCYnvPEGbBw==
X-Google-Smtp-Source: ACHHUZ6qIN0OVr0p3Gyg3912zoku2cuoSyrnqkgmrEKSxEFznR6m24ueuJOWuM0xSOeyzY5y9yfrBw==
X-Received: by 2002:adf:de8d:0:b0:2f5:3fa1:6226 with SMTP id w13-20020adfde8d000000b002f53fa16226mr28327033wrl.14.1684248649646;
        Tue, 16 May 2023 07:50:49 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l13-20020adfe58d000000b0030903d44dbcsm2870346wrm.33.2023.05.16.07.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 07:50:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7BD471FFBB;
	Tue, 16 May 2023 15:50:48 +0100 (BST)
References: <CADfM=uvE+DdOAVU-WZmNgiAPom0isN9OFUeky0pPqPbtFmvyRw@mail.gmail.com>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sidhartha Reddy Kaliki <sidhartha@drut.io>
Subject: Re: How to communicate 2 guest machines over serial in qemu?
Date: Tue, 16 May 2023 15:48:10 +0100
In-reply-to: <CADfM=uvE+DdOAVU-WZmNgiAPom0isN9OFUeky0pPqPbtFmvyRw@mail.gmail.com>
Message-ID: <87y1lonxdj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: openbmc@lists.ozlabs.org, qemu-devel@nongnu.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Sidhartha Reddy Kaliki <sidhartha@drut.io> writes:

> Hi,
>
> We have 2 independent devices running openbmc software on each of
> them. These devices can communicate with each other over a serial line
> using SLIP protocol. Now we would like to emulate the same using qemu.
>
> Do we have any provision to communicate 2 guest machines over a serial
> interface using SLIP protocol?

You can connect the two chardev backends to each other. One will want to
be a server, the other a client. You can use pipe, socket or network
backends to do this.

> We have tried a few options which are not helpful to solve our purpose.
> It will be really helpful if you can provide us some guidance on this.

What have you tried so far?

>
> Thanks


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
