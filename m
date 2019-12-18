Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 168BA124238
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 09:51:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d7zK2VHLzDqCF
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 19:51:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.27; helo=mail4.protonmail.ch;
 envelope-from=rgrs@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="CV0j8QTv"; 
 dkim-atps=neutral
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d7Q84Qc2zDqPm
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 19:26:20 +1100 (AEDT)
Date: Wed, 18 Dec 2019 08:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1576657574;
 bh=uOfaSAHV6fK7G7VSHuoiJSCOYL9T1I19iT55ks3C3QI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=CV0j8QTvb04ZOuK3DwITiPmTjRUlgDUchIqOSaJ6E6ZxvRIqfgahDvO31zmXrnxbO
 lHTXgKi0a14AlMGWVs9JdeSqwhZ3Od2Vq/sQ56UnC0VRnhQqLQPpRL6QibWbN3RBXm
 y2Oe5ROr+hG1eUrffTBbLmt6jwJQ9wPncI0GDglY=
To: Adriana Kobylak <anoo@linux.ibm.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Firmware update error: Cannot UBI create volume
Message-ID: <mMrfhlAVEkCejeMkGNA-WogqkXEi79G-n2D_z-ccL9wK43k7KwvFyFPloY5wnZhNitUspTMdELj9Zl1st1W_BMXuaKVmgHy83sm1eKxHi_E=@protonmail.com>
In-Reply-To: <0bedefae291dc69d048fd5806d17d385@linux.vnet.ibm.com>
References: <1i6T-_CIXkSAHAqGbzb3IZW6jbo0mDc2nF7amahFYZ_d-4bMaTTMJeG2rb-1wE6J0OPb7NZRJ0Zx80eTDA5ukPs9CknlPBlw6IGMfHTwedI=@protonmail.com>
 <0bedefae291dc69d048fd5806d17d385@linux.vnet.ibm.com>
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

Thanks :)
I am able to flash new images now.

~Raj


=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Tuesday, December 17, 2019 10:30 PM, Adriana Kobylak <anoo@linux.ibm.com=
> wrote:

> On 2019-12-17 03:52, rgrs wrote:
>
> > Hi All,
> > I have a strange behavior where only one image is visible in webUI.
> > I get UBI "no space left" errors when I try to update/flash new image.
> > I dont have steps to reproduce and dont know how my BMC ended up in
> > this state.
> > How do I recover from this error? /proc/mtd shows all
> > partitions/volumes properly.
> > Is there any way to recover alternate partition without erasing SPI
> > from uboot?
>
> Seems there's an 'orphan' volume which you can manually delete to make
> space. A while back there was an issue at some point where not all the
> volumes were deleted during a firmware update.
>
> > root@obmc:~# ubinfo -d 4 -n 1
> > Volume ID: 1 (on ubi4)
> > Type: static
> > Alignment: 1
> > Size: 43 LEBs (2812544 bytes, 2.6 MiB)
> > Data bytes: 2767008 bytes (2.6 MiB)
> > State: OK
> > Name: kernel-7e7e1530
>
> This seems to be the 'orphan' since there's not a corresponding
> 'rofs-7e7e1530' volume, you can manually delete it with "ubirmvol
> /dev/ubi4 -n 1". You can also list all the volumes of a device with
> "ubinfo -a -d 0" for example.


