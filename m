Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CA76F75C9
	for <lists+openbmc@lfdr.de>; Thu,  4 May 2023 22:01:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC4TN6dDFz3bh9
	for <lists+openbmc@lfdr.de>; Fri,  5 May 2023 06:01:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rIyOre2a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rIyOre2a;
	dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC4Sk6dHqz30QQ
	for <openbmc@lists.ozlabs.org>; Fri,  5 May 2023 06:01:09 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-3ef34c49cb9so844481cf.1
        for <openbmc@lists.ozlabs.org>; Thu, 04 May 2023 13:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683230464; x=1685822464;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uCaixQBHhl42Fb2rT0LM7bjhFV8gsQbj7xUsmGduqkY=;
        b=rIyOre2ax99xX09VfH58wNXswq14ULbonCBQyPWb/HPprvdchKSRYYJh9VHEJy65Gr
         HGkp7+SNCYpx+ThGKhWThFEMOa4DHN/iqMhCGusF8HoVmgnx40ZaCCZ2Ja9hBci/H75L
         twlQBoWKc0Ov9L8/cxHojk5M2XS/kC4VmWk3tN6QG5HupOC6mh/timxEMNrd7FnogrVV
         5yD0e8nRvKzm/RZ+b8oWi8NTFmVfm92o08ezgkQXp9KkyK2zXGRW/EHGR2O17QtxHTtc
         tcehibIxdLKygeQunzDr73algO2QRYO0pkb8TTTBNyD/UUrZaAd32KN0/6tsuy3urQuV
         V5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683230464; x=1685822464;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uCaixQBHhl42Fb2rT0LM7bjhFV8gsQbj7xUsmGduqkY=;
        b=JB1nz1pc9qYQN2CV8DL2x8afEQnUkukwxf+xuQKIdHjuRA904Afezw2eO4jhQzg4Mm
         U7lXEUSkWnrNToRjfbrTpGSr2VzrcYZcTkVlwJxjKZ5tq36/MCoCnTcOgwvsPAEkADDY
         X8jJTb+yrnrfsPFu19kZl0uhPkkPMYOzdX/g9yz2oQizHa6/7rgu5Mh+q5MTEQD7EidX
         FvCyhPtK4/QcwQxFlbv2gvLpGs1lrIOi6EVS3qD8puw2vfb3mblF8tQT1Glh7rXHObyC
         3eQ0meS9/HqLoz/tWOEhFvU5TGdfn6CWs/KDVhSb/40DEq9r4/KA61BdjWA0CyWIsxbz
         qEQg==
X-Gm-Message-State: AC+VfDybPyJQyPW5NQC0Z1myS6IHzGpBxNX4cM4BLRuIwbFBOXqwp1vX
	HMpgoHOEcjVS4YS8sHSelB/T7Kl0+vzOTt3rmAgcvw==
X-Google-Smtp-Source: ACHHUZ5nC1q5XSjEb3TkBEa4jKDRjBm17lNyqp3zeXRbJGs5ejHNpZsBKG8m/+bW99xHbKYBojdwgg7J8ey+qxnMSrM=
X-Received: by 2002:a05:622a:112:b0:3e6:81be:93b3 with SMTP id
 u18-20020a05622a011200b003e681be93b3mr79372qtw.5.1683230464409; Thu, 04 May
 2023 13:01:04 -0700 (PDT)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Thu, 4 May 2023 16:00:47 -0400
Message-ID: <CABoTLcQNTwxi5nVRG8yRoDrrtV-pO-WA1ubtFVmnLnebPLucmg@mail.gmail.com>
Subject: entity-manager: SBTSI and hwmontempsensor
To: zev@bewilderbeest.net
Content-Type: multipart/alternative; boundary="000000000000e8745f05fae3a1fe"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e8745f05fae3a1fe
Content-Type: text/plain; charset="UTF-8"

Hi Zev

In
https://github.com/openbmc/entity-manager/commit/e22143df37faa0b0f5e2918d2f505b9f64e74b0f
you "removed devices now managed by hwmontempsensor".

I'm trying to figure out how to add SBTSI support for the TYAN S8036 board
(AMD Milan). Do I just add the device to the DTS and then reference it in
EntityManager board configuration via its bus and address?

Is there still a way to dynamically get Entity Manager (or now
dbus-sensors) to bind the driver or does it HAVE to happen in the DTS now?

Thanks!

Oskar.

--000000000000e8745f05fae3a1fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Zev</div><div><br></div><div>In <a href=3D"https:/=
/github.com/openbmc/entity-manager/commit/e22143df37faa0b0f5e2918d2f505b9f6=
4e74b0f">https://github.com/openbmc/entity-manager/commit/e22143df37faa0b0f=
5e2918d2f505b9f64e74b0f</a> you &quot;removed devices now managed by hwmont=
empsensor&quot;.</div><div><br></div><div>I&#39;m trying to figure out how =
to add SBTSI=C2=A0support for the TYAN S8036 board (AMD Milan). Do I just a=
dd the device to the DTS and then reference it in EntityManager board confi=
guration via its bus and address?</div><div><br></div><div>Is there still a=
 way to dynamically get Entity Manager (or now dbus-sensors) to bind the dr=
iver or does it HAVE to happen in the DTS now?</div><div><br></div><div>Tha=
nks!</div><div><br></div><div>Oskar.</div></div>

--000000000000e8745f05fae3a1fe--
