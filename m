Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B826D783
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 11:21:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsWgj07HpzDqGk
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 19:21:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=celestica.com (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=bhe@celestica.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=celestica.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=celestica.com header.i=@celestica.com
 header.a=rsa-sha256 header.s=google-201810 header.b=EG46Occf; 
 dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsWcY3ByxzDqZ3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 19:19:05 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id u21so2303713eja.2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=celestica.com; s=google-201810;
 h=mime-version:from:date:message-id:subject:to;
 bh=/n+K4EohI/qKEAX2knvtnEm0Wkj+rdXpXMFlKwJrWNs=;
 b=EG46Occf/11VPlzROrRz8G3UQOo1vV40BNuh7QVCk1yymC4fs8jEn3DlK2gLr/rIb8
 DcLAcXpo1u0cQnQdi5U7dgTsJ9d9+4QRIAun/apkX1Z1MuqiJ8kd2peVeojFcocjoeSF
 fNhSLEPZ8xzXdbFzqeMeJCvenwTy03ViyCE03aS9puHIK9kCrj+xoaKjSzAyKFOcfxLd
 4Mam6GWcATJPoaC6hLkHwlF0f0TjIhp+XM4E3CRjzj+56stUaz9BbxIg2JJO8bRytDVH
 HatVIs+IHJFN4pjCLz6CzcuqJsLW8M99UbRlkZLAerHq+zVfE7yU6qTbW4QFEmVLFO0Y
 YGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/n+K4EohI/qKEAX2knvtnEm0Wkj+rdXpXMFlKwJrWNs=;
 b=UdqUfIBJpjUn6xQHLhUfQGkPj4ASXS6JR4NyOKqCpjCj73LNdRcIlXsTlB71emMMuP
 W6XtONjuE8g0x2KAzRUUPTxwIGir8H7cIhmjP2IJYnT0yjyCmwznmE6tdeoEcd/vZdcq
 GQpOTaGT1zb7IwPqYRIoNYIDDzQ9/chc1pYNiHztHBRK1XNQ9JufKAJ/fDVeCX0WA7XY
 FkkvLgxs57RliPMYwC2HR3XOasReCtiBlwSqZWlzpSxngy+isEVjIbP2DEYrtZ0MR9l0
 /9O1tP+OB/WvviF7QiFFbRtgRt99J0Y7QZmMt4UWVEARpsSLC1E2AF4Zr85t2FSdiiNM
 FFBQ==
X-Gm-Message-State: AOAM533e0Kdhq4a3x6ZO/IZ6zj9L2TVXwl5QT4hYfidTxZS6BepSADBD
 TfQ3/RKgUiArjIT+eIOwITIZ/ghO636dYgHqqRhRQI0I+6Ykr283AzwO3ZY9uyZwWCNgto/th6l
 FD6QGfsnl+0gofju3pdlc5eOV9SRvs2uZtQ==
X-Google-Smtp-Source: ABdhPJwQyUDp00niLX4lVI/saXylwyNf+FHYjM6O0GcYZ8vujwHn/0TOq6U3SgZKzC6rAAPHX75RVObqTWVROSW17GI=
X-Received: by 2002:a17:906:3748:: with SMTP id
 e8mr26712639ejc.71.1600334340216; 
 Thu, 17 Sep 2020 02:19:00 -0700 (PDT)
MIME-Version: 1.0
From: Beck He <bhe@celestica.com>
Date: Thu, 17 Sep 2020 17:18:49 +0800
Message-ID: <CALPNqoTA7d31GhfM6WfS9bz+RPzMtscpJhuFCYqsV68xV+AV4g@mail.gmail.com>
Subject: ast2600 support
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000def19f05af7edf92"
X-CLS-Gapps: True
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

--000000000000def19f05af7edf92
Content-Type: text/plain; charset="UTF-8"

  May I know whether OpenBMC has supported the ast2600 BMC chip, I noticed
some code about it, but no 2600evb support in:
https://github.com/openbmc/openbmc/tree/master/meta-evb/meta-evb-aspeed

thanks!

Regards,
Beck  He
Connectivity Solution FW/SW Architecture
Tel: + 86, 21-61006028-7363 email: bhe@celestica.com
www.celestica.com

Solid Partners. Flexible Solutions

--000000000000def19f05af7edf92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=C2=A0 May I know whether OpenBMC has supported the a=
st2600 BMC chip, I noticed some code about it, but no 2600evb support in:=
=C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/openbmc/tree/master/meta=
-evb/meta-evb-aspeed">https://github.com/openbmc/openbmc/tree/master/meta-e=
vb/meta-evb-aspeed</a></div><div><br></div><div>thanks!</div><br clear=3D"a=
ll"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div>Re=
gards,</div><div>Beck =C2=A0He</div><div>Connectivity Solution FW/SW Archit=
ecture</div><div>Tel: + 86, 21-61006028-7363 email: <a href=3D"mailto:bhe@c=
elestica.com" target=3D"_blank">bhe@celestica.com</a></div><div><a href=3D"=
http://www.celestica.com" target=3D"_blank">www.celestica.com</a></div><div=
>=C2=A0</div><div>Solid Partners. Flexible Solutions</div></div></div></div=
></div></div></div></div>

--000000000000def19f05af7edf92--
