Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F643287B
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 22:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY7q25nt6z306K
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 07:32:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MIZ6kzSJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=MIZ6kzSJ; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY7pb44Dsz2yw3
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 07:32:21 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so391138wmq.2
 for <openbmc@lists.ozlabs.org>; Mon, 18 Oct 2021 13:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z5/+5P0FXj6AGUKxoXNoJhy7oNloSrN8KFhbeRvAk+k=;
 b=MIZ6kzSJsL5jtxUV1Zz2l9BOlAzxKhk/XLN9Epdq12b5b+zFnUCOcf8bqage28ld3k
 LkTzwieDck1phQfWCMuJKxEM2P6d2KGuQIsHADpkC7IMAQx7ANLkH19a74Aous64kYIt
 KVt67QwH1GDUyCKJqjMGuDxqE1uVbHnNQWajaUMCsY0IC5MuOonkZC33P7RGH7+kieqS
 WaB48LrrU4xTbvhmtlNrmkK6GmpxjpX0kZ6BEoSr/UbE3XzkyI8uRrgfhRs1n4Yz+6x8
 8QjO2wrrWw0eXyDjblAs6/y33m2oG0J89wwdJ0D48DaWJEkaxpXcUZ0Do+lWlBnu+/Gm
 i6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z5/+5P0FXj6AGUKxoXNoJhy7oNloSrN8KFhbeRvAk+k=;
 b=ly+vEFCbHxxrIAE1PSlCoQRPUvBphlIgy6iiESj+LaIX6O04CjIvtC3X4dvik/fZFk
 H1y1Kh/gr7iUo9emL9KlZal4a1U1FOKIKJ8hCvnYmoeIYNQFIvJQWrWrlJQ0pq2gdBzq
 7tcLKEkvUROTasAnvjzTL5xCjYeHDl9TNBuH4CGBmTpXO1K/Fk3iFtGyP1Npao3BIWtU
 k3dzEdueR36dfc7U1FuC0c100Tts/h+YhowyWc+hgR+TtI3+guZzQ7KIZF9e3sU4jqmA
 wdg1y98uT5rIgSwpVjk2xVobwYTZO/kwPoAyuTTrOvcwTEI9MWjBvfKt7C1ZzhLk92qn
 412w==
X-Gm-Message-State: AOAM533jscVL4LCGD3gp5nDQDK/6/LmK2Eap4WA5njScHT7F+p4boeP8
 jJRAP7zr9QGMb1/G0v1hxVguo4AxhXeQw1MHxnvEbQ==
X-Google-Smtp-Source: ABdhPJzTTZpqVs32+O7WAd7prTjZFdF9IWhkYqAUlikhQJUQvHoOLB+3Cs8/gW0ubfKoQQ9aRUNEks0Tzj7g9cWH+Uc=
X-Received: by 2002:a05:600c:1d1a:: with SMTP id
 l26mr1258308wms.98.1634589133779; 
 Mon, 18 Oct 2021 13:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <3d3276b0-6408-88bf-94b1-5060e0fbeee7@linux.vnet.ibm.com>
 <9424b5c3-729d-a9f2-353e-546de7700c5d@linux.vnet.ibm.com>
In-Reply-To: <9424b5c3-729d-a9f2-353e-546de7700c5d@linux.vnet.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 18 Oct 2021 13:32:02 -0700
Message-ID: <CAH2-KxCbH76ByDPD2sOjL1S_x-7pn1-dKn7S7-ukfUzcgNhMfA@mail.gmail.com>
Subject: Re: Control and uses of USB for BMC's own internal uses
To: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com,
 richard.marian.thomaiyar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 18, 2021 at 11:36 AM Bruce Mitchell
<bruce.mitchell@linux.vnet.ibm.com> wrote:
>
> On 10/17/2021 11:55, Bruce Mitchell wrote:
> > This thread BMC's USB means for the BMC's own uses
> > not for Host's uses nor to provide services to the
> > Host.  Thus, if I said "Disable the BMC's USB" that
> > would not impact the Host in any fashion.
> >
> > I need to be able to control the BMC's USB ports
> > to prevent BMC uses of USB Pen Drive updates and
> > independently prevent the BMC uses of USB serial
> > cable for UPS.  As well as re-enable those usages.
> >
> > Clearly in this Gerrit review the term Disabled was
> > not defined.  47180: bmc-usb: property to track usb state
> > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/47180
> >
> >
> > Also, since this is related to security of the BMC
> > my intent was to offer the users a clear way to
> > achieve the control of the BMC's USB ports without
> > the users needing to know any of the Servers' USB
> > topology.  I personally find complicated user options
> > for features adds risk to the system security.
> >
> > A recommendation I have receive is to use phosphor-state-manager.
> >

Some clarifying questions:
There are physically available USB A ports connected directly to the
BMC on IBM platforms?  Or are these traces within the board?
What are these direct bmc usb ports used for normally?

Considering that while the BMC use case is likely IBM specific, but
the idea of disabling a generic USB port isn't IBM specific, it seems
like we need a model for a USB port on dbus and relate it to the
various resources.  If and when a host interface wanted to implement a
similar feature, we'd be able to reuse it.

> > Also, from what I have observed this control of the
> > BMC's USB ports may be unique to my company (IBM).
> > And thus, an OEM solution may be best.

Keep in mind, you'll need a new schema and collection for these
things;  I'd recommend starting up a thread with DMTF about getting
those added.  Keep in mind, they already have the "port" schema, which
might fulfill the need, although it doesn't have a USB enumeration, so
it's possible that's an intentional omission.

https://github.com/openbmc/bmcweb/blob/master/OEM_SCHEMAS.md

> >
> > Does anyone else have a need or desire to control the
> > BMC's USB ports?
>
> Also suggested utilize https://github.com/openbmc/service-config-manager
> to disable/enable the service and make it like enable/disable SSH
> via Redfish via bmcweb
