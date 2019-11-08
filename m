Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E808FF52C3
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2019 18:43:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478ngF3H4tzF1Hj
	for <lists+openbmc@lfdr.de>; Sat,  9 Nov 2019 04:43:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WbJ5UqV/"; 
 dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478nfS71TZzF7Xv
 for <openbmc@lists.ozlabs.org>; Sat,  9 Nov 2019 04:42:40 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id q2so7095972ljg.7
 for <openbmc@lists.ozlabs.org>; Fri, 08 Nov 2019 09:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1wFZs4N6yM1BcNW4a9Ru3vTJqW5InA5so4beOMKL9+4=;
 b=WbJ5UqV/aPuyfBQ0mUnuD1lNux71Xmc7adxTBQevPmzBPk+zJVNexexI+o+6xhWvBO
 QbsmSmefw/VUi4NB5nEeW5HY6KZhWyuSNI2L+hkE86mPW8SgLZ2lDJVy7E9Pd/p1MtIz
 iVR92of/yum5efBAFnJu2kX/cIoHN6OzHJENXORG8bkSJaWTHD6tLCXlsMq+frxyiQE3
 rhWWy8HU52Um9l+dHCTLtjpb2DCbvGub1C7+OtzL8B+U+OwraqkwvUyauYSWV/kDyX0n
 tIzwAUQR2AVIOKR0/H0uS2GXI/UNec6Q/u38EOGU6sBlGAID1q4ErJiajKcXSZLxNzT/
 bPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1wFZs4N6yM1BcNW4a9Ru3vTJqW5InA5so4beOMKL9+4=;
 b=DK6L4U5sMjhTuRpkVexoE2M7cXR99LzbGzKBNkaHwicKmClqZq82/NlGx746T+ZQ15
 3m80aliw5rH8jG0YTsjESJjv4uYDqtqp4+5h0tcWwL9eOBlvHrZSQ8FOI7ztjr1zInRA
 TCangPXwKj7NGWkic9gVM2xCje3A624OZVAwuRhtAGgvBfnuDsfYo3YyIWK+icml2B3R
 kwd/tkCQUsf7vorCwC6haEec/pZhcYFsMNwn3RdlUAdO6CJ+FKWCy+7GsmEsn5vU1HZP
 9oIrkmBBntEfci414LRfb0XMK/ybrgI7TaFjm99NCV/PBZ7KXcncYHXA148tjPZxitOk
 Ugtw==
X-Gm-Message-State: APjAAAXYQyF17WMar+0asxfyleugGuaOz3Kag7/TD1SWOkTtFDOi8QPV
 d+Xrn20qSxHhlKh+M9qfnD66FO2obq87bzgZi4D3PoY2
X-Google-Smtp-Source: APXvYqwiaroSnT4s8NcwvEu85OQb1KsZA9Rgg+0jJwVJxUAtwzgHtMB8MJRLY3fXoUEOeaHKax4Rel1ttSofzTP/o2E=
X-Received: by 2002:a2e:9cc4:: with SMTP id g4mr6699093ljj.99.1573234954957;
 Fri, 08 Nov 2019 09:42:34 -0800 (PST)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Fri, 8 Nov 2019 09:42:23 -0800
Message-ID: <CAH1kD+YQNVKSmH1qP777b2ch6vt=8EENkeE2b7VB_bpZh-DROg@mail.gmail.com>
Subject: Redfish Code Generation
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a3d39a0596d94e5d"
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

--000000000000a3d39a0596d94e5d
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I was considering work on spiking out a tool to parse Redfish OpenAPI
schemas, and create some minimal code generation.  Most of the existing
swagger tools I've found for Open API are either for clients or too heavy
weight for embedded use.

Has anyone in the community looked into this subject?  Would people be
interested in such a tool? Are there any pitfalls that people found that I
should be aware of?

Thank you,
Richard

--000000000000a3d39a0596d94e5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>I was considering work on =
spiking out a tool to parse Redfish OpenAPI schemas, and create some minima=
l code generation.=C2=A0 Most of the existing swagger tools I&#39;ve found =
for Open API are either for clients or too heavy weight for embedded use.</=
div><div><br></div><div>Has anyone in the community looked into this subjec=
t?=C2=A0 Would people be interested in such a tool? Are there any pitfalls =
that people found that I should be aware of?</div><div><br></div><div>Thank=
 you,</div><div>Richard</div></div>

--000000000000a3d39a0596d94e5d--
