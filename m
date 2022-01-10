Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 512EE489BBC
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 16:02:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXcVf20qbz2yph
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 02:02:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bXZtGQaZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bXZtGQaZ; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXcVC55m5z2xtF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 02:01:37 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id y18so17925548iob.8
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 07:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WggBkxCVm/M7cI3bYJYg0HchgYrB7JRK/QjoRb4oyYw=;
 b=bXZtGQaZp4QX/ACSRSZrfvC6m8Qqg5JIub+qQAvpEqwCdWjLLoFYjXyBvKtqUyqB2S
 LO3U558/AbQYBtWmPHmcXZQ+GYUx+M1rsgMy4UIqwTY3Kj1ZTTt9z3B3gBLtHZJBPqSq
 d7m9fNmxA6bA2spHYe2sEXRvIFfHNBYTwI0SAjXdWxKpjy+KMgjZZUt3EItFd3Qf1bVk
 xDtLqtMsPRJ6gs8uRShLYWr8D0JcfANsjFRpNOIs5/vy/tdRfOtHmw/jEz2psSS1AIPa
 d9KtjBwGiikiq1/77Q+GBK22fDa+NNM+H8z02CVCVESu1OGCLhXWxUIJ/jY1O/pHhmzY
 kNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WggBkxCVm/M7cI3bYJYg0HchgYrB7JRK/QjoRb4oyYw=;
 b=qb7qg7LK1sRIPBdnSTiZj3Z2Ao/r4yKSgOketqJKRBplBhJPkE1BmrxOVwgrwCPp8H
 K6x3to+yUTF2XM5v7sj/rPluGpFbdRIysfd3VvIwH0n7xFdbNQ8OfQil1ljBYYR+39HC
 4k2dIsaGfVcZXwJy2907IUA5HRr5vDb9s26imZ1Z/qwWZhJ7sqEGi0KmJKeUScifuU1A
 hK/dxwWGGegyqkbsCduYAUUbxi1iqay0UdwIVJuBZvl1VSdCDsMG9MiV57K2JY2Dt0uG
 oeaLd/Of/0HBEABfdIxG0Sef9P7WbjLZ5HaqS497jyMUw75uCLRkDCxV8uGoN1H9CuYE
 JWcQ==
X-Gm-Message-State: AOAM532NKAx/ZemEiSMEP65W8QHvzVWoeG9f/L5QerRx+8m6SVWXQZXO
 pRPEyqSVpOD3bz2UHyXXevn7zsaFb58=
X-Google-Smtp-Source: ABdhPJwzlkU7v+/ux9USkI4cBagOYjHLUYxcPLrheDP3BhJhUl6150pwHB85Z6dIYEGEsXxdoiuuLg==
X-Received: by 2002:a05:6602:2c47:: with SMTP id
 x7mr9465979iov.94.1641826894495; 
 Mon, 10 Jan 2022 07:01:34 -0800 (PST)
Received: from smtpclient.apple (c-73-181-116-169.hsd1.co.comcast.net.
 [73.181.116.169])
 by smtp.gmail.com with ESMTPSA id a8sm4130999ila.87.2022.01.10.07.01.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jan 2022 07:01:33 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: Sensor Whitelist
From: Mike Jones <proclivis@gmail.com>
In-Reply-To: <YdxDuatxZZiAP1yP@heinlein>
Date: Mon, 10 Jan 2022 08:01:33 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <EE5CE97F-DD57-4930-B279-A9E77A1102C1@gmail.com>
References: <9F164585-0D50-47A9-AE4C-54695769F02B@gmail.com>
 <YdxDuatxZZiAP1yP@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
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

Patrick,

Ah ha. Thanks.

Do you know how this works from a policy point of view? Like is there =
some conventions about how devices are added and merged?

Is it just anyone can send a patch, or are there any gates to get by?

Mike

> On Jan 10, 2022, at 7:33 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Wed, Jan 05, 2022 at 10:09:29AM -0700, Mike Jones wrote:
>> Hi,
>>=20
>> I=E2=80=99m getting an error from psusensor saying my driver is not =
found in sensor whitelist.
>>=20
>> What defines this whitelist?
>=20
> Probably this?
>=20
> =
https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#=
L74
>=20
>>=20
>> Note that the driver name is ltc3888, which is part of hwmon module =
ltc2978. In case the white listed name must refer to the module name =
instead of the driver name the module supports.
>=20
> --=20
> Patrick Williams

