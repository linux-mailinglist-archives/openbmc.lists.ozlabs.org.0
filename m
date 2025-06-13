Return-Path: <openbmc+bounces-217-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2610AD992A
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:42:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJyB51qHcz30WX;
	Sat, 14 Jun 2025 10:41:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749828160;
	cv=none; b=SGrITTCxzu0Q8RVIvqgdre8OclwO6t3ncS2s+dZymBGNFB0d9DJ4difGzdYueAkyWRhls1mOChI0pCQ6vx2FAvW7adsQr1Q2rQa0Cu2Hh15PRgn5fyngFHCEEYy68rWHr6pY4y7QIDQUkXTBNnQaFOHEZhFAP1qgljyAFcSOoKYF3Ws2nDVXacNpLfpcU34UGkiDrrUgcIy7aG2379jT+6uFX30+G6Q6tP+tvMQkRe2C0psdtFSJWrjklUKD5cph4TtaTH0mgRBqJ9w/Xq+Jfefs+O9RILauqEN5NK5pdrbZAl29+cM2A8hN7ssj7MXnpNHcmpm7FQuTyS+tgtau+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749828160; c=relaxed/relaxed;
	bh=o6T/spH3CSp0kqe8yzTywdjXbBdhCyR0divkqvI/frQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=d1BO5Z2TTaR2Otfi10xRHidtKxTGZfCyswDJmYhmt7dTt8Q1JjGtf9UEQgOmsdQb05cg6POYNbv8vsfCtU4vQSHJCbIgqaKOs6Ne+F6SJXovkDtUFIdcTSQyNd0CmdAWQyiLa9KC6ZmZ66/Ydf97C6PiOH2uZDsWirRkMrsKyi/D0kJeiGLMWdu/MOTygHCrAnl7a2KiySaNcPYVPNL9V+zul7b1k7D+yDWsHW124hAh40FtgGOj85MJ5b3ZIi49UTDqfdvSEex46KN4siRXI+BWN8IP9hF6YmszQTt+Fl5PKogZLzv1Y75ilFfJPmgIim44omRw6uU+0ucUT+U8AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A2uM/iXp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=bsneha309@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A2uM/iXp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=bsneha309@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJjnW3LYqz2xKN
	for <openbmc@lists.ozlabs.org>; Sat, 14 Jun 2025 01:22:38 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7481600130eso2600084b3a.3
        for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 08:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749828156; x=1750432956; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o6T/spH3CSp0kqe8yzTywdjXbBdhCyR0divkqvI/frQ=;
        b=A2uM/iXp2pE5FLy6Wdj2Je98FyG4Pq4+7Z4zhPYeHaJXaC4Hahn2RSvdPr9SdVcff5
         Wyajm2TIjV7lCsM7UCeZsbDv9pAMl4UOQNnettibn11uNdto89LXACxjYG+0G8tbAi0s
         HhaBIbPe/zjjkWX/ew47mOP+nMgDYs9aX19rHamTrUjaAd8tLiqhvbblsTZBfEpPQM5F
         dPCwcQGky/OdsaDJDnbqYfhnytbtTaW0tBR8XnwUR05nd9mka1UXoEFPmRDCbz3LXzXo
         rXKOovKRIMQ/0YML1aHEijkCTjfUbkGI/0rdaOxwxeqzpxh0MrjMGxoIoXp9NM/Bavfb
         9xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749828156; x=1750432956;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6T/spH3CSp0kqe8yzTywdjXbBdhCyR0divkqvI/frQ=;
        b=vBoWR2mWXT4RQv8ocB7QKqzza5/8BhNKMsIURPSexFR7p7SErbAV07WidEFOvwEleY
         qBfj8+4mn9DmfnQ5sLSkUD4GBDXm7QyPBITw6QDAzn3FDUVyRVecepnWgU9hXGWb/RMK
         ZuFLe0eeQcgalvZvls3UMn3LAmZm90HlaEn/lnDlbbPSV7MidEjEjqWAcopJc3dGXAOe
         HJrrcV+9IjTkryBqwGHhCFAz/xIzn/F0igzneFH10cZc6d//BOBEewbjfUohAeF/EwWD
         fPpjz75eYcd+b9I5jl/xYiv2COVBtMM2VLkbdjDllaHQNN2x30kpzXm+XqjUbxgCwSww
         b8PA==
X-Forwarded-Encrypted: i=1; AJvYcCWussWhbZBkmCRjPk+ZBRw4mjiJbsW8keN5K9GTr7vHhjTCrVRUCgPkv02lIzIxFohpA/vDgjIC@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPrxeZRrvvUQtstUheRDpbxyq9okonxRbSJ4xZ7EOPYQ1F9vQY
	ZBGc7jJElfdB3egul+Q45tSay8/x6DAC+9Rmtfy4CIU73NkjBT3dK4p+9IWCo/U8/iOD87E+jTs
	8v8WPYBWWEPenMzWdTKMh8i7uO5gRat09BB8Q
X-Gm-Gg: ASbGncvNKSpWoIMVm0H5OW/Q+gJAqfYTU4q46p2xiP/eP+UVJA1j0hfZv40wiMww7mA
	FWVaBMgoWB5b1N6axhBJtzT+T7AsrDhex+S7lUrwbICINJOee62Fad+JMIJt13v2vAfCAROkqea
	4566WCF/NZBjmS7bTCBBXD/S6CuFLz5Y3csY0cH1l4Sd6z0sxXqnoC
X-Google-Smtp-Source: AGHT+IG2UdTsPY6ynFbgLqIfKNvuuKRRISDMb00ADoBB9KuuZclnd3RDqGx60zOHhGIQQgC/itBn/AUeeTtzjHcyORE=
X-Received: by 2002:a05:6a00:8a04:b0:748:2f4e:ab4e with SMTP id
 d2e1a72fcca58-7488f6f8569mr3413607b3a.11.1749828156162; Fri, 13 Jun 2025
 08:22:36 -0700 (PDT)
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
From: Sneha Bansal <bsneha309@gmail.com>
Date: Fri, 13 Jun 2025 20:52:23 +0530
X-Gm-Features: AX0GCFtjjwyZST_m5WZwKzpJQRHXUYyulIS4R_LOwhIXPLzZxyB0e8fNQJ0dAF8
Message-ID: <CAN+wxKJMxxnm2egxVFpxhe2Z96ZTdZ2ADCbVOc-_iq-5u77V5Q@mail.gmail.com>
Subject: Query regarding Libbej openbmc Library
To: kasunath@google.com
Cc: Brandon Kim <brandonkim@google.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000aa86650637759dda"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000aa86650637759dda
Content-Type: text/plain; charset="UTF-8"

Hi kasunath,
This is sneha here, i have some queries regarding libbej library and i will
be highly obliged to you if you can help me out with it. I was passing the
transfer handles got from GetSchemaDictionary to RDEMulitipartRecieve and
then using the bej data as schema dictionary which i further passed it on
to the libbej library for decoding and encoding. But when i passed on the
RDEOperationInit data as encodedPLDMBlock, i was facing some issues.
Can we connect so that i can resolve few of my queries?

Thanks and regards
Sneha

--000000000000aa86650637759dda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi kasunath,<div dir=3D"auto">This is sneha here, i have =
some queries regarding libbej library and i will be highly obliged to you i=
f you can help me out with it. I was passing the transfer handles got from =
GetSchemaDictionary to RDEMulitipartRecieve and then using the bej data as =
schema dictionary which i further passed it on to the libbej library for de=
coding and encoding. But when i passed on the RDEOperationInit data as enco=
dedPLDMBlock, i was facing some issues.</div><div dir=3D"auto">Can we conne=
ct so that i can resolve few of my queries?</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Thanks and regards=C2=A0</div><div dir=3D"auto">Sneha</=
div></div>

--000000000000aa86650637759dda--

