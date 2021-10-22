Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3B43703F
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 04:59:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb8Fx5XpHz3c7Q
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 13:59:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pc7z+fd3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pc7z+fd3; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb8FX3vVgz2xMw
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 13:59:12 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13AEB61425
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 02:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634871550;
 bh=Yx7hUNcdU7Pjbr2DHTM7OpeDrskZ2MkKxAaVsic7w4U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Pc7z+fd3SrnIL/SVNOWqwWqOMHf/0QnE8nHMctfUrWMgSVdbUGeqb10ba6blwWjV9
 MO7ki/IdYYsvzU0S2vIX9RSXhfZdQ2o2JkdfFBCzexJgA4tQ/LCmjT3sxKNr9LNKIg
 75oP35US8tRhAenEN5yqeI5NgGIWbeb6wqzZ95zfbvsFLfC2wop2kneVA1QOrNoLXt
 TZie1aN8UnDaDrx2yrW75icCpwSgOcMIhBin/kkeCD9jntRbthqffZG8Kub92a/jdy
 L+iAagvN/npFTN7czEuo8795ahqTVb3DQTy6fKiUgN4qUfFcFiKabE3+EgRf8R7lBY
 Kyby4gAH+WlDw==
Received: by mail-lj1-f175.google.com with SMTP id q16so496855ljg.3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 19:59:09 -0700 (PDT)
X-Gm-Message-State: AOAM531uVoP7byi+HzG/TzUdc1n2ZugQOpu1VLe8QIGoZZRk5sc7EuYX
 m+xhSt1W1ZmKFVY4TCVWeQ+DAX922Gl0nk5zaA==
X-Google-Smtp-Source: ABdhPJyKcuSchhqdUFBGWZomm/WCOyI5oKt9pUJYKJhlLAGPFhFZwlXz7BibhttikR3f4Am4xBWs+ZsDT6ZpXnVBe4Y=
X-Received: by 2002:a05:6402:643:: with SMTP id
 u3mr4233174edx.164.1634871537946; 
 Thu, 21 Oct 2021 19:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211022020032.26980-1-zev@bewilderbeest.net>
In-Reply-To: <20211022020032.26980-1-zev@bewilderbeest.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 21 Oct 2021 21:58:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLmonXoV2qJ4zY1wfDTRuQAYQuymXEB2kTpUmkKWwPGjg@mail.gmail.com>
Message-ID: <CAL_JsqLmonXoV2qJ4zY1wfDTRuQAYQuymXEB2kTpUmkKWwPGjg@mail.gmail.com>
Subject: Re: [PATCH 0/5] driver core, of: support for reserved devices
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Frank Rowand <frowand.list@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 21, 2021 at 9:00 PM Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello all,
>
> This series is another incarnation of a couple other patchsets I've
> posted recently [0, 1], but again different enough in overall
> structure that I'm not sure it's exactly a v2 (or v3).
>
> As compared to [1], it abandons the writable binary sysfs files and at
> Frank's suggestion returns to an approach more akin to [0], though
> without any driver-specific (aspeed-smc) changes, which I figure might
> as well be done later in a separate series once appropriate
> infrastructure is in place.

I skimmed this, and overall I like the approach.

> The basic idea is to implement support for a status property value
> that's documented in the DT spec [2], but thus far not used at all in
> the kernel (or anywhere else I'm aware of): "reserved".  According to
> the spec (section 2.3.4, Table 2.4), this status:
>
>   Indicates that the device is operational, but should not be used.
>   Typically this is used for devices that are controlled by another
>   software component, such as platform firmware.
>
> With these changes, devices marked as reserved are (at least in some
> cases, more on this later) instantiated, but will not have drivers
> bound to them unless and until userspace explicitly requests it by
> writing the device's name to the driver's sysfs 'bind' file.  This
> enables appropriate handling of hardware arrangements that can arise
> in contexts like OpenBMC, where a device may be shared with another
> external controller not under the kernel's control (for example, the
> flash chip storing the host CPU's firmware, shared by the BMC and the
> host CPU and exclusively under the control of the latter by default).
> Such a device can be marked as reserved so that the kernel refrains
> from touching it until appropriate preparatory steps have been taken
> (e.g. BMC userspace coordinating with the host CPU to arbitrate which
> processor has control of the firmware flash).
>
> Patches 1-3 provide some basic plumbing for checking the "reserved"
> status of a device, patch 4 is the main driver-core change, and patch
> 5 tweaks the OF platform code to not skip reserved devices so that
> they can actually be instantiated.
>
> One shortcoming of this series is that it doesn't automatically apply
> universally across all busses and drivers -- patch 5 enables support
> for platform devices, but similar changes would be required for
> support in other busses (e.g. in of_register_spi_devices(),
> of_i2c_register_devices(), etc.) and drivers that instantiate DT
> devices.  Since at present a "reserved" status is treated as
> equivalent to "disabled" and this series preserves that status quo in
> those cases I'd hope this wouldn't be considered a deal-breaker, but
> a thing to be aware of at least.
>
> Greg: I know on [1] you had commented nack-ing the addition of boolean
> function parameters; patch 4 adds a flags mask instead in an analogous
> situation.  I'm not certain how much of an improvement you'd consider
> that (hopefully at least slightly better, in that the arguments passed
> at the call site are more self-explanatory); if that's still
> unsatisfactory I'd welcome any suggested alternatives.

Can't we add a flag bit in struct device to reflect manual binding?
bind will set it and unbind clears it.

Rob
