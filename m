Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66478373C57
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 15:25:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZyC73QVCz300Q
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 23:25:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IG2LJqWM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31;
 helo=mail-oo1-xc31.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IG2LJqWM; dkim-atps=neutral
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZyBp3HS9z2yjK
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 23:25:36 +1000 (AEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 w6-20020a4a9d060000b02901f9175244e7so467755ooj.9
 for <openbmc@lists.ozlabs.org>; Wed, 05 May 2021 06:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VXe1jHKRBykJFCBrLVuCxSb2QEYBMH/06jTFKAbilu0=;
 b=IG2LJqWMsT9ND7l9B7WEVrm+NxmBmGxtLOAtVK/MXoMmojRZrJYR6JVkksZiL9G6eJ
 8v05hFL0G5gcx9T0ly0rQmSK4LQSfrUGb2RxQDO2I/1iYsXKeGYVy7Rb/LZBcSy7Gp8r
 87UalRMViX3dipPrQqQElDQjVpHUSTwtzEbEmDtMNpv8U+p8NSQa76RI4CEDWZcFuLiT
 /54TkQQ7pnw3Zs9C+uvJhQStObrZoJ6kv9xTANNHT0NccbkfA9lQc+GwkBxy6VBcDVV1
 XoUmTiV90rpmrR3pDaIP03AmUUnL8VKSxbQSaAXWtuMBKdmYqKNuhVDWfLzOwvwGS53M
 iTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VXe1jHKRBykJFCBrLVuCxSb2QEYBMH/06jTFKAbilu0=;
 b=oEp7pIZt9axdLSG6Z+ViMOeid5KzT2O4pNRT68DGbZyT61zjuJl6CdxPM5bYusEIuY
 Msi25ENbbdwLaabqOR+EYTHYn1sCDtOeW9MKGoH5PN0BydemTGLlpSQUR1mgxqKnZ8TJ
 hVyDma4Dgbl7OR9QIAmR+Zxvbsej3ktMCCOTihtbR17KF0LhPadACF7uxt1yi9A/DijN
 suRHpadC3J8s/cZXE5SbPlc6YyuQri570I7y99p6MlSun3aX1o/pM7HqSH5426e37q9D
 dgjudrN1noY5DP3LmYle8fDxL2jdMbKgnVltlcshOkS+lbUI3AMghQPXhPFNNevHyhFS
 syEA==
X-Gm-Message-State: AOAM530AhAhigzk5EDIIAVX1I7Xzrj9EdtFI80AuIJKDDB/xmsFnUrnK
 7BySuHzsqKDN6oGmWOYzSOw=
X-Google-Smtp-Source: ABdhPJwXTEvoLRapTmfEH1komlTsE7/Rc91gT3WhkxDI2oRNqG7fky8RfOopecUG1BDJlSuO63wcCA==
X-Received: by 2002:a4a:2743:: with SMTP id w3mr13248822oow.29.1620221131410; 
 Wed, 05 May 2021 06:25:31 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:152a:8925:a2fd:128d])
 by smtp.gmail.com with ESMTPSA id q184sm1327719oic.35.2021.05.05.06.25.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 May 2021 06:25:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: CI build for quanta/gbs
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
Date: Wed, 5 May 2021 08:25:29 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
References: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
To: =?utf-8?B?Ikdlb3JnZSBIdW5nICjmtKrlv6DmlawpIg==?= <George.Hung@quantatw.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?utf-8?B?IkZyYW4gSHN1ICjlvpDoqozorJkpIg==?= <Fran.Hsu@quantatw.com>,
 Brandon Kim <brandonkim@google.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 5, 2021, at 1:26 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) =
<George.Hung@quantatw.com> wrote:
>=20
> Hi Andrew Geissler,
>=20
> We have ported many OpenBMC features to quanta/gbs machine (Nuvoton =
BMC platform) and hope it could be added to CI build, could you help add =
quanta/gbs machine to CI build verification ? (I'm not familiar with =
this, if there's anything we need to do first, please let us know)

Hey George,

Getting a new system into CI doesn=E2=80=99t have the most defined =
process but
I think in general it has to fall under one of these due to our =
constraints
in compute power for CI:

1) Propose an existing system in CI to replace (and the benefits of =
that)
2) Donate a jenkins compute node to openbmc CI
3) Convince the community that your system provides additional meta-*
    layer coverage (or some other critical benefit) that would be worth
    the additional hit to the existing CI infrastructure.

We currently have a =E2=80=9Cgsj=E2=80=9D system in CI. Would it make =
sense to replace
it with this new =E2=80=9Cgbs=E2=80=9D machine?


>=20
>=20
> Thanks a lot.
>=20
> Best Regards=20
> George Hung
>=20

