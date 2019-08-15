Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C26E58F66B
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 23:31:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468flj00TJzDqWJ
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 07:31:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MeeIUep3"; 
 dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468fl46g2DzDr7H
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 07:30:55 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id 16so3328959oiq.6
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 14:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GpSEEIHtvflG8Ojt7unZaeqz9Ub7A30TYwJmDPN8b6o=;
 b=MeeIUep3duEyfEeNpEZuf/GYFxmWMz58pIsSD+CHk/KNtGxHcz5KoJm2UiujVZLr8O
 6OYHq+8ItwLZ3h/L93MS2q30aZuDIT2R4mozbIde3SEONEAU9Mwsw8IeT9R8/gMr6dE/
 mBx9rkEwSVzkDlIOeRnpnYX5ojz2UoKwGuStbEotucXZyv9Bl6T9mVtaLfNZ2ENzixa9
 sKek4k8wdEuskCdqm9bgK6n8fcl8pUemIaM9aS3VWzgCXHc8m+YBKCPdteQs3YDOFfa8
 YXvDML7ypQ2UUsjpgKwAS9enrKWPTtkiIa7bSYvqRzjpIL9qkwwE95yk3Sv11alpCpKo
 ucAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GpSEEIHtvflG8Ojt7unZaeqz9Ub7A30TYwJmDPN8b6o=;
 b=D49QCoen0InzhNiB6cvx5fdExBc57H4lWFANcCgQcjR+xPxp5rHM2Ya9oZCEn+71mB
 e/+IwMntNobmPU/IDJLB1s4NjiOFnQ1FX1MDtlkPROgSDLn5A/v6wOULp+nUAzuxLRbA
 RpnHpkcm6vhbU6XegCUfRygCBSiHui6kySOSgL7Rg5ukWr8Bgj0HDbaIZPIjviqodiv7
 cUttx/ynM8zmllb3DLegP/rBkym61pg+p3Fk5I/S+8UV/RAIm+9jvQ3Pq7tSsaUyLOZ5
 BqGm0ZuploWB/YgybHtidtiqaYeWg14H8yxZt6p/azDmnWYy3rFfzOgAddA6la0NUhU4
 QM8A==
X-Gm-Message-State: APjAAAU8YOLoeebUGQy87ShaT6/gD9xgJM7LvS3bN36VAg3IYKNIikls
 OpI7KNVy74K6Pf9DimsnuRP/lxN5KTy/PrjkyHib1YIE
X-Google-Smtp-Source: APXvYqz8PMt6Fh+BUa/ND9Qgnz1bDMV2Za6HwEbafdUFuGELKMFFaubELDMzeh5lEvoSYAjvYsFOE0OQhr2xrCpHNe4=
X-Received: by 2002:aca:c713:: with SMTP id x19mr3079874oif.158.1565904652273; 
 Thu, 15 Aug 2019 14:30:52 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 15 Aug 2019 16:30:36 -0500
Message-ID: <CALLMt=pv9GdHmv7ZJOBK+Z1wqAh4DmOzVR8ud=+KefddvEkreg@mail.gmail.com>
Subject: where to store application json
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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

As we start moving more and more of our applications to using runtime parsed
json files, it seems like a good time to come up with a standard location to put
the json files. I think a requirement is they be in a writeable filesystem
(although that may bring security concerns) so that you can edit and restart
services that use them on the fly for bringup and debug.

/etc seems like the right spot. But if so, where in /etc?

Adriana pointed me to the FSH guidelines[1] in a review which has the following:
"It is recommended that files be stored in subdirectories of /etc rather than
directly in /etc.".

/etc/opt ?
/etc/opt/phosphor/ ?
/etc/opt/phosphor/<repository name>/ ?

Our use of /var/lib/ for persistent data uses a /var/lib/<repository name>
type directory syntax so staying consistent with that seems to make sense
leading me to think /etc/opt/<repository name>/ would be our best bet.

Thoughts?
Andrew

[1]: https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s07.html
