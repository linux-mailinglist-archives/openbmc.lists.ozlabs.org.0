Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 977A41F1E17
	for <lists+openbmc@lfdr.de>; Mon,  8 Jun 2020 19:03:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gfjF6mkPzDq72
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 03:03:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EHgvo7E6; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gfhS54WhzDq72
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jun 2020 03:03:03 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id a25so21435276ljp.3
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jun 2020 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rhnf4NzrFQ6S+Fw5zCwbGHU0UoqIasUQA0Nvp2dqNDM=;
 b=EHgvo7E6naZ0N9bv3sY9nC0cUIG08QLWSrO9eGphHYBxoINjxQtV+fyWKtf8VvtEB0
 uacg90eOQLKKar4tAdHJmQ5pYdICmoPzDrT61cIjaEaI8FmqQGh0zOUJuAZ2M/0XgKEs
 cqkrV0OC2DppUN8L6eqUNKNLFzN/Ffh1mrUUB1ZRBl6zX71EA5DvaMtqURarnke/p48K
 nZjKlUvGK7+PazRJMI8RHt96eDY1AeXlyUrHLi24il9v/V7M8QSZ/3OIYPFBjuUnVnTw
 83nLTAoBM6Rs/FkI+h9Rn3m2MtvU9i3PiL9pVvbUU5VqzaIB1QFAQJwwPUUXNy8YWSZ5
 qOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rhnf4NzrFQ6S+Fw5zCwbGHU0UoqIasUQA0Nvp2dqNDM=;
 b=uVF6AucLmSjcv3p1mOMGK2H13Uc2fu6lPFH7fp6/i94uHF2oRGfEfJnOpkQJP+qBHA
 O8zdSdZ/7lg8JU2PuyrEkcouReBxb8hsuQoEp3j89Jbbxlai9nGdOk0/tXDyxihiJxdM
 cOZDXVtP3LWgatGr/87IAmdNmnc0HrRs1V7V2moxAAZOOMtDFrUsuVfy7tpn1ROhywJO
 8Y0who2vf5VD3chrzOfRZVTubEkwLqOB3eVI/KTHvbba79ZJXRjXpW6eKY4MESFaffap
 emf7ofgw8otGcjMxbVzpin6CNsM2528ofpjd2DmdFqX05fw8s5HJaPgYei186i8md8Rl
 xGZg==
X-Gm-Message-State: AOAM533JepMWyENvZXWp3PO2yISYjWkzrHVjKlR3TYsgJlVLzS5hLkU1
 7F2t8M+4uv+1eYsuP7SVgnm9OcXYOZIc1TvXHoBmRxZqSRo=
X-Google-Smtp-Source: ABdhPJwY6aUX2c48zppbBHW05KYwDVvJz/5M/GajMpYgtnlKS+VUq9HxMyrtJbSwq5M/1tTV33pZ9dMb1rXozMDLD9g=
X-Received: by 2002:a2e:9a09:: with SMTP id o9mr11496597lji.323.1591635778114; 
 Mon, 08 Jun 2020 10:02:58 -0700 (PDT)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Mon, 8 Jun 2020 10:02:46 -0700
Message-ID: <CAH1kD+actWFeM5ELXC5SzfgK-CM3Uj8UsiaPikTAOkGscsg9Sw@mail.gmail.com>
Subject: OpenAPI for bmcweb
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002ae78e05a79595cd"
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

--0000000000002ae78e05a79595cd
Content-Type: text/plain; charset="UTF-8"

Hi all,

I recently started looking into using OpenAPI for Redfish as part of an
internal project, and I want to try using some of that work in bmcweb.

Right now the OpenAPI support for C++ doesn't mesh very well with nlohmann
and boost::beast. Assuming that we can handle the integration, what
concerns or objectections should I keep in mind?

When I brought the topic up a number of months ago, the biggest issue was
increasing the flash size usage. If a solution is made that doesn't bloat
the image, how do people feel about OpenAPI?

Any other thoughts or ideas on the topic?

Thanks,
Richard

--0000000000002ae78e05a79595cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I recently started looking into=
 using OpenAPI for Redfish as part of an internal project, and I want to tr=
y using some of that work in bmcweb.</div><div><br></div><div>Right now the=
 OpenAPI support for C++ doesn&#39;t mesh very well with=C2=A0nlohmann and =
boost::beast. Assuming that we can handle the integration, what concerns or=
 objectections should I keep in mind?</div><div><br></div><div>When I broug=
ht the topic up a number of months ago, the biggest issue was increasing th=
e flash size usage. If a solution is made that doesn&#39;t bloat the image,=
 how do people feel about OpenAPI?</div><div><br></div><div>Any other thoug=
hts or ideas on the topic?</div><div><br></div><div>Thanks,</div><div>Richa=
rd</div></div>

--0000000000002ae78e05a79595cd--
