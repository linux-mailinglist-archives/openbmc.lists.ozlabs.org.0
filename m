Return-Path: <openbmc+bounces-973-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3ECCAA260
	for <lists+openbmc@lfdr.de>; Sat, 06 Dec 2025 08:21:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNfmj45xBz2xQr;
	Sat, 06 Dec 2025 18:21:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764847109;
	cv=none; b=hESSCeEZK5xHmhD5od8dhqs/f0/u2CGxJJQ34OR2QlmjjQ1rAkhzz4DDDkZKKNgTVGiGpETyCGGNNKnqOWHKU3RdaePvgC9q5YkUKL4WzPy/HrnYU/LWsuLwU57WEDvUDH7Q3guv1iGbOmoz/oFQ5prWJisJMh0ev3gtrg48kfTQjKJLbjkbQNyPVWQ1YmBY1nOWY8zUSKwrw7CAzfmIWQyqUOC/e8iKxQl9+aLeyM5CvEAt8Y1C93DXAFylSPaPDR82tAuqSphNbzNhLeLqddZIUjgK/NgOKykLBpSZ/PG6wf9wS6f+S3QJOC2PaYnjaqQMTkMN5rwPqqn4dLH3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764847109; c=relaxed/relaxed;
	bh=+LOeBEfr8ZEdGvSNvofGiFrT7OpuozP6mpPTcUt6zJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbYgwC2DjTFY0fIcZ9R4SABcSHBE/3zRvpcnuu243M9dwToi+7WlyF6svkMVqtsyz6D+gcruhZj9bMHIYUAZRk7G8uGjX+3vdZgex/pAV2myPpSvdAkbxknkPvtfznbH6PcN639bkmy/aBi2J1W4tHpcW95KSQOCXeNH28/Kbzb/oIzTGsSBiv6oD0UaY4EkPGOnoizB5O7Ixsw8G/AgSB6vZcnhLEsDZKs46cYBx8AmXj07t8U2jrsxf6dMAWnPOG0oxjJL7QGTM2PqLxFDRCPXSgol4WpB8wuh5PUSW1/YObjTJ9ZDlc1ogXtoz7vvQ77Hw+sk/gEaFeBjIH/kEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=hReoddyI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=hReoddyI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMX7R1K3Lz2xC3
	for <openbmc@lists.ozlabs.org>; Thu, 04 Dec 2025 22:18:24 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso10709715e9.3
        for <openbmc@lists.ozlabs.org>; Thu, 04 Dec 2025 03:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764847100; x=1765451900; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+LOeBEfr8ZEdGvSNvofGiFrT7OpuozP6mpPTcUt6zJU=;
        b=hReoddyIXWPgC3xXYeAfuZTnBAsXD/INwcWjkgV6m0QgJ8nETD6qYV+dQj/uY+3fo7
         JjBGJ+dKnSHffaQQTeNqSe0xgBP6bineJfZQJp7IJ6dQQO8mjt4guh0LTPGAgbQHf1pB
         +HAvR22Y3Tp2KKmhig/qs4FUwXh30tlK/qYyl3x5+da952N8LIhKf5/sICkm0x3TGHrx
         GLocnYmNZs7TflUuMzTzIcqKes5P1s4Z1W0/e13nk/rvx0XZLJsWqyKDoKTWX+f/t8bO
         3jPcuG/P9X1vJwxSg9BGOcVtmLLJOtjt6z0m8m4cMHh67IyfB+wupuNo1N6SksP4Z+0I
         D+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764847100; x=1765451900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LOeBEfr8ZEdGvSNvofGiFrT7OpuozP6mpPTcUt6zJU=;
        b=tmLPUDUrsWDvv6mZ1lVIQdGLYV45I1DraDCDfEeTdK6lhrjA/HNw2B0PxfLaOF/2FO
         GBzFVNqf5mQtK3LVNQtjMpPVqN9Qnxozth90x6PnxLDeBtzyMorzhq3a5tGIHLBK/Tzv
         WLl2yc5UF+tO2WM20LQ1h6gKT2ZP4qIYT3nCa7LD2ZePa7QLKZecuh98dFK49zs2JBmC
         8dkLGrpRboPQO7BBP9NlOTxJ4ATEXs4hTFAwERjW3xA28RTz9m1m5J3sdbmLtoJG5g77
         Hpe60mKR34v2eYeljJPubV9QFahMkAC4qs/MVgj4w09wrocKtj/xPVbDBZ7VCG8TpYMi
         x6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHPAUDhInOg8f8ZyGfeSio45oXvQm3TW8xGTmyUTB0QU/6ksQ19s3v7KM0nTJTi3JYLWhXYWbe@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5D4iaoCWKj+Nhti+Kv1G2XPPHctZfe4+VdRusuBCUyGvtrwPD
	xAlbDCc6gi1bxcEN3u1YOkrL69JfQyXxlOfuDyHQ/qM8/m3v6yHGwfITRlhaS7UdpVg=
X-Gm-Gg: ASbGncuwBeAvunJJmPt48pFMHwPx+6i8TB0aitoR45HP66d8G/35HX91ugG2sXdoNM1
	nca7X9y8cCxR1Gz5zsZLcojy+OwrsMvabvFwq/zYoeaXHoqrEL7EpmX0xPP1Am7dCJo63hrjqJa
	VUi0yIi5kGvLjGaJDNDOl/1Zv2jOywzez3EznhITyYHqGv3skSB3rN8DFbFLNs1KzGSdfE+ExuK
	7yEq7bcyV64Nt4JgqyT+WC452+i1lxgtsJyx0zGMFgJFsJFmyER5jAgyaJvjHHPJp9m15kc1XA/
	eAwz2kSwVBS3HMI5i6as28/7UiRoYb9yNrebeVPJlg3JsUPxByfVTrnKNeHnB9PctvDekyHXyME
	hmBTNJ2xSxoXf/mJKe3OJzvcnxl/UIrBBbYS3HiBDgTE83oAgSLnBrUhfXjIDhNBLpy+y7igJtU
	pyq7mtC/lyW0WEAie6LdiinCHZJNa7fBK7pTMhyaRUuJTA4J+rdIf+Qfc=
X-Google-Smtp-Source: AGHT+IH57MsQAl+/XT2gVgjmbcRNCbkMZAWMG/keUEp9la8csas6oJpOYVghaAgaaYbkbn1de2irrQ==
X-Received: by 2002:a05:6000:1a8a:b0:42b:5628:f4a3 with SMTP id ffacd0b85a97d-42f731678e9mr6043858f8f.1.1764847099664;
        Thu, 04 Dec 2025 03:18:19 -0800 (PST)
Received: from localhost (p200300f65f006600000000000000081d.dip0.t-ipconnect.de. [2003:f6:5f00:6600::81d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbff352sm2654474f8f.17.2025.12.04.03.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:18:18 -0800 (PST)
Date: Thu, 4 Dec 2025 12:18:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Eddie James <eajames@linux.ibm.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 04/12] i2c: fsi: Drop assigning fsi bus
Message-ID: <lwnjd4a46eypemd6daqitdvmapjjx4c6vr6yeuzf3qpvd2wrs2@bcmxgupsbyj7>
References: <cover.1764434226.git.ukleinek@kernel.org>
 <ef38106b5099e92395d5cc84d1bf0b806b53d1dc.1764434226.git.ukleinek@kernel.org>
 <x4y4m7bclxs3rbb6ptqt6chlg7iaual4wjz2lma5ugdhfp2mr6@phsjcud6vfax>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ofyrr2hu65mfdg33"
Content-Disposition: inline
In-Reply-To: <x4y4m7bclxs3rbb6ptqt6chlg7iaual4wjz2lma5ugdhfp2mr6@phsjcud6vfax>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--ofyrr2hu65mfdg33
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/12] i2c: fsi: Drop assigning fsi bus
MIME-Version: 1.0

Hello Andi,

On Wed, Dec 03, 2025 at 06:07:11PM +0100, Andi Shyti wrote:
> On Sat, Nov 29, 2025 at 05:57:40PM +0100, Uwe Kleine-K=F6nig wrote:
> > Since commit FIXME ("fsi: Assign driver's bus in fsi_driver_register()")
>=20
> whoever is going to apply the series needs to remember to replace
> this FIXME.

Ah right, when I wrote the commit log I made a mental note to point that
out in the cover letter, but then I forgot. Thanks for the reminder.

Best regards
Uwe

--ofyrr2hu65mfdg33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkxbfcACgkQj4D7WH0S
/k5bjQf/fgyumKlkXTNHtLYRAcdelQgnmwQq3VoF0X5TFn7pl2FyStUJSgvRZ87Z
59RLfegSso/0LIjvLUOkEJ8HX/Y9gDmE0pZKyuJ/jOuxHjh0tcKWtbGzwCbR/bh8
ceQpdwLJo2ZsbUUfMrkfoUTsY27SeDiyhHC9gZnj8KDQDDkZZ0BmLcbStBqvZIKJ
gnFijsB2j18OkWgd4OV2dmvISQgugOBOFTEsP/pe4CvLClTszpnZ7nSX8f2SJcFU
ce/x6ejJOGdagpSy+Udnd8TPWh4CGVPtZZEZT6w4gM5FWXG20l5p8TIFdDZC6iW0
ZmB1RTUTJi/nA9BZIgzKuWicB5Dayw==
=GVZw
-----END PGP SIGNATURE-----

--ofyrr2hu65mfdg33--

