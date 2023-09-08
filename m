Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1388F79A242
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 06:09:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oGq5nEJ0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RkYBj02ykz3byP
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 14:09:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oGq5nEJ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=bosun996@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rhr7k72nTz2yVN
	for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2023 19:16:01 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bf1f632b8so235782266b.1
        for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2023 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694164556; x=1694769356; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4ohCztN7MRpV588D+vkbvx1+cxOZECgG8GV4w2nFLUk=;
        b=oGq5nEJ06e8LYMmdZN+Cm93PiYxI6C+MTZFmNH6uslzlIYwDc1K4yX8rodZW80sDBm
         A4E0WH8Poj3gXaGTOGJehKoRcGlty6d7hZF65Zzw5oOwCa/XkCIv7b/pyDRm171FKY7d
         imoFWz82GrdjO5aUB31cGBFslZA7vcxjkodbaNUJrd1JRCuFvZ+lQW0xdUchGmpWHuye
         ipzjGAEMK1Mr/r7Jl0lSEvUpmm0zGD933rM4pUKRYR1NEKDpyVGtmkrbNEThhMjaoSNT
         zAsZRiAMUv2eGe1CiBj82uSiR5R4D9UG3JnemnZC/EaRzEbAwcB9VeL8LId/uILbwHV2
         Ud6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694164556; x=1694769356;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ohCztN7MRpV588D+vkbvx1+cxOZECgG8GV4w2nFLUk=;
        b=suVZ0VqCfEQhuMNJbfY4vESPM4g2P/Swbal0sH5iJ8IYJKKZcJPGVFH9PEHKkeLZXK
         Nlho6x64ogEOqSOnXM+J2Nl0PjYXst0+Vuu0hcHSDqxHjCSo1nvqtEJ7UQTYKl5BHkcC
         B4KmNrMnLVGkk+Ji2aXlRa61rzZ4mkRFvt2WpCZ4/O1Hso2c48yVgguEyekiAZa8s+kd
         Esz29PI9IYjvZj0T/gUjhHHDgE3ViBnpkJuBYzZ5GAF2yMtwq51dCQ5ZPZA9rRrWO2Qx
         KWin7uhI5dM7bF7nCXghh2och1eTpFPE+O9Tyq1stIcvOZtjAzh19KxjLCyKwWENAqAN
         ZPWg==
X-Gm-Message-State: AOJu0Yyzuz3WqDHXv2asb6FEdColmrczEdaLosZAmGf/Mtx0fYbkvfgK
	f0NpVeIGaI39fjIoPBoAXcFhIBrim785YdETvb+IhYoMQJU=
X-Google-Smtp-Source: AGHT+IEP3fbXU3Ud/lwJaGEGbukbM7LRxIDd92Cs7mJqTAGyREjlCuv/5d9azPUbquPvHXb446CXrOqhAljZHzxpMJI=
X-Received: by 2002:a17:907:3f99:b0:9a1:d5de:5e3 with SMTP id
 hr25-20020a1709073f9900b009a1d5de05e3mr1617927ejc.54.1694164555561; Fri, 08
 Sep 2023 02:15:55 -0700 (PDT)
MIME-Version: 1.0
From: Bo Sun <bosun996@gmail.com>
Date: Fri, 8 Sep 2023 17:15:42 +0800
Message-ID: <CAEFqs-Qz-BtQmAWaY9fxtAY=VXo4m3hexjz1MsGs8fjVf9-urg@mail.gmail.com>
Subject: Can bmcweb support http and https at same time?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000867f970604d56c36"
X-Mailman-Approved-At: Mon, 11 Sep 2023 14:09:05 +1000
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

--000000000000867f970604d56c36
Content-Type: text/plain; charset="UTF-8"

Hi!

I remember that at pervious time bmcweb only support http protocol. And
after a update bmcweb conver all http request to https. Can bmcweb now can
support http or https at same time? Or is there a switch to enable or
disable https? Thanks so much!

Yours
Sun

--000000000000867f970604d56c36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<br><br>I remember that at pervious time bmcweb only su=
pport http protocol. And after a update bmcweb conver all http request to h=
ttps. Can bmcweb now can support http or https at same=C2=A0time? Or is the=
re a switch to enable or disable https? Thanks so much!<br><br>Yours=C2=A0<=
br>Sun</div>

--000000000000867f970604d56c36--
