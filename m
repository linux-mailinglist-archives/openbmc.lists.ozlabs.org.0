Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221C434D413
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 17:37:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8Gst10r8z30Ch
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 02:37:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=KFYkkPOl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.132;
 helo=mail-40132.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=KFYkkPOl; 
 dkim-atps=neutral
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Gsd0CNzz2yYk
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 02:37:05 +1100 (AEDT)
Date: Mon, 29 Mar 2021 15:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1617032219;
 bh=7zEGhqszuxcE3bDYYyFejS/smBXkpEFJ+YMWd4gZaxc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=KFYkkPOllbqCgyD/wo2Qi2cZD8PIEtzEFKMHXF9aWHaYtuvIBKtPP2NE0hSzMwLnu
 mB4xpVSXbEjtHmUlnUmNM4uLKCFwKWjgfzZdmbHusbZ4XmKnQBrVpT46XSbcIM63br
 ElVw3hJDBZg9Ofu1gZ2CBgXBPrxKopRGwj6/42N4=
To: Lei Yu <yulei.sh@bytedance.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: IPMI SEL Parsing
Message-ID: <axfftQgj4Du8QvWHD4CHEuPSLSJGtLZZTzpZplCpN1Mu63yr4Xm1RiZTuewl3CNqPUZ8mrmZdJsEJUOQiL39Ft64mfW7DzBdLrkDLhylGiY=@protonmail.com>
In-Reply-To: <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
 <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
 <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
 <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
 <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
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

Thanks, phosphor-sel-logger logs to phosphor-logging after enabling SEL_LOG=
GER_SEND_TO_LOGGING_SERVICE.

The APIs IpmiSelAdd() adds entry to SELs (tested using busctl)
But, "ipmitool sel list" doesn't print correctly. It prints "Undetermined H=
ardware Failure" for these entries.

Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Sunday, 28 March 2021 08:21, Lei Yu <yulei.sh@bytedance.com> wrote:

&gt; On Sat, Mar 27, 2021 at 12:08 AM Bills, Jason M
&gt; jason.m.bills@linux.intel.com wrote:
&gt;
&gt; &gt; On 3/26/2021 6:47 AM, Bruce Mitchell wrote:
&gt; &gt;
&gt; &gt; &gt; On 3/26/2021 01:04, rgrs wrote:
&gt; &gt; &gt;
&gt; &gt; &gt; &gt; Hi Matt, Bruce,
&gt; &gt; &gt; &gt; Yes, SELs for sensor events, threshold alarms.
&gt; &gt; &gt; &gt; When a sensor value is beyond the range of thresholds, =
we need to log
&gt; &gt; &gt; &gt; the SEL.
&gt; &gt; &gt; &gt; My understanding of OpenBMC implementation:
&gt; &gt; &gt; &gt; dbus-sensors/phosphor-hwmon logs d-bus errors (logging/=
entry).
&gt; &gt; &gt; &gt; Each entry object has a "callout", that is used by phos=
phor-ipmi-host
&gt; &gt; &gt; &gt; to convert dbus-error logs to IPMI SEL (16 bytes).
&gt; &gt; &gt; &gt; Please note that there are two locations that SEL entri=
es can be logged:
&gt; &gt;
&gt; &gt; 1.  D-Bus
&gt; &gt; 2.  Journal/syslog
&gt; &gt;
&gt; &gt; It looks like you are using D-Bus which I'm not familiar with.
&gt;
&gt; phosphor-sel-logger now supports either, by default it logs to syslog;
&gt; With SEL_LOGGER_SEND_TO_LOGGING_SERVICE enabled, it logs to
&gt; phosphor-logging which is on D-Bus.
&gt;
&gt; You could call the same APIs ("IpmiSelAdd", "IpmiSelAddOem") to create=
 SEL logs.
&gt;
&gt; ----------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------------------
&gt;
&gt; BRs,
&gt; Lei YU

</yulei.sh@bytedance.com>
