Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF548578D
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 18:44:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTcL14rKBz30Bc
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 04:44:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=UY0QqTzK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=konsulko.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=trini@konsulko.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256
 header.s=google header.b=UY0QqTzK; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTcKf6Twfz2yPd
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 04:43:50 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id f9so38313698qtk.4
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jan 2022 09:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rIXb+jPonro+HVpbvSesH8vZ5Jjf2pRgPCeOH55CBhg=;
 b=UY0QqTzKJvO4qwEjmOZDqiroD34sJXJgz5bSXuiFdXk43DpJbPqtRDDuV6WS2J2TcA
 C82JZP24W+w1DqranV8WgSls3z5mOzX3tvnnP5gxyC/4Jg6BwPb7DbHwMcpNWs61v8bA
 BYnBotJMMzCbvJ41YjkloOt2T2i9VS9Ene45k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rIXb+jPonro+HVpbvSesH8vZ5Jjf2pRgPCeOH55CBhg=;
 b=YCbpP2iv8aF/tXhxRLNGOdNgmsekgXzXs3UnRbT3jbS6ifnG1gLAGOU69+zYgUwCVE
 m9tz/J25j4wj8J+iud0Rp1bneiPgHFvotMHBLO6Msc/KbpGfAztnZiD6tdFZ96dugTOj
 ItyzkjV0o9k8LsVPwZKAHh41Cu5qlbr9fzWM4ECPNzOsu30jkKeGsZXGOtJmqXsh0EZh
 Cq07AxXAo31PQIYqHGBmV2d4f5boSbDuhx4q1QgrwyG3nzj40Xl9hoJz/QtLO6KIaReZ
 ZWr38K7AeioKUJcIhgL0qzNmoJZRt8gvjRYq+s8CEOa4hMw4/BbKyAIxpJOqI9kXQACO
 iLzg==
X-Gm-Message-State: AOAM533mHVBT9u6HslvJlTuVXoWcVV++GbiEDKtunNENhY/W0MajfGq6
 VtqGB8KfJfKr3hL2HtJm2XCRkA==
X-Google-Smtp-Source: ABdhPJyolIm7IWsCpZaNsaHHLGhr5R/dUKo5g5V8YDepGLBHqO7Il1+yxiOWq9li9t/HnKzJyuC+jQ==
X-Received: by 2002:a05:622a:40d:: with SMTP id
 n13mr49548112qtx.511.1641404626687; 
 Wed, 05 Jan 2022 09:43:46 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-8841-a9f4-ab99-2748.res6.spectrum.com.
 [2603:6081:7b01:cbda:8841:a9f4:ab99:2748])
 by smtp.gmail.com with ESMTPSA id ay42sm32854557qkb.40.2022.01.05.09.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 09:43:46 -0800 (PST)
Date: Wed, 5 Jan 2022 12:43:44 -0500
From: Tom Rini <trini@konsulko.com>
To: Andrei Kartashev <a.kartashev@yadro.com>
Subject: Re: [PATCH] board: ast2500/ast2600: initialize LEDs
Message-ID: <20220105174344.GA2773246@bill-the-cat>
References: <20211123190847.14943-1-a.kartashev@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UWWZ58LfvZf2M5yT"
Content-Disposition: inline
In-Reply-To: <20211123190847.14943-1-a.kartashev@yadro.com>
X-Clacks-Overhead: GNU Terry Pratchett
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
Cc: u-boot@lists.denx.de, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--UWWZ58LfvZf2M5yT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2021 at 10:08:47PM +0300, Andrei Kartashev wrote:

> Add option to initialize LEDs in board_init stage for aspeed-based
> boards.
>=20
> Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
> ---
>  board/aspeed/evb_ast2500/evb_ast2500.c | 8 ++++++++
>  board/aspeed/evb_ast2600/evb_ast2600.c | 8 ++++++++
>  2 files changed, 16 insertions(+)

This does not currently build on current next, please rebase, thanks.

--=20
Tom

--UWWZ58LfvZf2M5yT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHV2NAACgkQFHw5/5Y0
tyy9CgwAq86eRacVYYCGdpw7tL5iqvJ67EqBOdwU1qa56u5490fDVTVHe+CrClDq
ER+fx5iwrPByD1UqHHjvPna5AYt/dDyVHWkZRFd7f3B1sU/+JP+9lIICRtzVWNzt
ZcCwyAysYryswSgUzgCokskkwsVBx0aaaFDYeJHkEpNqup/xUcY366Bw2SGMqgxm
DVrTVooe1v3RD9BIPpPYpDQMDDRtIsvjOYtZJphPIg0YW2DH8ojRRYyZzuh2rc//
60+6UB6/aDw5q2kElFcRJtB2lG9/BhHP6hMYKGOYCQagEeeNgPBrRUlfydTtxXsT
YC9PI75V5ZqCnZ+bzm7cdgxbOFj+5m668kCcViAJTqBObvbE1FK/VMbFrbEpmxB1
xWtWsn3tvHVNhT+chfgfAhb13hDxionsWI/2NAbM9ajIhctRladAcBicBBsTiogT
yRrP1829FPykgQY+XdjR9X/vfil970MHrfzm3UnN1DUwhbKJxsc6PJR006rTO+Zu
zjqQFFgB
=PIJQ
-----END PGP SIGNATURE-----

--UWWZ58LfvZf2M5yT--
