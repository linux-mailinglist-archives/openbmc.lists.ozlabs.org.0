Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE57434A2EA
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 09:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6DzH5cKgz3bvQ
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 19:04:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=iWNKW5Vt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.130;
 helo=mail-40130.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=iWNKW5Vt; 
 dkim-atps=neutral
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6Dz14pDZz2yxb
 for <openbmc@lists.ozlabs.org>; Fri, 26 Mar 2021 19:04:42 +1100 (AEDT)
Date: Fri, 26 Mar 2021 08:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1616745876;
 bh=SkNcC6YuwFxtQkXzM5y1mLpgBRpeS4Dkfb1X7C5iBNQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=iWNKW5VtzL2PJpZRt5iIPSIoarQywLd55gTF09h3TR4iZpDX40wBYTmZWEHCqzz7j
 OiNiS+S4ApcQJah82ecqZDPKA21kWnX0Ekz7t3GfUfTTvWLBtMFsCmbo/iczh3+FhR
 +z00uggvik8/O5zjt0A43n+YlBK/hul7SsAbROCw=
To: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: IPMI SEL Parsing
Message-ID: <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
In-Reply-To: <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
 <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Matt, Bruce,

Yes, SELs for sensor events, threshold alarms.
When a sensor value is beyond the range of thresholds, we need to log the S=
EL.

My understanding of OpenBMC implementation:
dbus-sensors/phosphor-hwmon logs d-bus errors (logging/entry).
Each entry object has a "callout", that is used by phosphor-ipmi-host to co=
nvert dbus-error logs to IPMI SEL (16 bytes).


The issue I am facing:
1. SEL creation: when I change sensor thresholds, I don't see a log generat=
ed for that sensor.
(phosphor-sel-logger has the capability to monitor threshold events and log=
 SEL. But phosphor-hwmon doesn't generate the signal that phosphor-sel-logg=
er is looking for.)

2. Printing SELs: when I manually add logging/entry using busctl, ipmitool =
prints "Undetermined Hardware Failure".
(logging/entry/<number> is not having callout association to sensor/FRU)

Where/what should I configure so that SELs are generated and parsed properl=
y?
Different pieces of IPMI functionality is scattered among various packages,=
 I'm not able to stitch them together.

Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, 26 March 2021 03:59, Bruce Mitchell <bruce.mitchell@linux.vnet.i=
bm.com> wrote:

> On 3/25/2021 15:16, Matt Spinler wrote:
>
> > On 3/25/2021 7:49 AM, rgrs wrote:
> >
> > > Hi All, "ipmitool sel list" always shows the records as "Undetermined
> > > system hardware failure". Logging/entry doesn't have the proper
> > > association. How do I add association for log entries and respective
> > > FRUs? Which package creates Logging/entry Hi All,
> > > "ipmitool sel list" always shows the records as "Undetermined system
> > > hardware failure".
> > > Logging/entry doesn't have the proper association. How do I add
> > > association for log entries and respective FRUs?
> > > Which package creates Logging/entry object on sensor events? I don't
> > > see any call to SelAdd in phosphor-hwmon.
> >
> > What are the SELs for - threshold alarms, or some other sort of failure=
s?
> >
> > > Thanks,
> > > Raj
>
> My assumption is that not everyone in the OpenBMC community has
> extensive use with IPMI, thus this just to share information.
> Sorry to those who already know this information and have been
> using it for years.
>
> This is share background as to the history or background of the
> IPMI SEL; probably more information than you need. But I would
> rather share 10% too much than be short by 0.1%.
>
> From Intelligent Platform Management Interface Specification Second
> Generation v2.0
> Document Revision 1.1 October 1, 2013
>
> 31. System Event Log (SEL) Commands:
>
> The System Event Log is a non-volatile repository for system events and
> certain system configuration information. The device that fields the
> commands to access the SEL is referred to as the System Event Log Device
> or SEL Device.
>
> Event Message information is normally written into the SEL after being
> received by the Event Receiver functionality in the Event Receiver Device=
.
>
> The SEL Device commands are structured in such a way that the SEL Device
> could actually be separated from the Event Receiver Device. In which
> case it would be the responsibility of the Event Receiver Device to send
> the appropriate =E2=80=98Add SEL Entry=E2=80=99 message directly to the S=
EL Device, or
> to pass the equivalent request through an intermediary.
>
> SEL Entries have a unique =E2=80=98Record ID=E2=80=99 field. This field i=
s used for
> retrieving log entries from the SEL. SEL reading can be done in a
> =E2=80=98random access=E2=80=99 manner. That is, SEL Entries can be read =
in any order
> assuming that the Record ID is known.
>
> SEL Record IDs 0000h and FFFFh are reserved for functional use and are
> not legal ID values. Record IDs are handles. They are not required to be
> sequential or consecutive. Applications should not assume that SEL
> Record IDs will follow any particular numeric ordering.
>
> SEL Records are kept as an ordered list. That is, appending and deleting
> individual entries does not change the access order of entries that
> precede or follow the point of addition or deletion.
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------
>
> Bruce


