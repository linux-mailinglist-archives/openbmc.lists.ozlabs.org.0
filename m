Return-Path: <openbmc+bounces-716-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC44BBE23B
	for <lists+openbmc@lfdr.de>; Mon, 06 Oct 2025 15:06:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgKKP3NGsz2xnM;
	Tue,  7 Oct 2025 00:06:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::932"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759755993;
	cv=none; b=jUNQ43Ic+Kfq9l1CnBJaW8MPIOtV41NwO30NyY++Nu3R8BsJub7o1iLTzXQ3tSUW2qZ73965GYJVanQg881HG47vKCbtWGrRPex6s4zssAe1I6x2tUnIFzyCUTl7DrDwHIszUKR+B07tzO/c1+NXfXAJJ0F2CEJNqdJIZqBvteLL8ll3s35VTfwxE56kWKufPcgbEdxZOqUDpsuvkvHmi96P5UvMOYsfIAIfsDyxMIKPC/SmyCTJZOOqukrFBoN7KLs1s8NDDeR6JnbXZgBXrjlWSKwUY3UY8tDzVy6Mtjnz9FIj6yFOk3Oe8WjRvbXO+glvTI9CtYo2/in9RFLreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759755993; c=relaxed/relaxed;
	bh=SVCy0CSw38G2IJh0rFEC1yhLBWTH6oueDq6J9bRcmw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ss+2Llz/TNqLhWFi3pxx5HtHRtP0HTcMEdysOovizqtUL4x8bvVoqgomqbchLabD9g1YaSVjlPOaP0eDre+1KUFB7e9d5d7nJRk1fcSZ3CkTaobOPxIsyYtYCzJ99jhmwJvfLlpZ4qi0QVpQrNDQ7l9FT3OYEGfmZarbeIeGocSDWNxKHJHzjmqLVAHjRobEcOCDq1x/wDCD2rrXme2NdvWXzGiYcnxGFHV4IKfPlQZT5PeOC8qkxowUlKpQYWTMbdbO/2LqMWp7zbrJ7ej9RCeXLSFebXNE5lBE3u1UVgjSPBHODj5Z4FvghmXkeKhU7ea2nJraw+qFWHpEmJIIVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TskE2go9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::932; helo=mail-ua1-x932.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TskE2go9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::932; helo=mail-ua1-x932.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgKKN0h9zz2xQ6
	for <openbmc@lists.ozlabs.org>; Tue,  7 Oct 2025 00:06:31 +1100 (AEDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-89018e9f902so3076566241.0
        for <openbmc@lists.ozlabs.org>; Mon, 06 Oct 2025 06:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759755987; x=1760360787; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVCy0CSw38G2IJh0rFEC1yhLBWTH6oueDq6J9bRcmw8=;
        b=TskE2go9ass/Y1ID55YfcCP7ZByWcCHf6AJaATekf+imOwm/ZggWDHM0PK35TRGPwQ
         FL+ghjWfNDaWTl0QxYunhuUZZTIdl+fG70tCbquLej2FfltO0WTVCbkRSdmDJveSAAzv
         P5NlWfP4Xg6vb9B/Rg6LdN9KHeqe1zbVVhF96R9bZ0rLs72gt2yVYA11O1X5Ycak/e3g
         97Kpz5LJ4Zeqfz/vNxhhr9rL8vPUOS6TGDx+Hw5g155gxMgMQ7Osi6+oVIjyAVL9Owd5
         ZOTyyZjC3FjhtcMLkyVnshuQLWAVr5yGvdsNSG5UNqKedtxuRonugZdbWvvejdkckzT9
         Itlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759755987; x=1760360787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVCy0CSw38G2IJh0rFEC1yhLBWTH6oueDq6J9bRcmw8=;
        b=iMIfOz9+zGLWnNNTalHEdEgmifppZfolNh5/vlQbppA9Zp5eoPk5B58FKvcuCg69Vx
         6uTNgnKDTvoKRKDhTGZ8oE8aK3NmFgLXaD/BmZr7HrTXuTAhsEA0igmc2DtG4fnKv/TK
         a1Ujju5YQ9YpVpzYVq92J5HylXU24vkRGBXl5E07zieZMWF5kh77iGgcAafz3xEWeZ4F
         IfCDXtyaHNAzswhWnjnWNSYxsJ0Py8Dv0W255PmwMjHBrpGNF/FJ57M11rpmx4kgH3FR
         qdsgte2iXDBHazfGi28eVWkUuk3/0lsPJkdijVox2zit+G13vvImxuLd4Zmi3/rgExQg
         ie7w==
X-Gm-Message-State: AOJu0Yw91oXTK9EvGG9wxz55ggUATBVO5ZND/fwmtyVOFpsjrHjBhhrY
	f7PbKF04Y0s3WQ13Qm2ZTAU5FH48H8LsydQt+CRpJpEfjGqKxCxTuH8tVqfyU9JKmQvHYQbnwOA
	8gk62+ibdjfVjrQpJg9qof5068GrD2UA=
X-Gm-Gg: ASbGnctqURy6cN68aFxIsNbYRMQVZ1P7/TgzpUnySat/FCDHg0bXeusmVjJ9ZMTMdhr
	+BzhB/zXG6gdl6BJV9uPpUHD6CfrjDVmCNoADlJmEKaXp0DE6h+OK+X/soj+eFNFQlldNJkR8Q1
	NyhDUPvllXIHw3iasrSXZQnBuYA+bkqmshgcEMvGimydjlhl2s7kmB5KUEvHr7y+W2ijvHuzAQQ
	FYcoVWQzqYLxzAvzdAS+6U+dhNO/vogvho/uWE=
X-Google-Smtp-Source: AGHT+IGRMTf1OWGA8aj9G0USrEKAA2D16gLzIUf/jiMUPSnd388YXpIHZFY8DMkcbSBgjtv0gtRvQahxzUtI8YRX7BA=
X-Received: by 2002:a05:6102:6d0:b0:5a1:f09f:524e with SMTP id
 ada2fe7eead31-5d41d1131b0mr4881156137.16.1759755987448; Mon, 06 Oct 2025
 06:06:27 -0700 (PDT)
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
 <TY0PR04MB7352C16AEABDB768394727B2F135A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352537F1867EC8D7C71541FF1E4A@TY0PR04MB7352.apcprd04.prod.outlook.com>
In-Reply-To: <TY0PR04MB7352537F1867EC8D7C71541FF1E4A@TY0PR04MB7352.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 6 Oct 2025 08:06:11 -0500
X-Gm-Features: AS18NWB20mM-R51pOZyFjwyTAgBAI31MbrZc0d8zSo49bLzKWTjwlUSgjm1JOE0
Message-ID: <CALLMt=pZyzm3wiFfcAs8XB1vg2cCqx21T9ym9URUo=b=EkciWg@mail.gmail.com>
Subject: Re: Quanta CCLA Schedule A update - 20251003
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	=?UTF-8?B?U3Rld2FyZCBTaGloICjlj7LlgYnoj68p?= <Steward.Shih@quantatw.com>, 
	=?UTF-8?B?TWFydGluIFBlbmcgKOW9reayu+asvSk=?= <Martin.Peng@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 2, 2025 at 8:15=E2=80=AFPM Litzung Chen (=E9=99=B3=E5=88=A9=E7=
=90=AE)
<Litzung.Chen@quantatw.com> wrote:
>
> Hi team,
> Please find the attached file for updated Schedule A of CCLA from Quanta.

Thanks for keeping your CLA up to date. I've uploaded this new version
to the project google drive.

Andrew

