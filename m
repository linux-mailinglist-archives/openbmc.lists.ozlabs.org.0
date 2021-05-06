Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CD6375CF6
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 23:45:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbnFJ75F5z303x
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 07:45:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qXwRRrSY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=vijaykhemkalinux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qXwRRrSY; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbnF16bSjz2yyb
 for <openbmc@lists.ozlabs.org>; Fri,  7 May 2021 07:45:24 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id x20so9920194lfu.6
 for <openbmc@lists.ozlabs.org>; Thu, 06 May 2021 14:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dQnha7ugSg5GlOiTtAXfJ4DQF65Ns41AQZhNDjwXhPQ=;
 b=qXwRRrSY8pXN/J8emxtOEt25Ow9TCVRO85RwuNoUUZVc2UezGHtkdUa1WTgt3f/z3r
 4gFEg1hUGikUc4bubSLlXa36dloQo0Hf1T/QUJ73cKWrVN3Bk4wh8A+0CUmfUGp7ab+X
 jTlduLCUcgOeOSEilWRz8qdEPy+MKODMwye6BxvpBYR5/AZ33rcyRpy50pIO1wpx9Ajy
 /Hfy1ueN70RTsAHeFSZ/hWFVNx7hE4EAoU+s8BEjB9/7njUAkZHnWSj4qS2IYMTuoF4U
 Fwypoy0yUx/pZENtPEm/FFf+POKyQz7HGwqZCvkQTUnKtCEmRku81PmL/snXDZUfaXqK
 mNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dQnha7ugSg5GlOiTtAXfJ4DQF65Ns41AQZhNDjwXhPQ=;
 b=OI7pUVs8uubh9wnhdWS9NAzOUobnuyUv77iounH2ix8oZ1fmR1I8FJRkJcFsB7CTax
 A+YOwQ8o3v4cElls4HvBqIGryNpcE4YRtlNQIPVnJ6bKS3kIu+knZmXKQbWrhA9RpJw1
 cyzw6Vq6VX+krMKHO1PwwcvQbE+kdY3oqHomyBWjvtsBy2p/QL4EyAIwzt0HZnbZXgQz
 1tdSjwsrgiHS9A5ThyLW6cCncwSpoII9YqXnEXOsk9VsXl8jzaO2jUK6eibhwdz1lF2n
 T1BvXH1k3TKFeSKSYdsNozl2JR759uJDBS+0tbLlnIIij9Z3P4eP+HQjPqA3afYCQZB5
 y9gA==
X-Gm-Message-State: AOAM532nEW5jfEsDvXNamnHGy+fNdjM78IqkB1awDari8Z9bqbbvATo+
 ejwWtZYQIb1xW8AP2XV1ABOLnVnWE8okBKmpL6zT5yy1Y2o=
X-Google-Smtp-Source: ABdhPJyHANHNPY02yc5NKREnzpGJMtiCVGBJMbiukeHBnJNZUjI+3ox9zI+QrJBEogU/b1/gFs/Ji4/O4QzkVwSg8jI=
X-Received: by 2002:ac2:488f:: with SMTP id x15mr4271994lfc.413.1620337518193; 
 Thu, 06 May 2021 14:45:18 -0700 (PDT)
MIME-Version: 1.0
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Thu, 6 May 2021 14:45:06 -0700
Message-ID: <CAJTGxZGc=p4gsYuAJe_4y=4UHOFmR-MLJWjrPq8iwaE-k7dQVQ@mail.gmail.com>
Subject: Dynamic mux detection entity manager
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000003031b005c1b03add"
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

--0000000000003031b005c1b03add
Content-Type: text/plain; charset="UTF-8"

Hi,
I have been working on dynamic mux detection through entity manager and
initiating a driver. I am also looking for nested mux which will be behind
a mux and will only be visible after parent mux initialized.

Along with this, I am also looking to support gpio based mux. I have added
high level design, it is still a draft version.

I am looking forward to having feedback here. It is up for review below.
https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/42971

Regards
-Vijay

--0000000000003031b005c1b03add
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I have been working on dynamic mux detection throu=
gh entity manager and initiating a driver. I am also looking for nested mux=
 which will be behind a mux and will only be visible after parent mux initi=
alized.</div><div><br></div><div>Along with this, I am also looking to supp=
ort gpio based mux. I have added high level design, it is still a draft ver=
sion.=C2=A0</div><div><br></div><div>I am looking forward to having feedbac=
k here. It is up for review below.</div><div><a href=3D"https://gerrit.open=
bmc-project.xyz/c/openbmc/entity-manager/+/42971">https://gerrit.openbmc-pr=
oject.xyz/c/openbmc/entity-manager/+/42971</a><br></div><div><br></div><div=
>Regards</div><div>-Vijay</div><div><br></div></div>

--0000000000003031b005c1b03add--
