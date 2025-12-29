Return-Path: <openbmc+bounces-1079-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA68CE7C2C
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 18:34:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dg3Hn66fbz2xgv;
	Tue, 30 Dec 2025 04:34:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767029669;
	cv=none; b=Kiqx6GlonwALIZJPMln73OVZi9bAn6wSDMg+dWRRsqk0vEps5lRnV5bxFqHpZLiIegkTF0Zc7jTlc2zU2lAUQ5mt8UX27TvQOD46lFo47LcfsNGK3MOk53ViWoKO8d/riVU2e4drLPy/1T9oV5YIfvTDm2cFB272nwuDKlgWCEx+mGkWNU/vlrN1kD94KUTDsoVQON42rxgCd5hKi81MM5saH5QC5fdCXeEZ8KJKFXE3FVsdSCpz//Js+LSYy2XyAPKi9L5vDeV4AZuWWzdcNWUUuDS3WxwKX35xwUBRpAypCPa4tB45Pk8CPF3rkVUwRKa59oTT1XklwZqQQ2jNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767029669; c=relaxed/relaxed;
	bh=VoCJTa58w80dcd2qJpps1qNdlYOhggreiMtIH3bu41Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8vPXBw7DnCo2q7a6x6jnHs8IaoZV4ZXIVCU9MjyfQt8rgnWMPK8OWL5kyh8pWtk+ejg29yMd4Z2uWw8pjQ0rqh3Zv/XwDPpvBZ+B5bxn+xz2ftv1jRCTorgiOqpqD3oaYMODJBmKo4WmIfexzo/rJ1KbOWIIDfj/Qni87juWDZuvoU2m2EgMCRzhSpAvWRJtvdj2P+aD59ZvVrG+Q5SaOKywkBb2rXLkzLwQK+eATbNHxCJkH5yctF2njJPG1+3T9OOvjEfOBeR7gJ/JwVhzB43WYZbo4B339J+cfERfXTK6QoQGyMSBZBAY895tG78/RiIzL1WHv2pR/QI9YKC/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iAC6j7th; dkim-atps=neutral; spf=pass (client-ip=209.85.221.177; helo=mail-vk1-f177.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iAC6j7th;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.177; helo=mail-vk1-f177.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dg3Hl6P1Lz2xKh
	for <openbmc@lists.ozlabs.org>; Tue, 30 Dec 2025 04:34:26 +1100 (AEDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55fe7eb1ad1so7343213e0c.1
        for <openbmc@lists.ozlabs.org>; Mon, 29 Dec 2025 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767029604; x=1767634404; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoCJTa58w80dcd2qJpps1qNdlYOhggreiMtIH3bu41Q=;
        b=iAC6j7thwKdX/p4G/EPnAsmPiN2OO5v5DwoK7rKsXzln0Tzs5/j41pt+0dpWzC2v/U
         gBiOjrDZd/OWDeq6whT5RC43yQKtjwrUU1xz1zGGntes8Iysr+0OdwxTrxoZ6tgZvVM1
         iVJUzMismsLxcwFlW/xg79yYUsmdPplyZAxTVsV6tqsnM7Su+8j7S3Lwm2XMal0u2wby
         xR7a80xTZagcqT81aOrbBU++l+/AZBiL65rR/e81y5yTovhclqA0tZtXgjxjHDhhgzQn
         Yz9h+cefoZD69eo0zG557J9hs0EpAgXj2X0Cx8LhUfS3YO2LqaMolmyiqs1qw1zLWnK4
         4caA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767029604; x=1767634404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VoCJTa58w80dcd2qJpps1qNdlYOhggreiMtIH3bu41Q=;
        b=MCmcQi4d2DUe+DzybK9uOCeyspesu+FcrC4O9ySF+rPP/7q0zv5IU+P0vWTKR9I0au
         00Peic1tdpObx52sIcgiDxGKL6Rqdt4BtPcb01jEsKuUV55Y28B8fwQImKUWd6SCYCeW
         yz/BwVEnuvhInnftTdgqtzO6U6gfxYjUVg09V9XZh27qBTfPsEWv8raBMm2wHZlGWI7h
         mBTTCukCGNnVpf7DcfxqTsUonEn70JOEXc9qi3iXElVcBRu6FGE+T4SKLvL65FUcaXPR
         JSVLkJOt8rAjXH+IzRx/6hPS7Pxene5iIcajRcJYL0NUKpMgeKd/Rm83HvlxR0YxJALW
         D5+w==
X-Gm-Message-State: AOJu0YxUv6w9C8Mg4pA0BAujb2S/CoQwT07IOY4vjWlzPANO0YnAn6yc
	XNg6GeSI/jKXiu6yh+ShMrEZNT8sifWTNXPrHBff/8AI5ACXRHUUR/N4R2/uhnRzjixTMO81tcr
	CdSIrle6RNJz3HElDn0//4UZFCpIEzjxLxQ==
X-Gm-Gg: AY/fxX5/B1I5ZwOjwdEP1/N75sgGj3u4bDzcFfq6GEQr2GnnWOv36ObEnI5uhQmStsv
	x2aKK9yu9D62gasfCeBBaKYqPnHHD+ml7d37BuNFZ9aczVxkQxm57cH+GEzefShtg+og7sRzSnB
	GxnUkgrvIakBNiiBlvqsP4dDQ5rcOCxSYt9YANLUeFWpRo3mkPBF6PBoU5Nkdk8Ta0XDaqt9+hU
	XrHM0OSnJEuLp/KfaoTL6Rm36zw0LAT3cQvyfUilhFmp/dJRoezN6cgV55NYILvxKiEjM0=
X-Google-Smtp-Source: AGHT+IFQCkL29/y+6d1iLkJ1oCijFqRdBZOG5SOD8MXpAEbx/uA1cg4md7vakk1YZiF+k+lmLaSjPTfO/WRtpKurxek=
X-Received: by 2002:a05:6122:6597:b0:549:f04a:6eb3 with SMTP id
 71dfb90a1353d-5615bd711fcmr10059073e0c.9.1767029604109; Mon, 29 Dec 2025
 09:33:24 -0800 (PST)
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
References: <DU4PR08MB11151DDB113CE00BFD7FE329190A9A@DU4PR08MB11151.eurprd08.prod.outlook.com>
In-Reply-To: <DU4PR08MB11151DDB113CE00BFD7FE329190A9A@DU4PR08MB11151.eurprd08.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 29 Dec 2025 11:33:08 -0600
X-Gm-Features: AQt7F2r-jelj6kKPQ2kCZceDNNQQStD4cJf3NQeNbK1OcO8erxwe1JP9ODWsdB0
Message-ID: <CALLMt=p3aRBukRGmoGq=-RPqY15_rgCKiyqHdoFX8vFoi-+djA@mail.gmail.com>
Subject: Re: Arm OpenBMC CCLA update 2025-12-19
To: Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Dec 19, 2025 at 11:31=E2=80=AFAM Samer El-Haj-Mahmoud
<Samer.El-Haj-Mahmoud@arm.com> wrote:

> Hi Andrew,
> Please see attached updated OpenBMC CCLA Schedule A for Arm.

Thanks for keeping your CCLA up to date. It's been uploaded to the
projects google drive.

Andrew

