Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D6D7331DE
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 15:09:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OW4BKbmd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjKHh1X7vz3bmp
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 23:09:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OW4BKbmd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjKH43ZKyz3bd6
	for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2023 23:08:47 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-762389a65a3so30516085a.1
        for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2023 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686920924; x=1689512924;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qc6UYV9dRIwD5kVAzyGoig9jeBOmyHtyGkovM+RWMnI=;
        b=OW4BKbmdbFyNHiiJN74kYB/q0gGec56Lg+5yFa3ihGO3aAGE53HVvflD1Ivr9FhYLb
         utjLdcBhCkC2GKfT4x1VopSa9Izs53T8iE0No+i9YZk/uOTGaGmoBRebU/HumM51rS8/
         gnDXvKFsjWnLUVs0pT6J2/juubQ4AAhz+BptfKN7NcJpQZGw4EXpOU1OloocVAOkA+Ie
         oZXYvxCqVQ2Vd05DdQZsh1if+bmk98mH445kwMdarnWkOD5FMsHQ8O35xGgYmrPYzU4c
         tpYrcPaoaTNKFusq8Ll3qPV5u3B0VZCQQhNrOhN9+wm3rhxdv9PZAfRPME3xM27jL7kJ
         PtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686920924; x=1689512924;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qc6UYV9dRIwD5kVAzyGoig9jeBOmyHtyGkovM+RWMnI=;
        b=iKa+bW15qkm4YlzxnsjkAa+z8RJCMgZbLCQnD5gJw0/WtH+Gkt+3UDl/zQOD7ouE74
         CUu3PbJm2toTdRQjN1U81ZFWwgTsyusCOd+/LAazKhXFflQkWaPL4pJetPfZuIgBxTnR
         qpfovUDb9Eoy196B3FdlMW/MSK+GQwLqL92su9rscXefP03Nov9jrUdWcD/aGoM3RahN
         lirBCCv1tKdC6GMWsyMAFaH0b/4Q34BJ4pAS70ln3bQKJh8wbAqlr4GhbzrCF0gksk5b
         WystAcL5G6VVdJ9bqV3ftHW0k8yjbqb7NGH5hMwy3xyBx/a7QxnjyhxcgMRW1w4bpicI
         hRiQ==
X-Gm-Message-State: AC+VfDxwSzE5PNAIL9CN+lBWm9qMv0ysZNTIZZ/2NCK7Cw7u7OOMHrXs
	L8aSPUfdu+TJ4vfoQ+WgcJI=
X-Google-Smtp-Source: ACHHUZ66KYv0nf5JJZbO3KPW+o9EUKiaYmu7zRuY8n3mytX2nV5QlQz6hdEvYRXd9MPHbGh1IjsSRA==
X-Received: by 2002:a05:620a:4d94:b0:762:5a6:82aa with SMTP id uw20-20020a05620a4d9400b0076205a682aamr1679897qkn.35.1686920923536;
        Fri, 16 Jun 2023 06:08:43 -0700 (PDT)
Received: from smtpclient.apple (pool-98-113-238-12.nycmny.fios.verizon.net. [98.113.238.12])
        by smtp.gmail.com with ESMTPSA id p12-20020a05620a132c00b0075edaba7369sm6488577qkj.81.2023.06.16.06.08.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Jun 2023 06:08:43 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: phosphor-bmc-state-manager: error while loading shared libraries:
 libfmt.so.9: cannot open shared object file: No such file or directory
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <871db367053a4dc0aed3adab0a4a44cb@tcs.com>
Date: Fri, 16 Jun 2023 09:08:42 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <153CBB6A-FC50-4AAB-AE18-36524A8DF2F1@gmail.com>
References: <035800fa6a6748478d434ed0a38e6a83@tcs.com>
 <871db367053a4dc0aed3adab0a4a44cb@tcs.com>
To: Shruti Janardhan <shruti.janardhan@tcs.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Sushma Patil <sushma.patil2@tcs.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jun 16, 2023, at 5:04 AM, Shruti Janardhan =
<shruti.janardhan@tcs.com> wrote:
>=20
> Hi everyone,
>=20
> The issue is resolved now.
>=20
>=20
> By checking the commit ID of the phosphor state manager recipe and =
OpenBmc, we realized we were using mismatched versions of commit IDs. So =
after fixing that, the program ran successfully.
>=20

Thanks for sending a follow up on your solution Shruti. Mismatched =
SDK/Code has been a common issue and is why I=E2=80=99m working on =
moving the developer intro series over to just using devtool up at =
https://gerrit.openbmc.org/c/openbmc/docs/+/64233.

>=20
> Thanks and regards,
>=20
> Shruti Janardhan
>=20
>=20
> ________________________________
> From: openbmc =
<openbmc-bounces+shruti.janardhan=3Dtcs.com@lists.ozlabs.org> on behalf =
of Shruti Janardhan
> Sent: Friday, June 9, 2023 5:14 PM
> To: openbmc@lists.ozlabs.org
> Cc: Sushma Patil
> Subject: phosphor-bmc-state-manager: error while loading shared =
libraries: libfmt.so.9: cannot open shared object file: No such file or =
directory
>=20
>=20
> Hi everyone,
>=20
> While trying to run "hello world" in SDK by following the steps =
mentioned in the Openbmc Github page, we are getting the error: =
"phosphor-bmc-state-manager: error while loading shared libraries: =
libfmt.so.9: cannot open shared object file: No such file or directory".
>=20
>=20
> These are some of the steps taken by us to resolve it:
>=20
>  *   Tried installing the packages =
libfmt-dev,libfmt-doc,libfmt-ocaml.libmft-ocaml-dev.
>  *   Using another pre-existing Qemu arm and image.
>  *   Installed and Re-built Qemu and SDK again in a new directory.
>=20
> Despite trying all these steps, the error persists and we aren't sure =
whether the issue is with the Qemu or SDK. Could you please help us to =
resolve this problem.
>=20
> Thanks and regards,
> Shruti Janardhan
>=20
>=20
>=20
> =3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
> Notice: The information contained in this e-mail
> message and/or attachments to it may contain=20
> confidential or privileged information. If you are=20
> not the intended recipient, any dissemination, use,=20
> review, distribution, printing or copying of the=20
> information contained in this e-mail message=20
> and/or attachments to it are strictly prohibited. If=20
> you have received this communication in error,=20
> please notify us by reply e-mail or telephone and=20
> immediately and permanently delete the message=20
> and any attachments. Thank you
>=20
>=20
> <winmail.dat>

