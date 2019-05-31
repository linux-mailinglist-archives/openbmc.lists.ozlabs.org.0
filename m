Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805D305D9
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 02:36:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FQVx5JW9zDqV5
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 10:36:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="P9C058UG"; 
 dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FQV132gczDqS4
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 10:35:53 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id 14so9415927qtf.0
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 17:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LV0rreeRzznDSFPitu6IRcA1AlCHF4cq7HLGwa3ZWC4=;
 b=P9C058UGZl8eZKq2rVcWk8eq9lPglLVKwJh9gZnjbTwrt3ysCacv2Rk4TOfuNSbESj
 E7is63ErlPezCcg44ckV1Gg3AsVPL2qzu2cP41BJyux86moiglwow07HPCUA6vJfWW6k
 FPEAWBlCsG4jY4IJIgQrMWyStAzyppLOZfzu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LV0rreeRzznDSFPitu6IRcA1AlCHF4cq7HLGwa3ZWC4=;
 b=Au50V6uSx/cusoPhxSjYMCXmjYE40Ah2gxFz94THrUbwZeErpamYAmhWTL72Ze01fR
 tnQmvFvR0X1/44Cu92LemISH6vFiVGhLanHYbnRnc3qZcMMdBr057vqtt9+nXlY01Yfb
 ogF0zi2g56+YBxRDczL8ILsLRK7SnVuEJMyHe/m9uRoTvfQr78FYlVaHMuiM0dshr2PB
 7WHWB+5OEQckZ3o0Z78v46XPUnRtVv3C4rieinq77+nZvJcye7M/mRo6bg4xJGe8AOrz
 XyQXNbprX9ooNZs2uEdyICwOugrkPFFORNKDBXE6wI83BSVZMgJ8uNcufAqSsJR22ufr
 cyxw==
X-Gm-Message-State: APjAAAXxpe5s2sKhyaJ9o3IY81jDCJ8Sprn4kiyeOV9joSdu2XyUvT1y
 y2rhLgq/QPiTQDGIdkhNz2E6oIQWYmdFzakrJqU=
X-Google-Smtp-Source: APXvYqyO8UHjmVma4JfClgYLuGH1ph2atzoAKxFgVTsSQ49QDDI7ztVGzeh9HgRPX5/xx2pcoyjt34xZeG/tjpAGjtg=
X-Received: by 2002:a0c:fd8f:: with SMTP id p15mr2361746qvr.172.1559262949717; 
 Thu, 30 May 2019 17:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190528183802.GH15959@mauery.jf.intel.com>
In-Reply-To: <20190528183802.GH15959@mauery.jf.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 31 May 2019 00:35:38 +0000
Message-ID: <CACPK8XfyYfGXifFPFuAtH0vxf9bL8AE-u0nrSP5hYyVXYWkE-Q@mail.gmail.com>
Subject: Re: U-Boot environment management from userspace
To: Vernon Mauery <vernon.mauery@linux.intel.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 28 May 2019 at 18:41, Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
>
> Reading U-Boot environment variables from userspace is not difficult,
> but to do it in a standard way, (fw_printenv), it requires a fork and
> exec.

I came across libubootenv the other day. Whatever solution you come up
with to manage the variables could use this library. It's in
tools/env/ in the u-boot sources.

I would caution against the u-boot environment being used as a general
purpose settings store. We should use it for configuring u-boot, and
keep other settings somewhere else in the system.

Cheers,

Joel
