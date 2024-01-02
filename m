Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2E78221EB
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 20:22:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mJqP/1d4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4N6370Lnz3bsd
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 06:22:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mJqP/1d4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4N5S4Q1gz2xWR
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2024 06:22:02 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-680a13af19bso24646116d6.0
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jan 2024 11:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704223319; x=1704828119; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpiiwxjlmyIAxkELB5wbRFltlL1YkF8U7qXoRRIFROw=;
        b=mJqP/1d4OzqPRCkNID7kUg0/Ej51qWcutGThudMz+6+LAUpRJ3zPj+qJGRPh2hSK5+
         1aBFvbOu95rESWPqWGJ7HCK6XLuAHss37xdpSnpWuDdACPeU9CJwqaGIeDltTwKavuUU
         gmUcatSNXLiFIGiXf+lOZmTg2lx42UEGoMU8rUVhugUxvgftVat062ZwPg5wW3HDEeqY
         Uqc36SI8JronTfmkwt8cMvI7NjCHnDq5KtOUBz6kpAMxtUZRA8BM7p3MeYjWat21ULcc
         A3GTOCFPsvgrzzumVuAZ2V7mvU9fEAeErPiY1w78fJmaFhF9sssIbwFhQSS46IEa7aI1
         SsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704223319; x=1704828119;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpiiwxjlmyIAxkELB5wbRFltlL1YkF8U7qXoRRIFROw=;
        b=u1Bq5ikt+n5+MtqFwZcoH43fl16zeUXW/6byEH9dJraKbG4WI4VuLUMqocqMZYeGr3
         kqfdDikAxlBc9Wa19Edwbrj689KC/coY6tW0Ss3kBI8Kp2v1jnGmUaTc4KONFc6zEt65
         q+yEEh+msgbICBV3F88odyHJJ2uEg+9p7SI5Mg+JUKBFR6roJpiIZ5Nf+hHe64p5TERe
         CqwNj0JRyEqeyfe6D+OSY9Hjsua5zGV0/E31f7xsxBJMdw+7mkpQdtPbxlO1q5/hwI3d
         bJVwqbOBovu50RWPOu6HkyuOLngep+D84q/xDNRH+gLOLZilAiLNSCsUEDhXHV/BWlUN
         z+qA==
X-Gm-Message-State: AOJu0Ywi4sHoZJUTu095URd+fb20gobc53BFtkALEPX7od1Z7uzk8b1a
	bY+UmR4+DXSjVEfq82ErYxE=
X-Google-Smtp-Source: AGHT+IF5RVDLBy1D4WAaaKadFYdWzVC/9eeT8+6rxH4vLLr5KrYplUzuxnmqZSPc0coK+Wzh0mo3LA==
X-Received: by 2002:ad4:5aa8:0:b0:67f:42fd:e6cd with SMTP id u8-20020ad45aa8000000b0067f42fde6cdmr36556511qvg.15.1704223318868;
        Tue, 02 Jan 2024 11:21:58 -0800 (PST)
Received: from smtpclient.apple ([129.41.86.16])
        by smtp.gmail.com with ESMTPSA id n4-20020a056214008400b00680c1b2f9dasm727197qvr.6.2024.01.02.11.21.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jan 2024 11:21:58 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: Signed OpenBMC CLA for Rebecca Cran
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <be8d4863-d014-4134-b76a-a9c84cf42c41@bsdio.com>
Date: Tue, 2 Jan 2024 13:21:46 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <775C0BA6-20E4-4D7C-8EE5-F58737AE7FA8@gmail.com>
References: <e8e119c1-4d17-461b-aac3-96e1c0c95a71@bsdio.com>
 <be8d4863-d014-4134-b76a-a9c84cf42c41@bsdio.com>
To: Rebecca Cran <rebecca@bsdio.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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


> On Jan 2, 2024, at 12:58=E2=80=AFPM, Rebecca Cran <rebecca@bsdio.com> =
wrote:
>=20
> As suggested on Discord, I'm forwarding the signed CLA (attached) to =
be able to contribute to OpenBMC.

Welcome Rebecca, your CLA has been uploaded and I added you to the =
individual CLA approved gerrit group.

Andrew

>=20
> --=20
> Rebecca Cran
>=20
>=20
>=20
> -------- Forwarded Message --------
> Subject: Signed OpenBMC CLA for Rebecca Cran
> Date: Sun, 24 Dec 2023 12:09:19 -0700
> From: Rebecca Cran <rebecca@bsdio.com>
> To: manager@lfprojects.org
>=20
>=20
>=20
> Hi,
>=20
>=20
> I'd like to work on the OpenBMC project and submit changes.
>=20
> Please find attached a signed CLA for working on the project.
>=20
>=20
> --=20
> Rebecca Cran
> <OpenBMC-CLA 1.jpeg><OpenBMC-CLA 2.jpeg><OpenBMC-CLA.jpeg>

