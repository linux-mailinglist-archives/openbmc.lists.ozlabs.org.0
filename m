Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A335821702
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 05:47:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dMPRUrMP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T40hS2T4dz3bpN
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 15:47:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dMPRUrMP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=padathjayashankar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T40fy032bz30Pp
	for <openbmc@lists.ozlabs.org>; Tue,  2 Jan 2024 15:46:17 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-28c93513462so1790970a91.2
        for <openbmc@lists.ozlabs.org>; Mon, 01 Jan 2024 20:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704170775; x=1704775575; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wkjvhkJv1Vtz9sRyuKBkU2gpxKeknuEOeuXnQNL3UZc=;
        b=dMPRUrMP3yyRlv9CFhdtAPWpCBMuYg8xfNpSMYkoxLScNyjTZ512SicCpz84pfj0gm
         nS404gvtbVL1tCXnMp5f9X9bcet0W+e8EtzTovo9+2jWyTzygc7xDYRBqGJbEQbcwIzs
         5fDqSwpgJHsLJ6RvXiMj1BoNSHuzcBMbEiW3rXCM515c+YYWOlsfpsq9X2JxNUtJ5g9i
         yoVUv7Y4yw90hN6ugixVeCDLXl38d376n2HQ23CaQh8j7Th1vQbA7QGdy+2KSqTkCbP7
         WCkEF0e5cp391LrtRZOV6ddrwcjQDxdVuLtgdSDyalknfeS7QnYyRFWI/iR0Jn6LG2Ov
         ziUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704170775; x=1704775575;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkjvhkJv1Vtz9sRyuKBkU2gpxKeknuEOeuXnQNL3UZc=;
        b=cUyNJU8OBe+PyOpkzz7Ap5rLMsZil9N5eYpHeWRfb9FsprMDcA0R5wiXnUC6pSE8ll
         INtKhA9RU7hhVG+YVgzN8m8t4109eZOglUczNJRX5W7gT222ne+XXJ+zkQ3amE0y9dxU
         NuH4zDw3/0gUkg/uQHXbFhNJ/c91DoLlDyD8AjK3FB4y+y7hvMV6EKoz5H2GbWUnw+tF
         UIreyOhtl3NMyFdM6mh1lzsgYQ2rUS7PmDGyP1HKvpaPbhqhNu5I/jNRcmcyeTPADzmu
         5rgm1BujuwFtXDXwbrpAzNVptM2x1ypHKMcrt2mk5P2VoWbkDeJwaU30wV8hqZ08Jqy4
         FOHA==
X-Gm-Message-State: AOJu0YwYec3fvq4Fclddh7uiL0m4cDAceF5vx/Zw66jFFoxNsS1s0HzX
	XrPTHFhtfoHEpUrRaZof/MKxQwxBKdF8Op4f4cCvsm33tlw=
X-Google-Smtp-Source: AGHT+IGkRtfi+6GTCgfrD8cQauPUNOEtipNqi/OYqNdDfuZgb0sWllXzXkvRDPCZ7gSpOheY37MOHZz54h4Z1xvd32s=
X-Received: by 2002:a17:90a:408a:b0:28c:915c:5eca with SMTP id
 l10-20020a17090a408a00b0028c915c5ecamr2941590pjg.89.1704170775136; Mon, 01
 Jan 2024 20:46:15 -0800 (PST)
MIME-Version: 1.0
From: Jayashankar Padath <padathjayashankar@gmail.com>
Date: Tue, 2 Jan 2024 10:16:04 +0530
Message-ID: <CAFRDoiwOqE96Pxw9QVE7B2j_JnBbsvaEa38H5_=DVch8Xo8P9Q@mail.gmail.com>
Subject: Question on passing username and password credentials through PLDM
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b04c1d060def2df5"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b04c1d060def2df5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

We do have a requirement in which the Host needs to pass the username and
password credentials to the BMC PAM module for authentication OR during a
password change. These details are passed through the PLDM stack.

BMC specific requirements:

=E2=97=A6 The ability to prompt for a username/password and provide authent=
ication
=E2=97=A6 The ability to change a password when the current password is exp=
ired

Seeing two design options here.

1. PLDM calls the PAM APIs directly
2. Make use of BIOS Config manager (But this has only password change and
no direct authentication. Also this does not make use of PAM)

Would like to know any inputs on the desired direction on this OR any one
else has similar designs in place.

Thanks and Best Regards,
Jayashankar

--000000000000b04c1d060def2df5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all, =C2=A0<br>=C2=A0 <br>We do have a requirement in w=
hich the Host needs to pass the username and password credentials to the BM=
C PAM module for authentication OR during a password change. These details =
are passed through the PLDM stack.<br><br>BMC specific requirements:<br><br=
>=E2=97=A6	The ability to prompt for a username/password and provide authen=
tication <br>=E2=97=A6	The ability to change a password when the current pa=
ssword is expired<br><br>Seeing two design options here.<br><br>1. PLDM cal=
ls the PAM APIs directly<br>2. Make use of BIOS Config manager (But this ha=
s only password change and no direct authentication. Also this does not mak=
e use of PAM)<br>=C2=A0 <br>Would like to know any inputs on the desired di=
rection on this OR any one else has similar designs in place.<br>=C2=A0 <br=
>Thanks and Best Regards, =C2=A0<br>Jayashankar<br></div>

--000000000000b04c1d060def2df5--
