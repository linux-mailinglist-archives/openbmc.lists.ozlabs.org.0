Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DB412AB0B
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 09:45:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47k3SR0Fq7zDqJq
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 19:45:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.132;
 helo=mail-40132.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="riv7Em7S"; 
 dkim-atps=neutral
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47k3Rf12CBzDqDl
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 19:44:44 +1100 (AEDT)
Date: Thu, 26 Dec 2019 08:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1577349879;
 bh=2CqJrp5/gHBUxUi5JNR2QC8hgcXijGiCuws9RpW9tMs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=riv7Em7SlZ7V0RuGrd6NBqcYVazhnC89a2Mw1KKytu5dVo8cFiCpKbsKPlOOcFL5g
 1gfsbIMmuEiQXKCj5GULVtl7MWP+qUwdYmYsjvBprQH18YqdxLIITZ9Va0SXJYwD7z
 bh+oPEUq2f8tWyza5Q+6OlPuwfH2BSs+9otKyh1Q=
To: CS20 CHMa0 <CHMA0@nuvoton.com>
From: rgrs <rgrs@protonmail.com>
Subject: RE: BMC UUID property/object not found
Message-ID: <3hGVcOXMjB0PgVCPe13XDTCwPwE0OfL-klckK5sNIFYkCBuMKoLF4eA__uIuF763gBB5_c1Zqzo6YpvX7gdidGenrbpbovXYVoXQbuEudlw=@protonmail.com>
In-Reply-To: <HK0PR03MB40821DBC9F67A5404C16AE6EF5280@HK0PR03MB4082.apcprd03.prod.outlook.com>
References: <yepdfnStu5NH94jUzVoKLGdX2kVPErynD7ERZlcm_Ig8_K1zkvmSLoC1SYhdm0b3ASb_B8D0r_PTN5Ct_kGk_3aoyi31V6GaM0q3T_DxunU=@protonmail.com>
 <HK0PR03MB406851FE695528554F3911ABAE290@HK0PR03MB4068.apcprd03.prod.outlook.com>
 <HK0PR03MB40827561EECBF2D0EC561769F5290@HK0PR03MB4082.apcprd03.prod.outlook.com>
 <ehAiYrBbR44jLPINP8G9C8UcNQ3L5f4_WeKYRWs8sy4MLU_kIKn-fb1fBMabK6K081TGtXfpbPLVEXm50w0zTkiBRpUpzX1pPON9GMYCegk=@protonmail.com>
 <HK0PR03MB40821DBC9F67A5404C16AE6EF5280@HK0PR03MB4082.apcprd03.prod.outlook.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
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
Reply-To: rgrs <rgrs@protonmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brian,

You're right. Our FRU doesn't have that field.
I was under the assumption, /etc/machine-id was used instead.

I guess i need to edit my FRU.
Are all those fields in your yaml example necessary?

Thanks,
Raj



=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Wednesday, December 25, 2019 8:56 AM, CS20 CHMa0 <CHMA0@nuvoton.com> wro=
te:

> Hi Raj,
> You can check the inventory service.
> Ipmid return BMC UUID by get D-Bus property from inventory service.
> And inventory service will read some configuration file while startup lik=
e
> https://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-quanta/meta-ol=
ympus-nuvoton/recipes-phosphor/configuration/olympus-nuvoton-yaml-config/ol=
ympus-nuvoton-ipmi-fru-bmc.yaml
> If the FRU has no BMC UUID data or not configure BMC UUID in inventory se=
rvice, the property would not exist.
>
> Thanks,
> Brian
>
> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original =
Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
> From: rgrs rgrs@protonmail.com
> Sent: Tuesday, December 24, 2019 5:34 PM
> To: CS20 CHMa0 CHMA0@nuvoton.com
> Cc: openbmc@lists.ozlabs.org
> Subject: RE: BMC UUID property/object not found
>
> Hi Brian,
>
> They are enabled, Is there anything else i should look at?
>
> $ grep -rin "CONFIG_CRYPTO_" defconfig
> 216:CONFIG_CRYPTO_HMAC=3Dy
> 217:CONFIG_CRYPTO_SHA256=3Dy
> 218:CONFIG_CRYPTO_USER_API_HASH=3Dy
> 234:# CONFIG_CRYPTO_ECHAINIV is not set
> 235:# CONFIG_CRYPTO_HW is not set
>
> Thanks,
> Raj
>
> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original =
Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
> On Tuesday, December 24, 2019 12:59 PM, CS20 CHMa0 mailto:CHMA0@nuvoton.c=
om wrote:
>
> Hi Raj,
> The systemd get UUID function need Kernel API support.
> Maybe you can check Kernel configuration first.
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_systemd=
_systemd_blob_master_README-23L51&d=3DDwMGaQ&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC0=
1UFDmisvMR1k-EoDM&r=3DdoNNnS6paLL-xRR9VW1GYEtYU82vPGTMv_hE5neCcWI&m=3DGAn1k=
NLLvqBHRbEEYz8ClI7HQAxEgJwul4M1kCwilUY&s=3DiGSR2gMqcd4YzYU6wmuEirB4J8DvlqRs=
dInmsOQYFSA&e=3D
> Kernel crypto/hash API
> CONFIG_CRYPTO_HMAC
> CONFIG_CRYPTO_SHA256
> CONFIG_CRYPTO_USER_API_HASH
>
> Thanks,
> Brian
>
> From: openbmc mailto:openbmc-bounces+kwliu=3Dnuvoton.com@lists.ozlabs.org=
 On Behalf Of rgrs
> Sent: Tuesday, December 24, 2019 2:37 PM
> To: mailto:openbmc@lists.ozlabs.org
> Subject: BMC UUID property/object not found
>
> Hi,
>
> I get below error message on "ipmitool mc guid" command,
>
> Dec 24 05:09:33 obmc ipmid[1457]: Failed in reading BMC UUID property
> Dec 24 05:09:42 obmc ipmid[1457]: No Object has implemented the interface
> Dec 24 05:09:42 obmc ipmid[1457]: The operation failed internally.
>
> Is this same as
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_openbmc=
_openbmc_issues_3532&d=3DDwMGaQ&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-=
EoDM&r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&m=3DvHWR3IU3HAh0uFyTmx=
nEwOdlONHhW3FY4FTzZ01mjRU&s=3Dtbhwa-ghqEmw4cfgUzsf61Iq4BcoU7fM0Biw94O50xQ&e=
=3D
>
> Which app/service implements this interface?
>
> Thanks
>
> Raj
>
> The privileged confidential information contained in this email is intend=
ed for use only by the addressees as indicated by the original sender of th=
is email. If you are not the addressee indicated in this email or are not r=
esponsible for delivery of the email to such a person, please kindly reply =
to the sender indicating this fact and delete all copies of it from your co=
mputer and network server immediately. Your cooperation is highly appreciat=
ed. It is advised that any unauthorized use of confidential information of =
Nuvoton is strictly prohibited; and any information in this email irrelevan=
t to the official business of Nuvoton shall be deemed as neither given nor =
endorsed by Nuvoton.
>
> The privileged confidential information contained in this email is intend=
ed for use only by the addressees as indicated by the original sender of th=
is email. If you are not the addressee indicated in this email or are not r=
esponsible for delivery of the email to such a person, please kindly reply =
to the sender indicating this fact and delete all copies of it from your co=
mputer and network server immediately. Your cooperation is highly appreciat=
ed. It is advised that any unauthorized use of confidential information of =
Nuvoton is strictly prohibited; and any information in this email irrelevan=
t to the official business of Nuvoton shall be deemed as neither given nor =
endorsed by Nuvoton.


