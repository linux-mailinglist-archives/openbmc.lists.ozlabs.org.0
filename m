Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37B23E656
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 05:35:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BN9wd6GFbzDqlp
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 13:35:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29;
 helo=mail-oo1-xc29.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gYTt6e1N; dkim-atps=neutral
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BN9vs2RMPzDqtN
 for <openbmc@lists.ozlabs.org>; Fri,  7 Aug 2020 13:34:31 +1000 (AEST)
Received: by mail-oo1-xc29.google.com with SMTP id y30so158453ooj.3
 for <openbmc@lists.ozlabs.org>; Thu, 06 Aug 2020 20:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=YU1p1rWJKq9pkZpTpzYATnJU3qrisPydptXPM+H3pWQ=;
 b=gYTt6e1N4sdqZDf0XHESRqbv9GnvpHtmLHoo53DMuwvjh+jA3WcRt5+XQBKqgOvV1G
 knnlkMAfK1peEbloXXVnCRoR1c7N3REBfym6ydEeHafUj6ZDxK+T8bex1yPKXl0rp9gJ
 GTelqtCUVvGksAMqCOmwRwhTb662dCcwbOZ7e1kOdQCzt20dp0nHwiafMmNZ/YDMwNGc
 K96Rh5pItCpZ5lZPrhETMl9rW9lwBtGIbwXAc0ceXv0Hvyr09YilZD0jZFn3yz9FdwFG
 QjDCrnSX3pdWN71KZI6R2MZkffb+Pbr5PQ9ko4BkhfBHd/hf+H5BB2rZk5grW3lG3sb4
 qJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=YU1p1rWJKq9pkZpTpzYATnJU3qrisPydptXPM+H3pWQ=;
 b=qxJq7zM5yC0USR+U3yzKpQmt10itM7dmJ1p5AfuGVhv5s4oyJIko+z+qIvjd8GJByo
 4CAJU/d+gBR7t3q60Rmp/AEEcB0vzYt1FhnMdecmrDNWArVNvg/dGavu84O0fubCt7ei
 cnt4H5NZgdUEC943uWrvw+EJTFm9Y3UWJsGMrFYmKrSzqtlJkWK5CaI0e+x1w0YA3y+d
 nzYtgAvk5aYSbYCVcNejU/ykEA5uneaEeV/7Aat3a1QJraFi6a1TdLWmlxQ2E1QNXIv/
 N2C7Z+QdSYT6AQ5t4ZGmYfuPS5mczt2aNXS46Ov3iECOySghPA/NNhhLPbSKc74bBUAW
 cT8w==
X-Gm-Message-State: AOAM531VPpRIj+krZzphfh0pqp2MRA1UgyOZoQZv+gdUv0lAqmgdW/cT
 rTREDDqBlRrdHzSae/U6Pb031+y1Ouw=
X-Google-Smtp-Source: ABdhPJxz7y+9UliIIEu/4c40TtfCQVaYppeTEbNdSm//7PsFOCm9V95aRuEbjfuDDzmQuES9f0w0Wg==
X-Received: by 2002:a4a:6252:: with SMTP id y18mr10815793oog.45.1596771267325; 
 Thu, 06 Aug 2020 20:34:27 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:f9e3:9049:819b:5e0f?
 ([2601:281:c001:2359:f9e3:9049:819b:5e0f])
 by smtp.gmail.com with ESMTPSA id o22sm1412434ota.49.2020.08.06.20.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 20:34:26 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Power Supplies are Turned off after boot
Date: Thu, 6 Aug 2020 21:34:26 -0600
Message-Id: <1A9B17DD-50FD-4C7F-B2DB-41C1D55E1169@gmail.com>
References: <OF66E559B6.C704B66F-ON002585BD.000DF51B-002585BD.000DF524@notes.na.collabserv.com>
In-Reply-To: <OF66E559B6.C704B66F-ON002585BD.000DF51B-002585BD.000DF524@notes.na.collabserv.com>
To: Milton Miller II <miltonm@us.ibm.com>
X-Mailer: iPhone Mail (17F80)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Milton,

Ah, no host when using a rasp pi. I=E2=80=99ll try to prove this is the caus=
e and try to disable the watchdog.

Thanks=20

Mike=20

Sent from my iPhone

> On Aug 6, 2020, at 8:32 PM, Milton Miller II <miltonm@us.ibm.com> wrote:
>=20
> =EF=BB=BFOn August 5, 2020 Mike Jones wrote:
>=20
>> Now that I have webui displaying telemetry for multiple PMBus
>> devices, I want to solve a power supply problem.
>>=20
>> After boot, all PMBus devices have their power turned off via an
>> OPERATION command. This happens about 10-20 seconds after boot
>> completes. There is a message printed saying it is disabling them,
>> and one line per action. Like:
>>=20
>> VOUT 1: disabling
>>=20
>> Where VOUT 1 does not match the name of the rails in the config files
>> with the name and limits. It seems like a more generic term
>> indicating voltage.
>>=20
>> These devices are in the device tree and have hwmon running.
>>=20
>> What service would be capable of shutting off the supplies? It would
>> have to be able to discover them, perhaps by device tree, then issue
>> standard PMBus commands.
>=20
> I'm guessing the host watchdog was not shutdown when your HOST=20
> completed boot and the watchdog requesed the system power off.
> Normally an IPMI message from the host will disable the watchdog.
>=20
> You should be able to see the transition files run in the systemd=20
> journal if this is the case.
>=20
> if not try watching for activity by using journalctl to follow=20
> events live in a shell.
>=20
>>> Note: the Phosphor System Manager service fails at start up. I don=E2=80=
=99t
>> know if this matters, I was going to figure out what it does later.
>>=20
>> Mike
>>=20
>=20
