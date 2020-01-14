Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3C139FFE
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 04:32:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xbcq6vnQzDqNt
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 14:32:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AzYdc1D/; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xbcC1NSMzDqNL
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 14:32:10 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id x185so5892530pfc.5
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 19:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=javKdvPN5z9UaD34uPWBcA036tITVXytBF81ZyeTaao=;
 b=AzYdc1D/neX7SFpW8GX+Ur9zoRTre8wODuU7Xo4uJFziV7n7sTmbnwdsZG800nkM6I
 FDyplNSdn13AmT6T2xhK/yJxnNDh0Up20gHbqYLIzAxrzLbfxt/pHLUO+A+X58Q9iPuw
 2bhDbnYoxSmDW78vn2TejgjV5+9TA32GVHVXVSbYR2tgM4tj0ycaHKkBtA6a7ubHtjHD
 8Ya3IEhqlMcSMO+sAYS4husxmScINNH4nRIYi5eDWJsVDeaPjYH0z/So8fqIfVW11XsD
 cjErdk1DfMTyraxJ71zCSRKG3eVzVStB4bYO5GngMBRt9+87+EhOGlDJLdtjyq+7843o
 20/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=javKdvPN5z9UaD34uPWBcA036tITVXytBF81ZyeTaao=;
 b=Qz20szKHQ0wbgDoMyB2xgtNPDCI3Ul+DUNpMTaj+DfBNY+nqqvj8pp1vOgyo+SvrrM
 JxbAkoGQrWkpk1mlfsFIsv2leiZaAvU9RYCxFh6QxO10DnhwjQMzYb2RrQ5jD3MbNh/u
 ZK2X3xq+zaWkRcmwMQ0SKTBNBYdz1j+xriXfq6p58oGDYc5Bs3+JJ/UCHgTqcK9cIqHj
 +Uv2K2hP9lUFHRCItIFQoXjWGren+EBHBB82akZA/PD2YEljisSxPzQzSvUogBUD8f++
 niXgF8ZMZdiCzIMhNTqLhsEGzH2p1av+T3b5RLsz4OY1i0l4JOYUbc3qgTQwZj6azQct
 HI9g==
X-Gm-Message-State: APjAAAVY9ZJA/NcsGqXPYEersizEcZEz/0oBiX+B6CTieTt+q8zoe9wD
 i0+ZT8kD9qulqaK/bBueW6B+yiQjSWQngJSd4iCZew==
X-Google-Smtp-Source: APXvYqzbVVyiVJnIDM6QxRititxGOxXETro2TpnayLZ0MsWfRGVd3DHzOAvbctezAqxcX1hHYJCcM1tAjaYnkHnw3Mo=
X-Received: by 2002:a63:d153:: with SMTP id c19mr23812274pgj.78.1578972727401; 
 Mon, 13 Jan 2020 19:32:07 -0800 (PST)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Tue, 14 Jan 2020 11:31:54 +0800
Message-ID: <CAO9PYRKzfWXx4iOOxoGmi_EFb2rdSBmHxVzh-6mzUf-NBoEajA@mail.gmail.com>
Subject: Dose OpenBMC support UPnP
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000086e145059c113cff"
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

--00000000000086e145059c113cff
Content-Type: text/plain; charset="UTF-8"

Hi all:
    UPnP is well-known and widely used network protocol. Does openbmc
support it or plan to support? Thanks.

Tyler

--00000000000086e145059c113cff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all:=C2=A0<div>=C2=A0 =C2=A0 UPnP is well-known and wid=
ely used network protocol. Does openbmc support=C2=A0it or plan to support?=
 Thanks.</div><div><br></div><div>Tyler</div></div>

--00000000000086e145059c113cff--
