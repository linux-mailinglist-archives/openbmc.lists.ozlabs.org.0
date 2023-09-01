Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C87AF790407
	for <lists+openbmc@lfdr.de>; Sat,  2 Sep 2023 01:39:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=cGwOhes2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rcvcn0KBlz3c5d
	for <lists+openbmc@lfdr.de>; Sat,  2 Sep 2023 09:39:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=cGwOhes2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e31; helo=mail-vs1-xe31.google.com; envelope-from=zhichuang@google.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rcvc16Wg6z2y1b
	for <openbmc@lists.ozlabs.org>; Sat,  2 Sep 2023 09:38:24 +1000 (AEST)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-44e8f9f3cceso1147154137.1
        for <openbmc@lists.ozlabs.org>; Fri, 01 Sep 2023 16:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693611499; x=1694216299; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=09PodmOPZIudQ5vSuRi2AmYeP+qIjv5E3degtERHB3k=;
        b=cGwOhes2eyaTlnzl46JilVy6GW7tx0KSQJVJyFsvBva7fwpQ+N82tRi+q+aI9CzP1N
         zhMnRR65JA9vPDf1PHMHjcZTwUTFR4db2BobdOPFTjV13gRHCZ22tbuMNAFwmak9sdYB
         68j5YYfr+lrFAIBkXpJIFWvF6one0sloqjGBL159Ge6z+h4VfFJAY/p/GU55O+BYABOF
         8rUn9lS/wfxFs6IQlGr+jebWZclVPclW2QxDVgtchkULjt8UbyzozE8yDrnmdidxqRsH
         8SPkBjZ1KphuHyqsBZeXZ5fGZQiW8kWSDaz6tFFLbquLiepveIHOenWjtttBgdoPookD
         XTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693611499; x=1694216299;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09PodmOPZIudQ5vSuRi2AmYeP+qIjv5E3degtERHB3k=;
        b=cjBPyniQG8XE2eXHxsSPRhrjUXpxUyxqU7FSKXLQx1bUPPFEJ0bz8BwApSl+XQww4J
         wR7korP01bM+S53JULX+OdKw7L3Big85jNJWmAgwvhtyAKZCxkTvwilkbBVwX1oBDz87
         cS06lLZPz4z57bzvceQDpEdSk7bEdV5hBEbfnj5SNbN9Fj2W7eazKDVcIGFSPXvx2h+O
         +eYp9WVSfSmvRxorVhOiV2te1pTCmsHt7wme6VOgbROKSVt1otkbT1e6qx+YhZ2+3k/s
         I0OLW5KC6pYpJUMpTslAWWx3foXs9G2si1MIMXdOj1ahhnjC+CpdmNi+VtwKzTv1sxK+
         tc0Q==
X-Gm-Message-State: AOJu0YxRVdyByRvEad/5+TbHJhCQpie1HxcUCY+xx0bGZKQjazSASJDa
	xIO+A1ZZdvmNljv5JTAmkJ4gaIuVEDHGv6MLMuQ7G3Gjxp/13ju9duIVOA==
X-Google-Smtp-Source: AGHT+IGusm2mxGvDJV9uLd/60XmhjVY88U3JuqqbE7QsDVMp1rSBoeEJlemkIy5ipEKZAOc8vSLhaRDrdx1b9JuJr+o=
X-Received: by 2002:a05:6102:3a56:b0:44e:b30a:c0da with SMTP id
 c22-20020a0561023a5600b0044eb30ac0damr4411117vsu.26.1693611499004; Fri, 01
 Sep 2023 16:38:19 -0700 (PDT)
MIME-Version: 1.0
From: Zhichuang Sun <zhichuang@google.com>
Date: Fri, 1 Sep 2023 16:38:07 -0700
Message-ID: <CA+g7whTFEsfFqpeqAD+-Zs2u1hJx_u37xv6ZdkCt1-Bw_BEjiw@mail.gmail.com>
Subject: SPDM support in BMCWeb/D-Bus
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c96f4f060454a7ba"
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

--000000000000c96f4f060454a7ba
Content-Type: text/plain; charset="UTF-8"

Hi there,

I'm working on adding SPDM support in BMCWeb and D-Bus. I started with an
initial design doc and proposed new D-Bus interfaces as follows:

- https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/64354
- https://gerrit.openbmc.org/c/openbmc/docs/+/64994

Background:
SPDM, or Security Protocol and Data Model (
https://www.dmtf.org/sites/default/files/standards/documents/DSP0274_1.3.0.pdf)
is a DMTF standard which defines the standard messages and protocol for
device authentication, firmware integrity and hardware configuration
measurement. Redfish added support for SPDM with a new schema called
ComponentIntegrity (
https://redfish.dmtf.org/schemas/v1/ComponentIntegrity.v1_2_1.json).

Adding support for SPDM in BMCWeb will allow a remote user to attest device
identity using SPDM protocol via Redfish API. It helps with device security
management in data centers.

Any feedback on the design or D-Bus interfaces are welcome :)

Thanks,
Zhichuang

--000000000000c96f4f060454a7ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><di=
v class=3D"gmail_default">Hi there,</div><div class=3D"gmail_default"><br><=
/div><div class=3D"gmail_default">I&#39;m working on adding SPDM support in=
 BMCWeb and D-Bus. I started with an initial design doc and proposed new D-=
Bus interfaces as follows:</div><div class=3D"gmail_default"><br></div><div=
 class=3D"gmail_default">-=C2=A0<a href=3D"https://gerrit.openbmc.org/c/ope=
nbmc/phosphor-dbus-interfaces/+/64354" target=3D"_blank">https://gerrit.ope=
nbmc.org/c/openbmc/phosphor-dbus-interfaces/+/64354</a></div><div class=3D"=
gmail_default">-=C2=A0<a href=3D"https://gerrit.openbmc.org/c/openbmc/docs/=
+/64994" target=3D"_blank">https://gerrit.openbmc.org/c/openbmc/docs/+/6499=
4</a></div><div class=3D"gmail_default"><br></div><div class=3D"gmail_defau=
lt">Background:</div><div class=3D"gmail_default">SPDM, or Security Protoco=
l and Data Model (<a href=3D"https://www.dmtf.org/sites/default/files/stand=
ards/documents/DSP0274_1.3.0.pdf">https://www.dmtf.org/sites/default/files/=
standards/documents/DSP0274_1.3.0.pdf</a>) is a DMTF standard which defines=
 the standard messages and protocol for device authentication, firmware int=
egrity and hardware configuration measurement. Redfish added support for SP=
DM with a new schema called ComponentIntegrity (<a href=3D"https://redfish.=
dmtf.org/schemas/v1/ComponentIntegrity.v1_2_1.json">https://redfish.dmtf.or=
g/schemas/v1/ComponentIntegrity.v1_2_1.json</a>).<br></div><div class=3D"gm=
ail_default"><br></div><div class=3D"gmail_default">Adding support for SPDM=
 in BMCWeb will allow a remote user to attest device identity using SPDM pr=
otocol via Redfish API. It helps with device security management in data ce=
nters.</div><div class=3D"gmail_default"><br></div><div class=3D"gmail_defa=
ult">Any feedback on the design or D-Bus interfaces are welcome :)</div><di=
v class=3D"gmail_default"><br></div><div class=3D"gmail_default">Thanks,</d=
iv><div class=3D"gmail_default">Zhichuang</div><div class=3D"gmail_default"=
><br></div></div></div>

--000000000000c96f4f060454a7ba--
