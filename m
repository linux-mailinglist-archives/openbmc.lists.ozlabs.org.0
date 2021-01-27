Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E5304F29
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 03:48:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQSj373rTzDqlW
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 13:48:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c34;
 helo=mail-oo1-xc34.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bf73qbff; dkim-atps=neutral
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQShF0cj1zDqkp
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 13:47:56 +1100 (AEDT)
Received: by mail-oo1-xc34.google.com with SMTP id y72so186509ooa.5
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 18:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WzGOQGMLYoiWA+mq+6cKV4/KFggNNIa/woPg1lzYNDw=;
 b=bf73qbffLUJM/ON4UdbcgC7t9yKVV3iaaCidkX1O1NGYXb+9Pe1vzxIFSqtq09g6EG
 dvhfLJZuQyT81Ezb2gopLUREwS68a99slqeO5oXAG0MQn0bQjNEtOoYDj5j+2gpUpcU1
 02w7r8UxQUHUC2aPnmvkEmzWVL6tdHsZxAhyfTB+BejWIXFIe6O013trgMa8dwgIH0L9
 Xnckr3l9xGWZQoDssiQIFAZuCYOwGf3ErxZWHbqhwsWn7I20X5oEdJFkhVrE99NOti1n
 RVR9ufBZy62go+u9AIOwlX6xf+L0EMDzYceGcpNZdr0eMzaeqrzMKMRAe0jC9AyIabMb
 k/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WzGOQGMLYoiWA+mq+6cKV4/KFggNNIa/woPg1lzYNDw=;
 b=m/L05qm6ppTAe9GBHu1yslUjUXVaTfUE+0BiAas3MuHvRAx7sM5tPU8DwSUM3gENZY
 WXcejIoOCf2HOm+M6ehdzUDyZCPf3ZVCFucYx4grggo/Mb/EhAPG8VgL5BlB+sSxPgP6
 8bwEq4+pusedroL4zH3+7+gSSq8Li4DwxoGr6QwDttaU+1JP10wAl4mp3J4czjhmCl9I
 tfGgEeb3fmjPZqzaKz+KUT0sDMSfBW69AkvFJMefpqXQrinmb0G7Qaeo+IwsFe/MEgCl
 FjCWqzfxeusXdURTI6Zm+tdLFzddpGbCymI84+EoXNd+cilQzf6rznijTstE6flM7qqS
 CWpg==
X-Gm-Message-State: AOAM533qzgZSwWA7+UF3zG/oHJCwtJk2It2ums0erIe1FT4ZX4QjUwer
 OunPPK6ERLlXPdqzYhUz/lmFaGiuZYVKdQ==
X-Google-Smtp-Source: ABdhPJwELZP4qEHYxyZo6Bsgn/J4pX93s6t7KbnMMg7ZVQxF5bZCJiBJnmsj2VjI3+FkJb5qEftJ0A==
X-Received: by 2002:a4a:8555:: with SMTP id l21mr6177520ooh.27.1611715673596; 
 Tue, 26 Jan 2021 18:47:53 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:5cde:8786:c182:46f7])
 by smtp.gmail.com with ESMTPSA id n19sm123682otk.57.2021.01.26.18.47.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Jan 2021 18:47:52 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [OpenBMC] - QEMU link seem like can't download
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <6010b181.1c69fb81.7b936.e70fSMTPIN_ADDED_BROKEN@mx.google.com>
Date: Tue, 26 Jan 2021 20:47:52 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <1A168CFD-4555-4E27-8E25-466D6243854A@gmail.com>
References: <6010b181.1c69fb81.7b936.e70fSMTPIN_ADDED_BROKEN@mx.google.com>
To: "prince.yh.kuo" <prince.yh.kuo@aewin.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jan 21, 2021, at 4:31 AM, prince.yh.kuo <prince.yh.kuo@aewin.com> =
wrote:
>=20
> Hi,
> I=E2=80=99m a beginner of OpenBMC and I found QEMU link seem like =
can=E2=80=99t download, is right?
> <image001.jpg>

Thanks for pointing this out. The build env changed recently and that =
resulted in
a different link for this tool.

I put a doc fix up at =
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/40033

New link for tool is =
https://jenkins.openbmc.org/job/latest-qemu-x86/lastSuccessfulBuild/artifa=
ct/qemu/build/qemu-system-arm=20

> Regards,
> Prince
> =20
> =E9=83=AD=E8=82=B2=E5=AE=8F(Prince Kuo)
> =E5=85=B6=E9=99=BD=E7=A7=91=E6=8A=80=E8=82=A1=E4=BB=BD=E6=9C=89=E9=99=90=
=E5=85=AC=E5=8F=B8
> AEWIN Technology Co.,Ltd
> =E6=96=B0=E5=8C=97=E5=B8=82=E6=B1=90=E6=AD=A2=E5=8D=80=E5=A4=A7=E5=90=8C=
=E8=B7=AF=E4=BA=8C=E6=AE=B5133=E8=99=9F9=E6=A8=93
> 9F., No.133, Sec. 2, Datung Rd., Xizhi Dist., New Taipei City 22101, =
Taiwan
> Email : prince.yh.kuo@aewin.com.tw
> TEL : +886-2-8692-6677 ext 9307
> FAX : +886-2-8692-6655

