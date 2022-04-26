Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A20A510257
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 17:58:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnmkP71Rvz2xsc
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 01:58:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AsCRqhPa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=srid.11486@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AsCRqhPa; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Knmk30DPlz2xBk
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 01:57:46 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id y2so14849912ybi.7
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=NM0QrSI4/6hbZa/VcvF2J9GUiPb5b6nvdmV78PPtlK4=;
 b=AsCRqhPaaz/tt84gx9iPb9p/Zm4fHpf2Y++/jmZQ2nD51pHgAd41E4911PjtGkpch2
 ANI03WTyF76BXollzIbh6ou+LsL4M+MvInepdPNC7qim/pWSoK/GOuXvC/+a6F6l3VJn
 FKlmPgqqG5bukiBYsq4Oth0apQwm2VvWUIVaHzLhgxo1jPMG8uYRlm8JehrwyfQNHBlH
 ZC2aJPPFpHjC6BIMK7qkHPFlJRuP6m/JPgUQDGuGg6Q82fEAdGK/LIu/u/ZUlIll8DH5
 1GYdSwX+L+cbN1RubIi2CNxJ6rNtYL+uHzsy2CEE0MGX9sj6SSxMRpnUG7YHTvy8maRq
 ARqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=NM0QrSI4/6hbZa/VcvF2J9GUiPb5b6nvdmV78PPtlK4=;
 b=anTneXnA1gONzpgT9g2L3A7yqvXa6v+u0MPxoPBFbMsSPsDmp3QreYYV+74wObafNo
 XtYEI6iCIlum3ZPhVpim8F2tIytH7W/An9jhJg4e9SzMvfX80eUZWBhi2ZxdEweSiEPH
 fujKeFuE3AG95oe5exteGiiec8iHwf1/3/svMCg3QE6WMJio95FmKka6KVdTFqt2I352
 9m/BBY0oWXyn2cU+QkZ2zw4qBuJwzB4w9YHOv/CBDH9lPt+1ZmBPqc59pTIWlhHXCBci
 S8qkp/O9LAahZcc9l3FGp0zQDUewq2FZGUtuzzovIBVFlgTbEjRYmL+dVU/3NoJzpifl
 +S9w==
X-Gm-Message-State: AOAM531kXuAOKa11Wvbvj515kpzd5Sjnkn/IvRnEGBH1KCCssATbPqRd
 O9YrYb6QuFPf6p4f+9GRCmKbdpq/AflNBPfU51H9D9F8fGh57g==
X-Google-Smtp-Source: ABdhPJw6j4K0Ig0N9FCu1V7cWkv9QMfLmVhQXT06m9spaPYgZBQiMzCLC7BayRyNSB9nKAaQ+r/1U5ynBHL2QOmjMd4=
X-Received: by 2002:a25:db48:0:b0:645:79b5:25a3 with SMTP id
 g69-20020a25db48000000b0064579b525a3mr21639944ybf.285.1650988661160; Tue, 26
 Apr 2022 08:57:41 -0700 (PDT)
MIME-Version: 1.0
From: Jayashree D <srid.11486@gmail.com>
Date: Tue, 26 Apr 2022 21:27:30 +0530
Message-ID: <CALXuKJc9=hCWjU_QWi5LrP-3SeC1EwE7vvScD4qJgSfZoN_hTA@mail.gmail.com>
Subject: FRU information in inventory manager
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ad3f3e05dd90c0a9"
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
Cc: spinler@us.ibm.com, vernon.mauery@linux.intel.com, devenrao@in.ibm.com,
 santosh.puranik@in.ibm.com, velumanit@hcl.com, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ad3f3e05dd90c0a9
Content-Type: text/plain; charset="UTF-8"

Hi Team,


I am working on displaying FRU details in inventory manager. Based on the
eeprom in sysfs path (/sys/bus/i2c/devices/8-0051/eeprom), FRU details are
fetched and updated in the inventory dbus path in phosphor-ipmi-fru repo.
This is fine for the case where the FRU information is present in EEPROM

In OCP multi-host platform, we have IPMB based FRU, this is handled in
ipmb-fru and the patches are in review.

https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/51555
https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/39593

Could you please provide some suggestion on displaying these FRU details in
inventory manager?


Thanks,

Jayashree

--000000000000ad3f3e05dd90c0a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span><span class=3D"gmail-ui-provider gmail-uq gmail-b gm=
ail-c gmail-d gmail-e gmail-f gmail-g gmail-h gmail-i gmail-j gmail-k gmail=
-l gmail-m gmail-n gmail-o gmail-p gmail-q gmail-r gmail-s gmail-t gmail-u =
gmail-v gmail-w gmail-x gmail-y gmail-z gmail-ab gmail-ac gmail-ae gmail-af=
 gmail-ag gmail-ah gmail-ai gmail-aj gmail-ak" dir=3D"ltr"><span><span styl=
e=3D"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quo=
t;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quo=
t;,sans-serif;font-size:14px"><p style=3D"margin:0px">Hi Team,</p><p style=
=3D"margin:0px"><br></p>
<span><p style=3D"font-style:inherit;font-weight:inherit;margin:0px"><span =
style=3D"font-size:14px;font-style:inherit;font-weight:inherit">I am workin=
g on displaying FRU details in inventory manager. Based on the eeprom in sy=
sfs path (/sys/bus/i2c/devices/8-0051/eeprom), </span><span style=3D"font-s=
ize:14px;font-style:inherit;font-weight:inherit"> FRU details are fetched a=
nd updated in the inventory dbus path in phosphor-ipmi-fru repo. This is fi=
ne for the case where the FRU information is present in EEPROM</span><br></=
p><p style=3D"font-style:inherit;font-weight:inherit;margin:0px"></p></span=
>
</span>
</span><span><span style=3D"font-family:-apple-system,BlinkMacSystemFont,&q=
uot;Segoe UI&quot;,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;=
,&quot;Segoe UI Web&quot;,sans-serif;font-size:14px">
<span><p><span style=3D"font-size:14px;font-style:inherit;font-weight:inher=
it">In OCP multi-host platform, we have IPMB based FRU, this is handled in =
ipmb-fru and the patches are in review.<br><br><a href=3D"https://gerrit.op=
enbmc-project.xyz/c/openbmc/entity-manager/+/51555">https://gerrit.openbmc-=
project.xyz/c/openbmc/entity-manager/+/51555</a><br><a href=3D"https://gerr=
it.openbmc-project.xyz/c/openbmc/entity-manager/+/39593">https://gerrit.ope=
nbmc-project.xyz/c/openbmc/entity-manager/+/39593</a><br><br> Could you ple=
ase provide some suggestion on displaying these FRU details in inventory ma=
nager?</span></p><p><span style=3D"font-size:14px;font-style:inherit;font-w=
eight:inherit"><br></span></p><p><span style=3D"font-size:14px;font-style:i=
nherit;font-weight:inherit">Thanks,</span></p><p><span style=3D"font-size:1=
4px;font-style:inherit;font-weight:inherit">Jayashree<br></span></p></span>=
</span></span></span></span></div>

--000000000000ad3f3e05dd90c0a9--
