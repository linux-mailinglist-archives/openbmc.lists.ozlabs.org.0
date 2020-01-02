Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBADF12E738
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 15:25:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47pVgF62R5zDq9y
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2020 01:25:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BJC8Y2h4"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47pVfR1NpdzDqB0
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jan 2020 01:24:28 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id r27so57254351otc.8
 for <openbmc@lists.ozlabs.org>; Thu, 02 Jan 2020 06:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xLzUJ8D70Ac0BsMmF8aYB+l5sbKeCXXNNr2iWKtRSpw=;
 b=BJC8Y2h44ZmiWK0mpf74HYt27hgHF9iKWnig95R0tpg8DLVMHsAW9w1di/5IBiB924
 cZzQa7iyHe70DoLUgsc6JgRvcPyPbpDcxK68QHfhbJr3tIwTwetlhNTY//ErMqs8IA2Z
 DDM+7SI1lnPDiRf1+6mV0wAOhVila4PHzdkhx93IGPelt0Ha2deJKA243VK6D/P6lNaP
 gQXNSr2kQJB0sC4Hjz/OkoqeHb4aZnsEhkHPLkzux8RrUwH/QHlQJKgS1BYXsZsRwTxc
 c6r10kooECl5BOtD7T71rqPk1Z4OrPl8wrKyCw7Hv2KW7RoLqz+ghoZmglPeG/rwpeAv
 gjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xLzUJ8D70Ac0BsMmF8aYB+l5sbKeCXXNNr2iWKtRSpw=;
 b=U5SrLNRCJfPOHgOJ15NMZjoOcxbO7VCd9tDAZ01yq90QD6Oq+quJ7JQx0RSJlRmCHn
 lQTnR3G8KmYkKvz9xOEjFk2PKVqpFfxDUIfpzf3toKgtaZQ0yTYEKFgtLeot2+BOkcRE
 PVrpiYzFSgeP0ksc/POoNttqC82NFM9d8V2Q+jT0VHDPzDIL3BtqATFdS2rgyOeN3zKc
 YUBeqlATRBXzpU1npfGiJ3HvZHFavIyeVVh7ske9rjImonqj3DtXT/TjksFUEcU3DxQN
 PLioP1d6DGjqn4ZS0cit0Z2DeZrILSrYBwTHy7Hl0EQm3GoEoaIRl+wxl9sefGxTVZMc
 87wQ==
X-Gm-Message-State: APjAAAXLMPD5AuK7gom2tezjNHn8PCqHRGqoqEURMz48R1v+urv9g+/9
 fj+rtOd1CTzNSxyRMs9FsMY=
X-Google-Smtp-Source: APXvYqwWcZF4mFmzko3cm3NfiQwBKsPdsAzOeeyc5eVu8rfLYXgcpFzqT6BAnlnrc2EGKydCuDlOCA==
X-Received: by 2002:a9d:7593:: with SMTP id s19mr86990635otk.219.1577975065573; 
 Thu, 02 Jan 2020 06:24:25 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:a8ef:2ce5:9cf:3dec])
 by smtp.gmail.com with ESMTPSA id p21sm19760196otc.21.2020.01.02.06.24.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jan 2020 06:24:24 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: Chassis/Host power control and power state transition
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <LaJKNX5u1Gewmtk7WV2o3ufGh-xztXj98XR8rLkSa-CECssG7a680W12zKTVsYyD1HaarZqtEtXyQs6GCSyyvk4TJ1lqMYBcIzOT2CUCNnQ=@protonmail.com>
Date: Thu, 2 Jan 2020 08:24:23 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE230506-06E9-4A4F-BC58-69F96BB5B7A1@gmail.com>
References: <LaJKNX5u1Gewmtk7WV2o3ufGh-xztXj98XR8rLkSa-CECssG7a680W12zKTVsYyD1HaarZqtEtXyQs6GCSyyvk4TJ1lqMYBcIzOT2CUCNnQ=@protonmail.com>
To: rgrs <rgrs@protonmail.com>
X-Mailer: Apple Mail (2.3601.0.10)
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



> On Dec 20, 2019, at 3:03 AM, rgrs <rgrs@protonmail.com> wrote:
>=20
> Hi All,
>=20
> Sometimes when I do "ipmitool chassis power cycle",  system gets =
powered off but not powered on back again.
> Logs show some sd_bus_set_property returns errno 5 (Input/Output =
error).
>=20
> My guess is that CPLD that takes care of power distribution  in my =
server is causing the IO error, but i need enough data/logs to prove it.
>=20
> I'm not able to debug further without understanding the state machine, =
system targets, and their order of execution.
> Is there any docs to tools to help me understand or visualize the =
execution sequence (for power operations atleast)?

https://github.com/openbmc/phosphor-state-manager/blob/master/README.md =
and
=
https://github.com/openbmc/docs/blob/master/architecture/openbmc-systemd.m=
d are
good places to start.

Unfortunately we have not had a lot of luck with visualization. I have =
an issue,
https://github.com/ibm-openbmc/dev/issues/944, to look into doing =
something
with systemd-analyze but haven=E2=80=99t made much progress.

Usually when debugging failed systemd services, systemctl and journalctl
are going to be your debug tools.

Andrew

>=20
>=20
> Thanks,
> Raj
>=20

