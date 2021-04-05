Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 703E635452F
	for <lists+openbmc@lfdr.de>; Mon,  5 Apr 2021 18:33:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDbnD3Qycz30Gl
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 02:33:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Xv9ZiA65;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Xv9ZiA65; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDbn05BXQz2ywx
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 02:33:07 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id p19so5976404wmq.1
 for <openbmc@lists.ozlabs.org>; Mon, 05 Apr 2021 09:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bD1EX+IFh4CcUCSM14oMlmYhzl5pt97bKMS9rs637+g=;
 b=Xv9ZiA65T0WuK/NDLKAColWdfB+1l+ZtCXqfpUNOTbE+SXJ5vucIMSeD0hs0TmowY0
 yylFBRxF2UkzNEuqKaZI51ApA46ewI2Kpk4VwTmhtzZ6MjG2/VQ65wWXsBMSE7q3T9ie
 2sBleG4AGepk9MrMb7lLtZXrPLQWdcOcPJNB/xH4EuHtlcnwIyCAweGd2PY/F3kkG4FM
 uZywTO29EXCj9Jxxte7cG17nxLxLIIubzTIzGB1c2brVU4nZX9bxb7BahMbYWSpNO5RT
 0cUPON8UxQQ5K6FsZlS8cUOMfrOelSnFQsEEJfk9Tr2Mis2K1J6mQTaKQ/IKJ9Ul7DUQ
 q1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bD1EX+IFh4CcUCSM14oMlmYhzl5pt97bKMS9rs637+g=;
 b=mSVXW9sZeQhjv7C+gzLX3nKK1Tp27SoDSyWBxGiqyD3d7dIC+9sErpLeBFHOkASmPW
 uTrq4nzD0rnziDrJIauOJu3Z+m1s6W1Zi45j+0igMKA4LznlZRMhgOhK98xqfkBEeoVJ
 B5Iav3RfZ2Jbz0jhYSbPF7sR6AdnLt1abvluIgtM/rc8toU6sO6zAfhhUM8Jo0iLPA9W
 /5JOskQuIr2qzMdu71oGShflQnXmjvlUeLcAabzdfqBUmny0BEFpVXXdEz1YRF940wSX
 cE2rNprfVReEPuY4GLQQSKNWe3lv+EOU5haF+BXPVu7Rep7nUYACPRjjyRCS43k4o5ZM
 MYaQ==
X-Gm-Message-State: AOAM531Us+/rtNzW83PZ9bWHvfbOnZ25wf69BBCasgB7bZeukZHv3PVs
 2YG2z+5O8te4DptRdNcJrE+p8hpXczRLF5MTTgzqJPsgxs/oCQ==
X-Google-Smtp-Source: ABdhPJxbtI6Cks4XbA7DdG+I5xc4oR+FZhjVTgVdwr7L9id8sm+RcXV3m8u9mZ6EIOPyCXPxLHcT/cT+vwU1VqCXXPc=
X-Received: by 2002:a1c:f618:: with SMTP id w24mr25800415wmc.93.1617640379642; 
 Mon, 05 Apr 2021 09:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <7252DA19-35E9-4A14-A7DF-7BBC54A312C2@amperemail.onmicrosoft.com>
In-Reply-To: <7252DA19-35E9-4A14-A7DF-7BBC54A312C2@amperemail.onmicrosoft.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 5 Apr 2021 09:32:48 -0700
Message-ID: <CAH2-KxDCK4P5jsPxCfa3cS962SOoDfoeM0XVpAqVRjE_VGiJ_Q@mail.gmail.com>
Subject: Re: The common solution to support bind/unbind the hwmon driver base
 on the host state.
To: Thu Nguyen OS <thu@os.amperecomputing.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 7:14 PM Thu Nguyen OS
<thu@os.amperecomputing.com> wrote:
>
> Hi All,
>
>
>
> Currently, In Mtjade platform of Ampere, we have SMPro mdf drivers (SMPro=
 hwmon, SMPro errmon, SMPro misc driver).
>
> The drivers will be loaded by kernel when the BMC boot up. But they are o=
nly binded when the host is already On.

Assuming you're using dbus-sensors, you'd normally just write an app
that's capable of unloading the modules and watching the power states.
Experience seems to show that very few true "rules" exist with regards
to this kind of enabling/disabling, and as hardware gets used more,
more odd error handling seems to pop up, so as a matter of design we
pushed this into the individual sensor daemons early on to try to keep
it somewhat sane to manage.  dbus-sensors somewhat takes the position
that once all hardware is debugged, there is no "common" solution to
reset, and we've proven that on several occasions with other simple
sensors.

Overall, I'd recommend just writing an AMDCpuSensor application, as I
suspect this is the first of many special cases that the processor
will need.

>
> They are also unbinded when the host is Off.
>
> To support binding/unbinding the SMPro drivesr, we have one service name =
driver-binder.
>
> When the Dbus property CurrentHostState of service xyz.openbmc_project.St=
ate.Host changes to =E2=80=9Cnot Off=E2=80=9D, we will bind the drivers.
> When the Dbus property RequestedHostTransition of service xyz.openbmc_pro=
ject.State.Host OR Dbus property RequestedPowerTransition of xyz.openbmc_pr=
oject.State.Chassis
>
> change to Off, we will unbind the drivers.
>
>
>
> The driver-binder is working as expected, it have the configuration file =
to configure which drivers will be binded/unbinded.
>
> But that is our solution.
>
>
>
> Do we have any common solution to do that job?
>
>
>
> Regards.
>
> Thu Nguyen.
>
>
>
>
