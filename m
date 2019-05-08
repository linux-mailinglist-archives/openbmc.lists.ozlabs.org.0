Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E92917E30
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:37:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zhwD17S1zDqH6
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 02:37:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hAP1RyxO"; 
 dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zhvG0yQZzDqGq
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 02:36:41 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id n19so2224725pfa.1
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ymhoy2RdmPFpj+ZoV4m1npWUf2YxXk0unw+w/QuOwoI=;
 b=hAP1RyxOPFRre44sIB2r8K+diBsnhbgeu1cNrSzQdfMEIn5t5R2rGatjC81JxTkT3r
 LTu9dYzKTBdcnn69i2BThAziFCg+EIj9A1tL4BG9Fw5ZQHFsky4e2Tm+peOIV33irkjc
 vWSlDGaEHnSA5Dm5uARgM5uOrMJyvSjtx0DQxgLjf2GoSrFgDxiyqeFyvztkQHuCTAvw
 C8k79Oqdp+o4T4svorS6w718GniuaDIOLbHEalfTM0zX51FH8kbcxxKWueMQKbWp0onk
 5eRyeAFSs5kd56jIHa3bif91/lR8LndLeKZxszPAwt7gsYg55VBwrEeZuc5NRuoHOa1U
 O2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ymhoy2RdmPFpj+ZoV4m1npWUf2YxXk0unw+w/QuOwoI=;
 b=Ryj2wJ4A8/9yO1ftR3nzstTEWo1i8pVRUlGtdKZYNqpR5r6iODjSGpJi5M4zs045lz
 u2YGaxaZiEQplO0+83af/tf9nfvz3zbNdp3UezTkbizRxFy6SpRM2XuU0qHm/WnZA6eR
 /XZOEYQPo6Vx5tDitK0NRC3q0/hlNfnHK5ovigCXAJM/KvD0iYtYQbLn+rBmq8X2yjw0
 U1nc5LceA24PAJpWpXEq8sDHwskAY+PXv5aQkjFZh6XoPIelpcjEWfaKRFjTCkMn0tZw
 gNXELA2wSXhja0TXDa4YvzzubWMk0KinnYV9o203UFz0gA91KHptCwARxo/sve5mpC5H
 7LoA==
X-Gm-Message-State: APjAAAWUrQxxDljiPhu/SngmA2GbsOl3Y6ilqVtGumLrSZg2eI6HAvAN
 ghf7h8zWkFcOzPC4BMUlN9uhr1Lgm81NleCvfA/LYg==
X-Google-Smtp-Source: APXvYqy/DEfK5Y4/fOQln9rumZlbMF+p+258iWBRM0v/zlW5Fe13bhD8v5jQhX/95GnCbJ8jYLbsrV/i35ODInxjoSk=
X-Received: by 2002:a62:864a:: with SMTP id x71mr51543435pfd.228.1557333395539; 
 Wed, 08 May 2019 09:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <28581f1979a946fdb2f53013bab4661c@quantatw.com>
In-Reply-To: <28581f1979a946fdb2f53013bab4661c@quantatw.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 8 May 2019 09:36:24 -0700
Message-ID: <CAO=notyeTBr3BSKrhxDP3uW3s0kma6cek-Dz-33tczKU0pL-Mg@mail.gmail.com>
Subject: Re: about phosphor pid control package
To: =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 8, 2019 at 6:46 AM Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89) <Wi=
ll.Liang@quantatw.com> wrote:
>
> Hi,
>
> I have a question about getFailSafeMode().
>
> Currently, only sensors that are defined as "temp" types can be checked f=
or failure.
> I did not find any "fan" type sensors to check if the fan has failed.
> Our project need to check the fan fail so  I want to add another "fan" se=
nsor type to check.



>
> Can I add one more "for loop" to check the fan sensor in updateSensors() =
function in zone.cpp??
>
> for (const auto& t : _thermalInputs)
> {
>     ........
> }
> for (const auto& t : _fanInputs)
> {
>     ........
> }

updateSensors is deliberately not talking to the fans because they're
not considered inputs into the thermal config, they're controlled
outputs -- the question I have is, what would you like to do if a fan
isn't responding?  failsafemode drives the fans to a specific
pre-defined speed to keep it from thermal issues.  If a fan is failing
to respond, one can't drive it -- perhaps one can drive the others to
some failsafe?

If so, one needs to update the failsafe for a zone outside of the
thermal sensors, but rather where the fans are checked (void
PIDZone::updateFanTelemetry(void))

>
> BRs,
> Will
