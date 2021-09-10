Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFFF406981
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 12:10:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Wpq55hSz2yR7
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 20:10:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DjHWwpux;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532;
 helo=mail-ed1-x532.google.com; envelope-from=61a91bc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DjHWwpux; dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5WpQ5StLz2yNS
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 20:10:21 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id u19so1729065edb.3
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 03:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=xqMkZF+FSM2dy08lZE0Jm7ljlAo5Njf0olDDBACVk/k=;
 b=DjHWwpux6ndoOF+bLmVJYjRMfX9MRaqg+msoy7xfHRkQYD+u+7df2HNUrMvcbS/GQ+
 2075c3HNTNVOIe6EqfHka2pFeOP9OA0svJFjYgmRlhCiG8mznYxkSGgbz5D8e821y0AY
 BA3LfkU4z/IRMuXZvlr6/7rJo+PU+9Fo13GdQIQd2kSBAcEyD663elpTTGP2MMH7OqAa
 8NRzCvSo4ZCSjsRKWdLaZjK4VKhrYjmVPtu1gKVqSLG+jGlSaf62LvLs+v+JjqDusC8g
 rcmfLGpRo0Ii3iAVWhKGDHdzPojkrTHu7BB3wNXXB4h8yIViKEXO6Mk9O3WG4xswQN5v
 b8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xqMkZF+FSM2dy08lZE0Jm7ljlAo5Njf0olDDBACVk/k=;
 b=eCBe2uECazqcTO9bsBPbf6zuInKXz5iNkpPqnjuOYlEqT+v+HBmrA4YUoVcCxgX2I/
 kl5JC8i70LlU5tDRESY9mLe3XaonOz2ESY0635mNPXY4tjgtF66h54FXEJA3vTP7niQV
 wERb0cObojeowjY+IhkaRIdyvZj1XweW3Q9QgiP5tsydSZZXjgqDcdQxI2SR0T4z6PJt
 guufeKESc5IO+bvMgy4z+Lb5zN6O6DwwpstHBdPXpCGnIM80ho8GAV5ff4ANPVKMW44t
 CCYi2aKUtlPNZ1JbMFkbiJlOARng9RZMMUJ9omHwa9llL42V2tIlA3zIYBJcBFPbspYj
 LJog==
X-Gm-Message-State: AOAM532DIfaxE6RfSUNamtC6S3/Yq3Hsm6igQZA6ue5UV1iWyXUT5hY7
 Zcq/eXqmhdzAgXf2TBZY/FKawlPlZtVs5re5syH0V1Vo
X-Google-Smtp-Source: ABdhPJyygcpQEFyU00wUnABIEtufKg+l5Qn/v03UjyqS5uNlMkMixXWFFGVrjb/25GNH2xo7hViKs+1H0ku/oahK2hg=
X-Received: by 2002:a05:6402:4396:: with SMTP id
 o22mr8157200edc.232.1631268614337; 
 Fri, 10 Sep 2021 03:10:14 -0700 (PDT)
MIME-Version: 1.0
From: Alexander Raih <61a91bc@gmail.com>
Date: Fri, 10 Sep 2021 13:10:19 +0300
Message-ID: <CAMqwjCDjaGDyRutmoqBM1zDK10VOWzkY82vQ6atUhqv1AsWa9g@mail.gmail.com>
Subject: How I can read fru information about cpu and dimm ?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004a785905cba1525f"
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

--0000000000004a785905cba1525f
Content-Type: text/plain; charset="UTF-8"

Hi guys, I am beginner in openbmc, cat you tell me a question.
In device tree I describe eeprom on i2c bus. I read this eeprom file in fs
and this file contained information only about
mainboard(vendor,model,s/n,p/n).  Please tell me how can I get fru
information about cpu, dimms ??

p.s. On another i2c bus I have 2 devices with addresses 0x70 0x71. I think
that it is mux pca9545 and on the one on channel of this mux locate eeprom.

--0000000000004a785905cba1525f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi guys, I am beginner in openbmc,=C2=A0cat you tell =
me a=C2=A0question.</div>In device tree I describe eeprom on i2c bus. I rea=
d this eeprom file in fs and this file contained information only about mai=
nboard(vendor,model,s/n,p/n).=C2=A0 Please tell me how can I get fru inform=
ation about cpu, dimms ??<div><br><div>p.s. On another i2c bus I have 2 dev=
ices with addresses 0x70 0x71. I think that it is mux pca9545 and on the on=
e on channel of this mux locate eeprom.=C2=A0<br><div><br></div></div></div=
></div>

--0000000000004a785905cba1525f--
