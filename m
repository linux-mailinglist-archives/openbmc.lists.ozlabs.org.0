Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E7096773B
	for <lists+openbmc@lfdr.de>; Sun,  1 Sep 2024 17:54:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxbzL2WXKz3cJW
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 01:54:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725206039;
	cv=none; b=j7HZumwkp8Gjkhvh3U1zkKVFmeZrX8I6u8M2HJ3Ad04FswjtMtmyOZwMYKIpWvx2SxwiUwCcLKz66EqbT1uF6Pij0qPmQPAqBWnCILeZ9/4+ApAkCvufghLVXa+w1MA8FcArHyI/BZcViRPDpGKWGbIsl4+NXvZCrQTfE19EwrHtHeoBdUinmy3XHzOall78tldOgp880Jlpob/xt9H8cDIF6MsnSyqPK9biPsKMxygyZMT+8GGAZn9675pUPWn97lmT8GlrxuHtNRAqB2nAgo+uaCpDL6XmbpsBx0lV8O6KvMp4fkimy/iY1xX/RQp3HUyAPrkT9h5Lat549i8uFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725206039; c=relaxed/relaxed;
	bh=0EsLueHYpE05/k8DkjCbpekvEpEO3R1gaFSQ27++nEk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	b=f+i9JoyAXdjThym6bH9Pt2jMwBy/R9tBYYYJlqp03LZK3ffhvRIKtZZE7LwT0vhrEX+K6SraxMi8LcoYna/iYSXKEorDHGUdWuspigWgQJtEgu0puRiLyvPGlBUTIju080hVfBBsl9sMGbm8d2XdU1EFTCYUb6VjWp6Jr7/Kvuxb85Ed1g5ZfSaQ2j7B9/Dlg/MYfJj4Fkt7QGsIfiiHE/j4tJo6t3ulT1s1RJePqf1fGMYpxMHtIrZJMJ3JSvGaE9mpMTqHnk4br/UGcDepj0OiOzphnSptDcIY6+ZYr7YnTW55P2Uw5DgD6u/kT3MpkQ3GVAWohhkobfwZngY+Gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y3rVdU9C; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y3rVdU9C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WxbzB14zyz2xcq
	for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2024 01:53:56 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5c0a9f2b967so3244125a12.2
        for <openbmc@lists.ozlabs.org>; Sun, 01 Sep 2024 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725206030; x=1725810830; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EsLueHYpE05/k8DkjCbpekvEpEO3R1gaFSQ27++nEk=;
        b=Y3rVdU9CMhUU/z9ARBaEpCdWQ6YPJchuT0/yXsv/Fr4am1FjsjfAr5wFF7xeSw6WVU
         TtD2bAZhFAC00LHLjnytJDgvZXB0wbc6OFLiOylNwwA43WcIJsDko7ms9HeVgyK71pJS
         sR+i0zkyUaBMsxoMu+u8R9o+Grkkf/AomuZj1+pEka2W3f/8qJN0fuwV2KbiU9qTtiZq
         ATD4YdsyCKYRZtFGXHnFNfKn/sftl7GwObvifVIisfSueh81739HWtKhTlBg1XnLDTZH
         L7ONi1E6CaIoitYlJ4TMn4hJYoqxjmS1l3G0YvU7lxLdgVJjDTh1TZdmgndl7+6BFMho
         T9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725206030; x=1725810830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EsLueHYpE05/k8DkjCbpekvEpEO3R1gaFSQ27++nEk=;
        b=sRGJhzUPU9RbNjXNf25L1lhRYlYWqQCf19AyXOCurkKL17ZN6oECaIRpEYR2PTsl9D
         NZt+q4wDUqBvzAjy+surxxoq7qjkGZWNuyfUfj/q1Kd8xU0X5kgeYnrRtQ5E63g+yit5
         wsPqr5E81UBjOifNZdmGhmBV8fSSjbQnBv14TyVQ21towJGW6neYmaLV3LVm28dy5MoJ
         2Evqse0iRzziX5Mvy7g9NRPuBoDO2dmPzGCAZcJAHIU58iYkKafZkq7SnDT/bdC0YEGu
         rgN/4V52KkBQh1H5BZwlnCWGFZU6uuPzguWL3EyIGm7Vc72/9CZNx1ovKQGwN+pOQm8i
         pIbg==
X-Forwarded-Encrypted: i=1; AJvYcCVTrPp+t0KIxnRSLHSSYsqUUJbS+yOTY4Mwa42yhLf42kOE/y9Z4F6iEy1iJHLKmyqkOr0c2o/v@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy5vD2hC1SR3KLhecbRC+2CVuz2BdJOWV6wNOLFGJlff06yBPF8
	mWP5TmX3e1jt9z5FrwswWCFUAXiQBYXn42Y1ocjyvzMN0AkmgoLKGvYA4oImKXsFrXRf7zu/opd
	sy/19cyH0qF+ntnDbbt+pk+XfzmM=
X-Google-Smtp-Source: AGHT+IFxtrxJc3Nb0FnT4i6nTdzQ139VEu0nRk8jjN+wzgt++Y7CTCq/rWvxZ3JKTn6Ca8kjQDdxME9HlenXBNPz5Sc=
X-Received: by 2002:a05:6402:26d2:b0:5c2:1298:35ee with SMTP id
 4fb4d7f45d1cf-5c243724727mr3165583a12.2.1725206030066; Sun, 01 Sep 2024
 08:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-7-kfting@nuvoton.com>
 <ZtIbM4NTbldBIDXf@smile.fi.intel.com>
In-Reply-To: <ZtIbM4NTbldBIDXf@smile.fi.intel.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 1 Sep 2024 18:53:38 +0300
Message-ID: <CAHb3i=vWNmokQYyOZJOVeaJaT6XAroct2gZiJYPVQf6rHzR5LA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, linux-kernel@vger.kernel.org, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Tyrone Ting <warp5tw@gmail.com>, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 30, 2024 at 10:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Aug 30, 2024 at 11:46:39AM +0800, Tyrone Ting wrote:
> > Modify i2c frequency from table parameters
> > for NPCM i2c modules.
> >
> > Supported frequencies are:
> >
> > 1. 100KHz
> > 2. 400KHz
> > 3. 1MHz
>
> There is no explanations "why". What's wrong with the calculations done i=
n the
> current code?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Hi Andy,

The original equations were tested on a variety of chips and base clocks.
Since we added devices that use higher frequencies of the module we
saw that there is a mismatch between the equation and the actual
results on the bus itself, measured on scope.
So instead of using the equations we did an optimization per module
frequency, verified on a device.
Most of the work was focused on the rise time of the SCL and SDA,
which depends on external load of the bus and PU.
We needed to make sure that in all valid range of load the rise time
is compliant of the SMB spec timing requirements.

This patch include the final values after extensive testing both at
Nuvoton as well as at customer sites.

BR,
Tali Perry
Nuvoton.
