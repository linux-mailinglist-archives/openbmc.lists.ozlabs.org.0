Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D1C3D64D9
	for <lists+openbmc@lfdr.de>; Mon, 26 Jul 2021 18:52:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYQvG2VFHz306s
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 02:52:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dpYpXPih;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dpYpXPih; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYQtz4DGnz303M
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 02:51:54 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id a26so16563366lfr.11
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8hc1TYlfOdRan3sOM5L0MtctJmt6xD/JMuDQ45ElqgY=;
 b=dpYpXPihULze+vALtbeXKuO4HjyhX0yd5GJWNiU9o7TOMVbY3HzD2HqAm89KfySUUx
 RpNVg7hnkOBnRbD6ZFZqhTmB5d395ba44eAlJ0qRmSQs68FUAu9yFI8KdqvknhJ9yAae
 IMWjRMM3JsmNGiYJYknPhVJSoi77nAO1dlbOKP1Ia3P+d+HHKLHofJ7b3OZglNZmF/Jv
 f8XgRBtWAFK4oNveQuJDw2SwuGXt2NYkwObHbG4v6CC+ExVcer0vZZGpwZCXIH/7dN/m
 lnP2scPbUufmkNstnG/GcIrQy4mR1Q55RD58pBs531SZ54SQBxUzgrPcmx4jDu8E3/wy
 4dCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8hc1TYlfOdRan3sOM5L0MtctJmt6xD/JMuDQ45ElqgY=;
 b=QFXThJt97JT97B2c9qek7ySAcvhK3kH2H/rwNqVuloIAJJwJfR+GQmCScTpmz4TMZ1
 px789CYKdisttMCPLOVoTn/rrsstxStYMRtYdPdiLdguP/w+QUSrwQA+4gefg676L1Hk
 dXj6BzMe4GpcNJWfBW2CObjfkZAdg5y1g/t/be0L72SBFsc/+AqIOkvkZU3kIlwKijZh
 ASM0FaY2uVyfhqMdgqWkIBerjYIoZ4zS7mUZd3xPhpIOFzlY3dIyIzrJN3/zyyGt8p/e
 mUq4Sh6DiHrAmv2ptghwDDRnC+QdZ4GFYtQ6RJP0dCUU6cxQqGSRFPh5/W+HnZrtoRw6
 PT7A==
X-Gm-Message-State: AOAM531+chW/6A0B4VS6MDhlmO3y0AjZwDWuwjODDuUZRTXwCZbcevBV
 /x2yby991/+/40x6pfVGNVQ=
X-Google-Smtp-Source: ABdhPJwJ6mOCkSzHnWWL3YCvw8gNJyjCj2Ba0fIlmkMSKyGGyB7JJ0q/oA3nN0Hade4MysgDKheMzg==
X-Received: by 2002:ac2:547b:: with SMTP id e27mr14155931lfn.200.1627318308963; 
 Mon, 26 Jul 2021 09:51:48 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id f1sm50623lfs.44.2021.07.26.09.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 09:51:48 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 16QGpjq6004839; Mon, 26 Jul 2021 19:51:46 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 16QGpinX004838;
 Mon, 26 Jul 2021 19:51:44 +0300
Date: Mon, 26 Jul 2021 19:51:44 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: Re: Serial Over Lan (SOL) no login prompt on Linux IRQ mode
Message-ID: <20210726165144.GN875@home.paul.comp>
References: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
 <000001d5bc87$f6fe3780$e4faa680$@linux.intel.com>
 <CAE33tLHvjuwFwCsSdohvYPHgs-f-8sDWMsNdAhzgQbs3=o7_tQ@mail.gmail.com>
 <429111627309901@mail.yandex-team.ru>
 <20210726145246.GL875@home.paul.comp>
 <435311627317580@mail.yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <435311627317580@mail.yandex-team.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 26, 2021 at 07:42:22PM +0300, Konstantin Klubnichkin wrote:
> Thank you for this patch, I've tried this (UART1 <->UART3 routing), but this
> just doesn't work on my hardware, even POST is not available.
> Probably only way is to ask Aspeedtech support to clarify this.

What's your hardware? On our board we have LPC connection between
AST2500 and Lewisburg PCH. If your UEFI is configuring SIRQ in
Continuous mode (should be default I guess) then you might also want
this (even though VUART wouldn't be used with the configuration used
by the patch I've sent earlier):

+diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+index fffdb2b67c08..77233d360142 100644
+--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
++++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+@@ -157,6 +157,7 @@
+ 
+ &vuart {
+       // VUART Host Console
++      aspeed,sirq-polarity-sense = <&syscon 0x70 25>;
+       status = "okay";
+ };
+ 

I suggest you try these two patches verbatim, this whole remapping
business is tricky so probably you've missed something in your earlier
tests.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
