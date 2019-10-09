Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 396A6D0959
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 10:14:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p6SY2781zDqP0
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 19:14:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=protonmail.com
 (client-ip=185.70.40.133; helo=mail-40133.protonmail.ch;
 envelope-from=rgrs@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="AChFDypo"; 
 dkim-atps=neutral
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46p6Rr61sSzDqLx
 for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2019 19:13:41 +1100 (AEDT)
Date: Wed, 09 Oct 2019 08:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1570608816;
 bh=AqipNEULseCd89+PdmjK7c920Iy+ReErGjczUIhGJAo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=AChFDypoFSMnCVMyISg7w6L6NEQRLt/6XDmeYfIYgaHoF0zoHAT3rRfBZNrscoCnM
 MRDY9TVs105KCrYzzXzAyp69xAf8Cid1qkt98R19vapTdRCj2+DVqHa3GK7vXP+XlS
 lLo+UQC04aDJBGgap49DpC17p9DdxQ8UxSa22jFY=
To: Lei YU <mine260309@gmail.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Image verfication failure doesn't prevent BMC update
Message-ID: <mBLnfEquPQ5rqgESI2UDusE_jvwiWXSolbEbztbYqS33PHatglGLmeLJgVFIKaZEE67aI4j1KnpL8wZzwbMAh4Ermwgm9aEFN3SYIgtVy74=@protonmail.com>
In-Reply-To: <CAARXrtkqKhQ-4ww+7s-1tZ58gQXVwcwe66oMK_qbDNRjMyuBzA@mail.gmail.com>
References: <04OHMEtrxc_iJdSbU6rDJXL_UCRii-RCTkBIgd3MYtzMqT-foopH3hioArbdi8gI4E1aQmmpui8dpvT8SdspVITAnycKL498kmbuSiK4dpc=@protonmail.com>
 <CAARXrtkqKhQ-4ww+7s-1tZ58gQXVwcwe66oMK_qbDNRjMyuBzA@mail.gmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
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

Ah, yes. You're correct, field mode was not enabled.
It is working as expected once it is set.

Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Wednesday, October 9, 2019 1:07 PM, Lei YU <mine260309@gmail.com> wrote:

> It is most likely the field mode is not enabled.
> See the related code at
> https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/85c356f76fe07db3c1=
253c48f5b35c5811a15c07/activation.cpp#L180
>
> On Wed, Oct 9, 2019 at 3:32 PM rgrs rgrs@protonmail.com wrote:
>
> > Hi All,
> > I am trying to sign my image with OEM keys instead of default OpenBMC.p=
riv which is part of the repo.
> > When I tried to update OEM signed BMC, phosphor-image-updater logs mess=
ages related to "Signature validation failed"
> > But the flashing continued and activation was successful.
> > I expected flash procedure to fail since, default private key (OpenBMC.=
priv,RSA-1024,SHA256) is different from OEM private key (RSA-2048,SHA256)
> > Log:
> > Sep 17 09:44:50 lhost phosphor-version-software-manager[1350]: Untaring
> > Sep 17 09:44:50 lhost phosphor-mapper[1135]: Found invalid association =
on path /xyz/openbmc_project/software/11daa823
> > Sep 17 09:44:50 lhost phosphor-mapper[1135]: Found invalid association =
on path /xyz/openbmc_project/software/11daa823
> > Sep 17 09:44:51 lhost phosphor-image-updater[1316]: BMC image activatin=
g - BMC reboots are disabled.
> > Sep 17 09:44:51 lhost phosphor-image-updater[1316]: EVP_DigestVerifyFin=
al:Signature validation failed
> > Sep 17 09:44:51 lhost phosphor-image-updater[1316]: System level Signat=
ure Validation failed
> > Sep 17 09:44:51 lhost phosphor-image-updater[1316]: Error occurred duri=
ng image validation
> > Sep 17 09:44:51 lhost phosphor-image-updater[1316]: The operation faile=
d internally.
> > Sep 17 09:44:51 lhost phosphor-log-manager[1114]: Failed to find metada=
ta
> > Sep 17 09:44:51 lhost systemd[1]: Starting Enable a guard that blocks B=
MC reboot...
> > Sep 17 09:44:51 lhost systemd[1]: Starting Updates the u-boot variable =
to point BMC version to 25904a91...
> > Sep 17 09:44:51 lhost systemd[1]: Starting Set U-Boot environment varia=
ble...
> > Sep 17 09:44:51 lhost systemd[1]: Created slice system-obmc\x2dflash\x2=
dbmc\x2dubiro\x2dremove.slice.
> > Sep 17 09:44:52 lhost systemd[1]: Starting Deletes read-only and kernel=
 ubi volume d4a39257...
> > Sep 17 09:44:52 lhost systemd[1]: reboot-guard-enable.service: Succeede=
d.
> > Sep 17 09:44:52 lhost systemd[1]: Started Enable a guard that blocks BM=
C reboot.
> > Sep 17 09:44:54 lhost kernel: block ubiblock0_0: released
> > Sep 17 09:44:54 lhost systemd[1]: media-rofs\x2dd4a39257.mount: Succeed=
ed.
> > Sep 17 09:44:55 lhost systemd[1]: obmc-flash-bmc-setenv@d4a39257.servic=
e: Succeeded.
> > Sep 17 09:44:55 lhost systemd[1]: Started Set U-Boot environment variab=
le.
> > Sep 17 09:44:55 lhost systemd[1]: Created slice system-obmc\x2dflash\x2=
dbmc\x2dubiro.slice.
> > Sep 17 09:44:55 lhost systemd[1]: Starting Store read-only images 11daa=
823 to BMC storage...
> > Sep 17 09:44:55 lhost systemd[1]: Starting Create BMC read-write ubi vo=
lume...
> > Sep 17 09:44:57 lhost systemd[1]: Starting Hostname Service...
> > Sep 17 09:44:58 lhost systemd[1610]: systemd-hostnamed.service: Private=
Network=3Dyes is configured, but the kernel does not support network namesp=
aces, ignoring.
> > Sep 17 09:44:58 lhost systemd[1]: obmc-flash-bmc-ubirw.service: Succeed=
ed.
> > Sep 17 09:44:58 lhost systemd[1]: Started Create BMC read-write ubi vol=
ume.
> > Sep 17 09:44:59 lhost systemd[1]: Started Hostname Service.
> > Sep 17 09:45:00 lhost phosphor-dump-manager[1136]: Tue Sep 17 09:45:00 =
UTC 2019 Report is available in /var/lib/phosphor-debug-collector/dumps/3
> > Sep 17 09:45:01 lhost systemd[1]: obmc-flash-bmc-ubiro-remove@d4a39257.=
service: Succeeded.
> > Sep 17 09:45:01 lhost systemd[1]: Started Deletes read-only and kernel =
ubi volume d4a39257.
> > Sep 17 09:45:01 lhost phosphor-dump-manager[1136]: Tue Sep 17 09:45:01 =
UTC 2019 Successfully completed
> > Sep 17 09:45:18 lhost systemd[1]: obmc-flash-bmc-updateubootvars@25904a=
91.service: Succeeded.
> > Sep 17 09:45:18 lhost systemd[1]: Started Updates the u-boot variable t=
o point BMC version to 25904a91.
> > Sep 17 09:45:29 lhost systemd[1]: systemd-hostnamed.service: Succeeded.
> > Sep 17 09:46:28 lhost obmc-flash-bmc[1659]: Volume ID 0, size 287 LEBs =
(18772096 bytes, 17.9 MiB), LEB size 65408 bytes (63.8 KiB), static, name "=
rofs-11daa823", alignment 1
> > Sep 17 09:47:12 lhost kernel: block ubiblock0_0: created from ubi0:0(ro=
fs-11daa823)
> > Sep 17 09:47:24 lhost obmc-flash-bmc[1702]: Volume ID 1, size 37 LEBs (=
2420096 bytes, 2.3 MiB), LEB size 65408 bytes (63.8 KiB), static, name "ker=
nel-11daa823", alignment 1
> > Sep 17 09:47:32 lhost obmc-flash-bmc[1702]: Volume ID 2, size 37 LEBs (=
2420096 bytes, 2.3 MiB), LEB size 65408 bytes (63.8 KiB), static, name "ker=
nel-11daa823", alignment 1
> > Sep 17 09:47:40 lhost obmc-flash-bmc[1769]: [130B blob data]
> > Sep 17 09:47:41 lhost obmc-flash-bmc[1769]: [1.9K blob data]
> > Sep 17 09:47:41 lhost obmc-flash-bmc[1769]: [2.1K blob data]
> > Sep 17 09:47:41 lhost systemd[1]: obmc-flash-bmc-ubiro@11daa823.service=
: Succeeded.
> > Sep 17 09:47:41 lhost systemd[1]: Started Store read-only images 11daa8=
23 to BMC storage.
> > Sep 17 09:47:41 lhost systemd[1]: Starting Updates the u-boot variable =
to point BMC version to 11daa823...
> > Sep 17 09:47:41 lhost systemd[1]: Starting Set U-Boot environment varia=
ble...
> > Sep 17 09:47:43 lhost systemd[1]: obmc-flash-bmc-setenv@11daa823\x3d0.s=
ervice: Succeeded.
> > Sep 17 09:47:43 lhost systemd[1]: Started Set U-Boot environment variab=
le.
> > Sep 17 09:47:45 lhost systemd[1]: obmc-flash-bmc-updateubootvars@11daa8=
23.service: Succeeded.
> > Sep 17 09:47:45 lhost systemd[1]: Started Updates the u-boot variable t=
o point BMC version to 11daa823.
> > Sep 17 09:47:45 lhost phosphor-image-updater[1316]: BMC activation has =
ended - BMC reboots are re-enabled.
> > Sep 17 09:47:45 lhost systemd[1]: Starting Removes the guard that block=
s BMC reboot...
> > Sep 17 09:47:45 lhost systemd[1]: reboot-guard-disable.service: Succeed=
ed.
> > Sep 17 09:47:45 lhost systemd[1]: Started Removes the guard that blocks=
 BMC reboot.
> > Thanks,
> > Raj


