Return-Path: <openbmc+bounces-570-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E51DCB4124C
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 04:26:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGmgb3t5Lz2xlM;
	Wed,  3 Sep 2025 12:26:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756866363;
	cv=none; b=TuJTorSph/LmXhaJvzXnWlbf6igg6xtxUQoISEjkzOpOUEsCr4gcQ/3CyzNdMQiUNqoOL4c1ygQCfxEOKtKgMMKee9MxXUobhDkMVYbj374QiM1kawrdZZQfsaR6pwdFjuNmFNk/5FRk68I6fE3KLYUomyRJ8DdAzE6sXikEjaUPG4FNrj3+7JZAn2htKUUZJim4cYO6dgftHaouFuH+Xs3GnCC+j848iwIRrCvxl+VlUuWXnM+OjdK0xc9K+7YHReY7cQyyScqbjqlNlpVXoVu8ynC6xWc02WNIGzhta0JZR7tiJh3U6qwXnJI5yDshmwhiaxQIpxnkF7YyoxzmDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756866363; c=relaxed/relaxed;
	bh=tswzXKLn+W1Ef7yWI4X8WrHyGACKia3F+fwyROauFL4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LyHwc1Oe5q2jZPAyGe9SfCsCcxS1TewTQ4vVaXFsx6vlaJsr+/thqzC/Z6WyZnRUcGa46MGNWk2NKjQUSH2fCDXEYEV0O2tWySfE10QLWjXw4lKt4VzLUIBck6t0tN7s5ILA6nw/8IPLGPdI+aYFG1X3EPdVdGsD7myNO0rSO+GaJ8BmGbwRjZxpWHPF90E/PG3X5afSEIFkArSrK627vlFh5Q5K0rRvUCSFYXU2u86oIw6KqUBZZ1whCEdmjEjHPsMTbr+5Bc3d3UgcEBqLhXkd1Gp/Evg5xk2AVOuxjAiCrXvMLkG/+zmCD0v6tT1YmIa8QgZR/NhIyaSbe5jS3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cQhDtfbR; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cQhDtfbR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGmgb0XX2z2xgX
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 12:26:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756866362;
	bh=tswzXKLn+W1Ef7yWI4X8WrHyGACKia3F+fwyROauFL4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=cQhDtfbRt11BeDspdKC+D8xE2k+3hSg4eCrepHH8/4kbKnM9Etwy5HPSm1vmaeEac
	 09XEMc9fn3ftQEQe2SsTRZEpzM1mLeP1Dz0Puzl3Y9vM7Cupd/yEM07Tb7j/7eAGmg
	 KaqvUEz2/Fk7AwbrexJK7NB1id2v33EJFdQTCU1PXCGcwhbOuIWIwdmHswakvPcN19
	 eUq9Yypr9WtcfhgDvyITfTdVIrJdLK95LDnywOosgXLWnmAybfmLZtawN9GuObVUqd
	 T4P9MbL78x8fVFhlSSvoLBTy53fyGnwqwA5oeoJx4YVW6QyMtQdpX9miAF0ZJ/c+Z/
	 Qduh6ev/bw6mw==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 38D0D69374;
	Wed,  3 Sep 2025 10:26:02 +0800 (AWST)
Message-ID: <8af1518628560413d051473410b4b7aedbcf5640.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] Backport MCTP over USB commits to 6.12
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, joel@jms.id.au, 
	openbmc@lists.ozlabs.org
Date: Wed, 03 Sep 2025 11:56:01 +0930
In-Reply-To: <20250819-mctp_over_usb_backport-v1-0-c655eb2a32ce@nvidia.com>
References: <20250819-mctp_over_usb_backport-v1-0-c655eb2a32ce@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Marc,

On Tue, 2025-08-19 at 16:36 -0700, Marc Olberding wrote:
> This patch series backports MCTP over USB to the open-bmc 6.12 branch.
> The commit series is mostly the base support, with the addition of bindin=
gs
> via IFLA attributes. No out of tree fixes were added in this patch series=
.
> The base for base support of the MCTP USB transport device were taken
> with the fixes from 6.6
>=20
> Signed-off-by: Marc Olberding <molberding@nvidia.com>
> ---
> Jeremy Kerr (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: Add base USB MCTP definitions
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net: mctp: Add MCTP USB transport driver
>=20
> Khang Nguyen (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net: mctp: Expose transport binding identi=
fier via IFLA attribute
>=20
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
1 +
> =C2=A0drivers/net/mctp/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 10 ++
> =C2=A0drivers/net/mctp/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0drivers/net/mctp/mctp-i2c.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/net/mctp/mctp-i3c.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/net/mctp/mctp-serial.c |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/net/mctp/mctp-usb.c=C2=A0=C2=A0=C2=A0 | 386 +++++++++++++++=
++++++++++++++++++++++++++
> =C2=A0include/linux/usb/mctp-usb.h=C2=A0=C2=A0 |=C2=A0 30 ++++
> =C2=A0include/net/mctp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 ++
> =C2=A0include/net/mctpdevice.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 4 +-
> =C2=A0include/uapi/linux/if_link.h=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0include/uapi/linux/usb/ch9.h=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0net/mctp/device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +-
> =C2=A013 files changed, 466 insertions(+), 8 deletions(-)
> ---
> base-commit: 03ff31ad54522521755b55609eaad19db05ddf46
> change-id: 20250819-mctp_over_usb_backport-d752f11f7f7a
>=20

Sorry for the delay. In the interim I've redone the dev-6.12 branch in
openbmc/linux and your series no-longer applies cleanly.

Can you please rebase it, fix the conflicts, and re-send?

Cheers,

Andrew

