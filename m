Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA55B4ACB39
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 22:24:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jszg537c8z3bP4
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 08:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aVQzXpE6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aVQzXpE6; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jszfj10WZz2x9Q
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 08:24:11 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id s185so18504253oie.3
 for <openbmc@lists.ozlabs.org>; Mon, 07 Feb 2022 13:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=ziwc5zPgL7tUZiNljhQz7kTXi5NkY29fAI9RmaNsgmc=;
 b=aVQzXpE6wkMfr222Tga/eepnwpZN88t43dRgJqrPyFgeDPQKmAS+nltuf0nrIcLB9X
 cxhhOIsJJh2DSYm0heqtUPMrtYaUpRKalyGy6lfR6yW1PWjfAbGmp72NbRv4KP7Ajv9/
 RddV4LOgfmcSlr91dGGQ7Q/kW6MkXfTbTehKaC/lA1jOycCDMs2XQdIdsxHgiNL7DZjF
 Fl4QtQs8snGiE3kt+ARS9tTH0qXNarl/ExaYsZO/IrPTzIFv/Le0BSXZS2NzsE7qRW0P
 pd5q4mTURDoLTJsXKS5Qtp+ItIE4folCr7XWYy4Q1gf+4FhCIZDHrU4wn8pGBNpIHTqn
 Hwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=ziwc5zPgL7tUZiNljhQz7kTXi5NkY29fAI9RmaNsgmc=;
 b=LopSHJYiDlD5uSalG+p2Cszk4UaKFqo0ELHEI5DnboIjAKTp3RLO/uHkWF+FLT1/BZ
 E5RE+xik9jo7uPECcvklQmUSSYkK7bHfrbqDqCKz887+Q5tHTC2mhbynRaumVhHcn1Zq
 nhQKLpDKJnUh6+PxBHSfokdGILGlGUcjFoZyTXVFtgRaXFJvPoh0VbjjT9X/l4lny5al
 j3DOB9lAeCL6LKyo2bt9Yi0Y4vgMntK+tOvFV7FgV5YUqbX93eSn2aJ7kg3Itf5dQbdg
 ebQnfC0ckxm5I6JlKmtFEOPkQqJ/s5gGX9F9wlA5T4edgR7oDf6tnITKAWhtWlRK62Nu
 7SQQ==
X-Gm-Message-State: AOAM533lhGfWrC07rgk3QlYZwY1d6+Fv8IBXnmxXXAg9fZtQImF9szzO
 oaflXsFU2Z4CuM+dnvf+QG2U3uIpmi1v8VQr
X-Google-Smtp-Source: ABdhPJxaq5hQ5ktaL/BS8jWt7/F3qcetl+sCz2Bf4LWCWwJTa/Z7y5ytM6iEaS5BwTehbMbAyASRPQ==
X-Received: by 2002:aca:398a:: with SMTP id g132mr392631oia.207.1644269047385; 
 Mon, 07 Feb 2022 13:24:07 -0800 (PST)
Received: from smtpclient.apple (146.sub-174-198-141.myvzw.com.
 [174.198.141.146])
 by smtp.gmail.com with ESMTPSA id b8sm4472347otk.36.2022.02.07.13.24.06
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 13:24:07 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 7 Feb 2022 14:24:05 -0700
Subject: phosphor-state-manager not installing
Message-Id: <984E9057-A98D-4988-8D2F-672FF05B38D8@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: iPad Mail (19C56)
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

I=E2=80=99m having problems getting phosphor-state-manager to build and be p=
laced on the image.

I have a layer adding it to POWER_SERVICE_PACKAGES and added to RDEPENDS..ex=
tras, I see buildhistory includes obmcutil and other files in files-in-packa=
ge.txt and latest, but nothing in the image.

Is there an example of how to include this?

Mike

Sent from my iPad=
