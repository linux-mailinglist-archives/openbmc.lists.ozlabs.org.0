Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7543735740A
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 20:15:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFsyK2HSSz30Lc
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 04:15:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OtAOnC/h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OtAOnC/h; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFsy3339dz2yyv
 for <openbmc@lists.ozlabs.org>; Thu,  8 Apr 2021 04:15:20 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso18913014ott.13
 for <openbmc@lists.ozlabs.org>; Wed, 07 Apr 2021 11:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VnrnEQOLkoBtLE/FlYme0cSzSHIINfbRCNp79jG9lFg=;
 b=OtAOnC/h3kxNbhQzeZ7b5vrT3QR+lfCf51cu5XiwbsK53Jd6IPWNXxrgQ1XmzczlC8
 dI/iRQnKFcy//nIxbieBMQBZoVBANtyuc/G76XQKPk/gyYjE9o5/pO+Ies28l/eZRjCq
 LcUzGs0mP4gLdhw/3cCHaJFWLe5yYpJ1mqN7oJSb0gfzmM0ByPZekr4RRlLhw57uTaUX
 QanCIAUdCC3eVIvpuvxA35ATQS2QDif70Np0PFS46N7l5mPIxk8z4ZgStyXhaLxMn+tp
 NiZe+QGf20qfEz4NCbqLQfjMn+hvCU0wMNoBGNFFcKplrHn2kvaNqQtF9gd0qpOFiT/c
 mV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VnrnEQOLkoBtLE/FlYme0cSzSHIINfbRCNp79jG9lFg=;
 b=GbVEAy2zQYwDRR+5DEAd32vgifsivWc522kPI/SjPRSIYYYZwWZ6oFhNLwMFG4nUhA
 BMGjF28+OSm8d1x2gEQAxzxvAcrtPKaxHCfH1sR4UnCVKF0iMIdGDXBC3+mJ7Y9Wy0KV
 w13a3xq3gQXwzZW54fmiVMBFGBO8PXqz9RoBpFd+BEGDYAuZvriesjQEq9Qbr0SnCDe5
 gymyoJVutVyeZ6JIVey0kYMuhII4ZdxfhXQpAwvTIPPxAg7P6hJ2UIgbN3faz60rkclK
 srKSkQczl383mm2PvHbBVm05GIJkc5YYpCnayq2EXobVvlnl6jR9JMMUDkXfMHVG4Zg8
 n6MQ==
X-Gm-Message-State: AOAM530moQAW1G5xMD2hyFE6y/KkS6FDxl7lnrF61E4x0khMr/wO2F0g
 sOkuZz6MgUAZdFXoAeIsY84=
X-Google-Smtp-Source: ABdhPJyhWwLZLhxBzAop2rffnU0HtHUoPTL5KxuX5epwvEch8/V2S+ICOihPx4oZUisEVRy+jSUH3A==
X-Received: by 2002:a9d:7cd2:: with SMTP id r18mr4214192otn.240.1617819318959; 
 Wed, 07 Apr 2021 11:15:18 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:90e1:1ab9:a8db:f9d9])
 by smtp.gmail.com with ESMTPSA id r22sm5471366otg.4.2021.04.07.11.15.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Apr 2021 11:15:18 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Error in SDK Installation
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <001e01d72b61$482ab720$d8802560$@gapps.ntust.edu.tw>
Date: Wed, 7 Apr 2021 13:15:18 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <57350050-FEE2-4697-8956-389D46AEC2ED@gmail.com>
References: <001e01d72b61$482ab720$d8802560$@gapps.ntust.edu.tw>
To: m10902803@gapps.ntust.edu.tw
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Apr 6, 2021, at 10:51 PM, m10902803@gapps.ntust.edu.tw wrote:
>=20
> Hello,
> =20
> I followed the steps from =
https://github.com/openbmc/docs/blob/master/development/dev-environment.md=
 . And in SDK part, there is an error when I tried to wget the file =
andit said:
> get: write error: No space left on device
> wget: write error: Connection reset by peer
> =20
> I use VM to run the Ubuntu. My disk space still has a lot of empty =
space, but when I ran it in Romulus machine, it said that no space left.

This seems to be a common point of confustion. Thanks to AndrewJ for =
this gerrit update:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/42003=20

In summary, the SDK is installed on your development system, not the =
QEMU instance.

> =20
> Sincerely,
> Muhamad Luthfi Mufadel
> Master's Student of Department of Electronic and Computer Engineering=20=

> National Taiwan University of Science and Technology

