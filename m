Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9405A7AE
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 01:35:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bCmY5JdnzDq7g
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 09:35:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KKPvPHwv"; 
 dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bCm40M1kzDqxq
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jun 2019 09:34:43 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id w25so15976289ioc.8
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 16:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oELHznPYEZxCRNNymAE/R64Ag8jlrBK43GmQtNTktHs=;
 b=KKPvPHwvzJhFZML6WVmntXTU/9nUwtwq6UxGzE/20cTLY5c0qrWOt5ZJn6h1NVcapV
 q/I1E5NkvTVieEtZVtcJbPL5H4pQbudmllGxFjis+rOfHvQAiGATu6CBFuhTxKKTbDiN
 FzIrSzIC3YGaF+oLaZXjieCtyDLDEsVqcjaWI9yhqbmwfdE8P+dc6vUR9kFbmPNjNYWv
 rl4brTSBlWbfbRfJL283AYb5qBAjfWJIcoX9SZPgbCJIUikq8ROx9/ZC+fW3XOjuIAZk
 a3om9x08uGexdDue9K0fxijVNTmjSzY9Q23U3IUIzS+yC/vgDjGyn8MtRftNwibXYKWH
 feeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oELHznPYEZxCRNNymAE/R64Ag8jlrBK43GmQtNTktHs=;
 b=W4xVoBtrLPKu7l9fEroGZxCizJxQZhz34B/uoUx1daCl6TNyJU12fm0JYZo+eexgen
 BNHl2uhW2W/FIfI4C/2MNCGA7ncyyqEeIoq4WK+Q6/WNplOFqmpJKrjJ6No46wTVumCp
 ZHnNH8O2KRRRASXrESm1gIaXD87Ifr41jdrmMEtMVXMjcY1ztEuR9zOl/XEOn6tSlJSw
 BIkRJ2xyQcPurYOr/NQst25R/NYcbrnNbuFVMB+sw7lYI9a3Mslsz2OnPdMjeWTVdHW5
 x/NJX0iApAWVCAqbkXzwPRqn55fMFh06plF8Jo38lJpGXhlgOuhVKhWYeMuv96OCCu5f
 sHKw==
X-Gm-Message-State: APjAAAW4XaDDaRCXYzFXCRZWwzuVAW7427J/OCM+M705Yxlxk89KvCK0
 6h0/lUbEvGcS7XboQFAMdRer4kpFRwyOORv/46Yl1jTprpw=
X-Google-Smtp-Source: APXvYqzk/YXhhUE3LqEdKcHELdWyiKoRYV3pmnoTu2B6CrfpWLjXDR/49ifG+Hl5ZFooh0XKvJHe5AuHSuSrspvH1tk=
X-Received: by 2002:a6b:ee15:: with SMTP id i21mr12908931ioh.281.1561764879300; 
 Fri, 28 Jun 2019 16:34:39 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 28 Jun 2019 16:34:02 -0700
Message-ID: <CADfYTpEZ7KZ5gUk0VPQ9xJxtNg0ZY6npPE-y=Qfhhrjf1Nd3Nw@mail.gmail.com>
Subject: Deadline for OSFC OpenBMC Hackathon talks submission
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000dad313058c6ab8fd"
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

--000000000000dad313058c6ab8fd
Content-Type: text/plain; charset="UTF-8"

Gentle ping.  OSFC OpenBMC call for presentations deadline is June 30!

Please consider submitting a presentation for the first two days of the
OFSC OpenBMC track.  There are submissions for days 3 and 4 but there's
room for presenters on days 1 and 2.

Presenters get complimentary admission.

----------
Nancy

--000000000000dad313058c6ab8fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Gentle ping.=C2=A0 OSFC OpenBMC call for presentations dea=
dline is June 30!<div><br></div><div>Please consider submitting a presentat=
ion for the first two days of the OFSC OpenBMC track.=C2=A0 There are submi=
ssions for days 3 and 4 but there&#39;s room for presenters on days 1 and 2=
.=C2=A0=C2=A0</div><div><br></div><div>Presenters get complimentary admissi=
on.<div><br></div><div>----------<div><div dir=3D"ltr" class=3D"gmail_signa=
ture" data-smartmail=3D"gmail_signature">Nancy</div></div></div></div></div=
>

--000000000000dad313058c6ab8fd--
