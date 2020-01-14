Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0A313AA0B
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 14:04:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xrK04c8SzDqJt
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 00:04:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2e;
 helo=mail-vs1-xe2e.google.com; envelope-from=gorojohn17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mrXX07/8; dkim-atps=neutral
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xrGS02zvzDqF3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 00:02:36 +1100 (AEDT)
Received: by mail-vs1-xe2e.google.com with SMTP id u14so8147490vsu.3
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 05:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DClyROzGfktInWFDOxzRy+VNyuvU58WG0Q1AF/Er8gk=;
 b=mrXX07/886S5trwvPkBEEvIvMTSQG1//y0Q0dj6B24LTQ0RXqW8+FQzmQJjKM4VGtZ
 Y5KPuXrt0ecwdG0Ogbps7EQxOlyuDQmIMwpcq211jFWqSIPPETiTfmvb+9Fq0+v/Wh/K
 dfxi5rwgWEJOafndHyiObsQKeMsW4sxiaONf+rO/iB2212A9ZkEqug6ILjhb9lrjTt5d
 tYm1R6ZxfOP9pAIKkMOaksPY8QUQnV1dOk8+R1qcvQeh7yLgaMhMeu/3aZlfKnIX42kV
 S+AfCqnZzCmFyvH1diR2lq63WIB+3zEtAaFBkaqjXeXQoJLbu9SeTARk79qacOwzTIxW
 NSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DClyROzGfktInWFDOxzRy+VNyuvU58WG0Q1AF/Er8gk=;
 b=c+YFgbaDNi3zuwTnFdsmVOOABLvbhf99juRNS1Gzl5YjZULxQdiKWYbJItfOfkTpdt
 t4u4PMl7aqwsv8TqdtGqbK5dq4kgz6UclswPJe9WkQr1MeiqhpvXwp+AAeA5gk87cMFq
 si9jnVH2xWwajwrkMwLefKSFfZ5Z+5LpnPRUqKmCz8klUWjouAQNW1Dj1OMa84PC/6U5
 FzYyMF9VGHvp+UfOdFK+f08CcrMlCKBTEWH02IXfRAGKYhpnLitb5byF+fLhRuU/o9NQ
 df4NPHHCdDvHGBs7HyXelYU4cbez0nohoPS+fnZTWO2CL91je+4lXLoxA6jtsyoWtuOS
 H2cA==
X-Gm-Message-State: APjAAAVkbyKpb7URejcdLq0APPsbDnrm0vfVEkzzIfREgDjdYaKs9gwV
 WeHkrcNDi/FREKQ1yyTmNjBJJKiQoRGYcNb9HzwW0w==
X-Google-Smtp-Source: APXvYqzVxtT/DCsaV8RMOb3Eyrdl5nNnMpbXkGhu2DtbuKtHaGQY42UKsf43Ttu4BaHbFoDn+vc6jR8K05b2UwOiGcs=
X-Received: by 2002:a67:d703:: with SMTP id p3mr1389240vsj.185.1579006952207; 
 Tue, 14 Jan 2020 05:02:32 -0800 (PST)
MIME-Version: 1.0
From: John Chung <gorojohn17@gmail.com>
Date: Tue, 14 Jan 2020 21:02:21 +0800
Message-ID: <CA+a15-UkHByO=6psLogPLpoPkaRCpCwVer_sswudwcm_nTBvjQ@mail.gmail.com>
Subject: OpenBMC Source-Level Debugging
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007bf7d5059c1934d7"
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

--0000000000007bf7d5059c1934d7
Content-Type: text/plain; charset="UTF-8"

Hi All,

I am doing a personal study on OpenBMC recently. And I am wondering that
how to do source-level debugging via gdb, especially in vscode (Not sure it
is possible or not).

If anyone has any experience or documentation, please kindly let me know.

Very appreciated for the help.

Thanks,
John

--0000000000007bf7d5059c1934d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I am doing a personal study on =
OpenBMC recently. And I am wondering that how to do source-level debugging =
via gdb, especially in vscode (Not sure it is possible or not).</div><div><=
br></div><div>If anyone has any experience or documentation,=C2=A0please ki=
ndly let me know.</div><div><br></div><div>Very appreciated for the help.</=
div><div><br></div><div>Thanks,</div><div>John</div><div><br></div><div><br=
></div></div>

--0000000000007bf7d5059c1934d7--
