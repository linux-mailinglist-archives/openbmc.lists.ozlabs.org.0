Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6BE358370
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 14:39:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGLSH461kz30JY
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 22:39:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=SIwjOvbi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.138;
 helo=mail-40138.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=SIwjOvbi; 
 dkim-atps=neutral
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGLS21Lt9z302Y
 for <openbmc@lists.ozlabs.org>; Thu,  8 Apr 2021 22:39:26 +1000 (AEST)
Date: Thu, 08 Apr 2021 12:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1617885560;
 bh=p+aCFPW9INr/8GPBNzX709QEFkJ6DsS2ZtHjJ3wXYSs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=SIwjOvbidv2NmIhYzlYf17cfObST4NFycdGipMIbiAXEZyB/ZCJuejQvcfnpFPLGI
 nK2jxVIIbAr0KUoVM1yVAVQicirMzCkkgmFEXPLlSGL7+EFO6PyBaq0VoRToGU774X
 meNMhXVKLvZ7NQjXpdwCz89k2bTFsRsmyveGZEow=
To: Lei Yu <yulei.sh@bytedance.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: IPMI SEL Parsing
Message-ID: <iLDkk0KnZ0UufxY54elPTZxzhBfLP6TM3JvJ-yIqJoON60n3r8wNXPPbZIEOolJybm41D2yeFVRhSCk_WJNiwZ6kfcu5TmSSPuUEBJOy8mU=@protonmail.com>
In-Reply-To: <CAGm54UFX9LPHArj-2q=w2pNtwgpkjZJE_0Dgd3_8cXB9z3L2vQ@mail.gmail.com>
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
 <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
 <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
 <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
 <axfftQgj4Du8QvWHD4CHEuPSLSJGtLZZTzpZplCpN1Mu63yr4Xm1RiZTuewl3CNqPUZ8mrmZdJsEJUOQiL39Ft64mfW7DzBdLrkDLhylGiY=@protonmail.com>
 <CAGm54UHGr+F-vnO69PLr0MN699BDEDsZiHYoX1WPmF1DZnQLVw@mail.gmail.com>
 <2FVxBtO4gLzVYqZqGL8XwOcI2a_r6x0CaPGmGozxe_VeNp3Y3y05vSntyZPvfn4EDRsHsLjWJnrVSzbeeVDKhPvLILmFKB3hw-MFaEvepAw=@protonmail.com>
 <CAGm54UFX9LPHArj-2q=w2pNtwgpkjZJE_0Dgd3_8cXB9z3L2vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lei,

I am still getting "undertermined system hardware failure" in ipmitool sel =
list. Do you have any platforms to refer to (in upstream)?

ipmitool sel also list only 10 logging entries and rotates after that. Is i=
t expected?

-Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, 2 April 2021 07:26, Lei Yu <yulei.sh@bytedance.com> wrote:

> On Thu, Apr 1, 2021 at 8:56 PM rgrs rgrs@protonmail.com wrote:
>
> > Hi Lei,
> > Is FRU EEPROM required for inventory to work? My board has unprogrammed=
 EEPROM.
> > I constructed the busctl command according as below, I still get =
=E2=80=9CUndetermined Hardware Failure=E2=80=9D. Please can you let me know=
 if my config YAML has any issues?
> >
> > busctl call "xyz.openbmc_project.Logging.IPMI" "/xyz/openbmc_project/Lo=
gging/IPMI" xyz.openbmc_project.Logging.IPMI IpmiSelAdd ssaybq "Sensor mess=
age" /xyz/openbmc_project/sensors/temperature/BMC_Temp 3 0x01 0xFF 0xFF tru=
e 0x20
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> You need to put /xyz/openbmc_project/sensors/temperature/BMC_Temp into
> sp3-ipmi-inventory-sensors.yaml as well to make ipmid to know how to
> map the dbus path to the sensor id in the sel.


