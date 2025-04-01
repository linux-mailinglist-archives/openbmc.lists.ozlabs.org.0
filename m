Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9825A782DA
	for <lists+openbmc@lfdr.de>; Tue,  1 Apr 2025 21:42:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRz0m4Gr4z3c8H
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 06:42:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::933"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743536533;
	cv=none; b=Ldom3EMqo/iIPNRXgXY5HhUuyhqy4NvGv2yLRAYTS/m916vZOgNwVOVWvZLQINL7cl1ymPSpHeYyMwD+9aJTXGPqikgW25SlyfKbVA2LlkTRbHEMZOsxvblqRXkD6sWsak8FRwlbAsPTSma28o/IwKSjwMsMYJaoB2gqRmqmDlXunvBHkbUQQv02QQ/gFY8Zcn1LCV2FCvCsBUZY9IwFB4xkg+rKwVpgx1RtAa/5z9BA87tgxHlfBt6FYixy9619Tj9GiaxPXj4pstOHGuu9hcp/MC/AIQ9JtEEIOH/d4M1P1CNRdbt69kIMYRwgHC+SLO8FHpOvpXghIFTB9cew/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743536533; c=relaxed/relaxed;
	bh=RpM+GG4P+kguxWWf/7o5ex08Ll25TCulCSpT0rTsqj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvU6mUcveHnnmwOM4irAsubR4FhGZ971av5c2d16hgRjMKZhFTaVz4hLHHYFYkk/lkcVemfA3h3EODtdh14S5Div390D6LwgPtm8i6IXh69yOKDh7/xqrOWCyo45MFkbwKGCv8uPeDwNTInnUTCbYZGmn3loUyjxXTbDZZ8fSzzkLjl8Jdm574Abw7AXJLsMfc1hdqpP+XdhNBkHrMgFXCaPHOxVUiIuJ01SutPCLF7QH4wigm/AWqfIBesuGwkgbQMV571ez53ckKOrsJEp9WiFJK9CJznwCA8uvHXEZBhGs+cG9fMq/qu0jwpUQGSr+p3oeyZAETktDhY97DEqlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YnZOb1P/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YnZOb1P/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRz0h0N8Fz2yqp
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 06:42:11 +1100 (AEDT)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-86d6ac4d5a9so2728748241.1
        for <openbmc@lists.ozlabs.org>; Tue, 01 Apr 2025 12:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743536529; x=1744141329; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpM+GG4P+kguxWWf/7o5ex08Ll25TCulCSpT0rTsqj0=;
        b=YnZOb1P/C2sSRIOsW76YKhVuTshHBGbqmHEPNuQTvT8cKp2N8ve6WI0U2pQQBzibDY
         wL3AZ0SKzsXEWTjOi4Sz4fbElaqcmBDcFMdbdWveogqHTd3A6prrrd+ZBT4dMkd/UHt3
         Afu8rkZqxxcqmGp2t7u3HuL+5G+bfzG5r5CFuRBvaqO6D0pmgUOXebqz7LDmAhnnZxsF
         MC42cYIIVLgMcL0a4jfJF0Hktop/ehOBqgD5aOg54V4qbRB3kdwcToXPFaxwyuoJJrR+
         r2mOG41ftUmYEjTdufpKqqM0DL6970+HPjwx6FAlAbx10dAlZU2u3F6z6OJdnC/VCU0m
         ap0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743536529; x=1744141329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpM+GG4P+kguxWWf/7o5ex08Ll25TCulCSpT0rTsqj0=;
        b=MlGZzrUU9d2SK6iykpqxfgq4SMhmXGSu2FoovN5uGpy+39eyxQdNsi4sC5NmQjqd+m
         rq4WV4FFTEEehfNQeAOzgVhd6BfsONrygMc/zmHkIJttag5ocouV12/JT6dx2+vne6sM
         GK1SXP8v7xDwdwMmKOq0jihNmTs2qYCXCrvHoTm+KmdLcA6QuJvidYfWXDtf0gwPRscd
         ReCp09kAQCk+ZDfi5XWtsxgrUrPvvxU9um92Vvrli6iFb8JjtuAR14NeV699pIzRGIFY
         e5P5DTrdRZ719d0pf1rDuVAqSA4tGD0btqD9xUx5asF2604pjBrcW0E8DhVV8MTE+CwD
         v/jw==
X-Forwarded-Encrypted: i=1; AJvYcCXQOQRqQNIiAS9L0tdhceJkxSR/F4sRu0Iot6TKNYFl9Gogdbg6WDQ1di4t8Rn8gU7dUjZ5qmi3@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyvZgkzuHCctX8kmujkq4IEKG3HqwHKaq+01CBRYDUOcDd1gEnS
	uOHqTjPhOzQszC91v4LOU3y4AUVFJp0v+jAAY2vhu7xElCeIie6Cqw7iPLdLq4twNZUC6j9gfc9
	AOmDbRrObTIQ57Z13jsXc2fhpa2Q=
X-Gm-Gg: ASbGncvZ+u54q3xB/ZbDwpiB/WIynqaI55vmKc05NdnGSZRFifmMU6mDj05T6oQuO8h
	4Idzux4ESauc27CoYWrg9EiNFxLeBc3j/n83ycrPApU3rZNZdag56Uf4kzqK9vxx6ruHRar1oqf
	hb62RIyvjoCjX2MP9BaaSgR0Aa4A==
X-Google-Smtp-Source: AGHT+IEmHBHltgmNo/k+UMP1ebzsGbORcQFj4JyNhIfhxpgIy2NF6O6welHouzNf8xsJCPTOTUShabH+E8j4cfuVL/w=
X-Received: by 2002:a05:6102:149a:b0:4bb:e8c5:b164 with SMTP id
 ada2fe7eead31-4c6d3847bb8mr10976056137.7.1743536528842; Tue, 01 Apr 2025
 12:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <SEZPR04MB80456EE06D62AF894C92D7ECADAD2@SEZPR04MB8045.apcprd04.prod.outlook.com>
 <CALVHhec+VRqf7zHvfr3AP-qCbfs_4QyH_aQXHd05f9DGg9Z6Tw@mail.gmail.com> <SEZPR04MB80455B0E70D9399F4971DB00ADAD2@SEZPR04MB8045.apcprd04.prod.outlook.com>
In-Reply-To: <SEZPR04MB80455B0E70D9399F4971DB00ADAD2@SEZPR04MB8045.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 1 Apr 2025 14:41:53 -0500
X-Gm-Features: AQ5f1JpRLTaL4ivUzsFQFusYucwKyGvoC0HYfJX2PuYJXlRFonM1ET7wYL-3MAk
Message-ID: <CALLMt=qiwd+hASR7gpuViPgVacFEys5_61P-DDNSRPKmHn1-+A@mail.gmail.com>
Subject: Re: CCLA for Meta Clemente project
To: =?UTF-8?B?QWxleCBXdSjlkLPmlL/pjLMp?= <alexwu@ingrasys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Mike Dolan <manager@lfprojects.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Andrew Geissler <andrewg@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 31, 2025 at 5:48=E2=80=AFPM Alex Wu(=E5=90=B3=E6=94=BF=E9=8C=B3=
) <alexwu@ingrasys.com> wrote:
>
> Hi Mike,
>
> Yes.
> It is our target to keep in front with Open BMC.

Welcome to the OpenBMC project.

I've uploaded your CLA to the project google drive.
I've submitted a commit to add Ingrasys to the approved CI group via
https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/79343
I've added Mark to the ingrasys/ci-authorized group so he can add
members from the CLA to
https://gerrit.openbmc.org/admin/groups/1fa089880a512848dd3f430cd315df4c7b1=
38d1c,members

Andrew

>
> Thanks,
> Alex Wu
>
> ________________________________
> From: Mike Dolan <manager@lfprojects.org>
> Sent: Monday, March 31, 2025 10:38 PM
> To: Alex Wu(=E5=90=B3=E6=94=BF=E9=8C=B3) <alexwu@ingrasys.com>; Andrew Ge=
issler <andrewg@us.ibm.com>
> Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
> Subject: Re: CCLA for Meta Clemente project
>
> Hi Alex, we don't have a Meta Clemente project but this CCLA is for OpenB=
MC. Did you intend to submit this for OpenBMC?
>
> On Mon, Mar 31, 2025 at 7:18=E2=80=AFAM Alex Wu(=E5=90=B3=E6=94=BF=E9=8C=
=B3) <alexwu@ingrasys.com> wrote:
>
> Hi,
>
> Here is the CCLA paper for Meta Clemente project.
>
> Regards,
> Alex Wu
>
> Senior Director
> Ingrasys Technology Inc.
> Foxconn | Cloud Enterprise Solution Business Group
> Office:   +886-2-2268-3466 ext. 5010-15610
> Mobile: +886 972 781 825
