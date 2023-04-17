Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A686E41DC
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 10:00:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0KGY4JW4z3cfd
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 18:00:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CHxDSjKk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CHxDSjKk;
	dkim-atps=neutral
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0KG03y1nz3cKj
	for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 17:59:35 +1000 (AEST)
Received: by mail-ua1-x931.google.com with SMTP id w19so7322735uad.7
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681718371; x=1684310371;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bRRJuN2cKtD0J+FjBDF0+kXVy6w81a3ibbOsNhmekts=;
        b=CHxDSjKky430goIjFq1o5ghNi7TmghIngR2KIp4Ed0JEJC+PXaROGe7WFibFlv2zxU
         WRHkXfP3VcFvQl94DVK5MU1KP717o/1AogQ5X6IL76TOIdomMX66Tu/KrKmyPNo7Ia7P
         cUSm8J5/6LZ94EbIGKRjm9+2PQr7JD/fOV4frC9oovtQI+h1oK6Jbb3kq7TNIfL7jQdE
         ylCLHhfXjmOo4vc3hxEK+ziSyVwwvp4KHIhUt0bgjbKMhCgVxc3D9oOjoTTudtIBfYuX
         xrqJ+Ulst6TANrzt4+6j5fUoA3wwjYT/2RrPmzO6JJweoms5mR1WKqLJdSquHSMWO4pG
         m/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681718371; x=1684310371;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bRRJuN2cKtD0J+FjBDF0+kXVy6w81a3ibbOsNhmekts=;
        b=ZzUz6glwDkX7IXWkCYE62Q5ACts3DdTihpXCWnrbysDaoLQQh5G+CNu6qqJlPlsnyX
         3piKhg3J4MrFFEKqIrOh1EMmaIjd6vPCnPUJULogYCdPbTl2QsIsEeCZzkukSA48fN7c
         3R/BDt7SBq58Ko5H+1MXNWsZQlZsTRq58kdRd5piRVmec5jVGnUog0Sww8xHdfFTaZ57
         wabZnW+HJi2UnAAnkUSKZJiFJj8w1A5ENRbyLuk0J9I10DzMgalb8KIvCwxVwfeaNe8f
         3Tst+J/X0qc7ku9xYsv31UffEEF0k7Aj9GAYhxFdv8Oe6eX/ckF2Qdr8IQWPqe4B5T2J
         Txiw==
X-Gm-Message-State: AAQBX9e6mqeWF2kXKuRhIc+Co8RygQ2mBe4U+FJAqUwX7zT3/4tJMtTo
	+APqRtKOkE0xouMmI4CdKCzdewN5AOQQGZvzjkV4vvswxm6iZg==
X-Google-Smtp-Source: AKy350aZLu+nGNlQTkr9n1esGP4+PNwqdFm6UF4JBWgTLvRmrRkht+zvWpDFvjM0gAp3l/KF/zfqQcu+61P9F7lEJpQ=
X-Received: by 2002:a1f:91d5:0:b0:42d:7181:7c63 with SMTP id
 t204-20020a1f91d5000000b0042d71817c63mr7511066vkd.1.1681718370873; Mon, 17
 Apr 2023 00:59:30 -0700 (PDT)
MIME-Version: 1.0
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Mon, 17 Apr 2023 10:59:20 +0300
Message-ID: <CACSj6VWmDO4o17M4ubiw3msQTChXPuJBdocFJ+Q8R0yYVfdA2A@mail.gmail.com>
Subject: 'phosphor-bmc-code-mgmt' throws 'InvalidSignature' error even if
 'verify-signature' is not enabled
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000001bb53405f983920e"
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

--0000000000001bb53405f983920e
Content-Type: text/plain; charset="UTF-8"

Hello!

By default the OpenBMC tarball is generated without a signature.
And 'verify-signature' is a separate option which is not enabled by default
in the 'phosphor-bmc-code-mgmt' recipe.
But still currently in that case when we load OpenBMC tarball,
the 'Software::Version::Error::InvalidSignature' error is generated in SEL.
I think it is not right, so I've proposed a patchset that changes this
behaviour.
Please check:
62521: meson: Disable 'verify-signature' option by default |
https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/62521

The patchset changes the default API of the 'phosphor-bmc-code-mgmt', so
this message is intended to ask if anybody has any objections against this
patchset.

Best regards,
Konstantin Aladyshev

--0000000000001bb53405f983920e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello!</div><div><br></div><div>By default the OpenBM=
C tarball is generated without a signature.</div><div>And &#39;verify-signa=
ture&#39; is a separate option which is not enabled by default in the &#39;=
phosphor-bmc-code-mgmt&#39; recipe.</div><div>But still currently in that c=
ase when we load OpenBMC tarball, the=C2=A0&#39;Software::Version::Error::I=
nvalidSignature&#39; error is generated in SEL.</div><div>I think it is not=
 right, so I&#39;ve proposed a patchset that changes this behaviour.=C2=A0<=
/div><div>Please check:<br></div>62521: meson: Disable &#39;verify-signatur=
e&#39; option by default | <a href=3D"https://gerrit.openbmc.org/c/openbmc/=
phosphor-bmc-code-mgmt/+/62521">https://gerrit.openbmc.org/c/openbmc/phosph=
or-bmc-code-mgmt/+/62521</a><br><div><br></div><div>The patchset changes th=
e default API of the &#39;phosphor-bmc-code-mgmt&#39;, so this message is i=
ntended to ask if anybody has any objections against this patchset.</div><d=
iv><br></div><div>Best regards,</div><div>Konstantin Aladyshev</div></div>

--0000000000001bb53405f983920e--
