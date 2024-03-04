Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88707870560
	for <lists+openbmc@lfdr.de>; Mon,  4 Mar 2024 16:27:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=aQnS0v7f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpMxs5jzKz3d2Y
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 02:27:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=aQnS0v7f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=konsulko.com (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=trini@konsulko.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpMxG2qk2z3cGY
	for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2024 02:26:40 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-68f51c5f9baso27736216d6.3
        for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2024 07:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1709565995; x=1710170795; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ//rl1JZKbRJLcDttg7xhAxnXjRK/NF0grCK2xAXK4=;
        b=aQnS0v7fGQir/REWf5PrLgd4KF7Me2nqCvVv6i86eHQnD3wHmLh87bCX5oqhfli6tH
         lr/wdhI1+mzbHIIgttoo39R2WrPGYiD4d1QHb/N5/obLbkJ5rLIHjUCCNc6xdthYyhIo
         aZn47CJV2DsVo/I4gPLPaedNXO6FXJLubr87E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565995; x=1710170795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ//rl1JZKbRJLcDttg7xhAxnXjRK/NF0grCK2xAXK4=;
        b=XYM//97H9dKcaamDaNYltmtNdzVYF/9OKdMZwz6UhIjoAkVaWoqv8PBt4Ulzpmtrfp
         /tkOgmlHNiN6/SmXMEWLAM3Nn4Oa80lCWyC82BlOu+GUFIVMn9lq0f1RzoQxrEayp61M
         fO/TsPuSIwGYNbZOLuZPRgwFHkP29YKzE8GCz/3tFpPQ/tLgUukuVKB0RXEBpoh5m7GF
         BY6fwDGRFstPvOPW3AZt2Fi7TUMJsLewzyU7amFx2bLAmG0Gvfc/Ztj7dzcXXinOXcSu
         kgypqpBN7KHYIGyxs4dTeU0Jwf8Zs7jgOAhiyveHw4Xm6DOgD7cEl+WJQvOcOT76JMjm
         jP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmjIRT8e9WqoR2SqqHnRS1v6jD4eHGykmp6gZR33etWj4O9o33s7ddk7qpcIHXpqqEcIthXxn3w28ZH8K1FxGClf05B5gDdoY=
X-Gm-Message-State: AOJu0Yxc4mtG6MzrSpwH/5vEjhJG5dW3as7/4xG74tSrUNmdlQX3mlQa
	JlEKmcL6nQdaKNsK5lOtLE0nmYxkza9/L0H92OHF5GXUPRnGEsysVilLyYo9xe4=
X-Google-Smtp-Source: AGHT+IFcOBzf+i8V6Ahfuo2Tl13p3aUmjuD00T8ASmyx7NR3oClmYzELFL6APvM3zCWgF2XeKsjjtw==
X-Received: by 2002:a0c:f506:0:b0:690:7db7:77fb with SMTP id j6-20020a0cf506000000b006907db777fbmr1310335qvm.30.1709565995254;
        Mon, 04 Mar 2024 07:26:35 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-007f-0000-0000-0000-1002.res6.spectrum.com. [2603:6081:7b00:7f::1002])
        by smtp.gmail.com with ESMTPSA id a9-20020a0ce909000000b006907945e700sm911724qvo.12.2024.03.04.07.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:26:34 -0800 (PST)
Date: Mon, 4 Mar 2024 10:26:32 -0500
From: Tom Rini <trini@konsulko.com>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: add pass-through pins and siopbi/siopbo
Message-ID: <20240304152632.GH1523872@bill-the-cat>
References: <20240120232813.32474-1-fr0st61te@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zb5wIw7O+4YCHwhy"
Content-Disposition: inline
In-Reply-To: <20240120232813.32474-1-fr0st61te@gmail.com>
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
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org, u-boot@lists.denx.de, Joel Stanley <joel@jms.id.au>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Zb5wIw7O+4YCHwhy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 21, 2024 at 02:28:13AM +0300, Ivan Mikhaylov wrote:

> Add THRU0-3 and SIOPBI/SIOPBO pin groups/functions.
>=20
> Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>

Applied to u-boot/next, thanks!

--=20
Tom

--Zb5wIw7O+4YCHwhy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmXl6CUACgkQFHw5/5Y0
tyzfewv/fttPTR41KkM/dFzF/+oqUGmSIgLJrqkg9jbZuanoW94jZg51bSWpP7Er
+QGpl9vg79Ow+GbfdR36Hp2TensfQEbXckVuK5kVpEfcye1qyOSlTeBaDpO2rsdp
Nc6nqTSb/wqoCl1B2E/rs+atEpwPcIznfhThZ6uus8EP5ESfElPlpVaua32I4X5V
NwU4IXSfEZ8W2NkHlqTDAMqTe4HqoCxNO1dUlah9t5wLv+wZx5cAqR0x7jyxkdOT
jFUrqoRZMeffnZU9KsrIcLH9agvgofRAw5xUUo6n997nKWLjp2OIVPCNC51C1c5A
3G8NeedUKRwXYdsPBVDWY2EW9oeKTKbWO2kQeTJ2JEt5D1F0Ba9LE6Fh1QBgDZut
0pb/FqJDGeizHIwwVX7eMoNOuFDQyHRcen78xB6xZCiamKbstja7u+fsNHK/bJsW
rqW+5IPQaj8vQmBXiRNegeDgDCgiuOOflCa/x6x5SHrqkVV0mz00cOrUQkYUPGVv
FMqezCaL
=/at4
-----END PGP SIGNATURE-----

--Zb5wIw7O+4YCHwhy--
