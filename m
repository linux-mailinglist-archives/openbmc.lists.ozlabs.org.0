Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEDD3693D5
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 15:40:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRb4w1Mzlz301k
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 23:40:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uKToH/ZW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uKToH/ZW; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRb4j1SJvz2xYj
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 23:39:48 +1000 (AEST)
Received: by mail-oi1-x235.google.com with SMTP id e25so19251379oii.2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=9JrgiVIvd+fyzdV12/x98RospITiurJpYb3Tz1JoHA8=;
 b=uKToH/ZWJY+4UTvayjyjaLdSzwLu1kdUEy3uiv2tvN0/BlO4JHQh0k9vyfgT7XCgOd
 9OnbMqJK4lx2exKoMpYDA7K4izhAKYr+0DaZRJppSuTXadb/XnjdpM4Jex7cXxbBlOYe
 CwWeGuzZ6qHtCzIwjYrRppgR7nfZQFWbkprG5TdgXQrqVeMrMOQjT4bJj/9gZi8U5qaf
 u8FQbICoLsq0U3DxLCjgnMe7Y1ppZq5EGoP+h1kGppf6yKkLxNaHH5QfnSTJkVKdwn3n
 sQfOTLj9R3QWoMijKe0CzM6h6NVHljUY8hmxc0EOEBk9d37tDGLtF7pjtWxfHvjmN8vM
 /LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=9JrgiVIvd+fyzdV12/x98RospITiurJpYb3Tz1JoHA8=;
 b=gX3B8AARw5/eXwpabxYzpiRlzNPRUt6/GPagj5wrhxmYID97lZfg4UTTr/jDqt4uqR
 qcaoQUoEbgmJRpyf8lxFQexH4ipXD3OK+LPNnnRCWzCyLgrD5ilQRSf7JWnOhBTR9T8c
 7+MbWz8FpvSV/C2PzJ9oLDaDqaalCCy/rVK8JkB2RGXOS0/wLo7EU03NYy52e34SZYVg
 mgwnQP4T8k8dZxN++rOyhXaeLbNj2PaQboTORpZbsAGgxIrAyOo0PGat+TiRB1Qa3GsZ
 zAn94UdhQD2HaWmrfZwijfCL8gDWqp4PZGMqMDAwqa06BsPy97JL37XQa+o5NzWYELqV
 8Bhw==
X-Gm-Message-State: AOAM533ednnfGMn3J50Nr6ETWmU1Cb5ZgHvDCJd47sWAYUvlAQ5rWA0G
 UDVB8JEczz5nqjf9mWCxSk29FIi2Yk8=
X-Google-Smtp-Source: ABdhPJwQH8+79YNv+p3+jdNK9BqWQzMaoa5I3/qxV5HM6QNmq3GIRtD5W5EHhmRXOAwBDvdLtkEQsQ==
X-Received: by 2002:aca:44b:: with SMTP id 72mr2811664oie.68.1619185184935;
 Fri, 23 Apr 2021 06:39:44 -0700 (PDT)
Received: from ?IPv6:2600:100e:b030:2794:8496:a053:565:ed92?
 ([2600:100e:b030:2794:8496:a053:565:ed92])
 by smtp.gmail.com with ESMTPSA id v81sm1259994oie.13.2021.04.23.06.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 06:39:44 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: PMC
Date: Fri, 23 Apr 2021 07:39:43 -0600
Message-Id: <31F00F60-DF2D-40FB-A9BC-85538975398D@gmail.com>
References: <YILLjQfgD4Q2vH5L@heinlein>
In-Reply-To: <YILLjQfgD4Q2vH5L@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: iPhone Mail (18D70)
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

ADI is working on a reference design using an Open Compute PMC spec. I will f=
ind the spec and get back.

Sent from my iPhone

> On Apr 23, 2021, at 7:28 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> =EF=BB=BFOn Fri, Apr 16, 2021 at 01:40:40PM -0600, Mike wrote:
>> Is OBMC ever used as firmware for a PMC (Power Management Controller)?
>=20
> Hi Mike,
>=20
> We were working on a power management controller as a potential design
> option for OCP Rack v3 and we presented an early look of that work at
> the 2020 OCP Tech Week.  We haven't made much progress on implementation
> at this point though as we've been focused on other aspects of the ORv3
> design.  As code is available we plan to deliver it on Gerrit.
>=20
> Is there anything there you'd like to collaborate with from a design /
> requirements perspective?
>=20
> --=20
> Patrick Williams
