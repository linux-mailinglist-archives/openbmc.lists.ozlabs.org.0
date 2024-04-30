Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD22A8B824F
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2024 00:01:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qiCVN8k7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTZ032Ft7z3cZs
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2024 08:01:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qiCVN8k7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTYzT4L0Gz2xck
	for <openbmc@lists.ozlabs.org>; Wed,  1 May 2024 08:00:36 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-34c8f392172so2845615f8f.3
        for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2024 15:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1714514431; x=1715119231; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoRXcNDtX7Ss/Tqr5MElh3C8iF6FbUMyu/ILejIwtzw=;
        b=qiCVN8k7RxR7e350YIyhi2KprXapodWznhc7UzkIJG3q+5ElqlR6gKmTNawYoaF3JH
         xSqVgoFgUl6W6T773cp0lDV80Z+PR/reE+PuAb8VikqSk/UiQAvtgTzTx3rH1QPk0lkr
         KhD6YEMp3VeeH0uyhfaK0pi2kJw4/YifU6Ik3QcfY9NSZllyVHDL8wiSMSMALXcDQlZN
         K6PflDop1oDEEG7r1V4x9SMRMbIW5afzn5cu5FKKctD3WRDT6AMb5TOpP7lkM8HVzCwn
         qU5hG6VLJDmLqUplnnrACh8nbae0gGqQODoe+UuSQBa6c3Wk5j9jCidKCKj/ElftMyb8
         D/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714514431; x=1715119231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoRXcNDtX7Ss/Tqr5MElh3C8iF6FbUMyu/ILejIwtzw=;
        b=BBVTVtfGrgO3v8HxDqo8diIBOMAbxI+ByaY2kc+6CbLBJKZTxl+RKvDcIKxWaaALz5
         1JtZhNxESbWLfMu6zf+OlaatxQoKzbxdavYj2xpPXjPYqlJ09xuM/sGf0AamK8KQ6htx
         nghdPnn1SxC5MubTQ8gmE91y3VyJvnUNy2aCAnNaCy6WTQks9T3C2q1R+EpOohX9RDsU
         Awoe3Qx5pRH2DED1GAWZ/MlAZOtd1z2aPuVHgKnlIWCk16a2aP7nghK3i7Pe+6FH9u2B
         GUST29Cbr6944IBLKutq1S/3nY1nyWhokyjZmAeHLFj0KEJkv9U2N2ELl7HvJ7+wnen3
         840Q==
X-Gm-Message-State: AOJu0YwPeOpcxBEA9dOa/s12TK080cr3D2zOr0AHOkZraEQWpLPa0bks
	tuN/BQqnIdxo1ndrudJt59/j96g3duZS1tq4HekqmMOSROd1KaWgNgV0WAj2SOC3gNSzOTrPuG/
	MBTkQfUm03/MiVUSnyCBCToILJdWEvnq1UM2PqQ==
X-Google-Smtp-Source: AGHT+IEbQxpXXlNWx5zyNngejlG2PL2ZUN6EDxgQlBz7slDN413ZG/ReIEnWL6sA+m9y/mNdu+vFvHQRrGAULAIf+ds=
X-Received: by 2002:a5d:560d:0:b0:34a:9afe:762 with SMTP id
 l13-20020a5d560d000000b0034a9afe0762mr738658wrv.43.1714514431263; Tue, 30 Apr
 2024 15:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <AS8P192MB12875E88258C43FAD20D7FEDC8092@AS8P192MB1287.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <AS8P192MB12875E88258C43FAD20D7FEDC8092@AS8P192MB1287.EURP192.PROD.OUTLOOK.COM>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 30 Apr 2024 15:00:19 -0700
Message-ID: <CACWQX80BSo=Cre3fLux=EXPZCXm2JM9s1eD4xZ7+1nWS4VKrLg@mail.gmail.com>
Subject: Re: Virtual media image URL with parameters
To: Paul Smith <paul_d_smith@hotmail.com>
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

On Mon, Apr 15, 2024 at 2:40=E2=80=AFAM Paul Smith <paul_d_smith@hotmail.co=
m> wrote:
>
> Does OpenBMC/Redfish support this form of authentication and if so, any i=
dea as to why it is not working for me?
>

I would expect this to work, but it's quite possible we're not passing
through the query parameter portion of the URI into the right portion.
You didn't list what system you're on, or which virtual media you're
using, so it's hard to give concrete advice aside from telling you to
trace the URL through and see where the error is coming from.  If you
find a fix, please submit it to gerrit so others can make use of it as
well.
