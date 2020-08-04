Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C923C175
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 23:28:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLntk0wzMzDqbc
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 07:28:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=obmc.developers@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lFjkpVn1; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLnsj4g1zzDqYh
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 07:27:48 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id o21so16950445oie.12
 for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2020 14:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tJmmwCK3Ddfa/HbhJXOKhGsYE+0mb46MbJTw8TNGMU0=;
 b=lFjkpVn1+CVzIkBr8g3oxetVEF0dVd5aiBoL7GH8cqmEXa6oiRA0NuvyMAz829Euc4
 hjFlK4bE6SrkSHh8ZdLjxhIs6LWMeRGJJLDqgkBtRioTlnwEpzg/n7Jr+tHEwo6pFPq7
 JhoSERHy7EMBdhJ1ddk2xo+AKGja35j0F/uFGm3Vcer9Gac/B9tJRyqTf/W8O8+NxGfC
 kC0R7yw0v5B5MvineD8RdYkem6AVdEA+tJfTCHoDcB9cTThQOdG8jJ6kmzbJjKVZR40g
 sskmv3gfJkXe/CtsbVpMKKU9MLQSoLzLO1mKxYk6j5SdkrxkGr0GWoe+8KPFugyNQ1tj
 acFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tJmmwCK3Ddfa/HbhJXOKhGsYE+0mb46MbJTw8TNGMU0=;
 b=BuUPYLqPEnrunXDUHmy5D3IkCJZ/9UhGkrsikrcwYyEGNDRY5MoKYtN8D3QQqZW8gG
 CFHr4VXPaXRkux9puJmD1D4Bn/TTmdGFWLLtEFi6gqFb3XZrFhnxy45++sxVsNOwC2e3
 KAqiHp1eySViRBk/Kl4Qyx0I5q7WHdEUE1FNXpn/0F4tBeUVxFYdVSAjH57WJM1VRQIO
 trycMi7Mwb15D3FoVZfei3n2tedg/s6VbKRguyZUcciWuhUlDr7nvtcqnYDgrKO+s6Qy
 lz24x69ypcP4D4aEULtlQ1N41QvWEli5uUdbx/lrhPDa1U2aMDBjoSn3wpCEhNSi49h9
 OrUQ==
X-Gm-Message-State: AOAM533Sc7Q6Q1znyCFu/9YKoROvvnogPMqLXziWevlCT/zmaSfFQq7i
 1r9ozUYWJoR00TZcniF9tZ0wDl0iJtdyGFq/e90dCw==
X-Google-Smtp-Source: ABdhPJzcwfo7J29ja1chdCH7iDoeWO+qvbTF5rOrg1wOHjgR52k+iMuYFtJRsHFuU0mrB10hG/Ge8IM1fuTKs5gXs4M=
X-Received: by 2002:a54:4512:: with SMTP id l18mr296048oil.148.1596576465074; 
 Tue, 04 Aug 2020 14:27:45 -0700 (PDT)
MIME-Version: 1.0
From: Anony Mous <obmc.developers@gmail.com>
Date: Tue, 4 Aug 2020 14:27:34 -0700
Message-ID: <CABbLDjM09zoW7xo0UdgJc=BsQ2ef7kVFbZFNVmdefc6RtHrz8Q@mail.gmail.com>
Subject: yoctoproject restructured?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000ebd3205ac13edf6"
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

--0000000000000ebd3205ac13edf6
Content-Type: text/plain; charset="UTF-8"

Hi:  I have been building without issues, but I just did a fresh git to do
a new build, and I am now failing because the system cannot fetch the file
http://downloads.yoctoproject.org/releases/opkg/opkg.0.4.2.tar.gz.

Does anyone know of a workaround for this error.

Thank you!

--0000000000000ebd3205ac13edf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi:=C2=A0 I have been building without issues, but I just =
did a fresh git to do a new build, and I am now failing because the system =
cannot=C2=A0fetch the file <a href=3D"http://downloads.yoctoproject.org/rel=
eases/opkg/opkg.0.4.2.tar.gz">http://downloads.yoctoproject.org/releases/op=
kg/opkg.0.4.2.tar.gz</a>.<div><br></div><div>Does anyone know of a workarou=
nd for this error.</div><div><br></div><div>Thank you!</div><div><br></div>=
</div>

--0000000000000ebd3205ac13edf6--
