Return-Path: <openbmc+bounces-394-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1A3B0E090
	for <lists+openbmc@lfdr.de>; Tue, 22 Jul 2025 17:35:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmhCt0zCXz2yb9;
	Wed, 23 Jul 2025 01:35:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753198506;
	cv=none; b=K42PaS5niVGVjxZiqxMtE14rHd3WTjB0CuLFZZleDINABG+aw3gW2/LaZOcE3M9lYTE8n8WLLuBBUs8a+u9Lce13XljpRhQmVx+udy2WrzZMF4XdArlJJRoICQsPJQlOanMYiaVpm5A0CtbU6IsyquEPN/xa81AEdBdxKKgBecCKYvtUB6RhUxNCe7ykv8no0/F2xfRXms5QJmensvGf9Rb8FBqAD3boqJ/YQmTWV/sZllgukKknJUtwmS8wUitVtPNb5EgU8fk5Rb1Tl6nPgfu3jpn/R6xI0092YRUibUorHPOdnDYCPS+MHk1K9Wg+KdB80yk5R4IFY+QR39fGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753198506; c=relaxed/relaxed;
	bh=y9a0dh3AH60yMUy4rIFPLsRUGn0MzPdVm9jJ0oeKlYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7rET509cmQ1FMd92+nK4scQdMUH0MPRd+ECBqfTuvA68YJORuJF88vENOwT5fne1gKp8ZXLGC91yAstn/MpIFAzGy/YcakcpdxqFVbHVjtFstjSPdIJGOeDRMfnxfrwGGCM6QfQMPXKKgUSpwrYBd/e5J6kiEv1vdEO0snfLWzM9V7rS4IRgOihGkl8PrdVr/0MACB/gwnZpjvsNSsJN91BIrW3MVcTbQ1uyHy2tjMUY96LeQ+2qXUGqhc33qaZEH28gsUcvwBs7I/grZygpiHjfBDZUZTbL1JzeyE6Iq7OANk4WtlwVHVh82WdcOa8HPtOJT7txDiJHiAOU10D7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d8rE0IiI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d8rE0IiI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmhCr5Vm6z2yHs
	for <openbmc@lists.ozlabs.org>; Wed, 23 Jul 2025 01:35:04 +1000 (AEST)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4e7f367ea11so572333137.3
        for <openbmc@lists.ozlabs.org>; Tue, 22 Jul 2025 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753198501; x=1753803301; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9a0dh3AH60yMUy4rIFPLsRUGn0MzPdVm9jJ0oeKlYY=;
        b=d8rE0IiI3/ZEip8KtbO1ysRY7FFTcjExS53BeURrven1eU1EcAGtTXhhG8tlYQHMOz
         RzRl77YAj2j51EMn3lTFx52mUYAnUax/3HQdHjTA572BmwaVkwwrDOIlODkWFrHeQZfk
         XS3Z0GkjN9t5kT9MlV61DSBgyPVh5ePxrGAAp14hgSFCzYjjpP5ruBi8Ry8STh/cuK9K
         iwSjdkHum6gphmuIp/C9SpjOA6plY76RvKmTeiYSpnFzSR1dMx8BbsitLtgV11/IwvNW
         /WYAMSLSpUnO8PUxCdHMfbzA3gCQLDWaG0rda2qrCIKuo/05B0i0kSprmi7Cnp47+b7a
         DDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753198501; x=1753803301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9a0dh3AH60yMUy4rIFPLsRUGn0MzPdVm9jJ0oeKlYY=;
        b=MOefmqY5TGuOn7RomKvk2YKTPV1X1C45zsOa/4lEXsqj/XIGgtPjS7ITwy5MCrUEos
         oKhRO/8HDsVut+BCw8JZBi++dwlPRwVZjdiESe7bHPIMRI66FcAQQ7nvr55/uWUerpRi
         mBP+89CKUUQQstAYoAxRAO9rBPFeJ4Rf0+onjzdjKTUPEyPuiUjsWGt+eVv375hPkVOA
         /gH/SQBlSlv51v1PMmdcpeL66EMWUTFK2DUwd3N+NqEnAiq/jxHVVs3xJrYEUdrn16wk
         uoqZwy/oT8zVS/Ce6jXrwZC6TX7M6DmJi1e8zXkMqcb3srhjavLdNOi6Sf0i03pOSm0g
         Z5UA==
X-Gm-Message-State: AOJu0YzIXaOOQm+EgnxBFyOZ7KLHbkBehkulCg40qWu/shSrhw1fNFli
	hWdgaoT5DLGw2XtIS2je1+lfNHCSLYWmK4NQYByxfEG8+fXVVzHWw0qGjU1cxKtlvyaytxNb+5Y
	WuRDTSyE2KCYlt+utyXAOgUFw0J34Ihk=
X-Gm-Gg: ASbGncsvUo4WnefMTf2ot4gJFsf0WNz7gjJDsAAFLNmL3S8C2ikjEaS3O6aRM1HbHt0
	OQSblXX3h+oAIiwQarHdOI6M9mgyz+LqWABgzV041Ij1o/OqUyQZxATOCr0io/txJeBKnX5uB+H
	Tqv3VwAUh7QURf+Z+B1FC/j8a25Bg6kM5mgA8AtwVXH1kzLD7OdweVTapswNht+vfMbBYXYikvr
	qOX3zpY4A==
X-Google-Smtp-Source: AGHT+IEF7bha3IOwM/4FJIfodO1cNcl7kur4McN6se2Cijc80cKQHzS5liZV0oW6dI0XcE9+ftU2VjXaF7Rk4MHd+d0=
X-Received: by 2002:a05:6102:6201:10b0:4fa:85f:31c0 with SMTP id
 ada2fe7eead31-4fa085f9873mr738759137.19.1753198501091; Tue, 22 Jul 2025
 08:35:01 -0700 (PDT)
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
References: <SEYPR04MB7755127F14678E6D3616B901F162A@SEYPR04MB7755.apcprd04.prod.outlook.com>
 <TY0PR04MB73524FA10F833221A4C2A51EF15CA@TY0PR04MB7352.apcprd04.prod.outlook.com>
In-Reply-To: <TY0PR04MB73524FA10F833221A4C2A51EF15CA@TY0PR04MB7352.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 22 Jul 2025 10:34:44 -0500
X-Gm-Features: Ac12FXz2je9rgXKqX9EuNhOMenCeVIEA9nhudu-pzEnUg3zwBRrp-6h_O6S-Cgw
Message-ID: <CALLMt=o=AiTwz0ox3iJ6-r_mVQFU=WVM3rmP5693emVJyOT07A@mail.gmail.com>
Subject: Re: Quantas CCLA Schedule A update 20250722
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	=?UTF-8?B?TWFydGluIFBlbmcgKOW9reayu+asvSk=?= <Martin.Peng@quantatw.com>, 
	=?UTF-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 22, 2025 at 3:21=E2=80=AFAM Litzung Chen (=E9=99=B3=E5=88=A9=E7=
=90=AE)
<Litzung.Chen@quantatw.com> wrote:
>
> Hi team,
>
> Please find the attached file for updated Schedule A of CCLA from Quanta.
>

Thanks for keeping your CCLA up to date. I've updated the project's
google drive with it.

