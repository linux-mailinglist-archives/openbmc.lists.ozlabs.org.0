Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E13B69F8
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 23:03:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDKnz5MwPz3bV6
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 07:03:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YUE58mMW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YUE58mMW; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDKng6MZgz301K
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 07:03:01 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so20298030oti.2
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 14:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=qSWG2QiRJZoj9VV3y4lDjcpRar+CMwuyiYHA/RIFYIk=;
 b=YUE58mMWES4EVgQmenvepKEVvwkmKqB11bBQV+mMJo4P8peT0nW+EuenB2XLawPEpN
 5cY3NXO1yjxbFt3NZZGaAwVQBvbIzKUVGTsvGbFcCka0jvWfWPxDdPcCD6tozbDNb6LP
 zu6jD5Bhddh3lwOPcJFvNf754U9qAfR5QpdTDxelkbMtfodOCJYUxAO3L4JWu3q1mRkB
 CKsOclbVAUdGAYr/9A8Srdk4HFOXOVGuIXlTzocHe4q4RD0Yk+1nH+qnhvCAUVMmssQk
 bJysGU1VY1RJdhq48r0uL+dIPVgkEu7Tvcr11goPLT/KXLlqjiDPHQYdBHPi2C32b7IW
 ULHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=qSWG2QiRJZoj9VV3y4lDjcpRar+CMwuyiYHA/RIFYIk=;
 b=X3zY8EmVzL+nr0PT2k5Y4cdInHE7qwbA5t4VEGTpdA8ETFnxRrd3gDXXx0s7ssqps1
 dd6RxJu0Oj/cQ5jfi/5Embl9yG2CfHmjy8ZSm1TLHRFhkxLbk/wpwetdbJO8y+40N/zW
 BzG7grg0WlCLrrmxMVRFR4R4oanGPX8C0NpzxIx87LeZNb5mnQjoz1PyrvfhzyZkGjHL
 euuMtrzlS7EjMXme2Qn2UV+qc5YTZl+i6PlfXipRlrMrr5SbAYJfEroexwf/eb0sFYxm
 svBd/NtdqmnI/8xTa6VZ5fcBmFMo6OxLX63n05XQ7w7+fkBB3Xh6d7h85PQ2ZTPwTyVP
 Ok0g==
X-Gm-Message-State: AOAM531jKZhTiYKcwO0arIKJ/avq88UbC6ODriZYQuxM8CvgBaIbO3EJ
 H0tO4mCMzPPwFIDK2Afa5ol6e62lf30=
X-Google-Smtp-Source: ABdhPJy2HfSChyS9JBB8DZbelJHin6ZlvgQlLxqcKwVmgVJ36wVRRV2yANGcBK+m2W99lTdA3OHXCg==
X-Received: by 2002:a05:6830:1be6:: with SMTP id
 k6mr1312158otb.219.1624914178597; 
 Mon, 28 Jun 2021 14:02:58 -0700 (PDT)
Received: from smtpclient.apple ([2600:100e:b000:1875:9053:bada:25d7:85f2])
 by smtp.gmail.com with ESMTPSA id v42sm3616723ott.70.2021.06.28.14.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 14:02:58 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Inclusive Naming
Date: Mon, 28 Jun 2021 15:02:57 -0600
Message-Id: <53876421-2E01-4546-BBE5-B724568C4F0D@gmail.com>
References: <20210628193850.gylhta7melpevjju@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210628193850.gylhta7melpevjju@thinkpad.fuzziesquirrel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
X-Mailer: iPhone Mail (18F72)
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
Cc: openbmc@lists.ozlabs.org, Sagar Dharia <Sagar.Dharia@microsoft.com>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Brad,

The SMBus/PMBus technical committee is changing the master/slave terms, but h=
ad not yet voted on the change.

Let me know if care and I can get a draft to you for review.

Mike

Sent from my iPhone

> On Jun 28, 2021, at 1:46 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> wro=
te:
>=20
> =EF=BB=BFHi everyone
>=20
> I would like to highlight this addition to our documentation:
>=20
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/44522
>=20
> Please review, and if you have any questions or concerns please voice them=
 in the gerrit review, or you can simply reply to this note.  Your
> TSC intends to wait a few weeks for feedback, evaluate whatever feedback i=
s received, and go from there.
>=20
> Thanks
>=20
> -brad
