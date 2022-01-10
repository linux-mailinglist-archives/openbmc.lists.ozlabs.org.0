Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEFD48A3F6
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 00:50:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXrDk2c3Yz2yxm
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 10:50:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NxJ2DRyy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=NxJ2DRyy; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXrDK3jHXz2xrD
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 10:50:25 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id w26so4004720wmi.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 15:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cZ2gbpwR0nHfzH4HQPS5ditzENBpmnAGu57ABysOBh4=;
 b=NxJ2DRyyTyXw117NdIuMob2MXN0+zrgrs/G2rU3s9x5i3XeGWxrbwCrSZ6OtUp35lr
 Y4uX5pCDb44rsC0nhQfot6aX1oNTAMFp6ytxGP5NmObXfwNClQqI8q45IqQsI/fgHnfT
 i+RPh0Y3uFd27Xv5jNAnrlnyO7HP8/OVZULQYSUUm574zuP+oWk5LPOiVMkoK1sTeAJi
 5/+5hx5dq6ZesIdvANU9KXr8ts1+SSMGsG0vFxC+A8RP6/+tvQzhWbrNsBYmcCJJCztB
 E5OtXXyyvvvQihE+rU3+kdhdXKgdCotlj+CyazkOpXLmV29kOS9vzLHKJUwR4B+2d+cL
 S1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cZ2gbpwR0nHfzH4HQPS5ditzENBpmnAGu57ABysOBh4=;
 b=xGgtpkXKe7vLqsd2MgxEyU2k1QHl5B2aiehWeyUTYWRbpzO4qjl9rKgVNDGYb6vpXv
 CM40acrd8+YgsUNVaHzYtgwt9SYi8V17/u55Cu6FRFsJ4IymV1yYk76WS9P4fvxy8buP
 vN80iOAdBcv/rr5lkBy0ZeGQYYeNk1686pIfrrYNQ3p2efQXHFUcKHXqMbNXlr851c1P
 Dj1RXxDnqoHQyWhXQ1KSVrc6d6yhWJh5WGavOSs40gzndvFLJK9VVEjkOMv/qQxNDSTT
 BFbO9P6VNV5RRfxvY8zAhzS1k6cebMXGjwLvui6K2DhXfs+NrD5NI4V752LFujiVTCk9
 dQZQ==
X-Gm-Message-State: AOAM532xeZk5ZvRrZd5nDF/JEP92hPGy7ISNg/3lMXYpHo3PiJXxGmrd
 PatwhSDhnFGK0uOf2Ib0pVW4sOKGCoHtABdqgspNyA==
X-Google-Smtp-Source: ABdhPJzCeX/dwQ7LIWWfrkfHU8tfXrBikQQoWSatqpR0QNeL0sJSkaBJIY6lrIOI9LcPUwU0K8Zg/geMs5AZKuhWXvQ=
X-Received: by 2002:a1c:f70f:: with SMTP id v15mr110704wmh.117.1641858617936; 
 Mon, 10 Jan 2022 15:50:17 -0800 (PST)
MIME-Version: 1.0
References: <4CA1C696-1C4A-4FC9-A7F8-9AE1B892227D@gmail.com>
In-Reply-To: <4CA1C696-1C4A-4FC9-A7F8-9AE1B892227D@gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 10 Jan 2022 15:50:06 -0800
Message-ID: <CAH2-KxBAxA5SBSw=8NSNKz-_V8=H9qqCLh3ap_f7FEuaa5yx4g@mail.gmail.com>
Subject: Re: Query Sensor
To: Mike Jones <proclivis@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 10, 2022 at 3:47 PM Mike Jones <proclivis@gmail.com> wrote:
>
> Hi,
>
> I could not find an example of a sensor query in the docs. I assume something like this:
>
> dbus-send --system --print-reply \
>
> --dest=xyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>
> /xyz/openbmc_project/sensors/temperature/lm75temp
>
> xyz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor.Value \
>
> double:
>

I don't have an example offhand, but the interface you're looking for
in the bolded area is
org.freedesktop.DBus.Properties.Get

Stack overflow for essentially the same question with an example:
https://stackoverflow.com/questions/48648952/set-get-property-using-dbus-send

>
> With the bold interface replaced with something correct.
>
> Can some one give me an example, and a url about how to query properties?
>
> Mike
>
> Sent from my iPad
