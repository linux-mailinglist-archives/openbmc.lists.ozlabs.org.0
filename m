Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 528FE2A501E
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 20:28:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQfvr6t5LzDqlK
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 06:28:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=pjunho@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=YKJpeajS; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQfv02G9ZzDqDF
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 06:27:40 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id s25so11992425ejy.6
 for <openbmc@lists.ozlabs.org>; Tue, 03 Nov 2020 11:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xWNK7tysz1PCoXqNej5ayVvBASO6HMFc9hRdECONVhY=;
 b=YKJpeajSkCQ7An2BGQ0mQd5j/NbYgXQn31YE385s9I1+RIN17lKsLePnMm3OkViktk
 vw1XxhzEzmumljzrapn+I+7jhfaN2e+b14RjFOZNZxzP/6SUBEkazn7UvifCndjEzNf7
 TZcOBJCHMw/y427ViNJiYOAqZ+7U2N10MeUxj+6+gksK2w63UXxw2y3A9WEJdyE7Q2XD
 te0Sm4VX8SpLAiSW9JzrwVe5OeyD/c+RJU9BlgufiZpNUW4FkGpfzd3Kdelhjk3I8Ehn
 CIA3jNThY8eE9r+2aMPK2Q36EurK6x6qzDo5OKc7uHbo66zv/OXKmz7EjeNWXP61ounM
 f9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xWNK7tysz1PCoXqNej5ayVvBASO6HMFc9hRdECONVhY=;
 b=JFp5dh85s5KBddWcsMYx50atRGctvYpgHuiQ/3lGtToSA00psyLqWKLPkNNF6VXDeC
 q09r7gOrOlRaAUFMHenm4Ywcnll3JKkjCtfatlyZ1+N1RnLv6rqDupYoXSY2n1ZRawrR
 s0AFKMas5zKU/qfkmHb/uBt7QtndXBhw22yHSIiOPXvv2kR5Sn4C8Bt+h4yJyyfYGbW9
 e4jlN5K25ISYBrOmmEboM9sAF6ukGQBlmp8vIy6I/uQVyqhAxvYWJL+OmVSWU3ZGqW+i
 UDa7nhIL6ys2iExtG3k8RHONTP0C2gA1z9r6Q7VDmbPo2vBZGUDaZv3IeJOCWGrT/iH7
 1+1g==
X-Gm-Message-State: AOAM5314K1n4kFfSq3Q1MxbO9zztk4du1WvWHTW1KzisHI+rJgxM4b1o
 vFzZpBOUowMA58RxgxeSw/vXFS8RekM8xpilTarynidNxs6hdA==
X-Google-Smtp-Source: ABdhPJzAInC5lq9lHSqO2bttSI4buJ0wMndxBi1TnxRxu6j8dhRDQlCmLCN2YAf+MOHJOyLZfVrgLDpiVIKKKr5FcCw=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3933659ejy.435.1604431654837; 
 Tue, 03 Nov 2020 11:27:34 -0800 (PST)
MIME-Version: 1.0
From: Junho Park <pjunho@google.com>
Date: Tue, 3 Nov 2020 11:27:24 -0800
Message-ID: <CAD_3qNncYz=iWjZ_3xxPuzeW_1vXCjTENAyC77A2KWa29B6KDw@mail.gmail.com>
Subject: BMC Mock Sensors
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000db05bf05b338da4b"
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

--000000000000db05bf05b338da4b
Content-Type: text/plain; charset="UTF-8"

Hi all,

We're currently working on a project to mock out sensor values and error
cases at the kernel level - we would appreciate if you could take a quick
look through the proposal and let us know your thoughts on the project.

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/37870/1

Any feedback and input would be appreciated - thank you!

--000000000000db05bf05b338da4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>We&#39;re currently working on a project to=
 mock out sensor values and error cases at the kernel level - we would appr=
eciate if you could take a quick look through the proposal and let us know =
your thoughts on the project.<br><br><a href=3D"https://gerrit.openbmc-proj=
ect.xyz/c/openbmc/docs/+/37870/1" target=3D"_blank">https://gerrit.openbmc-=
project.xyz/c/openbmc/docs/+/37870/1</a><br><br>Any feedback and input woul=
d be appreciated - thank you!<br></div>

--000000000000db05bf05b338da4b--
